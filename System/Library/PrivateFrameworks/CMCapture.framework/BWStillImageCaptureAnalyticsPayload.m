@implementation BWStillImageCaptureAnalyticsPayload

- (BWStillImageCaptureAnalyticsPayload)init
{
  BWStillImageCaptureAnalyticsPayload *v2;
  BWStillImageCaptureAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  v2 = -[BWStillImageAnalyticsPayloadCommon init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStillImageCaptureAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  -[BWStillImageAnalyticsPayloadCommon dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  -[BWStillImageAnalyticsPayloadCommon reset](&v3, sel_reset);
  self->_deviceType = 0;
  self->_processingFlags = -1;
  self->_shutterLag = 0x7FFFFFFF;
  self->_zoom = 3.4028e38;
  self->_uiZoom = 3.4028e38;
  self->_numberOfFacesWithVisionFaceDetection = 0x7FFFFFFF;
  self->_largestFaceHeight = 0.0;
  self->_smallestFaceHeight = 0.0;
  self->_numberOfFacesAtEdge = 0;
  self->_numberOfFacesAtCenter = 0;

  self->_oisRecenteringLoggingData = 0;
  self->_intelligentDistortionCorrectionStatusCode = 0x7FFFFFFF;
  self->_intelligentDistortionCorrectionGainMapProcessingStatusCode = 0x7FFFFFFF;
  self->_intelligentDistortionCorrectionCorrectionType = 0x7FFFFFFF;
  self->_ispMotionHighPassFilterConvergenceFlags = 0x7FFFFFFF;
  self->_dngFileSize = 0;
  self->_thumbnailImageSize = 0;
  self->_auxiliaryImagesSize = 0;
  self->_photoFileSize = 0;
  self->_bitDepth = 0;
  self->_depthFormatDimensionWidth = -1;
  self->_depthFormatDimensionHeight = -1;
  strcpy((char *)&self->_depthPixelFormat, "0000");

  self->_focusPixelBlurScoreResult = 0;
  self->_fusionMode = 0;
  self->_dngCodecType = 0;
  self->_dngCodecQuality = 0.0;
}

- (id)eventName
{
  if (-[BWStillImageAnalyticsPayloadCommon deferred](self, "deferred"))
    return CFSTR("com.apple.coremedia.camera.DeferredPhotoCapture");
  else
    return CFSTR("com.apple.coremedia.camera.PhotoCapture");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  NSDictionary *oisRecenteringLoggingData;
  BWStillImageFocusPixelBlurScoreResult *focusPixelBlurScoreResult;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[BWStillImageAnalyticsPayloadCommon eventDictionary](&v9, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfFacesAtEdge), CFSTR("numberOfFacesAtEdge"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfFacesAtCenter), CFSTR("numberOfFacesAtCenter"));
  if (-[BWStillImageAnalyticsPayloadCommon numberOfFaces](self, "numberOfFaces") >= 1 && self->_largestFaceHeight > 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("largestFaceHeight"));
  if (-[BWStillImageAnalyticsPayloadCommon numberOfFaces](self, "numberOfFaces") >= 1
    && self->_smallestFaceHeight > 0.0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("smallestFaceHeight"));
  }
  if (-[BWStillImageAnalyticsPayloadCommon numberOfFaces](self, "numberOfFaces") > 1)
  {
    *(float *)&v4 = self->_largestFaceHeight - self->_smallestFaceHeight;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("deltaFaceHeight"));
  }
  if (self->_deviceType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("deviceType"));
  if (self->_processingFlags != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("processingFlags"));
  if (self->_shutterLag != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("shutterLag"));
  if (self->_zoom != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("zoom"));
  if (self->_uiZoom != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("uiZoom"));
  oisRecenteringLoggingData = self->_oisRecenteringLoggingData;
  if (oisRecenteringLoggingData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959B58), CFSTR("oisMaxRecenteringDistance"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959B78), CFSTR("oisSettleTimeForMaxRecenteringDistance"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959B98), CFSTR("oisMeanRecenteringDistance"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BB8), CFSTR("oisMeanRecenteringSettleTime"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BD8), CFSTR("oisTrackingErrorAtSettleTime"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1E4959BF8), CFSTR("meanMotionDataBiasErrorEstimate"));
  }
  if (self->_intelligentDistortionCorrectionStatusCode != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("intelligentDistortionCorrectionStatusCode"));
  if (self->_intelligentDistortionCorrectionGainMapProcessingStatusCode != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("intelligentDistortionCorrectionGainMapProcessingStatusCode"));
  if (self->_intelligentDistortionCorrectionCorrectionType != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("intelligentDistortionCorrectionCorrectionType"));
  if (self->_ispMotionHighPassFilterConvergenceFlags != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("ispMotionHighPassFilterConvergenceFlags"));
  if (self->_dngFileSize)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("dngFileSize"));
  if (self->_thumbnailImageSize)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("thumbnailImageSize"));
  if (self->_auxiliaryImagesSize)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("auxiliaryImagesSize"));
  if (self->_photoFileSize)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("photoFileSize"));
  if (self->_bitDepth)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("bitDepth"));
  if (self->_numberOfFacesWithVisionFaceDetection != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("numberOfFacesWithVisionFaceDetection"));
  if (self->_depthFormatDimensionWidth != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("depthFormatDimensionWidth"));
  if (self->_depthFormatDimensionHeight != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("depthFormatDimensionHeight"));
  if (-[BWStillImageAnalyticsPayloadCommon depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", BWStringForOSType(self->_depthPixelFormat), CFSTR("depthPixelFormat"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_depthDataFiltered), CFSTR("depthDataFiltered"));
  }
  focusPixelBlurScoreResult = self->_focusPixelBlurScoreResult;
  if (focusPixelBlurScoreResult)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BWStillImageFocusPixelBlurScoreResult status](focusPixelBlurScoreResult, "status")), CFSTR("focusPixelBlurScoreStatus"));
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BWStillImageFocusPixelBlurScoreResult score](self->_focusPixelBlurScoreResult, "score");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithFloat:"), CFSTR("focusPixelBlurScoreScore"));
  }
  if (self->_fusionMode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("fusionMode"));
  if (self->_dngCodecType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("dngCodecType"));
  if (self->_dngCodecQuality != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("dngCodecQuality"));
  return v3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (unsigned)processingFlags
{
  return self->_processingFlags;
}

- (void)setProcessingFlags:(unsigned int)a3
{
  self->_processingFlags = a3;
}

- (int)shutterLag
{
  return self->_shutterLag;
}

- (void)setShutterLag:(int)a3
{
  self->_shutterLag = a3;
}

- (float)zoom
{
  return self->_zoom;
}

- (void)setZoom:(float)a3
{
  self->_zoom = a3;
}

- (float)uiZoom
{
  return self->_uiZoom;
}

- (void)setUiZoom:(float)a3
{
  self->_uiZoom = a3;
}

- (int)numberOfFacesWithVisionFaceDetection
{
  return self->_numberOfFacesWithVisionFaceDetection;
}

- (void)setNumberOfFacesWithVisionFaceDetection:(int)a3
{
  self->_numberOfFacesWithVisionFaceDetection = a3;
}

- (float)largestFaceHeight
{
  return self->_largestFaceHeight;
}

- (void)setLargestFaceHeight:(float)a3
{
  self->_largestFaceHeight = a3;
}

- (float)smallestFaceHeight
{
  return self->_smallestFaceHeight;
}

- (void)setSmallestFaceHeight:(float)a3
{
  self->_smallestFaceHeight = a3;
}

- (int)numberOfFacesAtCenter
{
  return self->_numberOfFacesAtCenter;
}

- (void)setNumberOfFacesAtCenter:(int)a3
{
  self->_numberOfFacesAtCenter = a3;
}

- (int)numberOfFacesAtEdge
{
  return self->_numberOfFacesAtEdge;
}

- (void)setNumberOfFacesAtEdge:(int)a3
{
  self->_numberOfFacesAtEdge = a3;
}

- (NSDictionary)oisRecenteringLoggingData
{
  return self->_oisRecenteringLoggingData;
}

- (void)setOisRecenteringLoggingData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (int)intelligentDistortionCorrectionStatusCode
{
  return self->_intelligentDistortionCorrectionStatusCode;
}

- (void)setIntelligentDistortionCorrectionStatusCode:(int)a3
{
  self->_intelligentDistortionCorrectionStatusCode = a3;
}

- (int)intelligentDistortionCorrectionGainMapProcessingStatusCode
{
  return self->_intelligentDistortionCorrectionGainMapProcessingStatusCode;
}

- (void)setIntelligentDistortionCorrectionGainMapProcessingStatusCode:(int)a3
{
  self->_intelligentDistortionCorrectionGainMapProcessingStatusCode = a3;
}

- (int)intelligentDistortionCorrectionCorrectionType
{
  return self->_intelligentDistortionCorrectionCorrectionType;
}

- (void)setIntelligentDistortionCorrectionCorrectionType:(int)a3
{
  self->_intelligentDistortionCorrectionCorrectionType = a3;
}

- (int)ispMotionHighPassFilterConvergenceFlags
{
  return self->_ispMotionHighPassFilterConvergenceFlags;
}

- (void)setIspMotionHighPassFilterConvergenceFlags:(int)a3
{
  self->_ispMotionHighPassFilterConvergenceFlags = a3;
}

- (unsigned)dngFileSize
{
  return self->_dngFileSize;
}

- (void)setDngFileSize:(unsigned int)a3
{
  self->_dngFileSize = a3;
}

- (unsigned)thumbnailImageSize
{
  return self->_thumbnailImageSize;
}

- (void)setThumbnailImageSize:(unsigned int)a3
{
  self->_thumbnailImageSize = a3;
}

- (unsigned)auxiliaryImagesSize
{
  return self->_auxiliaryImagesSize;
}

- (void)setAuxiliaryImagesSize:(unsigned int)a3
{
  self->_auxiliaryImagesSize = a3;
}

- (unsigned)photoFileSize
{
  return self->_photoFileSize;
}

- (void)setPhotoFileSize:(unsigned int)a3
{
  self->_photoFileSize = a3;
}

- (unsigned)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(unsigned int)a3
{
  self->_bitDepth = a3;
}

- (unsigned)depthFormatDimensionWidth
{
  return self->_depthFormatDimensionWidth;
}

- (void)setDepthFormatDimensionWidth:(unsigned int)a3
{
  self->_depthFormatDimensionWidth = a3;
}

- (unsigned)depthFormatDimensionHeight
{
  return self->_depthFormatDimensionHeight;
}

- (void)setDepthFormatDimensionHeight:(unsigned int)a3
{
  self->_depthFormatDimensionHeight = a3;
}

- (unsigned)depthPixelFormat
{
  return self->_depthPixelFormat;
}

- (void)setDepthPixelFormat:(unsigned int)a3
{
  self->_depthPixelFormat = a3;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (BWStillImageFocusPixelBlurScoreResult)focusPixelBlurScoreResult
{
  return self->_focusPixelBlurScoreResult;
}

- (void)setFocusPixelBlurScoreResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (unsigned)dngCodecType
{
  return self->_dngCodecType;
}

- (void)setDngCodecType:(unsigned int)a3
{
  self->_dngCodecType = a3;
}

- (float)dngCodecQuality
{
  return self->_dngCodecQuality;
}

- (void)setDngCodecQuality:(float)a3
{
  self->_dngCodecQuality = a3;
}

@end
