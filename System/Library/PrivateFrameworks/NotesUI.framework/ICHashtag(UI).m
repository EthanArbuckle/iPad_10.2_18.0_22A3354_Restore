@implementation ICHashtag(UI)

- (uint64_t)removeUsage
{
  objc_msgSend(MEMORY[0x1E0D63B10], "removeUsageOfHashtag:", a1);
  return objc_msgSend(MEMORY[0x1E0D63BB8], "removeUsageOfHashtag:", a1);
}

@end
