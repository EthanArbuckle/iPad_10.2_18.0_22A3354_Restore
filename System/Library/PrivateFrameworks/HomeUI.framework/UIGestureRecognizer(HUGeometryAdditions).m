@implementation UIGestureRecognizer(HUGeometryAdditions)

- (double)hu_locationInGlobalCoordinateSpace
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v2);
  v4 = v3;
  v6 = v5;
  objc_msgSend(a1, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HUConvertPointToGlobalCoordinateSpace(v7, v4, v6);

  return v8;
}

@end
