@implementation MRImageUtilities

+ (id)resizeImageData:(id)a3 forFittingSize:(CGSize)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  __CFData *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const __CFData *v19;
  uint64_t v20;
  uint64_t v21;
  CGImageSource *v22;
  double v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFDictionary *v29;
  __CFData *v30;
  CGImageDestination *v31;
  id v33;
  uint8_t buf[8];
  _QWORD v35[4];
  _QWORD v36[4];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _MRLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRImageUtilities] resizeImageData", buf, 2u);
  }

  v33 = 0;
  +[MRImageUtilities imageDimensionsForImageData:error:](MRImageUtilities, "imageDimensionsForImageData:error:", v6, &v33);
  v9 = v8;
  v11 = v10;
  v12 = v33;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    v16 = v15;
    v18 = v17;
    v19 = (const __CFData *)v6;
    v20 = *MEMORY[0x1E0CBD240];
    v37 = *MEMORY[0x1E0CBD240];
    v21 = MEMORY[0x1E0C9AAA0];
    v38[0] = MEMORY[0x1E0C9AAA0];
    v22 = CGImageSourceCreateWithData(v19, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1));
    if (v16 <= v18)
      v23 = v18;
    else
      v23 = v16;
    v24 = (uint64_t)v23;
    v25 = +[MRImageUtilities subsampleFactorForMaxPixelSize:imageSize:](MRImageUtilities, "subsampleFactorForMaxPixelSize:imageSize:", (uint64_t)v23, v9, v11);
    v36[0] = v21;
    v26 = *MEMORY[0x1E0CBD290];
    v35[0] = v20;
    v35[1] = v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v27;
    v35[2] = *MEMORY[0x1E0CBC778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = *MEMORY[0x1E0CBC780];
    v36[2] = v28;
    v36[3] = &unk_1E3143D18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
    v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v30 = (__CFData *)objc_opt_new();
    v31 = CGImageDestinationCreateWithData(v30, CFSTR("public.jpeg"), 1uLL, v29);
    CGImageDestinationAddImageFromSource(v31, v22, 0, v29);
    CGImageDestinationFinalize(v31);
    CFRelease(v22);
    CFRelease(v31);
    if (v30 && -[__CFData length](v30, "length"))
    {
      v14 = v30;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRImageUtilitiesError"), 3, CFSTR("Could not produce resized image data for source data."));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

+ (CGSize)imageDimensionsForImageData:(id)a3 error:(id *)a4
{
  void *v5;
  const __CFData *v6;
  CGImageSourceRef v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[2];
  CGSize result;

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0CBD240];
  v15[0] = MEMORY[0x1E0C9AAA0];
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = (const __CFData *)a3;
  v7 = CGImageSourceCreateWithData(v6, (CFDictionaryRef)objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));

  if (v7)
  {
    +[MRImageUtilities sizeFromSource:error:](MRImageUtilities, "sizeFromSource:error:", v7, a4);
    v9 = v8;
    v11 = v10;
    CFRelease(v7);
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRImageUtilitiesError"), 1, CFSTR("Provided data did not produce valid image source."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)sizeFromSource:(CGImageSource *)a3 error:(id *)a4
{
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[2];
  CGSize result;

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0CBD240];
  v15[0] = MEMORY[0x1E0C9AAA0];
  v5 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MRImageUtilitiesError"), 2, CFSTR("Could not decode image to obtain dimensions."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v10 = (double)objc_msgSend(v6, "integerValue");
    v11 = (double)objc_msgSend(v8, "integerValue");
  }

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4
{
  if (a4.width <= a4.height)
    a4.width = a4.height;
  return vcvtmd_s64_f64(a4.width / (double)a3);
}

@end
