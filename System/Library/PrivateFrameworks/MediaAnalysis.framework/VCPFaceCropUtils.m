@implementation VCPFaceCropUtils

+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3
{
  id v3;
  void *v4;
  CGImageMetadata *Mutable;
  void *v6;
  void *v7;
  const __CFString *v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1BCCA1B2C]();
  Mutable = CGImageMetadataCreateMutable();
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("tiff:Orientation"), CFSTR("1")))
  {
    v9 = CFSTR("Could not set output orientation");
    goto LABEL_9;
  }
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("com.apple/PhotoVision/FaceCrop/"), CFSTR("PVFC"), 0))
  {
    v9 = CFSTR("Could not register face crop namespace");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not generate serialized metadata representation"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  if (!v7)
  {
    v12 = CFSTR("Could not convert metadata representation into serialized format");
    goto LABEL_13;
  }
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("PVFC:PVFC"), v7))
  {
    v12 = CFSTR("Could not set face crop metadata");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }

  objc_autoreleasePoolPop(v4);
  return Mutable;
}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  const __CFData *v3;
  void *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  const CGImageMetadata *v7;
  const CGImageMetadata *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  id v17;

  v3 = (const __CFData *)a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1BCCA1B2C]();
    v5 = CGImageSourceCreateWithData(v3, 0);
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create image source"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("No meta data exists on image"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, CFSTR("PVFC:PVFC"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0CB36D8];
      -[__CFString dataUsingEncoding:](v9, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "JSONObjectWithData:options:error:", v12, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    CFRelease(v8);
    v14 = (void *)v13;
    if (v6)
      CFRelease(v6);
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  void *v14;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v16;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", &unk_1E6B72E00, CFSTR("PVFC_VER"));
  v18.origin.x = v12;
  v18.origin.y = v11;
  v18.size.width = v10;
  v18.size.height = v9;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v18);
  objc_msgSend(v14, "setObject:forKey:", DictionaryRepresentation, CFSTR("PVFC_FB"));

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v16 = CGRectCreateDictionaryRepresentation(v19);
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("PVFC_CB"));

  objc_msgSend(v14, "setObject:forKey:", &unk_1E6B72E00, CFSTR("PVFC_VER"));
  if (v13)
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("PVFC_GID"));

  return v14;
}

+ (id)imageCreationOptions
{
  if (imageCreationOptions_onceToken != -1)
    dispatch_once(&imageCreationOptions_onceToken, &__block_literal_global_37);
  return (id)imageCreationOptions_kImageCreationOptions;
}

void __40__VCPFaceCropUtils_imageCreationOptions__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CBD2B0];
  v4[0] = *MEMORY[0x1E0CBD240];
  v4[1] = v0;
  v5[0] = MEMORY[0x1E0C9AAA0];
  v5[1] = MEMORY[0x1E0C9AAB0];
  v1 = *MEMORY[0x1E0CBD288];
  v4[2] = *MEMORY[0x1E0CBD2B8];
  v4[3] = v1;
  v5[2] = MEMORY[0x1E0C9AAA0];
  v5[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageCreationOptions_kImageCreationOptions;
  imageCreationOptions_kImageCreationOptions = v2;

}

+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  double v17;
  double RectWithAllIntegers;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  const char *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGImage *OrientedCroppedAndScaledImageFromCGImageSource;
  void *v36;
  const CGImageMetadata *v37;
  __CFData *v38;
  CGImageDestination *v39;
  const __CFDictionary *v40;
  const __CFString *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  double v49;
  double v50;
  double v51;
  size_t v52;
  size_t v53;
  int v54[5];
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("unexpected nil image source"), 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v43);
  }
  v54[0] = -1;
  v52 = 0;
  v53 = 0;
  if ((getImagePropertiesFromCGImageSource(a3, v54, &v53, &v52) & 1) == 0)
  {
    v42 = CFSTR("invalid image source");
LABEL_38:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v42, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  if (!(unint64_t)(width + 0.5) || !(unint64_t)(height + 0.5))
  {
    v42 = CFSTR("zero dimensioned face rect submitted");
    goto LABEL_38;
  }
  v14 = v53;
  if (x < 0.0 || y < 0.0)
  {
    v15 = v52;
LABEL_14:
    v67.size.width = (double)v53;
    v67.size.height = (double)v15;
    v67.origin.x = 0.0;
    v67.origin.y = 0.0;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v65 = CGRectIntersection(v64, v67);
    x = v65.origin.x;
    width = v65.size.width;
    v15 = v52;
    v14 = v53;
    goto LABEL_15;
  }
  v15 = v52;
  if (v53 < (unint64_t)(width + x + 0.5) || v52 < (unint64_t)(height + y + 0.5))
    goto LABEL_14;
LABEL_15:
  v66.origin.x = makeRectWithAllIntegers(x + width * 0.5 - (width + width) * 0.5);
  v68.size.width = (double)v14;
  v68.size.height = (double)v15;
  v68.origin.x = 0.0;
  v68.origin.y = 0.0;
  *(_QWORD *)&v17 = (unint64_t)CGRectIntersection(v66, v68);
  RectWithAllIntegers = makeRectWithAllIntegers(v17);
  v50 = v21;
  v51 = RectWithAllIntegers;
  v22 = v19;
  v23 = v20;
  if (v19 >= v20)
    v24 = v19;
  else
    v24 = v20;
  if (v19 >= v20)
    v25 = v20;
  else
    v25 = v19;
  if (v24 <= 256.0)
  {
    v26 = 1.0;
    if (v25 < 128.0)
    {
      v26 = 128.0 / v25;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v58 = v22;
        v59 = 2048;
        v60 = v23;
        v61 = 2048;
        v62 = 128.0 / v25;
        v27 = MEMORY[0x1E0C81028];
        v28 = "[FaceCropGeneration] Scaling up from %.0fx%.0f with factor: %.3f";
        goto LABEL_29;
      }
    }
  }
  else
  {
    v26 = 256.0 / v24;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v58 = v22;
      v59 = 2048;
      v60 = v23;
      v61 = 2048;
      v62 = v26;
      v27 = MEMORY[0x1E0C81028];
      v28 = "[FaceCropGeneration] Scaling down from %.0fx%.0f with factor: %.3f";
LABEL_29:
      _os_log_impl(&dword_1B6C4A000, v27, OS_LOG_TYPE_DEBUG, v28, buf, 0x20u);
    }
  }
  v49 = makeRectWithAllIntegers((x - v51) * v26);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  OrientedCroppedAndScaledImageFromCGImageSource = createOrientedCroppedAndScaledImageFromCGImageSource(a3, v51, v50, v22, v23, v26);
  if (!OrientedCroppedAndScaledImageFromCGImageSource)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create cropped face crop image"), 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v45);
  }
  v36 = (void *)objc_msgSend(a1, "newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:", v12, v49, v30, v32, v34, v51, v50, v22, v23);
  v37 = (const CGImageMetadata *)objc_msgSend(a1, "createOutputMetadataFromDictionary:", v36);
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create face crop metadata"), 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v46);
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v38 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v39 = CGImageDestinationCreateWithData(v38, CFSTR("public.jpeg"), 1uLL, 0);
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create face crop data"), 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v47);
  }
  v55 = *MEMORY[0x1E0CBC780];
  v56 = &unk_1E6B72300;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageAndMetadata(v39, OrientedCroppedAndScaledImageFromCGImageSource, v37, v40);
  if (!CGImageDestinationFinalize(v39))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not write face crop data"), 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }

  CGImageRelease(OrientedCroppedAndScaledImageFromCGImageSource);
  CFRelease(v37);
  CFRelease(v39);
  objc_autoreleasePoolPop(v13);

  return v38;
}

+ (id)newFaceCropFromImageURL:(id)a3 withNormalizedFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  const __CFURL *v13;
  id v14;
  CGImageSource *v15;
  CGImage *ImageAtIndex;
  const CGImageMetadata *v17;
  const CGImageMetadata *v18;
  const __CFString *v19;
  const __CFString *v20;
  unsigned int IntValue;
  size_t v22;
  size_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  const __CFString *v34;
  id v35;
  id v36;
  id v37;
  void *context;
  id v39[3];
  uint8_t buf[4];
  unsigned int v41;
  uint64_t v42;
  CGRect v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v13 = (const __CFURL *)a3;
  v14 = a5;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  if (!v13)
  {
    v34 = CFSTR("image url is nil");
    goto LABEL_42;
  }
  v15 = CGImageSourceCreateWithURL(v13, (CFDictionaryRef)objc_msgSend(a1, "imageCreationOptions"));
  if (!v15)
  {
    v34 = CFSTR("Could not create image source");
LABEL_42:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v34, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, (CFDictionaryRef)objc_msgSend(a1, "imageCreationOptions"));
  if (!ImageAtIndex)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create image ref"), 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  v17 = CGImageSourceCopyMetadataAtIndex(v15, 0, 0);
  v18 = v17;
  if (v17)
  {
    v19 = CGImageMetadataCopyStringValueWithPath(v17, 0, CFSTR("tiff:Orientation"));
    v20 = v19;
    if (v19)
    {
      IntValue = CFStringGetIntValue(v19);
      if (IntValue - 9 <= 0xFFFFFFF7)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v41 = IntValue;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid orientation found: %d. Using a default value of 1", buf, 8u);
        }
        IntValue = 1;
      }
      CFRelease(v20);
    }
    else
    {
      IntValue = 1;
    }
    CFRelease(v18);
  }
  else
  {
    IntValue = 1;
  }
  v22 = CGImageGetWidth(ImageAtIndex);
  v23 = CGImageGetHeight(ImageAtIndex);
  if (x < 0.0 || x > 1.0 || y < 0.0 || y > 1.0 || width < 0.0 || width > 1.0 || height < 0.0 || height > 1.0)
  {
    v27 = *MEMORY[0x1E0C9D628];
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v24 = (double)v23;
    if (IntValue <= 4)
      v25 = (double)v22;
    else
      v25 = (double)v23;
    if (IntValue > 4)
      v24 = (double)v22;
    if (v25 >= v24)
      v26 = v25;
    else
      v26 = v24;
    v27 = x * v25;
    v28 = width * v26;
    v29 = y * v24;
    v30 = height * v26;
  }
  v43.origin.x = v27;
  v43.origin.y = v29;
  v43.size.width = v28;
  v43.size.height = v30;
  if (CGRectIsNull(v43))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create face rect"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v39[0] = 0;
  v31 = (void *)objc_msgSend(a1, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v15, v14, v39, v27, v29, v28, v30);
  v32 = v39[0];
  CFRelease(ImageAtIndex);
  CFRelease(v15);
  objc_autoreleasePoolPop(context);
  if (a6 && v32)
    *a6 = objc_retainAutorelease(v32);

  return v31;
}

+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  const __CFData *v13;
  id v14;
  void *v15;
  CGImageSourceRef v16;
  void *v17;
  id v18;
  const __CFString *v20;
  id v21;
  id v22[4];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22[3] = *(id *)MEMORY[0x1E0C80C00];
  v13 = (const __CFData *)a3;
  v14 = a5;
  v15 = (void *)MEMORY[0x1BCCA1B2C]();
  if (!v13)
  {
    v20 = CFSTR("image data is nil");
    goto LABEL_9;
  }
  v16 = CGImageSourceCreateWithData(v13, (CFDictionaryRef)objc_msgSend(a1, "imageCreationOptions"));
  if (!v16)
  {
    v20 = CFSTR("Could not create image source from data");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v22[0] = 0;
  v17 = (void *)objc_msgSend(a1, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v14, v22, x, y, width, height);
  v18 = v22[0];
  CFRelease(v16);
  objc_autoreleasePoolPop(v15);
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);

  return v17;
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x1BCCA1B2C]();
  v7 = (void *)objc_msgSend(a1, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v5);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_VER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToNumber:", &unk_1E6B72E00);
    if ((v10 & 1) != 0
      || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_VER")),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToNumber:", &unk_1E6B72E18)))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_CB"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

      }
      else
      {
        v13 = 0;
      }

      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      v13 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v6);
  return v13;
}

+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4
{
  id v5;
  CGSize v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  CGRect rect;
  uint64_t v18;
  CGRect result;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v6;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v8 = (void *)objc_msgSend(a1, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v5);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    CGRectMakeWithDictionaryRepresentation(v10, &rect);

  objc_autoreleasePoolPop(v7);
  x = rect.origin.x;
  y = rect.origin.y;
  width = rect.size.width;
  height = rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4
{
  id v5;
  CGSize v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  CGRect rect;
  uint64_t v18;
  CGRect result;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v6;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v8 = (void *)objc_msgSend(a1, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v5);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_CB"));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    CGRectMakeWithDictionaryRepresentation(v10, &rect);

  objc_autoreleasePoolPop(v7);
  x = rect.origin.x;
  y = rect.origin.y;
  width = rect.size.width;
  height = rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1BCCA1B2C]();
  v7 = (void *)objc_msgSend(a1, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v5);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_GID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v9;
}

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  void *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const __CFString *v13;
  id v14;
  id v15;
  size_t v16;
  size_t v17;
  int v18[5];
  uint64_t v19;
  CGSize result;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v6 = (void *)MEMORY[0x1BCCA1B2C]();
  if ((objc_msgSend(a1, "isValidFaceCrop:", v5) & 1) == 0)
  {
    v13 = CFSTR("the supplied data is not a facecrop");
    goto LABEL_7;
  }
  v7 = CGImageSourceCreateWithData(v5, (CFDictionaryRef)objc_msgSend(a1, "imageCreationOptions"));
  v8 = v7;
  if (!v7)
  {
    v13 = CFSTR("could not create an image source");
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v18[0] = -1;
  v16 = 0;
  v17 = 0;
  if ((getImagePropertiesFromCGImageSource(v7, v18, &v17, &v16) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not retrieve image properties"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v9 = (double)v17;
  v10 = (double)v16;
  CFRelease(v8);
  objc_autoreleasePoolPop(v6);

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

@end
