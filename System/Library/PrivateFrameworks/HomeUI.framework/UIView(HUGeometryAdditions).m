@implementation UIView(HUGeometryAdditions)

- (double)hu_centerInGlobalCoordinateSpace
{
  double v2;
  double v3;

  objc_msgSend(a1, "center");
  return HUConvertPointToGlobalCoordinateSpace(a1, v2, v3);
}

- (double)hu_frameInGlobalCoordinateSpace
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "frame");
  return HUConvertRectToGlobalCoordinateSpace(a1, v2, v3, v4, v5);
}

@end
