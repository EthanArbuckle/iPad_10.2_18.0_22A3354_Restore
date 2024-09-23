@implementation CALayer(BalloonLayerExtension)

+ (double)maxInsetForImage:()BalloonLayerExtension
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "capInsets");
  return fmax(fmax(v3, v4), fmax(v5, v6));
}

+ (double)extraInsetsForImage:()BalloonLayerExtension
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "capInsets");
  v6 = v5;
  objc_msgSend(a1, "maxInsetForImage:", v4);
  v8 = v7;

  return v6 - v8;
}

+ (double)boundsForMaskImage:()BalloonLayerExtension withOriginalSize:
{
  double v1;

  objc_msgSend(a1, "extraInsetsForImage:");
  return v1;
}

- (void)setMaskImage:()BalloonLayerExtension
{
  id v4;
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
  id v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD27A8], "maxInsetForImage:", v4);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CD27A8], "extraInsetsForImage:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "size");
  v16 = v15 - (v10 + v14);
  v18 = v17 - (v8 + v12);
  if (v10 == *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    && v8 == *MEMORY[0x1E0CEB4B0]
    && v14 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    && v12 == *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    v22 = v4;
  }
  else
  {
    objc_getAssociatedObject(v4, (const void *)setMaskImage__normalizedImageKey);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0CEA618]);
      objc_msgSend(v4, "scale");
      objc_msgSend(v23, "setScale:");
      objc_msgSend(v23, "setPreferredRange:", 32766);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v23, v16, v18);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __47__CALayer_BalloonLayerExtension__setMaskImage___block_invoke;
      v30[3] = &unk_1E2751E98;
      v25 = v4;
      v31 = v25;
      v32 = v8;
      v33 = v10;
      v34 = v12;
      v35 = v14;
      objc_msgSend(v24, "imageWithActions:", v30);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v25, (const void *)setMaskImage__normalizedImageKey, v22, (void *)1);

    }
  }
  if (v16 == 0.0 || v18 == 0.0)
  {
    IMLogHandleForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CALayer(BalloonLayerExtension) setMaskImage:].cold.1(v28, v16, v18);

    v26 = 0.0;
    v27 = 0.0;
  }
  else
  {
    v26 = v6 / v16;
    v27 = v6 / v18;
  }
  objc_msgSend(a1, "setMasksToBounds:", 1);
  objc_msgSend(a1, "setCornerContentsMasksEdges:", 1);
  v29 = objc_retainAutorelease(v22);
  objc_msgSend(a1, "setCornerContents:", objc_msgSend(v29, "CGImage"));
  objc_msgSend(a1, "setCornerContentsCenter:", v26, v27, v26 * -2.0 + 1.0, v27 * -2.0 + 1.0);
  objc_msgSend(a1, "setCornerRadius:", v6);

}

- (void)setMaskImage:()BalloonLayerExtension .cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_18DFCD000, a1, OS_LOG_TYPE_ERROR, "normalizedSize had a zero dimension. Would have attempted divide by zero. normalizedSize: %@", (uint8_t *)&v5, 0xCu);

}

@end
