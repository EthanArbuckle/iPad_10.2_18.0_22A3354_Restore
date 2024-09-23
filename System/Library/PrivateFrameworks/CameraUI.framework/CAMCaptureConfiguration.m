@implementation CAMCaptureConfiguration

- (int64_t)device
{
  return self->_device;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (int64_t)HDRMode
{
  return self->_HDRMode;
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

- (int64_t)photoModeEffectFilterType
{
  return self->_photoModeEffectFilterType;
}

- (int64_t)squareModeEffectFilterType
{
  return self->_squareModeEffectFilterType;
}

- (int64_t)portraitModeEffectFilterType
{
  return self->_portraitModeEffectFilterType;
}

- (int64_t)portraitModeLightingEffectType
{
  return self->_portraitModeLightingEffectType;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (BOOL)isPhotoBooth
{
  return self->_photoBooth;
}

- (id)_previewFilters
{
  int64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;

  if (-[CAMCaptureConfiguration isPhotoBooth](self, "isPhotoBooth"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v6 = -[CAMCaptureConfiguration mode](self, "mode");
    v4 = 0;
    v3 = 0;
    v5 = 0;
    switch(v6)
    {
      case 0:
        v7 = -[CAMCaptureConfiguration photoModeEffectFilterType](self, "photoModeEffectFilterType");
        goto LABEL_6;
      case 1:
      case 2:
      case 3:
      case 5:
        return +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", v5, v3, v4);
      case 4:
        v7 = -[CAMCaptureConfiguration squareModeEffectFilterType](self, "squareModeEffectFilterType");
LABEL_6:
        v5 = v7;
        v3 = 0;
        v4 = 0;
        return +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", v5, v3, v4);
      case 6:
        v5 = -[CAMCaptureConfiguration portraitModeEffectFilterType](self, "portraitModeEffectFilterType");
        v3 = -[CAMCaptureConfiguration portraitModeLightingEffectType](self, "portraitModeLightingEffectType");
        goto LABEL_9;
      case 7:
        v3 = 0;
        v5 = 0;
LABEL_9:
        v4 = 1;
        break;
      default:
        v5 = 0;
        break;
    }
  }
  return +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", v5, v3, v4);
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (CAMCaptureConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 audioConfiguration:(unint64_t)a6 mixAudioWithOthers:(BOOL)a7 flashMode:(int64_t)a8 torchMode:(int64_t)a9 HDRMode:(int64_t)a10 irisMode:(int64_t)a11 timerDuration:(int64_t)a12 photoModeAspectRatioCrop:(int64_t)a13 photoModeEffectFilterType:(int64_t)a14 squareModeEffectFilterType:(int64_t)a15 portraitModeEffectFilterType:(int64_t)a16 portraitModeLightingEffectType:(int64_t)a17 portraitModeApertureValue:(double)a18 portraitModeIntensityValue:(double)a19 mirrorFrontCameraCaptures:(BOOL)a20 exposureBiasesByMode:(id)a21 macroMode:(int64_t)a22 photoResolution:(int64_t)a23 rawMode:(int64_t)a24 proResVideoMode:(int64_t)a25 semanticStyles:(id)a26 selectedSemanticStyleIndex:(unint64_t)a27 smartStyleSystemStyleIndex:(unint64_t)a28 videoStabilizationMode:(int64_t)a29 zoomPIPEnabled:(BOOL)a30 spatialVideoEnabled:(BOOL)a31 optionalDepthEffectEnabled:(BOOL)a32 sharedLibraryMode:(int64_t)a33
{
  id v42;
  id v43;
  CAMCaptureConfiguration *v44;
  uint64_t v45;
  NSDictionary *exposureBiasesByMode;
  CAMCaptureConfiguration *v47;
  objc_super v49;

  v42 = a21;
  v43 = a26;
  v49.receiver = self;
  v49.super_class = (Class)CAMCaptureConfiguration;
  v44 = -[CAMCaptureConfiguration init](&v49, sel_init);
  if (v44)
  {
    v44->_mode = a3;
    v44->_device = a4;
    v44->_videoConfiguration = a5;
    v44->_audioConfiguration = a6;
    v44->_mixAudioWithOthers = a7;
    v44->_flashMode = a8;
    v44->_torchMode = a9;
    v44->_HDRMode = a10;
    v44->_timerDuration = a12;
    v44->_irisMode = a11;
    v44->_photoModeAspectRatioCrop = a13;
    v44->_photoModeEffectFilterType = a14;
    v44->_squareModeEffectFilterType = a15;
    v44->_portraitModeEffectFilterType = a16;
    v44->_portraitModeLightingEffectType = a17;
    v44->_photoBooth = 0;
    v44->_portraitModeApertureValue = a18;
    v44->_portraitModeIntensityValue = a19;
    v44->_mirrorFrontCameraCaptures = a20;
    v45 = objc_msgSend(v42, "copy");
    exposureBiasesByMode = v44->_exposureBiasesByMode;
    v44->_exposureBiasesByMode = (NSDictionary *)v45;

    v44->_macroMode = a22;
    v44->_photoResolution = a23;
    v44->_rawMode = a24;
    v44->_proResVideoMode = a25;
    objc_storeStrong((id *)&v44->_semanticStyles, a26);
    v44->_selectedSemanticStyleIndex = a27;
    v44->_smartStyleSystemStyleIndex = a28;
    v44->_zoomPIPEnabled = a30;
    v44->_videoStabilizationMode = a29;
    v44->_sharedLibraryMode = a33;
    v44->_spatialVideoEnabled = a31;
    v44->_optionalDepthEffectEnabled = a32;
    v47 = v44;
  }

  return v44;
}

- (CAMCaptureConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  CAMCaptureConfiguration *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSDictionary *exposureBiasesByMode;
  uint64_t v11;
  NSArray *semanticStyles;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureConfiguration;
  v5 = -[CAMCaptureConfiguration init](&v14, sel_init);
  if (v5)
  {
    v5->_mode = objc_msgSend(v4, "mode");
    v5->_device = objc_msgSend(v4, "device");
    v5->_videoConfiguration = objc_msgSend(v4, "videoConfiguration");
    v5->_audioConfiguration = objc_msgSend(v4, "audioConfiguration");
    v5->_mixAudioWithOthers = objc_msgSend(v4, "mixAudioWithOthers");
    v5->_flashMode = objc_msgSend(v4, "flashMode");
    v5->_torchMode = objc_msgSend(v4, "torchMode");
    v5->_HDRMode = objc_msgSend(v4, "HDRMode");
    v5->_irisMode = objc_msgSend(v4, "irisMode");
    v5->_timerDuration = objc_msgSend(v4, "timerDuration");
    v5->_photoModeAspectRatioCrop = objc_msgSend(v4, "photoModeAspectRatioCrop");
    v5->_photoModeEffectFilterType = objc_msgSend(v4, "photoModeEffectFilterType");
    v5->_squareModeEffectFilterType = objc_msgSend(v4, "squareModeEffectFilterType");
    v5->_portraitModeEffectFilterType = objc_msgSend(v4, "portraitModeEffectFilterType");
    v5->_portraitModeLightingEffectType = objc_msgSend(v4, "portraitModeLightingEffectType");
    v5->_photoBooth = objc_msgSend(v4, "isPhotoBooth");
    objc_msgSend(v4, "portraitModeApertureValue");
    v5->_portraitModeApertureValue = v6;
    objc_msgSend(v4, "portraitModeIntensityValue");
    v5->_portraitModeIntensityValue = v7;
    v5->_mirrorFrontCameraCaptures = objc_msgSend(v4, "mirrorFrontCameraCaptures");
    objc_msgSend(v4, "exposureBiasesByMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    exposureBiasesByMode = v5->_exposureBiasesByMode;
    v5->_exposureBiasesByMode = (NSDictionary *)v9;

    v5->_macroMode = objc_msgSend(v4, "macroMode");
    v5->_photoResolution = objc_msgSend(v4, "photoResolution");
    v5->_rawMode = objc_msgSend(v4, "rawMode");
    v5->_proResVideoMode = objc_msgSend(v4, "proResVideoMode");
    objc_msgSend(v4, "semanticStyles");
    v11 = objc_claimAutoreleasedReturnValue();
    semanticStyles = v5->_semanticStyles;
    v5->_semanticStyles = (NSArray *)v11;

    v5->_selectedSemanticStyleIndex = objc_msgSend(v4, "selectedSemanticStyleIndex");
    v5->_smartStyleSystemStyleIndex = objc_msgSend(v4, "smartStyleSystemStyleIndex");
    v5->_videoStabilizationMode = objc_msgSend(v4, "videoStabilizationMode");
    v5->_zoomPIPEnabled = objc_msgSend(v4, "zoomPIPEnabled");
    v5->_sharedLibraryMode = objc_msgSend(v4, "sharedLibraryMode");
    v5->_spatialVideoEnabled = objc_msgSend(v4, "spatialVideoEnabled");
    v5->_optionalDepthEffectEnabled = objc_msgSend(v4, "optionalDepthEffectEnabled");
  }

  return v5;
}

- (id)initForPhotoBoothWithCaptureDevice:(int64_t)a3
{
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMCaptureConfiguration;
  v4 = -[CAMCaptureConfiguration init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 3) = a3;
    v4[8] = 0;
    *((_OWORD *)v4 + 2) = 0u;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 5) = 0u;
    *((_OWORD *)v4 + 6) = 0u;
    *((_OWORD *)v4 + 7) = xmmword_1DB9A7CE0;
    v4[10] = 1;
    *(_OWORD *)(v4 + 136) = 0u;
    *(_OWORD *)(v4 + 152) = 0u;
    *(_OWORD *)(v4 + 168) = 0u;
    v6 = (void *)*((_QWORD *)v4 + 23);
    *((_QWORD *)v4 + 23) = 0;

    *((int64x2_t *)v5 + 12) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((_QWORD *)v5 + 26) = 0;
    *(_WORD *)(v5 + 11) = 0;
    v5[13] = 0;
    v7 = v5;
  }

  return v5;
}

+ (id)captureGraphConfigurationUsingConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  CAMCaptureGraphConfiguration *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  void *v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char v50;
  void *v51;
  void *v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "mode");
  v58 = objc_msgSend(v5, "device");
  if ((unint64_t)(v58 - 8) < 3 || v58 == 11 || v58 == 1)
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v8 = 0;
    v7 = 1;
  }
  v55 = objc_msgSend(v5, "isPhotoBooth");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "zoomPIPEnabled"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v9, "isZoomPIPSupportedForMode:devicePosition:", v6, v8);

  }
  else
  {
    v50 = 0;
  }
  if (objc_msgSend(v60, "isCustomLensSupportedForMode:device:isTrueVideo:", v6, v58, 0))
  {
    objc_msgSend(v59, "customLensGroup");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
  }
  objc_msgSend(v5, "_previewFilters");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "videoConfiguration");
  v49 = objc_msgSend(v5, "audioConfiguration");
  if ((v55 & 1) != 0)
  {
    v48 = 0;
  }
  else
  {
    objc_msgSend(v59, "videoThumbnailOutputConfigurationForMode:devicePosition:", v6, v8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v60, "isSpatialVideoInVideoModeSupportedForMode:devicePosition:", v6, v8))
    v11 = objc_msgSend(v5, "spatialVideoEnabled");
  else
    v11 = 0;
  v47 = objc_msgSend(v59, "photoEncodingBehavior");
  v57 = objc_msgSend(v59, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", v10, v6, objc_msgSend(v5, "proResVideoMode"), v4, v11);
  v46 = objc_msgSend(v60, "shouldSuspendVideoHDRForHDRMode:captureMode:", objc_msgSend(v5, "HDRMode"), v6);
  if (v6)
  {
    v45 = 0;
    if ((v7 & 1) != 0)
    {
LABEL_19:
      v44 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v45 = objc_msgSend(v5, "photoModeAspectRatioCrop");
    if ((v7 & 1) != 0)
      goto LABEL_19;
  }
  v44 = objc_msgSend(v5, "mirrorFrontCameraCaptures");
LABEL_22:
  v43 = objc_msgSend(v59, "isAutoFPSVideoEnabledForMode:device:videoConfiguration:encodingBehavior:outputToExternalStorage:spatialVideoEnabled:", v6, v58, v10, v57, v4, v11);
  v42 = objc_msgSend(v60, "maxSupportedPhotoQualityPrioritizationForMode:devicePosition:", v6, v8);
  v54 = v11;
  if (objc_msgSend(v59, "rawControlEnabled"))
    v53 = objc_msgSend(v60, "isLinearDNGSupportedForMode:", v6);
  else
    v53 = 0;
  v12 = objc_msgSend(v60, "semanticStyleSupportForMode:devicePosition:", v6, v8);
  objc_msgSend(v5, "semanticStyles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "captureStyleForPreviewWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:", v12, v13, objc_msgSend(v5, "selectedSemanticStyleIndex"), objc_msgSend(v5, "smartStyleSystemStyleIndex"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v59, "shouldUseContentAwareDistortionCorrection"))
    v40 = objc_msgSend(v60, "isContentAwareDistortionCorrectionSupportedForMode:", v6);
  else
    v40 = 0;
  if (objc_msgSend(v59, "responsiveShutterEnabled"))
    v39 = objc_msgSend(v60, "isResponsiveShutterSupportedForMode:", v6);
  else
    v39 = 0;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v60, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", v6, v58, v10, v57, 0, objc_msgSend(v14, "prefersHDR10BitVideoForCapabilities:", v60));

  if (v15)
    v16 = objc_msgSend(v5, "videoStabilizationMode");
  else
    v16 = 0;
  v17 = objc_msgSend(v59, "videoStabilizationStrengthForVideoStabilizationMode:captureMode:spatialVideoEnabled:", v16, v6, v54);
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v26) = objc_msgSend(v18, "prefersHDR10BitVideoForCapabilities:", v60);
  LOWORD(v26) = v54;
  v19 = objc_msgSend(v60, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", v17, v6, v58, v10, v57, v4, v26);

  v38 = objc_msgSend(v59, "maximumPhotoResolutionForMode:device:", v6, v58);
  v20 = 0;
  if (v53)
    v20 = objc_msgSend(v5, "rawMode") == 1;
  v34 = v20;
  if (v19)
    v21 = v17;
  else
    v21 = 0;
  v36 = v21;
  v37 = v55;
  v22 = 1;
  if (v55)
    v22 = 2;
  v56 = v22;
  v33 = objc_msgSend(v59, "colorSpaceForMode:videoConfiguration:videoEncodingBehavior:spatialVideoEnabled:device:", v6, v10, v57, v54, v58);
  v23 = objc_msgSend(v59, "shouldUseDepthSuggestionInPhotoMode");
  v35 = objc_msgSend(v59, "windRemovalEnabledForAudioConfiguration:", v49);
  BYTE2(v32) = objc_msgSend(v59, "prefersHDR10BitVideoForCapabilities:", v60);
  LOWORD(v32) = v54;
  BYTE1(v31) = v50;
  LOBYTE(v31) = v23;
  BYTE2(v30) = v34;
  BYTE1(v30) = v39;
  LOBYTE(v30) = v40;
  BYTE1(v29) = v53;
  LOBYTE(v29) = v44;
  BYTE1(v28) = v46;
  LOBYTE(v28) = v43;
  LOBYTE(v27) = v35;
  v24 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:]([CAMCaptureGraphConfiguration alloc], "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v6, v58, objc_msgSend(v5, "macroMode"), v10, v49, objc_msgSend(v5, "mixAudioWithOthers"), v27, v56, v37, v51, v48,
          v47,
          v57,
          v28,
          v45,
          v42,
          v29,
          v12,
          v41,
          v30,
          v36,
          v38,
          v33,
          v31,
          v52,
          v32);

  return v24;
}

+ (int64_t)sanitizeVideoConfigurationForDesiredConfiguration:(int64_t)a3 mode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  void *v13;

  v7 = a7;
  v8 = a6;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    if ((objc_msgSend(v13, "isSupportedVideoConfiguration:forMode:device:spatialVideoEnabled:trueVideoEnabled:", a3, a4, a5, v8, v7) & 1) != 0)break;
    a3 = objc_msgSend(a1, "_fallbackVideoConfigurationForUnsupportedConfiguration:spatialVideoEnabled:", a3, v8);
  }
  while (a3);

  return a3;
}

+ (int64_t)_fallbackVideoConfigurationForUnsupportedConfiguration:(int64_t)a3 spatialVideoEnabled:(BOOL)a4
{
  int64_t v4;
  uint64_t v5;

  if (a3 > 12)
  {
    v4 = 9;
    v5 = 12;
    if (a3 != 14)
      v5 = 0;
    if (a3 != 13)
      v4 = v5;
  }
  else
  {
    v4 = a3 == 4 || a3 == 9;
  }
  if (a4)
    return 7;
  else
    return v4;
}

+ (id)tinyConfigurationForConfiguration:(id)a3 preserveFilters:(BOOL)a4
{
  id v5;
  CAMCaptureConfiguration *v6;

  v5 = a3;
  v6 = -[CAMCaptureConfiguration initWithConfiguration:]([CAMCaptureConfiguration alloc], "initWithConfiguration:", v5);

  v6->_mode = 0;
  if (!a4)
  {
    v6->_photoModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:](CAMUserPreferences, "defaultFilterTypeForMode:", 0);
    v6->_squareModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:](CAMUserPreferences, "defaultFilterTypeForMode:", 4);
    v6->_portraitModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:](CAMUserPreferences, "defaultFilterTypeForMode:", 6);
    v6->_portraitModeLightingEffectType = +[CAMUserPreferences defaultLightingTypeForMode:](CAMUserPreferences, "defaultLightingTypeForMode:", 6);
  }
  return v6;
}

+ (id)configuration:(id)a3 withDevice:(int64_t)a4
{
  id v5;
  CAMCaptureConfiguration *v6;

  v5 = a3;
  v6 = -[CAMCaptureConfiguration initWithConfiguration:]([CAMCaptureConfiguration alloc], "initWithConfiguration:", v5);

  v6->_device = a4;
  return v6;
}

- (BOOL)mixAudioWithOthers
{
  return self->_mixAudioWithOthers;
}

- (int64_t)photoModeAspectRatioCrop
{
  return self->_photoModeAspectRatioCrop;
}

- (NSDictionary)exposureBiasesByMode
{
  return self->_exposureBiasesByMode;
}

- (double)portraitModeApertureValue
{
  return self->_portraitModeApertureValue;
}

- (double)portraitModeIntensityValue
{
  return self->_portraitModeIntensityValue;
}

- (BOOL)mirrorFrontCameraCaptures
{
  return self->_mirrorFrontCameraCaptures;
}

- (void)setMirrorFrontCameraCaptures:(BOOL)a3
{
  self->_mirrorFrontCameraCaptures = a3;
}

- (int64_t)macroMode
{
  return self->_macroMode;
}

- (int64_t)photoResolution
{
  return self->_photoResolution;
}

- (int64_t)rawMode
{
  return self->_rawMode;
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

- (NSArray)semanticStyles
{
  return self->_semanticStyles;
}

- (void)setSemanticStyles:(id)a3
{
  objc_storeStrong((id *)&self->_semanticStyles, a3);
}

- (unint64_t)selectedSemanticStyleIndex
{
  return self->_selectedSemanticStyleIndex;
}

- (void)setSelectedSemanticStyleIndex:(unint64_t)a3
{
  self->_selectedSemanticStyleIndex = a3;
}

- (unint64_t)smartStyleSystemStyleIndex
{
  return self->_smartStyleSystemStyleIndex;
}

- (void)setSmartStyleSystemStyleIndex:(unint64_t)a3
{
  self->_smartStyleSystemStyleIndex = a3;
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

- (BOOL)zoomPIPEnabled
{
  return self->_zoomPIPEnabled;
}

- (BOOL)spatialVideoEnabled
{
  return self->_spatialVideoEnabled;
}

- (BOOL)optionalDepthEffectEnabled
{
  return self->_optionalDepthEffectEnabled;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  self->_sharedLibraryMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyles, 0);
  objc_storeStrong((id *)&self->_exposureBiasesByMode, 0);
}

@end
