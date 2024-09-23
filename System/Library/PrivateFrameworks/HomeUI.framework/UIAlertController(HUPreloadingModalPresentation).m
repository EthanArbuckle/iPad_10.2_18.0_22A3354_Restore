@implementation UIAlertController(HUPreloadingModalPresentation)

- (uint64_t)hu_preloadContent
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

@end
