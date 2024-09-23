@implementation UIImage(FIUIUtilities)

+ (id)fiui_imageWithColor:()FIUIUtilities size:
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a1;
  v13.height = a2;
  UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a1;
  v14.size.height = a2;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (uint64_t)fiui_pixelImageWithColor:()FIUIUtilities
{
  return objc_msgSend(MEMORY[0x24BEBD640], "fiui_imageWithColor:size:", 1.0, 1.0);
}

@end
