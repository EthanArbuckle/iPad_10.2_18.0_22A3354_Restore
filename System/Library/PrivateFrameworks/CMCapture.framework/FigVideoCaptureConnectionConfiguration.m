@implementation FigVideoCaptureConnectionConfiguration

- (BOOL)portraitAutoSuggestEnabled
{
  _BOOL4 v3;

  v3 = -[FigCaptureVideoPreviewSinkConfiguration portraitAutoSuggestEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "portraitAutoSuggestEnabled");
  if (v3)
    LOBYTE(v3) = -[FigCaptureSourceVideoFormat isPortraitAutoSuggestSupported](-[FigCaptureSourceConfiguration requiredFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "requiredFormat"), "isPortraitAutoSuggestSupported");
  return v3;
}

- (BOOL)previewDepthFilterRenderingEnabled
{
  FigCaptureSourceDepthDataFormat *v3;
  FigCaptureSourceDepthDataFormat *v4;

  if (!-[FigCaptureSourceConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "depthDataDeliveryEnabled"))
  {
LABEL_4:
    LODWORD(v4) = 0;
    return (-[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "depthDataDeliveryEnabled")|| (_DWORD)v4)&& -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "filterRenderingEnabled");
  }
  v3 = -[FigCaptureSourceConfiguration depthDataFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "depthDataFormat");
  v4 = v3;
  if (v3)
  {
    if (!-[FigCaptureSourceFormat dimensions](v3, "dimensions"))
    {
      LODWORD(v4) = (unint64_t)-[FigCaptureSourceFormat dimensions](v4, "dimensions") >> 32 == 0;
      return (-[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "depthDataDeliveryEnabled")|| (_DWORD)v4)&& -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "filterRenderingEnabled");
    }
    goto LABEL_4;
  }
  return (-[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "depthDataDeliveryEnabled")|| (_DWORD)v4)&& -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "filterRenderingEnabled");
}

+ (BOOL)cameraIntrinsicMatrixDeliveryEnabled:(id)a3 doingFaceTracking:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  void (*v15)(uint64_t, const __CFString *, uint64_t, id *);
  char v16;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v18 = *MEMORY[0x1E0C9AE00];
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(v10, "sinkConfiguration");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "sinkType") == 6)
          {
            v12 = objc_msgSend(v10, "cameraIntrinsicMatrixDeliveryEnabled");
            LOBYTE(v6) = 1;
            if ((v12 & 1) != 0 || a4)
              return v6;
          }
          if (objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "depthDataDeliveryEnabled"))
          {
            if (objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "sourceDeviceType") == 13)
              goto LABEL_28;
            v13 = objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "sourceDeviceType");
            if (v13 == 12 || v13 == 6)
            {
              v19 = 0;
              v14 = objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "source");
              v15 = *(void (**)(uint64_t, const __CFString *, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
              if (v15)
                v15(v14, CFSTR("AttributesDictionary"), v18, &v19);
              v16 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Focus")), "BOOLValue");

              if ((v16 & 1) != 0)
              {
LABEL_28:
                LOBYTE(v6) = 1;
                return v6;
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v11, "sinkType") == 8)
            {
              LODWORD(v19) = 0;
              if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v10))
              {
                if (!FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v10, "sourceConfiguration"), "source"), &v19))goto LABEL_28;
              }
              if ((FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(v10) & 1) != 0)
                goto LABEL_28;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_28;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (BOOL)previewFilterRenderingEnabled
{
  return -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "filterRenderingEnabled")|| -[FigCaptureVideoPreviewSinkConfiguration semanticStyleRenderingEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled");
}

+ (id)videoStabilizationMethods:(id)a3 includeIris:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(v11, "sinkConfiguration");
          if (objc_msgSend(v12, "sinkType") == 4
            || objc_msgSend(v12, "sinkType") == 6
            || objc_msgSend(v12, "sinkType") == 1)
          {
            v13 = objc_msgSend(v11, "videoStabilizationMethod");
          }
          else
          {
            if (!v4 || !objc_msgSend(v11, "irisVISEnabled"))
              goto LABEL_13;
            v13 = objc_msgSend(v11, "irisVISMethod");
          }
          if ((_DWORD)v13)
            objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13));
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v14;
    }
    while (v14);
  }
  return v6;
}

- (int)irisVISMethod
{
  int result;
  float v4;

  result = -[FigVideoCaptureConnectionConfiguration irisVISEnabled](self, "irisVISEnabled");
  if (result)
  {
    -[FigCaptureSourceVideoFormat cinematicStabilizationExtendedLookAheadDuration](-[FigCaptureSourceConfiguration requiredFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "requiredFormat"), "cinematicStabilizationExtendedLookAheadDuration");
    if (v4 <= 0.0)
      return 2;
    else
      return 3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  v4 = -[FigCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOutputFormat:", -[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat"));
  objc_msgSend(v4, "setOutputWidth:", -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"));
  objc_msgSend(v4, "setOutputHeight:", -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  objc_msgSend(v4, "setVideoStabilizationMethod:", -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"));
  objc_msgSend(v4, "setVideoStabilizationType:", -[FigVideoCaptureConnectionConfiguration videoStabilizationType](self, "videoStabilizationType"));
  objc_msgSend(v4, "setMirroringEnabled:", -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  objc_msgSend(v4, "setPhysicalMirroringForMovieRecordingEnabled:", -[FigVideoCaptureConnectionConfiguration physicalMirroringForMovieRecordingEnabled](self, "physicalMirroringForMovieRecordingEnabled"));
  objc_msgSend(v4, "setOrientation:", -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation"));
  objc_msgSend(v4, "setDeviceOrientationCorrectionEnabled:", -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled"));
  objc_msgSend(v4, "setZoomSmoothingEnabled:", -[FigVideoCaptureConnectionConfiguration zoomSmoothingEnabled](self, "zoomSmoothingEnabled"));
  objc_msgSend(v4, "setVideoGreenGhostMitigationEnabled:", -[FigVideoCaptureConnectionConfiguration videoGreenGhostMitigationEnabled](self, "videoGreenGhostMitigationEnabled"));
  objc_msgSend(v4, "setRetainedBufferCount:", -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"));
  objc_msgSend(v4, "setCameraIntrinsicMatrixDeliveryEnabled:", -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"));
  objc_msgSend(v4, "setLivePhotoMetadataWritingEnabled:", -[FigVideoCaptureConnectionConfiguration livePhotoMetadataWritingEnabled](self, "livePhotoMetadataWritingEnabled"));
  objc_msgSend(v4, "setStereoVideoCaptureEnabled:", -[FigVideoCaptureConnectionConfiguration stereoVideoCaptureEnabled](self, "stereoVideoCaptureEnabled"));
  objc_msgSend(v4, "setAttachMetadataToVideoBuffers:", -[FigVideoCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  return v4;
}

- (void)setOutputWidth:(int)a3
{
  self->_outputFormat = a3;
}

- (void)setOutputHeight:(int)a3
{
  self->_outputWidth = a3;
}

- (void)setVideoStabilizationMethod:(int)a3
{
  self->_outputHeight = a3;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  LOBYTE(self->_videoStabilizationType) = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
  *(_DWORD *)&self->_deviceOrientationCorrectionEnabled = a3;
}

- (void)setOutputFormat:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

- (void)setOrientation:(int)a3
{
  *(_DWORD *)&self->_mirroringEnabled = a3;
}

- (void)setZoomSmoothingEnabled:(BOOL)a3
{
  BYTE1(self->_orientation) = a3;
}

- (void)setVideoStabilizationType:(int)a3
{
  self->_videoStabilizationMethod = a3;
}

- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3
{
  BYTE1(self->_videoStabilizationType) = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  LOBYTE(self->_orientation) = a3;
}

- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)a3
{
  LOBYTE(self->_retainedBufferCount) = a3;
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  BYTE2(self->_orientation) = a3;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  BYTE2(self->_retainedBufferCount) = a3;
}

- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3
{
  BYTE1(self->_retainedBufferCount) = a3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  v5 = -[FigCaptureConnectionConfiguration isEqual:](&v23, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v6 = -[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat");
    if (v6 != objc_msgSend(a3, "outputFormat"))
      goto LABEL_18;
    v7 = -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth");
    if (v7 != objc_msgSend(a3, "outputWidth"))
      goto LABEL_18;
    v8 = -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight");
    if (v8 != objc_msgSend(a3, "outputHeight"))
      goto LABEL_18;
    v9 = -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod");
    if (v9 != objc_msgSend(a3, "videoStabilizationMethod"))
      goto LABEL_18;
    v10 = -[FigVideoCaptureConnectionConfiguration videoStabilizationType](self, "videoStabilizationType");
    if (v10 != objc_msgSend(a3, "videoStabilizationType"))
      goto LABEL_18;
    v11 = -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled");
    if (v11 != objc_msgSend(a3, "mirroringEnabled"))
      goto LABEL_18;
    v12 = -[FigVideoCaptureConnectionConfiguration physicalMirroringForMovieRecordingEnabled](self, "physicalMirroringForMovieRecordingEnabled");
    if (v12 != objc_msgSend(a3, "physicalMirroringForMovieRecordingEnabled"))
      goto LABEL_18;
    v13 = -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation");
    if (v13 != objc_msgSend(a3, "orientation"))
      goto LABEL_18;
    v14 = -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled");
    if (v14 == objc_msgSend(a3, "deviceOrientationCorrectionEnabled")
      && (v15 = -[FigVideoCaptureConnectionConfiguration zoomSmoothingEnabled](self, "zoomSmoothingEnabled"),
          v15 == objc_msgSend(a3, "zoomSmoothingEnabled"))
      && (v16 = -[FigVideoCaptureConnectionConfiguration videoGreenGhostMitigationEnabled](self, "videoGreenGhostMitigationEnabled"), v16 == objc_msgSend(a3, "videoGreenGhostMitigationEnabled"))&& (v17 = -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"), v17 == objc_msgSend(a3, "retainedBufferCount"))&& (v18 = -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"), v18 == objc_msgSend(a3, "cameraIntrinsicMatrixDeliveryEnabled"))&& (v19 = -[FigVideoCaptureConnectionConfiguration livePhotoMetadataWritingEnabled](self, "livePhotoMetadataWritingEnabled"), v19 == objc_msgSend(a3, "livePhotoMetadataWritingEnabled"))&& (v20 = -[FigVideoCaptureConnectionConfiguration stereoVideoCaptureEnabled](self, "stereoVideoCaptureEnabled"), v20 == objc_msgSend(a3, "stereoVideoCaptureEnabled")))
    {
      v21 = -[FigVideoCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers");
      LOBYTE(v5) = v21 ^ objc_msgSend(a3, "attachMetadataToVideoBuffers") ^ 1;
    }
    else
    {
LABEL_18:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)videoStabilizationType
{
  return self->_videoStabilizationMethod;
}

- (BOOL)zoomSmoothingEnabled
{
  return BYTE1(self->_orientation);
}

- (BOOL)stereoVideoCaptureEnabled
{
  return BYTE2(self->_retainedBufferCount);
}

- (BOOL)videoGreenGhostMitigationEnabled
{
  return BYTE2(self->_orientation);
}

- (BOOL)livePhotoMetadataWritingEnabled
{
  return BYTE1(self->_retainedBufferCount);
}

- (id)description
{
  int v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;

  v3 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
  v4 = &stru_1E4928818;
  if (v3 != -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (SUB-DEVICE:%@)"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType")));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("VC %p: <%@>%@ -> <%@>"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@/%dx%d"), BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  if (-[FigVideoCaptureConnectionConfiguration physicalMirroringForMovieRecordingEnabled](self, "physicalMirroringForMovieRecordingEnabled"))
  {
    v6 = CFSTR(" PhysMM:1,");
  }
  else
  {
    v6 = &stru_1E4928818;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(", E:%d, VIS:%d, M:%d,%@ O:%@, DOC:%d, RBC:%d, CIM:%d"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"), -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), v6, FigCaptureVideoOrientationToString(-[FigVideoCaptureConnectionConfiguration orientation](self, "orientation")), -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled"), -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"), -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"));
  return v5;
}

- (int)outputWidth
{
  return self->_outputFormat;
}

- (int)outputHeight
{
  return self->_outputWidth;
}

- (BOOL)mirroringEnabled
{
  return self->_videoStabilizationType;
}

- (int)orientation
{
  return *(_DWORD *)&self->_mirroringEnabled;
}

- (int)outputFormat
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (int)videoStabilizationMethod
{
  return self->_outputHeight;
}

- (int)retainedBufferCount
{
  return *(_DWORD *)&self->_deviceOrientationCorrectionEnabled;
}

- (BOOL)physicalMirroringForMovieRecordingEnabled
{
  return BYTE1(self->_videoStabilizationType);
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_orientation;
}

- (BOOL)cameraIntrinsicMatrixDeliveryEnabled
{
  return self->_retainedBufferCount;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigVideoCaptureConnectionConfiguration;
  v3 = -[FigCaptureConnectionConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_int64(v3, "outputFormat", -[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat"));
  xpc_dictionary_set_int64(v3, "outputWidth", -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"));
  xpc_dictionary_set_int64(v3, "outputHeight", -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  xpc_dictionary_set_int64(v3, "videoStabilizationMethod", -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"));
  xpc_dictionary_set_BOOL(v3, "mirroringEnabled", -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  xpc_dictionary_set_BOOL(v3, "physicalMirroringForMovieRecordingEnabled", -[FigVideoCaptureConnectionConfiguration physicalMirroringForMovieRecordingEnabled](self, "physicalMirroringForMovieRecordingEnabled"));
  xpc_dictionary_set_int64(v3, "orientation", -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation"));
  xpc_dictionary_set_BOOL(v3, "deviceOrientationCorrectionEnabled", -[FigVideoCaptureConnectionConfiguration deviceOrientationCorrectionEnabled](self, "deviceOrientationCorrectionEnabled"));
  xpc_dictionary_set_BOOL(v3, "zoomSmoothingEnabled", -[FigVideoCaptureConnectionConfiguration zoomSmoothingEnabled](self, "zoomSmoothingEnabled"));
  xpc_dictionary_set_BOOL(v3, "videoGreenGhostMitigationEnabled", -[FigVideoCaptureConnectionConfiguration videoGreenGhostMitigationEnabled](self, "videoGreenGhostMitigationEnabled"));
  xpc_dictionary_set_int64(v3, "retainedBufferCount", -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"));
  xpc_dictionary_set_BOOL(v3, "cameraIntrinsicMatrixDeliveryEnabled", -[FigVideoCaptureConnectionConfiguration cameraIntrinsicMatrixDeliveryEnabled](self, "cameraIntrinsicMatrixDeliveryEnabled"));
  xpc_dictionary_set_BOOL(v3, "livePhotoMetadataWritingEnabled", -[FigVideoCaptureConnectionConfiguration livePhotoMetadataWritingEnabled](self, "livePhotoMetadataWritingEnabled"));
  xpc_dictionary_set_BOOL(v3, "stereoVideoCaptureEnabled", -[FigVideoCaptureConnectionConfiguration stereoVideoCaptureEnabled](self, "stereoVideoCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "attachMetadataToVideoBuffers", -[FigVideoCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  return v3;
}

- (BOOL)irisVISEnabled
{
  _BOOL4 v3;

  v3 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](-[FigCaptureConnectionConfiguration irisSinkConfiguration](self, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
  if (v3)
    LOBYTE(v3) = -[FigCaptureSourceVideoFormat isIrisVideoStabilizationSupported](-[FigCaptureSourceConfiguration requiredFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "requiredFormat"), "isIrisVideoStabilizationSupported");
  return v3;
}

- (BOOL)previewDepthDataDeliveryEnabled
{
  return -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](self, "videoPreviewSinkConfiguration"), "depthDataDeliveryEnabled");
}

- ($2825F4736939C4A6D3AD43837233062D)nonRotatedOutputDimensions
{
  int outputWidth;
  _BOOL4 IsExtensionDeviceType;
  int v5;
  _BOOL4 v6;
  int videoStabilizationType_low;
  int v8;
  $2825F4736939C4A6D3AD43837233062D v10;

  outputWidth = self->_outputWidth;
  v10.var0 = self->_outputFormat;
  v10.var1 = outputWidth;
  IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(-[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"));
  v5 = *(_DWORD *)&self->_mirroringEnabled;
  v6 = -[FigCaptureSourceConfiguration sourcePosition](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourcePosition") == 2;
  videoStabilizationType_low = LOBYTE(self->_videoStabilizationType);
  -[FigCaptureSourceConfiguration clientExpectsCameraMountedInLandscapeOrientation](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "clientExpectsCameraMountedInLandscapeOrientation");
  v8 = FigCaptureRotationDegreesFromOrientation(v5, v6, videoStabilizationType_low, IsExtensionDeviceType);
  FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v10, v8);
  return v10;
}

- (uint64_t)_transformWithSourceDimensions:(int)a3 forceSourceDimensions:
{
  int v6;
  _BOOL4 IsExtensionDeviceType;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v14;
  unint64_t v15;

  if (a1)
  {
    v6 = objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration", 0), "sourcePosition");
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration"), "sourceDeviceType"));
    v8 = objc_msgSend(a1, "mirroringEnabled");
    LOBYTE(v14) = v8;
    v9 = objc_msgSend(a1, "outputWidth");
    v10 = objc_msgSend(a1, "outputHeight");
    v15 = __PAIR64__(v10, v9);
    v11 = objc_msgSend(a1, "orientation");
    objc_msgSend((id)objc_msgSend(a1, "sourceConfiguration"), "clientExpectsCameraMountedInLandscapeOrientation");
    v12 = FigCaptureRotationDegreesFromOrientation(v11, v6 == 2, IsExtensionDeviceType, v8);
    HIDWORD(v14) = v12;
    if (v6 == 2
      && (FigCaptureCameraRequires180DegreesRotation(1, IsExtensionDeviceType) & 1) == 0
      && objc_msgSend(a1, "deviceOrientationCorrectionEnabled"))
    {
      v12 -= 180;
      HIDWORD(v14) = v12;
    }
    if (a3 || !v9 || !v10)
    {
      v15 = a2;
      FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v15, v12);
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  return v14;
}

- (FigCaptureVideoTransform)transform
{
  uint64_t v2;
  $470D365275581EF16070F5A11344F73E v3;
  FigCaptureVideoTransform result;

  v2 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, -[FigCaptureSourceFormat dimensions](-[FigCaptureSourceConfiguration requiredFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "requiredFormat"), "dimensions"), 0);
  result.dimensions = v3;
  result.mirrored = v2;
  result.rotationDegrees = HIDWORD(v2);
  return result;
}

- (BOOL)irisSDOFEnabled
{
  return 0;
}

- (FigCaptureVideoTransform)depthDataTransform
{
  uint64_t v2;
  $470D365275581EF16070F5A11344F73E v3;
  FigCaptureVideoTransform result;

  v2 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, -[FigCaptureSourceFormat dimensions](-[FigCaptureSourceConfiguration depthDataFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "depthDataFormat"), "dimensions"), 0);
  result.dimensions = v3;
  result.mirrored = v2;
  result.rotationDegrees = HIDWORD(v2);
  return result;
}

- (BOOL)requiresScalingForInputTransForm:(FigCaptureVideoTransform)a3 nodeName:(id)a4
{
  $470D365275581EF16070F5A11344F73E dimensions;
  int rotationDegrees;
  unint64_t v6;
  int32x2_t v7;
  int32x2_t v8;
  unint64_t v9;
  $470D365275581EF16070F5A11344F73E v11;
  int32x2_t v12;

  dimensions = a3.dimensions;
  rotationDegrees = a3.rotationDegrees;
  v6 = -[FigVideoCaptureConnectionConfiguration transform](self, "transform");
  v8 = v7;
  v9 = HIDWORD(v6);
  v11 = dimensions;
  FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v11, rotationDegrees);
  v12 = v8;
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v12, v9);
  return v11 != *(_QWORD *)&v12;
}

- (FigVideoCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigVideoCaptureConnectionConfiguration *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigVideoCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "outputFormat");
      v4->_outputFormat = xpc_dictionary_get_int64(a3, "outputWidth");
      v4->_outputWidth = xpc_dictionary_get_int64(a3, "outputHeight");
      v4->_outputHeight = xpc_dictionary_get_int64(a3, "videoStabilizationMethod");
      LOBYTE(v4->_videoStabilizationType) = xpc_dictionary_get_BOOL(a3, "mirroringEnabled");
      BYTE1(v4->_videoStabilizationType) = xpc_dictionary_get_BOOL(a3, "physicalMirroringForMovieRecordingEnabled");
      *(_DWORD *)&v4->_mirroringEnabled = xpc_dictionary_get_int64(a3, "orientation");
      LOBYTE(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "deviceOrientationCorrectionEnabled");
      BYTE1(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "zoomSmoothingEnabled");
      BYTE2(v4->_orientation) = xpc_dictionary_get_BOOL(a3, "videoGreenGhostMitigationEnabled");
      *(_DWORD *)&v4->_deviceOrientationCorrectionEnabled = xpc_dictionary_get_int64(a3, "retainedBufferCount");
      LOBYTE(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "cameraIntrinsicMatrixDeliveryEnabled");
      BYTE1(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "livePhotoMetadataWritingEnabled");
      BYTE2(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "stereoVideoCaptureEnabled");
      HIBYTE(v4->_retainedBufferCount) = xpc_dictionary_get_BOOL(a3, "attachMetadataToVideoBuffers");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (FigCaptureVideoTransform)depthDataTransformWithSourceDimensions
{
  uint64_t v2;
  $470D365275581EF16070F5A11344F73E v3;
  FigCaptureVideoTransform result;

  v2 = -[FigVideoCaptureConnectionConfiguration _transformWithSourceDimensions:forceSourceDimensions:](self, -[FigCaptureSourceFormat dimensions](-[FigCaptureSourceConfiguration depthDataFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "depthDataFormat"), "dimensions"), 1);
  result.dimensions = v3;
  result.mirrored = v2;
  result.rotationDegrees = HIDWORD(v2);
  return result;
}

- (BOOL)attachMetadataToVideoBuffers
{
  return HIBYTE(self->_retainedBufferCount);
}

- (void)setAttachMetadataToVideoBuffers:(BOOL)a3
{
  HIBYTE(self->_retainedBufferCount) = a3;
}

- (BOOL)coreMediaFaceTrackingEnabled
{
  return self->_cameraIntrinsicMatrixDeliveryEnabled;
}

- (void)setCoreMediaFaceTrackingEnabled:(BOOL)a3
{
  self->_cameraIntrinsicMatrixDeliveryEnabled = a3;
}

@end
