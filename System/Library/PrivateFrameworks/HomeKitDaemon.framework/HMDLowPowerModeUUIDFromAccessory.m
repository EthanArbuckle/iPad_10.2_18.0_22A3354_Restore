@implementation HMDLowPowerModeUUIDFromAccessory

void __HMDLowPowerModeUUIDFromAccessory_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("CB66A944-B172-4D2F-A5B4-DCF2F9CFB9D4"));
  v1 = (void *)HMDLowPowerModeUUIDFromAccessory_namespace;
  HMDLowPowerModeUUIDFromAccessory_namespace = v0;

}

@end
