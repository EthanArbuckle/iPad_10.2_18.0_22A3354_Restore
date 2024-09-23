@implementation VCVirtualAVCaptureDeviceFormat

- (BOOL)isVideoStabilizationModeSupported:(int64_t)a3
{
  return self->_videoStabilizationMode;
}

- (void)setFormatDescription:(opaqueCMFormatDescription *)a3
{
  opaqueCMFormatDescription *formatDescription;

  formatDescription = self->_formatDescription;
  self->_formatDescription = a3;
  if (a3)
    CFRetain(a3);
  if (formatDescription)
    CFRelease(formatDescription);
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (id)description
{
  return -[VCVirtualAVCaptureDeviceFormat descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (id)descriptionWithLocale:(id)a3
{
  return -[VCVirtualAVCaptureDeviceFormat descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0, 0);
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v4);
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  formatDescription = self->_formatDescription;
  if (formatDescription)
  {
    CFRelease(formatDescription);
    self->_formatDescription = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCVirtualAVCaptureDeviceFormat;
  -[VCVirtualAVCaptureDeviceFormat dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  float videoFieldOfView;
  float v7;
  int videoBinned;
  int videoStabilizationSupported;
  double videoMaxZoomFactor;
  double v11;
  double videoZoomFactorUpscaleThreshold;
  double v13;
  float minISO;
  float v15;
  float maxISO;
  float v17;
  int globalToneMappingSupported;
  int videoHDRSupported;
  int width;
  int height;
  int highPhotoQualitySupported;
  int highestPhotoQualitySupported;
  int portraitEffectSupported;
  int64_t autoFocusSystem;
  double videoMinZoomFactorForDepthDataDelivery;
  double v27;
  double videoMaxZoomFactorForDepthDataDelivery;
  double v29;
  int centerStageSupported;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  CMTime v36;
  CMTime time1;
  CMTime time2;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_43;
  v5 = -[NSString isEqual:](self->_mediaType, "isEqual:", objc_msgSend(a3, "mediaType"));
  if (!v5)
    return v5;
  v5 = CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
  if (!v5)
    return v5;
  v5 = -[NSArray isEqual:](self->_videoSupportedFrameRateRanges, "isEqual:", objc_msgSend(a3, "videoSupportedFrameRateRanges"));
  if (!v5)
    return v5;
  videoFieldOfView = self->_videoFieldOfView;
  objc_msgSend(a3, "videoFieldOfView");
  if ((float)(videoFieldOfView - v7) >= 0.00000011921)
    goto LABEL_43;
  videoBinned = self->_videoBinned;
  if (videoBinned != objc_msgSend(a3, "isVideoBinned"))
    goto LABEL_43;
  videoStabilizationSupported = self->_videoStabilizationSupported;
  if (videoStabilizationSupported != objc_msgSend(a3, "isVideoStabilizationSupported"))
    goto LABEL_43;
  videoMaxZoomFactor = self->_videoMaxZoomFactor;
  objc_msgSend(a3, "videoMaxZoomFactor");
  if (videoMaxZoomFactor - v11 >= 2.22044605e-16)
    goto LABEL_43;
  videoZoomFactorUpscaleThreshold = self->_videoZoomFactorUpscaleThreshold;
  objc_msgSend(a3, "videoZoomFactorUpscaleThreshold");
  if (videoZoomFactorUpscaleThreshold - v13 >= 2.22044605e-16)
    goto LABEL_43;
  if (a3)
    objc_msgSend(a3, "minExposureDuration");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = (CMTime)self->_minExposureDuration;
  if (CMTimeCompare(&time1, &time2))
    goto LABEL_43;
  if (a3)
    objc_msgSend(a3, "maxExposureDuration");
  else
    memset(&v36, 0, sizeof(v36));
  time1 = (CMTime)self->_maxExposureDuration;
  if (CMTimeCompare(&time1, &v36))
    goto LABEL_43;
  minISO = self->_minISO;
  objc_msgSend(a3, "minISO");
  if ((float)(minISO - v15) >= 0.00000011921)
    goto LABEL_43;
  maxISO = self->_maxISO;
  objc_msgSend(a3, "maxISO");
  if ((float)(maxISO - v17) >= 0.00000011921)
    goto LABEL_43;
  globalToneMappingSupported = self->_globalToneMappingSupported;
  if (globalToneMappingSupported != objc_msgSend(a3, "isGlobalToneMappingSupported"))
    goto LABEL_43;
  videoHDRSupported = self->_videoHDRSupported;
  if (videoHDRSupported != objc_msgSend(a3, "isVideoHDRSupported"))
    goto LABEL_43;
  width = self->_highResolutionStillImageDimensions.width;
  if (width != objc_msgSend(a3, "highResolutionStillImageDimensions"))
    goto LABEL_43;
  height = self->_highResolutionStillImageDimensions.height;
  if (height != (unint64_t)objc_msgSend(a3, "highResolutionStillImageDimensions") >> 32)
    goto LABEL_43;
  highPhotoQualitySupported = self->_highPhotoQualitySupported;
  if (highPhotoQualitySupported != objc_msgSend(a3, "isHighPhotoQualitySupported"))
    goto LABEL_43;
  highestPhotoQualitySupported = self->_highestPhotoQualitySupported;
  if (highestPhotoQualitySupported != objc_msgSend(a3, "isHighestPhotoQualitySupported"))
    goto LABEL_43;
  portraitEffectSupported = self->_portraitEffectSupported;
  if (portraitEffectSupported != objc_msgSend(a3, "isPortraitEffectSupported"))
    goto LABEL_43;
  autoFocusSystem = self->_autoFocusSystem;
  if (autoFocusSystem != objc_msgSend(a3, "autoFocusSystem"))
    goto LABEL_43;
  v5 = -[NSArray isEqual:](self->_supportedColorSpaces, "isEqual:", objc_msgSend(a3, "supportedColorSpaces"));
  if (!v5)
    return v5;
  videoMinZoomFactorForDepthDataDelivery = self->_videoMinZoomFactorForDepthDataDelivery;
  objc_msgSend(a3, "videoMinZoomFactorForDepthDataDelivery");
  if (videoMinZoomFactorForDepthDataDelivery - v27 >= 2.22044605e-16)
    goto LABEL_43;
  videoMaxZoomFactorForDepthDataDelivery = self->_videoMaxZoomFactorForDepthDataDelivery;
  objc_msgSend(a3, "videoMaxZoomFactorForDepthDataDelivery");
  if (videoMaxZoomFactorForDepthDataDelivery - v29 >= 2.22044605e-16)
    goto LABEL_43;
  v5 = -[NSArray isEqual:](self->_supportedVideoZoomFactorsForDepthDataDelivery, "isEqual:", objc_msgSend(a3, "supportedVideoZoomFactorsForDepthDataDelivery"));
  if (!v5)
    return v5;
  v5 = -[NSArray isEqual:](self->_supportedDepthDataFormats, "isEqual:", objc_msgSend(a3, "supportedDepthDataFormats"));
  if (!v5)
    return v5;
  v5 = -[NSArray isEqual:](self->_unsupportedCaptureOutputClasses, "isEqual:", objc_msgSend(a3, "unsupportedCaptureOutputClasses"));
  if (!v5)
    return v5;
  v5 = -[NSArray isEqual:](self->_supportedMaxPhotoDimensions, "isEqual:", objc_msgSend(a3, "supportedMaxPhotoDimensions"));
  if (!v5)
    return v5;
  v5 = -[NSArray isEqual:](self->_secondaryNativeResolutionZoomFactors, "isEqual:", objc_msgSend(a3, "secondaryNativeResolutionZoomFactors"));
  if (!v5)
    return v5;
  centerStageSupported = self->_centerStageSupported;
  if (centerStageSupported != objc_msgSend(a3, "isCenterStageSupported")
    || (v31 = -[VCVirtualAVCaptureDeviceFormat isVideoStabilizationModeSupported:](self, "isVideoStabilizationModeSupported:", -1), v31 != objc_msgSend(a3, "isVideoStabilizationModeSupported:", -1)))
  {
LABEL_43:
    LOBYTE(v5) = 0;
    return v5;
  }
  v32 = -1;
  do
  {
    v33 = v32;
    if (v32 == 3)
      break;
    ++v32;
    v34 = -[VCVirtualAVCaptureDeviceFormat isVideoStabilizationModeSupported:](self, "isVideoStabilizationModeSupported:", v33 + 1);
  }
  while (v34 == objc_msgSend(a3, "isVideoStabilizationModeSupported:", v33 + 1));
  LOBYTE(v5) = v33 > 2;
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)videoSupportedFrameRateRanges
{
  return self->_videoSupportedFrameRateRanges;
}

- (void)setVideoSupportedFrameRateRanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (float)videoFieldOfView
{
  return self->_videoFieldOfView;
}

- (void)setVideoFieldOfView:(float)a3
{
  self->_videoFieldOfView = a3;
}

- (BOOL)isVideoBinned
{
  return self->_videoBinned;
}

- (void)setVideoBinned:(BOOL)a3
{
  self->_videoBinned = a3;
}

- (BOOL)isVideoStabilizationSupported
{
  return self->_videoStabilizationSupported;
}

- (void)setVideoStabilizationSupported:(BOOL)a3
{
  self->_videoStabilizationSupported = a3;
}

- (double)videoMaxZoomFactor
{
  return self->_videoMaxZoomFactor;
}

- (void)setVideoMaxZoomFactor:(double)a3
{
  self->_videoMaxZoomFactor = a3;
}

- (double)videoZoomFactorUpscaleThreshold
{
  return self->_videoZoomFactorUpscaleThreshold;
}

- (void)setVideoZoomFactorUpscaleThreshold:(double)a3
{
  self->_videoZoomFactorUpscaleThreshold = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setMinExposureDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_minExposureDuration.value = *(_OWORD *)&a3->var0;
  self->_minExposureDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setMaxExposureDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_maxExposureDuration.value = *(_OWORD *)&a3->var0;
  self->_maxExposureDuration.epoch = var3;
}

- (float)minISO
{
  return self->_minISO;
}

- (void)setMinISO:(float)a3
{
  self->_minISO = a3;
}

- (float)maxISO
{
  return self->_maxISO;
}

- (void)setMaxISO:(float)a3
{
  self->_maxISO = a3;
}

- (BOOL)isGlobalToneMappingSupported
{
  return self->_globalToneMappingSupported;
}

- (void)setGlobalToneMappingSupported:(BOOL)a3
{
  self->_globalToneMappingSupported = a3;
}

- (BOOL)isVideoHDRSupported
{
  return self->_videoHDRSupported;
}

- (void)setVideoHDRSupported:(BOOL)a3
{
  self->_videoHDRSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_highResolutionStillImageDimensions;
}

- (void)setHighResolutionStillImageDimensions:(id)a3
{
  self->_highResolutionStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)isHighPhotoQualitySupported
{
  return self->_highPhotoQualitySupported;
}

- (void)setHighPhotoQualitySupported:(BOOL)a3
{
  self->_highPhotoQualitySupported = a3;
}

- (BOOL)isHighestPhotoQualitySupported
{
  return self->_highestPhotoQualitySupported;
}

- (void)setHighestPhotoQualitySupported:(BOOL)a3
{
  self->_highestPhotoQualitySupported = a3;
}

- (BOOL)isPortraitEffectSupported
{
  return self->_portraitEffectSupported;
}

- (void)setPortraitEffectSupported:(BOOL)a3
{
  self->_portraitEffectSupported = a3;
}

- (int64_t)autoFocusSystem
{
  return self->_autoFocusSystem;
}

- (void)setAutoFocusSystem:(int64_t)a3
{
  self->_autoFocusSystem = a3;
}

- (NSArray)supportedColorSpaces
{
  return self->_supportedColorSpaces;
}

- (void)setSupportedColorSpaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (double)videoMinZoomFactorForDepthDataDelivery
{
  return self->_videoMinZoomFactorForDepthDataDelivery;
}

- (void)setVideoMinZoomFactorForDepthDataDelivery:(double)a3
{
  self->_videoMinZoomFactorForDepthDataDelivery = a3;
}

- (double)videoMaxZoomFactorForDepthDataDelivery
{
  return self->_videoMaxZoomFactorForDepthDataDelivery;
}

- (void)setVideoMaxZoomFactorForDepthDataDelivery:(double)a3
{
  self->_videoMaxZoomFactorForDepthDataDelivery = a3;
}

- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery
{
  return self->_supportedVideoZoomFactorsForDepthDataDelivery;
}

- (void)setSupportedVideoZoomFactorsForDepthDataDelivery:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSArray)supportedDepthDataFormats
{
  return self->_supportedDepthDataFormats;
}

- (void)setSupportedDepthDataFormats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSArray)unsupportedCaptureOutputClasses
{
  return self->_unsupportedCaptureOutputClasses;
}

- (void)setUnsupportedCaptureOutputClasses:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSArray)supportedMaxPhotoDimensions
{
  return self->_supportedMaxPhotoDimensions;
}

- (void)setSupportedMaxPhotoDimensions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  return self->_secondaryNativeResolutionZoomFactors;
}

- (void)setSecondaryNativeResolutionZoomFactors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (BOOL)isCenterStageSupported
{
  return self->_centerStageSupported;
}

- (void)setCenterStageSupported:(BOOL)a3
{
  self->_centerStageSupported = a3;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (BOOL)isStudioLightSupported
{
  return self->_studioLightSupported;
}

- (void)setStudioLightSupported:(BOOL)a3
{
  self->_studioLightSupported = a3;
}

@end
