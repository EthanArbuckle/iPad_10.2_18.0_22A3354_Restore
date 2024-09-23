@implementation NSDateComponentsFormatter(CKUtilities)

+ (id)__ck_durationFormatter
{
  void *v0;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setUnitsStyle:", 0);
  objc_msgSend(v0, "setZeroFormattingBehavior:", 0x10000);
  return v0;
}

@end
