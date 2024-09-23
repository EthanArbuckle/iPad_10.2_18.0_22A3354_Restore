@implementation LPImage

- (LPImage)init
{

  return 0;
}

- (id)_initWithImage:(id)a3
{
  id v4;
  LPImage *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *MIMEType;
  LPImageProperties *v10;
  LPImageProperties *properties;
  LPImage *v12;
  objc_super v14;

  v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)LPImage,
        v5 = -[LPImage init](&v14, sel_init),
        (self = v5) != 0))
  {
    objc_storeStrong((id *)&v5->_originalPlatformImage, *((id *)v4 + 1));
    objc_storeStrong((id *)&self->_decodedPlatformImage, *((id *)v4 + 2));
    objc_storeStrong((id *)&self->_platformImage, *((id *)v4 + 15));
    self->_isNonFallbackSymbolImage = *((_BYTE *)v4 + 88);
    objc_msgSend(v4, "_cachedAtomicData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[LPImage set_cachedAtomicData:](self, "set_cachedAtomicData:", v7);

    v8 = (NSString *)objc_msgSend(*((id *)v4 + 3), "copy");
    MIMEType = self->_MIMEType;
    self->_MIMEType = v8;

    objc_storeStrong((id *)&self->_fileURL, *((id *)v4 + 16));
    v10 = (LPImageProperties *)objc_msgSend(*((id *)v4 + 4), "copy");
    properties = self->_properties;
    self->_properties = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_initWithImage:(id)a3 properties:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  id *v10;

  v7 = a4;
  v8 = -[LPImage _initWithImage:](self, "_initWithImage:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a4);
    v10 = v9;
  }

  return v9;
}

- (LPImage)initWithData:(id)a3 MIMEType:(id)a4
{
  id v6;
  id v7;
  LPImageProperties *v8;
  LPImage *v9;
  LPImage *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(LPImageProperties);
  v9 = -[LPImage initWithData:MIMEType:properties:](self, "initWithData:MIMEType:properties:", v6, v7, v8);

  if (v9)
    v10 = v9;

  return v9;
}

- (LPImage)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPImage *v11;
  uint64_t v12;
  LPImageProperties *properties;
  LPImage *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPImage;
  v11 = -[LPImage init](&v16, sel_init);
  if (v11)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPImage with nil data."));
    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPImage with nil MIME type."));
    -[LPImage set_cachedAtomicData:](v11, "set_cachedAtomicData:", v8);
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    v12 = objc_msgSend(v10, "copy");
    properties = v11->_properties;
    v11->_properties = (LPImageProperties *)v12;

    v14 = v11;
  }

  return v11;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4
{
  id v6;
  id v7;
  LPImageProperties *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(LPImageProperties);
  v9 = -[LPImage initByReferencingFileURL:MIMEType:properties:](self, "initByReferencingFileURL:MIMEType:properties:", v6, v7, v8);

  if (v9)
    v10 = v9;

  return v9;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPImage *v11;
  uint64_t v12;
  LPImageProperties *properties;
  LPImage *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPImage;
  v11 = -[LPImage init](&v16, sel_init);
  if (!v11)
    goto LABEL_10;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPImage with nil file URL."));
  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPImage with nil MIME type."));
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPImage with URL which is not a file URL."));
  if (objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0))
  {
    -[LPImage setFileURL:](v11, "setFileURL:", v8);
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    v12 = objc_msgSend(v10, "copy");
    properties = v11->_properties;
    v11->_properties = (LPImageProperties *)v12;

    v14 = v11;
  }
  else
  {
LABEL_10:
    v14 = 0;
  }

  return v14;
}

- (LPImage)initWithPlatformImage:(id)a3
{
  id v4;
  LPImageProperties *v5;
  LPImage *v6;
  LPImage *v7;

  v4 = a3;
  v5 = objc_alloc_init(LPImageProperties);
  v6 = -[LPImage initWithPlatformImage:properties:](self, "initWithPlatformImage:properties:", v4, v5);

  if (v6)
    v7 = v6;

  return v6;
}

- (LPImage)initWithPlatformImage:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  LPImage *v9;
  LPImage *v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v12 = LPLogChannelImage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[LPImage initWithPlatformImage:properties:].cold.1(v12);
    v10 = 0;
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)LPImage;
  v9 = -[LPImage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalPlatformImage, a3);
    v11 = objc_msgSend(v8, "copy");
    self = (LPImage *)v10->_properties;
    v10->_properties = (LPImageProperties *)v11;
LABEL_7:

  }
  return v10;
}

- (LPImage)initWithItemProvider:(id)a3 properties:(id)a4 placeholderImage:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  LPImage *v15;
  LPImage *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MIMEType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[LPImage initWithData:MIMEType:](self, "initWithData:MIMEType:", v13, v14);

    if (!v15)
      goto LABEL_8;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)LPImage;
    v15 = -[LPImage init](&v18, sel_init);
    if (!v15)
      goto LABEL_8;
  }
  objc_storeStrong((id *)&v15->_itemProvider, a3);
  if (v10)
    objc_storeStrong((id *)&v15->_properties, a4);
  v16 = v15;
LABEL_8:

  return v15;
}

- (id)_initWithCGImage:(CGImage *)a3
{
  LPImageProperties *v5;
  id v6;

  v5 = objc_alloc_init(LPImageProperties);
  v6 = -[LPImage _initWithCGImage:properties:](self, "_initWithCGImage:properties:", a3, v5);

  return v6;
}

- (id)_initWithCGImage:(CGImage *)a3 properties:(id)a4
{
  id v6;
  void *v7;
  LPImage *v8;
  LPImage *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "_lp_createImageWithCGImage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LPImage initWithPlatformImage:properties:](self, "initWithPlatformImage:properties:", v7, v6);

  if (v8)
  {
    v8->_isAnimated = 0;
    v8->_hasComputedIsAnimated = 1;
    v9 = v8;
  }

  return v8;
}

+ (id)_systemImageNamed:(id)a3
{
  +[LPImage _systemImageNamed:withSymbolConfiguration:](LPImage, "_systemImageNamed:withSymbolConfiguration:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_systemImageNamed:(id)a3 withSymbolConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  LPImage *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v8, "_lp_imageByApplyingSymbolConfiguration:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    v11 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v9);
    objc_storeStrong((id *)&v11->_symbolName, a3);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_initWithPlatformImageGenerator:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  LPImage *v8;
  uint64_t v9;
  LPImageProperties *properties;
  dispatch_group_t v11;
  NSObject *v12;
  NSObject *v13;
  LPImage *v14;
  LPImage *v15;
  _QWORD v17[4];
  LPImage *v18;
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)LPImage;
  v8 = -[LPImage init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    properties = v8->_properties;
    v8->_properties = (LPImageProperties *)v9;

    v11 = dispatch_group_create();
    -[LPImage _setAsynchronousLoadGroup:](v8, "_setAsynchronousLoadGroup:", v11);

    -[LPImage _asynchronousLoadGroup](v8, "_asynchronousLoadGroup");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v12);

    if (asyncImageLoadingSerialRequestQueue_onceToken != -1)
      dispatch_once(&asyncImageLoadingSerialRequestQueue_onceToken, &__block_literal_global_308);
    v13 = asyncImageLoadingSerialRequestQueue_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke;
    v17[3] = &unk_1E44A7E78;
    v19 = v6;
    v14 = v8;
    v18 = v14;
    dispatch_async(v13, v17);
    v15 = v14;

  }
  return v8;
}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
  if (!MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore)
  {
    v3 = dispatch_semaphore_create(4);
    v4 = (void *)MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
    MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore = (uint64_t)v3;

    v2 = MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore;
  }
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  if (asyncImageLoadingQueue_onceToken != -1)
    dispatch_once(&asyncImageLoadingQueue_onceToken, &__block_literal_global_310);
  v5 = asyncImageLoadingQueue_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_2;
  v6[3] = &unk_1E44A7E78;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, v6);

}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_3;
  v2[3] = &unk_1E44A7E50;
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

void __54__LPImage__initWithPlatformImageGenerator_properties___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = LPLogChannelImage();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 134218240;
    v9 = v6;
    v10 = 1024;
    v11 = v4 != 0;
    _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image (success: %d)", (uint8_t *)&v8, 0x12u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  objc_msgSend(*(id *)(a1 + 32), "_asynchronousLoadGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v7);

  dispatch_semaphore_signal((dispatch_semaphore_t)MIMETypeForDataCreatedFromPlatformImage_block_invoke_limitSemaphore);
  objc_msgSend(*(id *)(a1 + 32), "_setAsynchronousLoadGroup:", 0);

}

- (void)_computeDominantColorForProperties
{
  void *v3;
  void *v4;
  id v5;

  -[LPImage platformImage](self, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lp_dominantColors");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[LPImageProperties setHasSingleDominantColor:](self->_properties, "setHasSingleDominantColor:", objc_msgSend(v5, "count") == 1);
  objc_msgSend(v5, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImageProperties setDominantColor:](self->_properties, "setDominantColor:", v4);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPImage;
  if (!-[LPImage isEqual:](&v13, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_17;
    }
    v6 = (void **)v4;
    if ((objectsAreEqual(v6[1], self->_originalPlatformImage) & 1) != 0)
    {
      objc_msgSend(v6, "_cachedAtomicData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objectsAreEqual(v7, v8);

      if ((v9 & 1) != 0
        && objectsAreEqual(v6[3], self->_MIMEType)
        && objectsAreEqual(v6[16], self->_fileURL)
        && objectsAreEqual(v6[4], self->_properties)
        && !v6[5]
        && !self->_itemProvider)
      {
        objc_msgSend(v6, "_asynchronousLoadGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

        }
        else
        {
          -[LPImage _asynchronousLoadGroup](self, "_asynchronousLoadGroup");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            v5 = *((unsigned __int8 *)v6 + 88) == self->_isNonFallbackSymbolImage;
            goto LABEL_16;
          }
        }
      }
    }
    v5 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v5 = 1;
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_MIMEType, "hash") ^ v4;

  return v5;
}

- (void)_waitForAsynchronouslyLoadedImageIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "LPImage<%p>: taking too long in _waitForAsynchronouslyLoadedImageIfNeeded", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (id)_PNGImageNamed:(id)a3
{
  objc_msgSend(a1, "_PNGImageNamed:template:properties:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_PNGImageNamed:(id)a3 template:(BOOL)a4 properties:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  LPImage *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = +[LPTestingOverrides forceImageLoadingScaleFactor](LPTestingOverrides, "forceImageLoadingScaleFactor");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v10 = [LPImage alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__LPImage__PNGImageNamed_template_properties___block_invoke;
  v18[3] = &unk_1E44A7EA0;
  v20 = &v23;
  v21 = v9;
  v11 = v7;
  v19 = v11;
  v22 = a4;
  v12 = -[LPImage _initWithPlatformImageGenerator:properties:](v10, "_initWithPlatformImageGenerator:properties:", v18, v8);
  v13 = (void *)v24[5];
  v24[5] = v12;

  v14 = LPLogChannelImage();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v24[5];
    *(_DWORD *)buf = 134218242;
    v30 = v15;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_INFO, "LPImage<%p>: created async image for %@", buf, 0x16u);
  }
  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __46__LPImage__PNGImageNamed_template_properties___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = LPLogChannelImage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v17 = 134217984;
    v18 = v5;
    _os_log_impl(&dword_1A0C41000, v4, OS_LOG_TYPE_INFO, "LPImage<%p>: started loading async image", (uint8_t *)&v17, 0xCu);
  }
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_5;
  v6 = (void *)MEMORY[0x1E0DC3870];
  v7 = *(_QWORD *)(a1 + 32);
  linkPresentationBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithDisplayScale:", (double)*(unint64_t *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_5:
    v11 = (void *)MEMORY[0x1E0DC3870];
    v12 = *(_QWORD *)(a1 + 32);
    linkPresentationBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageNamed:inBundle:withConfiguration:", v12, v13, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v15 = LPLogChannelImage();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v17 = 134217984;
    v18 = v16;
    _os_log_impl(&dword_1A0C41000, v15, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image", (uint8_t *)&v17, 0xCu);
  }
  v3[2](v3, v10);

}

+ (id)_PDFImageNamed:(id)a3 template:(BOOL)a4
{
  id v5;
  LPImage *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v6 = [LPImage alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __35__LPImage__PDFImageNamed_template___block_invoke;
  v14[3] = &unk_1E44A7EC8;
  v16 = &v18;
  v7 = v5;
  v15 = v7;
  v17 = a4;
  v8 = -[LPImage _initWithPlatformImageGenerator:properties:](v6, "_initWithPlatformImageGenerator:properties:", v14, 0);
  v9 = (void *)v19[5];
  v19[5] = v8;

  v10 = LPLogChannelImage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v19[5];
    *(_DWORD *)buf = 134218242;
    v25 = v11;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1A0C41000, v10, OS_LOG_TYPE_INFO, "LPImage<%p>: created async LPImage for %@", buf, 0x16u);
  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __35__LPImage__PDFImageNamed_template___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = LPLogChannelImage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = 134217984;
    v14 = v5;
    _os_log_impl(&dword_1A0C41000, v4, OS_LOG_TYPE_INFO, "LPImage<%p>: started loading async image", (uint8_t *)&v13, 0xCu);
  }
  v6 = (void *)MEMORY[0x1E0DC3870];
  v7 = *(_QWORD *)(a1 + 32);
  linkPresentationBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = LPLogChannelImage();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = 134217984;
    v14 = v12;
    _os_log_impl(&dword_1A0C41000, v11, OS_LOG_TYPE_INFO, "LPImage<%p>: finished loading async image", (uint8_t *)&v13, 0xCu);
  }
  v3[2](v3, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPImage)initWithCoder:(id)a3
{
  id v4;
  LPImage *v5;
  uint64_t v6;
  UIImage *originalPlatformImage;
  void *v8;
  void *v9;
  UIImage *v10;
  uint64_t v11;
  NSString *MIMEType;
  LPImageProperties *v13;
  LPImageProperties *properties;
  void *v15;
  void *v16;
  void *v17;
  LPImage *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPImage;
  v5 = -[LPImage init](&v20, sel_init);
  if (!v5)
    goto LABEL_11;
  if (objc_msgSend(v4, "_lp_coderType") == 1)
  {
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalPlatformImage = v5->_originalPlatformImage;
    v5->_originalPlatformImage = (UIImage *)v6;

  }
  objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImage set_cachedAtomicData:](v5, "set_cachedAtomicData:", v8);

  if (-[LPImage _isSubstitute](v5, "_isSubstitute"))
    goto LABEL_8;
  -[LPImage _cachedAtomicData](v5, "_cachedAtomicData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    v10 = v5->_originalPlatformImage;

    if (v10)
      goto LABEL_8;
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }

LABEL_8:
  objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
  v11 = objc_claimAutoreleasedReturnValue();
  MIMEType = v5->_MIMEType;
  v5->_MIMEType = (NSString *)v11;

  v13 = objc_alloc_init(LPImageProperties);
  properties = v5->_properties;
  v5->_properties = v13;

  objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImageProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v15);

  objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", CFSTR("overlaidTextColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImageProperties setOverlaidTextColor:](v5->_properties, "setOverlaidTextColor:", v16);

  objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", CFSTR("dominantColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImageProperties setDominantColor:](v5->_properties, "setDominantColor:", v17);

  -[LPImageProperties setHasSingleDominantColor:](v5->_properties, "setHasSingleDominantColor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSingleDominantColor")));
  -[LPImageProperties setType:](v5->_properties, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageType")));
  if (-[LPImageProperties type](v5->_properties, "type") >= 7)
    -[LPImageProperties setType:](v5->_properties, "setType:", 0);
  v18 = v5;
LABEL_12:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  if (objc_msgSend(v4, "_lp_coderType") == 1)
  {
    -[LPImage _existingPlatformImage](self, "_existingPlatformImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_lp_isSymbolImage");
    if (v6)
      objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("platformImage"));

  }
  else
  {
    if (-[LPImage needsAsynchronousLoad](self, "needsAsynchronousLoad"))
    {
      v7 = LPLogChannelSerialization();
      v6 = 0;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "Trying to encode an LPImage with an unloaded item provider.", v12, 2u);
    }
    v6 = 0;
  }
LABEL_9:
  if (((-[LPImage _isSubstitute](self, "_isSubstitute") | v6) & 1) == 0)
  {
    -[LPImage data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v8, CFSTR("data"));

  }
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[LPImageProperties accessibilityText](self->_properties, "accessibilityText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", v9, CFSTR("accessibilityText"));

  -[LPImageProperties overlaidTextColor](self->_properties, "overlaidTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", v10, CFSTR("overlaidTextColor"));

  -[LPImageProperties dominantColor](self->_properties, "dominantColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", v11, CFSTR("dominantColor"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LPImageProperties hasSingleDominantColor](self->_properties, "hasSingleDominantColor"), CFSTR("hasSingleDominantColor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LPImageProperties type](self->_properties, "type"), CFSTR("imageType"));

}

- (BOOL)_canEncodeWithoutComputation
{
  void *v3;
  BOOL v4;
  void *v5;

  -[LPImage _existingPlatformImage](self, "_existingPlatformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_lp_isSymbolImage") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)setFileURL:(id)a3
{
  NSURL *v4;
  NSURL *fileURL;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) != 0)
    v4 = (NSURL *)v6;
  else
    v4 = 0;
  fileURL = self->_fileURL;
  self->_fileURL = v4;

}

+ (id)_loadImageSubsampledToScreenSizeFromData:(id)a3
{
  const __CFData *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  const __CFDictionary *v11;
  const __CFData *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFDictionaryRef v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  CGImageSource *v31;
  CGImage *ImageAtIndex;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFData *)a3;
  if (-[__CFData length](v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "_lp_mainScreenScale");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "_lp_mainScreenSize");
    v7 = v6;
    v9 = v8;
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11 = (const __CFDictionary *)objc_msgSend(v10, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD288], 0);
    v12 = (const __CFData *)-[__CFData copy](v3, "copy");

    v13 = CGImageSourceCreateWithData(v12, v11);
    v14 = v13;
    if (v13)
    {
      if (CGImageSourceGetCount(v13))
      {
        v15 = CGImageSourceCopyPropertiesAtIndex(v14, 0, v11);
        -[__CFDictionary objectForKey:](v15, "objectForKey:", *MEMORY[0x1E0CBD048]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary objectForKey:](v15, "objectForKey:", *MEMORY[0x1E0CBD040]);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16
          && v17
          && (objc_msgSend(v16, "doubleValue"),
              v20 = v19,
              objc_msgSend(v18, "doubleValue"),
              v22 = v21,
              !sizeIsEmptyOrInvalid(v20, v21)))
        {
          sizeFittingInsideSizeMaintainingAspectRatio(v20, v22, v5 * v7, v5 * v9);
          v26 = fmin(v20 / v24, v22 / v25);
          if (v26 < 2.0)
            goto LABEL_25;
          v27 = 8.0;
          if (v26 < 8.0)
            v27 = 4.0;
          if (v26 >= 4.0)
            v28 = v27;
          else
            v28 = 2.0;
          v29 = LPLogChannelImage();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            v34 = v20;
            v35 = 2048;
            v36 = v22;
            v37 = 2048;
            v38 = v28;
            _os_log_debug_impl(&dword_1A0C41000, v29, OS_LOG_TYPE_DEBUG, "Subsampling %g x %g image by %gx", buf, 0x20u);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CBD290]);

          CFRelease(v14);
          v31 = CGImageSourceCreateWithData(v12, v11);
          v14 = v31;
          if (!v31)
            goto LABEL_12;
          if (CGImageSourceGetCount(v31))
          {
LABEL_25:
            ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, v11);
            CFRelease(v14);
            objc_msgSend(MEMORY[0x1E0DC3870], "_lp_createImageWithCGImage:", ImageAtIndex);
            v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
            CGImageRelease(ImageAtIndex);
            goto LABEL_12;
          }
          CFRelease(v14);
        }
        else
        {
          CFRelease(v14);
        }
        v14 = 0;
LABEL_12:

        goto LABEL_13;
      }
      CFRelease(v14);
      v14 = 0;
    }
LABEL_13:

    v3 = v12;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_existingPlatformImage
{
  UIImage *decodedPlatformImage;
  UIImage *v4;

  decodedPlatformImage = self->_decodedPlatformImage;
  if (decodedPlatformImage
    || (-[LPImage _waitForAsynchronouslyLoadedImageIfNeeded](self, "_waitForAsynchronouslyLoadedImageIfNeeded"),
        (decodedPlatformImage = self->_originalPlatformImage) != 0))
  {
    v4 = decodedPlatformImage;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (UIImage)platformImage
{
  LPImage *v2;
  UIImage *v3;
  UIImage *platformImage;
  UIImage *v5;
  uint64_t v6;
  UIImage *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[LPImage _existingPlatformImage](v2, "_existingPlatformImage");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  platformImage = v3;
  if (v3 || (platformImage = v2->_platformImage) != 0)
  {
LABEL_8:
    v5 = platformImage;
    goto LABEL_9;
  }
  -[LPImage data](v2, "data");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (+[LPSettings subsampleImagesToScreenSize](LPSettings, "subsampleImagesToScreenSize"))
    {
      +[LPImage _loadImageSubsampledToScreenSizeFromData:](LPImage, "_loadImageSubsampledToScreenSizeFromData:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v5);
    }
    v7 = v2->_platformImage;
    v2->_platformImage = (UIImage *)v6;

    platformImage = v2->_platformImage;
    goto LABEL_8;
  }
LABEL_9:

  objc_sync_exit(v2);
  return v5;
}

- (void)_synchronouslyDecodePlatformImageWithMaximumSize:(CGSize)a3
{
  double height;
  double width;
  const __CFData *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CGImage *ThumbnailAtIndex;
  LPImage *v16;
  UIImage *v17;
  UIImage *decodedPlatformImage;
  UIImage *originalPlatformImage;
  UIImage *platformImage;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  if (!self->_decodedPlatformImage)
  {
    height = a3.height;
    width = a3.width;
    -[LPImage _waitForAsynchronouslyLoadedImageIfNeeded](self, "_waitForAsynchronouslyLoadedImageIfNeeded");
    -[LPImage data](self, "data");
    v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = MEMORY[0x1E0C9AAB0];
      v8 = *MEMORY[0x1E0CBD178];
      v21[0] = *MEMORY[0x1E0CBD288];
      v21[1] = v8;
      v22[0] = MEMORY[0x1E0C9AAB0];
      v22[1] = MEMORY[0x1E0C9AAB0];
      v21[2] = *MEMORY[0x1E0CBD2A0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)fmax(width, height));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0CBD190];
      v22[2] = v9;
      v22[3] = v7;
      v11 = *MEMORY[0x1E0CBD2B8];
      v21[3] = v10;
      v21[4] = v11;
      v21[5] = *MEMORY[0x1E0CBD240];
      v22[4] = v7;
      v22[5] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v13 = CGImageSourceCreateWithData(v6, 0);
      v14 = v13;
      if (v13)
      {
        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v13, 0, v12);
        if (ThumbnailAtIndex)
        {
          v16 = self;
          objc_sync_enter(v16);
          objc_msgSend(MEMORY[0x1E0DC3870], "_lp_createImageWithCGImage:", ThumbnailAtIndex);
          v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
          decodedPlatformImage = self->_decodedPlatformImage;
          self->_decodedPlatformImage = v17;

          originalPlatformImage = v16->_originalPlatformImage;
          v16->_originalPlatformImage = 0;

          platformImage = v16->_platformImage;
          v16->_platformImage = 0;

          objc_sync_exit(v16);
          CFRelease(v14);
          CGImageRelease(ThumbnailAtIndex);
        }
        else
        {
          CFRelease(v14);
        }
      }

    }
  }
}

- (NSData)data
{
  void *v3;

  -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[LPImage _waitForAsynchronouslyLoadedImageIfNeeded](self, "_waitForAsynchronouslyLoadedImageIfNeeded");
    if (self->_originalPlatformImage)
    {
      -[LPImage _createDataFromPlatformImage](self, "_createDataFromPlatformImage");
    }
    else if (self->_fileURL)
    {
      -[LPImage _mapDataFromFileURL](self, "_mapDataFromFileURL");
    }
  }
  return -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
}

- (NSString)MIMEType
{
  NSString *MIMEType;
  __CFString *v3;

  MIMEType = self->_MIMEType;
  if (!MIMEType)
  {
    -[LPImage _waitForAsynchronouslyLoadedImageIfNeeded](self, "_waitForAsynchronouslyLoadedImageIfNeeded");
    if (self->_originalPlatformImage)
    {
      v3 = CFSTR("image/png");
      return (NSString *)v3;
    }
    MIMEType = self->_MIMEType;
  }
  v3 = MIMEType;
  return (NSString *)v3;
}

- (LPImageProperties)properties
{
  return (LPImageProperties *)(id)-[LPImageProperties copy](self->_properties, "copy");
}

- (void)_createDataFromPlatformImage
{
  void *v2;
  LPImage *v3;
  UIImage *originalPlatformImage;
  void *v5;
  NSString *MIMEType;
  LPImage *obj;

  obj = self;
  objc_sync_enter(obj);
  -[LPImage _cachedAtomicData](obj, "_cachedAtomicData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = obj;
  if (!v2)
  {
    -[LPImage _waitForAsynchronouslyLoadedImageIfNeeded](obj, "_waitForAsynchronouslyLoadedImageIfNeeded");
    v3 = obj;
    originalPlatformImage = obj->_originalPlatformImage;
    if (originalPlatformImage)
    {
      if (obj->_useLossyCompressionForEncodedData)
        UIImageJPEGRepresentation(originalPlatformImage, 0.8);
      else
        UIImagePNGRepresentation(originalPlatformImage);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImage set_cachedAtomicData:](obj, "set_cachedAtomicData:", v5);

      MIMEType = obj->_MIMEType;
      obj->_MIMEType = (NSString *)CFSTR("image/png");

      v3 = obj;
    }
  }
  objc_sync_exit(v3);

}

- (void)_mapDataFromFileURL
{
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, a2, a3, "LPImage: Failed to load data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (unint64_t)_encodedSize
{
  void *v3;
  unint64_t v4;

  if (self->_fileURL)
    return -[NSURL _lp_fileSize](self->_fileURL, "_lp_fileSize");
  -[LPImage data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (CGSize)_pixelSize
{
  LPImage *v2;
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasComputedPixelSize)
  {
    -[LPImage platformImage](v2, "platformImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_lp_pixelSize");
    v2->_pixelSize.width = v4;
    v2->_pixelSize.height = v5;

    v2->_hasComputedPixelSize = 1;
  }
  width = v2->_pixelSize.width;
  height = v2->_pixelSize.height;
  objc_sync_exit(v2);

  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_isImperceptible
{
  double v2;
  double v3;

  -[LPImage _pixelSize](self, "_pixelSize");
  return v3 <= 1.0 || v2 <= 1.0;
}

- (BOOL)_isAnimated
{
  void *v3;
  _BOOL4 v4;
  const __CFData *v5;
  CGImageSource *v6;

  if (!self->_hasComputedIsAnimated)
  {
    self->_hasComputedIsAnimated = 1;
    -[LPImage MIMEType](self, "MIMEType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[LPMIMETypeRegistry isNonAnimatedMultiframeImageType:](LPMIMETypeRegistry, "isNonAnimatedMultiframeImageType:", v3);

    if (v4)
    {
      self->_isAnimated = 0;
    }
    else
    {
      -[LPImage data](self, "data");
      v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v6 = CGImageSourceCreateWithData(v5, MEMORY[0x1E0C9AA70]);

      self->_isAnimated = CGImageSourceGetCount(v6) > 1;
      CFRelease(v6);
    }
  }
  return self->_isAnimated;
}

- (NSString)_srcsetForRemoteURLs
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  LPImage *v14;

  -[LPImage _remoteURLsForEmailCompatibleOutput](self, "_remoteURLsForEmailCompatibleOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSString *)&stru_1E44AB1C8;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[LPImage _remoteURLsForEmailCompatibleOutput](self, "_remoteURLsForEmailCompatibleOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __31__LPImage__srcsetForRemoteURLs__block_invoke;
  v12 = &unk_1E44A7EF0;
  v6 = v4;
  v13 = v6;
  v14 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return (NSString *)v7;
}

void __31__LPImage__srcsetForRemoteURLs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v13 = v5;
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %dx"), v9, objc_msgSend(v13, "scale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v10);

  objc_msgSend(*(id *)(a1 + 40), "_remoteURLsForEmailCompatibleOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;

  if (v12 != a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));

}

- (BOOL)needsAsynchronousLoad
{
  return self->_itemProvider != 0;
}

- (BOOL)hasPlaceholderValueForAsynchronousLoad
{
  void *v2;
  BOOL v3;

  if (!self->_itemProvider)
    return 0;
  -[LPImage _cachedAtomicData](self, "_cachedAtomicData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)loadAsynchronouslyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *itemProviderLoadGroup;
  uint64_t v6;
  OS_dispatch_group *v7;
  OS_dispatch_group *v8;
  NSItemProvider *itemProvider;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  itemProviderLoadGroup = self->_itemProviderLoadGroup;
  v6 = MEMORY[0x1E0C809B0];
  if (!itemProviderLoadGroup)
  {
    v7 = (OS_dispatch_group *)dispatch_group_create();
    v8 = self->_itemProviderLoadGroup;
    self->_itemProviderLoadGroup = v7;

    dispatch_group_enter((dispatch_group_t)self->_itemProviderLoadGroup);
    itemProvider = self->_itemProvider;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E44A7F38;
    v13[4] = self;
    -[NSItemProvider _lp_loadFirstDataRepresentationMatchingMIMETypePredicate:completionHandler:](itemProvider, "_lp_loadFirstDataRepresentationMatchingMIMETypePredicate:completionHandler:", &__block_literal_global_2, v13);
    itemProviderLoadGroup = self->_itemProviderLoadGroup;
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E44A7F60;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(itemProviderLoadGroup, MEMORY[0x1E0C80D38], block);

}

BOOL __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LPMIMETypeRegistry isImageType:](LPMIMETypeRegistry, "isImageType:", a2);
}

void __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LPImage *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    v6 = [LPImage alloc];
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LPImage initWithData:MIMEType:properties:](v6, "initWithData:MIMEType:properties:", v11, v5, v7);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));

}

uint64_t __51__LPImage_loadAsynchronouslyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[6])
  {
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    objc_msgSend(v4, "_cachedAtomicData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      return v9();
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    v5 = *(_QWORD *)(a1 + 40);
  }
  v9 = *(uint64_t (**)(void))(v5 + 16);
  return v9();
}

- (NSItemProvider)_itemProvider
{
  NSItemProvider *itemProvider;
  NSItemProvider *v3;
  void *v5;
  void *v6;
  void *v7;

  itemProvider = self->_itemProvider;
  if (itemProvider)
  {
    v3 = itemProvider;
  }
  else
  {
    -[LPImage data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB36C8];
    -[LPImage MIMEType](self, "MIMEType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_itemProviderWithData:MIMEType:", v5, v7);
    v3 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_asTemplate
{
  void *v3;
  uint64_t v4;
  LPImage *v5;
  void *v6;
  void *v7;
  LPImage *v8;
  void *v9;

  -[LPImage platformImage](self, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "renderingMode");

  if (v4 == 2)
  {
    v5 = self;
  }
  else
  {
    -[LPImage platformImage](self, "platformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [LPImage alloc];
    -[LPImage properties](self, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LPImage initWithPlatformImage:properties:](v8, "initWithPlatformImage:properties:", v7, v9);

  }
  return v5;
}

- (BOOL)_isFallbackIcon
{
  void *v3;
  char v4;
  BOOL result;

  result = !self->_isNonFallbackSymbolImage
        && (-[LPImage platformImage](self, "platformImage"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            v4 = objc_msgSend(v3, "_lp_isSymbolImage"),
            v3,
            (v4 & 1) != 0)
        || self->_fallbackIcon;
  return result;
}

- (BOOL)_hasTransparency
{
  void *v3;

  if (!self->_hasComputedHasTransparency)
  {
    -[LPImage platformImage](self, "platformImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasTransparency = objc_msgSend(v3, "_lp_hasTransparency");

    self->_hasComputedHasTransparency = 1;
  }
  return self->_hasTransparency;
}

- (void)set_fallbackIcon:(BOOL)a3
{
  self->_fallbackIcon = a3;
}

- (NSArray)_remoteURLsForEmailCompatibleOutput
{
  return self->_remoteURLsForEmailCompatibleOutput;
}

- (void)set_remoteURLsForEmailCompatibleOutput:(id)a3
{
  objc_storeStrong((id *)&self->_remoteURLsForEmailCompatibleOutput, a3);
}

- (LPImage)_darkInterfaceAlternativeImage
{
  return self->_darkInterfaceAlternativeImage;
}

- (void)_setDarkInterfaceAlternativeImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkInterfaceAlternativeImage, a3);
}

- (BOOL)_isPrecomposedAppIcon
{
  return self->_precomposedAppIcon;
}

- (void)set_precomposedAppIcon:(BOOL)a3
{
  self->_precomposedAppIcon = a3;
}

- (BOOL)_useLossyCompressionForEncodedData
{
  return self->_useLossyCompressionForEncodedData;
}

- (void)set_useLossyCompressionForEncodedData:(BOOL)a3
{
  self->_useLossyCompressionForEncodedData = a3;
}

- (BOOL)_isNonFallbackSymbolImage
{
  return self->_isNonFallbackSymbolImage;
}

- (void)set_isNonFallbackSymbolImage:(BOOL)a3
{
  self->_isNonFallbackSymbolImage = a3;
}

- (NSString)_symbolName
{
  return self->_symbolName;
}

- (void)setPlatformImage:(id)a3
{
  objc_storeStrong((id *)&self->_platformImage, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (OS_dispatch_group)_asynchronousLoadGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 136, 1);
}

- (void)_setAsynchronousLoadGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSData)_cachedAtomicData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_cachedAtomicData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (id)_alternateHTMLImageGenerator
{
  return self->__alternateHTMLImageGenerator;
}

- (void)set_alternateHTMLImageGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__alternateHTMLImageGenerator, 0);
  objc_storeStrong((id *)&self->__cachedAtomicData, 0);
  objc_storeStrong((id *)&self->__asynchronousLoadGroup, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_platformImage, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_darkInterfaceAlternativeImage, 0);
  objc_storeStrong((id *)&self->_remoteURLsForEmailCompatibleOutput, 0);
  objc_storeStrong((id *)&self->_itemProviderLoadGroup, 0);
  objc_storeStrong((id *)&self->_imageLoadedFromItemProvider, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_decodedPlatformImage, 0);
  objc_storeStrong((id *)&self->_originalPlatformImage, 0);
}

- (id)filledVariant
{
  LPImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A0D1A320();

  return v3;
}

- (BOOL)_isLowResolutionAsImage
{
  LPImage *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1A0D1A598();

  return v3;
}

- (BOOL)_isLowResolutionAsIconWithScaleFactor:(double)a3
{
  LPImage *v4;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = self;
  if (-[LPImage _isFallbackIcon](v4, sel__isFallbackIcon))
  {

    return 0;
  }
  else
  {
    -[LPImage _pixelSize](v4, sel__pixelSize);
    v7 = v6;
    objc_msgSend((id)objc_opt_self(), sel_largestIconSizeInPoints);
    v9 = v8;

    return v7 < v9 * a3;
  }
}

- (void)initWithPlatformImage:(os_log_t)log properties:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "Trying to create an LPImage from a nil LPPlatformImage.", v1, 2u);
}

@end
