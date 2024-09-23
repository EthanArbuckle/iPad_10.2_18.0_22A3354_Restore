@implementation CDCornerComplicationTopLeftCenterAngle

double __CDCornerComplicationTopLeftCenterAngle_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double result;

  v2 = a2;
  v3 = CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  v4 = CDCornerComplicationTopExclusionSliceAngle((uint64_t)v2);

  result = (v3 + v4) * 0.5;
  *(double *)&CDCornerComplicationTopLeftCenterAngle__cornerTopLeftCenterAngle = result;
  return result;
}

@end
