@implementation VNImageSourceManager

- (VNImageSourceManager)initWithImageURL:(id)a3
{
  id v5;
  VNImageSourceManager *v6;
  NSURL *imageURL;
  NSData *imageData;
  VNImageSourceManager *v9;
  objc_super v11;

  v5 = a3;
  if (v5
    && (v11.receiver = self,
        v11.super_class = (Class)VNImageSourceManager,
        v6 = -[VNImageSourceManager init](&v11, sel_init),
        (self = v6) != 0))
  {
    *(_QWORD *)&v6->_getOrientationLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v6->_loadSubSample2Lock._os_unfair_lock_opaque = 0;
    v6->_loadSubSample8Lock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v6->_imageSourceSubsample1 = 0u;
    *(_OWORD *)&v6->_imageSourceSubsample4 = 0u;
    imageURL = v6->_imageURL;
    v6->_imageURL = 0;

    imageData = self->_imageData;
    self->_imageData = 0;

    self->_orientation = 0;
    objc_storeStrong((id *)&self->_imageURL, a3);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (VNImageSourceManager)initWithImageData:(id)a3
{
  id v5;
  VNImageSourceManager *v6;
  NSURL *imageURL;
  NSData *imageData;
  VNImageSourceManager *v9;
  objc_super v11;

  v5 = a3;
  if (v5
    && (v11.receiver = self,
        v11.super_class = (Class)VNImageSourceManager,
        v6 = -[VNImageSourceManager init](&v11, sel_init),
        (self = v6) != 0))
  {
    *(_QWORD *)&v6->_getOrientationLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v6->_loadSubSample2Lock._os_unfair_lock_opaque = 0;
    v6->_loadSubSample8Lock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v6->_imageSourceSubsample1 = 0u;
    *(_OWORD *)&v6->_imageSourceSubsample4 = 0u;
    imageURL = v6->_imageURL;
    v6->_imageURL = 0;

    imageData = self->_imageData;
    self->_imageData = 0;

    self->_orientation = 0;
    objc_storeStrong((id *)&self->_imageData, a3);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  CGImageSource *imageSourceSubsample1;
  CGImageSource *imageSourceSubsample2;
  CGImageSource *imageSourceSubsample4;
  CGImageSource *imageSourceSubsample8;
  objc_super v7;

  imageSourceSubsample1 = self->_imageSourceSubsample1;
  if (imageSourceSubsample1)
  {
    CFRelease(imageSourceSubsample1);
    self->_imageSourceSubsample1 = 0;
  }
  imageSourceSubsample2 = self->_imageSourceSubsample2;
  if (imageSourceSubsample2)
  {
    CFRelease(imageSourceSubsample2);
    self->_imageSourceSubsample2 = 0;
  }
  imageSourceSubsample4 = self->_imageSourceSubsample4;
  if (imageSourceSubsample4)
  {
    CFRelease(imageSourceSubsample4);
    self->_imageSourceSubsample4 = 0;
  }
  imageSourceSubsample8 = self->_imageSourceSubsample8;
  if (imageSourceSubsample8)
  {
    CFRelease(imageSourceSubsample8);
    self->_imageSourceSubsample8 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)VNImageSourceManager;
  -[VNImageSourceManager dealloc](&v7, sel_dealloc);
}

- (CGImageSource)_cgImageSourceAtAddress:(CGImageSource *)a3 forSubSampleFactor:(unsigned int)a4 protectedWithUnfairLock:(os_unfair_lock_s *)a5 operatingInLowPriority:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  uint64_t v10;
  CGImageSource *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSURL *imageURL;
  CGImageSource *v20;
  NSData *imageData;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("Internal error: image source cannot be NULL"));
  os_unfair_lock_lock(a5);
  v13 = *a3;
  if (!*a3)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 < 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBD240], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD260], v15, *MEMORY[0x1E0CBD2B8], v16, *MEMORY[0x1E0CBD290], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD1D0], 0);

    if (v10 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C9E0F8]);

    }
    imageURL = self->_imageURL;
    if (imageURL)
    {
      v20 = CGImageSourceCreateWithURL((CFURLRef)imageURL, (CFDictionaryRef)v17);
    }
    else
    {
      imageData = self->_imageData;
      if (!imageData)
      {
        v13 = *a3;
        if (a7)
        {
LABEL_9:
          if (!v13)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: cannot create image source"));
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
LABEL_11:

        goto LABEL_12;
      }
      v20 = CGImageSourceCreateWithData((CFDataRef)imageData, (CFDictionaryRef)v17);
    }
    v13 = v20;
    *a3 = v20;
    if (a7)
      goto LABEL_9;
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(a5);
  return v13;
}

- (unsigned)exifOrientation
{
  os_unfair_lock_s *p_getOrientationLock;
  CGImageSource *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  unsigned int v8;

  p_getOrientationLock = &self->_getOrientationLock;
  os_unfair_lock_lock(&self->_getOrientationLock);
  if (!self->_orientation)
  {
    self->_orientation = 1;
    v4 = -[VNImageSourceManager _cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:](self, "_cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:", &self->_imageSourceSubsample1, 1, &self->_loadSubSample1Lock, 0, 0);
    if (v4)
    {
      v5 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
      -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "intValue");
        if (v8 - 1 <= 7)
          self->_orientation = v8;
      }

    }
  }
  os_unfair_lock_unlock(p_getOrientationLock);
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (id)ciImageWithSubSampleFactor:(int)a3 useLowPriority:(_QWORD *)a4 error:
{
  id *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[5];
  _QWORD v19[6];

  v4 = a1;
  v19[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 < 2)
    {
      v12 = *MEMORY[0x1E0CBD260];
      v16[0] = *MEMORY[0x1E0CBD240];
      v16[1] = v12;
      v17[0] = MEMORY[0x1E0C9AAA0];
      v17[1] = MEMORY[0x1E0C9AAB0];
      v16[2] = *MEMORY[0x1E0CBD2B8];
      v17[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *MEMORY[0x1E0C9E0F8];
      v18[0] = *MEMORY[0x1E0CBD240];
      v18[1] = v6;
      if (a3)
        v7 = MEMORY[0x1E0C9AAB0];
      else
        v7 = MEMORY[0x1E0C9AAA0];
      v19[0] = MEMORY[0x1E0C9AAA0];
      v19[1] = v7;
      v8 = *MEMORY[0x1E0CBD2B8];
      v18[2] = *MEMORY[0x1E0CBD260];
      v18[3] = v8;
      v19[2] = MEMORY[0x1E0C9AAB0];
      v19[3] = MEMORY[0x1E0C9AAA0];
      v18[4] = *MEMORY[0x1E0CBD290];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[4] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v10;
    }
    v13 = v4[8];
    if (v13)
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithContentsOfURL:options:", v4[8], v11);
    else
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:options:", v4[9], v11);
    v4 = (id *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v14 = v4;
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot obtain a CIImage from the image source"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

@end
