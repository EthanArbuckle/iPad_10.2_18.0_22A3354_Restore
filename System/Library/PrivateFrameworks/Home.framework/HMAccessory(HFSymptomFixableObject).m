@implementation HMAccessory(HFSymptomFixableObject)

- (uint64_t)accessories
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1);
}

@end
