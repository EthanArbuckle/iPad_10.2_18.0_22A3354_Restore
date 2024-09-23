@implementation CKImageData

- (void)dealloc
{
  CGImageSource *imageSource;
  objc_super v4;

  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  v4.receiver = self;
  v4.super_class = (Class)CKImageData;
  -[CKImageData dealloc](&v4, sel_dealloc);
}

+ (id)UTITypeForData:(id)a3
{
  id v3;
  CKImageData *v4;
  void *v5;

  v3 = a3;
  v4 = -[CKImageData initWithData:]([CKImageData alloc], "initWithData:", v3);

  -[CKImageData UTIType](v4, "UTIType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CKImageData)initWithData:(id)a3
{
  const __CFData *v4;
  CKImageData *v5;
  objc_super v7;

  v4 = (const __CFData *)a3;
  v7.receiver = self;
  v7.super_class = (Class)CKImageData;
  v5 = -[CKImageData init](&v7, sel_init);
  if (v5)
  {
    if (v4)
    {
      v5->_imageSource = CGImageSourceCreateWithData(v4, 0);
      v5->_count = 0x7FFFFFFFFFFFFFFFLL;
      -[CKImageData setData:](v5, "setData:", v4);
    }
    if (!v5->_imageSource)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (CKImageData)initWithURL:(id)a3
{
  const __CFURL *v4;
  CKImageData *v5;
  CKImageData *v6;
  objc_super v8;

  v4 = (const __CFURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CKImageData;
  v5 = -[CKImageData init](&v8, sel_init);
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v5->_imageSource = CGImageSourceCreateWithURL(v4, 0);
      v6->_count = 0x7FFFFFFFFFFFFFFFLL;
      -[CKImageData setUrl:](v6, "setUrl:", v4);
      if (!v6->_imageSource)
      {

        v6 = 0;
      }
    }
  }

  return v6;
}

- (NSData)data
{
  NSData *data;
  void *v4;
  NSData *v5;
  NSData *v6;

  data = self->_data;
  if (!data)
  {
    -[CKImageData url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 8, 0);
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      v6 = self->_data;
      self->_data = v5;

    }
    data = self->_data;
  }
  return data;
}

- (UIImage)image
{
  UIImage *image;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  image = self->_image;
  if (!image)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    -[CKImageData data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ckImageWithData:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }
  return image;
}

- (id)thumbnailFitToSize:(CGSize)a3
{
  return -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSize:(CGSize)a3
{
  return -[CKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSizeCropping:(CGSize)a3
{
  double height;
  double width;
  void *v6;
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
  const __CFString *v18;
  CGImage *ThumbnailWithImageSourceAtIndexForMaxDimension;
  CGImageRef v20;
  void *v21;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  -[CKImageData ptSize](self, "ptSize");
  v11 = width / v9;
  v12 = 0.0;
  if (v9 == 0.0)
    v11 = 0.0;
  if (v10 != 0.0)
    v12 = height / v10;
  v13 = fmax(v11, v12);
  v14 = v9 * v13;
  v15 = v10 * v13;
  if (CKMainScreenScale_once_40 != -1)
    dispatch_once(&CKMainScreenScale_once_40, &__block_literal_global_223_1);
  v16 = *(double *)&CKMainScreenScale_sMainScreenScale_40;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_40 == 0.0)
    v16 = 1.0;
  v17 = v8 * fmax(ceil(v14 * v16) / v16, ceil(v15 * v16) / v16);
  v18 = -[CKImageData UTIType](self, "UTIType");
  if (!UTTypeConformsTo(v18, (CFStringRef)*MEMORY[0x1E0CA5BA8])
    || -[CKImageData count](self, "count") > 1
    || (-[CKImageData data](self, "data"),
        (ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImage *)_CreateThumbnailWithJPEGForMaxDimension(v17)) == 0))
  {
    ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, 0, v17);
  }
  v20 = CKCreateSquareCroppedImageRef(ThumbnailWithImageSourceAtIndexForMaxDimension);
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  if (v20)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v20, 0, v8);
    CFRelease(v20);
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)thumbnailsFitToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height;
  double width;
  unint64_t v8;
  unint64_t v9;
  double v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = -[CKImageData count](self, "count");
  v9 = v8;
  v10 = 1.0;
  if (v8 > a4)
    v10 = (double)v8 / (double)a4;
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v9 >= a4)
    v12 = a4;
  else
    v12 = v9;
  v13 = (void *)objc_msgSend(v11, "initWithCapacity:", v12);
  if (v9)
  {
    v14 = 0;
    v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", v14, width, height);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v13, "addObject:", v16);
        v15 = v10 + v15;

      }
      ++v14;
    }
    while (v9 != v14);
  }
  if (v9 > a4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(4);
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        v20 = v9;
        v21 = 2048;
        v22 = a4;
        v23 = 2048;
        v24 = v10;
        v25 = 2048;
        v26 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", buf, 0x2Au);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      objc_msgSend(v13, "count");
      _CKLog();
    }
  }
  return v13;
}

- (id)thumbnailAtIndex:(unint64_t)a3 fillToSize:(CGSize)a4 maxCount:(unint64_t)a5
{
  double height;
  double width;
  unint64_t v10;
  double v11;
  void *v14;

  height = a4.height;
  width = a4.width;
  if (a3 >= a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKImageData.m"), 222, CFSTR("index must be less than maxCount"));

  }
  v10 = -[CKImageData count](self, "count");
  v11 = 1.0;
  if (v10 > a5)
    v11 = (double)v10 / (double)a5;
  return -[CKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", (unint64_t)(v11 * (double)a3), width, height);
}

- (id)thumbnailsFillToSize:(CGSize)a3 maxCount:(unint64_t)a4
{
  double height;
  double width;
  unint64_t v8;
  unint64_t v9;
  double v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = -[CKImageData count](self, "count");
  v9 = v8;
  v10 = 1.0;
  if (v8 > a4)
    v10 = (double)v8 / (double)a4;
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v9 >= a4)
    v12 = a4;
  else
    v12 = v9;
  v13 = (void *)objc_msgSend(v11, "initWithCapacity:", v12);
  if (v9)
  {
    v14 = 0;
    v15 = 0.0;
    do
    {
      if (v15 <= (double)v14)
      {
        -[CKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", v14, width, height);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v13, "addObject:", v16);
        v15 = v10 + v15;

      }
      ++v14;
    }
    while (v9 != v14);
  }
  if (v9 > a4)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(4);
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        v20 = v9;
        v21 = 2048;
        v22 = a4;
        v23 = 2048;
        v24 = v10;
        v25 = 2048;
        v26 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", buf, 0x2Au);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      objc_msgSend(v13, "count");
      _CKLog();
    }
  }
  return v13;
}

- (id)_defaultDurationsWithMaxCount:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  void **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v3 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[CKImageData count](self, "count") < a3)
    v3 = -[CKImageData count](self, "count");
  v5 = v3;
  bzero((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v3);
  if (v3)
  {
    v6 = v3;
    v7 = (void **)((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0666666667);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *v7;
      *v7++ = (void *)v8;

      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", (char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do

    while (v5 * 8);
  }
  return v10;
}

- (id)durationsWithMaxCount:(unint64_t)a3
{
  void *v4;
  int IsSupportedAnimatedImage;
  unint64_t v6;
  unint64_t v7;
  double v8;
  id v9;
  unint64_t v10;
  void *v11;
  size_t v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  double v17;
  double v18;
  void *v19;
  CGImageSource *imageSource;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFDictionary *Value;
  const __CFDictionary *v24;
  const __CFNumber *v25;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  const __CFNumber *v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  const __CFNumber *v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  const __CFNumber *v34;
  float v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *key;
  int valuePtr;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  double v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[CKImageData UTIType](self, "UTIType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage();

  if (IsSupportedAnimatedImage)
  {
    v6 = -[CKImageData count](self, "count");
    v7 = v6;
    v8 = 1.0;
    if (v6 > a3)
      v8 = (double)v6 / (double)a3;
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (v7 >= a3)
      v10 = a3;
    else
      v10 = v7;
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", v10);
    if (v7)
    {
      v12 = 0;
      v13 = (const void *)*MEMORY[0x1E0CBCCE0];
      key = (void *)*MEMORY[0x1E0CBCCF8];
      v43 = (void *)*MEMORY[0x1E0CBCCD8];
      v14 = (const void *)*MEMORY[0x1E0CBD028];
      v47 = (void *)*MEMORY[0x1E0CBC820];
      v42 = (void *)*MEMORY[0x1E0CBC810];
      v15 = (const void *)*MEMORY[0x1E0CBCE80];
      v46 = (void *)*MEMORY[0x1E0CBCE90];
      v41 = (void *)*MEMORY[0x1E0CBCE78];
      v16 = (const void *)*MEMORY[0x1E0CBD118];
      v45 = (void *)*MEMORY[0x1E0CBD120];
      v17 = 0.0;
      v18 = 0.0;
      v40 = (void *)*MEMORY[0x1E0CBD110];
      do
      {
        if (v8 + v17 <= (double)v12)
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v18);
          objc_msgSend(v11, "addObject:", v19);

          v18 = 0.0;
          v17 = v8 + v17;
        }
        imageSource = self->_imageSource;
        *(float *)&valuePtr = 0.0;
        v21 = CGImageSourceCopyPropertiesAtIndex(imageSource, v12, 0);
        v22 = v21;
        if (v21)
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue(v21, v13);
          v24 = Value;
          if (Value)
          {
            v25 = (const __CFNumber *)CFDictionaryGetValue(Value, key);
            if (v25 || (v25 = (const __CFNumber *)CFDictionaryGetValue(v24, v43)) != 0)
              CFNumberGetValue(v25, kCFNumberFloatType, &valuePtr);
          }
          v26 = (const __CFDictionary *)CFDictionaryGetValue(v22, v14);
          v27 = v26;
          if (v26)
          {
            v28 = (const __CFNumber *)CFDictionaryGetValue(v26, v47);
            if (v28 || (v28 = (const __CFNumber *)CFDictionaryGetValue(v27, v42)) != 0)
              CFNumberGetValue(v28, kCFNumberFloatType, &valuePtr);
          }
          v29 = (const __CFDictionary *)CFDictionaryGetValue(v22, v15);
          v30 = v29;
          if (v29)
          {
            v31 = (const __CFNumber *)CFDictionaryGetValue(v29, v46);
            if (v31 || (v31 = (const __CFNumber *)CFDictionaryGetValue(v30, v41)) != 0)
              CFNumberGetValue(v31, kCFNumberFloatType, &valuePtr);
          }
          v32 = (const __CFDictionary *)CFDictionaryGetValue(v22, v16);
          v33 = v32;
          if (v32)
          {
            v34 = (const __CFNumber *)CFDictionaryGetValue(v32, v45);
            if (v34 || (v34 = (const __CFNumber *)CFDictionaryGetValue(v33, v40)) != 0)
              CFNumberGetValue(v34, kCFNumberFloatType, &valuePtr);
          }
          CFRelease(v22);
          v35 = *(float *)&valuePtr;
        }
        else
        {
          v35 = 0.0;
        }
        if (v35 < 0.011)
          v35 = 0.1;
        v18 = v18 + v35;
        ++v12;
      }
      while (v7 != v12);
    }
    else
    {
      v18 = 0.0;
    }
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v18);
    objc_msgSend(v11, "addObject:", v36);
    if (v7 > a3)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(4);
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = objc_msgSend(v11, "count");
          *(float *)&valuePtr = 3.8523e-34;
          v50 = v7;
          v51 = 2048;
          v52 = a3;
          v53 = 2048;
          v54 = v8;
          v55 = 2048;
          v56 = v38;
          _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_DEBUG, "GIF wanted %ld durations (> max allowed (%ld)). Used increment %f to generate %ld durations.", (uint8_t *)&valuePtr, 0x2Au);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        objc_msgSend(v11, "count");
        _CKLog();
      }
    }

  }
  else
  {
    v11 = &unk_1E286F538;
  }
  return v11;
}

- (NSString)MIMEType
{
  __CFString *v2;
  const __CFString *v3;

  -[CKImageData UTIType](self, "UTIType");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5BA8]))
  {
    v3 = CFSTR("image/jpeg");
  }
  else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5C10]))
  {
    v3 = CFSTR("image/png");
  }
  else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B68]))
  {
    v3 = CFSTR("image/gif");
  }
  else
  {
    NSLog(CFSTR("no mime type for image type %@"), v2);
    v3 = 0;
  }

  return &v3->isa;
}

- (NSString)UTIType
{
  return (NSString *)CGImageSourceGetType(self->_imageSource);
}

- (CGSize)ptSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CKImageData pxSize](self, "pxSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v9 = v3 / v8;
  v10 = v5 / v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)pxSize
{
  double width;
  double height;
  CGSize result;

  -[CKImageData _initializeProperties](self, "_initializeProperties");
  width = self->_pxSize.width;
  height = self->_pxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)orientation
{
  -[CKImageData _initializeProperties](self, "_initializeProperties");
  return self->_orientation;
}

- (unint64_t)count
{
  unint64_t result;

  result = self->_count;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = CGImageSourceGetCount(self->_imageSource);
    self->_count = result;
  }
  return result;
}

- (void)_initializeProperties
{
  double v3;
  double v4;
  CGImageSource *imageSource;
  const __CFDictionary *v6;
  CFDictionaryRef v7;
  const __CFDictionary *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  int v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (!self->_initializedProperties)
  {
    self->_initializedProperties = 1;
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (-[CKImageData count](self, "count"))
    {
      imageSource = self->_imageSource;
      v25 = *MEMORY[0x1E0CBD288];
      v26[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, v6);

      if (v7)
      {
        v8 = v7;
        v9 = *MEMORY[0x1E0CBCFF0];
        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10
          || (-[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v11, "objectForKeyedSubscript:", v9),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11,
              v10))
        {
          v12 = objc_msgSend(v10, "integerValue");
          v13 = 2;
          v14 = 3;
          v15 = v12 != 6;
          if (v12 != 6)
            v14 = 0;
          if (v12 == 8)
            v15 = 0;
          else
            v13 = v14;
          v16 = v12 == 3 || v15;
          if (v12 == 3)
            v17 = 1;
          else
            v17 = v13;
        }
        else
        {
          v17 = 0;
          v16 = 1;
        }

        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD048]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CBD040]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v16)
        {
          v19 = v18;
          v21 = v20;
        }
        else
        {
          v21 = v18;
        }
        objc_msgSend(v19, "floatValue");
        v23 = v22;
        objc_msgSend(v21, "floatValue");
        v4 = v24;
        v3 = v23;

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
    self->_orientation = v17;
    self->_pxSize.width = v3;
    self->_pxSize.height = v4;
  }
}

- (id)_thumbnailFitToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t ThumbnailWithJPEGForMaxDimension;
  double v23;
  double v24;
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension;
  void *v26;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  -[CKImageData ptSize](self, "ptSize");
  v13 = width / v11;
  v14 = 0.0;
  if (v11 == 0.0)
    v13 = 0.0;
  if (v12 != 0.0)
    v14 = height / v12;
  v15 = fmin(v13, v14);
  v16 = v10 * fmax(floor(v11 * v15), floor(v12 * v15));
  -[CKImageData UTIType](self, "UTIType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("public.heics"));

  -[CKImageData UTIType](self, "UTIType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if (!a4 && v21 && -[CKImageData count](self, "count") <= 1)
  {
    -[CKImageData data](self, "data");
    ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithJPEGForMaxDimension(v16);
    goto LABEL_14;
  }
  if (v18)
  {
    -[CKImageData sizeForImageSource:index:](self, "sizeForImageSource:index:", self->_imageSource, a4);
    if (v23 <= v24)
      v23 = v24;
    if (v23 < v16)
    {
      ThumbnailWithJPEGForMaxDimension = (uint64_t)_CreateThumbnailFromHEICSWithMaxDimension(self->_imageSource, a4);
LABEL_14:
      ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImageRef)ThumbnailWithJPEGForMaxDimension;
      if (ThumbnailWithJPEGForMaxDimension)
        goto LABEL_16;
    }
  }
  ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v16);
  if (!ThumbnailWithImageSourceAtIndexForMaxDimension)
  {
    v26 = 0;
    return v26;
  }
LABEL_16:
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", ThumbnailWithImageSourceAtIndexForMaxDimension, 0, v10);
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  return v26;
}

- (CGSize)sizeForImageSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
  v5 = v4;
  if (v4)
  {
    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
    v8 = 0.0;
  }

  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_thumbnailFillToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const void *ThumbnailWithJPEGForMaxDimension;
  void *v18;
  const __CFString *v19;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  -[CKImageData ptSize](self, "ptSize");
  v13 = width / v11;
  v14 = 0.0;
  if (v11 == 0.0)
    v13 = 0.0;
  if (v12 != 0.0)
    v14 = height / v12;
  v15 = fmax(v13, v14);
  v16 = v10 * fmax(round(v10 * (v11 * v15)) / v10, round(v10 * (v12 * v15)) / v10);
  if (!a4
    && (v19 = -[CKImageData UTIType](self, "UTIType"), UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x1E0CA5BA8]))
    && -[CKImageData count](self, "count") <= 1
    && (-[CKImageData data](self, "data"),
        (ThumbnailWithJPEGForMaxDimension = (const void *)_CreateThumbnailWithJPEGForMaxDimension(v16)) != 0)
    || (ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v16)) != 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", ThumbnailWithJPEGForMaxDimension, 0, v10);
    CFRelease(ThumbnailWithJPEGForMaxDimension);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setPxSize:(CGSize)a3
{
  self->_pxSize = a3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(CGImageSource *)a3
{
  self->_imageSource = a3;
}

- (BOOL)initializedProperties
{
  return self->_initializedProperties;
}

- (void)setInitializedProperties:(BOOL)a3
{
  self->_initializedProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
