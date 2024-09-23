@implementation NSBundle(HKMenstrualCyclesUI)

+ (uint64_t)hkmcui_bundle
{
  return objc_msgSend(a1, "bundleForClass:", objc_opt_class());
}

@end
