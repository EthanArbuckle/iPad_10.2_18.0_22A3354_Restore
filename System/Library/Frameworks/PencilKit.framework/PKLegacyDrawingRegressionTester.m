@implementation PKLegacyDrawingRegressionTester

+ (double)maxStdDevErrorFromResult:(id *)a3
{
  uint64_t v3;
  double result;

  v3 = 0;
  result = 0.0;
  do
  {
    if (result < a3->var3[v3])
      result = a3->var3[v3];
    ++v3;
  }
  while (v3 != 4);
  return result;
}

+ (CGImage)createFilteredImageFromImage:(id)a3 context:(id)a4 filterRadius:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGImage *v12;

  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = objc_msgSend(v7, "CGImage");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", v9);
  objc_msgSend(v10, "imageByApplyingGaussianBlurWithSigma:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  v12 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v11);

  return v12;
}

+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4
{
  double result;

  objc_msgSend(a1, "compareLegacyDrawingImage:toConvertedDrawing:debugImagesDirectory:", a3, a4, 0);
  return result;
}

+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4 debugImagesDirectory:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGImage *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  CGImage *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  dispatch_semaphore_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  char v42;
  CGImage *v43;
  CGImage *v44;
  double v45;
  double v46;
  id v48;
  PKImageRenderer *v50;
  id v51;
  id v52;
  CGAffineTransform v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CGAffineTransform v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGImageRef image[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  CGAffineTransform v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v52 = a4;
  v48 = a5;
  objc_msgSend(v7, "size");
  v9 = v8 * 0.0009765625;
  v10 = floor(v8 * 0.0009765625);
  v51 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
  if (v10 < v9 + -0.001)
  {
    v11 = (void *)MEMORY[0x1C3B7FBFC]();
    memset(&v58, 0, sizeof(v58));
    v12 = v10 / v9;
    CGAffineTransformMakeScale(&v58, v12, v12);
    v13 = (void *)MEMORY[0x1E0C9DDC8];
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v13, "imageWithCGImage:", objc_msgSend(v14, "CGImage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v58;
    objc_msgSend(v15, "imageByApplyingTransform:", &v53);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "size");
    v18 = v17;
    objc_msgSend(v14, "size");
    v20 = (CGImage *)objc_msgSend(v51, "createCGImage:fromRect:", v16, 0.0, 0.0, v12 * v18, v12 * v19);
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v20);

    CGImageRelease(v20);
    objc_autoreleasePoolPop(v11);
    v9 = v10;
  }
  memset(&v76, 0, sizeof(v76));
  objc_msgSend(v7, "size");
  if (v52)
    objc_msgSend(v52, "_transformForImageWithSize:");
  else
    memset(&v76, 0, sizeof(v76));
  v58 = v76;
  if (!CGAffineTransformIsIdentity(&v58) || v10 < v9)
  {
    v21 = (void *)MEMORY[0x1C3B7FBFC]();
    v22 = (void *)MEMORY[0x1E0C9DDC8];
    v23 = objc_retainAutorelease(v7);
    objc_msgSend(v22, "imageWithCGImage:", objc_msgSend(v23, "CGImage"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v76;
    objc_msgSend(v24, "imageByApplyingTransform:", &v58);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "_orientedDrawingSize");
    v28 = (CGImage *)objc_msgSend(v51, "createCGImage:fromRect:", v25, 0.0, 0.0, floor(v9 * v26), floor(v9 * v27));
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v28);

    CGImageRelease(v28);
    objc_autoreleasePoolPop(v21);
  }
  objc_msgSend(v7, "size");
  v30 = v29;
  objc_msgSend(v52, "_orientedDrawingSize");
  v50 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", v31, v32, v30 / v31);
  v33 = dispatch_semaphore_create(0);
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__37;
  v74 = __Block_byref_object_dispose__37;
  v75 = 0;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __101__PKLegacyDrawingRegressionTester_compareLegacyDrawingImage_toConvertedDrawing_debugImagesDirectory___block_invoke;
  v67[3] = &unk_1E7779240;
  v69 = &v70;
  v34 = v33;
  v68 = v34;
  -[PKImageRenderer renderDrawing:completion:](v50, "renderDrawing:completion:", v52, v67);
  dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v52, "strokes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
  v37 = 4.0;
  if (v36)
  {
    v38 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v64 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "ink");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.ink.pencil"));

        if ((v42 & 1) != 0)
        {
          v37 = 5.0;
          goto LABEL_19;
        }
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      if (v36)
        continue;
      break;
    }
  }
LABEL_19:

  v43 = (CGImage *)objc_msgSend(a1, "createFilteredImageFromImage:context:filterRadius:", v7, v51, v37);
  v44 = (CGImage *)objc_msgSend(a1, "createFilteredImageFromImage:context:filterRadius:", v71[5], v51, v37);
  v61 = 0u;
  *(_OWORD *)image = 0u;
  v59 = 0u;
  v60 = 0u;
  memset(&v58, 0, sizeof(v58));
  +[PKImageCompare compareImage:toMasterImage:filename:differenceImageOutputPath:diffWhite:stdDevThreshhold:](PKImageCompare, "compareImage:toMasterImage:filename:differenceImageOutputPath:diffWhite:stdDevThreshhold:", v44, v43, 0, 0, 1, 0.0);
  if (image[0])
    CGImageRelease(image[0]);
  CGImageRelease(v43);
  CGImageRelease(v44);
  v55 = v60;
  v56 = v61;
  v57 = *(_OWORD *)image;
  v53 = v58;
  v54 = v59;
  objc_msgSend(a1, "maxStdDevErrorFromResult:", &v53);
  v46 = v45;

  _Block_object_dispose(&v70, 8);
  return v46;
}

void __101__PKLegacyDrawingRegressionTester_compareLegacyDrawingImage_toConvertedDrawing_debugImagesDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (double)compareImage:(CGImage *)a3 with:(CGImage *)a4 drawing:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  CGImage *v21;
  void *v22;
  CGImage *v23;
  double v24;
  double v25;
  CGImage *v27;
  CGImage *v28;
  _OWORD v29[7];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGImageRef image[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v8, "strokes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    v12 = 4.0;
    if (v11)
    {
      v13 = v11;
      v27 = a3;
      v28 = a4;
      v14 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "ink", v27, v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.ink.pencil"));

          if ((v18 & 1) != 0)
          {
            v12 = 5.0;
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v13)
          continue;
        break;
      }
LABEL_12:
      a3 = v27;
      a4 = v28;
    }

  }
  else
  {
    v12 = 4.0;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (CGImage *)objc_msgSend(a1, "createFilteredImageFromImage:context:filterRadius:", v20, v19, v12);

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (CGImage *)objc_msgSend(a1, "createFilteredImageFromImage:context:filterRadius:", v22, v19, v12);

  v35 = 0u;
  *(_OWORD *)image = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  +[PKImageCompare compareImage:toMasterImage:filename:differenceImageOutputPath:diffWhite:stdDevThreshhold:](PKImageCompare, "compareImage:toMasterImage:filename:differenceImageOutputPath:diffWhite:stdDevThreshhold:", v23, v21, 0, 0, 1, 0.0);
  CGImageRelease(v21);
  CGImageRelease(v23);
  v29[4] = v34;
  v29[5] = v35;
  v29[6] = *(_OWORD *)image;
  v29[0] = v30;
  v29[1] = v31;
  v29[2] = v32;
  v29[3] = v33;
  objc_msgSend(a1, "maxStdDevErrorFromResult:", v29);
  v25 = v24;

  return v25;
}

+ (id)regressionTestDrawingPathForFile:(id)a3 forClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (v11)
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("drawing"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)regressionTestImagePathForFile:(id)a3 forClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("RegressionTestImages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "stringByAppendingPathExtension:", CFSTR("png"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("png"));
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return v10;
}

@end
