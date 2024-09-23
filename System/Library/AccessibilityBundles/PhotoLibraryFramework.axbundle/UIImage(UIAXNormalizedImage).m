@implementation UIImage(UIAXNormalizedImage)

- (id)normalizedImageWithScale:()UIAXNormalizedImage
{
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGSize v16;

  objc_msgSend(a1, "size");
  v4 = a2;
  v6 = v5 * a2;
  objc_msgSend(a1, "size");
  v8 = v7 * v4;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v16.width = v6;
  v16.height = v8;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v10);
  objc_msgSend(a1, "size");
  v12 = v11 * v4;
  objc_msgSend(a1, "size");
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v12, v13 * v4);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

@end
