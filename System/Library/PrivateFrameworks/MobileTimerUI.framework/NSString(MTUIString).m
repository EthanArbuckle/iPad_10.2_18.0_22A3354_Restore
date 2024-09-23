@implementation NSString(MTUIString)

+ (uint64_t)mtui_daySettingString:()MTUIString options:
{
  return DateMaskToString();
}

@end
