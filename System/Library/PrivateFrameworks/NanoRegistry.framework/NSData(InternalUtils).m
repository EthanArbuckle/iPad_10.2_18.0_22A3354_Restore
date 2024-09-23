@implementation NSData(InternalUtils)

- (uint64_t)matchesDataAtFilePath:()InternalUtils
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "fileExistsAtPath:", v4),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    do
    {
      v9 = (void *)MEMORY[0x1A1B01C40]();
      v10 = v8;
      objc_msgSend(v7, "seekToOffset:error:", v8, 0);
      objc_msgSend(v7, "readDataOfLength:", 1024);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(a1, "length");
      v13 = 1024;
      if (v12 - (unint64_t)v8 <= 0x400)
        v13 = objc_msgSend(a1, "length") - v8;
      objc_msgSend(a1, "subdataWithRange:", v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "length");
      v16 = objc_msgSend(v11, "isEqualToData:", v14);

      objc_autoreleasePoolPop(v9);
      if (!(_DWORD)v16)
        break;
      v8 = v15 + v10;
    }
    while (objc_msgSend(a1, "length") > (unint64_t)v8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
