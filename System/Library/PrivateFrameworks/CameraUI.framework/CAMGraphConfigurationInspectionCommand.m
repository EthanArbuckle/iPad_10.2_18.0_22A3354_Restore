@implementation CAMGraphConfigurationInspectionCommand

- (CAMGraphConfigurationInspectionCommand)initWithKnownGraphConfiguration:(id)a3
{
  id v5;
  CAMGraphConfigurationInspectionCommand *v6;
  CAMGraphConfigurationInspectionCommand *v7;
  CAMCaptureGraphConfiguration *resolvedGraphConfiguration;
  CAMGraphConfigurationInspectionCommand *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  v6 = -[CAMCaptureCommand init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__knownGraphConfiguration, a3);
    resolvedGraphConfiguration = v7->__resolvedGraphConfiguration;
    v7->__resolvedGraphConfiguration = 0;

    v9 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  unint64_t v5;
  CAMCaptureGraphConfiguration *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CAMCaptureGraphConfiguration *v44;
  int64_t v45;
  id v46;

  v46 = a3;
  -[CAMGraphConfigurationInspectionCommand _knownGraphConfiguration](self, "_knownGraphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  if (v5 > 9)
  {
    v6 = 0;
  }
  else if (((1 << v5) & 0x279) != 0 || objc_msgSend(v4, "videoConfiguration"))
  {
    v6 = v4;
  }
  else
  {
    v45 = -[CAMGraphConfigurationInspectionCommand _resolvedVideoConfigurationFromContext:](self, "_resolvedVideoConfigurationFromContext:", v46);
    v44 = [CAMCaptureGraphConfiguration alloc];
    v43 = objc_msgSend(v4, "mode");
    v42 = objc_msgSend(v4, "device");
    v41 = objc_msgSend(v4, "macroMode");
    v40 = objc_msgSend(v4, "audioConfiguration");
    v39 = objc_msgSend(v4, "mixAudioWithOthers");
    v38 = objc_msgSend(v4, "windNoiseRemovalEnabled");
    v37 = objc_msgSend(v4, "previewConfiguration");
    v36 = objc_msgSend(v4, "previewSampleBufferVideoFormat");
    objc_msgSend(v4, "previewFilters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoThumbnailOutputConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v4, "photoEncodingBehavior");
    v32 = objc_msgSend(v4, "videoEncodingBehavior");
    v31 = objc_msgSend(v4, "enableAutoFPSVideo");
    v30 = objc_msgSend(v4, "isVideoHDRSuspended");
    v29 = objc_msgSend(v4, "aspectRatioCrop");
    v28 = objc_msgSend(v4, "photoQualityPrioritization");
    v27 = objc_msgSend(v4, "isCaptureMirrored");
    v25 = objc_msgSend(v4, "enableRAWCaptureIfSupported");
    v24 = objc_msgSend(v4, "semanticStyleSupport");
    objc_msgSend(v4, "previewSemanticStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "enableContentAwareDistortionCorrection");
    v22 = objc_msgSend(v4, "enableResponsiveShutter");
    v21 = objc_msgSend(v4, "suspendLivePhotoCapture");
    v7 = objc_msgSend(v4, "videoStabilizationStrength");
    v8 = objc_msgSend(v4, "maximumPhotoResolution");
    v9 = objc_msgSend(v4, "colorSpace");
    v10 = objc_msgSend(v4, "enableDepthSuggestion");
    v11 = objc_msgSend(v4, "enableZoomPIP");
    objc_msgSend(v4, "customLensGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "enableStereoVideoCapture");
    v14 = objc_msgSend(v4, "trueVideoEnabled");
    BYTE2(v20) = objc_msgSend(v4, "prefersHDR10BitVideo");
    BYTE1(v20) = v14;
    LOBYTE(v20) = v13;
    BYTE1(v19) = v11;
    LOBYTE(v19) = v10;
    BYTE2(v18) = v21;
    BYTE1(v18) = v22;
    LOBYTE(v18) = v23;
    BYTE1(v17) = v25;
    LOBYTE(v17) = v27;
    BYTE1(v16) = v30;
    LOBYTE(v16) = v31;
    LOBYTE(v15) = v38;
    v6 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v44, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v43, v42, v41, v45, v40, v39, v15, v37, v36, v35, v34,
           v33,
           v32,
           v16,
           v29,
           v28,
           v17,
           v24,
           v26,
           v18,
           v7,
           v8,
           v9,
           v19,
           v12,
           v20);

  }
  -[CAMGraphConfigurationInspectionCommand _setResolvedGraphConfiguration:](self, "_setResolvedGraphConfiguration:", v6);

}

- (CAMCaptureGraphConfiguration)_knownGraphConfiguration
{
  return self->__knownGraphConfiguration;
}

- (void)_setResolvedGraphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, a3);
}

- (id)userInfo
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CAMGraphConfigurationInspectionCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("CAMModeAndDeviceCommandResolvedConfiguration"));

  return v3;
}

- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration
{
  return self->__resolvedGraphConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, 0);
  objc_storeStrong((id *)&self->__knownGraphConfiguration, 0);
}

- (CAMGraphConfigurationInspectionCommand)initWithCoder:(id)a3
{
  id v4;
  CAMGraphConfigurationInspectionCommand *v5;
  uint64_t v6;
  CAMCaptureGraphConfiguration *knownGraphConfiguration;
  uint64_t v8;
  CAMCaptureGraphConfiguration *resolvedGraphConfiguration;
  CAMGraphConfigurationInspectionCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMGraphConfigurationInspectionCommandKnownConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    knownGraphConfiguration = v5->__knownGraphConfiguration;
    v5->__knownGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMGraphConfigurationInspectionCommandResolvedConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    resolvedGraphConfiguration = v5->__resolvedGraphConfiguration;
    v5->__resolvedGraphConfiguration = (CAMCaptureGraphConfiguration *)v8;

    v10 = v5;
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
  v7.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CAMGraphConfigurationInspectionCommand _knownGraphConfiguration](self, "_knownGraphConfiguration", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMGraphConfigurationInspectionCommandKnownConfiguration"));

  -[CAMGraphConfigurationInspectionCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CAMGraphConfigurationInspectionCommandResolvedConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[CAMGraphConfigurationInspectionCommand _knownGraphConfiguration](self, "_knownGraphConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  -[CAMGraphConfigurationInspectionCommand _resolvedGraphConfiguration](self, "_resolvedGraphConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (int64_t)_resolvedVideoConfigurationFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t Dimensions;
  unint64_t v7;
  BOOL v9;
  BOOL v11;
  _BOOL4 v13;
  uint64_t v14;
  int64_t v16;

  v3 = a3;
  objc_msgSend(v3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentVideoDeviceFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v5, "formatDescription"));
  v7 = HIDWORD(Dimensions);
  v9 = (_DWORD)Dimensions == 1280 && HIDWORD(Dimensions) == 720;
  v11 = (_DWORD)Dimensions == 1920 && HIDWORD(Dimensions) == 1080;
  v13 = (_DWORD)Dimensions == 3840 && HIDWORD(Dimensions) == 2160;
  if (v4)
  {
    objc_msgSend(v4, "activeVideoMinFrameDuration");
    v14 = 0 / 0;
    if (0 / 0 == 30 && v9)
    {
      v16 = 6;
      goto LABEL_88;
    }
    LODWORD(v7) = v14 == 120;
    if (v14 == 120 && v9)
    {
      v16 = 2;
      goto LABEL_88;
    }
    if (v14 == 240 && v9)
    {
      v16 = 3;
      goto LABEL_88;
    }
    if (v14 == 25 && v11)
    {
      v16 = 11;
      goto LABEL_88;
    }
    if (v14 == 30 && v11)
    {
      v16 = 7;
      goto LABEL_88;
    }
    if (v14 == 60 && v11)
    {
      v16 = 1;
      goto LABEL_88;
    }
    if (v14 == 120 && v11)
    {
      v16 = 4;
      goto LABEL_88;
    }
    if (v14 == 240 && v11)
    {
      v16 = 8;
      goto LABEL_88;
    }
    if (v14 == 24 && v13)
    {
      v16 = 10;
      goto LABEL_88;
    }
    if (v14 == 25 && v13)
    {
      v16 = 12;
      goto LABEL_88;
    }
    if (v14 == 30 && v13)
    {
      v16 = 5;
      goto LABEL_88;
    }
    if (v14 == 60 && v13)
    {
      v16 = 9;
      goto LABEL_88;
    }
    if (v14 == 100 && v13)
    {
      v16 = 14;
      goto LABEL_88;
    }
  }
  if ((v13 & v7) != 0)
    v16 = 13;
  else
    v16 = 0;
LABEL_88:

  return v16;
}

@end
