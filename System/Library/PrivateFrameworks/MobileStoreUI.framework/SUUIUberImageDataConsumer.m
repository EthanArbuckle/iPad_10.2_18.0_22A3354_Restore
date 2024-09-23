@implementation SUUIUberImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGContextRef CurrentContext;
  CGColorSpace *DeviceRGB;
  id v14;
  CGColorRef v15;
  id v16;
  CGColorRef v17;
  id v18;
  CGColorRef v19;
  id v20;
  CGColorRef v21;
  const __CFArray *v22;
  CGGradient *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  CGContext *c;
  void *values[4];
  CGFloat locations[2];
  __int128 v36;
  uint64_t v37;
  CGSize v38;
  CGPoint v39;
  CGPoint v40;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  v8 = v7;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;
  v38.width = v6;
  v38.height = v8;
  UIGraphicsBeginImageContextWithOptions(v38, 1, v11);

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v6, v8);
  if (self->_backgroundColor)
  {
    c = CurrentContext;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_241EFC9D8;
    v36 = unk_241EFC9E8;
    -[UIColor colorWithAlphaComponent:](self->_backgroundColor, "colorWithAlphaComponent:", 0.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = CGColorRetain((CGColorRef)objc_msgSend(v14, "CGColor"));

    -[UIColor colorWithAlphaComponent:](self->_backgroundColor, "colorWithAlphaComponent:", 0.25);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = CGColorRetain((CGColorRef)objc_msgSend(v16, "CGColor"));

    -[UIColor colorWithAlphaComponent:](self->_backgroundColor, "colorWithAlphaComponent:", 0.75);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = CGColorRetain((CGColorRef)objc_msgSend(v18, "CGColor"));

    -[UIColor colorWithAlphaComponent:](self->_backgroundColor, "colorWithAlphaComponent:", 1.0);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = CGColorRetain((CGColorRef)objc_msgSend(v20, "CGColor"));

    values[0] = v15;
    values[1] = v17;
    values[2] = v19;
    values[3] = v21;
    v22 = CFArrayCreate(0, (const void **)values, 4, MEMORY[0x24BDBD690]);
    v23 = CGGradientCreateWithColors(DeviceRGB, v22, locations);
    objc_msgSend(v4, "size");
    v25 = v24;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    v28 = 70.0;
    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v28 = 30.0;
    v29 = v25 - v28;
    objc_msgSend(v4, "size");
    v40.y = v30;
    v39.x = 0.0;
    v40.x = 0.0;
    v39.y = v29;
    CGContextDrawLinearGradient(c, v23, v39, v40, 0);
    CGGradientRelease(v23);
    CFRelease(v22);
    CGColorRelease(v15);
    CGColorRelease(v17);
    CGColorRelease(v19);
    CGColorRelease(v21);
    CGColorSpaceRelease(DeviceRGB);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v31;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
