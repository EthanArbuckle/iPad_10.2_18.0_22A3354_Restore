@implementation UIScreen(HKAdditions_TestSupport)

+ (uint64_t)screenHeightSizeClassForHeight:()HKAdditions_TestSupport scale:
{
  double v2;
  uint64_t v3;

  v2 = a1 / a2;
  v3 = 2;
  if (v2 <= 670.0)
    v3 = 1;
  if (v2 <= 570.0)
    return 0;
  else
    return v3;
}

@end
