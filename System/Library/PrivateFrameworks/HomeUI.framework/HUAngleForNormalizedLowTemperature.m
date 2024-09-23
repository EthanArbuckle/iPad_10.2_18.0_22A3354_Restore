@implementation HUAngleForNormalizedLowTemperature

double __HUAngleForNormalizedLowTemperature_block_invoke(double a1)
{
  return HUComputeSamplesForCubicBezier(HULowTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1ED580D10, 20, a1);
}

@end
