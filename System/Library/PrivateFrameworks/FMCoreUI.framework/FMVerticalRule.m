@implementation FMVerticalRule

+ (id)imageWithColor:(id)a3 leading:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGContext *CurrentContext;
  double v12;
  id v13;
  CGColor *v14;
  void *v15;
  void *v16;
  CGSize v18;
  CGRect v19;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDF6D38];
  v6 = a3;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = 1.0;
  v18.width = 1.0;
  v18.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (v9 <= 1.0 || (v10 = 1.0 / v9, v4))
    v12 = 0.0;
  else
    v12 = 1.0 - v10;
  v13 = objc_retainAutorelease(v6);
  v14 = (CGColor *)objc_msgSend(v13, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v14);
  v19.size.height = 1.0;
  v19.origin.x = v12;
  v19.origin.y = 0.0;
  v19.size.width = v10;
  CGContextFillRect(CurrentContext, v19);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v16;
}

- (void)commonSetup
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMVerticalRule;
  -[FMRule commonSetup](&v4, sel_commonSetup);
  -[FMRule imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  v3 = 1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

@end
