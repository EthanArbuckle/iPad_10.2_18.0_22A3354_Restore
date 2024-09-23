@implementation UIImage(AppleAccountUI)

+ (id)aaui_imageFromColor:()AppleAccountUI
{
  id v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v3 = a3;
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContext(v6);
  objc_msgSend(v3, "set");

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v4;
}

- (id)imageByCroppingToRect:()AppleAccountUI
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "_cropRectForRawImageOrientation:");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = objc_retainAutorelease(a1);
  if (objc_msgSend(v10, "CGImage"))
  {
    objc_msgSend(v10, "_imageByCroppingCGImageToRect:", v3, v5, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "CIImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "_imageByCroppingCIImageToRect:", v3, v5, v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (id)_imageByCroppingCGImageToRect:()AppleAccountUI
{
  id v9;
  CGImage *v10;
  CGImage *v11;
  void *v12;
  double v13;
  void *v14;
  CGRect v16;

  v9 = objc_retainAutorelease(a1);
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  v11 = CGImageCreateWithImageInRect(v10, v16);
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v9, "scale");
  objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v9, "imageOrientation"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v11);
  return v14;
}

- (id)_imageByCroppingCIImageToRect:()AppleAccountUI
{
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  objc_msgSend(a1, "CIImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByCroppingToRect:", a2, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "scale");
  objc_msgSend(v12, "imageWithCIImage:scale:orientation:", v11, objc_msgSend(a1, "imageOrientation"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_cropRectForRawImageOrientation:()AppleAccountUI
{
  unint64_t v10;
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
  double v23;
  double v24;
  double v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;

  *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v26.c = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v29.c = *(_OWORD *)&v26.c;
  *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v29.tx = *(_OWORD *)&v26.tx;
  v10 = objc_msgSend(a1, "imageOrientation");
  if (v10 <= 7)
  {
    if (((1 << v10) & 0x22) != 0)
    {
      v28 = v26;
      CGAffineTransformRotate(&v29, &v28, 3.14159265);
      objc_msgSend(a1, "size");
      v17 = v16;
      objc_msgSend(a1, "scale");
      v19 = -(v17 * v18);
      objc_msgSend(a1, "size");
      v21 = v20;
      objc_msgSend(a1, "scale");
      v15 = -(v21 * v22);
      v27 = v29;
      v14 = v19;
      goto LABEL_8;
    }
    if (((1 << v10) & 0x44) != 0)
    {
      v28 = v26;
      CGAffineTransformRotate(&v29, &v28, 1.57079633);
      objc_msgSend(a1, "size");
      v24 = v23;
      objc_msgSend(a1, "scale");
      v15 = -(v24 * v25);
      v27 = v29;
      v14 = 0.0;
      goto LABEL_8;
    }
    if (((1 << v10) & 0x88) != 0)
    {
      v28 = v26;
      CGAffineTransformRotate(&v29, &v28, -1.57079633);
      objc_msgSend(a1, "size");
      v12 = v11;
      objc_msgSend(a1, "scale");
      v14 = -(v12 * v13);
      v27 = v29;
      v15 = 0.0;
LABEL_8:
      CGAffineTransformTranslate(&v28, &v27, v14, v15);
      v29 = v28;
    }
  }
  v28 = v29;
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  CGRectApplyAffineTransform(v30, &v28);
}

+ (id)circularImageForBundleID:()AppleAccountUI size:scale:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x1E0D3A820];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithBundleIdentifier:", v9);

  objc_msgSend(a1, "_circularImageFromIcon:size:scale:", v10, a2, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_circularImageFromIcon:()AppleAccountUI size:scale:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (objc_class *)MEMORY[0x1E0D3A830];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithSize:scale:", a2, a2, a3);
  objc_msgSend(v9, "prepareImageForDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "circularImageFromCGImage:size:scale:", objc_msgSend(v11, "CGImage"), a2, a2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)circularImageFromCGImage:()AppleAccountUI size:scale:
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a1, a2);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", a6, 0, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__UIImage_AppleAccountUI__circularImageFromCGImage_size_scale___block_invoke;
  v16[3] = &unk_1EA2DC180;
  v18 = a1;
  v19 = a2;
  v17 = v11;
  v12 = v11;
  objc_msgSend(v10, "imageWithActions:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[UIImage(AppleAccountUI) circularImageFromCGImage:size:scale:].cold.1(v14);

  }
  return v13;
}

+ (uint64_t)addBackgroundForImage:()AppleAccountUI withBackgroundColor:
{
  return objc_msgSend(a1, "addBackgroundForImage:withBackgroundColor:yShift:", 0.0);
}

+ (id)addBackgroundForImage:()AppleAccountUI withBackgroundColor:yShift:
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v24;
  id v25;
  void *v26;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "size");
  v10 = (29.0 - v9) * 0.5;
  objc_msgSend(v7, "size");
  v12 = (29.0 - v11) * 0.5;
  objc_msgSend(v7, "size");
  v14 = v13;
  objc_msgSend(v7, "size");
  v16 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 29.0, 29.0);
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke;
  v34[3] = &unk_1EA2DC1A8;
  v37 = 0;
  v38 = 0;
  __asm { FMOV            V0.2D, #29.0 }
  v28 = _Q0;
  v39 = _Q0;
  v35 = v8;
  v36 = v7;
  v40 = a1;
  v41 = v10;
  v42 = v12;
  v43 = v14;
  v44 = v16;
  v24 = v7;
  v25 = v8;
  objc_msgSend(v17, "imageWithActions:", v34);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke_2;
  v29[3] = &unk_1EA2DB460;
  v31 = 0;
  v32 = 0;
  v33 = v28;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithActions:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (void)circularImageFromCGImage:()AppleAccountUI size:scale:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[UIImage(AppleAccountUI) circularImageFromCGImage:size:scale:]";
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "%s Couldn't create circular image", (uint8_t *)&v1, 0xCu);
}

@end
