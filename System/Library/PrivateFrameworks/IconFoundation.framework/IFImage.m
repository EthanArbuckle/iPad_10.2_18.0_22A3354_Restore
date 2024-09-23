@implementation IFImage

void __25__IFImage_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS___IFImage;
  v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)allocWithZone__imageFactory;
  allocWithZone__imageFactory = (uint64_t)v2;

}

- (double)dimension
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;

  -[IFImage size](self, "size");
  v4 = v3;
  -[IFImage size](self, "size");
  v6 = v5;
  -[IFImage size](self, "size");
  if (v4 <= v6)
    return v8;
  return result;
}

- (NSData)bitmapData
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  double v25;
  float v26;
  float v27;
  double v28;
  double v29;
  float v30;
  void *v31;
  int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[IFImage CGImage](self, "CGImage");
  CGImageGetProperty();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IFImage size](self, "size");
    v5 = v4;
    v7 = v6;
    -[IFImage scale](self, "scale");
    +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[IFImage CGImage](self, "CGImage");
    -[IFImage size](self, "size");
    v12 = v11;
    -[IFImage size](self, "size");
    objc_msgSend(v9, "drawCGImage:inRect:", v10, 0.0, 0.0, v12, v13);
    objc_msgSend(v9, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IFImage size](self, "size");
    v16 = v15;
    v18 = v17;
    -[IFImage minimumSize](self, "minimumSize");
    v20 = v19;
    v22 = v21;
    -[IFImage scale](self, "scale");
    v42 = 0;
    v23 = v16;
    v24 = v18;
    v40 = v23;
    v41 = v24;
    v33 = 6;
    v35 = v25;
    v34 = objc_msgSend(v14, "length");
    v26 = v20;
    v27 = v22;
    v38 = v26;
    v39 = v27;
    -[IFImage iconSize](self, "iconSize");
    *(float *)&v28 = v28;
    v36 = LODWORD(v28);
    -[IFImage iconSize](self, "iconSize");
    v30 = v29;
    v37 = v30;
    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "appendBytes:length:", &v33, 48);
    objc_msgSend(v31, "appendData:", v14);
    v3 = (void *)objc_msgSend(v31, "copy");

  }
  return (NSData *)v3;
}

+ (CGImage)escapingCGImageWithCGImage:(CGImage *)a3
{
  NSObject *v4;
  uint64_t v5;
  ISCGImageBlockSet *v6;
  ISCGImageBlockSet *v7;
  id v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  if (CGImageGetProperty() == *MEMORY[0x1E0C9AE50])
  {
    IFDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[IFImage escapingCGImageWithCGImage:].cold.1();

    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    CGImageGetImageProvider();
    v5 = CGImageProviderCopyImageBlockSet();
    if (v5)
    {
      v6 = -[ISCGImageBlockSet initWithBlockSet:]([ISCGImageBlockSet alloc], "initWithBlockSet:", v5);
      CGImageBlockSetRelease();
      CGImageProviderGetSize();
      CGImageProviderGetComponentType();
      CGImageProviderGetColorSpace();
      v7 = v6;
      if (CGImageProviderAuxInfo_onceToken != -1)
        dispatch_once(&CGImageProviderAuxInfo_onceToken, &__block_literal_global_207);
      v8 = objc_retainAutorelease((id)CGImageProviderAuxInfo_auxiliaryInfo);
      v9 = CGImageProviderCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        v11 = (void *)CGImageCreateWithImageProvider();
        CFRelease(v10);
        if (v11)
        {
          CFAutorelease(v11);
          a3 = (CGImage *)v11;
        }
      }

    }
  }
  return a3;
}

- (IFImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  IFCacheImage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[IFCacheImage initWithData:uuid:validationToken:]([IFCacheImage alloc], "initWithData:uuid:validationToken:", v10, v9, v8);

  return &v11->super.super;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[6];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__IFImage_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken != -1)
      dispatch_once(&allocWithZone__onceToken, block);
    return (id)allocWithZone__imageFactory;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___IFImage;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (CGColorSpace)defaultCGColorSpace
{
  if (defaultCGColorSpace_onceToken != -1)
    dispatch_once(&defaultCGColorSpace_onceToken, &__block_literal_global_7);
  return (CGColorSpace *)defaultCGColorSpace_colorSpace;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IFImage;
  return -[IFImage init](&v3, sel_init);
}

+ (CGImage)createCGImageWithBitmapData:(id)a3
{
  return +[IFImage createCGImageWithIFImageData:](IFImage, "createCGImageWithIFImageData:", a3);
}

CGColorSpaceRef __30__IFImage_defaultCGColorSpace__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  defaultCGColorSpace_colorSpace = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageWithContentsOfURL:(id)a3
{
  id v3;
  IFImage *v4;
  IFImage *v5;

  v3 = a3;
  v4 = -[IFImage initWithContentsOfURL:]([IFImage alloc], "initWithContentsOfURL:", v3);

  if (-[IFImage CGImage](v4, "CGImage"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

+ (CGImage)createCGImageWithIFImageData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  CGColorSpace *v10;
  id v11;
  const void *v12;
  uint64_t v13;
  CGDataProvider *v14;
  CGDataProvider *v15;
  CGImage *v16;
  NSObject *v17;

  v3 = a3;
  v4 = objc_msgSend(v3, "__IS_imageHeader");
  if (!v4 || *(_DWORD *)v4 != 6)
    goto LABEL_10;
  LODWORD(v5) = *(_DWORD *)(v4 + 12);
  v6 = (double)v5;
  v7 = *(float *)(v4 + 36) * v6;
  v8 = *(float *)(v4 + 32) * v6;
  if (v8 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_10;
  v10 = +[IFImage defaultCGColorSpace](IFImage, "defaultCGColorSpace");
  v11 = objc_retainAutorelease(v3);
  v12 = (const void *)(objc_msgSend(v11, "bytes") + 48);
  v13 = objc_msgSend(v11, "length");
  v14 = CGDataProviderCreateWithData(v11, v12, v13 - 48, (CGDataProviderReleaseDataCallback)MEMORY[0x1E0C98BC0]);
  if (!v14)
    goto LABEL_10;
  v15 = v14;
  v16 = CGImageCreate((unint64_t)v8, (unint64_t)v7, 8uLL, 0x20uLL, vcvtpd_u64_f64(v8 * 32.0 * 0.125), v10, 1u, v14, 0, 1, kCGRenderingIntentDefault);
  CFRelease(v15);
  if (v16)
  {
    CGImageSetProperty();
  }
  else
  {
LABEL_10:
    IFDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[IFImage createCGImageWithIFImageData:].cold.1();

    v16 = 0;
  }

  return v16;
}

+ (id)createCALayereWithIFImageData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  _BYTE v31[10];
  _BYTE v32[10];
  _DWORD v33[5];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[IFImage createCALayereWithIFImageData:].cold.1();
    goto LABEL_21;
  }
  v5 = objc_msgSend(v3, "__IS_imageHeader");
  if (!v5)
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[IFImage createCALayereWithIFImageData:].cold.2();
    goto LABEL_21;
  }
  v6 = *(unsigned int *)(v5 + 8);
  if (!(_DWORD)v6)
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4106000, v8, OS_LOG_TYPE_INFO, "layerTree data size zero", buf, 2u);
    }
    goto LABEL_21;
  }
  v7 = *(unsigned int *)(v5 + 4);
  if (objc_msgSend(v4, "length") < v6)
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[IFImage createCALayereWithIFImageData:].cold.3(v4, v6, v8);
    goto LABEL_21;
  }
  if (v7 + v6 + 48 > objc_msgSend(v4, "length"))
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      v29 = objc_msgSend(v4, "length");
      v30 = 2048;
      *(_QWORD *)v31 = 48;
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)v32 = v7;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v6;
      v9 = "Incorrect formed data. Data size (%lu) exceeded. Header: %lu, expected bitmap size: %d, expected tree size: %d";
      v10 = v8;
      v11 = 34;
LABEL_28:
      _os_log_error_impl(&dword_1D4106000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v12 = objc_retainAutorelease(v4);
  v13 = objc_msgSend(v12, "bytes") + v7 + 48;
  v14 = objc_retainAutorelease(v12);
  if (v13 < objc_msgSend(v14, "bytes")
    || (v15 = objc_retainAutorelease(v14), v16 = objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length") + v16 <= v13))
  {
    IFDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_retainAutorelease(v14);
      v23 = objc_msgSend(v22, "bytes");
      v24 = objc_retainAutorelease(v22);
      v25 = objc_msgSend(v24, "bytes");
      *(_DWORD *)buf = 134219008;
      v29 = v13;
      v30 = 2048;
      *(_QWORD *)v31 = v23;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)v32 = v25 + objc_msgSend(v24, "length");
      *(_WORD *)&v32[8] = 1024;
      v33[0] = v7;
      LOWORD(v33[1]) = 1024;
      *(_DWORD *)((char *)&v33[1] + 2) = v6;
      v9 = "Incorrect formed layer tree data. Ptr: %p, bounds: [%p - %p], expected bitmap size: %d, expected tree size: %d";
      v10 = v8;
      v11 = 44;
      goto LABEL_28;
    }
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v27;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    IFDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(v15, "length");
      *(_DWORD *)buf = 134219010;
      v29 = 48;
      v30 = 1024;
      *(_DWORD *)v31 = v7;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v6;
      *(_WORD *)v32 = 2048;
      *(_QWORD *)&v32[2] = v26;
      LOWORD(v33[0]) = 2112;
      *(_QWORD *)((char *)v33 + 2) = v18;
      _os_log_error_impl(&dword_1D4106000, v21, OS_LOG_TYPE_ERROR, "Failed to read layer tree data. Header: %lu, expected bitmap size: %d, expected tree size: %d, data size: %lu. Error: %@", buf, 0x2Cu);
    }

  }
LABEL_22:

  return v17;
}

- (IFImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  IFImage *v6;

  v4 = a3;
  objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (IFImage *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:uuid:", v5, 0);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IFImage(ISImagePriv) data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (IFImage)initWithContentsOfURL:(id)a3 scale:(double)a4
{
  CGImageSource *v6;
  CGImageSource *v7;
  CGImageRef ImageAtIndex;
  IFConcreteImage *v9;

  v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v6)
  {
    v7 = v6;
    if (CGImageSourceGetCount(v6))
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
      CFRelease(v7);
      if (ImageAtIndex)
      {
        v9 = -[IFConcreteImage initWithCGImage:scale:]([IFConcreteImage alloc], "initWithCGImage:scale:", ImageAtIndex, a4);

        CFRelease(ImageAtIndex);
        return &v9->super;
      }
    }
    else
    {
      CFRelease(v7);
    }
  }

  return 0;
}

- (IFImage)initWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGImageSource *v13;
  CGImageRef ImageAtIndex;
  void *v15;
  CFDictionaryRef v16;
  void *v17;
  uint64_t v18;
  IFConcreteImage *v19;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IFResourceMetadata metadataWithFileName:](IFResourceMetadata, "metadataWithFileName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v9 = 1.0;
  if (v10 > 1.0)
  {
    objc_msgSend(v7, "scale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v9 = v12;

  }
  v13 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);

  if (v13)
  {
    if (CGImageSourceGetCount(v13))
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
      objc_msgSend(v7, "scale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
        -[__CFDictionary _IF_numberForKey:](v16, "_IF_numberForKey:", *MEMORY[0x1E0CBC9F8]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17
          || (-[__CFDictionary _IF_numberForKey:](v16, "_IF_numberForKey:", *MEMORY[0x1E0CBCA00]),
              (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = 1.0;
          if (objc_msgSend(v17, "integerValue") >= 144)
          {
            v18 = objc_msgSend(v17, "integerValue");
            if (v18 <= 287)
              v9 = (double)(v18 / 72);
            else
              v9 = 1.0;
          }
        }

      }
    }
    else
    {
      ImageAtIndex = 0;
    }
    CFRelease(v13);
  }
  else
  {
    ImageAtIndex = 0;
  }
  v19 = -[IFConcreteImage initWithCGImage:scale:]([IFConcreteImage alloc], "initWithCGImage:scale:", ImageAtIndex, v9);

  if (ImageAtIndex)
    CFRelease(ImageAtIndex);

  return &v19->super;
}

- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  IFConcreteImage *v5;

  v5 = -[IFConcreteImage initWithCGImage:scale:]([IFConcreteImage alloc], "initWithCGImage:scale:", a3, a4);

  return &v5->super;
}

- (CGSize)pixelSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[IFImage size](self, "size");
  v4 = v3;
  v6 = v5;
  -[IFImage scale](self, "scale");
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)placeholder
{
  return -[IFImage validationFlags](self, "validationFlags") & 1;
}

- (BOOL)_isDummyCALayerEnabled
{
  if (_isDummyCALayerEnabled_once != -1)
    dispatch_once(&_isDummyCALayerEnabled_once, &__block_literal_global_35);
  return _isDummyCALayerEnabled_result;
}

void __33__IFImage__isDummyCALayerEnabled__block_invoke()
{
  void *v0;
  int v1;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ISDummyCALayer"));

    if (v1)
      _isDummyCALayerEnabled_result = 1;
  }
}

- (CALayer)CALayer
{
  CALayer *CALayer;
  CALayer *v3;
  IFColor *v5;
  IFColor *v6;
  IFColor *v7;
  IFColor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;

  CALayer = self->_CALayer;
  if (CALayer)
  {
    v3 = CALayer;
  }
  else if (-[IFImage _isDummyCALayerEnabled](self, "_isDummyCALayerEnabled"))
  {
    v5 = -[IFColor initWithSystemColor:]([IFColor alloc], "initWithSystemColor:", 9);
    v6 = -[IFColor initWithSystemColor:]([IFColor alloc], "initWithSystemColor:", 4);
    v7 = -[IFColor initWithSystemColor:]([IFColor alloc], "initWithSystemColor:", 1);
    v8 = -[IFColor initWithSystemColor:]([IFColor alloc], "initWithSystemColor:", 14);
    -[IFImage pixelSize](self, "pixelSize");
    v10 = v9;
    -[IFImage pixelSize](self, "pixelSize");
    v12 = v11;
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[CALayer setFrame:](v3, "setFrame:", 0.0, 0.0, v10, v12);
    -[CALayer setBackgroundColor:](v3, "setBackgroundColor:", -[IFColor cgColor](v5, "cgColor"));
    v13 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v13, "setFrame:", v10 * 0.3, 0.0, v10 - v10 * 0.3, v12);
    objc_msgSend(v13, "setBackgroundColor:", -[IFColor cgColor](v6, "cgColor"));
    -[CALayer addSublayer:](v3, "addSublayer:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v14, "setFrame:", v10 * 0.6, 0.0, v10 - v10 * 0.6, v12);
    objc_msgSend(v14, "setBackgroundColor:", -[IFColor cgColor](v7, "cgColor"));
    -[CALayer addSublayer:](v3, "addSublayer:", v14);
    v15 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v15, "setFrame:", v10 * 0.9, 0.0, v10 - v10 * 0.9, v12);
    objc_msgSend(v15, "setBackgroundColor:", -[IFColor cgColor](v8, "cgColor"));
    -[CALayer addSublayer:](v3, "addSublayer:", v15);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setCALayer:(id)a3
{
  objc_storeStrong((id *)&self->_CALayer, a3);
  -[IFImage setData:](self, "setData:", 0);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)largest
{
  return self->_largest;
}

- (void)setLargest:(BOOL)a3
{
  self->_largest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_CALayer, 0);
}

- (IFImage)initWithData:(id)a3 uuid:(id)a4
{
  return -[IFImage initWithData:uuid:validationToken:](self, "initWithData:uuid:validationToken:", a3, a4, 0);
}

- (IFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 minimumSize:(CGSize)a5 placeholder:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  IFImage *v9;
  IFImage *v10;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v9 = -[IFImage initWithCGImage:scale:](self, "initWithCGImage:scale:", a3, a4);
  v10 = v9;
  if (v9)
  {
    -[IFImage setMinimumSize:](v9, "setMinimumSize:", width, height);
    -[IFImage setPlaceholder:](v10, "setPlaceholder:", v6);
    -[IFImage setValidationFlags:](v10, "setValidationFlags:", v6);
  }
  return v10;
}

- (BOOL)writeToURL:(id)a3
{
  const __CFURL *v4;
  CGImage *v5;
  CGImageDestination *v6;
  BOOL v7;
  BOOL result;
  BOOL v9;

  v4 = (const __CFURL *)a3;
  v5 = (CGImage *)-[IFImage CGImage](self, "CGImage");
  v6 = CGImageDestinationCreateWithURL(v4, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v9 = 0;
    result = 0;
    if (!v6)
      return result;
  }
  else
  {
    CGImageDestinationAddImage(v6, v5, 0);
    v9 = CGImageDestinationFinalize(v6);
  }
  CFRelease(v6);
  return v9;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
}

- (NSData)validationToken
{
  return 0;
}

+ (void)createCGImageWithIFImageData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "Failed to create cgImage from bitmap data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createCALayereWithIFImageData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "No data to extract layer tree from", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createCALayereWithIFImageData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "Failed to read header for layer tree data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createCALayereWithIFImageData:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_1D4106000, a3, OS_LOG_TYPE_ERROR, "Incorrect formed layer tree data. Expected tree size (%d) exceeds data size (%lu)", (uint8_t *)v4, 0x12u);
}

+ (void)escapingCGImageWithCGImage:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1D4106000, v0, OS_LOG_TYPE_DEBUG, "Copying asset catalog backed CGImage's CGImageBlockSet", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
