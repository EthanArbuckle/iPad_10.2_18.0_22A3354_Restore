@implementation PKImageCompare

+ (id)filterImage:(CGImage *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", a3);
  objc_msgSend(v3, "imageByApplyingGaussianBlurWithSigma:", 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ ($1D51C095076032EFA7EEE424D0344599)compareImage:(SEL)a3 toMasterImage:(CGImage *)a4 filename:(CGImage *)a5 differenceImageOutputPath:(id)a6 diffWhite:(id)a7 stdDevThreshhold:(BOOL)a8
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  double Width;
  double Height;
  double v21;
  double v22;
  void *v24;
  void *v25;
  BOOL v26;
  $1D51C095076032EFA7EEE424D0344599 *result;
  CGImageRef v28;
  CGImage *v29;
  int32x4_t v30;
  __int128 v31;
  __int128 v32;
  unsigned int v33;
  int64x2_t v34;
  __int128 v35;
  float64x2_t v36;
  __int128 v37;
  int32x4_t v38;
  int32x4_t v39;
  uint64_t v40;

  v10 = a8;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a6;
  v17 = a7;
  v18 = v16;
  if (!a5)
  {
    NSLog(CFSTR("No valid master image was passed"));
    if (a4)
      goto LABEL_10;
LABEL_9:
    NSLog(CFSTR("No valid test image was passed"));
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  v33 = 0;
  Width = (double)CGImageGetWidth(a5);
  Height = (double)CGImageGetHeight(a5);
  v21 = (double)CGImageGetWidth(a4);
  v22 = (double)CGImageGetHeight(a4);
  if (Width == v21 && Height == v22)
  {
    v28 = createDiffImageIfImageComparisonFails(a4, a5, v10, &v39, &v38, &v36, &v34, (int *)&v33, a9);
    v29 = v28;
    if (v33)
    {
      if (v33 == 2)
      {
        NSLog(CFSTR("Encountered error while trying to compare_images: The two images were empty!"));
      }
      else if (v33 == 1)
      {
        NSLog(CFSTR("Encountered error while trying to compare_images: The two images had different sizes!"));
      }
      else
      {
        NSLog(CFSTR("Encountered error (%d) while trying to compare_images."), v33);
      }
    }
    else
    {
      if (!v28)
      {
        NSLog(CFSTR("Images were identical."));
        v26 = 0;
        goto LABEL_23;
      }
      NSLog(CFSTR("\nMismatch exceeds threshold for image at index %ld: (RGBA):\n mean (sdev) = %.3g (%.3g), %.3g (%.3g), %.3g (%.3g), %.3g (%.3g)\n   min / max = %d/%d, %d/%d, %d/%d, %d/%d\n"), 0, *(_QWORD *)&v36.f64[0], v34.i64[0], *(_QWORD *)&v36.f64[1], v34.i64[1], (_QWORD)v37, (_QWORD)v35, *((_QWORD *)&v37 + 1), *((_QWORD *)&v35 + 1), v39.u32[0], v38.u32[0], v39.u32[1], v38.u32[1], v39.u32[2], v38.u32[2],
        v39.u32[3],
        v38.u32[3]);
      if (v17)
      {
        if (objc_msgSend(a2, "saveImage:toPath:", v29, v17))
          NSLog(CFSTR("Wrote diff image to path: %@"), v17);
        else
          NSLog(CFSTR("Error writing diff image to path: %@"), v17);
      }
    }
    v26 = 1;
LABEL_23:
    v30 = v38;
    *(int32x4_t *)retstr->var0 = v39;
    *(int32x4_t *)retstr->var1 = v30;
    v31 = v37;
    *(float64x2_t *)retstr->var2 = v36;
    *(_OWORD *)&retstr->var2[2] = v31;
    v32 = v35;
    *(int64x2_t *)retstr->var3 = v34;
    *(_OWORD *)&retstr->var3[2] = v32;
    retstr->var4 = v29;
    *(_QWORD *)&retstr->var5 = 0;
    goto LABEL_11;
  }
  +[PKImageCompare stringFromSize:](PKImageCompare, "stringFromSize:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKImageCompare stringFromSize:](PKImageCompare, "stringFromSize:", Width, Height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Image size mismatch for image at index %ld: actual: %@ expected: %@"), 0, v24, v25);

LABEL_10:
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)retstr->var1 = 0u;
  *(_OWORD *)retstr->var2 = xmmword_1BE4FF250;
  *(_OWORD *)&retstr->var2[2] = unk_1BE4FF260;
  *(_OWORD *)retstr->var3 = xmmword_1BE4FF250;
  *(_OWORD *)&retstr->var3[2] = unk_1BE4FF260;
  v26 = 1;
LABEL_11:
  retstr->var5 = v26;

  return result;
}

+ (BOOL)saveImage:(CGImage *)a3 toPath:(id)a4
{
  const __CFURL *v5;
  __CFString *v6;
  CGImageDestination *v7;
  CGImageMetadata *Mutable;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  BOOL v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a4);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

  if (!v7)
    return 0;
  Mutable = CGImageMetadataCreateMutable();
  v9 = (const __CFString *)*MEMORY[0x1E0CBD090];
  v10 = (const __CFString *)*MEMORY[0x1E0CBD0C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageMetadataSetValueMatchingImageProperty(Mutable, v9, v10, v11);

  v20[0] = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  v21[0] = v12;
  v18 = v20[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (Mutable)
  {
    CGImageDestinationAddImageAndMetadata(v7, a3, Mutable, v15);
    CFRelease(Mutable);
    v16 = CGImageDestinationFinalize(v7);
    CFRelease(v7);
  }
  else
  {
    NSLog(CFSTR("Error: invalid mutableImageMetadata"));
    v16 = 0;
  }

  return v16;
}

+ (id)stringFromSize:(CGSize)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f x %f"), *(_QWORD *)&a3.width, *(_QWORD *)&a3.height);
}

@end
