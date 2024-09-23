@implementation HMFGetDefaultOSLogHandle

void __HMFGetDefaultOSLogHandle_block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("default"), CFSTR("com.apple.HomeKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0131B8;
  qword_1ED0131B8 = v0;

}

@end
