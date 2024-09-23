@implementation FigCaptureStillImageSettings

- (void)_teardownBracketStorage
{
  if (a1)
  {
    free(a1[39]);
    a1[39] = 0;
    free(a1[40]);
    a1[40] = 0;
    free(a1[41]);
    a1[41] = 0;
  }
}

- (int)outputFileType
{
  return self->_outputFileType;
}

- (void)setHDRMode:(int)a3
{
  self->_HDRMode = a3;
}

- (id)description
{
  unsigned int v3;
  unsigned int rawOutputFormat;
  unsigned int v5;
  float scaleFactor;
  const __CFString *v7;
  const __CFString *v8;
  int qualityPrioritization;
  int clientQualityPrioritization;
  _BOOL4 embedsDepthDataInImage;
  NSArray *enabledSemanticSegmentationMatteURNs;
  __CFString *v13;
  NSArray *originalImageFilters;
  NSArray *processedImageFilters;
  _BOOL4 autoIntelligentDistortionCorrectionEnabled;
  _BOOL4 autoDeferredProcessingEnabled;
  uint64_t bracketType;
  uint64_t resolutionFlavor;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  _BOOL4 providesOriginalImage;
  const __CFString *v50;
  const __CFString *v51;
  _BOOL4 cameraCalibrationDataDeliveryEnabled;
  const __CFString *v53;
  const __CFString *v54;
  _BOOL4 embedsSemanticSegmentationMattesInImage;
  const __CFString *v56;
  const __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 embedsPortraitEffectsMatteInImage;
  const __CFString *v61;
  _BOOL4 noiseReductionEnabled;
  _BOOL4 portraitEffectsMatteDeliveryEnabled;
  const __CFString *v64;
  _BOOL4 depthDataFiltered;
  _BOOL4 depthDataDeliveryEnabled;
  __CFString *v67;
  _BOOL4 autoStereoPhotoCaptureEnabled;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  _BOOL4 zoomWithoutUpscalingEnabled;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  _BOOL4 squareCropEnabled;
  _BOOL4 outputMirroring;
  _BOOL4 burstQualityCaptureEnabled;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91[3];

  v3 = bswap32(self->_outputFormat);
  v90 = bswap32(self->_outputFileType);
  v91[0] = v3;
  rawOutputFormat = self->_rawOutputFormat;
  v88 = bswap32(self->_rawOutputFileType);
  v89 = bswap32(rawOutputFormat);
  v5 = bswap32(self->_previewFormat);
  v86 = bswap32(self->_thumbnailFormat);
  v87 = v5;
  v85 = bswap32(self->_rawThumbnailFormat);
  if (rawOutputFormat)
    v84 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" RAW:'%.4s'('%.4s')"), &v89, &v88);
  else
    v84 = &stru_1E4928818;
  if (self->_previewEnabled)
    v83 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PREV:'%.4s'@%dx%d"), &v87, self->_previewWidth, self->_previewHeight);
  else
    v83 = &stru_1E4928818;
  if (self->_thumbnailEnabled)
    v82 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" THUMB:'%.4s'@%dx%d"), &v86, self->_thumbnailWidth, self->_thumbnailHeight);
  else
    v82 = &stru_1E4928818;
  if (self->_rawThumbnailEnabled)
    v81 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" RAWTHUMB:'%.4s'@%dx%d"), &v85, self->_rawThumbnailWidth, self->_rawThumbnailHeight);
  else
    v81 = &stru_1E4928818;
  noiseReductionEnabled = self->_noiseReductionEnabled;
  burstQualityCaptureEnabled = self->_burstQualityCaptureEnabled;
  outputMirroring = self->_outputMirroring;
  squareCropEnabled = self->_squareCropEnabled;
  scaleFactor = self->_scaleFactor;
  if (scaleFactor == 1.0)
    v80 = &stru_1E4928818;
  else
    v80 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" x%.3f"), scaleFactor);
  zoomWithoutUpscalingEnabled = self->_zoomWithoutUpscalingEnabled;
  if (self->_flashMode)
    v79 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" FLASH:%d"), self->_flashMode);
  else
    v79 = &stru_1E4928818;
  if (self->_autoRedEyeReductionEnabled)
    v75 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" RE:%d"), 1);
  else
    v75 = &stru_1E4928818;
  if (self->_digitalFlashMode)
    v74 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DIGITALFLASH:%d"), self->_digitalFlashMode);
  else
    v74 = &stru_1E4928818;
  v7 = &stru_1E4928818;
  if (self->_constantColorEnabled)
  {
    if (self->_constantColorFallbackPhotoDeliveryEnabled)
      v8 = CFSTR("(fallback:1)");
    else
      v8 = &stru_1E4928818;
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" ConstantColor:1%@"), v8);
  }
  v71 = v7;
  autoStereoPhotoCaptureEnabled = self->_autoStereoPhotoCaptureEnabled;
  if (self->_wideColorMode)
    v70 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WC:%d"), self->_wideColorMode);
  else
    v70 = &stru_1E4928818;
  qualityPrioritization = self->_qualityPrioritization;
  clientQualityPrioritization = self->_clientQualityPrioritization;
  if (self->_HDRMode)
    v69 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" HDR:%d"), self->_HDRMode);
  else
    v69 = &stru_1E4928818;
  depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
  embedsDepthDataInImage = self->_embedsDepthDataInImage;
  depthDataFiltered = self->_depthDataFiltered;
  portraitEffectsMatteDeliveryEnabled = self->_portraitEffectsMatteDeliveryEnabled;
  embedsPortraitEffectsMatteInImage = self->_embedsPortraitEffectsMatteInImage;
  if (-[NSArray count](self->_enabledSemanticSegmentationMatteURNs, "count"))
  {
    enabledSemanticSegmentationMatteURNs = self->_enabledSemanticSegmentationMatteURNs;
    v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" MatteTypes:{"));
    if (-[NSArray containsObject:](enabledSemanticSegmentationMatteURNs, "containsObject:", *MEMORY[0x1E0D09288]))
      -[__CFString appendString:](v13, "appendString:", CFSTR("hair,"));
    if (-[NSArray containsObject:](enabledSemanticSegmentationMatteURNs, "containsObject:", *MEMORY[0x1E0D09290]))
      -[__CFString appendString:](v13, "appendString:", CFSTR("skin,"));
    if (-[NSArray containsObject:](enabledSemanticSegmentationMatteURNs, "containsObject:", *MEMORY[0x1E0D092A0]))
      -[__CFString appendString:](v13, "appendString:", CFSTR("teeth,"));
    if (-[NSArray containsObject:](enabledSemanticSegmentationMatteURNs, "containsObject:", *MEMORY[0x1E0D09280]))
      -[__CFString appendString:](v13, "appendString:", CFSTR("glasses,"));
    -[__CFString deleteCharactersInRange:](v13, "deleteCharactersInRange:", -[__CFString length](v13, "length") - 1, 1);
    -[__CFString appendString:](v13, "appendString:", CFSTR("}"));
  }
  else
  {
    v13 = &stru_1E4928818;
  }
  embedsSemanticSegmentationMattesInImage = self->_embedsSemanticSegmentationMattesInImage;
  v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" SAP: %.2f"), self->_simulatedAperture);
  v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PLES: %.2f"), self->_portraitLightingEffectStrength);
  cameraCalibrationDataDeliveryEnabled = self->_cameraCalibrationDataDeliveryEnabled;
  providesOriginalImage = self->_providesOriginalImage;
  originalImageFilters = self->_originalImageFilters;
  if (originalImageFilters)
    v57 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" OFILTERS:[%@]"), BWCIFilterArrayDescription(originalImageFilters));
  else
    v57 = &stru_1E4928818;
  processedImageFilters = self->_processedImageFilters;
  if (processedImageFilters)
    v54 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PFILTERS:[%@]"), BWCIFilterArrayDescription(processedImageFilters));
  else
    v54 = &stru_1E4928818;
  if (self->_bravoImageFusionMode)
    v51 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" BIF:%d"), self->_bravoImageFusionMode);
  else
    v51 = &stru_1E4928818;
  if (-[NSArray count](self->_bravoConstituentImageDeliveryDeviceTypes, "count"))
    v48 = (const __CFString *)_shortStringForFigCaptureSourceDeviceTypes(self->_bravoConstituentImageDeliveryDeviceTypes);
  else
    v48 = &stru_1E4928818;
  autoIntelligentDistortionCorrectionEnabled = self->_autoIntelligentDistortionCorrectionEnabled;
  autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled;
  if (self->_deferredPhotoProxyWidth)
    v47 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PROXY:%dx%d"), self->_deferredPhotoProxyWidth, self->_deferredPhotoProxyHeight);
  else
    v47 = &stru_1E4928818;
  bracketType = self->_bracketType;
  if ((_DWORD)bracketType)
    v46 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" BRCK:%dx%d LS:%d"), bracketType, self->_bracketImageCount, self->_lensStabilizationDuringBracketEnabled);
  else
    v46 = &stru_1E4928818;
  resolutionFlavor = self->_resolutionFlavor;
  v20 = &stru_1E4928818;
  v67 = v13;
  if ((_DWORD)resolutionFlavor)
    v44 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" flavor:%d"), resolutionFlavor);
  else
    v44 = &stru_1E4928818;
  v21 = CFSTR(" CP:balanced");
  if (clientQualityPrioritization == 3)
    v21 = CFSTR(" CP:quality");
  if (clientQualityPrioritization == 1)
    v22 = CFSTR(" CP:speed");
  else
    v22 = v21;
  v23 = CFSTR(" P:quality");
  if (qualityPrioritization != 3)
    v23 = CFSTR(" P:balanced");
  if (qualityPrioritization == 1)
    v23 = CFSTR(" P:speed");
  v45 = v23;
  if (autoDeferredProcessingEnabled)
    v24 = CFSTR(" autoDeferredProcessing:1");
  else
    v24 = &stru_1E4928818;
  v25 = CFSTR(" autoIDC:1");
  if (!autoIntelligentDistortionCorrectionEnabled)
    v25 = &stru_1E4928818;
  v42 = v25;
  v43 = v24;
  if (providesOriginalImage)
    v26 = CFSTR(" Orig:1");
  else
    v26 = &stru_1E4928818;
  v50 = v26;
  v27 = CFSTR(" CameraCalibration:1");
  if (!cameraCalibrationDataDeliveryEnabled)
    v27 = &stru_1E4928818;
  v53 = v27;
  v28 = CFSTR(" EmbedsSegmentationMattes:0");
  if (embedsSemanticSegmentationMattesInImage)
    v28 = &stru_1E4928818;
  v56 = v28;
  if (embedsPortraitEffectsMatteInImage)
    v29 = &stru_1E4928818;
  else
    v29 = CFSTR(" EmbedsPortraitMatte:0");
  v61 = v29;
  v30 = CFSTR(" PortraitMatte:1");
  if (!portraitEffectsMatteDeliveryEnabled)
    v30 = &stru_1E4928818;
  v64 = v30;
  if (depthDataFiltered)
    v31 = &stru_1E4928818;
  else
    v31 = CFSTR(" DepthFiltered:0");
  if (embedsDepthDataInImage)
    v32 = &stru_1E4928818;
  else
    v32 = CFSTR(" EmbedsDepth:0");
  if (depthDataDeliveryEnabled)
    v33 = CFSTR(" DEPTH:1");
  else
    v33 = &stru_1E4928818;
  if (autoStereoPhotoCaptureEnabled)
    v34 = CFSTR(" stereoPhotoCapture:1");
  else
    v34 = &stru_1E4928818;
  if (zoomWithoutUpscalingEnabled)
    v35 = CFSTR(" ZoomNoUpscale:1");
  else
    v35 = &stru_1E4928818;
  v73 = v35;
  if (squareCropEnabled)
    v36 = CFSTR(" SQ:1");
  else
    v36 = &stru_1E4928818;
  v37 = CFSTR(" MIR:1");
  if (!outputMirroring)
    v37 = &stru_1E4928818;
  if (burstQualityCaptureEnabled)
    v38 = CFSTR(" Burst:1");
  else
    v38 = &stru_1E4928818;
  if (noiseReductionEnabled)
    v39 = CFSTR(" NR:1");
  else
    v39 = &stru_1E4928818;
  if (self->_bypassUpscaling)
    v40 = CFSTR(" bypassUpscaling:1");
  else
    v40 = &stru_1E4928818;
  if (self->_deviceOrientationCorrectionEnabled)
    v20 = CFSTR(" OrientationCorrection:1");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p: captureID:%lld '%.4s'('%.4s')%@ %dx%d O:%d%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), objc_opt_class(), self, self->_settingsID, v91, &v90, v84, self->_outputWidth, self->_outputHeight, self->_outputOrientation, v37, v36, v83, v82, v81, v39, v38,
               v80,
               v73,
               v79,
               v75,
               v74,
               v71,
               v34,
               v70,
               v69,
               v45,
               v22,
               v33,
               v32,
               v31,
               v64,
               v61,
               v67,
               v56,
               v53,
               v50,
               v57,
               v54,
               v59,
               v58,
               v51,
               v48,
               v43,
               v47,
               v42,
               v46,
               v44,
               v40,
               v20);
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  self->_portraitEffectsMatteDeliveryEnabled = a3;
}

- (void)setEmbedsPortraitEffectsMatteInImage:(BOOL)a3
{
  self->_embedsPortraitEffectsMatteInImage = a3;
}

- (void)setEmbedsDepthDataInImage:(BOOL)a3
{
  self->_embedsDepthDataInImage = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)thumbnailEnabled
{
  return self->_thumbnailEnabled;
}

- (void)setZoomWithoutUpscalingEnabled:(BOOL)a3
{
  self->_zoomWithoutUpscalingEnabled = a3;
}

- (void)setWideColorMode:(int)a3
{
  self->_wideColorMode = a3;
}

- (void)setVtCompressionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setThumbnailWidth:(unsigned int)a3
{
  self->_thumbnailWidth = a3;
}

- (void)setThumbnailHeight:(unsigned int)a3
{
  self->_thumbnailHeight = a3;
}

- (void)setThumbnailFormat:(unsigned int)a3
{
  self->_thumbnailFormat = a3;
}

- (void)setThumbnailEnabled:(BOOL)a3
{
  self->_thumbnailEnabled = a3;
}

- (void)setStillImageUserInitiatedRequestTime:(unint64_t)a3
{
  self->_stillImageUserInitiatedRequestTime = a3;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_squareCropEnabled = a3;
}

- (void)setShutterSound:(unsigned int)a3
{
  self->_shutterSound = a3;
}

- (void)setSettingsProvider:(int)a3
{
  self->_settingsProvider = a3;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (void)setRawThumbnailEnabled:(BOOL)a3
{
  self->_rawThumbnailEnabled = a3;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- (void)setRawOutputFileType:(int)a3
{
  self->_rawOutputFileType = a3;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (void)setProvidesOriginalImage:(BOOL)a3
{
  self->_providesOriginalImage = a3;
}

- (void)setProcessedImageFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setPreviewWidth:(unsigned int)a3
{
  self->_previewWidth = a3;
}

- (void)setPreviewOrientation:(int)a3
{
  self->_previewOrientation = a3;
}

- (void)setPreviewMirroring:(BOOL)a3
{
  self->_previewMirroring = a3;
}

- (void)setPreviewHeight:(unsigned int)a3
{
  self->_previewHeight = a3;
}

- (void)setPreviewFormat:(unsigned int)a3
{
  self->_previewFormat = a3;
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

- (void)setPayloadType:(int)a3
{
  self->_payloadType = a3;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_outputWidth = a3;
}

- (void)setOutputOrientation:(int)a3
{
  self->_outputOrientation = a3;
}

- (void)setOutputMirroring:(BOOL)a3
{
  self->_outputMirroring = a3;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_outputHeight = a3;
}

- (void)setOutputFormat:(unsigned int)a3
{
  self->_outputFormat = a3;
}

- (void)setOutputFileType:(int)a3
{
  self->_outputFileType = a3;
}

- (void)setOriginalImageFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setNoiseReductionEnabled:(BOOL)a3
{
  self->_noiseReductionEnabled = a3;
}

- (void)setMetadataForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setFlashMode:(int)a3
{
  self->_flashMode = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setEmbedsSemanticSegmentationMattesInImage:(BOOL)a3
{
  self->_embedsSemanticSegmentationMattesInImage = a3;
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_digitalFlashMode = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  self->_deviceOrientationCorrectionEnabled = a3;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (void)setDeferredVideoFormatUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void)setDeferredSourcePosition:(int)a3
{
  self->_deferredSourcePosition = a3;
}

- (void)setDeferredSourceDeviceType:(int)a3
{
  self->_deferredSourceDeviceType = a3;
}

- (void)setDeferredDepthDataFormatUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3
{
  self->_constantColorFallbackPhotoDeliveryEnabled = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  self->_constantColorEnabled = a3;
}

- (void)setClientQualityPrioritization:(int)a3
{
  self->_clientQualityPrioritization = a3;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  self->_cameraCalibrationDataDeliveryEnabled = a3;
}

- (void)setBurstQualityCaptureEnabled:(BOOL)a3
{
  self->_burstQualityCaptureEnabled = a3;
}

- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_autoRedEyeReductionEnabled = a3;
}

- (void)setAutoIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_autoIntelligentDistortionCorrectionEnabled = a3;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_autoDeferredProcessingEnabled = a3;
}

- (BOOL)rawThumbnailEnabled
{
  return self->_rawThumbnailEnabled;
}

- (BOOL)providesOriginalImage
{
  return self->_providesOriginalImage;
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (BOOL)portraitEffectsMatteDeliveryEnabled
{
  return self->_portraitEffectsMatteDeliveryEnabled;
}

- (int)outputOrientation
{
  return self->_outputOrientation;
}

- (BOOL)outputMirroring
{
  return self->_outputMirroring;
}

- (FigCaptureStillImageSettings)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFDictionary *v32;
  uint64_t v33;
  int v34;
  CMTime v36;

  v5 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("settingsID"));
  v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureRequestIdentifier"));
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageGroupIdentifier"));
  v8 = -[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, v5, v6, v7);
  if (v8)
  {
    *((_DWORD *)v8 + 4) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("payloadType"));
    *((_DWORD *)v8 + 5) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("settingsProvider"));
    *((_DWORD *)v8 + 6) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputFormat"));
    *((_DWORD *)v8 + 7) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputFileType"));
    *((_DWORD *)v8 + 8) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawOutputFormat"));
    *((_DWORD *)v8 + 9) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawOutputFileType"));
    *((_DWORD *)v8 + 10) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawOutputFileBitDepth"));
    *((_DWORD *)v8 + 11) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawOutputFileCodec"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("rawOutputFileCodecQuality"));
    *((_DWORD *)v8 + 12) = v9;
    *((_DWORD *)v8 + 13) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputWidth"));
    *((_DWORD *)v8 + 14) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputHeight"));
    *((_BYTE *)v8 + 60) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("squareCropEnabled"));
    *((_BYTE *)v8 + 61) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("outputMirroring"));
    *((_DWORD *)v8 + 16) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputOrientation"));
    v10 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("previewEnabled"));
    *((_BYTE *)v8 + 68) = v10;
    if (v10)
    {
      *((_DWORD *)v8 + 18) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("previewFormat"));
      *((_DWORD *)v8 + 19) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("previewWidth"));
      *((_DWORD *)v8 + 20) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("previewHeight"));
      *((_BYTE *)v8 + 84) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("previewMirroring"));
      *((_DWORD *)v8 + 22) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("previewOrientation"));
    }
    v11 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("thumbnailEnabled"));
    *((_BYTE *)v8 + 92) = v11;
    if (v11)
    {
      *((_DWORD *)v8 + 24) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("thumbnailFormat"));
      *((_DWORD *)v8 + 25) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("thumbnailWidth"));
      *((_DWORD *)v8 + 26) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("thumbnailHeight"));
    }
    v12 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("rawThumbnailEnabled"));
    *((_BYTE *)v8 + 108) = v12;
    if (v12)
    {
      *((_DWORD *)v8 + 28) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawThumbnailFormat"));
      *((_DWORD *)v8 + 29) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawThumbnailWidth"));
      *((_DWORD *)v8 + 30) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawThumbnailHeight"));
    }
    *((_BYTE *)v8 + 124) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("powerBlurEnabled"));
    *((_BYTE *)v8 + 125) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("burstQualityCaptureEnabled"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("scaleFactor"));
    *((_DWORD *)v8 + 32) = v13;
    *((_BYTE *)v8 + 132) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("zoomWithoutUpscalingEnabled"));
    *((_DWORD *)v8 + 34) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("shutterSound"));
    *((_DWORD *)v8 + 35) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("flashMode"));
    *((_BYTE *)v8 + 144) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoRedEyeReductionEnabled"));
    *((_DWORD *)v8 + 37) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("digitalFlashMode"));
    *((_BYTE *)v8 + 152) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("constantColorEnabled"));
    *((_BYTE *)v8 + 153) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("constantColorFallbackPhotoDeliveryEnabled"));
    *((_BYTE *)v8 + 154) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoStereoPhotoCaptureEnabled"));
    *((_DWORD *)v8 + 39) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("wideColorMode"));
    *((_DWORD *)v8 + 40) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("HDRMode"));
    v14 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("depthDataDeliveryEnabled"));
    *((_BYTE *)v8 + 164) = v14;
    if (v14)
    {
      *((_BYTE *)v8 + 165) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("embedsDepthDataInImage"));
      *((_BYTE *)v8 + 166) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("depthDataFiltered"));
    }
    *((_BYTE *)v8 + 167) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cameraCalibrationDataDeliveryEnabled"));
    v15 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("portraitEffectsMatteDeliveryEnabled"));
    *((_BYTE *)v8 + 168) = v15;
    if (v15)
      *((_BYTE *)v8 + 169) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("embedsPortraitEffectsMatteInImage"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), CFSTR("enabledSemanticSegmentationMatteURNs"));
    v8[22] = v18;
    if (objc_msgSend(v18, "count"))
      *((_BYTE *)v8 + 184) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("embedsSemanticSegmentationMattesInImage"));
    v8[24] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("metadata")), "copy");
    v8[25] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("metadataForOriginalImage")), "copy");
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v19, "initWithObjects:", v20, objc_opt_class(), 0);
    v8[26] = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v21, CFSTR("originalImageFilters"));
    v8[27] = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v21, CFSTR("processedImageFilters"));

    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("simulatedAperture"));
    *((_DWORD *)v8 + 56) = v22;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("portraitLightingEffectStrength")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("portraitLightingEffectStrength"));
      *((_DWORD *)v8 + 57) = v23;
    }
    *((_BYTE *)v8 + 232) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("providesOriginalImage"));
    v8[30] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("bravoConstituentImageDeliveryDeviceTypes")), "copy");
    v8[31] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("spatialOverCaptureMetadata")), "copy");
    v8[32] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("spatialOverCaptureMetadataForOriginalImage")), "copy");
    *((_BYTE *)v8 + 264) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoDeferredProcessingEnabled"));
    *((_DWORD *)v8 + 67) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("qualityPrioritization"));
    *((_DWORD *)v8 + 68) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("clientQualityPrioritization"));
    *((_DWORD *)v8 + 69) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bravoImageFusionMode"));
    *((_BYTE *)v8 + 280) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoIntelligentDistortionCorrectionEnabled"));
    v8[36] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("vtCompressionProperties")), "copy");
    *((_DWORD *)v8 + 74) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bracketType"));
    if ((int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bracketImageCount")) > 7)
      v24 = 8;
    else
      v24 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bracketImageCount"));
    *((_DWORD *)v8 + 75) = v24;
    *((_BYTE *)v8 + 304) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("lensStabilizationDuringBracketEnabled"));
    v25 = *((_DWORD *)v8 + 74);
    if (v25 == 1)
    {
      v8[40] = malloc_type_calloc(*((unsigned int *)v8 + 75), 4uLL, 0x100004052888210uLL);
      objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ISOs")), "getBytes:length:", v8[40], 4 * *((unsigned int *)v8 + 75));
      v8[39] = malloc_type_calloc(*((unsigned int *)v8 + 75), 0x18uLL, 0x1000040504FFAC1uLL);
      v26 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exposureDurations"));
      v27 = v8[39];
      v28 = 24 * *((unsigned int *)v8 + 75);
    }
    else
    {
      if (v25 != 2)
      {
LABEL_24:
        v8[42] = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("stillImageUserInitiatedRequestTime"));
        v29 = (void *)MEMORY[0x1E0C99E60];
        v30 = objc_opt_class();
        v31 = objc_opt_class();
        v32 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0), CFSTR("stillImageUserInitiatedRequestPTS"));
        CMTimeMakeFromDictionary(&v36, v32);
        *(CMTime *)(v8 + 43) = v36;
        v8[46] = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("stillImageRequestTime"));
        v8[47] = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("stillImageCaptureStartTime"));
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stillImageCaptureAbsoluteStartTime"));
        v8[48] = v33;
        *((_BYTE *)v8 + 408) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("clientInitiatedPrepareSettings"));
        *((_BYTE *)v8 + 409) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("userInitiatedRequestSettings"));
        *((_BYTE *)v8 + 410) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("beginMomentCaptureSettings"));
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("videoStabilizationOverscanCropMultiplier"));
        *((_DWORD *)v8 + 103) = v34;
        *((_DWORD *)v8 + 104) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("resolutionFlavor"));
        *((_DWORD *)v8 + 105) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredPhotoProxyWidth"));
        *((_DWORD *)v8 + 106) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredPhotoProxyHeight"));
        *((_DWORD *)v8 + 107) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredPhotoFinalWidth"));
        *((_DWORD *)v8 + 108) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredPhotoFinalHeight"));
        *((_DWORD *)v8 + 109) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredSourceDeviceType"));
        *((_DWORD *)v8 + 110) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deferredSourcePosition"));
        v8[56] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredVideoFormatUniqueID")), "copy");
        v8[57] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredDepthDataFormatUniqueID")), "copy");
        *((_BYTE *)v8 + 464) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("bypassUpscaling"));
        v8[59] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedFormat")), "copy");
        *((_BYTE *)v8 + 480) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("highResolutionPhotoEnabled"));
        *((_DWORD *)v8 + 121) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("maxPhotoDimensionsWidth"));
        *((_DWORD *)v8 + 122) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("maxPhotoDimensionsHeight"));
        *((_BYTE *)v8 + 492) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deviceOrientationCorrectionEnabled"));
        v8[62] = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartStyle"));
        *((_BYTE *)v8 + 504) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("smartStyleReversibilitySupported"));
        return (FigCaptureStillImageSettings *)v8;
      }
      v8[41] = malloc_type_calloc(*((unsigned int *)v8 + 75), 4uLL, 0x100004052888210uLL);
      v26 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exposureTargetBiases"));
      v27 = v8[41];
      v28 = 4 * *((unsigned int *)v8 + 75);
    }
    objc_msgSend(v26, "getBytes:length:", v27, v28);
    goto LABEL_24;
  }
  return (FigCaptureStillImageSettings *)v8;
}

- (_QWORD)_initWithSettingsID:(void *)a3 captureRequestIdentifier:(void *)a4 imageGroupIdentifier:
{
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)FigCaptureStillImageSettings;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[1] = a2;
    v7[50] = objc_msgSend(a3, "copy");
    v8[49] = objc_msgSend(a4, "copy");
    *((_DWORD *)v8 + 57) = 2143289344;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t outputFormat;
  uint64_t outputFileType;
  uint64_t rawOutputFormat;
  uint64_t rawOutputFileType;
  uint64_t rawOutputFileBitDepth;
  uint64_t rawOutputFileCodec;
  double v11;
  double v12;
  double v13;
  int bracketType;
  float *exposureTargetBiases;
  uint64_t v16;
  const __CFString *v17;
  float *ISOs;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *exposureDurations;
  const __CFAllocator *v20;
  CFDictionaryRef v21;
  double v22;
  FigCaptureSmartStyle *smartStyle;
  $95D729B680665BEAEFA1D6FCA8238556 stillImageUserInitiatedRequestPTS;

  objc_msgSend(a3, "encodeInt64:forKey:", self->_settingsID, CFSTR("settingsID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_payloadType, CFSTR("payloadType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_settingsProvider, CFSTR("settingsProvider"));
  outputFormat = self->_outputFormat;
  if ((_DWORD)outputFormat)
    objc_msgSend(a3, "encodeInt32:forKey:", outputFormat, CFSTR("outputFormat"));
  outputFileType = self->_outputFileType;
  if ((_DWORD)outputFileType)
    objc_msgSend(a3, "encodeInt32:forKey:", outputFileType, CFSTR("outputFileType"));
  rawOutputFormat = self->_rawOutputFormat;
  if ((_DWORD)rawOutputFormat)
    objc_msgSend(a3, "encodeInt32:forKey:", rawOutputFormat, CFSTR("rawOutputFormat"));
  rawOutputFileType = self->_rawOutputFileType;
  if ((_DWORD)rawOutputFileType)
    objc_msgSend(a3, "encodeInt32:forKey:", rawOutputFileType, CFSTR("rawOutputFileType"));
  rawOutputFileBitDepth = self->_rawOutputFileBitDepth;
  if ((_DWORD)rawOutputFileBitDepth)
    objc_msgSend(a3, "encodeInt32:forKey:", rawOutputFileBitDepth, CFSTR("rawOutputFileBitDepth"));
  rawOutputFileCodec = self->_rawOutputFileCodec;
  if ((_DWORD)rawOutputFileCodec)
    objc_msgSend(a3, "encodeInt32:forKey:", rawOutputFileCodec, CFSTR("rawOutputFileCodec"));
  if (self->_rawOutputFileCodecQuality != 0.0)
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("rawOutputFileCodecQuality"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputWidth, CFSTR("outputWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputHeight, CFSTR("outputHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_squareCropEnabled, CFSTR("squareCropEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_outputMirroring, CFSTR("outputMirroring"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputOrientation, CFSTR("outputOrientation"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_previewEnabled, CFSTR("previewEnabled"));
  if (self->_previewEnabled)
  {
    objc_msgSend(a3, "encodeInt32:forKey:", self->_previewFormat, CFSTR("previewFormat"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_previewWidth, CFSTR("previewWidth"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_previewHeight, CFSTR("previewHeight"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_previewMirroring, CFSTR("previewMirroring"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_previewOrientation, CFSTR("previewOrientation"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", self->_thumbnailEnabled, CFSTR("thumbnailEnabled"));
  if (self->_thumbnailEnabled)
  {
    objc_msgSend(a3, "encodeInt32:forKey:", self->_thumbnailFormat, CFSTR("thumbnailFormat"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_thumbnailWidth, CFSTR("thumbnailWidth"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_thumbnailHeight, CFSTR("thumbnailHeight"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", self->_rawThumbnailEnabled, CFSTR("rawThumbnailEnabled"));
  if (self->_rawThumbnailEnabled)
  {
    objc_msgSend(a3, "encodeInt32:forKey:", self->_rawThumbnailFormat, CFSTR("rawThumbnailFormat"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_rawThumbnailWidth, CFSTR("rawThumbnailWidth"));
    objc_msgSend(a3, "encodeInt32:forKey:", self->_rawThumbnailHeight, CFSTR("rawThumbnailHeight"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", self->_noiseReductionEnabled, CFSTR("powerBlurEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_burstQualityCaptureEnabled, CFSTR("burstQualityCaptureEnabled"));
  *(float *)&v11 = self->_scaleFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("scaleFactor"), v11);
  objc_msgSend(a3, "encodeBool:forKey:", self->_zoomWithoutUpscalingEnabled, CFSTR("zoomWithoutUpscalingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_shutterSound, CFSTR("shutterSound"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_flashMode, CFSTR("flashMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoRedEyeReductionEnabled, CFSTR("autoRedEyeReductionEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_digitalFlashMode, CFSTR("digitalFlashMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_constantColorEnabled, CFSTR("constantColorEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_constantColorFallbackPhotoDeliveryEnabled, CFSTR("constantColorFallbackPhotoDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoStereoPhotoCaptureEnabled, CFSTR("autoStereoPhotoCaptureEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_wideColorMode, CFSTR("wideColorMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_HDRMode, CFSTR("HDRMode"));
  if (self->_depthDataDeliveryEnabled)
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("depthDataDeliveryEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_embedsDepthDataInImage, CFSTR("embedsDepthDataInImage"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_depthDataFiltered, CFSTR("depthDataFiltered"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", self->_cameraCalibrationDataDeliveryEnabled, CFSTR("cameraCalibrationDataDeliveryEnabled"));
  if (self->_portraitEffectsMatteDeliveryEnabled)
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("portraitEffectsMatteDeliveryEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_embedsPortraitEffectsMatteInImage, CFSTR("embedsPortraitEffectsMatteInImage"));
  }
  if (-[NSArray count](self->_enabledSemanticSegmentationMatteURNs, "count"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_enabledSemanticSegmentationMatteURNs, CFSTR("enabledSemanticSegmentationMatteURNs"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_embedsSemanticSegmentationMattesInImage, CFSTR("embedsSemanticSegmentationMattesInImage"));
  }
  if (-[NSDictionary count](self->_metadata, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  if (-[NSDictionary count](self->_metadataForOriginalImage, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_metadataForOriginalImage, CFSTR("metadataForOriginalImage"));
  if (-[NSArray count](self->_originalImageFilters, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_originalImageFilters, CFSTR("originalImageFilters"));
  if (-[NSArray count](self->_processedImageFilters, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_processedImageFilters, CFSTR("processedImageFilters"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_providesOriginalImage, CFSTR("providesOriginalImage"));
  *(float *)&v12 = self->_simulatedAperture;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("simulatedAperture"), v12);
  *(float *)&v13 = self->_portraitLightingEffectStrength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("portraitLightingEffectStrength"), v13);
  if (-[NSArray count](self->_bravoConstituentImageDeliveryDeviceTypes, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_bravoConstituentImageDeliveryDeviceTypes, CFSTR("bravoConstituentImageDeliveryDeviceTypes"));
  if (-[NSDictionary count](self->_spatialOverCaptureMetadata, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_spatialOverCaptureMetadata, CFSTR("spatialOverCaptureMetadata"));
  if (-[NSDictionary count](self->_spatialOverCaptureMetadataForOriginalImage, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_spatialOverCaptureMetadataForOriginalImage, CFSTR("spatialOverCaptureMetadataForOriginalImage"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoDeferredProcessingEnabled, CFSTR("autoDeferredProcessingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_qualityPrioritization, CFSTR("qualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_clientQualityPrioritization, CFSTR("clientQualityPrioritization"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bravoImageFusionMode, CFSTR("bravoImageFusionMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoIntelligentDistortionCorrectionEnabled, CFSTR("autoIntelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_vtCompressionProperties, CFSTR("vtCompressionProperties"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketType, CFSTR("bracketType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_bracketImageCount, CFSTR("bracketImageCount"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_lensStabilizationDuringBracketEnabled, CFSTR("lensStabilizationDuringBracketEnabled"));
  bracketType = self->_bracketType;
  if (bracketType == 1)
  {
    ISOs = self->_ISOs;
    if (ISOs)
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", ISOs, 4 * self->_bracketImageCount), CFSTR("ISOs"));
    exposureDurations = self->_exposureDurations;
    if (exposureDurations)
    {
      v16 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", exposureDurations, 24 * self->_bracketImageCount);
      v17 = CFSTR("exposureDurations");
      goto LABEL_49;
    }
  }
  else if (bracketType == 2)
  {
    exposureTargetBiases = self->_exposureTargetBiases;
    if (exposureTargetBiases)
    {
      v16 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", exposureTargetBiases, 4 * self->_bracketImageCount);
      v17 = CFSTR("exposureTargetBiases");
LABEL_49:
      objc_msgSend(a3, "encodeObject:forKey:", v16, v17);
    }
  }
  objc_msgSend(a3, "encodeInt64:forKey:", self->_stillImageUserInitiatedRequestTime, CFSTR("stillImageUserInitiatedRequestTime"));
  v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  stillImageUserInitiatedRequestPTS = self->_stillImageUserInitiatedRequestPTS;
  v21 = CMTimeCopyAsDictionary((CMTime *)&stillImageUserInitiatedRequestPTS, v20);
  objc_msgSend(a3, "encodeObject:forKey:", v21, CFSTR("stillImageUserInitiatedRequestPTS"));

  objc_msgSend(a3, "encodeInt64:forKey:", self->_stillImageRequestTime, CFSTR("stillImageRequestTime"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_stillImageCaptureStartTime, CFSTR("stillImageCaptureStartTime"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stillImageCaptureAbsoluteStartTime"), self->_stillImageCaptureAbsoluteStartTime);
  objc_msgSend(a3, "encodeObject:forKey:", self->_imageGroupIdentifier, CFSTR("imageGroupIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureRequestIdentifier, CFSTR("captureRequestIdentifier"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_clientInitiatedPrepareSettings, CFSTR("clientInitiatedPrepareSettings"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_userInitiatedRequestSettings, CFSTR("userInitiatedRequestSettings"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_beginMomentCaptureSettings, CFSTR("beginMomentCaptureSettings"));
  *(float *)&v22 = self->_videoStabilizationOverscanCropMultiplier;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("videoStabilizationOverscanCropMultiplier"), v22);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_resolutionFlavor, CFSTR("resolutionFlavor"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredPhotoProxyWidth, CFSTR("deferredPhotoProxyWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredPhotoProxyHeight, CFSTR("deferredPhotoProxyHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredPhotoFinalWidth, CFSTR("deferredPhotoFinalWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredPhotoFinalHeight, CFSTR("deferredPhotoFinalHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredSourceDeviceType, CFSTR("deferredSourceDeviceType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deferredSourcePosition, CFSTR("deferredSourcePosition"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deferredVideoFormatUniqueID, CFSTR("deferredVideoFormatUniqueID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deferredDepthDataFormatUniqueID, CFSTR("deferredDepthDataFormatUniqueID"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_bypassUpscaling, CFSTR("bypassUpscaling"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_cmioCompressedFormat, CFSTR("compressedFormat"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_cmioHighResolutionPhotoEnabled, CFSTR("highResolutionPhotoEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_cmioMaxPhotoDimensionsWidth, CFSTR("maxPhotoDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_cmioMaxPhotoDimensionsHeight, CFSTR("maxPhotoDimensionsHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deviceOrientationCorrectionEnabled, CFSTR("deviceOrientationCorrectionEnabled"));
  smartStyle = self->_smartStyle;
  if (smartStyle)
    objc_msgSend(a3, "encodeObject:forKey:", smartStyle, CFSTR("smartStyle"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_smartStyleReversibilitySupported, CFSTR("smartStyleReversibilitySupported"));
}

- (void)setStillImageUserInitiatedRequestPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillImageUserInitiatedRequestPTS.epoch = a3->var3;
  *(_OWORD *)&self->_stillImageUserInitiatedRequestPTS.value = v3;
}

- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4
{
  if (!(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a4))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid capture request identifier. Not a UUID string"), 0));
  return (FigCaptureStillImageSettings *)-[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, a3, a4, 0);
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (int)resolutionFlavor
{
  return self->_resolutionFlavor;
}

- (unsigned)deferredPhotoFinalHeight
{
  return self->_deferredPhotoFinalHeight;
}

- (NSString)deferredVideoFormatUniqueID
{
  return self->_deferredVideoFormatUniqueID;
}

- (NSString)deferredDepthDataFormatUniqueID
{
  return self->_deferredDepthDataFormatUniqueID;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (int)deferredSourceDeviceType
{
  return self->_deferredSourceDeviceType;
}

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureStillImageSettings _teardownBracketStorage]((void **)&self->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSettings;
  -[FigCaptureStillImageSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setResolutionFlavor:(int)a3
{
  self->_resolutionFlavor = a3;
}

- (void)setDeferredPhotoProxyWidth:(unsigned int)a3
{
  self->_deferredPhotoProxyWidth = a3;
}

- (void)setDeferredPhotoProxyHeight:(unsigned int)a3
{
  self->_deferredPhotoProxyHeight = a3;
}

- (void)setDeferredPhotoFinalWidth:(unsigned int)a3
{
  self->_deferredPhotoFinalWidth = a3;
}

- (void)setDeferredPhotoFinalHeight:(unsigned int)a3
{
  self->_deferredPhotoFinalHeight = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (NSArray)processedImageFilters
{
  return self->_processedImageFilters;
}

- (int)deferredSourcePosition
{
  return self->_deferredSourcePosition;
}

- (unsigned)deferredPhotoProxyWidth
{
  return self->_deferredPhotoProxyWidth;
}

- (unsigned)deferredPhotoProxyHeight
{
  return self->_deferredPhotoProxyHeight;
}

- (unsigned)deferredPhotoFinalWidth
{
  return self->_deferredPhotoFinalWidth;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3
{
  return (FigCaptureStillImageSettings *)-[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, a3, (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int bracketType;
  void *v10;
  uint64_t v11;
  double v12;
  __int128 v14;
  int64_t epoch;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettingsID:captureRequestIdentifier:", self->_settingsID, self->_captureRequestIdentifier);

  *(_QWORD *)(v4 + 392) = self->_imageGroupIdentifier;
  objc_msgSend((id)v4, "setPayloadType:", self->_payloadType);
  objc_msgSend((id)v4, "setSettingsProvider:", self->_settingsProvider);
  objc_msgSend((id)v4, "setOutputFormat:", self->_outputFormat);
  objc_msgSend((id)v4, "setOutputFileType:", self->_outputFileType);
  objc_msgSend((id)v4, "setRawOutputFormat:", self->_rawOutputFormat);
  objc_msgSend((id)v4, "setRawOutputFileType:", self->_rawOutputFileType);
  objc_msgSend((id)v4, "setRawOutputFileBitDepth:", self->_rawOutputFileBitDepth);
  objc_msgSend((id)v4, "setRawOutputFileCodec:", self->_rawOutputFileCodec);
  *(float *)&v5 = self->_rawOutputFileCodecQuality;
  objc_msgSend((id)v4, "setRawOutputFileCodecQuality:", v5);
  objc_msgSend((id)v4, "setOutputWidth:", self->_outputWidth);
  objc_msgSend((id)v4, "setOutputHeight:", self->_outputHeight);
  objc_msgSend((id)v4, "setSquareCropEnabled:", self->_squareCropEnabled);
  objc_msgSend((id)v4, "setOutputMirroring:", self->_outputMirroring);
  objc_msgSend((id)v4, "setOutputOrientation:", self->_outputOrientation);
  objc_msgSend((id)v4, "setPreviewEnabled:", self->_previewEnabled);
  if (self->_previewEnabled)
  {
    objc_msgSend((id)v4, "setPreviewFormat:", self->_previewFormat);
    objc_msgSend((id)v4, "setPreviewWidth:", self->_previewWidth);
    objc_msgSend((id)v4, "setPreviewHeight:", self->_previewHeight);
    objc_msgSend((id)v4, "setPreviewMirroring:", self->_previewMirroring);
    objc_msgSend((id)v4, "setPreviewOrientation:", self->_previewOrientation);
  }
  objc_msgSend((id)v4, "setThumbnailEnabled:", self->_thumbnailEnabled);
  if (self->_thumbnailEnabled)
  {
    objc_msgSend((id)v4, "setThumbnailFormat:", self->_thumbnailFormat);
    objc_msgSend((id)v4, "setThumbnailWidth:", self->_thumbnailWidth);
    objc_msgSend((id)v4, "setThumbnailHeight:", self->_thumbnailHeight);
  }
  objc_msgSend((id)v4, "setRawThumbnailEnabled:", self->_rawThumbnailEnabled);
  if (self->_rawThumbnailEnabled)
  {
    objc_msgSend((id)v4, "setRawThumbnailFormat:", self->_rawThumbnailFormat);
    objc_msgSend((id)v4, "setRawThumbnailWidth:", self->_rawThumbnailWidth);
    objc_msgSend((id)v4, "setRawThumbnailHeight:", self->_rawThumbnailHeight);
  }
  objc_msgSend((id)v4, "setNoiseReductionEnabled:", self->_noiseReductionEnabled);
  objc_msgSend((id)v4, "setBurstQualityCaptureEnabled:", self->_burstQualityCaptureEnabled);
  *(float *)&v6 = self->_scaleFactor;
  objc_msgSend((id)v4, "setScaleFactor:", v6);
  objc_msgSend((id)v4, "setZoomWithoutUpscalingEnabled:", self->_zoomWithoutUpscalingEnabled);
  objc_msgSend((id)v4, "setShutterSound:", self->_shutterSound);
  objc_msgSend((id)v4, "setFlashMode:", self->_flashMode);
  objc_msgSend((id)v4, "setAutoRedEyeReductionEnabled:", self->_autoRedEyeReductionEnabled);
  objc_msgSend((id)v4, "setDigitalFlashMode:", self->_digitalFlashMode);
  objc_msgSend((id)v4, "setConstantColorEnabled:", self->_constantColorEnabled);
  objc_msgSend((id)v4, "setConstantColorFallbackPhotoDeliveryEnabled:", self->_constantColorFallbackPhotoDeliveryEnabled);
  objc_msgSend((id)v4, "setAutoStereoPhotoCaptureEnabled:", self->_autoStereoPhotoCaptureEnabled);
  objc_msgSend((id)v4, "setWideColorMode:", self->_wideColorMode);
  objc_msgSend((id)v4, "setHDRMode:", self->_HDRMode);
  if (self->_depthDataDeliveryEnabled)
  {
    objc_msgSend((id)v4, "setDepthDataDeliveryEnabled:", 1);
    objc_msgSend((id)v4, "setEmbedsDepthDataInImage:", self->_embedsDepthDataInImage);
    objc_msgSend((id)v4, "setDepthDataFiltered:", self->_depthDataFiltered);
  }
  if (self->_portraitEffectsMatteDeliveryEnabled)
  {
    objc_msgSend((id)v4, "setPortraitEffectsMatteDeliveryEnabled:", 1);
    objc_msgSend((id)v4, "setEmbedsPortraitEffectsMatteInImage:", self->_embedsPortraitEffectsMatteInImage);
  }
  if (-[NSArray count](self->_enabledSemanticSegmentationMatteURNs, "count"))
  {
    objc_msgSend((id)v4, "setEnabledSemanticSegmentationMatteURNs:", self->_enabledSemanticSegmentationMatteURNs);
    objc_msgSend((id)v4, "setEmbedsSemanticSegmentationMattesInImage:", self->_embedsSemanticSegmentationMattesInImage);
  }
  objc_msgSend((id)v4, "setCameraCalibrationDataDeliveryEnabled:", self->_cameraCalibrationDataDeliveryEnabled);
  objc_msgSend((id)v4, "setMetadata:", self->_metadata);
  objc_msgSend((id)v4, "setMetadataForOriginalImage:", self->_metadataForOriginalImage);
  objc_msgSend((id)v4, "setOriginalImageFilters:", self->_originalImageFilters);
  objc_msgSend((id)v4, "setProcessedImageFilters:", self->_processedImageFilters);
  *(float *)&v7 = self->_simulatedAperture;
  objc_msgSend((id)v4, "setSimulatedAperture:", v7);
  *(float *)&v8 = self->_portraitLightingEffectStrength;
  objc_msgSend((id)v4, "setPortraitLightingEffectStrength:", v8);
  objc_msgSend((id)v4, "setProvidesOriginalImage:", self->_providesOriginalImage);
  objc_msgSend((id)v4, "setBravoConstituentImageDeliveryDeviceTypes:", self->_bravoConstituentImageDeliveryDeviceTypes);
  objc_msgSend((id)v4, "setSpatialOverCaptureMetadata:", self->_spatialOverCaptureMetadata);
  objc_msgSend((id)v4, "setSpatialOverCaptureMetadataForOriginalImage:", self->_spatialOverCaptureMetadataForOriginalImage);
  objc_msgSend((id)v4, "setAutoDeferredProcessingEnabled:", self->_autoDeferredProcessingEnabled);
  objc_msgSend((id)v4, "setQualityPrioritization:", self->_qualityPrioritization);
  objc_msgSend((id)v4, "setClientQualityPrioritization:", self->_clientQualityPrioritization);
  objc_msgSend((id)v4, "setBravoImageFusionMode:", self->_bravoImageFusionMode);
  objc_msgSend((id)v4, "setAutoIntelligentDistortionCorrectionEnabled:", self->_autoIntelligentDistortionCorrectionEnabled);
  objc_msgSend((id)v4, "setVtCompressionProperties:", self->_vtCompressionProperties);
  objc_msgSend((id)v4, "setBracketType:imageCount:", self->_bracketType, self->_bracketImageCount);
  objc_msgSend((id)v4, "setLensStabilizationDuringBracketEnabled:", self->_lensStabilizationDuringBracketEnabled);
  bracketType = self->_bracketType;
  if (bracketType == 2)
  {
    *(_QWORD *)(v4 + 328) = malloc_type_calloc(self->_bracketImageCount, 4uLL, 0x100004052888210uLL);
    v10 = (void *)objc_msgSend((id)v4, "exposureTargetBiases");
    v11 = 328;
    goto LABEL_17;
  }
  if (bracketType == 1)
  {
    *(_QWORD *)(v4 + 312) = malloc_type_calloc(self->_bracketImageCount, 0x18uLL, 0x1000040504FFAC1uLL);
    memcpy((void *)objc_msgSend((id)v4, "exposureDurations"), self->_exposureDurations, 24 * self->_bracketImageCount);
    *(_QWORD *)(v4 + 320) = malloc_type_calloc(self->_bracketImageCount, 4uLL, 0x100004052888210uLL);
    v10 = (void *)objc_msgSend((id)v4, "ISOs");
    v11 = 320;
LABEL_17:
    memcpy(v10, *(const void **)((char *)&self->super.isa + v11), 4 * self->_bracketImageCount);
  }
  objc_msgSend((id)v4, "setStillImageUserInitiatedRequestTime:", self->_stillImageUserInitiatedRequestTime);
  v14 = *(_OWORD *)&self->_stillImageUserInitiatedRequestPTS.value;
  epoch = self->_stillImageUserInitiatedRequestPTS.epoch;
  objc_msgSend((id)v4, "setStillImageUserInitiatedRequestPTS:", &v14);
  objc_msgSend((id)v4, "setStillImageRequestTime:", self->_stillImageRequestTime);
  objc_msgSend((id)v4, "setStillImageCaptureStartTime:", self->_stillImageCaptureStartTime);
  objc_msgSend((id)v4, "setStillImageCaptureAbsoluteStartTime:", self->_stillImageCaptureAbsoluteStartTime);
  objc_msgSend((id)v4, "setImageGroupIdentifier:", self->_imageGroupIdentifier);
  objc_msgSend((id)v4, "setClientInitiatedPrepareSettings:", self->_clientInitiatedPrepareSettings);
  objc_msgSend((id)v4, "setUserInitiatedRequestSettings:", self->_userInitiatedRequestSettings);
  *(float *)&v12 = self->_videoStabilizationOverscanCropMultiplier;
  objc_msgSend((id)v4, "setVideoStabilizationOverscanCropMultiplier:", v12);
  objc_msgSend((id)v4, "setResolutionFlavor:", self->_resolutionFlavor);
  objc_msgSend((id)v4, "setDeferredPhotoProxyWidth:", self->_deferredPhotoProxyWidth);
  objc_msgSend((id)v4, "setDeferredPhotoProxyHeight:", self->_deferredPhotoProxyHeight);
  objc_msgSend((id)v4, "setDeferredPhotoFinalWidth:", self->_deferredPhotoFinalWidth);
  objc_msgSend((id)v4, "setDeferredPhotoFinalHeight:", self->_deferredPhotoFinalHeight);
  objc_msgSend((id)v4, "setDeferredSourceDeviceType:", self->_deferredSourceDeviceType);
  objc_msgSend((id)v4, "setDeferredSourcePosition:", self->_deferredSourcePosition);
  objc_msgSend((id)v4, "setDeferredVideoFormatUniqueID:", self->_deferredVideoFormatUniqueID);
  objc_msgSend((id)v4, "setDeferredDepthDataFormatUniqueID:", self->_deferredDepthDataFormatUniqueID);
  objc_msgSend((id)v4, "setBypassUpscaling:", self->_bypassUpscaling);
  objc_msgSend((id)v4, "setCmioCompressedFormat:", self->_cmioCompressedFormat);
  objc_msgSend((id)v4, "setCmioHighResolutionPhotoEnabled:", self->_cmioHighResolutionPhotoEnabled);
  objc_msgSend((id)v4, "setCmioMaxPhotoDimensionsWidth:", self->_cmioMaxPhotoDimensionsWidth);
  objc_msgSend((id)v4, "setCmioMaxPhotoDimensionsHeight:", self->_cmioMaxPhotoDimensionsHeight);
  objc_msgSend((id)v4, "setDeviceOrientationCorrectionEnabled:", self->_deviceOrientationCorrectionEnabled);
  objc_msgSend((id)v4, "setSmartStyle:", self->_smartStyle);
  objc_msgSend((id)v4, "setSmartStyleReversibilitySupported:", self->_smartStyleReversibilitySupported);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t settingsID;
  int payloadType;
  int settingsProvider;
  unsigned int outputFormat;
  int outputFileType;
  unsigned int rawOutputFormat;
  int rawOutputFileType;
  unsigned int rawOutputFileBitDepth;
  unsigned int rawOutputFileCodec;
  float rawOutputFileCodecQuality;
  float v19;
  unsigned int outputWidth;
  unsigned int outputHeight;
  int squareCropEnabled;
  int outputMirroring;
  int outputOrientation;
  int previewEnabled;
  unsigned int previewFormat;
  unsigned int previewWidth;
  unsigned int previewHeight;
  int previewMirroring;
  int previewOrientation;
  int thumbnailEnabled;
  unsigned int thumbnailFormat;
  unsigned int thumbnailWidth;
  unsigned int thumbnailHeight;
  int rawThumbnailEnabled;
  unsigned int rawThumbnailFormat;
  unsigned int rawThumbnailWidth;
  unsigned int rawThumbnailHeight;
  int noiseReductionEnabled;
  int burstQualityCaptureEnabled;
  float scaleFactor;
  float v42;
  int zoomWithoutUpscalingEnabled;
  unsigned int shutterSound;
  int flashMode;
  int autoRedEyeReductionEnabled;
  int digitalFlashMode;
  int constantColorEnabled;
  int constantColorFallbackPhotoDeliveryEnabled;
  int autoStereoPhotoCaptureEnabled;
  int wideColorMode;
  int HDRMode;
  int depthDataDeliveryEnabled;
  int embedsDepthDataInImage;
  int depthDataFiltered;
  int cameraCalibrationDataDeliveryEnabled;
  int portraitEffectsMatteDeliveryEnabled;
  int embedsPortraitEffectsMatteInImage;
  void *v59;
  uint64_t v60;
  int embedsSemanticSegmentationMattesInImage;
  NSDictionary *metadata;
  NSDictionary *metadataForOriginalImage;
  NSUInteger v64;
  uint64_t v65;
  unsigned int v66;
  BOOL v67;
  NSUInteger v68;
  uint64_t v69;
  unsigned int v70;
  float simulatedAperture;
  float v72;
  float portraitLightingEffectStrength;
  float v74;
  int providesOriginalImage;
  NSArray *bravoConstituentImageDeliveryDeviceTypes;
  NSDictionary *spatialOverCaptureMetadata;
  NSDictionary *spatialOverCaptureMetadataForOriginalImage;
  int autoDeferredProcessingEnabled;
  int qualityPrioritization;
  int clientQualityPrioritization;
  int bravoImageFusionMode;
  int autoIntelligentDistortionCorrectionEnabled;
  NSDictionary *vtCompressionProperties;
  int bracketType;
  unsigned int bracketImageCount;
  int lensStabilizationDuringBracketEnabled;
  uint64_t v88;
  unint64_t v89;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  float v94;
  float v95;
  unint64_t stillImageUserInitiatedRequestTime;
  int64_t stillImageRequestTime;
  int64_t stillImageCaptureStartTime;
  double stillImageCaptureAbsoluteStartTime;
  double v100;
  NSString *imageGroupIdentifier;
  NSString *captureRequestIdentifier;
  int clientInitiatedPrepareSettings;
  int userInitiatedRequestSettings;
  float videoStabilizationOverscanCropMultiplier;
  float v106;
  int resolutionFlavor;
  unsigned int deferredPhotoProxyWidth;
  unsigned int deferredPhotoProxyHeight;
  unsigned int deferredPhotoFinalWidth;
  unsigned int deferredPhotoFinalHeight;
  int deferredSourceDeviceType;
  int deferredSourcePosition;
  NSString *deferredVideoFormatUniqueID;
  NSString *deferredDepthDataFormatUniqueID;
  int bypassUpscaling;
  NSString *cmioCompressedFormat;
  int cmioHighResolutionPhotoEnabled;
  int cmioMaxPhotoDimensionsWidth;
  int cmioMaxPhotoDimensionsHeight;
  int deviceOrientationCorrectionEnabled;
  FigCaptureSmartStyle *smartStyle;
  int smartStyleReversibilitySupported;
  CMTime v125;
  CMTime time2;
  CMTime time1;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  if (a3 == self)
  {
    LOBYTE(v60) = 1;
    return v60;
  }
  v128 = v6;
  v129 = v5;
  v130 = v3;
  v131 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_147;
  settingsID = self->_settingsID;
  if (settingsID != objc_msgSend(a3, "settingsID"))
    goto LABEL_147;
  payloadType = self->_payloadType;
  if (payloadType != objc_msgSend(a3, "payloadType"))
    goto LABEL_147;
  settingsProvider = self->_settingsProvider;
  if (settingsProvider != objc_msgSend(a3, "settingsProvider"))
    goto LABEL_147;
  outputFormat = self->_outputFormat;
  if (outputFormat != objc_msgSend(a3, "outputFormat"))
    goto LABEL_147;
  outputFileType = self->_outputFileType;
  if (outputFileType != objc_msgSend(a3, "outputFileType"))
    goto LABEL_147;
  rawOutputFormat = self->_rawOutputFormat;
  if (rawOutputFormat != objc_msgSend(a3, "rawOutputFormat"))
    goto LABEL_147;
  rawOutputFileType = self->_rawOutputFileType;
  if (rawOutputFileType != objc_msgSend(a3, "rawOutputFileType"))
    goto LABEL_147;
  rawOutputFileBitDepth = self->_rawOutputFileBitDepth;
  if (rawOutputFileBitDepth != objc_msgSend(a3, "rawOutputFileBitDepth"))
    goto LABEL_147;
  rawOutputFileCodec = self->_rawOutputFileCodec;
  if (rawOutputFileCodec != objc_msgSend(a3, "rawOutputFileCodec"))
    goto LABEL_147;
  rawOutputFileCodecQuality = self->_rawOutputFileCodecQuality;
  objc_msgSend(a3, "rawOutputFileCodecQuality");
  if (rawOutputFileCodecQuality != v19)
    goto LABEL_147;
  outputWidth = self->_outputWidth;
  if (outputWidth != objc_msgSend(a3, "outputWidth"))
    goto LABEL_147;
  outputHeight = self->_outputHeight;
  if (outputHeight != objc_msgSend(a3, "outputHeight"))
    goto LABEL_147;
  squareCropEnabled = self->_squareCropEnabled;
  if (squareCropEnabled != objc_msgSend(a3, "squareCropEnabled"))
    goto LABEL_147;
  outputMirroring = self->_outputMirroring;
  if (outputMirroring != objc_msgSend(a3, "outputMirroring"))
    goto LABEL_147;
  outputOrientation = self->_outputOrientation;
  if (outputOrientation != objc_msgSend(a3, "outputOrientation"))
    goto LABEL_147;
  previewEnabled = self->_previewEnabled;
  if (previewEnabled != objc_msgSend(a3, "previewEnabled"))
    goto LABEL_147;
  previewFormat = self->_previewFormat;
  if (previewFormat != objc_msgSend(a3, "previewFormat"))
    goto LABEL_147;
  previewWidth = self->_previewWidth;
  if (previewWidth != objc_msgSend(a3, "previewWidth"))
    goto LABEL_147;
  previewHeight = self->_previewHeight;
  if (previewHeight != objc_msgSend(a3, "previewHeight"))
    goto LABEL_147;
  previewMirroring = self->_previewMirroring;
  if (previewMirroring != objc_msgSend(a3, "previewMirroring"))
    goto LABEL_147;
  previewOrientation = self->_previewOrientation;
  if (previewOrientation != objc_msgSend(a3, "previewOrientation"))
    goto LABEL_147;
  thumbnailEnabled = self->_thumbnailEnabled;
  if (thumbnailEnabled != objc_msgSend(a3, "thumbnailEnabled"))
    goto LABEL_147;
  thumbnailFormat = self->_thumbnailFormat;
  if (thumbnailFormat != objc_msgSend(a3, "thumbnailFormat"))
    goto LABEL_147;
  thumbnailWidth = self->_thumbnailWidth;
  if (thumbnailWidth != objc_msgSend(a3, "thumbnailWidth"))
    goto LABEL_147;
  thumbnailHeight = self->_thumbnailHeight;
  if (thumbnailHeight != objc_msgSend(a3, "thumbnailHeight"))
    goto LABEL_147;
  rawThumbnailEnabled = self->_rawThumbnailEnabled;
  if (rawThumbnailEnabled != objc_msgSend(a3, "rawThumbnailEnabled"))
    goto LABEL_147;
  rawThumbnailFormat = self->_rawThumbnailFormat;
  if (rawThumbnailFormat != objc_msgSend(a3, "rawThumbnailFormat"))
    goto LABEL_147;
  rawThumbnailWidth = self->_rawThumbnailWidth;
  if (rawThumbnailWidth != objc_msgSend(a3, "rawThumbnailWidth"))
    goto LABEL_147;
  rawThumbnailHeight = self->_rawThumbnailHeight;
  if (rawThumbnailHeight != objc_msgSend(a3, "rawThumbnailHeight"))
    goto LABEL_147;
  noiseReductionEnabled = self->_noiseReductionEnabled;
  if (noiseReductionEnabled != objc_msgSend(a3, "noiseReductionEnabled"))
    goto LABEL_147;
  burstQualityCaptureEnabled = self->_burstQualityCaptureEnabled;
  if (burstQualityCaptureEnabled != objc_msgSend(a3, "burstQualityCaptureEnabled"))
    goto LABEL_147;
  scaleFactor = self->_scaleFactor;
  objc_msgSend(a3, "scaleFactor");
  if (scaleFactor != v42)
    goto LABEL_147;
  zoomWithoutUpscalingEnabled = self->_zoomWithoutUpscalingEnabled;
  if (zoomWithoutUpscalingEnabled != objc_msgSend(a3, "isZoomWithoutUpscalingEnabled"))
    goto LABEL_147;
  shutterSound = self->_shutterSound;
  if (shutterSound != objc_msgSend(a3, "shutterSound"))
    goto LABEL_147;
  flashMode = self->_flashMode;
  if (flashMode != objc_msgSend(a3, "flashMode"))
    goto LABEL_147;
  autoRedEyeReductionEnabled = self->_autoRedEyeReductionEnabled;
  if (autoRedEyeReductionEnabled != objc_msgSend(a3, "autoRedEyeReductionEnabled"))
    goto LABEL_147;
  digitalFlashMode = self->_digitalFlashMode;
  if (digitalFlashMode != objc_msgSend(a3, "digitalFlashMode"))
    goto LABEL_147;
  constantColorEnabled = self->_constantColorEnabled;
  if (constantColorEnabled != objc_msgSend(a3, "constantColorEnabled"))
    goto LABEL_147;
  constantColorFallbackPhotoDeliveryEnabled = self->_constantColorFallbackPhotoDeliveryEnabled;
  if (constantColorFallbackPhotoDeliveryEnabled != objc_msgSend(a3, "constantColorFallbackPhotoDeliveryEnabled"))goto LABEL_147;
  autoStereoPhotoCaptureEnabled = self->_autoStereoPhotoCaptureEnabled;
  if (autoStereoPhotoCaptureEnabled != objc_msgSend(a3, "autoStereoPhotoCaptureEnabled"))
    goto LABEL_147;
  wideColorMode = self->_wideColorMode;
  if (wideColorMode != objc_msgSend(a3, "wideColorMode"))
    goto LABEL_147;
  HDRMode = self->_HDRMode;
  if (HDRMode != objc_msgSend(a3, "HDRMode"))
    goto LABEL_147;
  depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
  if (depthDataDeliveryEnabled != objc_msgSend(a3, "depthDataDeliveryEnabled"))
    goto LABEL_147;
  embedsDepthDataInImage = self->_embedsDepthDataInImage;
  if (embedsDepthDataInImage != objc_msgSend(a3, "embedsDepthDataInImage"))
    goto LABEL_147;
  depthDataFiltered = self->_depthDataFiltered;
  if (depthDataFiltered != objc_msgSend(a3, "depthDataFiltered"))
    goto LABEL_147;
  cameraCalibrationDataDeliveryEnabled = self->_cameraCalibrationDataDeliveryEnabled;
  if (cameraCalibrationDataDeliveryEnabled != objc_msgSend(a3, "cameraCalibrationDataDeliveryEnabled"))
    goto LABEL_147;
  portraitEffectsMatteDeliveryEnabled = self->_portraitEffectsMatteDeliveryEnabled;
  if (portraitEffectsMatteDeliveryEnabled != objc_msgSend(a3, "portraitEffectsMatteDeliveryEnabled"))
    goto LABEL_147;
  embedsPortraitEffectsMatteInImage = self->_embedsPortraitEffectsMatteInImage;
  if (embedsPortraitEffectsMatteInImage != objc_msgSend(a3, "embedsPortraitEffectsMatteInImage"))
    goto LABEL_147;
  v59 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_enabledSemanticSegmentationMatteURNs);
  LODWORD(v60) = objc_msgSend(v59, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")));
  if (!(_DWORD)v60)
    return v60;
  embedsSemanticSegmentationMattesInImage = self->_embedsSemanticSegmentationMattesInImage;
  if (embedsSemanticSegmentationMattesInImage != objc_msgSend(a3, "embedsSemanticSegmentationMattesInImage"))goto LABEL_147;
  metadata = self->_metadata;
  if (metadata == (NSDictionary *)objc_msgSend(a3, "metadata")
    || (LODWORD(v60) = -[NSDictionary isEqual:](self->_metadata, "isEqual:", objc_msgSend(a3, "metadata")), (_DWORD)v60))
  {
    metadataForOriginalImage = self->_metadataForOriginalImage;
    if (metadataForOriginalImage == (NSDictionary *)objc_msgSend(a3, "metadataForOriginalImage")
      || (LODWORD(v60) = -[NSDictionary isEqual:](self->_metadataForOriginalImage, "isEqual:", objc_msgSend(a3, "metadataForOriginalImage")), (_DWORD)v60))
    {
      v64 = -[NSArray count](self->_originalImageFilters, "count");
      if (v64 != objc_msgSend((id)objc_msgSend(a3, "originalImageFilters"), "count"))
        goto LABEL_147;
      if (-[NSArray count](self->_originalImageFilters, "count"))
      {
        v65 = 0;
        v66 = 1;
        while ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_originalImageFilters, "objectAtIndexedSubscript:", v65), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "originalImageFilters"), "objectAtIndexedSubscript:", v65), "name")) & 1) != 0)
        {
          v65 = v66;
          v67 = -[NSArray count](self->_originalImageFilters, "count") > v66++;
          if (!v67)
            goto LABEL_62;
        }
        goto LABEL_147;
      }
LABEL_62:
      v68 = -[NSArray count](self->_processedImageFilters, "count");
      if (v68 != objc_msgSend((id)objc_msgSend(a3, "processedImageFilters"), "count"))
        goto LABEL_147;
      if (-[NSArray count](self->_processedImageFilters, "count"))
      {
        v69 = 0;
        v70 = 1;
        while ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_processedImageFilters, "objectAtIndexedSubscript:", v69), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processedImageFilters"), "objectAtIndexedSubscript:", v69), "name")) & 1) != 0)
        {
          v69 = v70;
          v67 = -[NSArray count](self->_processedImageFilters, "count") > v70++;
          if (!v67)
            goto LABEL_67;
        }
        goto LABEL_147;
      }
LABEL_67:
      simulatedAperture = self->_simulatedAperture;
      objc_msgSend(a3, "simulatedAperture");
      if (simulatedAperture != v72)
        goto LABEL_147;
      portraitLightingEffectStrength = self->_portraitLightingEffectStrength;
      objc_msgSend(a3, "portraitLightingEffectStrength");
      if (portraitLightingEffectStrength != v74)
        goto LABEL_147;
      providesOriginalImage = self->_providesOriginalImage;
      if (providesOriginalImage != objc_msgSend(a3, "providesOriginalImage"))
        goto LABEL_147;
      bravoConstituentImageDeliveryDeviceTypes = self->_bravoConstituentImageDeliveryDeviceTypes;
      if (bravoConstituentImageDeliveryDeviceTypes == (NSArray *)objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes")|| (LODWORD(v60) = -[NSArray isEqual:](self->_bravoConstituentImageDeliveryDeviceTypes, "isEqual:", objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes")), (_DWORD)v60))
      {
        spatialOverCaptureMetadata = self->_spatialOverCaptureMetadata;
        if (spatialOverCaptureMetadata == (NSDictionary *)objc_msgSend(a3, "spatialOverCaptureMetadata")
          || (LODWORD(v60) = -[NSDictionary isEqual:](self->_spatialOverCaptureMetadata, "isEqual:", objc_msgSend(a3, "spatialOverCaptureMetadata")), (_DWORD)v60))
        {
          spatialOverCaptureMetadataForOriginalImage = self->_spatialOverCaptureMetadataForOriginalImage;
          if (spatialOverCaptureMetadataForOriginalImage == (NSDictionary *)objc_msgSend(a3, "spatialOverCaptureMetadataForOriginalImage")|| (LODWORD(v60) = -[NSDictionary isEqual:](self->_spatialOverCaptureMetadataForOriginalImage, "isEqual:", objc_msgSend(a3, "spatialOverCaptureMetadataForOriginalImage")), (_DWORD)v60))
          {
            autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled;
            if (autoDeferredProcessingEnabled != objc_msgSend(a3, "autoDeferredProcessingEnabled"))
              goto LABEL_147;
            qualityPrioritization = self->_qualityPrioritization;
            if (qualityPrioritization != objc_msgSend(a3, "qualityPrioritization"))
              goto LABEL_147;
            clientQualityPrioritization = self->_clientQualityPrioritization;
            if (clientQualityPrioritization != objc_msgSend(a3, "clientQualityPrioritization"))
              goto LABEL_147;
            bravoImageFusionMode = self->_bravoImageFusionMode;
            if (bravoImageFusionMode != objc_msgSend(a3, "bravoImageFusionMode"))
              goto LABEL_147;
            autoIntelligentDistortionCorrectionEnabled = self->_autoIntelligentDistortionCorrectionEnabled;
            if (autoIntelligentDistortionCorrectionEnabled != objc_msgSend(a3, "autoIntelligentDistortionCorrectionEnabled"))goto LABEL_147;
            vtCompressionProperties = self->_vtCompressionProperties;
            if (vtCompressionProperties != (NSDictionary *)objc_msgSend(a3, "vtCompressionProperties"))
            {
              LODWORD(v60) = -[NSDictionary isEqual:](self->_vtCompressionProperties, "isEqual:", objc_msgSend(a3, "vtCompressionProperties"));
              if (!(_DWORD)v60)
                return v60;
            }
            bracketType = self->_bracketType;
            if (bracketType != objc_msgSend(a3, "bracketType"))
              goto LABEL_147;
            bracketImageCount = self->_bracketImageCount;
            if (bracketImageCount != objc_msgSend(a3, "bracketImageCount"))
              goto LABEL_147;
            lensStabilizationDuringBracketEnabled = self->_lensStabilizationDuringBracketEnabled;
            if (lensStabilizationDuringBracketEnabled != objc_msgSend(a3, "lensStabilizationDuringBracketEnabled"))goto LABEL_147;
            if (self->_bracketImageCount)
            {
              v88 = 0;
              v89 = 0;
              do
              {
                if (self->_exposureDurations)
                  goto LABEL_153;
                if (objc_msgSend(a3, "exposureDurations"))
                  goto LABEL_147;
                if (self->_exposureDurations)
                {
LABEL_153:
                  v60 = objc_msgSend(a3, "exposureDurations");
                  if (!v60)
                    return v60;
                  if (self->_exposureDurations)
                  {
                    if (objc_msgSend(a3, "exposureDurations"))
                    {
                      v90 = &self->_exposureDurations[v88];
                      v91 = objc_msgSend(a3, "exposureDurations");
                      v92 = *(_OWORD *)&v90->var0;
                      time1.epoch = v90->var3;
                      *(_OWORD *)&time1.value = v92;
                      v93 = *(_OWORD *)(v91 + v88 * 24);
                      time2.epoch = *(_QWORD *)(v91 + v88 * 24 + 16);
                      *(_OWORD *)&time2.value = v93;
                      if (CMTimeCompare(&time1, &time2))
                        goto LABEL_147;
                    }
                  }
                }
                if (self->_ISOs)
                  goto LABEL_152;
                if (objc_msgSend(a3, "ISOs"))
                  goto LABEL_147;
                if (self->_ISOs)
                {
LABEL_152:
                  v60 = objc_msgSend(a3, "ISOs");
                  if (!v60)
                    return v60;
                  if (self->_ISOs)
                  {
                    if (objc_msgSend(a3, "ISOs"))
                    {
                      v94 = self->_ISOs[v89];
                      if (v94 != *(float *)(objc_msgSend(a3, "ISOs") + 4 * v89))
                        goto LABEL_147;
                    }
                  }
                }
                if (self->_exposureTargetBiases)
                  goto LABEL_151;
                if (objc_msgSend(a3, "exposureTargetBiases"))
                  goto LABEL_147;
                if (self->_exposureTargetBiases)
                {
LABEL_151:
                  v60 = objc_msgSend(a3, "exposureTargetBiases");
                  if (!v60)
                    return v60;
                  if (self->_exposureTargetBiases)
                  {
                    if (objc_msgSend(a3, "exposureTargetBiases"))
                    {
                      v95 = self->_exposureTargetBiases[v89];
                      if (v95 != *(float *)(objc_msgSend(a3, "exposureTargetBiases") + 4 * v89))
                        goto LABEL_147;
                    }
                  }
                }
                ++v89;
                ++v88;
              }
              while (v89 < self->_bracketImageCount);
            }
            stillImageUserInitiatedRequestTime = self->_stillImageUserInitiatedRequestTime;
            if (stillImageUserInitiatedRequestTime != objc_msgSend(a3, "stillImageUserInitiatedRequestTime"))
              goto LABEL_147;
            if (a3)
              objc_msgSend(a3, "stillImageUserInitiatedRequestPTS");
            else
              memset(&v125, 0, sizeof(v125));
            time1 = (CMTime)self->_stillImageUserInitiatedRequestPTS;
            if (CMTimeCompare(&time1, &v125))
              goto LABEL_147;
            stillImageRequestTime = self->_stillImageRequestTime;
            if (stillImageRequestTime != objc_msgSend(a3, "stillImageRequestTime"))
              goto LABEL_147;
            stillImageCaptureStartTime = self->_stillImageCaptureStartTime;
            if (stillImageCaptureStartTime != objc_msgSend(a3, "stillImageCaptureStartTime"))
              goto LABEL_147;
            stillImageCaptureAbsoluteStartTime = self->_stillImageCaptureAbsoluteStartTime;
            objc_msgSend(a3, "stillImageCaptureAbsoluteStartTime");
            if (stillImageCaptureAbsoluteStartTime != v100)
              goto LABEL_147;
            imageGroupIdentifier = self->_imageGroupIdentifier;
            if (imageGroupIdentifier == (NSString *)objc_msgSend(a3, "imageGroupIdentifier")
              || (LODWORD(v60) = -[NSString isEqualToString:](self->_imageGroupIdentifier, "isEqualToString:", objc_msgSend(a3, "imageGroupIdentifier")), (_DWORD)v60))
            {
              captureRequestIdentifier = self->_captureRequestIdentifier;
              if (captureRequestIdentifier == (NSString *)objc_msgSend(a3, "captureRequestIdentifier")
                || (LODWORD(v60) = -[NSString isEqualToString:](self->_captureRequestIdentifier, "isEqualToString:", objc_msgSend(a3, "captureRequestIdentifier")), (_DWORD)v60))
              {
                clientInitiatedPrepareSettings = self->_clientInitiatedPrepareSettings;
                if (clientInitiatedPrepareSettings != objc_msgSend(a3, "isClientInitiatedPrepareSettings"))goto LABEL_147;
                userInitiatedRequestSettings = self->_userInitiatedRequestSettings;
                if (userInitiatedRequestSettings != objc_msgSend(a3, "isUserInitiatedRequestSettings"))
                  goto LABEL_147;
                videoStabilizationOverscanCropMultiplier = self->_videoStabilizationOverscanCropMultiplier;
                objc_msgSend(a3, "videoStabilizationOverscanCropMultiplier");
                if (videoStabilizationOverscanCropMultiplier != v106)
                  goto LABEL_147;
                resolutionFlavor = self->_resolutionFlavor;
                if (resolutionFlavor != objc_msgSend(a3, "resolutionFlavor"))
                  goto LABEL_147;
                deferredPhotoProxyWidth = self->_deferredPhotoProxyWidth;
                if (deferredPhotoProxyWidth != objc_msgSend(a3, "deferredPhotoProxyWidth"))
                  goto LABEL_147;
                deferredPhotoProxyHeight = self->_deferredPhotoProxyHeight;
                if (deferredPhotoProxyHeight != objc_msgSend(a3, "deferredPhotoProxyHeight"))
                  goto LABEL_147;
                deferredPhotoFinalWidth = self->_deferredPhotoFinalWidth;
                if (deferredPhotoFinalWidth != objc_msgSend(a3, "deferredPhotoFinalWidth"))
                  goto LABEL_147;
                deferredPhotoFinalHeight = self->_deferredPhotoFinalHeight;
                if (deferredPhotoFinalHeight != objc_msgSend(a3, "deferredPhotoFinalHeight"))
                  goto LABEL_147;
                deferredSourceDeviceType = self->_deferredSourceDeviceType;
                if (deferredSourceDeviceType != objc_msgSend(a3, "deferredSourceDeviceType"))
                  goto LABEL_147;
                deferredSourcePosition = self->_deferredSourcePosition;
                if (deferredSourcePosition != objc_msgSend(a3, "deferredSourcePosition"))
                  goto LABEL_147;
                deferredVideoFormatUniqueID = self->_deferredVideoFormatUniqueID;
                if (deferredVideoFormatUniqueID == (NSString *)objc_msgSend(a3, "deferredVideoFormatUniqueID")
                  || (LODWORD(v60) = -[NSString isEqualToString:](self->_deferredVideoFormatUniqueID, "isEqualToString:", objc_msgSend(a3, "deferredVideoFormatUniqueID")), (_DWORD)v60))
                {
                  deferredDepthDataFormatUniqueID = self->_deferredDepthDataFormatUniqueID;
                  if (deferredDepthDataFormatUniqueID == (NSString *)objc_msgSend(a3, "deferredDepthDataFormatUniqueID")|| (LODWORD(v60) = -[NSString isEqualToString:](self->_deferredDepthDataFormatUniqueID, "isEqualToString:", objc_msgSend(a3, "deferredDepthDataFormatUniqueID")), (_DWORD)v60))
                  {
                    bypassUpscaling = self->_bypassUpscaling;
                    if (bypassUpscaling == objc_msgSend(a3, "bypassUpscaling"))
                    {
                      cmioCompressedFormat = self->_cmioCompressedFormat;
                      if (cmioCompressedFormat != (NSString *)objc_msgSend(a3, "cmioCompressedFormat"))
                      {
                        LODWORD(v60) = -[NSString isEqualToString:](self->_cmioCompressedFormat, "isEqualToString:", objc_msgSend(a3, "cmioCompressedFormat"));
                        if (!(_DWORD)v60)
                          return v60;
                      }
                      cmioHighResolutionPhotoEnabled = self->_cmioHighResolutionPhotoEnabled;
                      if (cmioHighResolutionPhotoEnabled == objc_msgSend(a3, "cmioHighResolutionPhotoEnabled"))
                      {
                        cmioMaxPhotoDimensionsWidth = self->_cmioMaxPhotoDimensionsWidth;
                        if (cmioMaxPhotoDimensionsWidth == objc_msgSend(a3, "cmioMaxPhotoDimensionsWidth"))
                        {
                          cmioMaxPhotoDimensionsHeight = self->_cmioMaxPhotoDimensionsHeight;
                          if (cmioMaxPhotoDimensionsHeight == objc_msgSend(a3, "cmioMaxPhotoDimensionsHeight"))
                          {
                            deviceOrientationCorrectionEnabled = self->_deviceOrientationCorrectionEnabled;
                            if (deviceOrientationCorrectionEnabled == objc_msgSend(a3, "deviceOrientationCorrectionEnabled"))
                            {
                              smartStyle = self->_smartStyle;
                              if (smartStyle == (FigCaptureSmartStyle *)objc_msgSend(a3, "smartStyle")
                                || (LODWORD(v60) = -[FigCaptureSmartStyle isEqual:](self->_smartStyle, "isEqual:", objc_msgSend(a3, "smartStyle")), (_DWORD)v60))
                              {
                                smartStyleReversibilitySupported = self->_smartStyleReversibilitySupported;
                                LOBYTE(v60) = smartStyleReversibilitySupported == objc_msgSend(a3, "smartStyleReversibilitySupported");
                              }
                              return v60;
                            }
                          }
                        }
                      }
                    }
LABEL_147:
                    LOBYTE(v60) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v60;
}

- (unint64_t)hash
{
  return self->_settingsID;
}

- (NSDictionary)outputPixelBufferAttributes
{
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  if (!-[FigCaptureStillImageSettings outputFormat](self, "outputFormat")
    || -[FigCaptureStillImageSettings isOutputFormatCompressed](self, "isOutputFormatCompressed"))
  {
    return 0;
  }
  v4[0] = *MEMORY[0x1E0CA9040];
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputFormat](self, "outputFormat"));
  v4[1] = *MEMORY[0x1E0CA90E0];
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputWidth](self, "outputWidth"));
  v4[2] = *MEMORY[0x1E0CA8FD8];
  v5[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputHeight](self, "outputHeight"));
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (BOOL)isOutputFormatCompressed
{
  unsigned int v2;
  BOOL v3;

  v2 = -[FigCaptureStillImageSettings outputFormat](self, "outputFormat");
  v3 = v2 == 1752589105 || v2 == 1785750887;
  return v2 == 1635148593 || v3;
}

- (NSDictionary)previewPixelBufferAttributes
{
  unsigned int v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = -[FigCaptureStillImageSettings previewFormat](self, "previewFormat");
  if (v3 != 875704422 && v3 != 1111970369 && v3 != 875704438)
    return 0;
  v5[0] = *MEMORY[0x1E0CA9040];
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewFormat](self, "previewFormat"));
  v5[1] = *MEMORY[0x1E0CA90E0];
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewWidth](self, "previewWidth"));
  v5[2] = *MEMORY[0x1E0CA8FD8];
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewHeight](self, "previewHeight"));
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
}

- (void)cannotProcessDepthPhotos
{
  -[FigCaptureStillImageSettings setDepthDataDeliveryEnabled:](self, "setDepthDataDeliveryEnabled:", 0);
  -[FigCaptureStillImageSettings setProcessedImageFilters:](self, "setProcessedImageFilters:", 0);
  -[FigCaptureStillImageSettings setPortraitEffectsMatteDeliveryEnabled:](self, "setPortraitEffectsMatteDeliveryEnabled:", 0);
  -[FigCaptureStillImageSettings setEmbedsPortraitEffectsMatteInImage:](self, "setEmbedsPortraitEffectsMatteInImage:", 0);
}

- (BOOL)constituentPhotoDeliveryEnabled
{
  return -[NSArray count](self->_bravoConstituentImageDeliveryDeviceTypes, "count") != 0;
}

- (void)setBracketType:(int)a3 imageCount:(unsigned int)a4
{
  unsigned int v7;
  float **p_exposureTargetBiases;

  if (self->_bracketType != a3 || self->_bracketImageCount != a4)
    -[FigCaptureStillImageSettings _teardownBracketStorage]((void **)&self->super.isa);
  self->_bracketType = a3;
  if (a4 >= 8)
    v7 = 8;
  else
    v7 = a4;
  self->_bracketImageCount = v7;
  if (a4)
  {
    if (a3 == 2)
    {
      if (self->_exposureTargetBiases)
        return;
      p_exposureTargetBiases = &self->_exposureTargetBiases;
      goto LABEL_16;
    }
    if (a3 == 1)
    {
      if (!self->_exposureDurations)
        self->_exposureDurations = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_calloc(a4, 0x18uLL, 0x1000040504FFAC1uLL);
      if (!self->_ISOs)
      {
        p_exposureTargetBiases = &self->_ISOs;
LABEL_16:
        *p_exposureTargetBiases = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
      }
    }
  }
}

- (NSString)imageGroupIdentifier
{
  NSString *result;

  if (!self->_providesOriginalImage && !self->_bracketImageCount && (!self->_rawOutputFormat || !self->_outputFormat))
    return 0;
  result = self->_imageGroupIdentifier;
  if (!result)
  {
    result = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    self->_imageGroupIdentifier = result;
  }
  return result;
}

- (id)figCaptureIrisPreparedSettingsRepresentation
{
  FigCaptureIrisPreparedSettings *v3;

  v3 = objc_alloc_init(FigCaptureIrisPreparedSettings);
  -[FigCaptureIrisPreparedSettings setSettingsID:](v3, "setSettingsID:", self->_settingsID);
  -[FigCaptureIrisPreparedSettings setProcessedOutputFormat:](v3, "setProcessedOutputFormat:", self->_outputFormat);
  -[FigCaptureIrisPreparedSettings setOutputWidth:](v3, "setOutputWidth:", self->_outputWidth);
  -[FigCaptureIrisPreparedSettings setOutputHeight:](v3, "setOutputHeight:", self->_outputHeight);
  -[FigCaptureIrisPreparedSettings setRawOutputFormat:](v3, "setRawOutputFormat:", self->_rawOutputFormat);
  -[FigCaptureIrisPreparedSettings setBracketedImageCount:](v3, "setBracketedImageCount:", self->_bracketImageCount);
  -[FigCaptureIrisPreparedSettings setQualityPrioritization:](v3, "setQualityPrioritization:", self->_qualityPrioritization);
  -[FigCaptureIrisPreparedSettings setHDRMode:](v3, "setHDRMode:", self->_HDRMode);
  return v3;
}

- (int)payloadType
{
  return self->_payloadType;
}

- (int)settingsProvider
{
  return self->_settingsProvider;
}

- (unsigned)outputFormat
{
  return self->_outputFormat;
}

- (unsigned)rawOutputFileBitDepth
{
  return self->_rawOutputFileBitDepth;
}

- (void)setRawOutputFileBitDepth:(unsigned int)a3
{
  self->_rawOutputFileBitDepth = a3;
}

- (unsigned)rawOutputFileCodec
{
  return self->_rawOutputFileCodec;
}

- (void)setRawOutputFileCodec:(unsigned int)a3
{
  self->_rawOutputFileCodec = a3;
}

- (float)rawOutputFileCodecQuality
{
  return self->_rawOutputFileCodecQuality;
}

- (void)setRawOutputFileCodecQuality:(float)a3
{
  self->_rawOutputFileCodecQuality = a3;
}

- (int)rawOutputFileType
{
  return self->_rawOutputFileType;
}

- (BOOL)squareCropEnabled
{
  return self->_squareCropEnabled;
}

- (unsigned)previewFormat
{
  return self->_previewFormat;
}

- (unsigned)previewWidth
{
  return self->_previewWidth;
}

- (unsigned)previewHeight
{
  return self->_previewHeight;
}

- (BOOL)previewMirroring
{
  return self->_previewMirroring;
}

- (int)previewOrientation
{
  return self->_previewOrientation;
}

- (unsigned)thumbnailFormat
{
  return self->_thumbnailFormat;
}

- (unsigned)thumbnailWidth
{
  return self->_thumbnailWidth;
}

- (unsigned)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (unsigned)rawThumbnailFormat
{
  return self->_rawThumbnailFormat;
}

- (void)setRawThumbnailFormat:(unsigned int)a3
{
  self->_rawThumbnailFormat = a3;
}

- (unsigned)rawThumbnailWidth
{
  return self->_rawThumbnailWidth;
}

- (void)setRawThumbnailWidth:(unsigned int)a3
{
  self->_rawThumbnailWidth = a3;
}

- (unsigned)rawThumbnailHeight
{
  return self->_rawThumbnailHeight;
}

- (void)setRawThumbnailHeight:(unsigned int)a3
{
  self->_rawThumbnailHeight = a3;
}

- (BOOL)noiseReductionEnabled
{
  return self->_noiseReductionEnabled;
}

- (BOOL)burstQualityCaptureEnabled
{
  return self->_burstQualityCaptureEnabled;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)isZoomWithoutUpscalingEnabled
{
  return self->_zoomWithoutUpscalingEnabled;
}

- (unsigned)shutterSound
{
  return self->_shutterSound;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (BOOL)autoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (BOOL)constantColorEnabled
{
  return self->_constantColorEnabled;
}

- (BOOL)constantColorFallbackPhotoDeliveryEnabled
{
  return self->_constantColorFallbackPhotoDeliveryEnabled;
}

- (BOOL)autoStereoPhotoCaptureEnabled
{
  return self->_autoStereoPhotoCaptureEnabled;
}

- (void)setAutoStereoPhotoCaptureEnabled:(BOOL)a3
{
  self->_autoStereoPhotoCaptureEnabled = a3;
}

- (int)wideColorMode
{
  return self->_wideColorMode;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (BOOL)embedsDepthDataInImage
{
  return self->_embedsDepthDataInImage;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (BOOL)cameraCalibrationDataDeliveryEnabled
{
  return self->_cameraCalibrationDataDeliveryEnabled;
}

- (BOOL)embedsPortraitEffectsMatteInImage
{
  return self->_embedsPortraitEffectsMatteInImage;
}

- (BOOL)embedsSemanticSegmentationMattesInImage
{
  return self->_embedsSemanticSegmentationMattesInImage;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)metadataForOriginalImage
{
  return self->_metadataForOriginalImage;
}

- (NSArray)originalImageFilters
{
  return self->_originalImageFilters;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->_portraitLightingEffectStrength = a3;
}

- (NSArray)bravoConstituentImageDeliveryDeviceTypes
{
  return self->_bravoConstituentImageDeliveryDeviceTypes;
}

- (NSDictionary)spatialOverCaptureMetadata
{
  return self->_spatialOverCaptureMetadata;
}

- (void)setSpatialOverCaptureMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (int)clientQualityPrioritization
{
  return self->_clientQualityPrioritization;
}

- (int)bravoImageFusionMode
{
  return self->_bravoImageFusionMode;
}

- (void)setBravoImageFusionMode:(int)a3
{
  self->_bravoImageFusionMode = a3;
}

- (BOOL)autoIntelligentDistortionCorrectionEnabled
{
  return self->_autoIntelligentDistortionCorrectionEnabled;
}

- (NSDictionary)vtCompressionProperties
{
  return self->_vtCompressionProperties;
}

- (int)bracketType
{
  return self->_bracketType;
}

- (unsigned)bracketImageCount
{
  return self->_bracketImageCount;
}

- (BOOL)lensStabilizationDuringBracketEnabled
{
  return self->_lensStabilizationDuringBracketEnabled;
}

- (void)setLensStabilizationDuringBracketEnabled:(BOOL)a3
{
  self->_lensStabilizationDuringBracketEnabled = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDurations
{
  return self->_exposureDurations;
}

- (float)ISOs
{
  return self->_ISOs;
}

- (float)exposureTargetBiases
{
  return self->_exposureTargetBiases;
}

- (unint64_t)stillImageUserInitiatedRequestTime
{
  return self->_stillImageUserInitiatedRequestTime;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageUserInitiatedRequestPTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (int64_t)stillImageRequestTime
{
  return self->_stillImageRequestTime;
}

- (void)setStillImageRequestTime:(int64_t)a3
{
  self->_stillImageRequestTime = a3;
}

- (int64_t)stillImageCaptureStartTime
{
  return self->_stillImageCaptureStartTime;
}

- (void)setStillImageCaptureStartTime:(int64_t)a3
{
  self->_stillImageCaptureStartTime = a3;
}

- (double)stillImageCaptureAbsoluteStartTime
{
  return self->_stillImageCaptureAbsoluteStartTime;
}

- (void)setStillImageCaptureAbsoluteStartTime:(double)a3
{
  self->_stillImageCaptureAbsoluteStartTime = a3;
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (void)setSmartStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (BOOL)smartStyleReversibilitySupported
{
  return self->_smartStyleReversibilitySupported;
}

- (void)setSmartStyleReversibilitySupported:(BOOL)a3
{
  self->_smartStyleReversibilitySupported = a3;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (BOOL)isClientInitiatedPrepareSettings
{
  return self->_clientInitiatedPrepareSettings;
}

- (void)setClientInitiatedPrepareSettings:(BOOL)a3
{
  self->_clientInitiatedPrepareSettings = a3;
}

- (BOOL)isUserInitiatedRequestSettings
{
  return self->_userInitiatedRequestSettings;
}

- (void)setUserInitiatedRequestSettings:(BOOL)a3
{
  self->_userInitiatedRequestSettings = a3;
}

- (BOOL)isBeginMomentCaptureSettings
{
  return self->_beginMomentCaptureSettings;
}

- (void)setBeginMomentCaptureSettings:(BOOL)a3
{
  self->_beginMomentCaptureSettings = a3;
}

- (float)videoStabilizationOverscanCropMultiplier
{
  return self->_videoStabilizationOverscanCropMultiplier;
}

- (void)setVideoStabilizationOverscanCropMultiplier:(float)a3
{
  self->_videoStabilizationOverscanCropMultiplier = a3;
}

- (BOOL)bypassUpscaling
{
  return self->_bypassUpscaling;
}

- (void)setBypassUpscaling:(BOOL)a3
{
  self->_bypassUpscaling = a3;
}

- (NSString)cmioCompressedFormat
{
  return self->_cmioCompressedFormat;
}

- (void)setCmioCompressedFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (BOOL)cmioHighResolutionPhotoEnabled
{
  return self->_cmioHighResolutionPhotoEnabled;
}

- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_cmioHighResolutionPhotoEnabled = a3;
}

- (int)cmioMaxPhotoDimensionsWidth
{
  return self->_cmioMaxPhotoDimensionsWidth;
}

- (void)setCmioMaxPhotoDimensionsWidth:(int)a3
{
  self->_cmioMaxPhotoDimensionsWidth = a3;
}

- (int)cmioMaxPhotoDimensionsHeight
{
  return self->_cmioMaxPhotoDimensionsHeight;
}

- (void)setCmioMaxPhotoDimensionsHeight:(int)a3
{
  self->_cmioMaxPhotoDimensionsHeight = a3;
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_deviceOrientationCorrectionEnabled;
}

- (NSDictionary)spatialOverCaptureMetadataForOriginalImage
{
  return self->_spatialOverCaptureMetadataForOriginalImage;
}

- (void)setSpatialOverCaptureMetadataForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)autoDeferredProcessingEnabled
{
  return self->_autoDeferredProcessingEnabled;
}

- (void)setImageGroupIdentifier:(id)a3
{
  self->_imageGroupIdentifier = (NSString *)a3;
}

@end
