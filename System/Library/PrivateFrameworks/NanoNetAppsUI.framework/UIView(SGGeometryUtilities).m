@implementation UIView(SGGeometryUtilities)

- (uint64_t)SG_setBoundsAndPositionFromFrame:()SGGeometryUtilities
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setBounds:");
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorPoint");
  v12 = v11;
  v14 = v13;

  return objc_msgSend(a1, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
}

@end
