@implementation CNUICoreImageDerivedColorGenerator

+ (id)tintedUIColorsFromUIColors:(id)a3 isLight:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__CNUICoreImageDerivedColorGenerator_tintedUIColorsFromUIColors_isLight___block_invoke;
  v9[3] = &unk_1EA6041E8;
  v11 = a4;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

+ (unint64_t)colorArraySize
{
  return 5;
}

+ (id)defaultGrayColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.631372549, 0.643137255, 0.690196078, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.654901961, 0.666666667, 0.709803922, 1.0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.682352941, 0.694117647, 0.725490196, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.729411765, 0.733333333, 0.752941176, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.752941176, 0.756862745, 0.77254902, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __73__CNUICoreImageDerivedColorGenerator_tintedUIColorsFromUIColors_isLight___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(a2, "getRed:green:blue:alpha:", &v8, &v7, &v6, 0);
  v3 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v3 = 0.65;
  v7 = v3 + v7 * 0.35;
  v8 = v3 + v8 * 0.35;
  v6 = v3 + v6 * 0.35;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *(_QWORD *)&v6, *(_QWORD *)&v7, *(_QWORD *)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, 0);
  v10 = v10 * 1.6 / (v10 + 0.6);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

+ (id)colorsForUIImage:(id)a3
{
  id v4;
  CGImage *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "ioSurface"))
  {
    v5 = (CGImage *)UICreateCGImageFromIOSurface();
    objc_msgSend(a1, "colorsForImageRef:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v5);
  }
  else
  {
    objc_msgSend(a1, "colorsForImageRef:", objc_msgSend(objc_retainAutorelease(v4), "CGImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)colorsForImageRef:(CGImage *)a3
{
  size_t Width;
  size_t Height;
  double v7;
  uint64_t v8;
  char *v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  char *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  id v27;
  CGRect v29;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  if (Width && Height)
  {
    if ((double)Height <= 160.0)
      v7 = (double)Height;
    else
      v7 = 160.0;
    v8 = (unint64_t)v7;
    v9 = (char *)malloc_type_malloc(vcvtd_n_u64_f64(v7, 2uLL), 0x930010B0uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v11 = CGBitmapContextCreate(v9, 1uLL, (unint64_t)v7, 8uLL, 4uLL, DeviceRGB, 0x4001u);
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.width = 1.0;
    v29.size.height = v7;
    CGContextDrawImage(v11, v29, a3);
    CGContextRelease(v11);
    CGColorSpaceRelease(DeviceRGB);
    v12 = 0;
    if ((unint64_t)v7)
    {
      v13 = v9 + 3;
      while (!*(v13 - 3) && !*(v13 - 2) && !*(v13 - 1) || !*v13)
      {
        ++v12;
        v13 += 4;
        if (v8 == v12)
        {
          v12 = (unint64_t)v7;
          break;
        }
      }
      v14 = v8 - 1;
      if (v8 - 1 >= 1)
      {
        v15 = &v9[4 * v8 - 2];
        while (!*(v15 - 2) && !*(v15 - 1) && !*v15 || !v15[1])
        {
          --v8;
          v15 -= 4;
          if (v8 <= 1)
          {
            v14 = 0;
            goto LABEL_27;
          }
        }
        v14 = v8 - 1;
      }
    }
    else
    {
      v14 = -1;
    }
LABEL_27:
    v18 = (void *)objc_opt_new();
    if (v14 > v12)
    {
      v20 = 0.25;
      v19 = (double)(v14 - v12) * 0.25;
      v24 = vcvtpd_u64_f64(v19);
      v25 = &v9[4 * v12 + 3];
      do
      {
        LOBYTE(v19) = *(v25 - 3);
        LOBYTE(v20) = *(v25 - 2);
        LOBYTE(v21) = *(v25 - 1);
        LOBYTE(v22) = *v25;
        objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v22 / 255.0));
        v12 += v24;
        v25 += 4 * v24;
      }
      while (v12 < v14);
    }
    v26 = &v9[4 * v14];
    LOBYTE(v19) = *v26;
    LOBYTE(v20) = v26[1];
    LOBYTE(v21) = v26[2];
    LOBYTE(v23) = v26[3];
    objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v23 / 255.0));
    free(v9);
    if ((unint64_t)objc_msgSend(v18, "count") >= 5)
    {
      v27 = v18;
    }
    else
    {
      objc_msgSend(a1, "defaultGrayColors");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v27;

  }
  else
  {
    background_color_os_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[CNUICoreImageDerivedColorGenerator colorsForImageRef:].cold.1(v16);

    objc_msgSend(a1, "defaultGrayColors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

+ (id)scheduler
{
  if (scheduler_cn_once_token_378 != -1)
    dispatch_once(&scheduler_cn_once_token_378, &__block_literal_global_28);
  return (id)scheduler_cn_once_object_378;
}

void __47__CNUICoreImageDerivedColorGenerator_scheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D13B68], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.contacts.colorExtraction"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)scheduler_cn_once_object_378;
  scheduler_cn_once_object_378 = v0;

}

+ (void)fetchColorsForImage:(id)a3 ciContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(a1, "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke;
    v12[3] = &unk_1EA6041C0;
    v13 = v8;
    v14 = v9;
    v16 = a1;
    v15 = v10;
    objc_msgSend(v11, "performBlock:", v12);

  }
}

void __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  const void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  os_signpost_id_t spid;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  CGAffineTransform v65;
  CGAffineTransform buf;
  id v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hash");
  background_color_os_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v58 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD140000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CNImageDerivedColorFetchColors", ", (uint8_t *)&buf, 2u);
  }
  spid = v2;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "extent");
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v11 = (void *)objc_msgSend(v10, "initWithCIImage:options:", v5, MEMORY[0x1E0C9AA70]);
  v12 = (void *)objc_opt_new();
  v13 = (void *)MEMORY[0x1DF0D61B4](objc_msgSend(v12, "setRevision:", 2));
  v70[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v60 = v11;
  v15 = objc_msgSend(v11, "performRequests:error:", v14, &v67);
  v16 = v67;

  if (v16 || (v15 & 1) == 0)
  {
    background_color_os_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_cold_1((uint64_t)v16, v17);

  }
  objc_autoreleasePoolPop(v13);
  v59 = v12;
  objc_msgSend(v12, "results");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v19;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", objc_msgSend(v19, "pixelBuffer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extent");
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v7 / v21, v9 / v22);
  v65 = buf;
  v54 = v20;
  objc_msgSend(v20, "imageByApplyingTransform:", &v65);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "colorThresholdFilter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)v23;
  objc_msgSend(v24, "setInputImage:", v23);
  LODWORD(v25) = 0.5;
  objc_msgSend(v24, "setThreshold:", v25);
  objc_msgSend(v24, "outputImage");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "maskToAlphaFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v26;
  objc_msgSend(v27, "setInputImage:", v26);
  objc_msgSend(v27, "outputImage");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "sourceOutCompositingFilter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v5;
  objc_msgSend(v29, "setInputImage:", v5);
  v53 = (void *)v28;
  objc_msgSend(v29, "setBackgroundImage:", v28);
  objc_msgSend(v29, "outputImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1DF0D61B4]();
  v68[0] = CFSTR("inputWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = CFSTR("inputHeight");
  v69[0] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", CFSTR("CISmartGradient"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v31);
  objc_msgSend(v35, "extent");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = *(void **)(a1 + 40);
  if (v42)
  {
    v43 = v42;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "ciContextWithHighPriority:", 1);
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  v44 = v43;
  v45 = (const void *)objc_msgSend(v43, "createCGImage:fromRect:", v35, v37, v39, 8.0, v41);
  objc_msgSend((id)objc_opt_class(), "colorsForImageRef:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    CFRelease(v45);
  background_color_os_log();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    LOWORD(v65.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD140000, v48, OS_SIGNPOST_INTERVAL_END, spid, "CNImageDerivedColorFetchColors", ", (uint8_t *)&v65, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_40;
  v62[3] = &unk_1EA604198;
  v50 = *(id *)(a1 + 48);
  v63 = v46;
  v64 = v50;
  v51 = v46;
  objc_msgSend(v49, "performBlock:", v62);

}

uint64_t __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)ciContextWithHighPriority:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C9DD90];
  v4 = *MEMORY[0x1E0C9DF78];
  v11[0] = *MEMORY[0x1E0C9DF88];
  v11[1] = v4;
  v12[0] = CFSTR("CNUICoreImageDerivedColorGenerator");
  v12[1] = &unk_1EA61C3D0;
  v11[2] = *MEMORY[0x1E0C9DFA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9DF80];
  v12[2] = v5;
  v12[3] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0C9DF58];
  v11[3] = v6;
  v11[4] = v7;
  v12[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)defaultDarkGrayColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.156862745, 0.164705882, 0.2, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.184313725, 0.196078431, 0.231372549, 1.0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.219607843, 0.231372549, 0.258823529, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.258823529, 0.270588235, 0.298039216, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.301960784, 0.309803922, 0.329411765, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)colorsForImageRef:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD140000, log, OS_LOG_TYPE_DEBUG, "ImageRef for colors had size 0", v1, 2u);
}

void __90__CNUICoreImageDerivedColorGenerator_fetchColorsForImage_ciContext_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "Error performing VNGenerateObjectnessBasedSaliencyImageRequest in fetchColorsForImage: %@", (uint8_t *)&v2, 0xCu);
}

@end
