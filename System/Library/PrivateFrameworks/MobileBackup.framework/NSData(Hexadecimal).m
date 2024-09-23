@implementation NSData(Hexadecimal)

+ (id)mb_dataFromHexadecimalString:()Hexadecimal
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  char __str[2];
  __int16 v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_opt_new();
    v13 = 0;
    v6 = objc_msgSend(v5, "length");
    v7 = v6 - 1;
    if (v6 != 1)
    {
      v8 = 0;
      do
      {
        v9 = v8 + 1;
        v10 = objc_msgSend(v5, "characterAtIndex:", v8);
        if ((char)v10 >= 48 && v10 <= 0x66u && v10 - 58 >= 0x27)
        {
          __str[0] = v10;
          __str[1] = objc_msgSend(v5, "characterAtIndex:", v8 + 1);
          HIBYTE(v13) = strtol(__str, 0, 16);
          objc_msgSend(v4, "appendBytes:length:", (char *)&v13 + 1, 1);
          v9 = v8 + 2;
        }
        v8 = v9;
      }
      while (v9 < v7);
    }

  }
  return v4;
}

- (id)mb_hexadecimalString
{
  id v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  void *i;
  unsigned int v6;
  void *v7;
  void *v8;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  if (v2)
  {
    v3 = (unsigned __int8 *)v2;
    v4 = objc_msgSend(v1, "length");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v4);
    for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
    {
      v6 = *v3++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02lx"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "appendString:", v7);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)mb_base64EncodedFileSystemPathString
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
