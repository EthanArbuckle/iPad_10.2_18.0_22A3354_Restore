@implementation UIScreen(LPExtras)

+ (double)_lp_mainScreenScale
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  return v2;
}

+ (double)_lp_mainScreenSize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  return v2;
}

@end
