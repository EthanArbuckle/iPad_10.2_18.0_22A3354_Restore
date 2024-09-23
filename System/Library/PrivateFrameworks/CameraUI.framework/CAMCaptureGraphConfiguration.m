@implementation CAMCaptureGraphConfiguration

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (int64_t)videoEncodingBehavior
{
  return self->_videoEncodingBehavior;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (unint64_t)previewConfiguration
{
  return self->_previewConfiguration;
}

- (int64_t)previewSampleBufferVideoFormat
{
  return self->_previewSampleBufferVideoFormat;
}

- (NSArray)previewFilters
{
  return self->_previewFilters;
}

- (CAMVideoThumbnailOutputConfiguration)videoThumbnailOutputConfiguration
{
  return self->_videoThumbnailOutputConfiguration;
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLensGroup, 0);
  objc_storeStrong((id *)&self->_previewSemanticStyle, 0);
  objc_storeStrong((id *)&self->_videoThumbnailOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_previewFilters, 0);
}

- (id)completeDescription
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  int64_t v7;
  const __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  int v30;
  _BOOL4 v31;
  const __CFString *v32;
  unint64_t v33;
  __CFString *v34;
  const __CFString *v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  __CFString *v40;
  __CFString *v41;
  id v42;
  __CFString *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v3 = -[CAMCaptureGraphConfiguration mode](self, "mode");
  if (v3 > 9)
    v4 = 0;
  else
    v4 = off_1EA32EF48[v3];
  v5 = -[CAMCaptureGraphConfiguration device](self, "device");
  if (v5 > 0xB)
    v6 = 0;
  else
    v6 = off_1EA32EF98[v5];
  v7 = -[CAMCaptureGraphConfiguration videoConfiguration](self, "videoConfiguration");
  switch(v7)
  {
    case 0:
      v8 = CFSTR("Auto");
      goto LABEL_31;
    case 1:
      v8 = CFSTR("1080p60");
      goto LABEL_31;
    case 2:
      v8 = CFSTR("720p120");
      goto LABEL_31;
    case 3:
      v8 = CFSTR("720p240");
      goto LABEL_31;
    case 4:
      v8 = CFSTR("1080p120");
      goto LABEL_31;
    case 5:
      v8 = CFSTR("4k30");
      goto LABEL_31;
    case 6:
      v8 = CFSTR("720p30");
      goto LABEL_31;
    case 7:
      v8 = CFSTR("1080p30");
      goto LABEL_31;
    case 8:
      v8 = CFSTR("1080p240");
      goto LABEL_31;
    case 9:
      v8 = CFSTR("4k60");
      goto LABEL_31;
    case 10:
      v8 = CFSTR("4k24");
      goto LABEL_31;
    case 11:
      v8 = CFSTR("1080p25");
      goto LABEL_31;
    case 12:
      v8 = CFSTR("4k25");
      goto LABEL_31;
    case 13:
      v8 = CFSTR("4k120");
      goto LABEL_31;
    case 14:
      v8 = CFSTR("4k100");
LABEL_31:
      v44 = (void *)v8;
      break;
    default:
      switch(v7)
      {
        case 10000:
          v8 = CFSTR("ImagePickerHigh");
          goto LABEL_31;
        case 10001:
          v8 = CFSTR("ImagePickerMedium");
          goto LABEL_31;
        case 10002:
          v8 = CFSTR("ImagePickerLow");
          goto LABEL_31;
        case 10003:
          v8 = CFSTR("ImagePickerVGA");
          goto LABEL_31;
        case 10004:
          v8 = CFSTR("ImagePickeriFrame720p");
          goto LABEL_31;
        case 10005:
          v8 = CFSTR("ImagePickeriFrame540p");
          goto LABEL_31;
        default:
          v44 = 0;
          break;
      }
      break;
  }
  v9 = -[CAMCaptureGraphConfiguration audioConfiguration](self, "audioConfiguration");
  if (v9 > 3)
    v10 = 0;
  else
    v10 = off_1EA32EFF8[v9];
  v11 = -[CAMCaptureGraphConfiguration previewConfiguration](self, "previewConfiguration");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v12, "addObject:", CFSTR("Layer"));
    if ((v11 & 2) == 0)
    {
LABEL_37:
      if ((v11 & 4) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(v13, "addObject:", CFSTR("VideoDataOutput"));
  if ((v11 & 4) != 0)
LABEL_38:
    objc_msgSend(v13, "addObject:", CFSTR("ThumbnailOutput"));
LABEL_39:
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__25;
  v51 = __Block_byref_object_dispose__25;
  v52 = 0;
  v14 = objc_msgSend(v13, "count");
  v15 = (void *)v48[5];
  v16 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v48[5] = (uint64_t)CFSTR("Preview");

    v46[0] = v16;
    v46[1] = 3221225472;
    v46[2] = __CAMDebugStringForPreviewConfiguration_block_invoke;
    v46[3] = &unk_1EA32C260;
    v46[4] = &v47;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v46);
  }
  else
  {
    v48[5] = (uint64_t)CFSTR("PreviewDisabled");

  }
  v42 = (id)v48[5];
  _Block_object_dispose(&v47, 8);

  if (-[CAMCaptureGraphConfiguration mixAudioWithOthers](self, "mixAudioWithOthers"))
  {
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("_MixWithOthers"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CAMCaptureGraphConfiguration colorSpace](self, "colorSpace");
  v43 = v10;
  v40 = v4;
  v41 = v6;
  if (v18)
  {
    if (v18 == 3)
    {
      v19 = CFSTR("_Log");
    }
    else
    {
      if (v18 != 2)
        goto LABEL_54;
      v19 = CFSTR("_HDR10");
    }
  }
  else
  {
    v19 = CFSTR("_sRGB");
  }
  objc_msgSend(v44, "stringByAppendingString:", v19);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
  if (objc_msgSend(v17, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", -[CAMCaptureGraphConfiguration mode](self, "mode"), -[CAMCaptureGraphConfiguration videoConfiguration](self, "videoConfiguration"), -[CAMCaptureGraphConfiguration videoEncodingBehavior](self, "videoEncodingBehavior"), 0, -[CAMCaptureGraphConfiguration enableStereoVideoCapture](self, "enableStereoVideoCapture"), -[CAMCaptureGraphConfiguration prefersHDR10BitVideo](self, "prefersHDR10BitVideo")))
  {
    if (-[CAMCaptureGraphConfiguration enableAutoFPSVideo](self, "enableAutoFPSVideo"))
      v20 = CFSTR("_AutoFPS");
    else
      v20 = CFSTR("_AutoFPSDisabled");
    objc_msgSend(v44, "stringByAppendingString:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v21;
  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__25;
  v51 = __Block_byref_object_dispose__25;
  v52 = 0;
  -[CAMCaptureGraphConfiguration previewFilters](self, "previewFilters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  v45[1] = 3221225472;
  v45[2] = __51__CAMCaptureGraphConfiguration_completeDescription__block_invoke;
  v45[3] = &unk_1EA32EF28;
  v45[4] = &v47;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v45);
  v23 = (void *)MEMORY[0x1E0CB37A0];
  v24 = -[CAMCaptureGraphConfiguration photoQualityPrioritization](self, "photoQualityPrioritization");
  if (v24 > 2)
    v25 = 0;
  else
    v25 = off_1EA32F018[v24];
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@(%@,%@,%@,%@"), v40, v41, v44, v43, v42, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMCaptureGraphConfiguration isCaptureMirrored](self, "isCaptureMirrored"))
    objc_msgSend(v26, "appendFormat:", CFSTR(",Mirrored"));
  if (-[CAMCaptureGraphConfiguration enableRAWCaptureIfSupported](self, "enableRAWCaptureIfSupported"))
    objc_msgSend(v26, "appendFormat:", CFSTR(",RAW Enabled"));
  if (-[CAMCaptureGraphConfiguration videoEncodingBehavior](self, "videoEncodingBehavior") == 2)
  {
    objc_msgSend(v26, "appendFormat:", CFSTR(",ProRes"));
    if (-[CAMCaptureGraphConfiguration colorSpace](self, "colorSpace") == 3)
      objc_msgSend(v26, "appendFormat:", CFSTR("Log"));
  }
  if ((~-[CAMCaptureGraphConfiguration semanticStyleSupport](self, "semanticStyleSupport") & 5) != 0)
  {
    if ((-[CAMCaptureGraphConfiguration semanticStyleSupport](self, "semanticStyleSupport") & 1) != 0)
    {
      v27 = CFSTR(",SemanticStyle Capture");
    }
    else
    {
      if ((-[CAMCaptureGraphConfiguration semanticStyleSupport](self, "semanticStyleSupport") & 4) == 0)
        goto LABEL_76;
      v27 = CFSTR(",SemanticStyle Preview");
    }
  }
  else
  {
    v27 = CFSTR(",SemanticStyle Capture/Preview");
  }
  objc_msgSend(v26, "appendFormat:", v27);
LABEL_76:
  -[CAMCaptureGraphConfiguration previewSemanticStyle](self, "previewSemanticStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CAMCaptureGraphConfiguration previewSemanticStyle](self, "previewSemanticStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendFormat:", CFSTR(",PreviewSemanticStyle: %@"), v29);

  }
  v30 = objc_msgSend(v17, "isContentAwareDistortionCorrectionSupportedForMode:", -[CAMCaptureGraphConfiguration mode](self, "mode"));
  v31 = -[CAMCaptureGraphConfiguration enableContentAwareDistortionCorrection](self, "enableContentAwareDistortionCorrection");
  if (((v31 | v30) & 1) != 0)
  {
    if (v31)
      v32 = CFSTR(",ContentAwareDistortion");
    else
      v32 = CFSTR(",ContentAwareDistortionDisabled");
    objc_msgSend(v26, "appendFormat:", v32);
  }
  if (-[CAMCaptureGraphConfiguration aspectRatioCrop](self, "aspectRatioCrop"))
  {
    v33 = -[CAMCaptureGraphConfiguration aspectRatioCrop](self, "aspectRatioCrop");
    if (v33 > 3)
      v34 = 0;
    else
      v34 = off_1EA32F030[v33];
    objc_msgSend(v26, "appendFormat:", CFSTR(",%@"), v34);
  }
  if (objc_msgSend((id)v48[5], "length"))
    objc_msgSend(v26, "appendFormat:", CFSTR(",filters=%@"), v48[5]);
  if (-[CAMCaptureGraphConfiguration enableResponsiveShutter](self, "enableResponsiveShutter"))
  {
    v35 = CFSTR(",ResponsiveShutter");
LABEL_94:
    objc_msgSend(v26, "appendFormat:", v35);
    goto LABEL_95;
  }
  if (objc_msgSend(v17, "responsiveShutterSupported"))
  {
    v35 = CFSTR(",ResponsiveShutterDisabled");
    goto LABEL_94;
  }
LABEL_95:
  if (-[CAMCaptureGraphConfiguration suspendLivePhotoCapture](self, "suspendLivePhotoCapture")
    && objc_msgSend(v17, "isLivePhotoSupported"))
  {
    objc_msgSend(v26, "appendFormat:", CFSTR(",LivePhotoSuspended"));
  }
  if (objc_msgSend(v17, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", -[CAMCaptureGraphConfiguration mode](self, "mode"), -[CAMCaptureGraphConfiguration device](self, "device"), -[CAMCaptureGraphConfiguration videoConfiguration](self, "videoConfiguration"), -[CAMCaptureGraphConfiguration videoEncodingBehavior](self, "videoEncodingBehavior"), -[CAMCaptureGraphConfiguration trueVideoEnabled](self, "trueVideoEnabled"), -[CAMCaptureGraphConfiguration prefersHDR10BitVideo](self, "prefersHDR10BitVideo")))
  {
    v36 = -[CAMCaptureGraphConfiguration videoStabilizationStrength](self, "videoStabilizationStrength");
    if (v36 < 4)
      objc_msgSend(v26, "appendFormat:", off_1EA32F050[v36]);
  }
  v37 = -[CAMCaptureGraphConfiguration maximumPhotoResolution](self, "maximumPhotoResolution") - 1;
  if (v37 <= 2)
    objc_msgSend(v26, "appendFormat:", off_1EA32F070[v37]);
  objc_msgSend(v26, "appendFormat:", CFSTR(")"));
  v38 = v26;

  _Block_object_dispose(&v47, 8);
  return v38;
}

- (CAMCaptureGraphConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 macroMode:(int64_t)a5 videoConfiguration:(int64_t)a6 audioConfiguration:(unint64_t)a7 mixAudioWithOthers:(BOOL)a8 windNoiseRemovalEnabled:(BOOL)a9 previewConfiguration:(unint64_t)a10 previewSampleBufferVideoFormat:(int64_t)a11 previewFilters:(id)a12 videoThumbnailOutputConfiguration:(id)a13 photoEncodingBehavior:(int64_t)a14 videoEncodingBehavior:(int64_t)a15 enableAutoFPSVideo:(BOOL)a16 videoHDRSuspended:(BOOL)a17 aspectRatioCrop:(int64_t)a18 photoQualityPrioritization:(int64_t)a19 captureMirrored:(BOOL)a20 enableRAWCaptureIfSupported:(BOOL)a21 semanticStyleSupport:(unint64_t)a22 previewSemanticStyle:(id)a23 enableContentAwareDistortionCorrection:(BOOL)a24 enableResponsiveShutter:(BOOL)a25 suspendLivePhotoCapture:(BOOL)a26 videoStabilizationStrength:(int64_t)a27 maximumPhotoResolution:(int64_t)a28 colorSpace:(int64_t)a29 enableDepthSuggestion:(BOOL)a30 enableZoomPIP:(BOOL)a31 customLensGroup:(id)a32 enableStereoVideoCapture:(BOOL)a33 trueVideoEnabled:(BOOL)a34 prefersHDR10BitVideo:(BOOL)a35
{
  id v37;
  id v38;
  id v39;
  id v40;
  CAMCaptureGraphConfiguration *v41;
  CAMCaptureGraphConfiguration *v42;
  CAMCaptureGraphConfiguration *v43;
  objc_super v50;

  v37 = a12;
  v38 = a13;
  v39 = a23;
  v40 = a32;
  v50.receiver = self;
  v50.super_class = (Class)CAMCaptureGraphConfiguration;
  v41 = -[CAMCaptureGraphConfiguration init](&v50, sel_init);
  v42 = v41;
  if (v41)
  {
    v41->_mode = a3;
    v41->_device = a4;
    v41->_macroMode = a5;
    v41->_mixAudioWithOthers = a8;
    v41->_videoConfiguration = a6;
    v41->_audioConfiguration = a7;
    v41->_previewConfiguration = a10;
    v41->_previewSampleBufferVideoFormat = a11;
    objc_storeStrong((id *)&v41->_previewFilters, a12);
    objc_storeStrong((id *)&v42->_videoThumbnailOutputConfiguration, a13);
    v42->_photoEncodingBehavior = a14;
    v42->_videoEncodingBehavior = a15;
    v42->_enableAutoFPSVideo = a16;
    v42->_videoHDRSuspended = a17;
    v42->_aspectRatioCrop = a18;
    v42->_photoQualityPrioritization = a19;
    v42->_captureMirrored = a20;
    v42->_enableRAWCaptureIfSupported = a21;
    v42->_semanticStyleSupport = a22;
    objc_storeStrong((id *)&v42->_previewSemanticStyle, a23);
    v42->_enableContentAwareDistortionCorrection = a24;
    v42->_enableResponsiveShutter = a25;
    v42->_suspendLivePhotoCapture = a26;
    v42->_videoStabilizationStrength = a27;
    v42->_maximumPhotoResolution = a28;
    v42->_colorSpace = a29;
    v42->_enableDepthSuggestion = a30;
    v42->_enableZoomPIP = a31;
    objc_storeStrong((id *)&v42->_customLensGroup, a32);
    v42->_enableStereoVideoCapture = a33;
    v42->_windNoiseRemovalEnabled = a9;
    v42->_trueVideoEnabled = a34;
    v42->_prefersHDR10BitVideo = a35;
    v43 = v42;
  }

  return v42;
}

- (int64_t)devicePosition
{
  int64_t v2;

  v2 = -[CAMCaptureGraphConfiguration device](self, "device");
  if ((unint64_t)(v2 - 1) > 0xA)
    return 0;
  else
    return qword_1DB9A7BC0[v2 - 1];
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CAMCaptureGraphConfiguration modeDescription](self, "modeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureGraphConfiguration deviceDescription](self, "deviceDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)modeDescription
{
  unint64_t v2;

  v2 = -[CAMCaptureGraphConfiguration mode](self, "mode");
  if (v2 > 9)
    return 0;
  else
    return off_1EA32EF48[v2];
}

- (id)deviceDescription
{
  unint64_t v2;

  v2 = -[CAMCaptureGraphConfiguration device](self, "device");
  if (v2 > 0xB)
    return 0;
  else
    return off_1EA32EF98[v2];
}

- (id)devicePositionDescription
{
  int64_t v2;
  __CFString *v3;

  v2 = -[CAMCaptureGraphConfiguration devicePosition](self, "devicePosition");
  v3 = CFSTR("Back");
  if (v2)
    v3 = 0;
  if (v2 == 1)
    return CFSTR("Front");
  else
    return v3;
}

void __51__CAMCaptureGraphConfiguration_completeDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 40);
  v10 = v3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v5, v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = v3;
    v8 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;
  }

}

- (int64_t)macroMode
{
  return self->_macroMode;
}

- (BOOL)mixAudioWithOthers
{
  return self->_mixAudioWithOthers;
}

- (BOOL)enableAutoFPSVideo
{
  return self->_enableAutoFPSVideo;
}

- (BOOL)isVideoHDRSuspended
{
  return self->_videoHDRSuspended;
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (BOOL)enableRAWCaptureIfSupported
{
  return self->_enableRAWCaptureIfSupported;
}

- (unint64_t)semanticStyleSupport
{
  return self->_semanticStyleSupport;
}

- (CEKCaptureStyle)previewSemanticStyle
{
  return self->_previewSemanticStyle;
}

- (BOOL)enableContentAwareDistortionCorrection
{
  return self->_enableContentAwareDistortionCorrection;
}

- (BOOL)enableResponsiveShutter
{
  return self->_enableResponsiveShutter;
}

- (BOOL)suspendLivePhotoCapture
{
  return self->_suspendLivePhotoCapture;
}

- (int64_t)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (int64_t)maximumPhotoResolution
{
  return self->_maximumPhotoResolution;
}

- (int64_t)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)enableDepthSuggestion
{
  return self->_enableDepthSuggestion;
}

- (BOOL)enableZoomPIP
{
  return self->_enableZoomPIP;
}

- (NSArray)customLensGroup
{
  return self->_customLensGroup;
}

- (BOOL)enableStereoVideoCapture
{
  return self->_enableStereoVideoCapture;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_windNoiseRemovalEnabled;
}

- (BOOL)trueVideoEnabled
{
  return self->_trueVideoEnabled;
}

- (BOOL)prefersHDR10BitVideo
{
  return self->_prefersHDR10BitVideo;
}

@end
