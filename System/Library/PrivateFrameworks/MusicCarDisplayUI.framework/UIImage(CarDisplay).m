@implementation UIImage(CarDisplay)

- (id)car_scaledImageWithSize:()CarDisplay
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGSize v15;

  objc_msgSend(a1, "size");
  v7 = a2 / v6;
  objc_msgSend(a1, "size");
  if (v7 >= a3 / v8)
    v7 = a3 / v8;
  objc_msgSend(a1, "size");
  v10 = v9 * v7;
  objc_msgSend(a1, "size");
  v12 = v11 * v7;
  v15.width = v10;
  v15.height = v12;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v10, v12);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

@end
