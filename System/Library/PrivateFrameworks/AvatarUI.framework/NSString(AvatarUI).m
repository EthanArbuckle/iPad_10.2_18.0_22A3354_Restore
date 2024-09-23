@implementation NSString(AvatarUI)

- (id)avt_MD5String
{
  id v1;
  void *v2;
  uint64_t i;
  void *v4;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

@end
