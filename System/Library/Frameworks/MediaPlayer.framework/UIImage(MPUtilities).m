@implementation UIImage(MPUtilities)

- (uint64_t)initWithContentsOfExactFilePath:()MPUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int16 *v10;
  BOOL v11;
  uint64_t v12;
  const __CFDictionary *v13;
  CGImageSource *v14;
  CGImageSource *v15;
  CGImage *ImageAtIndex;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (initWithContentsOfExactFilePath__onceToken != -1)
      dispatch_once(&initWithContentsOfExactFilePath__onceToken, &__block_literal_global_350);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (initWithContentsOfExactFilePath__deviceSupportsASTC)
      {
        v9 = objc_retainAutorelease(v7);
        v10 = (unsigned __int16 *)objc_msgSend(v9, "bytes");
        if ((unint64_t)objc_msgSend(v9, "length") < 4
          || (*v10 == 55551 ? (v11 = *((unsigned __int8 *)v10 + 2) == 255) : (v11 = 0), !v11))
        {
          v12 = *MEMORY[0x1E0CBD288];
          v24[0] = *MEMORY[0x1E0CBD240];
          v24[1] = v12;
          v25[0] = MEMORY[0x1E0C9AAA0];
          v25[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v14 = CGImageSourceCreateWithData((CFDataRef)v9, v13);
          if (v14)
          {
            v15 = v14;
            if (CGImageSourceGetCount(v14))
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, v13);
            else
              ImageAtIndex = 0;
            CFRelease(v15);
          }
          else
          {
            ImageAtIndex = 0;
          }
          v17 = (void *)objc_msgSend(a1, "initWithCGImage:", ImageAtIndex);
          CGImageRelease(ImageAtIndex);

          goto LABEL_23;
        }
        v18 = *MEMORY[0x1E0C9D820];
        v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v20 = 1.0;
        v21 = a1;
        v22 = v9;
      }
      else
      {
        v18 = *MEMORY[0x1E0C9D820];
        v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v20 = 1.0;
        v21 = a1;
        v22 = v8;
      }
      v17 = (void *)objc_msgSend(v21, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v22, 0, 0, v18, v19, v20);
    }
    else
    {

      v17 = 0;
    }
LABEL_23:
    a1 = v17;

    v6 = (uint64_t)a1;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v6;
}

- (id)imageWithEtchedBorderOfColor:()MPUtilities radius:
{
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  objc_msgSend(a1, "size");
  v9 = v8 + a2 * 2.0;
  v10 = a2 <= 0.0;
  if (a2 <= 0.0)
    v11 = v7;
  else
    v11 = v7 + a2 * 2.0;
  if (v10)
    v12 = v8;
  else
    v12 = v9;
  objc_msgSend(a1, "scale");
  v14 = v13;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__UIImage_MPUtilities__imageWithEtchedBorderOfColor_radius___block_invoke;
  v18[3] = &unk_1E3152F90;
  v18[4] = a1;
  v19 = v6;
  v15 = v6;
  MPCreateImageWithDrawing(v18, v11, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)imageWithShadow:()MPUtilities
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
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
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v4, "shadowOffset");
  v7 = v6;
  v9 = v8;
  v10 = -v8;
  objc_msgSend(v4, "shadowBlurRadius");
  v12 = v11;
  objc_msgSend(v5, "scale");
  v14 = v13;
  objc_msgSend(v5, "size");
  v17 = v16 + v12 * 2.0;
  v18 = fabs(v9);
  if (v9 <= 0.0)
    v18 = 0.0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__UIImage_MPUtilities__imageWithShadow___block_invoke;
  v24[3] = &unk_1E3152FB8;
  v27 = v12;
  v28 = v14;
  v19 = v15 + v18 + v12 * 2.0;
  v29 = v7;
  v30 = v10;
  v25 = v4;
  v26 = v5;
  v20 = v5;
  v21 = v4;
  MPCreateImageWithDrawing(v24, v17, v19, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)imageWithRoundedCornersOfRadius:()MPUtilities
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v4 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "size");
  v5 = (void *)objc_msgSend(v4, "initWithSize:");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__UIImage_MPUtilities__imageWithRoundedCornersOfRadius___block_invoke;
  v8[3] = &unk_1E3152FE0;
  v8[4] = a1;
  *(double *)&v8[5] = a2;
  objc_msgSend(v5, "imageWithActions:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
