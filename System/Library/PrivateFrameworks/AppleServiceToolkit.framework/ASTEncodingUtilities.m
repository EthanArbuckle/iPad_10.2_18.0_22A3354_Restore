@implementation ASTEncodingUtilities

+ (id)parseJSONResponseWithData:(id)a3 error:(id *)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
  }
  return v4;
}

+ (id)jsonSerializeObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (!objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5)
    || (objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, a4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    ASTLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ASTEncodingUtilities jsonSerializeObject:error:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -4001, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)SHA256HashForString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 md[16];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    ASTLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ASTEncodingUtilities SHA256HashForString:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_13;
  }
  *(_OWORD *)md = 0u;
  v27 = 0u;
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4);
  if ((unint64_t)(v7 - 0x80000000) <= 0xFFFFFFFF80000000)
  {
    ASTLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ASTEncodingUtilities SHA256HashForString:].cold.2((uint64_t)v5, v7, v8);
LABEL_13:

    v16 = 0;
    goto LABEL_14;
  }
  if (!v6)
  {
    ASTLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ASTEncodingUtilities SHA256HashForString:].cold.3(v8, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_13;
  }
  CC_SHA256(v6, v7, md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v16, "appendFormat:", CFSTR("%02X"), md[i]);
LABEL_14:

  return v16;
}

+ (id)MD5ForFileHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t i;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "offsetInFile");
  objc_msgSend(v3, "seekToFileOffset:", 0);
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  do
  {
    objc_msgSend(v3, "readDataOfLength:", 0x10000);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = objc_retainAutorelease(v5);
    CC_MD5_Update(&c, (const void *)objc_msgSend(v7, "bytes"), v6);

  }
  while (v6);
  objc_msgSend(v3, "seekToFileOffset:", v4);
  CC_MD5_Final(md, &c);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", CFSTR("%02x"), md[i]);

  return v8;
}

+ (void)jsonSerializeObject:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a2, a3, " [INVALID_JSON_DATA] Bad json data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)SHA256HashForString:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "SHA256HashForString: input string is nil", a5, a6, a7, a8, 0);
}

+ (void)SHA256HashForString:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_22D91B000, log, OS_LOG_TYPE_ERROR, "SHA256HashForString: Invalid stride length %lu for string %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

+ (void)SHA256HashForString:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "SHA256HashForString: C string is nil", a5, a6, a7, a8, 0);
}

+ (void)MD5ForFileHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a2, a3, "Exception occurred trying to determine MD5 for file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
