@implementation NSShadow(Helper)

- (void)applyToGraphicsContext_emk:()Helper
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGColor *v12;
  id v13;
  CGSize v14;

  objc_msgSend(a1, "shadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shadowOffset");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "shadowBlurRadius");
  v11 = v10;
  v13 = objc_retainAutorelease(v5);
  v12 = (CGColor *)objc_msgSend(v13, "CGColor");
  v14.width = v7;
  v14.height = v9;
  CGContextSetShadowWithColor(a3, v14, v11, v12);

}

@end
