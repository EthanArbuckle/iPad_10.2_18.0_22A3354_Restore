@implementation NSData(FMCoreAdditions)

- (id)fm_hexString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v4 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v3 >= 1)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", CFSTR("%02X"), v6);
      --v3;
    }
    while (v3);
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (__CFString)fm_MACAddressString
{
  unsigned __int8 *v1;
  __CFString *v2;

  v1 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), *v1, v1[1], v1[2], v1[3], v1[4], v1[5]);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E5E0E900;
  }
  return v2;
}

@end
