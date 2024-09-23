@implementation AXMPipelineContextInput

- (AXMPipelineContextInput)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use wrapperWithPixelBuffer:"));

  return 0;
}

+ (AXMPipelineContextInput)new
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use wrapperWithPixelBuffer:"));
  return 0;
}

+ (AXMPipelineContextInput)inputWithCIImage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AXMPipelineContextInput _initWithCIImage:]([AXMPipelineContextInput alloc], "_initWithCIImage:", v3);

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithCIImage:(id)a3 photoLibraryURL:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AXMPipelineContextInput _initWithCIImage:photoLibraryURL:]([AXMPipelineContextInput alloc], "_initWithCIImage:photoLibraryURL:", v6, v5);

  return (AXMPipelineContextInput *)v7;
}

+ (AXMPipelineContextInput)inputWithPixelBuffer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AXMPipelineContextInput _initWithPixelBuffer:]([AXMPipelineContextInput alloc], "_initWithPixelBuffer:", v3);

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AXMPipelineContextInput _initWithURL:]([AXMPipelineContextInput alloc], "_initWithURL:", v3);

  return (AXMPipelineContextInput *)v4;
}

+ (AXMPipelineContextInput)inputWithURL:(id)a3 photoLibraryURL:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AXMPipelineContextInput _initWithURL:photoLibraryURL:]([AXMPipelineContextInput alloc], "_initWithURL:photoLibraryURL:", v6, v5);

  return (AXMPipelineContextInput *)v7;
}

+ (AXMPipelineContextInput)inputWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AXMPipelineContextInput _initWithPHAssetLocalIdentifier:photoLibraryURL:]([AXMPipelineContextInput alloc], "_initWithPHAssetLocalIdentifier:photoLibraryURL:", v6, v5);

  return (AXMPipelineContextInput *)v7;
}

- (id)_initWithCIImage:(id)a3
{
  id v5;
  AXMPipelineContextInput *v6;
  AXMPipelineContextInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  v6 = -[AXMPipelineContextInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_inputType = 0;
    objc_storeStrong((id *)&v6->_ciImage, a3);
  }

  return v7;
}

- (id)_initWithCIImage:(id)a3 photoLibraryURL:(id)a4
{
  id v7;
  id v8;
  AXMPipelineContextInput *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  v9 = -[AXMPipelineContextInput init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_inputType = 0;
    objc_storeStrong((id *)&v9->_ciImage, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)_initWithPixelBuffer:(id)a3
{
  id v5;
  AXMPipelineContextInput *v6;
  AXMPipelineContextInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  v6 = -[AXMPipelineContextInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_inputType = 1;
    objc_storeStrong((id *)&v6->_pixelBuffer, a3);
  }

  return v7;
}

- (id)_initWithURL:(id)a3
{
  id v5;
  AXMPipelineContextInput *v6;
  AXMPipelineContextInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMPipelineContextInput;
  v6 = -[AXMPipelineContextInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_inputType = 2;
    objc_storeStrong((id *)&v6->_URL, a3);
    v7->_cachedImageURLSize = (CGSize)*MEMORY[0x1E0C9D820];
  }

  return v7;
}

- (id)_initWithURL:(id)a3 photoLibraryURL:(id)a4
{
  id v7;
  id v8;
  AXMPipelineContextInput *v9;
  AXMPipelineContextInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  v9 = -[AXMPipelineContextInput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_inputType = 2;
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_cachedImageURLSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_storeStrong((id *)&v10->_photoLibraryURL, a4);
  }

  return v10;
}

- (id)_initWithPHAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  id v7;
  id v8;
  AXMPipelineContextInput *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMPipelineContextInput;
  v9 = -[AXMPipelineContextInput init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_inputType = 3;
    objc_storeStrong((id *)&v9->_phAssetLocalIdentifier, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (void)dealloc
{
  CGColorSpace *extendedSRGBColorSpace;
  objc_super v4;

  extendedSRGBColorSpace = self->_extendedSRGBColorSpace;
  if (extendedSRGBColorSpace)
    CFRelease(extendedSRGBColorSpace);
  v4.receiver = self;
  v4.super_class = (Class)AXMPipelineContextInput;
  -[AXMPipelineContextInput dealloc](&v4, sel_dealloc);
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (AXMPixelBufferWrapper)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CIImage)ciImage
{
  return self->_ciImage;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (NSString)phAssetLocalIdentifier
{
  return self->_phAssetLocalIdentifier;
}

- (CGSize)size
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  void *v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  CGSize result;

  switch(self->_inputType)
  {
    case 0:
      -[CIImage extent](self->_ciImage, "extent");
      width = v5;
      height = v6;
      break;
    case 1:
      -[AXMPixelBufferWrapper orientedSize](self->_pixelBuffer, "orientedSize");
      width = v7;
      height = v8;
      break;
    case 2:
      width = self->_cachedImageURLSize.width;
      if (width == *MEMORY[0x1E0C9D820])
      {
        v9 = CGImageSourceCreateWithURL((CFURLRef)self->_URL, 0);
        v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
        -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("PixelWidth"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        self->_cachedImageURLSize.width = v12;

        -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("PixelHeight"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        self->_cachedImageURLSize.height = v14;

        if (v9)
          CFRelease(v9);

        width = self->_cachedImageURLSize.width;
      }
      height = self->_cachedImageURLSize.height;
      break;
    case 3:
      +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:](AXMPhotoAssetData, "phAssetFromLocalIdentifier:photoLibraryURL:", self->_phAssetLocalIdentifier, self->_photoLibraryURL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      width = (double)(unint64_t)objc_msgSend(v15, "pixelWidth");
      height = (double)(unint64_t)objc_msgSend(v15, "pixelHeight");

      break;
    default:
      break;
  }
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGColorSpace)imageColorSpace
{
  CGColorSpace *result;

  if (self->_inputType
    || !-[CIImage CGImage](self->_ciImage, "CGImage")
    || (result = CGImageGetColorSpace(-[CIImage CGImage](self->_ciImage, "CGImage"))) == 0)
  {
    result = self->_extendedSRGBColorSpace;
    if (!result)
    {
      result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
      self->_extendedSRGBColorSpace = result;
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMPipelineContextInput)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AXMPipelineContextInput *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  AXMPipelineContextInput *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 0:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ciImage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("photoLibraryURL")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoLibraryURL"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[AXMPipelineContextInput _initWithCIImage:photoLibraryURL:](self, "_initWithCIImage:photoLibraryURL:", v7, v8);
        goto LABEL_10;
      }
      v15 = -[AXMPipelineContextInput _initWithCIImage:](self, "_initWithCIImage:", v7);
      goto LABEL_13;
    case 1:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ciImage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "pixelBuffer");
      if (!v11)
        goto LABEL_14;
      v12 = v11;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orientation"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      +[AXMPixelBufferWrapper wrapperWithPixelBuffer:orientation:](AXMPixelBufferWrapper, "wrapperWithPixelBuffer:orientation:", v12, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AXMPipelineContextInput _initWithPixelBuffer:](self, "_initWithPixelBuffer:", v8);
      goto LABEL_10;
    case 2:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AXMPipelineContextInput _initWithURL:](self, "_initWithURL:", v7);
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("photoLibraryURL")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoLibraryURL"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (AXMPipelineContextInput *)objc_msgSend(v10, "_initWithURL:photoLibraryURL:", v7, v8);
LABEL_10:
        self = v9;

      }
      else
      {
        v15 = (AXMPipelineContextInput *)objc_msgSend(v10, "_initWithURL:", v7);
LABEL_13:
        self = v15;
      }
LABEL_14:

LABEL_15:
      return self;
    case 3:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetLocalIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("photoLibraryURL")))
        goto LABEL_14;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoLibraryURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AXMPipelineContextInput _initWithPHAssetLocalIdentifier:photoLibraryURL:](self, "_initWithPHAssetLocalIdentifier:photoLibraryURL:", v7, v8);
      goto LABEL_10;
    default:
      goto LABEL_15;
  }
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMPipelineContextInput inputType](self, "inputType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("inputType"));

  if (!-[AXMPipelineContextInput inputType](self, "inputType"))
  {
    -[AXMPipelineContextInput ciImage](self, "ciImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("ciImage");
    goto LABEL_11;
  }
  if (-[AXMPipelineContextInput inputType](self, "inputType") != 1)
  {
    if (-[AXMPipelineContextInput inputType](self, "inputType") == 2)
    {
      -[AXMPipelineContextInput URL](self, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("URL");
    }
    else
    {
      if (-[AXMPipelineContextInput inputType](self, "inputType") != 3)
        goto LABEL_13;
      -[AXMPipelineContextInput phAssetLocalIdentifier](self, "phAssetLocalIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("assetLocalIdentifier");
    }
LABEL_11:
    objc_msgSend(v15, "encodeObject:forKey:", v13, v14);

    -[AXMPipelineContextInput photoLibraryURL](self, "photoLibraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("photoLibraryURL"));
LABEL_12:

    goto LABEL_13;
  }
  -[AXMPipelineContextInput pixelBuffer](self, "pixelBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pixelBuffer");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C9DDC8];
    -[AXMPipelineContextInput pixelBuffer](self, "pixelBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithCVPixelBuffer:", objc_msgSend(v8, "pixelBuffer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("ciImage"));
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[AXMPipelineContextInput pixelBuffer](self, "pixelBuffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "orientation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("orientation"));

    }
    goto LABEL_12;
  }
LABEL_13:

}

- (id)description
{
  unint64_t inputType;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  inputType = self->_inputType;
  if (inputType > 3)
    v3 = &stru_1E6260C18;
  else
    v3 = off_1E625E200[inputType];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXMPipelineContextInput;
  -[AXMPipelineContextInput description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGImage)createCGImageWithMetrics:(id)a3
{
  id v4;
  id v5;
  CGImage *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke;
  v8[3] = &unk_1E625E1E0;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "measure:execute:", CFSTR("Convert to CGImage"), v8);
  v6 = (CGImage *)v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  CGImage *v7;
  const __CFURL *v8;
  CGDataProvider *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v3 = a2;
  v5 = (id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 8);
  if (v6 == 2)
  {
    objc_msgSend((id)v4, "URL");
    v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v9 = CGDataProviderCreateWithURL(v8);

    if (v9)
    {
      v10 = CGImageSourceCreateWithDataProvider(v9, 0);
      if (v10)
      {
        v11 = v10;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGImageSourceCreateImageAtIndex(v10, 0, 0);
        CFRelease(v11);
      }
      CGDataProviderRelease(v9);
    }
    else
    {
      AXMediaLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke_cold_1(v5, v14);

    }
  }
  else if (!v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(v4 + 16), "CGImage");
    v7 = *(CGImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGImageRetain(v7);
    }
    else
    {
      AXMCoreImageContext(*(void **)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(v13, "extent");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "createCGImage:fromRect:", v13);

    }
  }

}

- (__CVBuffer)wrappedPixelBuffer
{
  int64_t inputType;
  void *v3;
  void *v4;
  __CVBuffer *v5;

  inputType = self->_inputType;
  if (inputType == 1)
  {
    -[AXMPipelineContextInput pixelBuffer](self, "pixelBuffer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!inputType)
  {
    -[AXMPipelineContextInput ciImage](self, "ciImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v3;
    v5 = (__CVBuffer *)objc_msgSend(v3, "pixelBuffer");

    return v5;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_ciImage, 0);
}

void __52__AXMPipelineContextInput_createCGImageWithMetrics___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not create CGDataProviderRef for URL: %@", (uint8_t *)&v4, 0xCu);

}

@end
