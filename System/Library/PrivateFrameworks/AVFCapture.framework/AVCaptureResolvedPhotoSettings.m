@implementation AVCaptureResolvedPhotoSettings

+ (void)initialize
{
  objc_opt_class();
}

+ (id)resolvedSettingsWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33
{
  id v33;
  __int128 v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v47[4];

  v33 = objc_alloc((Class)objc_opt_class());
  v34 = *(_OWORD *)&a27->var0.var3;
  v47[0] = *(_OWORD *)&a27->var0.var0;
  v47[1] = v34;
  v47[2] = *(_OWORD *)&a27->var1.var1;
  LOBYTE(v40) = a33;
  LOWORD(v39) = __PAIR16__(a29, a28);
  LOBYTE(v38) = a25;
  HIBYTE(v37) = a24;
  BYTE6(v37) = a23;
  WORD2(v37) = __PAIR16__(a22, a21);
  WORD1(v37) = __PAIR16__(a20, a19);
  LOWORD(v37) = __PAIR16__(a18, a17);
  LOBYTE(v36) = a9;
  return objc_autorelease((id)objc_msgSend(v33, "_initWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", a3, a4, a5, a6, a7, a8, v36, a10, a11,
                                a12,
                                a13,
                                a14,
                                a15,
                                a16,
                                v37,
                                v38,
                                a26,
                                v47,
                                v39,
                                a30,
                                a31,
                                a32,
                                v40));
}

- (id)_initWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33
{
  AVCaptureResolvedPhotoSettings *v39;
  AVCaptureResolvedPhotoSettingsInternal *v40;
  __int128 v41;
  __int128 v42;
  AVCaptureResolvedPhotoSettingsInternal *internal;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)AVCaptureResolvedPhotoSettings;
  v39 = -[AVCaptureResolvedPhotoSettings init](&v45, sel_init);
  if (v39)
  {
    v40 = objc_alloc_init(AVCaptureResolvedPhotoSettingsInternal);
    v39->_internal = v40;
    if (v40)
    {
      v40->uniqueID = a3;
      v39->_internal->photoDimensions = ($470D365275581EF16070F5A11344F73E)a4;
      v39->_internal->rawPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a5;
      v39->_internal->previewDimensions = ($470D365275581EF16070F5A11344F73E)a6;
      v39->_internal->embeddedThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a7;
      v39->_internal->rawEmbeddedThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a8;
      v39->_internal->livePhotoMovieEnabled = a9;
      v39->_internal->livePhotoMovieDimensions = ($470D365275581EF16070F5A11344F73E)a10;
      v39->_internal->portraitEffectsMatteDimensions = ($470D365275581EF16070F5A11344F73E)a11;
      v39->_internal->hairSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a12;
      v39->_internal->skinSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a13;
      v39->_internal->teethSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a14;
      v39->_internal->glassesSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a15;
      v39->_internal->spatialOverCapturePhotoDimensions = ($470D365275581EF16070F5A11344F73E)a16;
      v39->_internal->turboModeEnabled = a17;
      v39->_internal->flashEnabled = a18;
      v39->_internal->redEyeReductionEnabled = a19;
      v39->_internal->HDREnabled = a20;
      v39->_internal->adjustedPhotoFiltersEnabled = a21;
      v39->_internal->EV0PhotoDeliveryEnabled = a22;
      v39->_internal->stillImageStabilizationEnabled = a23;
      v39->_internal->virtualDeviceFusionEnabled = a24;
      v39->_internal->squareCropEnabled = a25;
      v39->_internal->deferredPhotoProxyDimensions = ($470D365275581EF16070F5A11344F73E)a26;
      v41 = *(_OWORD *)&a27->var0.var0;
      v42 = *(_OWORD *)&a27->var0.var3;
      internal = v39->_internal;
      *(_OWORD *)&internal->photoProcessingTimeRange.duration.timescale = *(_OWORD *)&a27->var1.var1;
      *(_OWORD *)&internal->photoProcessingTimeRange.start.epoch = v42;
      *(_OWORD *)&internal->photoProcessingTimeRange.start.value = v41;
      v39->_internal->contentAwareDistortionCorrectionEnabled = a28;
      v39->_internal->spatialPhotoCaptureEnabled = a29;
      v39->_internal->photoManifest = (NSArray *)objc_msgSend(a30, "copy");
      v39->_internal->digitalFlashUserInterfaceHints = a31;
      v39->_internal->digitalFlashUserInterfaceRGBEstimate = (NSArray *)objc_msgSend(a32, "copy");
      v39->_internal->captureBeforeResolvingSettingsEnabled = a33;
    }
  }
  return v39;
}

- (void)dealloc
{
  AVCaptureResolvedPhotoSettingsInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureResolvedPhotoSettings;
  -[AVCaptureResolvedPhotoSettings dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  AVCaptureResolvedPhotoSettingsInternal *internal;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AVCaptureResolvedPhotoSettingsInternal *v19;
  uint64_t height;
  uint64_t width;
  uint64_t v22;
  CMVideoDimensions v23;
  const __CFString *v24;
  CMVideoDimensions v25;
  const __CFString *v26;
  AVCaptureResolvedPhotoSettingsInternal *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  _BOOL4 contentAwareDistortionCorrectionEnabled;
  _BOOL4 spatialPhotoCaptureEnabled;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  Float64 Seconds;
  AVCaptureResolvedPhotoSettingsInternal *v44;
  NSUInteger v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  CMTime rhs;
  CMTime v56;
  CMTime time;

  internal = self->_internal;
  v4 = &stru_1E421DB28;
  if (internal->flashEnabled)
    v5 = CFSTR(" flash:ON");
  else
    v5 = &stru_1E421DB28;
  v53 = v5;
  if (internal->redEyeReductionEnabled)
    v6 = CFSTR(" red-eye reduction:ON");
  else
    v6 = &stru_1E421DB28;
  if (internal->HDREnabled)
    v7 = CFSTR(" HDR:ON");
  else
    v7 = &stru_1E421DB28;
  if (internal->adjustedPhotoFiltersEnabled)
    v8 = CFSTR(" filters:ON");
  else
    v8 = &stru_1E421DB28;
  if (internal->EV0PhotoDeliveryEnabled)
    v9 = CFSTR(" (EV0:ON)");
  else
    v9 = &stru_1E421DB28;
  if (internal->stillImageStabilizationEnabled)
    v10 = CFSTR(" SIS:ON");
  else
    v10 = &stru_1E421DB28;
  if (internal->virtualDeviceFusionEnabled)
    v11 = CFSTR(" virtualdevice-fusion:ON");
  else
    v11 = &stru_1E421DB28;
  if (internal->squareCropEnabled)
    v12 = CFSTR(" square:ON");
  else
    v12 = &stru_1E421DB28;
  v13 = -[NSArray count](internal->photoManifest, "count");
  v14 = 0x1E0CB3000;
  v15 = &stru_1E421DB28;
  if (v13 >= 2)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v46 = -[NSArray count](self->_internal->photoManifest, "count");
    v17 = v16;
    v14 = 0x1E0CB3000uLL;
    v15 = (const __CFString *)objc_msgSend(v17, "stringWithFormat:", CFSTR(" expected photos:%d"), v46);
  }
  v18 = objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" photo:{%dx%d%@%@%@%@%@%@%@%@%@%@}"), self->_internal->photoDimensions.width, self->_internal->photoDimensions.height, v53, v6, &stru_1E421DB28, v7, v8, v9, v10, v11, v12, v15);
  v19 = self->_internal;
  if (v19->rawPhotoDimensions.width >= 1)
  {
    height = v19->rawPhotoDimensions.height;
    if ((int)height >= 1)
    {
      v4 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" raw:{%dx%d}"), v19->rawPhotoDimensions.width, height);
      v19 = self->_internal;
    }
  }
  width = v19->previewDimensions.width;
  if ((int)width < 1 || (v22 = v19->previewDimensions.height, (int)v22 < 1))
    v52 = &stru_1E421DB28;
  else
    v52 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" prev:{%dx%d}"), width, v22);
  v23 = -[AVCaptureResolvedPhotoSettings embeddedThumbnailDimensions](self, "embeddedThumbnailDimensions");
  v24 = &stru_1E421DB28;
  if (v23.width >= 1 && v23.height >= 1)
    v24 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" thumb:{%dx%d}"), v23, HIDWORD(*(unint64_t *)&v23));
  v25 = -[AVCaptureResolvedPhotoSettings rawEmbeddedThumbnailDimensions](self, "rawEmbeddedThumbnailDimensions");
  v26 = &stru_1E421DB28;
  if (v25.width >= 1 && v25.height >= 1)
    v26 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" raw-thumb:{%dx%d}"), v25, HIDWORD(*(unint64_t *)&v25));
  v27 = self->_internal;
  v54 = v26;
  if (v27->livePhotoMovieEnabled)
  {
    v51 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" mov:{%dx%d}"), v27->livePhotoMovieDimensions.width, v27->livePhotoMovieDimensions.height);
    v27 = self->_internal;
  }
  else
  {
    v51 = &stru_1E421DB28;
  }
  v28 = v27->portraitEffectsMatteDimensions.width;
  if ((int)v28 < 1)
  {
    v50 = &stru_1E421DB28;
  }
  else
  {
    v50 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" portrait-matte:{%dx%d}"), v28, v27->portraitEffectsMatteDimensions.height);
    v27 = self->_internal;
  }
  v29 = v27->hairSegmentationMatteDimensions.width;
  if ((int)v29 < 1)
  {
    v49 = &stru_1E421DB28;
  }
  else
  {
    v49 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" hair-matte:{%dx%d}"), v29, v27->hairSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  v30 = v27->skinSegmentationMatteDimensions.width;
  if ((int)v30 < 1)
  {
    v48 = &stru_1E421DB28;
  }
  else
  {
    v48 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" skin-matte:{%dx%d}"), v30, v27->skinSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  v31 = v27->teethSegmentationMatteDimensions.width;
  v32 = v14;
  if ((int)v31 < 1)
  {
    v47 = &stru_1E421DB28;
  }
  else
  {
    v47 = (const __CFString *)objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR(" teeth-matte:{%dx%d}"), v31, v27->teethSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  v33 = v27->glassesSegmentationMatteDimensions.width;
  v34 = v24;
  if ((int)v33 < 1)
  {
    v35 = &stru_1E421DB28;
  }
  else
  {
    v35 = (const __CFString *)objc_msgSend(*(id *)(v32 + 2368), "stringWithFormat:", CFSTR(" glasses-matte:{%dx%d}"), v33, v27->glassesSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  contentAwareDistortionCorrectionEnabled = v27->contentAwareDistortionCorrectionEnabled;
  spatialPhotoCaptureEnabled = v27->spatialPhotoCaptureEnabled;
  v38 = v27->spatialOverCapturePhotoDimensions.width;
  v39 = &stru_1E421DB28;
  if ((int)v38 < 1)
  {
    v40 = &stru_1E421DB28;
  }
  else
  {
    v40 = (const __CFString *)objc_msgSend(*(id *)(v32 + 2368), "stringWithFormat:", CFSTR(" spatial-overcapture:{%dx%d}"), v38, v27->spatialOverCapturePhotoDimensions.height);
    v27 = self->_internal;
  }
  if (spatialPhotoCaptureEnabled)
    v41 = CFSTR(" spatial-photo:1");
  else
    v41 = &stru_1E421DB28;
  if (contentAwareDistortionCorrectionEnabled)
    v39 = CFSTR(" distortion-correction:1");
  v42 = *(void **)(v32 + 2368);
  time = (CMTime)v27->photoProcessingTimeRange.start;
  Seconds = CMTimeGetSeconds(&time);
  v44 = self->_internal;
  time = (CMTime)v44->photoProcessingTimeRange.start;
  rhs = (CMTime)v44->photoProcessingTimeRange.duration;
  CMTimeAdd(&v56, &time, &rhs);
  return (id)objc_msgSend(*(id *)(v32 + 2368), "stringWithFormat:", CFSTR("uid:%lld %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), self->_internal->uniqueID, v18, v4, v52, v34, v54, v51, v50, v49, v48, v47, v35, v39, v41, v40, objc_msgSend(
                 v42,
                 "stringWithFormat:",
                 CFSTR(" time:%.3f-%.3f"),
                 *(_QWORD *)&Seconds,
                 CMTimeGetSeconds(&v56)));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureResolvedPhotoSettings debugDescription](self, "debugDescription"));
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (CMVideoDimensions)photoDimensions
{
  return (CMVideoDimensions)self->_internal->photoDimensions;
}

- (CMVideoDimensions)previewDimensions
{
  return (CMVideoDimensions)self->_internal->previewDimensions;
}

- (CMVideoDimensions)embeddedThumbnailDimensions
{
  char BoolAnswer;
  AVCaptureResolvedPhotoSettingsInternal *internal;
  CMVideoDimensions *p_embeddedThumbnailDimensions;

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"));
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0
    || internal->embeddedThumbnailDimensions.width
    || (p_embeddedThumbnailDimensions = (CMVideoDimensions *)&internal->rawEmbeddedThumbnailDimensions,
        !internal->rawEmbeddedThumbnailDimensions.width))
  {
    p_embeddedThumbnailDimensions = (CMVideoDimensions *)&internal->embeddedThumbnailDimensions;
  }
  return *p_embeddedThumbnailDimensions;
}

- (CMVideoDimensions)rawEmbeddedThumbnailDimensions
{
  return (CMVideoDimensions)self->_internal->rawEmbeddedThumbnailDimensions;
}

- (CMVideoDimensions)rawPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->rawPhotoDimensions;
}

- (CMVideoDimensions)livePhotoMovieDimensions
{
  return (CMVideoDimensions)self->_internal->livePhotoMovieDimensions;
}

- (CMVideoDimensions)portraitEffectsMatteDimensions
{
  return (CMVideoDimensions)self->_internal->portraitEffectsMatteDimensions;
}

- (CMVideoDimensions)dimensionsForSemanticSegmentationMatteOfType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType
{
  AVCaptureResolvedPhotoSettingsInternal *internal;
  $470D365275581EF16070F5A11344F73E *p_hairSegmentationMatteDimensions;
  int *p_height;
  AVCaptureResolvedPhotoSettingsInternal *v8;
  AVCaptureResolvedPhotoSettingsInternal *v9;
  AVCaptureResolvedPhotoSettingsInternal *v10;

  if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeHair")))
  {
    internal = self->_internal;
    p_hairSegmentationMatteDimensions = &internal->hairSegmentationMatteDimensions;
    p_height = &internal->hairSegmentationMatteDimensions.height;
  }
  else if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeSkin")))
  {
    v8 = self->_internal;
    p_hairSegmentationMatteDimensions = &v8->skinSegmentationMatteDimensions;
    p_height = &v8->skinSegmentationMatteDimensions.height;
  }
  else if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeTeeth")))
  {
    v9 = self->_internal;
    p_hairSegmentationMatteDimensions = &v9->teethSegmentationMatteDimensions;
    p_height = &v9->teethSegmentationMatteDimensions.height;
  }
  else
  {
    if (!-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeGlasses")))return (CMVideoDimensions)0;
    v10 = self->_internal;
    p_hairSegmentationMatteDimensions = &v10->glassesSegmentationMatteDimensions;
    p_height = &v10->glassesSegmentationMatteDimensions.height;
  }
  return (CMVideoDimensions)(p_hairSegmentationMatteDimensions->width | ((unint64_t)*p_height << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)spatialOverCapturePhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->spatialOverCapturePhotoDimensions;
}

- (BOOL)isTurboModeEnabled
{
  return self->_internal->turboModeEnabled;
}

- (BOOL)isFlashEnabled
{
  return self->_internal->flashEnabled;
}

- (BOOL)isRedEyeReductionEnabled
{
  return self->_internal->redEyeReductionEnabled;
}

- (BOOL)isHDREnabled
{
  return self->_internal->HDREnabled;
}

- (BOOL)isAdjustedPhotoFilterRenderingEnabled
{
  return self->_internal->adjustedPhotoFiltersEnabled;
}

- (BOOL)isEV0PhotoDeliveryEnabled
{
  return self->_internal->EV0PhotoDeliveryEnabled;
}

- (BOOL)isStillImageStabilizationEnabled
{
  return self->_internal->stillImageStabilizationEnabled;
}

- (BOOL)isSquareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (BOOL)livePhotoMovieEnabled
{
  return self->_internal->livePhotoMovieEnabled;
}

- (BOOL)isVirtualDeviceFusionEnabled
{
  return self->_internal->virtualDeviceFusionEnabled;
}

- (BOOL)isDualCameraFusionEnabled
{
  return self->_internal->virtualDeviceFusionEnabled;
}

- (NSUInteger)expectedPhotoCount
{
  return -[NSArray count](self->_internal->photoManifest, "count");
}

- (id)photoManifest
{
  return self->_internal->photoManifest;
}

- (CMVideoDimensions)deferredPhotoProxyDimensions
{
  return (CMVideoDimensions)self->_internal->deferredPhotoProxyDimensions;
}

- (CMTimeRange)photoProcessingTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)&self->start.timescale;
  v4 = *(_OWORD *)(v3 + 152);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 136);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 168);
  return self;
}

- (BOOL)isContentAwareDistortionCorrectionEnabled
{
  return self->_internal->contentAwareDistortionCorrectionEnabled;
}

- (BOOL)isSpatialPhotoCaptureEnabled
{
  return self->_internal->spatialPhotoCaptureEnabled;
}

- (BOOL)isCaptureBeforeResolvingSettingsEnabled
{
  return self->_internal->captureBeforeResolvingSettingsEnabled;
}

- (unint64_t)digitalFlashUserInterfaceHints
{
  return self->_internal->digitalFlashUserInterfaceHints;
}

- (id)digitalFlashUserInterfaceRGBEstimate
{
  if (self->_internal->digitalFlashUserInterfaceRGBEstimate)
    return self->_internal->digitalFlashUserInterfaceRGBEstimate;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isFastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

@end
