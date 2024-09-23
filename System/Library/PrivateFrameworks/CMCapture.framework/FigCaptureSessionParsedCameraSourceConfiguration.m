@implementation FigCaptureSessionParsedCameraSourceConfiguration

- (NSArray)pointCloudDataConnectionConfigurations
{
  return self->_pointCloudDataConnectionConfigurations;
}

- (NSArray)movieFileDetectedObjectMetadataConnectionConfigurations
{
  return self->_movieFileDetectedObjectMetadataConnectionConfigurations;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (NSArray)cameraCalibrationDataConnectionConfigurations
{
  return self->_cameraCalibrationDataConnectionConfigurations;
}

- (NSArray)metadataObjectConnectionConfigurations
{
  return self->_metadataObjectConnectionConfigurations;
}

- (NSArray)previewDerivedConnectionConfigurations
{
  return self->_previewDerivedConnectionConfigurations;
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

- (NSArray)videoDataConnectionConfigurations
{
  return self->_videoDataConnectionConfigurations;
}

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (NSArray)videoCaptureConnectionConfigurations
{
  return self->_videoCaptureConnectionConfigurations;
}

- (NSArray)visionDataConnectionConfigurations
{
  return self->_visionDataConnectionConfigurations;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedCameraSourceConfiguration;
  -[FigCaptureSessionParsedCameraSourceConfiguration dealloc](&v3, sel_dealloc);
}

- (id)initWithConnectionConfigurations:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(int)a4 smartStyleEnabled:(FigVideoCaptureConnectionConfiguration *)a5 sceneClassifierConnectionConfigurationOut:
{
  uint64_t v5;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  unsigned int SourceDeviceType;
  void *v28;
  void *v29;
  void *v30;
  int StillImageNoiseReductionAndFusionScheme;
  int v32;
  FigVideoCaptureConnectionConfiguration *v33;
  unsigned int v34;
  int v35;
  FigVideoCaptureConnectionConfiguration *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  FigVideoCaptureConnectionConfiguration *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  char IsSecureMetadataSource;
  char v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  FigVideoCaptureConnectionConfiguration **v76;
  char v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id obj;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  int v93;
  objc_super v94;
  int v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v94.receiver = a1;
  v94.super_class = (Class)FigCaptureSessionParsedCameraSourceConfiguration;
  v10 = objc_msgSendSuper2(&v94, sel_init);
  if (!v10)
    return 0;
  v11 = v10;
  v76 = a5;
  v77 = a3;
  v78 = a4;
  v93 = 0;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v79 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83 = v11;
  v11[1] = (id)objc_msgSend((id)objc_msgSend(a2, "firstObject"), "sourceConfiguration");
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v15 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v90;
LABEL_5:
    v18 = 0;
    while (2)
    {
      if (*(_QWORD *)v90 != v17)
        objc_enumerationMutation(a2);
      v19 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v18);
      switch(objc_msgSend((id)objc_msgSend(v19, "sinkConfiguration"), "sinkType"))
      {
        case 1u:
          v20 = objc_msgSend(v19, "underlyingDeviceType");
          if (v20 == objc_msgSend((id)objc_msgSend(v19, "sourceConfiguration"), "sourceDeviceType"))
          {
            if (*((_QWORD *)v83 + 2))
            {
              fig_log_get_emitter();
              v75 = v5;
              LODWORD(v74) = 0;
              FigDebugAssert3();
            }
            *((_QWORD *)v83 + 2) = v19;
          }
          objc_msgSend(v12, "addObject:", v19, v74, v75);
          goto LABEL_34;
        case 3u:
          *((_QWORD *)v83 + 6) = v19;
          goto LABEL_34;
        case 4u:
          if (objc_msgSend(v19, "mediaType") == 1986618469)
            goto LABEL_32;
          if (objc_msgSend(v19, "mediaType") == 1835365473
            && FigMetadataItemConnectionConfigurationRequiresObjectDetection(v19))
          {
            objc_msgSend(v13, "addObject:", v19);
            v22 = v79;
            goto LABEL_33;
          }
          goto LABEL_34;
        case 6u:
          v21 = v14;
          goto LABEL_31;
        case 8u:
          v22 = obj;
          goto LABEL_33;
        case 0xAu:
          if (objc_msgSend(v19, "mediaType") == 1986618469)
          {
            *((_QWORD *)v83 + 6) = v19;
            goto LABEL_43;
          }
          if (objc_msgSend(v19, "mediaType") == 1835365473)
          {
            if (!FigMetadataItemConnectionConfigurationRequiresObjectDetection(v19))
              goto LABEL_43;
            v23 = v79;
          }
          else
          {
            if (objc_msgSend(v19, "mediaType") != 1885564004)
              goto LABEL_43;
            v23 = v82;
          }
          objc_msgSend(v23, "addObject:", v19);
LABEL_43:
          if (objc_msgSend((id)objc_msgSend(v19, "irisSinkConfiguration"), "irisMovieCaptureEnabled")
            && objc_msgSend((id)objc_msgSend(v19, "sourceConfiguration"), "sourceDeviceType") != 10)
          {
LABEL_32:
            v22 = v13;
LABEL_33:
            objc_msgSend(v22, "addObject:", v19);
          }
LABEL_34:
          if (v16 != ++v18)
            continue;
          v24 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          v16 = v24;
          if (!v24)
            goto LABEL_47;
          goto LABEL_5;
        case 0xBu:
          if (objc_msgSend(v19, "mediaType") == 1885564004)
            goto LABEL_25;
          *((_QWORD *)v83 + 7) = v19;
          goto LABEL_34;
        case 0xCu:
          v22 = v12;
          goto LABEL_33;
        case 0xDu:
          if (objc_msgSend(v19, "underlyingDeviceType") == 4
            || objc_msgSend(v19, "underlyingDeviceType") == 8
            || objc_msgSend(v19, "underlyingDeviceType") == 9)
          {
            goto LABEL_108;
          }
          v21 = v80;
          goto LABEL_31;
        case 0xFu:
LABEL_25:
          v22 = v82;
          goto LABEL_33;
        case 0x10u:
          v21 = v81;
LABEL_31:
          objc_msgSend(v21, "addObject:", v19);
          goto LABEL_32;
        default:
          goto LABEL_34;
      }
    }
  }
LABEL_47:
  if (objc_msgSend(*((id *)v83 + 1), "spatialOverCaptureEnabled")
    && !objc_msgSend((id)objc_msgSend(*((id *)v83 + 2), "videoPreviewSinkConfiguration"), "primaryCaptureRectModificationEnabled"))
  {
LABEL_108:

    return 0;
  }
  v25 = v83;
  v26 = (void *)*((_QWORD *)v83 + 1);
  v95 = 0;
  SourceDeviceType = FigCaptureSourceGetSourceDeviceType(objc_msgSend(v26, "source"), &v95);
  if (SourceDeviceType <= 0x14 && ((1 << SourceDeviceType) & 0x100420) != 0)
  {
    objc_msgSend(v26, "variableFrameRateVideoCaptureEnabled");
  }
  else
  {
    v34 = SourceDeviceType - 21;
    v35 = objc_msgSend(v26, "variableFrameRateVideoCaptureEnabled");
    if (v34 <= 0xFFFFFFFB && (objc_msgSend(v26, "smartCameraEnabled") | v35) == 1)
    {
      v36 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
      -[FigCaptureConnectionConfiguration setSourceConfiguration:](v36, "setSourceConfiguration:", v26);
      -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v36, "setUnderlyingDeviceType:", objc_msgSend(v26, "sourceDeviceType"));
      -[FigCaptureConnectionConfiguration setSinkConfiguration:](v36, "setSinkConfiguration:", -[FigCaptureInternalSinkConfiguration initWithSinkSubType:]([FigCaptureInternalSinkConfiguration alloc], "initWithSinkSubType:", 1));
      FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v36);
      v37 = 0;
      v38 = 0;
      v39 = 4;
      do
      {
        if ((int)v38 >= 256 && (int)v37 > 255)
          break;
        v38 = ((int)(2
                                 * v39
                                 * vcvtps_s32_f32((float)-[FigVideoCaptureConnectionConfiguration outputWidth](v36, "outputWidth")/ (float)(int)(2 * v39)))/ (int)v39);
        v37 = ((int)(2
                                 * v39
                                 * vcvtps_s32_f32((float)-[FigVideoCaptureConnectionConfiguration outputHeight](v36, "outputHeight")/ (float)(int)(2 * v39)))/ (int)v39);
        v40 = v39 > 3;
        v39 >>= 1;
      }
      while (v40);
      if ((int)v38 < 256 || (int)v37 <= 255)
      {
        v95 = -12782;
      }
      else
      {
        -[FigVideoCaptureConnectionConfiguration setOutputWidth:](v36, "setOutputWidth:", v38);
        -[FigVideoCaptureConnectionConfiguration setOutputHeight:](v36, "setOutputHeight:", v37);
      }
      v25 = v83;
      if (v36)
      {
        if (!v95)
        {
          *v76 = v36;
          objc_msgSend(v12, "addObject:", v36);
        }
      }
    }
  }
  v28 = (void *)*((_QWORD *)v25 + 1);
  v29 = (void *)objc_msgSend(*((id *)v25 + 6), "irisSinkConfiguration");
  v30 = (void *)objc_msgSend(*((id *)v25 + 6), "stillImageSinkConfiguration");
  v95 = 0;
  StillImageNoiseReductionAndFusionScheme = FigCaptureSourceGetStillImageNoiseReductionAndFusionScheme(objc_msgSend(v28, "source"), &v95);
  v32 = v95;
  if (v95)
  {
    fig_log_get_emitter();
    v75 = v5;
    LODWORD(v74) = v32;
    FigDebugAssert3();
  }
  else
  {
    if (StillImageNoiseReductionAndFusionScheme > 2)
      goto LABEL_74;
    if ((objc_msgSend(v28, "smartCameraEnabled") & 1) != 0
      || FigCaptureZeroShutterLagEnabled(v28, v29, v30, v77))
    {
      v33 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
      -[FigCaptureConnectionConfiguration setSourceConfiguration:](v33, "setSourceConfiguration:", v28);
      -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v33, "setUnderlyingDeviceType:", objc_msgSend(v28, "sourceDeviceType"));
      -[FigCaptureConnectionConfiguration setSinkConfiguration:](v33, "setSinkConfiguration:", -[FigCaptureInternalSinkConfiguration initWithSinkSubType:]([FigCaptureInternalSinkConfiguration alloc], "initWithSinkSubType:", 0));
      FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v33);
      goto LABEL_71;
    }
  }
  v33 = 0;
LABEL_71:
  if (v95)
  {
    fig_log_get_emitter();
LABEL_107:
    FigDebugAssert3();
    goto LABEL_108;
  }
  if (v33)
    objc_msgSend(v12, "addObject:", v33);
LABEL_74:
  v41 = (void *)*((_QWORD *)v25 + 1);
  v42 = objc_msgSend(*((id *)v25 + 6), "irisSinkConfiguration", v74, v75);
  v43 = objc_msgSend(*((id *)v25 + 6), "stillImageSinkConfiguration");
  if ((objc_msgSend(v41, "cinematicFramingEnabled") & 1) != 0
    || (v44 = objc_msgSend(v41, "manualCinematicFramingEnabled"), !(v42 | v43))
    || !v78
    || v44)
  {
    v93 = 0;
  }
  else
  {
    v45 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
    -[FigCaptureConnectionConfiguration setSourceConfiguration:](v45, "setSourceConfiguration:", v41);
    -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v45, "setUnderlyingDeviceType:", objc_msgSend(v41, "sourceDeviceType"));
    -[FigCaptureConnectionConfiguration setSinkConfiguration:](v45, "setSinkConfiguration:", -[FigCaptureInternalSinkConfiguration initWithSinkSubType:]([FigCaptureInternalSinkConfiguration alloc], "initWithSinkSubType:", 3));
    FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v45);
    v93 = 0;
    if (v45)
      objc_msgSend(v12, "addObject:", v45);
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v86;
    while (2)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v86 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v51 = objc_msgSend(v50, "underlyingDeviceType");
        v52 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v12, v51);
        if (FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(v50))
        {
          if (v52)
            v53 = v12;
          else
            v53 = v13;
          objc_msgSend(v53, "addObject:", v50);
        }
        v54 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v14, v51);
        if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v50))
          IsSecureMetadataSource = FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v50, "sourceConfiguration"), "source"), &v93);
        else
          IsSecureMetadataSource = 1;
        if (v93)
        {
          fig_log_get_emitter();
          goto LABEL_107;
        }
        if (v54)
          v56 = 1;
        else
          v56 = IsSecureMetadataSource;
        if ((v56 & 1) == 0)
          objc_msgSend(v13, "addObject:", v50);
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      if (v47)
        continue;
      break;
    }
  }
  v57 = v83;
  v58 = (void *)*((_QWORD *)v83 + 7);
  if (!v58)
    goto LABEL_115;
  v59 = objc_msgSend(v58, "underlyingDeviceType");
  v60 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(obj, v59);
  if ((FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v60) & 1) != 0)
    goto LABEL_115;
  if (objc_msgSend((id)objc_msgSend(*((id *)v83 + 7), "sourceConfiguration"), "sourceDeviceType") == 13)
  {
    v61 = *((_QWORD *)v83 + 7);
  }
  else
  {
    v62 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v12, v59);
    v63 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v13, v59);
    v61 = *((_QWORD *)v83 + 7);
    if (v62 || !v63)
    {
      v64 = v12;
      goto LABEL_114;
    }
  }
  v64 = v13;
LABEL_114:
  objc_msgSend(v64, "addObject:", v61);
LABEL_115:
  v65 = objc_msgSend(v12, "count");
  if (v65)
    v65 = objc_msgSend(v12, "copy");
  *((_QWORD *)v83 + 3) = v65;
  v66 = objc_msgSend(v13, "count");
  if (v66)
    v66 = objc_msgSend(v13, "copy");
  *((_QWORD *)v83 + 4) = v66;
  v67 = objc_msgSend(v14, "count");
  if (v67)
    v67 = objc_msgSend(v14, "copy");
  *((_QWORD *)v83 + 5) = v67;
  v68 = objc_msgSend(v80, "count");
  if (v68)
    v68 = objc_msgSend(v80, "copy");
  *((_QWORD *)v83 + 8) = v68;
  v69 = objc_msgSend(obj, "count");
  if (v69)
    v69 = objc_msgSend(obj, "copy");
  *((_QWORD *)v83 + 9) = v69;
  v70 = objc_msgSend(v79, "count");
  if (v70)
    v70 = objc_msgSend(v79, "copy");
  *((_QWORD *)v83 + 10) = v70;
  v71 = objc_msgSend(v82, "count");
  if (v71)
    v71 = objc_msgSend(v82, "copy");
  *((_QWORD *)v83 + 11) = v71;
  v72 = objc_msgSend(v81, "count");
  if (v72)
    v72 = objc_msgSend(v81, "copy");
  *((_QWORD *)v83 + 12) = v72;
  return v57;
}

@end
