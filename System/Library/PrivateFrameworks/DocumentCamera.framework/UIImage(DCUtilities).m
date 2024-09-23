@implementation UIImage(DCUtilities)

- (uint64_t)dc_CGImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

- (uint64_t)dc_scaledImageMinDimension:()DCUtilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  return objc_msgSend(a1, "dc_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (uint64_t)dc_scaledImageMaxDimension:()DCUtilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  return objc_msgSend(a1, "dc_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (id)dc_scaledImageWithSize:()DCUtilities scale:
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  objc_msgSend(a1, "imageRendererFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScale:", a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v8, a2, a3);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__UIImage_DCUtilities__dc_scaledImageWithSize_scale___block_invoke;
  v12[3] = &unk_24C5B7EB8;
  v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  objc_msgSend(v9, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dc_orientedImageFromCGImage:()DCUtilities scale:transform:
{
  __int128 v8;
  __int128 v9;
  CGFloat v10;
  CGFloat v11;
  double Width;
  double Height;
  __int128 v14;
  CGFloat v15;
  double v16;
  double v17;
  double x;
  double y;
  CGContext *v20;
  CGContext *v21;
  __int128 v22;
  CGImage *Image;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CGAffineTransform v34;
  CGAffineTransform transform;
  CGRect v36;
  CGRect v37;

  v8 = a5[1];
  *(_OWORD *)&v34.a = *a5;
  *(_OWORD *)&v34.c = v8;
  *(_OWORD *)&v34.tx = a5[2];
  CGAffineTransformInvert(&transform, &v34);
  v9 = *(_OWORD *)&transform.c;
  *a5 = *(_OWORD *)&transform.a;
  a5[1] = v9;
  a5[2] = *(_OWORD *)&transform.tx;
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Width = (double)CGImageGetWidth(a4);
  Height = (double)CGImageGetHeight(a4);
  v14 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v14;
  *(_OWORD *)&transform.tx = a5[2];
  v15 = v10;
  *(CGFloat *)&v14 = v11;
  v16 = Width;
  v17 = Height;
  v36 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v14 - 8), &transform);
  x = v36.origin.x;
  y = v36.origin.y;
  v20 = DCTSUCreateRGBABitmapContext(0, v36.size.width, v36.size.height, a1);
  if (!v20)
    goto LABEL_4;
  v21 = v20;
  CGContextTranslateCTM(v20, -x, -y);
  v22 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v22;
  *(_OWORD *)&transform.tx = a5[2];
  CGContextConcatCTM(v21, &transform);
  v37.origin.x = v10;
  v37.origin.y = v11;
  v37.size.width = Width;
  v37.size.height = Height;
  CGContextDrawImage(v21, v37, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  if (!Image
    || (objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", Image, 0, a1),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        CGImageRelease(Image),
        !v24))
  {
LABEL_4:
    v25 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_orientedImageFromCGImage:scale:transform:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

+ (id)dc_orientedImageFromImage:()DCUtilities fromOrientation:
{
  CGImage *v5;
  double Width;
  size_t Height;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v5 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  Width = (double)CGImageGetWidth(v5);
  Height = CGImageGetHeight(v5);
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  DCTransformFromImageOrientation(a4, (uint64_t)&v10, Width, (double)Height);
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_orientedImageFromCGImage:scale:transform:", v5, v9, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dc_orientedImageFromImage:()DCUtilities toOrientation:
{
  CGImage *v5;
  double Width;
  size_t Height;
  void *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v5 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  Width = (double)CGImageGetWidth(v5);
  Height = CGImageGetHeight(v5);
  memset(&v12, 0, sizeof(v12));
  DCTransformFromImageOrientation(a4, (uint64_t)&v12, Width, (double)Height);
  v8 = (void *)MEMORY[0x24BDF6AC8];
  v10 = v12;
  CGAffineTransformInvert(&v11, &v10);
  objc_msgSend(v8, "dc_orientedImageFromCGImage:scale:transform:", v5, &v11, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dc_orientationMetadataFromImageOrientation:()DCUtilities
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) > 6)
    v3 = 1;
  else
    v3 = dword_20CF1B010[a3 - 1];
  v7 = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)dc_JPEGData
{
  return objc_msgSend(a1, "dc_JPEGDataWithOrientation:", objc_msgSend(a1, "imageOrientation"));
}

- (id)dc_JPEGDataWithOrientation:()DCUtilities
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *MEMORY[0x24BDC17C0];
  objc_msgSend((id)objc_opt_class(), "dc_orientationMetadataFromImageOrientation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dc_imageDataWithUTType:metadata:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dc_imageDataWithUTType:()DCUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC17C0]))
  {
    objc_msgSend((id)objc_opt_class(), "dc_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "imageOrientation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(a1, "dc_imageDataWithUTType:metadata:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dc_imageDataWithUTType:()DCUtilities metadata:
{
  __CFString *v6;
  const __CFDictionary *v7;
  __CFData *v8;
  CGImageDestination *v9;
  CGImageDestination *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v6 = a3;
  v7 = a4;
  v8 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v9 = CGImageDestinationCreateWithData(v8, v6, 1uLL, 0);
  if (!v9)
  {
    v12 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_10;
  }
  v10 = v9;
  CGImageDestinationAddImage(v9, (CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"), v7);
  if (!CGImageDestinationFinalize(v10))
  {
    v20 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:].cold.2((uint64_t)v6, v20);

    CFRelease(v10);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  CFRelease(v10);
  v11 = (void *)-[__CFData copy](v8, "copy");
LABEL_11:

  return v11;
}

+ (double)dc_aspectFitImageFrameForViewWithFrame:()DCUtilities imageSize:
{
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  double v15;
  float v16;
  double v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v11 = 0;
  v12 = 0;
  v13 = CGRectGetWidth(*(CGRect *)(&a3 - 2)) / a5;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = a3;
  v19.size.height = a4;
  v14 = CGRectGetHeight(v19) / a6;
  v15 = a5 * fminf(v13, v14);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = a3;
  v20.size.height = a4;
  v16 = (CGRectGetWidth(v20) - v15) * 0.5;
  v17 = roundf(v16);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectGetHeight(v21);
  return a1 + v17;
}

+ (uint64_t)dc_largeSystemImageNamed:()DCUtilities
{
  return objc_msgSend(a1, "dc_systemImageNamed:scale:", a3, 3);
}

+ (id)dc_systemImageNamed:()DCUtilities textStyle:
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a1, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dc_imageWithTextStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return v8;
}

+ (id)dc_systemImageNamed:()DCUtilities textStyle:scale:
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a4;
  objc_msgSend(a1, "systemImageNamed:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dc_imageWithTextStyle:scale:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v10;
}

+ (id)dc_systemImageNamed:()DCUtilities fromFont:
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a1, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dc_imageWithFont:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return v8;
}

+ (id)dc_systemImageNamed:()DCUtilities scale:
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "systemImageNamed:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dc_imageWithScale:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

+ (id)dc_systemImageNamed:()DCUtilities fromFont:scale:
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a4;
  objc_msgSend(a1, "systemImageNamed:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dc_imageWithFont:scale:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v10;
}

- (id)dc_imageWithScale:()DCUtilities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dc_imageWithFont:()DCUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a1;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithSymbolConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  else
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UIImage(DCUtilities) dc_imageWithFont:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v4;
}

- (id)dc_imageWithFont:()DCUtilities scale:
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a1;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithSymbolConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  else
  {
    v9 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[UIImage(DCUtilities) dc_imageWithFont:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return v6;
}

- (id)dc_imageWithTextStyle:()DCUtilities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dc_imageWithTextStyle:()DCUtilities scale:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)dc_orientedImageFromCGImage:()DCUtilities scale:transform:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", a5, a6, a7, a8, 0);
}

- (void)dc_imageDataWithUTType:()DCUtilities metadata:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "Failed to create CGImageDestinationRef", a5, a6, a7, a8, 0);
}

- (void)dc_imageDataWithUTType:()DCUtilities metadata:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)dc_systemImageNamed:()DCUtilities textStyle:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dc_imageWithFont:()DCUtilities .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
