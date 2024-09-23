@implementation __CTAdaptiveImageGlyphStorage

+ (id)adaptiveImageGlyphStorageWithContentIdentifier:(id)a3 imageContent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CTAdaptiveImageGlyphStorage *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CTAdaptiveImageGlyphStorage *v14;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend((id)__CTAdaptiveImageGlyphStorageCache, "objectForKey:", v6);
  v8 = (__CTAdaptiveImageGlyphStorage *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v8)
    {
      v8 = -[__CTAdaptiveImageGlyphStorage initWithImageContent:]([__CTAdaptiveImageGlyphStorage alloc], "initWithImageContent:", v5);
      if (v8)
      {
        v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
        if (__CTAdaptiveImageGlyphStorageCache)
        {
          if (v6)
            goto LABEL_11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)__CTAdaptiveImageGlyphStorageCache;
          __CTAdaptiveImageGlyphStorageCache = v10;

          v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
          if (v6)
            goto LABEL_11;
        }
        -[__CTAdaptiveImageGlyphStorage contentIdentifier](v8, "contentIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = v13;

          v8 = v14;
LABEL_12:

          goto LABEL_13;
        }
        v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
LABEL_11:
        -[__CTAdaptiveImageGlyphStorage contentIdentifier](v8, "contentIdentifier");
        v14 = (__CTAdaptiveImageGlyphStorage *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v14);
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  objc_sync_exit(v7);

  return v8;
}

- (__CTAdaptiveImageGlyphStorage)initWithImageContent:(id)a3
{
  const __CFData *v4;
  __CTAdaptiveImageGlyphStorage *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CFDictionaryRef v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSData *imageContent;
  uint64_t v16;
  NSString *contentIdentifier;
  uint64_t v18;
  __CTAdaptiveImageGlyphStorage *imageDescription;
  objc_super v21;

  v4 = (const __CFData *)a3;
  v21.receiver = self;
  v21.super_class = (Class)__CTAdaptiveImageGlyphStorage;
  v5 = -[__CTAdaptiveImageGlyphStorage init](&v21, sel_init);
  if (!v5)
    goto LABEL_14;
  v6 = CGImageSourceCreateWithData(v4, 0);
  v7 = v6;
  if (v6)
  {
    if (CGImageSourceGetCount(v6))
    {
      v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD098]);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0A8]);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v7);
    v10 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  v10 = 0;
  v11 = 0;
LABEL_10:
  v12 = v10;
  v13 = v11;
  v5->_imageSourceRef = v7;
  if (v7)
  {
    v14 = -[__CFData copy](v4, "copy");
    imageContent = v5->_imageContent;
    v5->_imageContent = (NSData *)v14;

    v16 = objc_msgSend(v12, "copy");
    contentIdentifier = v5->_contentIdentifier;
    v5->_contentIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    imageDescription = (__CTAdaptiveImageGlyphStorage *)v5->_imageDescription;
    v5->_imageDescription = (NSString *)v18;
  }
  else
  {
    imageDescription = v5;
    v5 = 0;
  }

LABEL_14:
  return v5;
}

- (void)dealloc
{
  CGImageSource *imageSourceRef;
  objc_super v4;

  imageSourceRef = self->_imageSourceRef;
  if (imageSourceRef)
    CFRelease(imageSourceRef);
  v4.receiver = self;
  v4.super_class = (Class)__CTAdaptiveImageGlyphStorage;
  -[__CTAdaptiveImageGlyphStorage dealloc](&v4, sel_dealloc);
}

+ (void)flushInstanceCache
{
  objc_msgSend((id)__CTAdaptiveImageGlyphStorageCache, "removeAllObjects");
}

- (NSData)_fallbackImageData
{
  NSData *fallbackImageData;
  NSData **p_fallbackImageData;
  __CFData *v6;
  CGImageDestinationRef v7;
  CGImageDestination *v8;
  size_t Count;
  size_t v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  double v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  double v18;
  NSData *v19;

  p_fallbackImageData = &self->_fallbackImageData;
  fallbackImageData = self->_fallbackImageData;
  if (fallbackImageData)
    return fallbackImageData;
  v6 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = CGImageDestinationCreateWithData(v6, CFSTR("public.png"), 1uLL, 0);
  if (v7)
  {
    v8 = v7;
    Count = CGImageSourceGetCount(self->_imageSourceRef);
    if (Count)
    {
      v10 = Count;
      v11 = 0;
      v12 = *MEMORY[0x1E0CBD040];
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v14 = 0.0;
      do
      {
        v15 = CGImageSourceCopyPropertiesAtIndex(self->_imageSourceRef, v11, 0);
        -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "doubleValue");
          if (v18 >= v14)
          {
            v13 = v11;
            v14 = v18;
          }
        }

        ++v11;
      }
      while (v10 != v11);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        CGImageDestinationAddImageFromSource(v8, self->_imageSourceRef, v13, 0);
        if (CGImageDestinationFinalize(v8))
          objc_storeStrong((id *)p_fallbackImageData, v6);
      }
    }
    CFRelease(v8);
    v19 = *p_fallbackImageData;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSData)_RTFDImageData
{
  NSData *RTFDImageData;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CGImage *v9;
  size_t Width;
  size_t Height;
  void *v12;
  CTEmojiImageAsset *v13;
  NSData *v14;
  NSData *v15;
  void *v17;
  uint64_t i;
  void *v19;

  RTFDImageData = self->_RTFDImageData;
  if (!RTFDImageData)
  {
    v4 = __CTEmojiImageSourceCopyImageStrikes(self->_imageSourceRef);
    v5 = objc_msgSend(v4, "count");
    if (!v5)
      goto LABEL_10;
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CGImage *)objc_msgSend(v8, "cgImage");

      Width = CGImageGetWidth(v9);
      Height = CGImageGetHeight(v9);
      if (Width == 64 && Height == 64)
        break;
      if (v6 == ++v7)
        goto LABEL_10;
    }
    if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v17);

      for (i = 0; i != v6; ++i)
      {
        if (v7 != i)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
      }

    }
    else
    {
LABEL_10:
      v12 = v4;
    }
    v13 = -[CTEmojiImageAsset initWithContentIdentifier:shortDescription:strikeImages:]([CTEmojiImageAsset alloc], "initWithContentIdentifier:shortDescription:strikeImages:", self->_contentIdentifier, self->_imageDescription, v12);
    -[CTEmojiImageAsset imageData](v13, "imageData");
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    v15 = self->_RTFDImageData;
    self->_RTFDImageData = v14;

    RTFDImageData = self->_RTFDImageData;
  }
  return RTFDImageData;
}

- (NSData)imageContent
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)imageDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CGImageSource)imageSourceRef
{
  return self->_imageSourceRef;
}

- (id)_nominalTextAttachment
{
  return self->_nominalTextAttachment;
}

- (void)_setNominalTextAttachment:(id)a3
{
  objc_storeStrong(&self->_nominalTextAttachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nominalTextAttachment, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_imageContent, 0);
  objc_storeStrong((id *)&self->_RTFDImageData, 0);
  objc_storeStrong((id *)&self->_fallbackImageData, 0);
}

@end
