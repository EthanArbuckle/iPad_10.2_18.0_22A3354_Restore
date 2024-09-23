@implementation NSData(AvatarUI)

- (id)avt_SHA256
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  return v2;
}

@end
