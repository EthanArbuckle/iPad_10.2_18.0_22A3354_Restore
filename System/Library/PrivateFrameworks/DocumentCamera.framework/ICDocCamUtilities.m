@implementation ICDocCamUtilities

+ (void)prepareForRotationIfNecessaryWithShutterButton:(id)a3 coodinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  char v38;
  uint64_t v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD *v45;
  char v46;
  _QWORD v47[4];
  id v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  v9 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:coodinator:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

  if (!v8)
  {
LABEL_7:
    v17 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:coodinator:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "userInterfaceIdiom"))
  {

  }
  else
  {
    v26 = objc_msgSend(v8, "isAnimated");

    if (v26)
    {
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x3032000000;
      v61[3] = __Block_byref_object_copy__8;
      v61[4] = __Block_byref_object_dispose__8;
      v62 = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x3032000000;
      v59[3] = __Block_byref_object_copy__8;
      v59[4] = __Block_byref_object_dispose__8;
      v60 = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__8;
      v57[4] = __Block_byref_object_dispose__8;
      v58 = 0;
      objc_msgSend(v6, "window");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v37 = objc_msgSend(a1, "shouldPerformCustomAnimationForTransitionCoordinator:window:", v8, v27);
      v38 = v37;
      v39 = MEMORY[0x24BDAC760];
      if (v37)
      {
        v40 = (void *)MEMORY[0x24BDF6F90];
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke;
        v47[3] = &unk_24C5B9128;
        v52 = v30;
        v53 = v32;
        v54 = v34;
        v55 = v36;
        v49 = v57;
        v50 = v59;
        v51 = v61;
        v56 = a1;
        v48 = v6;
        objc_msgSend(v40, "performWithoutAnimation:", v47);

      }
      v42[0] = v39;
      v42[1] = 3221225472;
      v42[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_2;
      v42[3] = &unk_24C5B9150;
      v46 = v38;
      v43 = v6;
      v45 = v57;
      v41 = v27;
      v44 = v41;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v42);

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v59, 8);

      _Block_object_dispose(v61, 8);
    }
  }

}

uint64_t __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  ICDocCamNonRotatableViewController *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FF8]), "initWithFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_alloc_init(ICDocCamNonRotatableViewController);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(double *)(a1 + 64);
  v9 = *(double *)(a1 + 72);
  v10 = *(double *)(a1 + 80);
  v11 = *(double *)(a1 + 88);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRootViewController:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 96), "buttonFromCopyingValuesFromButton:", *(_QWORD *)(a1 + 32));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "makeKeyAndVisible");
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

void __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_2(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_3;
    v4[3] = &unk_24C5B7F00;
    v3 = *(_OWORD *)(a1 + 40);
    v2 = (id)v3;
    v5 = v3;
    dc_dispatchMainAfterDelay(v4, 0.0);

  }
}

uint64_t __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "makeKeyAndVisible");
}

+ (id)buttonFromCopyingValuesFromButton:(id)a3
{
  id v3;
  ICDocCamShutterButton *v4;
  ICDocCamShutterButton *v5;
  uint64_t v6;

  v3 = a3;
  v4 = [ICDocCamShutterButton alloc];
  objc_msgSend(v3, "frame");
  v5 = -[ICDocCamShutterButton initWithFrame:](v4, "initWithFrame:");
  -[ICDocCamShutterButton setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  v6 = objc_msgSend(v3, "isPseudoDisabled");

  -[ICDocCamShutterButton setPseudoDisabled:](v5, "setPseudoDisabled:", v6);
  return v5;
}

+ (BOOL)shouldPerformCustomAnimationForTransitionCoordinator:(id)a3 window:(id)a4
{
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  _BOOL4 v12;
  BOOL v13;
  unint64_t v14;
  BOOL v15;
  _OWORD v17[3];

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDF6750];
  v7 = a4;
  v8 = objc_msgSend(v6, "dc_isRTL");
  objc_msgSend(v7, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "interfaceOrientation");
  if (v5)
    objc_msgSend(v5, "targetTransform");
  else
    memset(v17, 0, sizeof(v17));
  v11 = DCTSDRotationFromTransform((uint64_t)v17);
  v12 = v11 != 1.57079633;
  if (fabs(v11 + -1.57079633) < 0.00000157079632)
    v12 = 0;
  if ((v8 | v12) != 1)
    goto LABEL_11;
  v13 = v11 != -1.57079633;
  if (fabs(v11 + 1.57079633) < 0.00000157079632)
    v13 = 0;
  if (!v8 || v13)
  {
    if (!v8)
      LOBYTE(v12) = v13;
    if (v12)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v14 = v10 - 3;
  }
  else
  {
LABEL_11:
    v14 = v10 - 1;
  }
  v15 = v14 < 2;
LABEL_13:

  return v15;
}

+ (CGSize)aspectFillSize:(CGSize)a3 targetSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v4 = a4.width / a3.width;
  v5 = a4.height / a3.height;
  if (v4 <= v5)
    v4 = v5;
  v6 = a3.width * v4;
  v7 = a3.height * v4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)aspectFitSize:(CGSize)a3 targetSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v4 = a4.width / a3.width;
  v5 = a4.height / a3.height;
  if (v4 >= v5)
    v4 = v5;
  v6 = a3.width * v4;
  v7 = a3.height * v4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 interpolationQuality:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v13;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = ((objc_msgSend(v9, "imageOrientation") - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
  +[ICDocCamUtilities transformForOrientation:newSize:](ICDocCamUtilities, "transformForOrientation:newSize:", v9, width, height);
  objc_msgSend(a1, "resizedImage:newSize:transform:drawTransposed:interpolationQuality:", v9, &v13, v10, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 transform:(CGAffineTransform *)a5 drawTransposed:(BOOL)a6 interpolationQuality:(int)a7
{
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  id v12;
  double x;
  double y;
  double v15;
  double v16;
  id v17;
  CGImage *v18;
  size_t BitsPerComponent;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGImage *Image;
  void *v29;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectIntegral(v32);
  x = v33.origin.x;
  y = v33.origin.y;
  v15 = v33.size.width;
  v16 = v33.size.height;
  v17 = objc_retainAutorelease(v12);
  v18 = (CGImage *)objc_msgSend(v17, "CGImage");

  BitsPerComponent = CGImageGetBitsPerComponent(v18);
  ColorSpace = CGImageGetColorSpace(v18);
  BitmapInfo = CGImageGetBitmapInfo(v18);
  v22 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, BitsPerComponent, 0, ColorSpace, BitmapInfo);
  v23 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v31.c = v23;
  *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
  CGContextConcatCTM(v22, &v31);
  CGContextSetInterpolationQuality(v22, (CGInterpolationQuality)a7);
  if (v8)
    v24 = v15;
  else
    v24 = v16;
  if (v8)
    v25 = v16;
  else
    v25 = v15;
  if (v8)
    v26 = 0.0;
  else
    v26 = x;
  if (v8)
    v27 = 0.0;
  else
    v27 = y;
  CGContextDrawImage(v22, *(CGRect *)(&v24 - 3), v18);
  Image = CGBitmapContextCreateImage(v22);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", Image);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v22);
  CGImageRelease(Image);
  return v29;
}

+ (CGAffineTransform)transformForOrientation:(SEL)a3 newSize:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform *result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v9 = MEMORY[0x24BDBD8B8];
  v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v28 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v27;
  v26 = *(_OWORD *)(v9 + 32);
  *(_OWORD *)&retstr->tx = v26;
  v10 = objc_msgSend(v8, "imageOrientation");
  if (v10 <= 7)
  {
    if (((1 << v10) & 0x22) != 0)
    {
      *(_OWORD *)&v30.a = v28;
      *(_OWORD *)&v30.c = v27;
      *(_OWORD *)&v30.tx = v26;
      CGAffineTransformTranslate(retstr, &v30, width, height);
      v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v14;
      *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
      v13 = 3.14159265;
    }
    else if (((1 << v10) & 0x44) != 0)
    {
      v15 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v30.c = v15;
      *(_OWORD *)&v30.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v30, width, 0.0);
      v16 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v16;
      *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
      v13 = 1.57079633;
    }
    else
    {
      if (((1 << v10) & 0x88) == 0)
        goto LABEL_9;
      v11 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v30.c = v11;
      *(_OWORD *)&v30.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v30, 0.0, height);
      v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v12;
      *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
      v13 = -1.57079633;
    }
    CGAffineTransformRotate(&v30, &v29, v13);
    v17 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v30.tx;
  }
LABEL_9:
  v18 = objc_msgSend(v8, "imageOrientation");
  if ((unint64_t)(v18 - 6) < 2)
  {
    v21 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v21;
    *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
    v20 = height;
    goto LABEL_13;
  }
  if ((unint64_t)(v18 - 4) <= 1)
  {
    v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v19;
    *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
    v20 = width;
LABEL_13:
    CGAffineTransformTranslate(&v30, &v29, v20, 0.0);
    v22 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v22;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v30.tx;
    v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v23;
    *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v30, &v29, -1.0, 1.0);
    v24 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v30.tx;
  }

  return result;
}

+ (void)prepareForRotationIfNecessaryWithShutterButton:(uint64_t)a3 coodinator:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

+ (void)prepareForRotationIfNecessaryWithShutterButton:(uint64_t)a3 coodinator:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

@end
