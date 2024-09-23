@implementation NSURL(MD5)

- (BOOL)MD5:()MD5
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  NSObject *v12;
  id v14;
  CC_MD5_CTX c;
  id v16;

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", a1, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    memset(&c, 0, sizeof(c));
    v6 = CC_MD5_Init(&c);
    v7 = 0;
    while (1)
    {
      v8 = (void *)MEMORY[0x219A0BFAC](v6);
      v14 = 0;
      objc_msgSend(v4, "readDataUpToLength:error:", 0x10000, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;

      v11 = v10 == 0;
      if (v10)
        break;
      v7 = objc_retainAutorelease(v9);
      CC_MD5_Update(&c, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      objc_autoreleasePoolPop(v8);
      v6 = objc_msgSend(v7, "length");
      if (!v6)
      {
        CC_MD5_Final(a3, &c);
        goto LABEL_10;
      }
    }
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[NSURL(MD5) MD5:].cold.1((uint64_t)v4, (uint64_t)v10, v12);

    objc_autoreleasePoolPop(v8);
LABEL_10:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)MD5:()MD5 .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_2173D9000, log, OS_LOG_TYPE_FAULT, "-[NSData MD5:] call to readDataUpToLength: %@ failed with: %@", (uint8_t *)&v3, 0x16u);
}

@end
