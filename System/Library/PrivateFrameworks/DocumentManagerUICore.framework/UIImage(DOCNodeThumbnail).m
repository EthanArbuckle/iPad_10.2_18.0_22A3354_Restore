@implementation UIImage(DOCNodeThumbnail)

- (id)doc_averageColorInRect:()DOCNodeThumbnail
{
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGContext *v15;
  CGImage *v16;
  CGImage *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int data;
  CGRect v23;
  CGRect v24;

  if (doc_averageColorInRect__onceToken != -1)
    dispatch_once(&doc_averageColorInRect__onceToken, &__block_literal_global_0);
  objc_msgSend(a1, "scale");
  v11 = a2 * v10;
  v12 = a3 * v10;
  v13 = a4 * v10;
  v14 = a5 * v10;
  data = 0;
  v15 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, (CGColorSpaceRef)doc_averageColorInRect__colorSpace, 0x4005u);
  CGContextSetInterpolationQuality(v15, kCGInterpolationLow);
  v16 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v23.origin.x = v11;
  v23.origin.y = v12;
  v23.size.width = v13;
  v23.size.height = v14;
  v17 = CGImageCreateWithImageInRect(v16, v23);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = 1.0;
  v24.size.height = 1.0;
  CGContextDrawImage(v15, v24, v17);
  CGImageRelease(v17);
  CGContextRelease(v15);
  LOBYTE(v19) = BYTE1(data);
  LOBYTE(v18) = data;
  LOBYTE(v20) = BYTE2(data);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v18 / 255.0, (double)v19 / 255.0, (double)v20 / 255.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
