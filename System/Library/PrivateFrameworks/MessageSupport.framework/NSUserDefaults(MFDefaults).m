@implementation NSUserDefaults(MFDefaults)

- (unint64_t)mf_blockRemoteContent
{
  return ((unint64_t)objc_msgSend(a1, "integerForKey:", *MEMORY[0x1E0D1E048]) >> 1) & 1;
}

@end
