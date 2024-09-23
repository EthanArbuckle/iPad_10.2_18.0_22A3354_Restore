@implementation CADisplayLink

- (uint64_t)bkui_enableHighFrameRate
{
  void *v1;
  CAFrameRateRange v2;

  if (result)
  {
    v1 = (void *)result;
    if (MGGetProductType() == 1060988941
      || MGGetProductType() == 3585085679
      || MGGetProductType() == 689804742
      || (result = MGGetProductType(), result == 2309863438))
    {
      v2 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v1, "setPreferredFrameRateRange:", *(double *)&v2.minimum, *(double *)&v2.maximum, *(double *)&v2.preferred);
      return objc_msgSend(v1, "setHighFrameRateReason:", 2293761);
    }
  }
  return result;
}

@end
