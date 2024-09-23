@implementation UIImage(SquareImage)

- (id)_gkCropImageIntoSquare:()SquareImage
{
  id v5;
  double Width;
  id v7;
  size_t Height;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGImage *v14;
  CGImage *v15;
  void *v16;
  CGRect v18;

  v5 = objc_retainAutorelease(a1);
  Width = (double)CGImageGetWidth((CGImageRef)objc_msgSend(v5, "CGImage"));
  v7 = objc_retainAutorelease(v5);
  Height = CGImageGetHeight((CGImageRef)objc_msgSend(v7, "CGImage"));
  if (a2 >= a3)
    v9 = a3;
  else
    v9 = a2;
  v10 = floor(v9 * (Width / a2));
  v11 = (Width - v10) * 0.5;
  v12 = ((double)Height - v10) * 0.5;
  v13 = objc_retainAutorelease(v7);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.width = v10;
  v18.size.height = v10;
  v15 = CGImageCreateWithImageInRect(v14, v18);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v15);
  return v16;
}

@end
