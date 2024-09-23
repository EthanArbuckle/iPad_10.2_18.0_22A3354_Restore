@implementation NSData(HomeKit)

- (id)hm_generateSHA1
{
  id v1;
  void *v2;
  _QWORD v4[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  LODWORD(v5) = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA1((const void *)objc_msgSend(v1, "bytes", 0, 0, v5, v6), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 20);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)hm_stringInHexFormat
{
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v4 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v2 + v4++));
    while (objc_msgSend(v1, "length") > v4);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hm_generateSHA256
{
  id v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
