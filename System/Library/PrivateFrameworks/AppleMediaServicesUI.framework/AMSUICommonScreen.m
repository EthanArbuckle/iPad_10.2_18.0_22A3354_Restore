@implementation AMSUICommonScreen

+ (double)scale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

@end
