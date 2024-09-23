@implementation UIImage(GKAdditions)

+ (uint64_t)_gkImageWithCheckedData:()GKAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "_gkImageWithCheckedData:scale:", 1.0);
}

+ (id)_gkImageWithCheckedData:()GKAdditions scale:
{
  uint64_t v2;
  const void *v3;
  void *v4;

  v2 = objc_msgSend(MEMORY[0x24BE3A1D0], "cgImageForGamesWithData:");
  if (v2)
  {
    v3 = (const void *)v2;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v2, 0, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_gkImageByScalingToSize:()GKAdditions scale:padColor:
{
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGColorSpace *DeviceRGB;
  id v17;
  CGContext *v18;
  id v19;
  CGImage *v20;
  CGImage *Image;
  void *v22;
  CGRect v24;
  CGRect v25;

  v10 = a6;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    a4 = v12;

    if (a4 <= 0.0)
      a4 = 1.0;
  }
  v13 = a2 * a4;
  v14 = a3 * a4;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", vcvtd_n_u64_f64(v13 * v14, 2uLL));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = objc_retainAutorelease(v15);
  v18 = CGBitmapContextCreate((void *)objc_msgSend(v17, "mutableBytes"), (unint64_t)v13, (unint64_t)v14, 8uLL, vcvtd_n_u64_f64(v13, 2uLL), DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v10)
  {
    CGContextSetFillColorWithColor(v18, (CGColorRef)objc_msgSend(objc_retainAutorelease(v10), "CGColor"));
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v13;
    v24.size.height = v14;
    CGContextFillRect(v18, v24);
    objc_msgSend(a1, "size");
    objc_msgSend(a1, "size");
  }
  v19 = objc_retainAutorelease(a1);
  v20 = (CGImage *)objc_msgSend(v19, "CGImage");
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v13;
  v25.size.height = v14;
  CGContextDrawImage(v18, v25, v20);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v19, "imageOrientation"), a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v22;
}

- (uint64_t)_gkImageByScalingToSize:()GKAdditions scale:
{
  return objc_msgSend(a1, "_gkImageByScalingToSize:scale:padColor:", 0);
}

- (uint64_t)_gkImageByScalingToSize:()GKAdditions
{
  double v6;

  objc_msgSend(a1, "scale");
  return objc_msgSend(a1, "_gkImageByScalingToSize:scale:padColor:", 0, a2, a3, v6);
}

+ (void)_gkloadRemoteImageForURL:()GKAdditions queue:withCompletionHandler:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  v9 = _gkloadRemoteImageForURL_queue_withCompletionHandler__onceToken;
  v10 = a4;
  if (v9 != -1)
    dispatch_once(&_gkloadRemoteImageForURL_queue_withCompletionHandler__onceToken, &__block_literal_global_0);
  v11 = (void *)MEMORY[0x24BDBCE50];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_24DC27448;
  v15 = v7;
  v16 = v8;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v11, "_gkLoadRemoteImageDataForURL:subdirectory:filename:queue:handler:", v12, 0, 0, v10, v14);

}

- (id)_gkImageByTintingWithColor:()GKAdditions
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  CGImage *v12;
  void *v13;
  CGSize v15;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v15.width = v6;
  v15.height = v8;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v8);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  objc_msgSend(v4, "setFill");

  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v6;
  v16.size.height = v8;
  CGContextFillRect(CurrentContext, v16);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
  v12 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v6;
  v17.size.height = v8;
  CGContextDrawImage(CurrentContext, v17, v12);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)circularClippedImage
{
  id v1;
  CGContext *CurrentContext;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  CGSize v12;

  v1 = a1;
  objc_msgSend(v1, "size");
  UIGraphicsBeginImageContextWithOptions(v12, 0, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v1, "size");
  v4 = v3;
  objc_msgSend(v1, "size");
  v6 = v5;
  if (v4 >= v5)
    v7 = v5;
  else
    v7 = v4;
  v8 = v7 * 0.5;
  CGContextBeginPath(CurrentContext);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v4 * 0.5 - v8, v6 * 0.5 - v8, v4, v6);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v9, "CGPath"));
  CGContextClip(CurrentContext);
  objc_msgSend(v1, "drawInRect:", 0.0, 0.0, v4, v6);

  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v10;
}

@end
