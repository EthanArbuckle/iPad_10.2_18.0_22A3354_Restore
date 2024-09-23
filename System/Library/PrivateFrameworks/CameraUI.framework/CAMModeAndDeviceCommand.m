@implementation CAMModeAndDeviceCommand

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMModeAndDeviceCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[CAMModeAndDeviceCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[4];
  v4[4] = v5;

  -[CAMModeAndDeviceCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[5];
  v4[5] = v7;

  -[CAMModeAndDeviceCommand _minimumExecutionTime](self, "_minimumExecutionTime");
  v4[6] = v9;
  *((_DWORD *)v4 + 7) = -[CAMModeAndDeviceCommand _requestID](self, "_requestID");
  return v4;
}

- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration
{
  return self->__desiredGraphConfiguration;
}

- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration
{
  return self->__resolvedGraphConfiguration;
}

- (double)_minimumExecutionTime
{
  return self->__minimumExecutionTime;
}

- (int)_requestID
{
  return self->__requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configurationError, 0);
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, 0);
  objc_storeStrong((id *)&self->__desiredGraphConfiguration, 0);
}

- (BOOL)requiresSessionModification
{
  return 1;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  CAMResetVideoMinFrameDurationOverrideCommand *v37;
  CAMAutoFPSVideoCommand *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CAMGraphConfigurationInspectionCommand *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMModeAndDeviceCommand _sanitizeDeviceUsingContext:](self, "_sanitizeDeviceUsingContext:", v4);
  -[CAMModeAndDeviceCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mode");
  v7 = objc_msgSend(v5, "device");
  v8 = objc_msgSend(v5, "videoConfiguration");
  objc_msgSend(v4, "currentCaptureSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  objc_msgSend(v4, "videoDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v6, v7, v8, objc_msgSend(v5, "videoStabilizationStrength"), objc_msgSend(v5, "enableStereoVideoCapture"), &v50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 != v7)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMModeAndDeviceCommand executeWithContext:].cold.4(&v50, v7, v11);

  }
  objc_msgSend(v10, "captureDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoDeviceFormatForGraphConfiguration:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoDevicePresetForGraphConfiguration:", v5);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && v13)
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CAMModeAndDeviceCommand executeWithContext:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    if (v12 | v13)
      goto LABEL_13;
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CAMModeAndDeviceCommand executeWithContext:].cold.3(v15, v23, v24, v25, v26, v27, v28, v29);
  }

LABEL_13:
  -[CAMModeAndDeviceCommand _desiredInputsWithContext:captureEngineDevice:](self, "_desiredInputsWithContext:captureEngineDevice:", v4, v10);
  v30 = objc_claimAutoreleasedReturnValue();
  -[CAMModeAndDeviceCommand _existingInputsWithContext:without:](self, "_existingInputsWithContext:without:", v4, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v31;
  if (objc_msgSend(v31, "count"))
  {
    v32 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
      v33 = v30;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v34;
      _os_log_impl(&dword_1DB760000, v32, OS_LOG_TYPE_DEFAULT, "Removing inputs: %{public}@", buf, 0xCu);

      v30 = v33;
      v31 = v48;
    }

  }
  objc_msgSend(v9, "cam_removeInputs:", v31);
  if (v12 || !v14)
  {
    v35 = (id)*MEMORY[0x1E0C8A188];

    v14 = v35;
  }
  if (objc_msgSend(v49, "supportsAVCaptureSessionPreset:", v14)
    && objc_msgSend(v9, "canSetSessionPreset:", v14))
  {
    objc_msgSend(v9, "setSessionPreset:", v14);
  }
  else
  {
    v36 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[CAMModeAndDeviceCommand executeWithContext:].cold.1((uint64_t)v14, (uint64_t)v49, v36);

  }
  v45 = (void *)v30;
  objc_msgSend(v9, "cam_ensureInputs:", v30);
  if (v12)
    objc_msgSend(v49, "setActiveFormat:", v12);
  v46 = v14;
  v47 = v10;
  v37 = objc_alloc_init(CAMResetVideoMinFrameDurationOverrideCommand);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v37);
  if (v12)
  {
    if (objc_msgSend(v49, "isAutoVideoFrameRateEnabled"))
    {
      v38 = -[CAMAutoFPSVideoCommand initWithAutoFPSVideoEnabled:]([CAMAutoFPSVideoCommand alloc], "initWithAutoFPSVideoEnabled:", 0);
      -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v38);

    }
    -[CAMModeAndDeviceCommand _specificFramerateCommandForGraphConfiguration:withContext:](self, "_specificFramerateCommandForGraphConfiguration:withContext:", v5, v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v39);

  }
  objc_msgSend(v4, "outputsForGraphConfiguration:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeAndDeviceCommand _existingOutputsWithContext:without:](self, "_existingOutputsWithContext:without:", v4, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cam_ensureOutputs:whileRemoving:", v40, v41);
  objc_msgSend(v4, "controlsForGraphConfiguration:recording:", v5, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cam_ensureControls:", v42);
  -[CAMModeAndDeviceCommand _performPostConfigurationSetupForGraphConfiguration:withContext:](self, "_performPostConfigurationSetupForGraphConfiguration:withContext:", v5, v4);
  v43 = v9;
  v44 = -[CAMGraphConfigurationInspectionCommand initWithKnownGraphConfiguration:]([CAMGraphConfigurationInspectionCommand alloc], "initWithKnownGraphConfiguration:", v5);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v44);
  -[CAMModeAndDeviceCommand _performPostConfigurationSanityCheckForGraphConfiguration:withContext:](self, "_performPostConfigurationSanityCheckForGraphConfiguration:withContext:", v5, v4);

}

- (void)_sanitizeDeviceUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  int v16;
  _BOOL4 v17;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  void *v27;
  char v28;
  char v29;
  CAMCaptureGraphConfiguration *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  CAMCaptureGraphConfiguration *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CAMModeAndDeviceCommand *v61;
  void *v62;
  void *v63;
  uint64_t v64;

  v4 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeAndDeviceCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mode");
  v8 = objc_msgSend(v6, "device");
  v9 = objc_msgSend(v6, "videoConfiguration");
  v10 = objc_msgSend(v5, "sanitizeDesiredDevice:forMode:", v8, v7);
  v11 = objc_msgSend(v6, "videoEncodingBehavior");
  v12 = v7;
  v13 = +[CAMCaptureConfiguration sanitizeVideoConfigurationForDesiredConfiguration:mode:device:spatialVideoEnabled:trueVideoEnabled:](CAMCaptureConfiguration, "sanitizeVideoConfigurationForDesiredConfiguration:mode:device:spatialVideoEnabled:trueVideoEnabled:", v9, v7, v10, objc_msgSend(v6, "enableStereoVideoCapture"), objc_msgSend(v6, "trueVideoEnabled"));
  v64 = v10;
  objc_msgSend(v4, "videoDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v7, v10, v13, objc_msgSend(v6, "videoStabilizationStrength"), objc_msgSend(v6, "enableStereoVideoCapture"), &v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v64;
  v15 = v7 == 2;
  v16 = objc_msgSend(v6, "enableStereoVideoCapture");
  if (v13)
  {
    v15 = 0;
    v17 = 0;
  }
  else
  {
    v17 = v16;
  }
  if (objc_msgSend(v5, "isSpatialModeSupported"))
    v17 = v12 == 8 && v13 == 0;
  v61 = self;
  v62 = v5;
  v58 = v12;
  v59 = v14;
  if (v15 || v17)
  {
    v19 = -[CAMModeAndDeviceCommand _outputToExternalStorage](self, "_outputToExternalStorage");
    v20 = objc_msgSend(v6, "enableStereoVideoCapture");
    LOBYTE(v31) = objc_msgSend(v6, "prefersHDR10BitVideo");
    v60 = objc_msgSend(v5, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", v12, v14, v11, v13, v19, v20, v31);
  }
  else
  {
    v60 = v13;
  }
  v57 = [CAMCaptureGraphConfiguration alloc];
  v56 = objc_msgSend(v6, "macroMode");
  v55 = objc_msgSend(v6, "audioConfiguration");
  v54 = objc_msgSend(v6, "mixAudioWithOthers");
  v53 = objc_msgSend(v6, "windNoiseRemovalEnabled");
  v52 = objc_msgSend(v6, "previewConfiguration");
  v51 = objc_msgSend(v6, "previewSampleBufferVideoFormat");
  objc_msgSend(v6, "previewFilters");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoThumbnailOutputConfiguration");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v6, "photoEncodingBehavior");
  v47 = objc_msgSend(v6, "videoEncodingBehavior");
  v46 = objc_msgSend(v6, "enableAutoFPSVideo");
  v45 = objc_msgSend(v6, "isVideoHDRSuspended");
  v44 = objc_msgSend(v6, "aspectRatioCrop");
  v43 = objc_msgSend(v6, "photoQualityPrioritization");
  v42 = objc_msgSend(v6, "isCaptureMirrored");
  v40 = objc_msgSend(v6, "enableRAWCaptureIfSupported");
  v39 = objc_msgSend(v6, "semanticStyleSupport");
  objc_msgSend(v6, "previewSemanticStyle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v6, "enableContentAwareDistortionCorrection");
  v37 = objc_msgSend(v6, "enableResponsiveShutter");
  v21 = objc_msgSend(v6, "suspendLivePhotoCapture");
  v22 = objc_msgSend(v6, "videoStabilizationStrength");
  v23 = objc_msgSend(v6, "maximumPhotoResolution");
  v24 = objc_msgSend(v6, "colorSpace");
  v25 = objc_msgSend(v6, "enableDepthSuggestion");
  v26 = objc_msgSend(v6, "enableZoomPIP");
  objc_msgSend(v6, "customLensGroup");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v6, "enableStereoVideoCapture");
  v29 = objc_msgSend(v6, "trueVideoEnabled");
  BYTE2(v36) = objc_msgSend(v6, "prefersHDR10BitVideo");
  BYTE1(v36) = v29;
  LOBYTE(v36) = v28;
  BYTE1(v35) = v26;
  LOBYTE(v35) = v25;
  BYTE2(v34) = v21;
  BYTE1(v34) = v37;
  LOBYTE(v34) = v38;
  BYTE1(v33) = v40;
  LOBYTE(v33) = v42;
  BYTE1(v32) = v45;
  LOBYTE(v32) = v46;
  LOBYTE(v31) = v53;
  v30 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v57, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v58, v59, v56, v60, v55, v54, v31, v52, v51, v50, v49,
          v48,
          v47,
          v32,
          v44,
          v43,
          v33,
          v39,
          v41,
          v34,
          v22,
          v23,
          v24,
          v35,
          v27,
          v36);

  -[CAMModeAndDeviceCommand _setResolvedGraphConfiguration:](v61, "_setResolvedGraphConfiguration:", v30);
}

- (void)_setResolvedGraphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, a3);
}

- (id)_existingInputsWithContext:(id)a3 without:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "currentVideoDeviceInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAudioDeviceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "addObject:", v7);
  if (v8)
    objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "removeObjectsInArray:", v5);

  return v10;
}

- (id)_existingOutputsWithContext:(id)a3 without:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMovieFileOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPanoramaOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMetadataOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentEffectsPreviewOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentVideoThumbnailOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;
  if (v7)
    objc_msgSend(v13, "addObject:", v7);
  if (v8)
    objc_msgSend(v14, "addObject:", v8);
  if (v9)
    objc_msgSend(v14, "addObject:", v9);
  if (v10)
    objc_msgSend(v14, "addObject:", v10);
  if (v11)
    objc_msgSend(v14, "addObject:", v11);
  if (v12)
    objc_msgSend(v14, "addObject:", v12);
  objc_msgSend(v14, "removeObjectsInArray:", v5);

  return v14;
}

- (void)_performPostConfigurationSetupForGraphConfiguration:(id)a3 withContext:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CAMIrisVideoRecordingCommand *v9;
  CAMPausePairedVideoRecordingCommand *v10;
  CAMCTMVideoCaptureEnabledCommand *v11;
  CAMHighResolutionStillImageCommand *v12;
  CAMTimelapseCaptureRateCommand *v13;
  CAMAutoFPSVideoCommand *v14;
  CAMVideoHDRSuspensionCommand *v15;
  CAMSampleBufferVideoFormatOutputCommand *v16;
  uint64_t v17;
  CAMVideoThumbnailOutputConfigurationCommand *v18;
  CAMColorSpaceCommand *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CAMEnableAvailableSemanticSegmentationMatteTypesCommand *v28;
  CAMSemanticStylesEnabledCommand *v29;
  CAMSessionSmartStyleCommand *v30;
  unint64_t v31;
  char v32;
  CAMSemanticStylesPreviewStyleCommand *v33;
  void *v34;
  CAMSemanticStylesPreviewStyleCommand *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CAMNonDestructiveCropAspectRatioCommand *v41;
  CAMDemosaicedRAWEnabledCommand *v42;
  CAMResponsiveShutterEnabledCommand *v43;
  CAMMaximumPhotoResolutionCommand *v44;
  CAMFallbackPrimaryConstituentDeviceCommand *v45;
  CAMPostConfigurationSetupCommand *v46;
  CAMContentAwareDistortionCorrectionCommand *v47;
  CAMMirrorOutputVideoCommand *v48;
  CAMPhotoQualityPrioritizationConfigurationCommand *v49;
  CAMDeferredProcessingEnabledCommand *v50;
  CAMNonDestructiveCropEnabledCommand *v51;
  CAMSystemPressureMitigationCommand *v52;
  void *v53;
  void *v54;
  CAMPreviewLayerZoomPIPEnabledCommand *v55;
  CAMPreviewFiltersCommand *v56;
  void *v57;
  CAMVideoDepthDataEnabledCommand *v58;
  CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *v59;
  CAMPortraitAutoSuggestEnabledCommand *v60;
  CAMStillImageDepthDataDeliveryEnabledCommand *v61;
  CAMPreviewDepthDataDeliveryEnabledCommand *v62;
  CAMStillImagePreviewQualityFilteredRenderingEnabledCommand *v63;
  CAMStillImageFilteredRenderingEnabledCommand *v64;
  void *v65;
  CAMPreviewFilteredRenderingEnabledCommand *v66;
  CAMColorSpaceCommand *v67;
  CAMPreviewConfigurationCommand *v68;
  void *v69;
  CAMSampleBufferVideoFormatOutputCommand *v70;
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v71;
  CAMVideoRecordFaceMetadataCommand *v72;
  CAMVideoRecordOrientationCommand *v73;
  CAMTimelapseStabilizationCommand *v74;
  CAMVideoHDRSuspensionCommand *v75;
  CAMVideoHDRCommand *v76;
  CAMVideoStabilizationCommand *v77;
  CAMLowLightBoostCommand *v78;
  CAMLowLightTimelapseCommand *v79;
  CAMPanoramaRetainedBufferHintCommand *v80;
  CAMImageControlModeCommand *v81;
  CAMQuadraHighResolutionStillImageCommand *v82;
  CAMHighResolutionStillImageCommand *v83;
  CAMCTMVideoCaptureEnabledCommand *v84;
  CAMPausePairedVideoRecordingCommand *v85;
  CAMIrisVideoRecordingCommand *v86;
  uint64_t v87;
  CAMAutoFPSVideoCommand *v88;
  uint64_t v89;
  CAMSpatialOverCaptureEnabledCommand *v90;
  id v91;

  v91 = a3;
  v5 = objc_msgSend(v91, "mode");
  v6 = objc_msgSend(v91, "device");
  v7 = objc_msgSend(v91, "devicePosition");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMIrisVideoRecordingCommand initWithVideoRecordingEnabled:]([CAMIrisVideoRecordingCommand alloc], "initWithVideoRecordingEnabled:", -[CAMModeAndDeviceCommand _shouldEnableLivePhotoCaptureForMode:device:](self, "_shouldEnableLivePhotoCaptureForMode:device:", v5, v6));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v9);
  v10 = -[CAMPausePairedVideoRecordingCommand initWithRecordingPaused:]([CAMPausePairedVideoRecordingCommand alloc], "initWithRecordingPaused:", objc_msgSend(v91, "suspendLivePhotoCapture"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v10);
  v65 = v8;
  v11 = -[CAMCTMVideoCaptureEnabledCommand initWithEnabled:]([CAMCTMVideoCaptureEnabledCommand alloc], "initWithEnabled:", objc_msgSend(v8, "isCTMVideoCaptureSupportedForMode:", v5));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v11);
  v12 = -[CAMHighResolutionStillImageCommand initWithHighResolutionStillImageCaptureEnabled:]([CAMHighResolutionStillImageCommand alloc], "initWithHighResolutionStillImageCaptureEnabled:", v5 != 5);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v12);
  v89 = v6;
  v82 = -[CAMQuadraHighResolutionStillImageCommand initWithFeatureEnabled:]([CAMQuadraHighResolutionStillImageCommand alloc], "initWithFeatureEnabled:", -[CAMModeAndDeviceCommand _wantsQuadraHighResolutionForMode:device:](self, "_wantsQuadraHighResolutionForMode:device:", v5, v6));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (v5 == 5)
  {
    v13 = -[CAMTimelapseCaptureRateCommand initWithDefaultTimelapseCaptureRate]([CAMTimelapseCaptureRateCommand alloc], "initWithDefaultTimelapseCaptureRate");
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v13);

  }
  v87 = v7;
  v81 = -[CAMImageControlModeCommand initWithCaptureMode:capturing:]([CAMImageControlModeCommand alloc], "initWithCaptureMode:capturing:", v5, 0);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v80 = -[CAMPanoramaRetainedBufferHintCommand initWithPanoramaRetainedBufferHintEnabled:]([CAMPanoramaRetainedBufferHintCommand alloc], "initWithPanoramaRetainedBufferHintEnabled:", v5 == 3);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if ((objc_msgSend(v91, "enableAutoFPSVideo") & 1) == 0)
  {
    v14 = -[CAMAutoFPSVideoCommand initWithAutoFPSVideoEnabled:]([CAMAutoFPSVideoCommand alloc], "initWithAutoFPSVideoEnabled:", 0);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v14);

  }
  v79 = -[CAMLowLightTimelapseCommand initWithTimelapseLowLightCompensationEnabled:]([CAMLowLightTimelapseCommand alloc], "initWithTimelapseLowLightCompensationEnabled:", v5 == 5);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v78 = -[CAMLowLightBoostCommand initWithLowLightBoostEnabled:]([CAMLowLightBoostCommand alloc], "initWithLowLightBoostEnabled:", -[CAMModeAndDeviceCommand _wantsLowLightBoostForMode:device:](self, "_wantsLowLightBoostForMode:device:", v5, v6));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v77 = -[CAMVideoStabilizationCommand initWithAutomaticVideoStabilizationEnabled:strength:]([CAMVideoStabilizationCommand alloc], "initWithAutomaticVideoStabilizationEnabled:strength:", (v5 < 9) & (0x186u >> v5), objc_msgSend(v91, "videoStabilizationStrength"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v76 = -[CAMVideoHDRCommand initWithVideoHDREnabled:]([CAMVideoHDRCommand alloc], "initWithVideoHDREnabled:", 1);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v15 = -[CAMVideoHDRSuspensionCommand initWithVideoHDRSuspended:]([CAMVideoHDRSuspensionCommand alloc], "initWithVideoHDRSuspended:", objc_msgSend(v91, "isVideoHDRSuspended"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v15);
  v74 = -[CAMTimelapseStabilizationCommand initWithTimelapseStabilizationEnabled:]([CAMTimelapseStabilizationCommand alloc], "initWithTimelapseStabilizationEnabled:", v5 == 5);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v73 = -[CAMVideoRecordOrientationCommand initWithEnabled:]([CAMVideoRecordOrientationCommand alloc], "initWithEnabled:", v5 == 1);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v72 = -[CAMVideoRecordFaceMetadataCommand initWithEnabled:]([CAMVideoRecordFaceMetadataCommand alloc], "initWithEnabled:", v5 == 1);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v71 = -[CAMVideoLivePhotoMetadataWritingEnabledCommand initWithEnabled:]([CAMVideoLivePhotoMetadataWritingEnabledCommand alloc], "initWithEnabled:", -[CAMModeAndDeviceCommand _wantsLivePhotoMetadataInVideosForMode:device:](self, "_wantsLivePhotoMetadataInVideosForMode:device:", v5, v6));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v16 = -[CAMSampleBufferVideoFormatOutputCommand initWithSampleBufferVideoFormat:]([CAMSampleBufferVideoFormatOutputCommand alloc], "initWithSampleBufferVideoFormat:", objc_msgSend(v91, "previewSampleBufferVideoFormat"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v16);
  objc_msgSend(v91, "videoThumbnailOutputConfiguration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[CAMVideoThumbnailOutputConfigurationCommand initWithConfiguration:]([CAMVideoThumbnailOutputConfigurationCommand alloc], "initWithConfiguration:", v17);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v18);

  }
  v69 = (void *)v17;
  v68 = -[CAMPreviewConfigurationCommand initWithPreviewConfiguration:]([CAMPreviewConfigurationCommand alloc], "initWithPreviewConfiguration:", objc_msgSend(v91, "previewConfiguration"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v19 = -[CAMColorSpaceCommand initWithColorSpace:]([CAMColorSpaceCommand alloc], "initWithColorSpace:", objc_msgSend(v91, "colorSpace"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v19);
  v20 = 0;
  v85 = v10;
  v86 = v9;
  v83 = v12;
  v84 = v11;
  v75 = v15;
  v70 = v16;
  v67 = v19;
  v21 = v65;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  switch(v5)
  {
    case 0uLL:
      if (objc_msgSend(v65, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", v87))
        v20 = objc_msgSend(v91, "enableDepthSuggestion");
      else
        v20 = 0;
      v25 = objc_msgSend(v65, "previewQualityStillImageFilteringForPhotoModeSupported") & v20;
      v22 = 0;
      v27 = objc_msgSend(v65, "isLiveFilteringSupported") | v20;
      v23 = v20;
      v24 = v20;
      v26 = v20;
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 8uLL:
      break;
    case 4uLL:
      v27 = objc_msgSend(v65, "isLiveFilteringSupported");
      v20 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      break;
    case 6uLL:
      v25 = objc_msgSend(v65, "isDeferredPortraitRenderingSupported");
      v20 = 0;
      v22 = 0;
      v23 = 1;
      v24 = 1;
      v26 = 1;
      goto LABEL_13;
    case 7uLL:
      v20 = 0;
      v23 = 0;
      v25 = 0;
      v26 = 0;
      v22 = 1;
      v24 = 1;
LABEL_13:
      v27 = 1;
      break;
    case 9uLL:
      v20 = 0;
      v22 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v23 = 1;
      break;
    default:
      v21 = v65;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      break;
  }
  v66 = -[CAMPreviewFilteredRenderingEnabledCommand initWithFilteredRenderingEnabled:]([CAMPreviewFilteredRenderingEnabledCommand alloc], "initWithFilteredRenderingEnabled:", v27);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v64 = -[CAMStillImageFilteredRenderingEnabledCommand initWithFilteredRenderingEnabled:]([CAMStillImageFilteredRenderingEnabledCommand alloc], "initWithFilteredRenderingEnabled:", v26);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v63 = -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand initWithPreviewQualityFilteredRenderingEnabled:]([CAMStillImagePreviewQualityFilteredRenderingEnabledCommand alloc], "initWithPreviewQualityFilteredRenderingEnabled:", v25);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v62 = -[CAMPreviewDepthDataDeliveryEnabledCommand initWithDepthDataDeliveryEnabled:]([CAMPreviewDepthDataDeliveryEnabledCommand alloc], "initWithDepthDataDeliveryEnabled:", v24);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v61 = -[CAMStillImageDepthDataDeliveryEnabledCommand initWithDepthDataDeliveryEnabled:]([CAMStillImageDepthDataDeliveryEnabledCommand alloc], "initWithDepthDataDeliveryEnabled:", v23);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v60 = -[CAMPortraitAutoSuggestEnabledCommand initWithPortraitAutoSuggestEnabled:]([CAMPortraitAutoSuggestEnabledCommand alloc], "initWithPortraitAutoSuggestEnabled:", v20);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if ((_DWORD)v23)
  {
    v28 = objc_alloc_init(CAMEnableAvailableSemanticSegmentationMatteTypesCommand);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v28);

  }
  v59 = -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand initWithPortraitEffectsMatteDeliveryEnabled:]([CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand alloc], "initWithPortraitEffectsMatteDeliveryEnabled:", v23);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v58 = -[CAMVideoDepthDataEnabledCommand initWithEnabled:]([CAMVideoDepthDataEnabledCommand alloc], "initWithEnabled:", v22);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  objc_msgSend(v91, "previewFilters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[CAMPreviewFiltersCommand initWithFilters:captureMode:]([CAMPreviewFiltersCommand alloc], "initWithFilters:captureMode:", v57, v5);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (objc_msgSend(v21, "smartStylesSupported"))
  {
    objc_msgSend(v91, "previewSemanticStyle");
    v29 = (CAMSemanticStylesEnabledCommand *)objc_claimAutoreleasedReturnValue();
    v30 = -[CAMSessionSmartStyleCommand initWithSmartStyle:]([CAMSessionSmartStyleCommand alloc], "initWithSmartStyle:", v29);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v30);
  }
  else
  {
    v29 = -[CAMSemanticStylesEnabledCommand initWithEnabled:]([CAMSemanticStylesEnabledCommand alloc], "initWithEnabled:", objc_msgSend(v91, "semanticStyleSupport") & 1);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v29);
    v31 = objc_msgSend(v91, "semanticStyleSupport");
    v32 = v31;
    v30 = -[CAMSemanticStylesPreviewEnabledCommand initWithEnabled:]([CAMSemanticStylesPreviewEnabledCommand alloc], "initWithEnabled:", (v31 >> 2) & 1);
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v30);
    if ((v32 & 4) != 0)
    {
      v33 = [CAMSemanticStylesPreviewStyleCommand alloc];
      objc_msgSend(v91, "previewSemanticStyle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[CAMSemanticStylesPreviewStyleCommand initWithStyle:](v33, "initWithStyle:", v34);

      -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v35);
    }
  }

  v55 = -[CAMPreviewLayerZoomPIPEnabledCommand initWithEnabled:]([CAMPreviewLayerZoomPIPEnabledCommand alloc], "initWithEnabled:", objc_msgSend(v91, "enableZoomPIP"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  -[CAMModeAndDeviceCommand _specificEncodingBehaviorCommandForGraphConfiguration:](self, "_specificEncodingBehaviorCommandForGraphConfiguration:", v91);
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v36);
  v54 = (void *)v36;
  -[CAMModeAndDeviceCommand _specificPreparePhotoSettingsCommandForGraphConfiguration:](self, "_specificPreparePhotoSettingsCommandForGraphConfiguration:", v91);
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v37);
  v53 = (void *)v37;
  v52 = objc_alloc_init(CAMSystemPressureMitigationCommand);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (objc_msgSend(v21, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", v5, objc_msgSend(v91, "videoConfiguration"), objc_msgSend(v91, "videoEncodingBehavior"), -[CAMModeAndDeviceCommand _outputToExternalStorage](self, "_outputToExternalStorage"), objc_msgSend(v91, "enableStereoVideoCapture"), objc_msgSend(v91, "prefersHDR10BitVideo")))v38 = objc_msgSend(v91, "enableAutoFPSVideo");
  else
    v38 = 0;
  v39 = v87;
  v88 = -[CAMAutoFPSVideoCommand initWithAutoFPSVideoEnabled:]([CAMAutoFPSVideoCommand alloc], "initWithAutoFPSVideoEnabled:", v38);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v90 = -[CAMSpatialOverCaptureEnabledCommand initWithSpatialOverCaptureEnabled:]([CAMSpatialOverCaptureEnabledCommand alloc], "initWithSpatialOverCaptureEnabled:", objc_msgSend(v21, "spatialOverCaptureSupportForMode:device:", v5, v89) & 1);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v40 = objc_msgSend(v21, "isAspectRatioCropSupportedForMode:devicePosition:", v5, v39);
  v51 = -[CAMNonDestructiveCropEnabledCommand initWithNonDestructiveCropEnabled:]([CAMNonDestructiveCropEnabledCommand alloc], "initWithNonDestructiveCropEnabled:", v40);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if ((_DWORD)v40)
  {
    v41 = -[CAMNonDestructiveCropAspectRatioCommand initWithAspectRatioCrop:]([CAMNonDestructiveCropAspectRatioCommand alloc], "initWithAspectRatioCrop:", objc_msgSend(v91, "aspectRatioCrop"));
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v41);

  }
  v50 = -[CAMDeferredProcessingEnabledCommand initWithDeferredProcessingEnabled:]([CAMDeferredProcessingEnabledCommand alloc], "initWithDeferredProcessingEnabled:", objc_msgSend(v21, "isDeferredProcessingSupportedForMode:devicePosition:", v5, v39));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v50);
  v49 = -[CAMPhotoQualityPrioritizationConfigurationCommand initWithPhotoQualityPrioritization:]([CAMPhotoQualityPrioritizationConfigurationCommand alloc], "initWithPhotoQualityPrioritization:", objc_msgSend(v91, "photoQualityPrioritization"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v49);
  v48 = -[CAMMirrorOutputVideoCommand initWithOutputMirrored:]([CAMMirrorOutputVideoCommand alloc], "initWithOutputMirrored:", objc_msgSend(v91, "isCaptureMirrored"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v48);
  v47 = -[CAMContentAwareDistortionCorrectionCommand initWithContentAwareDistortionCorrectionEnabled:]([CAMContentAwareDistortionCorrectionCommand alloc], "initWithContentAwareDistortionCorrectionEnabled:", objc_msgSend(v91, "enableContentAwareDistortionCorrection"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v47);
  v42 = -[CAMDemosaicedRAWEnabledCommand initWithEnabled:]([CAMDemosaicedRAWEnabledCommand alloc], "initWithEnabled:", objc_msgSend(v91, "enableRAWCaptureIfSupported"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v42);
  v43 = -[CAMResponsiveShutterEnabledCommand initWithEnabled:]([CAMResponsiveShutterEnabledCommand alloc], "initWithEnabled:", objc_msgSend(v91, "enableResponsiveShutter"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v43);
  v44 = -[CAMMaximumPhotoResolutionCommand initWithMaximumPhotoResolution:]([CAMMaximumPhotoResolutionCommand alloc], "initWithMaximumPhotoResolution:", objc_msgSend(v91, "maximumPhotoResolution"));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v44);
  v45 = -[CAMFallbackPrimaryConstituentDeviceCommand initWithFallbackPrimaryConstituentDeviceSelection:]([CAMFallbackPrimaryConstituentDeviceCommand alloc], "initWithFallbackPrimaryConstituentDeviceSelection:", objc_msgSend(v21, "fallbackPrimaryConstituentDeviceSelectionForMode:device:videoConfiguration:videoStabilizationStrength:macroMode:spatialVideoEnabled:", objc_msgSend(v91, "mode"), objc_msgSend(v91, "device"), objc_msgSend(v91, "videoConfiguration"), objc_msgSend(v91, "videoStabilizationStrength"), objc_msgSend(v91, "macroMode"), objc_msgSend(v91, "enableStereoVideoCapture")));
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v45);
  v46 = -[CAMPostConfigurationSetupCommand initWithGraphConfiguration:]([CAMPostConfigurationSetupCommand alloc], "initWithGraphConfiguration:", v91);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v46);

}

- (BOOL)_shouldEnableLivePhotoCaptureForMode:(int64_t)a3 device:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  BOOL v10;
  BOOL v11;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((unint64_t)(a4 - 1) > 0xA)
    v8 = 0;
  else
    v8 = qword_1DB9A5530[a4 - 1];
  v9 = objc_msgSend(v6, "isLivePhotoSupportedForDevicePosition:", v8);
  if (a3)
    v10 = 0;
  else
    v10 = v9;
  if (a3 == 4)
    v10 = v9;
  if (a3 == 9)
    v11 = v9;
  else
    v11 = v10;

  return v11;
}

- (BOOL)_isStillImageMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x251u >> a3);
}

- (id)_specificEncodingBehaviorCommandForGraphConfiguration:(id)a3
{
  id v3;
  CAMPanoramaEncodingCommand *v4;

  v3 = a3;
  if (objc_msgSend(v3, "mode") == 3)
    v4 = -[CAMPanoramaEncodingCommand initWithPhotoEncodingBehavior:]([CAMPanoramaEncodingCommand alloc], "initWithPhotoEncodingBehavior:", objc_msgSend(v3, "photoEncodingBehavior"));
  else
    v4 = 0;

  return v4;
}

- (id)_specificPreparePhotoSettingsCommandForGraphConfiguration:(id)a3
{
  id v3;
  unint64_t v4;
  CAMPreparePhotoSettingsCommand *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "mode");
  if (v4 > 9 || ((1 << v4) & 0x251) == 0)
    v6 = 0;
  else
    v6 = -[CAMPreparePhotoSettingsCommand initWithGraphConfiguration:]([CAMPreparePhotoSettingsCommand alloc], "initWithGraphConfiguration:", v3);

  return v6;
}

- (void)_performPostConfigurationSanityCheckForGraphConfiguration:(id)a3 withContext:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = objc_msgSend(a3, "mode");
  objc_msgSend(v6, "currentCaptureSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryOutputForMode:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
  {
    objc_msgSend(v10, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMModeAndDeviceCommandCannotCaptureErrorDomain"), -32200, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = (uint64_t)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMModeAndDeviceCommandCannotCaptureErrorDomain"), -32201, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (id)v12;
  -[CAMModeAndDeviceCommand _setConfigurationError:](self, "_setConfigurationError:", v12);

}

- (void)_setConfigurationError:(id)a3
{
  objc_storeStrong((id *)&self->__configurationError, a3);
}

- (id)userInfo
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CAMModeAndDeviceCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("CAMModeAndDeviceCommandDesiredConfiguration"));
  v5 = -[CAMModeAndDeviceCommand _requestID](self, "_requestID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CAMModeAndDeviceCommandRequestID"));

  -[CAMModeAndDeviceCommand _configurationError](self, "_configurationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("CAMModeAndDeviceConfigurationError"));

  return v3;
}

- (NSError)_configurationError
{
  return self->__configurationError;
}

- (CAMModeAndDeviceCommand)initWithGraphConfiguration:(id)a3 minimumExecutionTime:(double)a4 requestID:(int)a5 outputToExternalStorage:(BOOL)a6
{
  id v11;
  CAMModeAndDeviceCommand *v12;
  CAMModeAndDeviceCommand *v13;
  CAMCaptureGraphConfiguration *resolvedGraphConfiguration;
  NSError *configurationError;
  CAMModeAndDeviceCommand *v16;
  objc_super v18;

  v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMModeAndDeviceCommand;
  v12 = -[CAMCaptureCommand init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__desiredGraphConfiguration, a3);
    resolvedGraphConfiguration = v13->__resolvedGraphConfiguration;
    v13->__resolvedGraphConfiguration = 0;

    v13->__minimumExecutionTime = a4;
    v13->__requestID = a5;
    configurationError = v13->__configurationError;
    v13->__configurationError = 0;

    v13->__outputToExternalStorage = a6;
    v16 = v13;
  }

  return v13;
}

- (CAMModeAndDeviceCommand)initWithCoder:(id)a3
{
  id v4;
  CAMModeAndDeviceCommand *v5;
  uint64_t v6;
  CAMCaptureGraphConfiguration *desiredGraphConfiguration;
  uint64_t v8;
  CAMCaptureGraphConfiguration *resolvedGraphConfiguration;
  double v10;
  CAMModeAndDeviceCommand *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMModeAndDeviceCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMModeAndDeviceCommandDesiredConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    desiredGraphConfiguration = v5->__desiredGraphConfiguration;
    v5->__desiredGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMModeAndDeviceCommandResolvedConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    resolvedGraphConfiguration = v5->__resolvedGraphConfiguration;
    v5->__resolvedGraphConfiguration = (CAMCaptureGraphConfiguration *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CAMModeAndDeviceCommandMinimumExecutionTime"));
    v5->__minimumExecutionTime = v10;
    v5->__requestID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CAMModeAndDeviceCommandRequestID"));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMModeAndDeviceCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CAMModeAndDeviceCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMModeAndDeviceCommandDesiredConfiguration"));

  -[CAMModeAndDeviceCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CAMModeAndDeviceCommandResolvedConfiguration"));

  -[CAMModeAndDeviceCommand _minimumExecutionTime](self, "_minimumExecutionTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("CAMModeAndDeviceCommandMinimumExecutionTime"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[CAMModeAndDeviceCommand _requestID](self, "_requestID"), CFSTR("CAMModeAndDeviceCommandRequestID"));

}

- (id)sessionModificationLogReason
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CAMModeAndDeviceCommand _desiredGraphConfiguration](self, "_desiredGraphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (requestID=%d)"), v5, -[CAMModeAndDeviceCommand _requestID](self, "_requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_desiredInputsWithContext:(id)a3 captureEngineDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[CAMModeAndDeviceCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "audioConfiguration");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "captureDeviceInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v10, "addObject:", v11);
  if (v9)
  {
    objc_msgSend(v6, "audioDeviceInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "addObject:", v12);

  }
  return v10;
}

- (id)_specificFramerateCommandForGraphConfiguration:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  CAMVideoFramerateCommand *v8;
  CAMPanoramaConfigurationCommand *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "mode");
  if (v7 > 9)
  {
    v8 = 0;
  }
  else if (v7 == 3)
  {
    v10 = [CAMPanoramaConfigurationCommand alloc];
    objc_msgSend(v6, "currentPanoramaConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CAMPanoramaConfigurationCommand initWithConfiguration:](v10, "initWithConfiguration:", v11);

  }
  else
  {
    v8 = -[CAMVideoFramerateCommand initWithVideoConfiguration:]([CAMVideoFramerateCommand alloc], "initWithVideoConfiguration:", objc_msgSend(v5, "videoConfiguration"));
  }

  return v8;
}

- (BOOL)_wantsLivePhotoMetadataInVideosForMode:(int64_t)a3 device:(int64_t)a4
{
  return a3 == 1;
}

- (BOOL)_outputToExternalStorage
{
  return self->__outputToExternalStorage;
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_7(&dword_1DB760000, a2, a3, "Attempting to use an unsupported session preset %{public}@ on device %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)executeWithContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Attempting to configure a mode with both a preset and a device format! We prefer the format over the preset, but the results may be unexpected.", a5, a6, a7, a8, 0);
}

- (void)executeWithContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Attempting to configure a mode with out a preset or device format! Results may be unexpected.", a5, a6, a7, a8, 0);
}

- (void)executeWithContext:(NSObject *)a3 .cold.4(_QWORD *a1, unint64_t a2, NSObject *a3)
{
  __CFString *v3;
  __CFString *v4;
  _BYTE v5[24];

  if (*a1 >= 0xCuLL)
    v3 = 0;
  else
    v3 = off_1EA32B260[*a1];
  if (a2 >= 0xC)
    v4 = 0;
  else
    v4 = off_1EA32B260[a2];
  *(_DWORD *)v5 = 138543618;
  *(_QWORD *)&v5[4] = v3;
  *(_WORD *)&v5[12] = 2114;
  *(_QWORD *)&v5[14] = v4;
  OUTLINED_FUNCTION_7(&dword_1DB760000, a2, a3, "Resolved device %{public}@ does not match desired device %{public}@. Should have already been resolved in _sanitizeDeviceUsingContext", *(_QWORD *)v5, *(_QWORD *)&v5[8], *(_QWORD *)&v5[16], *MEMORY[0x1E0C80C00]);
}

@end
