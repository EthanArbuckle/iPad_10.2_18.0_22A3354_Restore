@implementation UIImage

- (id)scaledImageToHeight:(double)a3
{
  double v5;

  -[UIImage size](self, "size");
  return -[UIImage scaledImageWithScale:](self, "scaledImageWithScale:", a3 / v5);
}

- (id)scaledImageToWidth:(double)a3
{
  double v5;

  -[UIImage size](self, "size");
  return -[UIImage scaledImageWithScale:](self, "scaledImageWithScale:", a3 / v5);
}

- (id)scaledImageWithScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGAffineTransform v14;
  CGSize v15;

  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  CGAffineTransformMakeScale(&v14, a3, a3);
  v9 = v8 * v14.c + v14.a * v6;
  v10 = v8 * v14.d + v14.b * v6;
  v15.width = v9;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v9, v10);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v12;
}

- (id)imageByCombiningWithImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  UIImage *ImageFromCurrentImageContext;
  void *v23;
  CGSize v25;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  if (v6 < v7)
    v6 = v7;
  -[UIImage size](self, "size");
  v9 = v8;
  objc_msgSend(v4, "size");
  if (v9 < v10)
    v9 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = v12;
  v25.width = v6;
  v25.height = v9;
  UIGraphicsBeginImageContextWithOptions(v25, 0, v13);

  -[UIImage size](self, "size");
  *(float *)&v14 = (v6 - v14) * 0.5;
  v15 = roundf(*(float *)&v14);
  -[UIImage size](self, "size");
  v17 = (v9 - v16) * 0.5;
  -[UIImage drawAtPoint:](self, "drawAtPoint:", v15, roundf(v17));
  objc_msgSend(v4, "size");
  *(float *)&v18 = (v6 - v18) * 0.5;
  v19 = roundf(*(float *)&v18);
  objc_msgSend(v4, "size");
  v21 = (v9 - v20) * 0.5;
  objc_msgSend(v4, "drawAtPoint:", v19, roundf(v21));

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v23 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v23;
}

- (id)imageByMaskingWithImage:(id)a3
{
  CGImage *v4;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  CGImage *v11;
  CGImage *v12;
  void *v13;

  v4 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  Width = CGImageGetWidth(v4);
  Height = CGImageGetHeight(v4);
  BitsPerComponent = CGImageGetBitsPerComponent(v4);
  BitsPerPixel = CGImageGetBitsPerPixel(v4);
  BytesPerRow = CGImageGetBytesPerRow(v4);
  DataProvider = CGImageGetDataProvider(v4);
  v11 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  v12 = CGImageCreateWithMask(-[UIImage CGImage](objc_retainAutorelease(self), "CGImage"), v11);
  CGImageRelease(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v12));
  CGImageRelease(v12);
  return v13;
}

@end
