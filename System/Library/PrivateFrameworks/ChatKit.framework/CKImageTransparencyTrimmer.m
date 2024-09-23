@implementation CKImageTransparencyTrimmer

- (void)dealloc
{
  objc_super v3;

  -[CKImageTransparencyTrimmer setBitmap:](self, "setBitmap:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKImageTransparencyTrimmer;
  -[CKImageTransparencyTrimmer dealloc](&v3, sel_dealloc);
}

- (double)height
{
  double v2;

  -[CKImageTransparencyTrimmer size](self, "size");
  return v2;
}

- (BOOL)isTooSmallToTrim
{
  double v3;
  double v5;

  -[CKImageTransparencyTrimmer size](self, "size");
  if (v3 < 2.0)
    return 1;
  -[CKImageTransparencyTrimmer size](self, "size");
  return v5 < 2.0;
}

- (unsigned)pixel:(int)a3 col:(int)a4
{
  return self->_bitmap[a4 + self->_bytesPerRow * a3];
}

- (void)setBitmap:(char *)a3
{
  char *bitmap;

  bitmap = self->_bitmap;
  if (bitmap)
    free(bitmap);
  self->_bitmap = a3;
}

- (double)trimmedTop
{
  double v3;
  double v4;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  -[CKImageTransparencyTrimmer height](self, "height");
  v3 = 0.0;
  if (v4 > 0.0)
  {
    v6 = 0;
    while (1)
    {
      -[CKImageTransparencyTrimmer width](self, "width");
      if (v7 > 0.0)
        break;
LABEL_8:
      v6 = (v6 + 1);
      v3 = (double)(int)v6;
      -[CKImageTransparencyTrimmer height](self, "height");
      if (v10 <= (double)(int)v6)
        return 0.0;
    }
    v8 = 0;
    while (!-[CKImageTransparencyTrimmer pixel:col:](self, "pixel:col:", v6, v8))
    {
      v8 = (v8 + 1);
      -[CKImageTransparencyTrimmer width](self, "width");
      if (v9 <= (double)(int)v8)
        goto LABEL_8;
    }
  }
  return v3;
}

- (double)trimmedLeft
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  int v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double result;

  -[CKImageTransparencyTrimmer width](self, "width");
  v4 = v3;
  -[CKImageTransparencyTrimmer height](self, "height");
  if (v5 > 0.0)
  {
    v6 = 0;
    do
    {
      -[CKImageTransparencyTrimmer width](self, "width");
      if (v7 > 0.0)
      {
        v8 = 0;
        v9 = 0.0;
        do
        {
          v10 = -[CKImageTransparencyTrimmer pixel:col:](self, "pixel:col:", v6, v8);
          v11 = v4 < v9 || v10 == 0;
          if (!v11)
            v4 = v9;
          v8 = (v8 + 1);
          v9 = (double)(int)v8;
          -[CKImageTransparencyTrimmer width](self, "width");
        }
        while (v12 > (double)(int)v8);
      }
      v6 = (v6 + 1);
      -[CKImageTransparencyTrimmer height](self, "height");
    }
    while (v13 > (double)(int)v6);
  }
  -[CKImageTransparencyTrimmer width](self, "width");
  v11 = v4 == v14;
  result = 0.0;
  if (!v11)
    return v4;
  return result;
}

- (double)trimmedRight
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  int v8;
  double v9;
  double v10;
  double result;

  -[CKImageTransparencyTrimmer height](self, "height");
  if (v3 > 0.0)
  {
    v4 = 0;
    v5 = 0.0;
    do
    {
      -[CKImageTransparencyTrimmer width](self, "width");
      v7 = (int)(v6 + -1.0);
      if ((v7 & 0x80000000) == 0)
      {
        do
        {
          v8 = -[CKImageTransparencyTrimmer pixel:col:](self, "pixel:col:", v4, v7);
          v9 = (double)(int)v7;
          if (v5 >= (double)(int)v7)
            v9 = v5;
          if (v8)
            v5 = v9;
          v7 = (v7 - 1);
        }
        while ((_DWORD)v7 != -1);
      }
      v4 = (v4 + 1);
      -[CKImageTransparencyTrimmer height](self, "height");
    }
    while (v10 > (double)(int)v4);
    if (v5 != 0.0)
      return v5;
  }
  -[CKImageTransparencyTrimmer width](self, "width");
  return result;
}

- (double)trimmedBottom
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  BOOL v8;
  double result;

  -[CKImageTransparencyTrimmer height](self, "height");
  v4 = (int)(v3 + -1.0);
  if ((v4 & 0x80000000) != 0)
  {
LABEL_8:
    -[CKImageTransparencyTrimmer height](self, "height");
  }
  else
  {
    while (1)
    {
      -[CKImageTransparencyTrimmer width](self, "width");
      if (v5 > 0.0)
        break;
LABEL_6:
      v8 = (int)v4 <= 0;
      v4 = (v4 - 1);
      if (v8)
        goto LABEL_8;
    }
    v6 = 0;
    while (!-[CKImageTransparencyTrimmer pixel:col:](self, "pixel:col:", v4, v6))
    {
      v6 = (v6 + 1);
      -[CKImageTransparencyTrimmer width](self, "width");
      if (v7 <= (double)(int)v6)
        goto LABEL_6;
    }
    return (double)(int)v4;
  }
  return result;
}

- (CGRect)trimmedFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[CKImageTransparencyTrimmer trimmedLeft](self, "trimmedLeft");
  v4 = fmax(v3 + -2.0, 0.0);
  -[CKImageTransparencyTrimmer width](self, "width");
  v6 = v5;
  -[CKImageTransparencyTrimmer trimmedRight](self, "trimmedRight");
  v8 = v7 + 2.0;
  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  -[CKImageTransparencyTrimmer trimmedTop](self, "trimmedTop");
  v11 = fmax(v10 + -2.0, 0.0);
  -[CKImageTransparencyTrimmer height](self, "height");
  v13 = v12;
  -[CKImageTransparencyTrimmer trimmedBottom](self, "trimmedBottom");
  v15 = v14 + 2.0;
  if (v13 < v15)
    v15 = v13;
  v16 = v9 - v4;
  v17 = v15 - v11;
  v18 = v4;
  v19 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)trimTransparencyFromImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  double v15;
  size_t v16;
  double v17;
  CGContext *v18;
  id v19;
  CGImage *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  uint64_t v35;
  id v36;
  CGSize v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[CKImageTransparencyTrimmer setImage:](self, "setImage:", v6);
    objc_msgSend(v6, "size");
    -[CKImageTransparencyTrimmer setSize:](self, "setSize:");
    -[CKImageTransparencyTrimmer size](self, "size");
    -[CKImageTransparencyTrimmer setBytesPerRow:](self, "setBytesPerRow:", (int)v7);
    if (!-[CKImageTransparencyTrimmer isTooSmallToTrim](self, "isTooSmallToTrim"))
    {
      -[CKImageTransparencyTrimmer width](self, "width");
      v9 = v8;
      -[CKImageTransparencyTrimmer height](self, "height");
      -[CKImageTransparencyTrimmer setBitmapSize:](self, "setBitmapSize:", (int)(v9 * v10));
      -[CKImageTransparencyTrimmer width](self, "width");
      v12 = v11;
      -[CKImageTransparencyTrimmer height](self, "height");
      -[CKImageTransparencyTrimmer setBitmap:](self, "setBitmap:", malloc_type_calloc((unint64_t)(v12 * v13), 1uLL, 0x100004077774924uLL));
      v14 = -[CKImageTransparencyTrimmer bitmap](self, "bitmap");
      -[CKImageTransparencyTrimmer width](self, "width");
      v16 = (unint64_t)v15;
      -[CKImageTransparencyTrimmer height](self, "height");
      v18 = CGBitmapContextCreate(v14, v16, (unint64_t)v17, 8uLL, -[CKImageTransparencyTrimmer bytesPerRow](self, "bytesPerRow"), 0, 7u);
      -[CKImageTransparencyTrimmer image](self, "image");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (CGImage *)objc_msgSend(v19, "CGImage");

      -[CKImageTransparencyTrimmer width](self, "width");
      v22 = v21;
      -[CKImageTransparencyTrimmer height](self, "height");
      v24 = v23;
      v39.origin.x = 0.0;
      v39.origin.y = 0.0;
      v39.size.width = v22;
      v39.size.height = v24;
      CGContextDrawImage(v18, v39, v20);
      -[CKImageTransparencyTrimmer trimmedFrame](self, "trimmedFrame");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v40.origin.x = 0.0;
      v40.origin.y = 0.0;
      v40.size.width = v22;
      v40.size.height = v24;
      v41.origin.x = v26;
      v41.origin.y = v28;
      v41.size.width = v30;
      v41.size.height = v32;
      if (!CGRectEqualToRect(v40, v41))
      {
        objc_msgSend(v6, "scale");
        v34 = v33;
        v38.width = v30;
        v38.height = v32;
        UIGraphicsBeginImageContextWithOptions(v38, 0, v34);
        objc_msgSend(v6, "drawAtPoint:", -v26, -v28);
        UIGraphicsGetImageFromCurrentImageContext();
        v35 = objc_claimAutoreleasedReturnValue();

        UIGraphicsEndImageContext();
        v6 = (id)v35;
      }
      if (v18)
        CGContextRelease(v18);
      -[CKImageTransparencyTrimmer setBitmap:](self, "setBitmap:", 0);
      -[CKImageTransparencyTrimmer setImage:](self, "setImage:", 0);
    }
    v36 = v6;

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (char)bitmap
{
  return self->_bitmap;
}

- (int)bitmapSize
{
  return self->_bitmapSize;
}

- (void)setBitmapSize:(int)a3
{
  self->_bitmapSize = a3;
}

- (int)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(int)a3
{
  self->_bytesPerRow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
