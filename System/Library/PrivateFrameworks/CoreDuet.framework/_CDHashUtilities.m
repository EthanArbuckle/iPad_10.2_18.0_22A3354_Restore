@implementation _CDHashUtilities

+ (id)md5forDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "md5ForData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)md5ForData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    CC_MD5((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), md);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 16; ++i)
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), md[i]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)sha1ForString:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E26E9728;
  -[__CFString dataUsingEncoding:](v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sha1ForData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sha1ForData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", ", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_retainAutorelease(v3);
  CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);

  return v5;
}

+ (id)md5ForString:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "md5ForData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)md5ForObjectDescription:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "md5ForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hexStringFromData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR("%hhx"), *(unsigned __int8 *)(v4 + v6++));
    while (objc_msgSend(v3, "length") > v6);
  }
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

+ (id)sha256Hash:(id)a3 withSalt:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 md[32];
  uint64_t v14;

  v4 = 0;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "appendData:", v7);
    md[0] = 0;
    v10 = objc_retainAutorelease(v9);
    CC_SHA256((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hexStringFromData:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
