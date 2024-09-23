@implementation MPModelComposer(MPCModelQueueFeederAdditions)

+ (uint64_t)mqf_requiredSectionPlaybackProperties
{
  return objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
}

@end
