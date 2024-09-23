@implementation UIImage(AuthKitUI)

+ (id)ak_imageNamed:()AuthKitUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEA650];
  v4 = a3;
  objc_msgSend(v3, "configurationWithWeight:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ak_imageWithColor:()AuthKitUI
{
  id v4;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v6;
  CGContext *v7;
  CGContext *v8;
  CGImageRef Image;
  CGImage *v10;
  void *v11;
  CGRect v13;

  v4 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v6 = DeviceRGB;
    v7 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 1u);
    if (v7)
    {
      v8 = v7;
      CGContextSetFillColorWithColor(v7, (CGColorRef)objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
      v13.origin.x = 0.0;
      v13.origin.y = 0.0;
      v13.size.width = 1.0;
      v13.size.height = 1.0;
      CGContextFillRect(v8, v13);
      Image = CGBitmapContextCreateImage(v8);
      if (Image)
      {
        v10 = Image;
        v11 = (void *)objc_msgSend([a1 alloc], "initWithCGImage:", Image);
        CGImageRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      CGContextRelease(v8);
    }
    else
    {
      v11 = 0;
    }
    CGColorSpaceRelease(v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ak_copyScaledToSize:()AuthKitUI
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setScale:");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v6, a2, a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__UIImage_AuthKitUI__ak_copyScaledToSize___block_invoke;
  v12[3] = &unk_1E76790A0;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  v12[4] = a1;
  objc_msgSend(v8, "imageWithActions:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
