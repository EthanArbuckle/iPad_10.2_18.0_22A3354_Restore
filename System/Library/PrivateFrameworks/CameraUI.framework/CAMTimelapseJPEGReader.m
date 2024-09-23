@implementation CAMTimelapseJPEGReader

+ (BOOL)_hasExifRotation:(id)a3
{
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  BOOL v8;

  v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(v7, "intValue") - 5 < 4;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  CFRelease(v4);

  return v8;
}

+ (id)newDataFromFilePath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 0, &v10);
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CAMTimelapseJPEGReader newDataFromFilePath:].cold.1((uint64_t)v3, (uint64_t)v6, v8);

  }
  return v4;
}

+ (id)_decodeOptionsWithMaxPixelSize:(int64_t)a3 applyTransform:(BOOL)a4 useBGRA:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setObject:forKey:", &unk_1EA3B0718, *MEMORY[0x1E0D09570]);
  if (v6)
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09548]);
  if (a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x1E0D09568]);

  }
  return v9;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6 cleanApertureSize:(CGSize)a7
{
  double height;
  double width;
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  OSType v16;
  void *v17;
  OSStatus CVPixelBufferFromImageData;
  double v19;
  double v20;
  OSStatus v21;
  float v22;
  size_t v23;
  float v24;
  size_t v25;
  int v26;
  size_t v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const __CFDictionary *v34;
  const __CFAllocator *v35;
  CVReturn v36;
  NSObject *v37;
  __CVBuffer *v38;
  void *v40;
  uint64_t v41;
  void *v42;
  CVPixelBufferRef pixelBufferOut;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVBufferRef buffer;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  OSStatus v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  _QWORD v59[6];
  CGSize v60;

  height = a7.height;
  width = a7.width;
  v9 = a6;
  v11 = a4;
  v59[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  pixelTransferSessionOut = 0;
  buffer = 0;
  pixelBufferOut = 0;
  if (!v14)
    goto LABEL_42;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(a1, "_decodeOptionsWithMaxPixelSize:applyTransform:useBGRA:", a5, v11, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  }
  else
  {
    if (v9)
      v16 = 1111970369;
    else
      v16 = 875704422;
    objc_msgSend(a1, "_decodeOptionsWithMaxPixelSize:applyTransform:useBGRA:", 0, v11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (!CVPixelBufferFromImageData)
    {
      if (a5 < 1)
      {
        v20 = 1.0;
      }
      else
      {
        if (width <= height)
          v19 = height;
        else
          v19 = width;
        v20 = fmin((double)a5 / v19, 1.0);
      }
      v22 = width * v20;
      v23 = vcvtas_u32_f32(v22);
      v24 = height * v20;
      v25 = vcvtas_u32_f32(v24);
      if (v11)
      {
        v26 = objc_msgSend(a1, "_hasExifRotation:", v14);
        if (v26)
          v27 = v23;
        else
          v27 = v25;
        if (v26)
        {
          v23 = v25;
          v28 = height;
        }
        else
        {
          v28 = width;
        }
        if (v26)
          height = width;
        v25 = v27;
        width = v28;
      }
      v58[0] = *MEMORY[0x1E0CA8D60];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v29;
      v58[1] = *MEMORY[0x1E0CA8D40];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0CA8D48];
      v59[1] = v30;
      v59[2] = &unk_1EA3B0730;
      v32 = *MEMORY[0x1E0CA8D58];
      v58[2] = v31;
      v58[3] = v32;
      v59[3] = &unk_1EA3B0730;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      CVBufferSetAttachment(buffer, (CFStringRef)*MEMORY[0x1E0CA8D50], v33, kCVAttachmentMode_ShouldNotPropagate);
      v56 = *MEMORY[0x1E0CA8FF0];
      v57 = MEMORY[0x1E0C9AA70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v35 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v36 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v23, v25, v16, v34, &pixelBufferOut);
      if (v36
        || (v36 = VTPixelTransferSessionCreate(v35, &pixelTransferSessionOut)) != 0
        || (VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED800], (CFTypeRef)*MEMORY[0x1E0C9AE50]), (v36 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB30])) != 0))
      {
        v21 = v36;
      }
      else
      {
        v21 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, buffer, pixelBufferOut);
        if (!v21)
        {
          CFRelease(buffer);
          buffer = pixelBufferOut;
          pixelBufferOut = 0;
        }
      }

      if (pixelTransferSessionOut)
        CFRelease(pixelTransferSessionOut);
      goto LABEL_35;
    }
  }
  v21 = CVPixelBufferFromImageData;

LABEL_35:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (!v21)
  {
    v38 = buffer;
    goto LABEL_44;
  }
  v37 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v14, "length");
    v60.width = width;
    v60.height = height;
    NSStringFromCGSize(v60);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v47 = v40;
    v48 = 2048;
    v49 = v21;
    v50 = 1024;
    v51 = v21;
    v52 = 2048;
    v53 = v41;
    v54 = 2114;
    v55 = v42;
    _os_log_error_impl(&dword_1DB760000, v37, OS_LOG_TYPE_ERROR, "Error decoding JPEG to PixelBuffer from %{public}@, err %ld (0x%x), JPEG size %lu, clapSize %{public}@", buf, 0x30u);

  }
  if (buffer)
    CFRelease(buffer);
LABEL_42:
  v38 = 0;
LABEL_44:

  return v38;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6
{
  return (__CVBuffer *)objc_msgSend(a1, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:", a3, a4, a5, a6, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (CGImage)createCGImageFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v11;
  void *v12;
  int CGImageFromImageData;
  int v14;
  NSObject *v15;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a6;
  v8 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (v11)
  {
    objc_msgSend(a1, "_decodeOptionsWithMaxPixelSize:applyTransform:useBGRA:", a5, v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageFromImageData = PFFigCreateCGImageFromImageData();
    if (CGImageFromImageData)
    {
      v14 = CGImageFromImageData;
      v15 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v17;
        v20 = 2048;
        v21 = v14;
        v22 = 2048;
        v23 = objc_msgSend(v11, "length");
        _os_log_error_impl(&dword_1DB760000, v15, OS_LOG_TYPE_ERROR, "PFFigCreateCGImageFromImageData %{public}@ returned %ld from %lu", buf, 0x20u);

      }
    }

  }
  return 0;
}

+ (void)newDataFromFilePath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Error creating data from file %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
