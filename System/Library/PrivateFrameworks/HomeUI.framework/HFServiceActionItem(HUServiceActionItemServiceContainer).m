@implementation HFServiceActionItem(HUServiceActionItemServiceContainer)

- (uint64_t)hu_containedAccessories
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
