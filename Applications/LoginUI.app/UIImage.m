@implementation UIImage

- (id)colorAtPixel:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  double v10;
  UIImage *v11;
  CGImage *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGColorSpace *DeviceRGB;
  CGContext *v18;
  CGFloat v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int data;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  -[UIImage size](self, "size");
  v7 = v6;
  -[UIImage size](self, "size");
  v28.size.height = v8;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v7;
  v27.x = x;
  v27.y = y;
  if (CGRectContainsPoint(v28, v27))
  {
    v9 = (uint64_t)x;
    v10 = trunc(y);
    v11 = objc_retainAutorelease(self);
    v12 = -[UIImage CGImage](v11, "CGImage");
    -[UIImage size](v11, "size");
    v14 = v13;
    -[UIImage size](v11, "size");
    v16 = v15;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    data = 0;
    v18 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    CGContextSetBlendMode(v18, kCGBlendModeCopy);
    v19 = (double)(unint64_t)v16;
    CGContextTranslateCTM(v18, (double)-v9, (double)(uint64_t)v10 - v19);
    v29.size.width = (double)(unint64_t)v14;
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.height = v19;
    CGContextDrawImage(v18, v29, v12);
    CGContextRelease(v18);
    LOBYTE(v21) = BYTE1(data);
    LOBYTE(v20) = data;
    LOBYTE(v23) = HIBYTE(data);
    LOBYTE(v22) = BYTE2(data);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (double)v20 / 255.0, (double)v21 / 255.0, (double)v22 / 255.0, (double)v23 / 255.0));
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

@end
