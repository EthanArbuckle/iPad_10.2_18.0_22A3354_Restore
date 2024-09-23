@implementation NSData(ICDataExtensions)

- (id)ic_md5
{
  id v2;
  void *v3;
  uint64_t i;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v2 = objc_retainAutorelease(a1);
  CC_MD5_Update(&c, (const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
  CC_MD5_Final(md, &c);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
  {
    v5 = md[i];
    LODWORD(v6) = (v5 >> 4) + 87;
    if (v5 >= 0xA0)
      v6 = v6;
    else
      v6 = (v5 >> 4) | 0x30;
    v7 = v5 & 0xF;
    LODWORD(v8) = v7 + 87;
    if (v7 >= 0xA)
      v8 = v8;
    else
      v8 = v7 | 0x30;
    objc_msgSend(v3, "appendFormat:", CFSTR("%c%c"), v6, v8);
  }
  return v3;
}

- (id)ic_sha256
{
  void *v2;
  id v3;
  const void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  LODWORD(v3) = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v2);
  CC_SHA256(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_stringValue
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a1, 4);
}

- (BOOL)ic_BOOLValue
{
  return objc_msgSend(a1, "ic_unsignedIntegerValue") != 0;
}

+ (uint64_t)ic_dataWithBoolean:()ICDataExtensions
{
  return objc_msgSend(a1, "ic_dataWithUnsignedInteger:", a3);
}

- (uint64_t)ic_unsignedIntegerValue
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  v2 = objc_msgSend(a1, "length");
  result = 0;
  if (v2 == 8)
  {
    objc_msgSend(a1, "getBytes:length:", &v4, 8);
    return v4;
  }
  return result;
}

+ (id)ic_dataWithUnsignedInteger:()ICDataExtensions
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)ic_nullableData:()ICDataExtensions isEqualToNullableData:
{
  if (a3 | a4)
    return objc_msgSend((id)a3, "isEqualToData:", a4);
  else
    return 1;
}

+ (id)ic_randomDataOfLength:()ICDataExtensions error:
{
  void *v6;
  const __SecRandom *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v8 = objc_retainAutorelease(v6);
  if (!SecRandomCopyBytes(v7, a3, (void *)objc_msgSend(v8, "mutableBytes")))
  {
    if (objc_msgSend(v8, "length") == a3)
    {
      v9 = v8;
      goto LABEL_7;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

+ (uint64_t)ic_random128BitData:()ICDataExtensions
{
  return objc_msgSend((id)objc_opt_class(), "ic_randomDataOfLength:error:", 16, a3);
}

+ (uint64_t)ic_random256BitData:()ICDataExtensions
{
  return objc_msgSend((id)objc_opt_class(), "ic_randomDataOfLength:error:", 32, a3);
}

+ (id)ic_dataFromHexString:()ICDataExtensions
{
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  char __str[2];
  __int16 v9;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1EA825738);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "length") & 1) != 0)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "hexString.length % 2 == 0", "+[NSData(ICDataExtensions) ic_dataFromHexString:]", 1, 0, CFSTR("Hex string must have an even length"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v9 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v6 - 1);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v6);
      HIBYTE(v9) = strtol(__str, 0, 16);
      objc_msgSend(v4, "appendBytes:length:", (char *)&v9 + 1, 1);
      ++v5;
      v6 += 2;
    }
    while (v5 < (unint64_t)objc_msgSend(v3, "length") >> 1);
  }

  return v4;
}

@end
