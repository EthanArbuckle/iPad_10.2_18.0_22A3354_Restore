@implementation AVCapturePhotoRequest

+ (void)initialize
{
  objc_opt_class();
}

+ (id)requestWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:settings:lensStabilizationSupported:", a3, a4, a5);
}

- (AVCapturePhotoRequest)initWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5
{
  AVCapturePhotoRequest *v8;
  AVWeakReferencingDelegateStorage *v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCapturePhotoRequest;
  v8 = -[AVCapturePhotoRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
    v8->_delegateStorage = v9;
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](v9, "setDelegate:queue:", a3, MEMORY[0x1E0C80D38]);
    v8->_unresolvedSettings = (AVCapturePhotoSettings *)a4;
    v8->_lensStabilizationSupported = a5;
    -[AVCapturePhotoRequest _resolveExpectedPhotoManifest](v8, "_resolveExpectedPhotoManifest");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_8;
      v10 = 1;
    }
    v8->_photoCallbackFlavor = v10;
LABEL_8:
    v8->_delegateSupportsDebugMetadataSidecarFile = objc_opt_respondsToSelector() & 1;
    v8->_delegateSupportsMetadataIdentifiersCallback = objc_opt_respondsToSelector() & 1;
  }
  return v8;
}

- (void)dealloc
{
  __IOSurface *previewSurface;
  opaqueCMSampleBuffer *previewSampleBuffer;
  __IOSurface *thumbnailSurface;
  objc_super v6;

  previewSurface = self->_previewSurface;
  if (previewSurface)
    CFRelease(previewSurface);
  previewSampleBuffer = self->_previewSampleBuffer;
  if (previewSampleBuffer)
    CFRelease(previewSampleBuffer);
  thumbnailSurface = self->_thumbnailSurface;
  if (thumbnailSurface)
    CFRelease(thumbnailSurface);
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoRequest;
  -[AVCapturePhotoRequest dealloc](&v6, sel_dealloc);
}

- (AVCaptureResolvedPhotoSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (unint64_t)expectedPhotoCount
{
  return -[NSArray count](self->_expectedPhotoManifest, "count");
}

- (void)setResolvedSettings:(id)a3
{
  NSArray *expectedPhotoManifest;

  if (objc_msgSend(a3, "photoManifest"))
  {
    expectedPhotoManifest = self->_expectedPhotoManifest;
    self->_expectedPhotoManifest = (NSArray *)(id)objc_msgSend(a3, "photoManifest");

  }
  self->_resolvedSettings = (AVCaptureResolvedPhotoSettings *)a3;
}

- (void)_resolveExpectedPhotoManifest
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  id v17;

  v3 = -[AVCapturePhotoSettings formatFourCC](self->_unresolvedSettings, "formatFourCC");
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[AVCapturePhotoSettings isDepthDataDeliveryEnabled](self->_unresolvedSettings, "isDepthDataDeliveryEnabled")
    && -[AVCapturePhotoSettings embedsDepthDataInPhoto](self->_unresolvedSettings, "embedsDepthDataInPhoto"))
  {
    if (-[AVCapturePhotoSettings isDepthDataFiltered](self->_unresolvedSettings, "isDepthDataFiltered"))
      v4 = 32;
    else
      v4 = 16;
  }
  else
  {
    v4 = 0;
  }
  if (-[AVCapturePhotoSettings isBurstQualityCaptureEnabled](self->_unresolvedSettings, "isBurstQualityCaptureEnabled"))
    v5 = v4 | 0x200;
  else
    v5 = v4;
  if (-[AVCapturePhotoSettings HDRMode](self->_unresolvedSettings, "HDRMode"))
  {
    if (-[AVCapturePhotoSettings isEV0PhotoDeliveryEnabled](self->_unresolvedSettings, "isEV0PhotoDeliveryEnabled"))
    {
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 | 1));
      v6 = 2;
    }
    else
    {
      v6 = 1;
    }
    if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", -[AVCapturePhotoSettings rawPhotoPixelFormatType](self->_unresolvedSettings, "rawPhotoPixelFormatType")))
    {
      v7 = 65538;
    }
    else
    {
      v7 = 2;
    }
    objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7 | v5));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend((id)-[AVCapturePhotoSettings bracketedSettings](self->_unresolvedSettings, "bracketedSettings"), "count");
    else
      v6 = 1;
    if (-[NSArray count](-[AVCapturePhotoSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices](self->_unresolvedSettings, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count"))
    {
      v6 *= -[NSArray count](-[AVCapturePhotoSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices](self->_unresolvedSettings, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count");
    }
    if (-[AVCapturePhotoSettings isConstantColorEnabled](self->_unresolvedSettings, "isConstantColorEnabled")
      && -[AVCapturePhotoSettings isConstantColorFallbackPhotoDeliveryEnabled](self->_unresolvedSettings, "isConstantColorFallbackPhotoDeliveryEnabled"))
    {
      v6 = 2;
    }
    else if (!v6)
    {
      goto LABEL_35;
    }
    v8 = v6;
    do
    {
      if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", -[AVCapturePhotoSettings rawPhotoPixelFormatType](self->_unresolvedSettings, "rawPhotoPixelFormatType")))
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 | 0x10000));
      }
      if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", -[AVCapturePhotoSettings rawPhotoPixelFormatType](self->_unresolvedSettings, "rawPhotoPixelFormatType")))
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 | 0x80));
      }
      if (v3)
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
      --v8;
    }
    while (v8);
  }
LABEL_35:
  if (objc_msgSend(-[AVCapturePhotoSettings photoFilters](self->_unresolvedSettings, "photoFilters"), "count") && v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v10 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", i), "unsignedIntValue");
      objc_msgSend(v17, "replaceObjectAtIndex:withObject:", i, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10 | 4u));
    }
  }
  if (objc_msgSend(-[AVCapturePhotoSettings adjustedPhotoFilters](self->_unresolvedSettings, "adjustedPhotoFilters"), "count"))
  {
    v11 = AVCIFilterArrayContainsPortraitFilters(-[AVCapturePhotoSettings adjustedPhotoFilters](self->_unresolvedSettings, "adjustedPhotoFilters"));
    if (objc_msgSend(v17, "count"))
    {
      v12 = 0;
      if (v11)
        v13 = 72;
      else
        v13 = 8;
      do
      {
        v14 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v12), "unsignedIntValue");
        objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13 | v14), v12 + 1);
        v12 += 2;
      }
      while (objc_msgSend(v17, "count") > v12);
    }
  }
  if (-[AVCapturePhotoSettings isAutoSpatialOverCaptureEnabled](self->_unresolvedSettings, "isAutoSpatialOverCaptureEnabled")&& objc_msgSend(v17, "count"))
  {
    v15 = 0;
    do
    {
      v16 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v15), "unsignedIntValue");
      objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 | 0x800u), v15 + 1);
      v15 += 2;
    }
    while (objc_msgSend(v17, "count") > v15);
  }
  self->_expectedPhotoManifest = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v17);

}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (unsigned)photoCallbackFlavor
{
  return self->_photoCallbackFlavor;
}

- (AVCapturePhotoSettings)unresolvedSettings
{
  return self->_unresolvedSettings;
}

- (NSArray)expectedPhotoManifest
{
  return self->_expectedPhotoManifest;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (unint64_t)firedPhotoCallbacksCount
{
  return self->_firedPhotoCallbacksCount;
}

- (void)setFiredPhotoCallbacksCount:(unint64_t)a3
{
  self->_firedPhotoCallbacksCount = a3;
}

- (__IOSurface)previewSurface
{
  return self->_previewSurface;
}

- (void)setPreviewSurface:(__IOSurface *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (opaqueCMSampleBuffer)previewSampleBuffer
{
  return self->_previewSampleBuffer;
}

- (void)setPreviewSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (__IOSurface)thumbnailSurface
{
  return self->_thumbnailSurface;
}

- (void)setThumbnailSurface:(__IOSurface *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)delegateSupportsDebugMetadataSidecarFile
{
  return self->_delegateSupportsDebugMetadataSidecarFile;
}

- (BOOL)delegateSupportsMetadataIdentifiersCallback
{
  return self->_delegateSupportsMetadataIdentifiersCallback;
}

- (BOOL)lensStabilizationSupported
{
  return self->_lensStabilizationSupported;
}

@end
