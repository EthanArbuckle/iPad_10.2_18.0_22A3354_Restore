@implementation UITouch(UITouch_ASVTouch)

- (double)location
{
  void *v2;
  float64x2_t v3;
  float64_t v4;
  double v5;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preciseLocationInView:", v2);
  v5 = pointToFloat2(v3, v4);

  return v5;
}

- (double)previousLocation
{
  void *v2;
  float64x2_t v3;
  float64_t v4;
  double v5;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "precisePreviousLocationInView:", v2);
  v5 = pointToFloat2(v3, v4);

  return v5;
}

@end
