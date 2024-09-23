@implementation FigCaptureIrisSinkConfiguration

- (int)sinkType
{
  return 10;
}

- (BOOL)irisApplyPreviewShift
{
  return self->_movieCaptureEnabled;
}

- (id)copyXPCEncoding
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[12];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v11, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "irisMovieCaptureEnabled", -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](self, "irisMovieCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "irisMovieCaptureSuspended", -[FigCaptureIrisSinkConfiguration irisMovieCaptureSuspended](self, "irisMovieCaptureSuspended"));
  xpc_dictionary_set_BOOL(v3, "preservesIrisMovieCaptureSuspendedOnSessionStop", -[FigCaptureIrisSinkConfiguration preservesIrisMovieCaptureSuspendedOnSessionStop](self, "preservesIrisMovieCaptureSuspendedOnSessionStop"));
  if (self)
  {
    -[FigCaptureIrisSinkConfiguration irisMovieDuration](self, "irisMovieDuration");
    FigXPCMessageSetCMTime();
    -[FigCaptureIrisSinkConfiguration irisMovieVideoFrameDuration](self, "irisMovieVideoFrameDuration");
  }
  else
  {
    FigXPCMessageSetCMTime();
    memset(&v10[6], 0, 48);
  }
  FigXPCMessageSetCMTime();
  xpc_dictionary_set_int64(v3, "irisMovieAutoTrimMethod", -[FigCaptureIrisSinkConfiguration irisMovieAutoTrimMethod](self, "irisMovieAutoTrimMethod"));
  v4 = *(void **)&self->_movieAutoTrimMethod;
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "copyXPCEncoding");
    xpc_dictionary_set_value(v3, "irisPreparedSettings", v5);
    xpc_release(v5);
  }
  xpc_dictionary_set_BOOL(v3, "irisOptimizesImagesForOfflineVideoStabilization", -[FigCaptureIrisSinkConfiguration optimizesImagesForOfflineVideoStabilization](self, "optimizesImagesForOfflineVideoStabilization"));
  xpc_dictionary_set_BOOL(v3, "irisQuadraHighResCaptureEnabled", -[FigCaptureIrisSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "irisDepthDataDeliveryEnabled", -[FigCaptureIrisSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  xpc_dictionary_set_BOOL(v3, "irisPortraitEffectsMatteDeliveryEnabled", -[FigCaptureIrisSinkConfiguration portraitEffectsMatteDeliveryEnabled](self, "portraitEffectsMatteDeliveryEnabled"));
  if (-[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"))
  {
    -[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs");
    FigXPCMessageSetCFArray();
  }
  xpc_dictionary_set_BOOL(v3, "irisFilterRenderingEnabled", -[FigCaptureIrisSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  xpc_dictionary_set_BOOL(v3, "irisBravoConstituentPhotoDeliveryEnabled", -[FigCaptureIrisSinkConfiguration bravoConstituentPhotoDeliveryEnabled](self, "bravoConstituentPhotoDeliveryEnabled"));
  xpc_dictionary_set_BOOL(v3, "momentCaptureMovieRecordingEnabled", -[FigCaptureIrisSinkConfiguration momentCaptureMovieRecordingEnabled](self, "momentCaptureMovieRecordingEnabled"));
  xpc_dictionary_set_BOOL(v3, "spatialOverCaptureEnabled", -[FigCaptureIrisSinkConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
  xpc_dictionary_set_int64(v3, "maxQualityPrioritization", -[FigCaptureIrisSinkConfiguration maxQualityPrioritization](self, "maxQualityPrioritization"));
  xpc_dictionary_set_BOOL(v3, "deferredProcessingEnabled", -[FigCaptureIrisSinkConfiguration deferredProcessingEnabled](self, "deferredProcessingEnabled"));
  xpc_dictionary_set_BOOL(v3, "digitalFlashCaptureEnabled", -[FigCaptureIrisSinkConfiguration digitalFlashCaptureEnabled](self, "digitalFlashCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "intelligentDistortionCorrectionEnabled", -[FigCaptureIrisSinkConfiguration intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled"));
  xpc_dictionary_set_BOOL(v3, "demosaicedRawEnabled", -[FigCaptureIrisSinkConfiguration demosaicedRawEnabled](self, "demosaicedRawEnabled"));
  xpc_dictionary_set_BOOL(v3, "focusPixelBlurScoreEnabled", -[FigCaptureIrisSinkConfiguration focusPixelBlurScoreEnabled](self, "focusPixelBlurScoreEnabled"));
  xpc_dictionary_set_BOOL(v3, "previewQualityAdjustedPhotoFilterRenderingEnabled", -[FigCaptureIrisSinkConfiguration previewQualityAdjustedPhotoFilterRenderingEnabled](self, "previewQualityAdjustedPhotoFilterRenderingEnabled"));
  xpc_dictionary_set_BOOL(v3, "zeroShutterLagEnabled", -[FigCaptureIrisSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  xpc_dictionary_set_BOOL(v3, "ultraHighResolutionZeroShutterLagSupportEnabled", -[FigCaptureIrisSinkConfiguration ultraHighResolutionZeroShutterLagSupportEnabled](self, "ultraHighResolutionZeroShutterLagSupportEnabled"));
  xpc_dictionary_set_BOOL(v3, "responsiveCaptureEnabled", -[FigCaptureIrisSinkConfiguration responsiveCaptureEnabled](self, "responsiveCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "fastCapturePrioritizationEnabled", -[FigCaptureIrisSinkConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled"));
  xpc_dictionary_set_BOOL(v3, "semanticStyleRenderingEnabled", -[FigCaptureIrisSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  xpc_dictionary_set_int64(v3, "maxPhotoWidth", *(int *)&self->_focusPixelBlurScoreEnabled);
  xpc_dictionary_set_int64(v3, "maxPhotoHeight", *(int *)&self->_responsiveCaptureEnabled);
  xpc_dictionary_set_BOOL(v3, "constantColorEnabled", (BOOL)self->_exifFocalLengthsByZoomFactor);
  xpc_dictionary_set_BOOL(v3, "constantColorClippingRecoveryEnabled", BYTE1(self->_exifFocalLengthsByZoomFactor));
  xpc_dictionary_set_BOOL(v3, "constantColorSaturationBoostEnabled", BYTE2(self->_exifFocalLengthsByZoomFactor));
  xpc_dictionary_set_BOOL(v3, "stereoPhotoCaptureEnabled", BYTE3(self->_exifFocalLengthsByZoomFactor));
  if (*(_QWORD *)&self->_maxPhotoDimensions.height)
  {
    v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = *(void **)&self->_maxPhotoDimensions.height;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__FigCaptureIrisSinkConfiguration_copyXPCEncoding__block_invoke;
    v10[3] = &unk_1E4923BE8;
    v10[4] = v6;
    v10[5] = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
    FigXPCMessageSetCFArray();
    FigXPCMessageSetCFArray();
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration copyWithZone:](&v16, sel_copyWithZone_);
  objc_msgSend(v5, "setIrisMovieCaptureEnabled:", -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](self, "irisMovieCaptureEnabled"));
  objc_msgSend(v5, "setIrisMovieCaptureSuspended:", -[FigCaptureIrisSinkConfiguration irisMovieCaptureSuspended](self, "irisMovieCaptureSuspended"));
  objc_msgSend(v5, "setPreservesIrisMovieCaptureSuspendedOnSessionStop:", -[FigCaptureIrisSinkConfiguration preservesIrisMovieCaptureSuspendedOnSessionStop](self, "preservesIrisMovieCaptureSuspendedOnSessionStop"));
  if (self)
  {
    -[FigCaptureIrisSinkConfiguration irisMovieDuration](self, "irisMovieDuration");
    v12 = v14;
    v13 = v15;
    objc_msgSend(v5, "setIrisMovieDuration:", &v12);
    -[FigCaptureIrisSinkConfiguration irisMovieVideoFrameDuration](self, "irisMovieVideoFrameDuration");
  }
  else
  {
    v14 = 0uLL;
    v15 = 0;
    v13 = 0;
    v12 = 0uLL;
    objc_msgSend(v5, "setIrisMovieDuration:", &v12);
    v10 = 0uLL;
    v11 = 0;
  }
  v8 = v10;
  v9 = v11;
  objc_msgSend(v5, "setIrisMovieVideoFrameDuration:", &v8);
  objc_msgSend(v5, "setIrisMovieAutoTrimMethod:", -[FigCaptureIrisSinkConfiguration irisMovieAutoTrimMethod](self, "irisMovieAutoTrimMethod"));
  v6 = -[FigCaptureIrisPreparedSettings copyWithZone:](-[FigCaptureIrisSinkConfiguration irisPreparedSettings](self, "irisPreparedSettings"), "copyWithZone:", a3);
  objc_msgSend(v5, "setIrisPreparedSettings:", v6);

  objc_msgSend(v5, "setOptimizesImagesForOfflineVideoStabilization:", -[FigCaptureIrisSinkConfiguration optimizesImagesForOfflineVideoStabilization](self, "optimizesImagesForOfflineVideoStabilization"));
  objc_msgSend(v5, "setQuadraHighResCaptureEnabled:", -[FigCaptureIrisSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  objc_msgSend(v5, "setDepthDataDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  objc_msgSend(v5, "setPortraitEffectsMatteDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration portraitEffectsMatteDeliveryEnabled](self, "portraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v5, "setEnabledSemanticSegmentationMatteURNs:", -[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(v5, "setFilterRenderingEnabled:", -[FigCaptureIrisSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  objc_msgSend(v5, "setBravoConstituentPhotoDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration bravoConstituentPhotoDeliveryEnabled](self, "bravoConstituentPhotoDeliveryEnabled"));
  objc_msgSend(v5, "setMomentCaptureMovieRecordingEnabled:", -[FigCaptureIrisSinkConfiguration momentCaptureMovieRecordingEnabled](self, "momentCaptureMovieRecordingEnabled"));
  objc_msgSend(v5, "setSpatialOverCaptureEnabled:", -[FigCaptureIrisSinkConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
  objc_msgSend(v5, "setMaxQualityPrioritization:", -[FigCaptureIrisSinkConfiguration maxQualityPrioritization](self, "maxQualityPrioritization"));
  objc_msgSend(v5, "setDeferredProcessingEnabled:", -[FigCaptureIrisSinkConfiguration deferredProcessingEnabled](self, "deferredProcessingEnabled"));
  objc_msgSend(v5, "setDigitalFlashCaptureEnabled:", -[FigCaptureIrisSinkConfiguration digitalFlashCaptureEnabled](self, "digitalFlashCaptureEnabled"));
  objc_msgSend(v5, "setIntelligentDistortionCorrectionEnabled:", -[FigCaptureIrisSinkConfiguration intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled"));
  objc_msgSend(v5, "setDemosaicedRawEnabled:", -[FigCaptureIrisSinkConfiguration demosaicedRawEnabled](self, "demosaicedRawEnabled"));
  objc_msgSend(v5, "setFocusPixelBlurScoreEnabled:", -[FigCaptureIrisSinkConfiguration focusPixelBlurScoreEnabled](self, "focusPixelBlurScoreEnabled"));
  objc_msgSend(v5, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[FigCaptureIrisSinkConfiguration previewQualityAdjustedPhotoFilterRenderingEnabled](self, "previewQualityAdjustedPhotoFilterRenderingEnabled"));
  objc_msgSend(v5, "setZeroShutterLagEnabled:", -[FigCaptureIrisSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  objc_msgSend(v5, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[FigCaptureIrisSinkConfiguration ultraHighResolutionZeroShutterLagSupportEnabled](self, "ultraHighResolutionZeroShutterLagSupportEnabled"));
  objc_msgSend(v5, "setResponsiveCaptureEnabled:", -[FigCaptureIrisSinkConfiguration responsiveCaptureEnabled](self, "responsiveCaptureEnabled"));
  objc_msgSend(v5, "setFastCapturePrioritizationEnabled:", -[FigCaptureIrisSinkConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled"));
  objc_msgSend(v5, "setSemanticStyleRenderingEnabled:", -[FigCaptureIrisSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  objc_msgSend(v5, "setMaxPhotoDimensions:", -[FigCaptureIrisSinkConfiguration maxPhotoDimensions](self, "maxPhotoDimensions"));
  objc_msgSend(v5, "setExifFocalLengthsByZoomFactor:", -[FigCaptureIrisSinkConfiguration exifFocalLengthsByZoomFactor](self, "exifFocalLengthsByZoomFactor"));
  objc_msgSend(v5, "setConstantColorEnabled:", -[FigCaptureIrisSinkConfiguration constantColorEnabled](self, "constantColorEnabled"));
  objc_msgSend(v5, "setConstantColorClippingRecoveryEnabled:", -[FigCaptureIrisSinkConfiguration constantColorClippingRecoveryEnabled](self, "constantColorClippingRecoveryEnabled"));
  objc_msgSend(v5, "setConstantColorSaturationBoostEnabled:", -[FigCaptureIrisSinkConfiguration constantColorSaturationBoostEnabled](self, "constantColorSaturationBoostEnabled"));
  objc_msgSend(v5, "setStereoPhotoCaptureEnabled:", -[FigCaptureIrisSinkConfiguration stereoPhotoCaptureEnabled](self, "stereoPhotoCaptureEnabled"));
  return v5;
}

- (void)setPreservesIrisMovieCaptureSuspendedOnSessionStop:(BOOL)a3
{
  BYTE4(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setIrisMovieCaptureSuspended:(BOOL)a3
{
  self->_movieCaptureSuspended = a3;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  BYTE2(self->_maxQualityPrioritization) = a3;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_intelligentDistortionCorrectionEnabled = a3;
}

- (void)setResponsiveCaptureEnabled:(BOOL)a3
{
  self->_deferredProcessingEnabled = a3;
}

- (void)setQuadraHighResCaptureEnabled:(BOOL)a3
{
  BYTE1(self->_preparedSettings) = a3;
}

- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3
{
  BYTE1(self->_maxQualityPrioritization) = a3;
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  BYTE3(self->_preparedSettings) = a3;
}

- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3
{
  LOBYTE(self->_preparedSettings) = a3;
}

- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3
{
  BYTE2(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setMaxQualityPrioritization:(int)a3
{
  HIDWORD(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_focusPixelBlurScoreEnabled = a3;
}

- (void)setIrisPreparedSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setIrisMovieVideoFrameDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)((char *)&self->_movieDuration.epoch + 4) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieVideoFrameDuration.flags = var3;
}

- (void)setIrisMovieDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)(&self->_movieCaptureSuspended + 3) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_movieDuration.flags = var3;
}

- (void)setIrisMovieCaptureEnabled:(BOOL)a3
{
  self->_movieCaptureEnabled = a3;
}

- (void)setIrisMovieAutoTrimMethod:(int)a3
{
  HIDWORD(self->_movieVideoFrameDuration.epoch) = a3;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_momentCaptureMovieRecordingEnabled = a3;
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  LOBYTE(self->_maxQualityPrioritization) = a3;
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  LOBYTE(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_digitalFlashCaptureEnabled = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setDigitalFlashCaptureEnabled:(BOOL)a3
{
  self->_bravoConstituentPhotoDeliveryEnabled = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  BYTE2(self->_preparedSettings) = a3;
}

- (void)setDemosaicedRawEnabled:(BOOL)a3
{
  self->_spatialOverCaptureEnabled = a3;
}

- (void)setDeferredProcessingEnabled:(BOOL)a3
{
  self->_filterRenderingEnabled = a3;
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  BYTE2(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  LOBYTE(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  BYTE1(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setBravoConstituentPhotoDeliveryEnabled:(BOOL)a3
{
  BYTE1(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  FigCaptureIrisPreparedSettings *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unint64_t v33;
  NSDictionary *v34;
  int v35;
  int v36;
  int v37;
  BOOL v38;
  CMTime v40;
  CMTime v41;
  CMTime time2;
  CMTime time1;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v44, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    v6 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](self, "irisMovieCaptureEnabled");
    if (v6 != objc_msgSend(a3, "irisMovieCaptureEnabled"))
      goto LABEL_27;
    v7 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureSuspended](self, "irisMovieCaptureSuspended");
    if (v7 != objc_msgSend(a3, "irisMovieCaptureSuspended"))
      goto LABEL_27;
    v8 = -[FigCaptureIrisSinkConfiguration preservesIrisMovieCaptureSuspendedOnSessionStop](self, "preservesIrisMovieCaptureSuspendedOnSessionStop");
    if (v8 != objc_msgSend(a3, "preservesIrisMovieCaptureSuspendedOnSessionStop"))
      goto LABEL_27;
    if (self)
      -[FigCaptureIrisSinkConfiguration irisMovieDuration](self, "irisMovieDuration");
    else
      memset(&time1, 0, sizeof(time1));
    if (a3)
      objc_msgSend(a3, "irisMovieDuration");
    else
      memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&time1, &time2))
      goto LABEL_27;
    if (self)
      -[FigCaptureIrisSinkConfiguration irisMovieVideoFrameDuration](self, "irisMovieVideoFrameDuration");
    else
      memset(&v41, 0, sizeof(v41));
    if (a3)
      objc_msgSend(a3, "irisMovieVideoFrameDuration");
    else
      memset(&v40, 0, sizeof(v40));
    if (CMTimeCompare(&v41, &v40))
      goto LABEL_27;
    v9 = -[FigCaptureIrisSinkConfiguration irisMovieAutoTrimMethod](self, "irisMovieAutoTrimMethod");
    if (v9 != objc_msgSend(a3, "irisMovieAutoTrimMethod"))
      goto LABEL_27;
    v10 = -[FigCaptureIrisSinkConfiguration irisPreparedSettings](self, "irisPreparedSettings");
    if (v10 == (FigCaptureIrisPreparedSettings *)objc_msgSend(a3, "irisPreparedSettings")
      || (v5 = -[FigCaptureIrisPreparedSettings isEqual:](-[FigCaptureIrisSinkConfiguration irisPreparedSettings](self, "irisPreparedSettings"), "isEqual:", objc_msgSend(a3, "irisPreparedSettings"))) != 0)
    {
      v11 = -[FigCaptureIrisSinkConfiguration optimizesImagesForOfflineVideoStabilization](self, "optimizesImagesForOfflineVideoStabilization", v40.value, *(_QWORD *)&v40.timescale, v40.epoch, v41.value, *(_QWORD *)&v41.timescale, v41.epoch, time2.value, *(_QWORD *)&time2.timescale, time2.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
      if (v11 == objc_msgSend(a3, "optimizesImagesForOfflineVideoStabilization"))
      {
        v12 = -[FigCaptureIrisSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled");
        if (v12 == objc_msgSend(a3, "quadraHighResCaptureEnabled"))
        {
          v13 = -[FigCaptureIrisSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled");
          if (v13 == objc_msgSend(a3, "depthDataDeliveryEnabled"))
          {
            v14 = -[FigCaptureIrisSinkConfiguration portraitEffectsMatteDeliveryEnabled](self, "portraitEffectsMatteDeliveryEnabled");
            if (v14 == objc_msgSend(a3, "portraitEffectsMatteDeliveryEnabled"))
            {
              v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"));
              v5 = objc_msgSend(v15, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")));
              if (!v5)
                return v5;
              v16 = -[FigCaptureIrisSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled");
              if (v16 == objc_msgSend(a3, "filterRenderingEnabled"))
              {
                v17 = -[FigCaptureIrisSinkConfiguration bravoConstituentPhotoDeliveryEnabled](self, "bravoConstituentPhotoDeliveryEnabled");
                if (v17 == objc_msgSend(a3, "bravoConstituentPhotoDeliveryEnabled"))
                {
                  v18 = -[FigCaptureIrisSinkConfiguration momentCaptureMovieRecordingEnabled](self, "momentCaptureMovieRecordingEnabled");
                  if (v18 == objc_msgSend(a3, "momentCaptureMovieRecordingEnabled"))
                  {
                    v19 = -[FigCaptureIrisSinkConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled");
                    if (v19 == objc_msgSend(a3, "spatialOverCaptureEnabled"))
                    {
                      v20 = -[FigCaptureIrisSinkConfiguration maxQualityPrioritization](self, "maxQualityPrioritization");
                      if (v20 == objc_msgSend(a3, "maxQualityPrioritization"))
                      {
                        v21 = -[FigCaptureIrisSinkConfiguration deferredProcessingEnabled](self, "deferredProcessingEnabled");
                        if (v21 == objc_msgSend(a3, "deferredProcessingEnabled"))
                        {
                          v22 = -[FigCaptureIrisSinkConfiguration digitalFlashCaptureEnabled](self, "digitalFlashCaptureEnabled");
                          if (v22 == objc_msgSend(a3, "digitalFlashCaptureEnabled"))
                          {
                            v23 = -[FigCaptureIrisSinkConfiguration intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled");
                            if (v23 == objc_msgSend(a3, "intelligentDistortionCorrectionEnabled"))
                            {
                              v24 = -[FigCaptureIrisSinkConfiguration demosaicedRawEnabled](self, "demosaicedRawEnabled");
                              if (v24 == objc_msgSend(a3, "demosaicedRawEnabled"))
                              {
                                v25 = -[FigCaptureIrisSinkConfiguration focusPixelBlurScoreEnabled](self, "focusPixelBlurScoreEnabled");
                                if (v25 == objc_msgSend(a3, "focusPixelBlurScoreEnabled"))
                                {
                                  v26 = -[FigCaptureIrisSinkConfiguration previewQualityAdjustedPhotoFilterRenderingEnabled](self, "previewQualityAdjustedPhotoFilterRenderingEnabled");
                                  if (v26 == objc_msgSend(a3, "previewQualityAdjustedPhotoFilterRenderingEnabled"))
                                  {
                                    v27 = -[FigCaptureIrisSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled");
                                    if (v27 == objc_msgSend(a3, "zeroShutterLagEnabled"))
                                    {
                                      v28 = -[FigCaptureIrisSinkConfiguration ultraHighResolutionZeroShutterLagSupportEnabled](self, "ultraHighResolutionZeroShutterLagSupportEnabled");
                                      if (v28 == objc_msgSend(a3, "ultraHighResolutionZeroShutterLagSupportEnabled"))
                                      {
                                        v29 = -[FigCaptureIrisSinkConfiguration responsiveCaptureEnabled](self, "responsiveCaptureEnabled");
                                        if (v29 == objc_msgSend(a3, "responsiveCaptureEnabled"))
                                        {
                                          v30 = -[FigCaptureIrisSinkConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled");
                                          if (v30 == objc_msgSend(a3, "fastCapturePrioritizationEnabled"))
                                          {
                                            v31 = -[FigCaptureIrisSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled");
                                            if (v31 == objc_msgSend(a3, "semanticStyleRenderingEnabled"))
                                            {
                                              v32 = (int)-[FigCaptureIrisSinkConfiguration maxPhotoDimensions](self, "maxPhotoDimensions");
                                              if (v32 == objc_msgSend(a3, "maxPhotoDimensions"))
                                              {
                                                v33 = (unint64_t)-[FigCaptureIrisSinkConfiguration maxPhotoDimensions](self, "maxPhotoDimensions") >> 32;
                                                if ((_DWORD)v33 == (unint64_t)objc_msgSend(a3, "maxPhotoDimensions") >> 32)
                                                {
                                                  v34 = -[FigCaptureIrisSinkConfiguration exifFocalLengthsByZoomFactor](self, "exifFocalLengthsByZoomFactor");
                                                  if (v34 == (NSDictionary *)objc_msgSend(a3, "exifFocalLengthsByZoomFactor"))
                                                  {
                                                    v35 = -[FigCaptureIrisSinkConfiguration constantColorEnabled](self, "constantColorEnabled");
                                                    if (v35 == objc_msgSend(a3, "constantColorEnabled"))
                                                    {
                                                      v36 = -[FigCaptureIrisSinkConfiguration constantColorClippingRecoveryEnabled](self, "constantColorClippingRecoveryEnabled");
                                                      if (v36 == objc_msgSend(a3, "constantColorClippingRecoveryEnabled"))
                                                      {
                                                        v37 = -[FigCaptureIrisSinkConfiguration constantColorSaturationBoostEnabled](self, "constantColorSaturationBoostEnabled");
                                                        if (v37 == objc_msgSend(a3, "constantColorSaturationBoostEnabled"))
                                                        {
                                                          v38 = -[FigCaptureIrisSinkConfiguration stereoPhotoCaptureEnabled](self, "stereoPhotoCaptureEnabled");
                                                          LOBYTE(v5) = v38 ^ objc_msgSend(a3, "stereoPhotoCaptureEnabled") ^ 1;
                                                          return v5;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_27:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)digitalFlashCaptureEnabled
{
  return self->_bravoConstituentPhotoDeliveryEnabled;
}

- (BOOL)depthDataDeliveryEnabled
{
  return BYTE2(self->_preparedSettings);
}

- (int)maxQualityPrioritization
{
  return HIDWORD(self->_enabledSemanticSegmentationMatteURNs);
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_focusPixelBlurScoreEnabled;
}

- (BOOL)bravoConstituentPhotoDeliveryEnabled
{
  return BYTE1(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)momentCaptureMovieRecordingEnabled
{
  return BYTE2(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)filterRenderingEnabled
{
  return (BOOL)self->_enabledSemanticSegmentationMatteURNs;
}

- (BOOL)focusPixelBlurScoreEnabled
{
  return self->_maxQualityPrioritization;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return *(NSArray **)&self->_optimizesImagesForOfflineVideoStabilization;
}

- (BOOL)deferredProcessingEnabled
{
  return self->_filterRenderingEnabled;
}

- (BOOL)previewQualityAdjustedPhotoFilterRenderingEnabled
{
  return BYTE1(self->_maxQualityPrioritization);
}

- (BOOL)portraitEffectsMatteDeliveryEnabled
{
  return BYTE3(self->_preparedSettings);
}

- (BOOL)demosaicedRawEnabled
{
  return self->_spatialOverCaptureEnabled;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (BOOL)zeroShutterLagEnabled
{
  return BYTE2(self->_maxQualityPrioritization);
}

- (BOOL)spatialOverCaptureEnabled
{
  return BYTE3(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)responsiveCaptureEnabled
{
  return self->_deferredProcessingEnabled;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_momentCaptureMovieRecordingEnabled;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_digitalFlashCaptureEnabled;
}

- (BOOL)quadraHighResCaptureEnabled
{
  return BYTE1(self->_preparedSettings);
}

- (BOOL)constantColorEnabled
{
  return (BOOL)self->_exifFocalLengthsByZoomFactor;
}

- (BOOL)constantColorSaturationBoostEnabled
{
  return BYTE2(self->_exifFocalLengthsByZoomFactor);
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  return BYTE1(self->_exifFocalLengthsByZoomFactor);
}

- (id)description
{
  _BOOL4 filterRenderingEnabled;
  _BOOL4 bravoConstituentPhotoDeliveryEnabled;
  _BOOL4 momentCaptureMovieRecordingEnabled;
  _BOOL4 spatialOverCaptureEnabled;
  _BOOL4 intelligentDistortionCorrectionEnabled;
  int maxQualityPrioritization_low;
  const __CFString *v9;
  const __CFString *v10;
  Float64 Seconds;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int64_t v19;
  _BOOL4 v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  const __CFString *v32;
  _BOOL4 v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  CMTime time;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v40 = 0;
  v41 = 0;
  v42 = 0;
  if (self)
    -[FigCaptureIrisSinkConfiguration irisMovieVideoFrameDuration](self, "irisMovieVideoFrameDuration");
  if (objc_msgSend(*(id *)&self->_optimizesImagesForOfflineVideoStabilization, "count"))
    v37 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", (SegMattes: %d)"), objc_msgSend(*(id *)&self->_optimizesImagesForOfflineVideoStabilization, "count"));
  else
    v37 = &stru_1E4928818;
  filterRenderingEnabled = self->_filterRenderingEnabled;
  bravoConstituentPhotoDeliveryEnabled = self->_bravoConstituentPhotoDeliveryEnabled;
  momentCaptureMovieRecordingEnabled = self->_momentCaptureMovieRecordingEnabled;
  spatialOverCaptureEnabled = self->_spatialOverCaptureEnabled;
  intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
  v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", (maxPhotoDims %dx%d)"), *(unsigned int *)&self->_focusPixelBlurScoreEnabled, *(unsigned int *)&self->_responsiveCaptureEnabled);
  maxQualityPrioritization_low = LOBYTE(self->_maxQualityPrioritization);
  if (LOBYTE(self->_exifFocalLengthsByZoomFactor))
  {
    if (BYTE1(self->_exifFocalLengthsByZoomFactor))
      v9 = CFSTR("(clippingRecovery ON)");
    else
      v9 = &stru_1E4928818;
    if (BYTE2(self->_exifFocalLengthsByZoomFactor))
      v10 = CFSTR("(saturationBoost ON)");
    else
      v10 = &stru_1E4928818;
    v32 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", (constantColor ON %@%@)"), v9, v10);
  }
  else
  {
    v32 = &stru_1E4928818;
  }
  v35 = (void *)MEMORY[0x1E0CB3940];
  v39.receiver = self;
  v39.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v34 = -[FigCaptureSinkConfiguration description](&v39, sel_description);
  v33 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](self, "irisMovieCaptureEnabled");
  v31 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureSuspended](self, "irisMovieCaptureSuspended");
  v30 = -[FigCaptureIrisSinkConfiguration preservesIrisMovieCaptureSuspendedOnSessionStop](self, "preservesIrisMovieCaptureSuspendedOnSessionStop");
  -[FigCaptureIrisSinkConfiguration irisMovieDuration](self, "irisMovieDuration");
  Seconds = CMTimeGetSeconds(&time);
  v29 = -[FigCaptureIrisSinkConfiguration irisMovieAutoTrimMethod](self, "irisMovieAutoTrimMethod");
  if (v40)
    v12 = (int)v41 / v40;
  else
    v12 = 0;
  if (maxQualityPrioritization_low)
    v13 = CFSTR(", (BlurScore ON)");
  else
    v13 = &stru_1E4928818;
  if (intelligentDistortionCorrectionEnabled)
    v14 = CFSTR(", (SemStyles ON)");
  else
    v14 = &stru_1E4928818;
  if (spatialOverCaptureEnabled)
    v15 = CFSTR(", (DemRaw ON)");
  else
    v15 = &stru_1E4928818;
  if (momentCaptureMovieRecordingEnabled)
    v16 = CFSTR(", (IDC ON)");
  else
    v16 = &stru_1E4928818;
  if (bravoConstituentPhotoDeliveryEnabled)
    v17 = CFSTR(", (DigitalFlash ON)");
  else
    v17 = &stru_1E4928818;
  if (filterRenderingEnabled)
    v18 = CFSTR(", (DeferredProcessing ON)");
  else
    v18 = &stru_1E4928818;
  v19 = -[FigCaptureIrisPreparedSettings settingsID](-[FigCaptureIrisSinkConfiguration irisPreparedSettings](self, "irisPreparedSettings"), "settingsID");
  v20 = -[FigCaptureIrisSinkConfiguration optimizesImagesForOfflineVideoStabilization](self, "optimizesImagesForOfflineVideoStabilization");
  v21 = CFSTR(", optimizesImagesForOfflineVideoStabilization:1");
  if (!v20)
    v21 = &stru_1E4928818;
  if (BYTE1(self->_preparedSettings))
    v22 = CFSTR(", (QHR ON)");
  else
    v22 = &stru_1E4928818;
  if (BYTE2(self->_preparedSettings))
    v23 = CFSTR(", (depth ON)");
  else
    v23 = &stru_1E4928818;
  if (BYTE3(self->_preparedSettings))
    v24 = CFSTR(", (portraitMatte ON)");
  else
    v24 = &stru_1E4928818;
  if (LOBYTE(self->_enabledSemanticSegmentationMatteURNs))
    v25 = CFSTR(", (filters ON)");
  else
    v25 = &stru_1E4928818;
  if (BYTE1(self->_enabledSemanticSegmentationMatteURNs))
    v26 = CFSTR(", (constituentPhoto ON)");
  else
    v26 = &stru_1E4928818;
  v27 = (const __CFString *)v36;
  if (!v36)
    v27 = &stru_1E4928818;
  return (id)objc_msgSend(v35, "stringWithFormat:", CFSTR("%@ movies:%d, suspended:%d, preserveSuspended:%d, movieDur:%.2fs, trim:%d, %lldfps, preparedID:%lld%@%@%@%@%@%@%@ maxQuality:%d%@%@%@%@%@%@%@%@"), v34, v33, v31, v30, *(_QWORD *)&Seconds, v29, v12, v19, v21, v22, v23, v24, v37, v25, v26, HIDWORD(self->_enabledSemanticSegmentationMatteURNs),
               v18,
               v17,
               v16,
               v15,
               v14,
               v27,
               v13,
               v32);
}

- (BOOL)irisMovieCaptureEnabled
{
  return self->_movieCaptureEnabled;
}

- (BOOL)optimizesImagesForOfflineVideoStabilization
{
  return (BOOL)self->_preparedSettings;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieVideoFrameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[2].var2;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->var3 = *(_QWORD *)&self[1].var2;
  return self;
}

- (BOOL)irisMovieCaptureSuspended
{
  return self->_movieCaptureSuspended;
}

- (int)irisMovieAutoTrimMethod
{
  return HIDWORD(self->_movieVideoFrameDuration.epoch);
}

- (BOOL)preservesIrisMovieCaptureSuspendedOnSessionStop
{
  return BYTE4(self->_exifFocalLengthsByZoomFactor);
}

- (FigCaptureIrisPreparedSettings)irisPreparedSettings
{
  return *(FigCaptureIrisPreparedSettings **)&self->_movieAutoTrimMethod;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)irisFrameHarvestingEnabled
{
  return self->_movieCaptureEnabled;
}

- (FigCaptureIrisSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureIrisSinkConfiguration *v4;
  xpc_object_t value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v7, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_movieCaptureEnabled = xpc_dictionary_get_BOOL(a3, "irisMovieCaptureEnabled");
    v4->_movieCaptureSuspended = xpc_dictionary_get_BOOL(a3, "irisMovieCaptureSuspended");
    BYTE4(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "preservesIrisMovieCaptureSuspendedOnSessionStop");
    FigXPCMessageGetCMTime();
    FigXPCMessageGetCMTime();
    HIDWORD(v4->_movieVideoFrameDuration.epoch) = xpc_dictionary_get_int64(a3, "irisMovieAutoTrimMethod");
    value = xpc_dictionary_get_value(a3, "irisPreparedSettings");
    if (value)
      *(_QWORD *)&v4->_movieAutoTrimMethod = -[FigCaptureIrisPreparedSettings initWithXPCEncoding:]([FigCaptureIrisPreparedSettings alloc], "initWithXPCEncoding:", value);
    LOBYTE(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisOptimizesImagesForOfflineVideoStabilization");
    BYTE1(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisQuadraHighResCaptureEnabled");
    BYTE2(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisDepthDataDeliveryEnabled");
    BYTE3(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisPortraitEffectsMatteDeliveryEnabled");
    FigXPCMessageCopyCFArray();
    LOBYTE(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "irisFilterRenderingEnabled");
    BYTE1(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "irisBravoConstituentPhotoDeliveryEnabled");
    BYTE2(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "momentCaptureMovieRecordingEnabled");
    BYTE3(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "spatialOverCaptureEnabled");
    HIDWORD(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_int64(a3, "maxQualityPrioritization");
    v4->_filterRenderingEnabled = xpc_dictionary_get_BOOL(a3, "deferredProcessingEnabled");
    v4->_bravoConstituentPhotoDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "digitalFlashCaptureEnabled");
    v4->_momentCaptureMovieRecordingEnabled = xpc_dictionary_get_BOOL(a3, "intelligentDistortionCorrectionEnabled");
    v4->_spatialOverCaptureEnabled = xpc_dictionary_get_BOOL(a3, "demosaicedRawEnabled");
    LOBYTE(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "focusPixelBlurScoreEnabled");
    BYTE1(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "previewQualityAdjustedPhotoFilterRenderingEnabled");
    BYTE2(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "zeroShutterLagEnabled");
    HIBYTE(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "ultraHighResolutionZeroShutterLagSupportEnabled");
    v4->_deferredProcessingEnabled = xpc_dictionary_get_BOOL(a3, "responsiveCaptureEnabled");
    v4->_digitalFlashCaptureEnabled = xpc_dictionary_get_BOOL(a3, "fastCapturePrioritizationEnabled");
    v4->_intelligentDistortionCorrectionEnabled = xpc_dictionary_get_BOOL(a3, "semanticStyleRenderingEnabled");
    *(_DWORD *)&v4->_focusPixelBlurScoreEnabled = xpc_dictionary_get_int64(a3, "maxPhotoWidth");
    *(_DWORD *)&v4->_responsiveCaptureEnabled = xpc_dictionary_get_int64(a3, "maxPhotoHeight");
    FigXPCMessageCopyCFArray();
    FigXPCMessageCopyCFArray();
    LOBYTE(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorEnabled");
    BYTE1(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorClippingRecoveryEnabled");
    BYTE2(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorSaturationBoostEnabled");
    BYTE3(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "stereoPhotoCaptureEnabled");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __50__FigCaptureIrisSinkConfiguration_copyXPCEncoding__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", a3);
}

- (FigCaptureIrisSinkConfiguration)initWithCoder:(id)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CMTime v15;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithCoder:](&v16, sel_initWithCoder_);
  if (v4)
  {
    v4[16] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieCaptureEnabled"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3));
    CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieDuration")));
    v7 = *(_OWORD *)&v15.value;
    *(_QWORD *)(v4 + 36) = v15.epoch;
    *(_OWORD *)(v4 + 20) = v7;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v9 = objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3));
    CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieVideoFrameDuration")));
    v10 = *(_OWORD *)&v15.value;
    *(_QWORD *)(v4 + 60) = v15.epoch;
    *(_OWORD *)(v4 + 44) = v10;
    *((_DWORD *)v4 + 17) = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieAutoTrimMethod"));
    *((_QWORD *)v4 + 9) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisPreparedSettings"));
    v4[80] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisOptimizesImagesForOfflineVideoStabilization"));
    v4[81] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisQuadraHighResCaptureEnabled"));
    v4[82] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisDepthDataDeliveryEnabled"));
    v4[83] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisPortraitEffectsMatteDeliveryEnabled"));
    v11 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v12 = objc_msgSend(v11, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2));
    *((_QWORD *)v4 + 11) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabledSemanticSegmentationMatteURNs"));
    v4[96] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisFilterRenderingEnabled"));
    v4[97] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisBravoConstituentPhotoDeliveryEnabled"));
    v4[98] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "momentCaptureMovieRecordingEnabled"));
    v4[99] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "spatialOverCaptureEnabled"));
    *((_DWORD *)v4 + 25) = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxQualityPrioritization"));
    v4[104] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "deferredProcessingEnabled"));
    v4[105] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "digitalFlashCaptureEnabled"));
    v4[106] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intelligentDistortionCorrectionEnabled"));
    v4[107] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "demosaicedRawEnabled"));
    v4[108] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "focusPixelBlurScoreEnabled"));
    v4[109] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewQualityAdjustedPhotoFilterRenderingEnabled"));
    v4[110] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "zeroShutterLagEnabled"));
    v4[111] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ultraHighResolutionZeroShutterLagSupportEnabled"));
    v4[112] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "responsiveCaptureEnabled"));
    v4[113] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fastCapturePrioritizationEnabled"));
    v4[114] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "semanticStyleRenderingEnabled"));
    *((_DWORD *)v4 + 29) = objc_msgSend(a3, "decodeIntForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxPhotoWidth"));
    *((_DWORD *)v4 + 30) = objc_msgSend(a3, "decodeIntForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxPhotoHeight"));
    v13 = objc_opt_class();
    *((_QWORD *)v4 + 16) = (id)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v13, objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "exifFocalLengthsByZoomFactor"));
    v4[136] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorEnabled"));
    v4[137] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorClippingRecoveryEnabled"));
    v4[138] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorSaturationBoostEnabled"));
    v4[139] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stereoPhotoCaptureEnabled"));
  }
  return (FigCaptureIrisSinkConfiguration *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *v5;
  CMTime v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisSinkConfiguration;
  -[FigCaptureSinkConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", self->_movieCaptureEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieCaptureEnabled"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&v6.value = *(_OWORD *)(&self->_movieCaptureSuspended + 3);
  v6.epoch = *(_QWORD *)&self->_movieDuration.flags;
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeCopyAsDictionary(&v6, v5), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieDuration"));
  *(_OWORD *)&v6.value = *(_OWORD *)((char *)&self->_movieDuration.epoch + 4);
  v6.epoch = *(_QWORD *)&self->_movieVideoFrameDuration.flags;
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeCopyAsDictionary(&v6, v5), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieVideoFrameDuration"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(self->_movieVideoFrameDuration.epoch), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisMovieAutoTrimMethod"));
  objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)&self->_movieAutoTrimMethod, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisPreparedSettings"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_preparedSettings), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisOptimizesImagesForOfflineVideoStabilization"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_preparedSettings), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisQuadraHighResCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_preparedSettings), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisDepthDataDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_preparedSettings), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisPortraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)&self->_optimizesImagesForOfflineVideoStabilization, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisFilterRenderingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "irisBravoConstituentPhotoDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "momentCaptureMovieRecordingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "spatialOverCaptureEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxQualityPrioritization"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_filterRenderingEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "deferredProcessingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_bravoConstituentPhotoDeliveryEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "digitalFlashCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_momentCaptureMovieRecordingEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "intelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_spatialOverCaptureEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "demosaicedRawEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_maxQualityPrioritization), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "focusPixelBlurScoreEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_maxQualityPrioritization), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewQualityAdjustedPhotoFilterRenderingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_maxQualityPrioritization), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "zeroShutterLagEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", HIBYTE(self->_maxQualityPrioritization), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ultraHighResolutionZeroShutterLagSupportEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deferredProcessingEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "responsiveCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_digitalFlashCaptureEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fastCapturePrioritizationEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_intelligentDistortionCorrectionEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "semanticStyleRenderingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", *(unsigned int *)&self->_focusPixelBlurScoreEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxPhotoWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", *(unsigned int *)&self->_responsiveCaptureEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maxPhotoHeight"));
  objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)&self->_maxPhotoDimensions.height, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "exifFocalLengthsByZoomFactor"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_exifFocalLengthsByZoomFactor), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_exifFocalLengthsByZoomFactor), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorClippingRecoveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_exifFocalLengthsByZoomFactor), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "constantColorSaturationBoostEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_exifFocalLengthsByZoomFactor), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "stereoPhotoCaptureEnabled"));
}

- (BOOL)ultraHighResolutionZeroShutterLagSupportEnabled
{
  return HIBYTE(self->_maxQualityPrioritization);
}

- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3
{
  HIBYTE(self->_maxQualityPrioritization) = a3;
}

- (NSDictionary)exifFocalLengthsByZoomFactor
{
  return *(NSDictionary **)&self->_maxPhotoDimensions.height;
}

- (void)setExifFocalLengthsByZoomFactor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)stereoPhotoCaptureEnabled
{
  return BYTE3(self->_exifFocalLengthsByZoomFactor);
}

- (void)setStereoPhotoCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setIrisFrameHarvestingEnabled:(BOOL)a3
{
  BYTE5(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setIrisApplyPreviewShift:(BOOL)a3
{
  BYTE6(self->_exifFocalLengthsByZoomFactor) = a3;
}

@end
