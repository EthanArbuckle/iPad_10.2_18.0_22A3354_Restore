@implementation NSData(CommonCrypto)

- (id)sha256
{
  id v1;
  void *v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytes:length:", v4, 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
