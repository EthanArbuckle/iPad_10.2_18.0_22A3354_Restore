@implementation UIImage(SpriteSheet)

- (id)imagesWithSpriteSize:()SpriteSheet
{
  void *v3;
  void *v7;
  double v8;
  double v9;
  CGImage *v10;
  void *v11;
  size_t Width;
  size_t Height;
  size_t v14;
  unint64_t i;
  double v16;
  unint64_t v17;
  double v18;
  CGImage *v19;
  void *v20;
  CGRect v22;

  v3 = (void *)MEMORY[0x24BDBD1A8];
  if (a2 > 0.0 && a3 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    v10 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Width = CGImageGetWidth(v10);
    Height = CGImageGetHeight(v10);
    if (Height)
    {
      v14 = Height;
      for (i = 0; i < v14; i = (unint64_t)(v16 + a3 * v9))
      {
        v16 = (double)i;
        if (Width)
        {
          v17 = 0;
          do
          {
            v18 = (double)v17;
            v22.origin.x = (double)v17;
            v22.origin.y = v16;
            v22.size.width = a2 * v9;
            v22.size.height = a3 * v9;
            v19 = CGImageCreateWithImageInRect(v10, v22);
            objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v19, 0, v9);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);
            CGImageRelease(v19);
            v17 = (unint64_t)(v18 + a2 * v9);

          }
          while (Width > v17);
        }
      }
    }
    v3 = (void *)objc_msgSend(v11, "copy");

  }
  return v3;
}

@end
