@implementation UIApplication(SUUIMedusaAdditions)

- (uint64_t)SUUI_isMedusaActive
{
  return objc_msgSend(a1, "SUUI_isFullscreen") ^ 1;
}

- (BOOL)SUUI_isFullscreen
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(a1, "keyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  return v4 + v6 == v9 + v11;
}

@end
