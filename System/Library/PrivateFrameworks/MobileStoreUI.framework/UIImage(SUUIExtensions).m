@implementation UIImage(SUUIExtensions)

+ (id)singlePointImageWithColor:()SUUIExtensions
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v3 = (void *)MEMORY[0x24BEBD8F8];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;
  v13.width = 1.0;
  v13.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v7);

  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v4);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)resizeImage:()SUUIExtensions toSize:
{
  id v7;
  void *v8;
  CGSize v10;

  v7 = a5;
  v10.width = a1;
  v10.height = a2;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a1, a2);

  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

@end
