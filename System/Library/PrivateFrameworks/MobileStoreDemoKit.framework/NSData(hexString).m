@implementation NSData(hexString)

+ (id)dataWithHexString:()hexString
{
  id v3;
  _BYTE *v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  char __str[2];
  char v14;

  v3 = a3;
  v14 = 0;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NSData(hexString) dataWithHexString:].cold.3((uint64_t)v3, v10, v11);
    goto LABEL_11;
  }
  v4 = malloc_type_malloc((unint64_t)objc_msgSend(v3, "length") >> 1, 0x9F7E2380uLL);
  if (!v4)
  {
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NSData(hexString) dataWithHexString:].cold.1(v3, v10);
LABEL_11:

    v8 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    v7 = v5;
    while (1)
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v6);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v6 + 1);
      v12 = 0;
      *v7 = strtol(__str, &v12, 16);
      if (v12 != &v14)
        break;
      ++v7;
      v6 += 2;
      if (v6 >= objc_msgSend(v3, "length"))
        goto LABEL_7;
    }
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NSData(hexString) dataWithHexString:].cold.2((uint64_t)v3, v6, v10);
    goto LABEL_11;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v8;
}

- (id)hexStringRepresentation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;

  v2 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02lx"), v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

+ (void)dataWithHexString:()hexString .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = (unint64_t)objc_msgSend(a1, "length") >> 1;
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, v3, "Unable to malloc bytes of size: %lu", (uint8_t *)&v4);
}

+ (void)dataWithHexString:()hexString .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "String should be all hex digits: %@ (bad digit around %ld)", (uint8_t *)&v3, 0x16u);
}

+ (void)dataWithHexString:()hexString .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, a3, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v3);
}

@end
