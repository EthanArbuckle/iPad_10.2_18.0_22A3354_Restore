@implementation CAMAspectCropUtilities

+ (CGRect)cropRectForAspectRatio:(int64_t)a3 inImageBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!CGRectIsEmpty(a4))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectIsNull(v17))
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      if (!CGRectIsInfinite(v18))
      {
        if (a3)
        {
          UIRoundToScale();
          UIRoundToScale();
          UIRectCenteredIntegralRect();
          x = v9;
          y = v10;
          width = v11;
          height = v12;
        }
      }
    }
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)cropFilterForAspectRatio:(int64_t)a3 imageSize:(CGSize)a4
{
  uint64_t v4;
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
  long double v15;
  CGFloat width;
  uint64_t v17;
  double v18;
  CGFloat height;
  void *v20;
  void *v21;
  double v23;
  CGRect v25;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a3, *MEMORY[0x1E0C9D538], v5, a4.width, a4.height);
  v7 = v6;
  v23 = v8;
  v10 = v9;
  v12 = v11;
  v13 = round(v9);
  v14 = round(v11);
  if (fmod(v13, 2.0) != 0.0)
    v10 = v13 + -1.0;
  v15 = fmod(v14, 2.0);
  width = a4.width;
  if (v15 != 0.0)
    v12 = v14 + -1.0;
  v25.origin.x = v7;
  v25.origin.y = v23;
  v25.size.width = v10;
  v25.size.height = v12;
  v17 = v4;
  v18 = v5;
  height = a4.height;
  if (CGRectEqualToRect(v25, *(CGRect *)(&width - 2)))
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v7, v23, v10, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("inputRectangle"));

  }
  return v20;
}

+ (CGSize)finalExpectedSizeWithPhotoMetadata:(id)a3 aspectRatio:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v6 = CAMSizeForPhotoMetadata(a3);
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a4, 0.0, 0.0, v6, v7);
  v9 = v8;
  v11 = v10;
  result.height = v11;
  result.width = v9;
  return result;
}

+ (CGSize)finalExpectedSizeWithCaptureDimensions:(id)a3 orientation:(int)a4 aspectRatio:(int64_t)a5
{
  double var0;
  double var1;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  var0 = (double)a3.var0;
  var1 = (double)a3.var1;
  v9 = PLIsRotatedExifOrientation();
  if (v9)
    v10 = var1;
  else
    v10 = var0;
  if (v9)
    v11 = var0;
  else
    v11 = var1;
  objc_msgSend(a1, "cropRectForAspectRatio:inImageBounds:", a5, 0.0, 0.0, v10, v11);
  v13 = v12;
  v15 = v14;
  result.height = v15;
  result.width = v13;
  return result;
}

@end
