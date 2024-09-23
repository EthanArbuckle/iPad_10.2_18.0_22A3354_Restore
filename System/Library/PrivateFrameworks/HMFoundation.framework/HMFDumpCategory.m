@implementation HMFDumpCategory

+ (id)logCategory
{
  if (_MergedGlobals_60 != -1)
    dispatch_once(&_MergedGlobals_60, &__block_literal_global_8);
  return (id)qword_1ED013148;
}

void __30__HMFDumpCategory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("DumpState"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013148;
  qword_1ED013148 = v0;

}

@end
