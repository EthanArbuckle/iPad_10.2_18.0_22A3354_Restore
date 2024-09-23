@implementation STKImageData

- (void)dealloc
{
  CGImageSource *imageSource;
  objc_super v4;

  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  v4.receiver = self;
  v4.super_class = (Class)STKImageData;
  -[STKImageData dealloc](&v4, sel_dealloc);
}

+ (id)UTITypeForData:(id)a3
{
  id v3;
  STKImageData *v4;
  void *v5;

  v3 = a3;
  v4 = -[STKImageData initWithData:]([STKImageData alloc], "initWithData:", v3);

  -[STKImageData UTIType](v4, "UTIType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)UTTypeForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "UTITypeForData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "isEqualToString:", &stru_2505C9D88))
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_23459E000, v7, OS_LOG_TYPE_DEFAULT, "Cannot determine UTType without a UTIType: %@", (uint8_t *)&v11, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

- (STKImageData)initWithData:(id)a3
{
  const __CFData *v4;
  STKImageData *v5;
  objc_super v7;

  v4 = (const __CFData *)a3;
  v7.receiver = self;
  v7.super_class = (Class)STKImageData;
  v5 = -[STKImageData init](&v7, sel_init);
  if (v5)
  {
    if (v4)
    {
      v5->_imageSource = CGImageSourceCreateWithData(v4, 0);
      v5->_count = 0x7FFFFFFFFFFFFFFFLL;
      -[STKImageData setData:](v5, "setData:", v4);
    }
    if (!v5->_imageSource)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (STKImageData)initWithURL:(id)a3
{
  const __CFURL *v4;
  STKImageData *v5;
  STKImageData *v6;
  objc_super v8;

  v4 = (const __CFURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STKImageData;
  v5 = -[STKImageData init](&v8, sel_init);
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v5->_imageSource = CGImageSourceCreateWithURL(v4, 0);
      v6->_count = 0x7FFFFFFFFFFFFFFFLL;
      -[STKImageData setUrl:](v6, "setUrl:", v4);
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
    -[STKImageData url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 8, 0);
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
    v4 = (void *)MEMORY[0x24BEBD640];
    -[STKImageData data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itk_mainScreenScaledImageWithData:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }
  return image;
}

- (BOOL)typeSupportsAnimatedImages
{
  void *v2;
  void *v3;
  BOOL v4;

  -[STKImageData utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2
    && ((objc_msgSend(v2, "itk_isPNG") & 1) != 0
     || (objc_msgSend(v3, "itk_isGIF") & 1) != 0
     || (objc_msgSend(v3, "itk_isWebP") & 1) != 0
     || objc_msgSend(v3, "itk_isHEICS"));

  return v4;
}

- (BOOL)containsMultipleFrames
{
  return -[STKImageData count](self, "count") > 1;
}

- (id)thumbnailFitToSize:(CGSize)a3
{
  return -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSize:(CGSize)a3
{
  return -[STKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", 0, a3.width, a3.height);
}

- (id)thumbnailFillToSizeCropping:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  void *ThumbnailWithImageSourceAtIndexForMaxDimension;
  CGImageRef v10;
  void *v11;

  if (ITKMainScreenScale_once != -1)
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0)
    v4 = 1.0;
  else
    v4 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  -[STKImageData ptSize](self, "ptSize");
  ITKFitOrFillSizeInSize();
  if (ITKMainScreenScale_once != -1)
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  ITKSizeGetMaxDimension();
  v6 = v4 * v5;
  if (-[STKImageData count](self, "count") > 1
    || (-[STKImageData utType](self, "utType"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x24BDF8438]),
        v7,
        !v8)
    || (-[STKImageData data](self, "data"),
        (ThumbnailWithImageSourceAtIndexForMaxDimension = (void *)_CreateThumbnailWithJPEGForMaxDimension(v6)) == 0))
  {
    ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, 0, v6);
  }
  v10 = CKCreateSquareCroppedImageRef(ThumbnailWithImageSourceAtIndexForMaxDimension);
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "itk_imageWithCGImage:scale:orientation:", v10, 0, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
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
  int v19;
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
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = -[STKImageData count](self, "count");
  v9 = v8;
  v10 = 1.0;
  if (v8 > a4)
    v10 = (double)v8 / (double)a4;
  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
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
        -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", v14, width, height);
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
    v17 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218752;
      v20 = v9;
      v21 = 2048;
      v22 = a4;
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = objc_msgSend(v13, "count");
      _os_log_impl(&dword_23459E000, v17, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", (uint8_t *)&v19, 0x2Au);
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

  height = a4.height;
  width = a4.width;
  v10 = -[STKImageData count](self, "count");
  v11 = 1.0;
  if (v10 > a5)
    v11 = (double)v10 / (double)a5;
  return -[STKImageData _thumbnailFitToSize:atIndex:](self, "_thumbnailFitToSize:atIndex:", (unint64_t)(v11 * (double)a3), width, height);
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
  int v19;
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
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = -[STKImageData count](self, "count");
  v9 = v8;
  v10 = 1.0;
  if (v8 > a4)
    v10 = (double)v8 / (double)a4;
  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
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
        -[STKImageData _thumbnailFillToSize:atIndex:](self, "_thumbnailFillToSize:atIndex:", v14, width, height);
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
    v17 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218752;
      v20 = v9;
      v21 = 2048;
      v22 = a4;
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = objc_msgSend(v13, "count");
      _os_log_impl(&dword_23459E000, v17, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld frames (> max allowed (%ld)). Used increment %f to generate %ld frames.", (uint8_t *)&v19, 0x2Au);
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
  v12[1] = *MEMORY[0x24BDAC8D0];
  if (-[STKImageData count](self, "count") < a3)
    v3 = -[STKImageData count](self, "count");
  v5 = v3;
  bzero((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v3);
  if (v3)
  {
    v6 = v3;
    v7 = (void **)((char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0666666667);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *v7;
      *v7++ = (void *)v8;

      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", (char *)v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
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
  unint64_t v5;
  unint64_t v6;
  double v7;
  id v8;
  unint64_t v9;
  void *v10;
  size_t v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  double v16;
  double v17;
  void *v18;
  CGImageSource *imageSource;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  const __CFDictionary *Value;
  const __CFDictionary *v23;
  const __CFNumber *v24;
  const __CFDictionary *v25;
  const __CFDictionary *v26;
  const __CFNumber *v27;
  const __CFDictionary *v28;
  const __CFDictionary *v29;
  const __CFNumber *v30;
  const __CFDictionary *v31;
  const __CFDictionary *v32;
  const __CFNumber *v33;
  float v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *key;
  int valuePtr;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (-[STKImageData supportsAnimatedImages](self, "supportsAnimatedImages"))
  {
    v5 = -[STKImageData count](self, "count");
    v6 = v5;
    if (v5 > a3)
      v7 = (double)v5 / (double)a3;
    else
      v7 = 1.0;
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v39 = a3;
    if (v6 >= a3)
      v9 = a3;
    else
      v9 = v6;
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", v9);
    if (v6)
    {
      v11 = 0;
      v12 = (const void *)*MEMORY[0x24BDD9598];
      key = (void *)*MEMORY[0x24BDD95B8];
      v43 = (void *)*MEMORY[0x24BDD9590];
      v13 = (const void *)*MEMORY[0x24BDD96B0];
      v46 = (void *)*MEMORY[0x24BDD9298];
      v42 = (void *)*MEMORY[0x24BDD9280];
      v14 = (const void *)*MEMORY[0x24BDD9608];
      v45 = (void *)*MEMORY[0x24BDD9620];
      v41 = (void *)*MEMORY[0x24BDD9600];
      v15 = (const void *)*MEMORY[0x24BDD9740];
      v44 = (void *)*MEMORY[0x24BDD9758];
      v16 = 0.0;
      v17 = 0.0;
      v40 = (void *)*MEMORY[0x24BDD9738];
      do
      {
        if (v7 + v17 <= (double)v11)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v16);
          objc_msgSend(v10, "addObject:", v18);

          v16 = 0.0;
          v17 = v7 + v17;
        }
        imageSource = self->_imageSource;
        *(float *)&valuePtr = 0.0;
        v20 = CGImageSourceCopyPropertiesAtIndex(imageSource, v11, 0);
        if (v20)
        {
          v21 = v20;
          Value = (const __CFDictionary *)CFDictionaryGetValue(v20, v12);
          if (Value)
          {
            v23 = Value;
            v24 = (const __CFNumber *)CFDictionaryGetValue(Value, key);
            if (v24 || (v24 = (const __CFNumber *)CFDictionaryGetValue(v23, v43)) != 0)
              CFNumberGetValue(v24, kCFNumberFloatType, &valuePtr);
          }
          v25 = (const __CFDictionary *)CFDictionaryGetValue(v21, v13);
          if (v25)
          {
            v26 = v25;
            v27 = (const __CFNumber *)CFDictionaryGetValue(v25, v46);
            if (v27 || (v27 = (const __CFNumber *)CFDictionaryGetValue(v26, v42)) != 0)
              CFNumberGetValue(v27, kCFNumberFloatType, &valuePtr);
          }
          v28 = (const __CFDictionary *)CFDictionaryGetValue(v21, v14);
          if (v28)
          {
            v29 = v28;
            v30 = (const __CFNumber *)CFDictionaryGetValue(v28, v45);
            if (v30 || (v30 = (const __CFNumber *)CFDictionaryGetValue(v29, v41)) != 0)
              CFNumberGetValue(v30, kCFNumberFloatType, &valuePtr);
          }
          v31 = (const __CFDictionary *)CFDictionaryGetValue(v21, v15);
          if (v31)
          {
            v32 = v31;
            v33 = (const __CFNumber *)CFDictionaryGetValue(v31, v44);
            if (v33 || (v33 = (const __CFNumber *)CFDictionaryGetValue(v32, v40)) != 0)
              CFNumberGetValue(v33, kCFNumberFloatType, &valuePtr);
          }
          CFRelease(v21);
          v34 = *(float *)&valuePtr;
        }
        else
        {
          v34 = 0.0;
        }
        if (v34 < 0.011)
          v34 = 0.1;
        v16 = v16 + v34;
        ++v11;
      }
      while (v6 != v11);
    }
    else
    {
      v16 = 0.0;
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v16);
    objc_msgSend(v10, "addObject:", v35);
    if (v6 > v39)
    {
      v36 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_msgSend(v10, "count");
        *(float *)&valuePtr = 3.8523e-34;
        v49 = v6;
        v50 = 2048;
        v51 = v39;
        v52 = 2048;
        v53 = v7;
        v54 = 2048;
        v55 = v37;
        _os_log_impl(&dword_23459E000, v36, OS_LOG_TYPE_DEFAULT, "GIF wanted %ld durations (> max allowed (%ld)). Used increment %f to generate %ld durations.", (uint8_t *)&valuePtr, 0x2Au);
      }

    }
  }
  else
  {
    v10 = &unk_2505F99C0;
  }
  return v10;
}

- (id)MIMEType
{
  void *v2;
  void *v3;

  -[STKImageData utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredMIMEType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)UTIType
{
  return (id)CGImageSourceGetType(self->_imageSource);
}

- (UTType)utType
{
  void *v3;
  void *v4;
  NSObject *v5;
  CGImageSource *imageSource;
  void *v7;
  int v9;
  CGImageSource *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[STKImageData UTIType](self, "UTIType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "isEqualToString:", &stru_2505C9D88))
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = os_log_create("com.apple.VisionKit", "com.apple.StickerKit.stickerData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      imageSource = self->_imageSource;
      v9 = 138412290;
      v10 = imageSource;
      _os_log_impl(&dword_23459E000, v5, OS_LOG_TYPE_DEFAULT, "Cannot determine UTType without a UTIType: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = 0;
  }

  return (UTType *)v7;
}

- (CGSize)ptSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[STKImageData pxSize](self, "pxSize");
  v3 = v2;
  v5 = v4;
  if (ITKMainScreenScale_once != -1)
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  v6 = 1.0;
  if (*(double *)&ITKMainScreenScale_sMainScreenScale != 0.0)
    v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  v7 = v3 / v6;
  v8 = v5 / v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)pxSize
{
  double width;
  double height;
  CGSize result;

  -[STKImageData _initializeProperties](self, "_initializeProperties");
  width = self->_pxSize.width;
  height = self->_pxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)orientation
{
  -[STKImageData _initializeProperties](self, "_initializeProperties");
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
  int64_t v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_initializedProperties)
  {
    self->_initializedProperties = 1;
    v3 = *MEMORY[0x24BDBF148];
    v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (-[STKImageData count](self, "count"))
    {
      imageSource = self->_imageSource;
      v20 = *MEMORY[0x24BDD97F0];
      v21[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, v6);

      if (v7)
      {
        v8 = v7;
        v9 = *MEMORY[0x24BDD9698];
        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD9698]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10
          || (-[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD96E8]),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v11, "objectForKeyedSubscript:", v9),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11,
              v10))
        {
          v12 = objc_msgSend(v10, "integerValue");
          v13 = 2;
          v14 = 3;
          if (v12 != 6)
            v14 = 0;
          if (v12 != 8)
            v13 = v14;
          if (v12 == 3)
            v15 = 1;
          else
            v15 = v13;
        }
        else
        {
          v15 = 0;
        }

        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary objectForKey:](v8, "objectForKey:", *MEMORY[0x24BDD96C0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v3 = v18;
        objc_msgSend(v17, "floatValue");
        v4 = v19;

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    self->_orientation = v15;
    self->_pxSize.width = v3;
    self->_pxSize.height = v4;
  }
}

- (id)_thumbnailFitToSize:(CGSize)a3 atIndex:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t ThumbnailWithJPEGForMaxDimension;
  double v15;
  double v16;
  CGImageRef ThumbnailWithImageSourceAtIndexForMaxDimension;
  void *v19;

  if (ITKMainScreenScale_once != -1)
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0)
    v6 = 1.0;
  else
    v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  -[STKImageData ptSize](self, "ptSize");
  ITKScaleSizeWithinSize();
  ITKFloorSize();
  ITKSizeGetMaxDimension();
  v8 = v6 * v7;
  -[STKImageData UTIType](self, "UTIType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("public.heics"));

  -[STKImageData UTIType](self, "UTIType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (-[STKImageData count](self, "count") <= 1 && v13)
  {
    -[STKImageData data](self, "data");
    ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithJPEGForMaxDimension(v8);
    goto LABEL_18;
  }
  if (v10)
  {
    -[STKImageData sizeForImageSource:index:](self, "sizeForImageSource:index:", self->_imageSource, a4);
    if (v15 <= v16)
      v15 = v16;
    if (v15 == 0.0 || v15 < v8)
    {
      ThumbnailWithJPEGForMaxDimension = (uint64_t)_CreateThumbnailFromHEICSWithMaxDimension(self->_imageSource, a4);
LABEL_18:
      ThumbnailWithImageSourceAtIndexForMaxDimension = (CGImageRef)ThumbnailWithJPEGForMaxDimension;
      if (ThumbnailWithJPEGForMaxDimension)
        goto LABEL_20;
    }
  }
  ThumbnailWithImageSourceAtIndexForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v8);
  if (!ThumbnailWithImageSourceAtIndexForMaxDimension)
  {
    v19 = 0;
    return v19;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BEBD640], "itk_imageWithCGImage:scale:orientation:", ThumbnailWithImageSourceAtIndexForMaxDimension, 0, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(ThumbnailWithImageSourceAtIndexForMaxDimension);
  return v19;
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
    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD96C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD96C0]);
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
  double v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  const void *ThumbnailWithJPEGForMaxDimension;
  void *v12;

  if (ITKMainScreenScale_once != -1)
    dispatch_once(&ITKMainScreenScale_once, &__block_literal_global);
  if (*(double *)&ITKMainScreenScale_sMainScreenScale == 0.0)
    v6 = 1.0;
  else
    v6 = *(double *)&ITKMainScreenScale_sMainScreenScale;
  -[STKImageData ptSize](self, "ptSize");
  ITKFitOrFillSizeInSize();
  ITKSizeGetMaxDimension();
  v8 = v6 * v7;
  if (!a4)
  {
    -[STKImageData utType](self, "utType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "itk_isJPEG") & 1) != 0)
    {
      v10 = -[STKImageData count](self, "count");

      if (v10 <= 1)
      {
        -[STKImageData data](self, "data");
        ThumbnailWithJPEGForMaxDimension = (const void *)_CreateThumbnailWithJPEGForMaxDimension(v8);
        if (ThumbnailWithJPEGForMaxDimension)
          goto LABEL_13;
      }
    }
    else
    {

    }
  }
  ThumbnailWithJPEGForMaxDimension = _CreateThumbnailWithImageSourceAtIndexForMaxDimension(self->_imageSource, a4, v8);
  if (!ThumbnailWithJPEGForMaxDimension)
  {
    v12 = 0;
    return v12;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BEBD640], "itk_imageWithCGImage:scale:orientation:", ThumbnailWithJPEGForMaxDimension, 0, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(ThumbnailWithJPEGForMaxDimension);
  return v12;
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

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
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
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
