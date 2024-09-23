@implementation CLKDebugCompanionDisplayDateOverride

void __CLKDebugCompanionDisplayDateOverride_block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  void *v2;

  v0 = CFPreferencesCopyAppValue(CFSTR("IdealizedDateOverride"), CFSTR("com.apple.ClockKit"));
  v1 = (void *)CLKDebugCompanionDisplayDateOverride___overrideDate;
  CLKDebugCompanionDisplayDateOverride___overrideDate = (uint64_t)v0;

  if (CLKDebugCompanionDisplayDateOverride___overrideDate)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = (void *)CLKDebugCompanionDisplayDateOverride___overrideDate;
      CLKDebugCompanionDisplayDateOverride___overrideDate = 0;

    }
  }
}

@end
