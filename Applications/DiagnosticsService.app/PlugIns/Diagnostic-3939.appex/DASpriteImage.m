@implementation DASpriteImage

+ (id)imagesFromSprite:(id)a3 inRange:(_NSRange)a4 withImageSize:(CGSize)a5
{
  double height;
  double width;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  CGImage *v14;
  void *v15;
  size_t v16;
  size_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  double v22;
  double v23;
  CGImage *v24;
  void *v25;
  id v26;
  CGRect v27;

  height = a5.height;
  width = a5.width;
  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = v9;
  if (!v9
    || (height == CGSizeZero.height ? (v11 = width == CGSizeZero.width) : (v11 = 0),
        !v11 ? (v12 = length == 0) : (v12 = 1),
        v12))
  {
    v15 = 0;
  }
  else
  {
    v14 = (CGImage *)objc_msgSend(objc_retainAutorelease(v9), "CGImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", length));
    v16 = CGImageGetWidth(v14);
    v17 = CGImageGetHeight(v14);
    v18 = (int)((double)v16 / width);
    v19 = (int)(height * (double)(location / v18));
    if (v17 > v19)
    {
      v20 = v17;
      v21 = (int)(width * (double)(location % v18));
      do
      {
        v22 = (double)v19;
        while (v16 > v21)
        {
          v23 = (double)v21;
          v27.origin.x = (double)v21;
          v27.origin.y = v22;
          v27.size.width = width;
          v27.size.height = height;
          v24 = CGImageCreateWithImageInRect(v14, v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v24));
          objc_msgSend(v15, "addObject:", v25);

          CGImageRelease(v24);
          v26 = objc_msgSend(v15, "count");
          v21 = (int)(width + v23);
          if (v26 == (id)length)
            goto LABEL_11;
        }
        v21 = 0;
        v19 = (int)(height + v22);
      }
      while (v20 > v19);
    }
  }
LABEL_11:

  return v15;
}

@end
