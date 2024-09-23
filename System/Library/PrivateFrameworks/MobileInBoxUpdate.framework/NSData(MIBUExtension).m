@implementation NSData(MIBUExtension)

+ (id)generateRandomBytesOfSize:()MIBUExtension
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  uint32_t v9;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 4)
  {
    v5 = a3 >> 2;
    v6 = 1;
    do
    {
      v9 = 0;
      v9 = arc4random();
      objc_msgSend(v4, "appendBytes:length:", &v9, 4);
    }
    while (v5 > v6++);
  }
  return v4;
}

+ (id)dataWithHexString:()MIBUExtension
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _BYTE *v11;
  _BYTE *v12;
  unsigned int v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char __str[3];

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (v4 && (v4 & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCEC8]);
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    v8 = (void *)objc_msgSend(v6, "initWithLength:", v7 >> 1);
    v9 = v8;
    if (v8)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = (_BYTE *)objc_msgSend(v10, "mutableBytes");
      v12 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      __str[2] = 0;
      v13 = *v12;
      if (!*v12)
      {
LABEL_14:
        v17 = (void *)objc_msgSend(v10, "copy");
LABEL_25:

        goto LABEL_26;
      }
      v14 = v12 + 2;
      v15 = MEMORY[0x24BDAC740];
      while (1)
      {
        __str[0] = v13;
        v16 = *(v14 - 1);
        __str[1] = *(v14 - 1);
        if ((v13 & 0x80) != 0)
          break;
        v17 = 0;
        if ((*(_DWORD *)(v15 + 4 * v13 + 60) & 0x10000) == 0 || (char)v16 < 0)
          goto LABEL_25;
        if ((*(_DWORD *)(v15 + 4 * v16 + 60) & 0x10000) == 0)
          break;
        *v11++ = strtoul(__str, 0, 16);
        v13 = *v14;
        v14 += 2;
        if (!v13)
          goto LABEL_14;
      }
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_4_1);
      v19 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        +[NSData(MIBUExtension) dataWithHexString:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    v17 = 0;
    goto LABEL_25;
  }
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_1);
  v18 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    +[NSData(MIBUExtension) dataWithHexString:].cold.2((uint64_t)v3, v5, v18);
  v17 = 0;
LABEL_26:

  return v17;
}

+ (void)dataWithHexString:()MIBUExtension .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Memory allocation request failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)dataWithHexString:()MIBUExtension .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_222C3F000, log, OS_LOG_TYPE_ERROR, "String %{public}@ is of invalid length=%ld", (uint8_t *)&v3, 0x16u);
}

@end
