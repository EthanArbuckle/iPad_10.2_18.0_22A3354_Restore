@implementation HUAngleForNormalizedHighTemperature

double __HUAngleForNormalizedHighTemperature_block_invoke(double a1)
{
  return HUComputeSamplesForCubicBezier(HUHighTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1ED580C70, 20, a1);
}

@end
