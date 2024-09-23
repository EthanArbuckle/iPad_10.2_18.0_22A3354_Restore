@implementation UIImage(PNGRotation)

- (id)correctlyRotatedPNGData
{
  UIImage *v1;
  void *v2;

  objc_msgSend(a1, "rightSideUpImage");
  v1 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)rightSideUpImage
{
  double v2;
  double v3;
  double v4;
  id v5;
  CGSize v7;

  if (objc_msgSend(a1, "imageOrientation"))
  {
    objc_msgSend(a1, "size");
    UIGraphicsBeginImageContext(v7);
    objc_msgSend(a1, "size");
    v3 = v2;
    objc_msgSend(a1, "size");
    objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v3, v4);
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

@end
