@implementation UIImage(PKStrokeSelection)

- (id)pk_imageRotated90DegreesClockwise:()PKStrokeSelection
{
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGSize v15;

  objc_msgSend(a1, "size");
  v6 = v5;
  v8 = v7;
  v15.width = v7;
  v15.height = v6;
  UIGraphicsBeginImageContext(v15);
  v9 = (void *)MEMORY[0x1E0DC3870];
  v10 = objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (a3)
    v11 = 3;
  else
    v11 = 2;
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawInRect:", 0.0, 0.0, v8, v6);

  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

@end
