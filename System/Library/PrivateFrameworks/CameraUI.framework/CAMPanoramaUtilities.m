@implementation CAMPanoramaUtilities

+ (CGSize)defaultPreviewSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  objc_msgSend(a1, "bufferSize");
  objc_msgSend(a1, "previewStripSizeForCaptureSize:referenceBounds:layoutStyle:", v5);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)previewStripSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  objc_msgSend(a1, "panoramaViewPreviewStripInsetsForLayoutStyle:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(a1, "panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:", a5, x, y, width, height);
  v19 = width - v14 - v16 - v17 - v18;
  v20 = floor(v10 / v11 * v19);
  result.height = v20;
  result.width = v19;
  return result;
}

+ (CGSize)panoramaViewSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double width;
  double height;
  CGSize result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  objc_msgSend(a1, "panoramaViewPreviewStripInsetsForLayoutStyle:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "previewStripSizeForCaptureSize:referenceBounds:layoutStyle:", a5, v9, v8, x, y, width, height);
  v20 = v18 + v14 + v19;
  v22 = v16 + v12 + v21;
  result.height = v22;
  result.width = v20;
  return result;
}

+ (UIEdgeInsets)panoramaViewLayoutInsetsForLayoutStyle:(int64_t)a3 referenceBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _OWORD v14[2];
  uint64_t v15;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if (a3 == 1)
  {
    v6 = dbl_1DB9A70E0[a4.size.width < 1024.0];
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    CAMShutterButtonSpecForLayoutStyle(1, (uint64_t)v14);
    v7 = *(double *)v14;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", 3, 0, 0, 0);

    v10 = v6 + v7 * 0.5;
    if (v9)
      v11 = v6 + v7 * 0.5;
    else
      v11 = 30.0;
  }
  else
  {
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v12 = v4;
  v13 = v5;
  result.right = v10;
  result.bottom = v13;
  result.left = v11;
  result.top = v12;
  return result;
}

+ (UIEdgeInsets)panoramaViewPreviewStripInsetsForLayoutStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if ((unint64_t)a3 <= 4 && ((0x17u >> a3) & 1) != 0)
  {
    v6 = dbl_1DB9A70F0[a3];
    v5 = 2.0;
    v4 = v6;
    v3 = 2.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)bufferSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[CAMPanoramaConfiguration sharedInstance](CAMPanoramaConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "maxWidth");
  v4 = (double)objc_msgSend(v2, "sampleBufferWidth");

  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)singlePreviewFrameWidthForPreviewHeight:(double)a3
{
  return ceil(a3 * 3.0 * 0.25);
}

@end
