@implementation BWVisionInferenceAdapter

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", (int)(2 * llroundf((float)((int)objc_msgSend(a2, "width") / 4) * 0.5)));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", (int)(2 * llroundf((float)((int)objc_msgSend(a2, "height") / 4) * 0.5)));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00008);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", &unk_1E4A00020);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v3, "setIncludesInvalidContent:", 1);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_4(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A000C8);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", &unk_1E4A000E0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", objc_msgSend(*(id *)(a1 + 32), "includesInvalidContent"));
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

- (VNProcessingDevice)espressoBasedRequestProcessingDevice
{
  VNProcessingDevice *v3;

  v3 = -[BWVisionInferenceAdapter graphicsProcessingDevice](self, "graphicsProcessingDevice");
  if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
    return -[BWVisionInferenceAdapter neuralProcessingDevice](self, "neuralProcessingDevice");
  else
    return v3;
}

- (BWVisionInferenceAdapter)init
{
  BWVisionInferenceAdapter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWVisionInferenceAdapter;
  v2 = -[BWVisionInferenceAdapter init](&v4, sel_init);
  if (v2)
  {
    v2->_applicationProcessingDevice = (VNProcessingDevice *)(id)objc_msgSend((id)getVNProcessingDeviceClass(), "defaultCPUDevice");
    v2->_graphicsProcessingDevice = (VNProcessingDevice *)(id)objc_msgSend((id)getVNProcessingDeviceClass(), "defaultMetalDevice");
    if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
      v2->_neuralProcessingDevice = (VNProcessingDevice *)(id)objc_msgSend((id)getVNProcessingDeviceClass(), "defaultANEDevice");
  }
  return v2;
}

- (VNProcessingDevice)graphicsProcessingDevice
{
  return self->_graphicsProcessingDevice;
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  BWVisionInferenceProvider *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  id v45;
  unint64_t v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  VNProcessingDevice *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  VNProcessingDevice *v55;
  VNProcessingDevice *v56;
  _BOOL4 v57;
  BWVisionInferenceProvider *v58;
  id v59;
  __CFString *v60;
  int v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  VNProcessingDevice *v66;
  VNProcessingDevice *v67;
  _BOOL4 v68;
  uint64_t v69;
  BWVisionInferenceProvider *v70;
  int v71;
  uint64_t v72;
  void *v74;
  id v75;
  int v76;
  int *v77;
  uint64_t v78;
  int v79;
  id v80;
  id v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  int v85;
  uint64_t v86;
  _QWORD v87[4];

  v10 = *(_QWORD *)&a4.var0;
  v87[2] = *MEMORY[0x1E0C80C00];
  v13 = -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier");
  if (a3 == 803)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_opt_class();
    v19 = a5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v19 = +[BWPhotosCurationInferenceConfiguration configuration](BWPhotosCurationInferenceConfiguration, "configuration");
    v20 = objc_alloc_init((Class)getVNClassifyImageAestheticsRequestClass());
    if (!v20)
      goto LABEL_128;
    v21 = v20;
    v80 = a6;
    objc_msgSend(v20, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    objc_msgSend(v21, "setIoSurfaceMemoryPoolId:", v13);
    objc_msgSend(v18, "addObject:", v21);
    v22 = objc_alloc_init((Class)getVNGenerateAttentionBasedSaliencyImageRequestClass());
    if (!v22)
      goto LABEL_128;
    v23 = v22;
    v77 = a7;
    objc_msgSend(v22, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    objc_msgSend(v23, "setIoSurfaceMemoryPoolId:", v13);
    objc_msgSend(v18, "addObject:", v23);
    v24 = objc_alloc_init((Class)getVNClassifyJunkImageRequestClass());
    if (!v24)
      goto LABEL_127;
    v25 = v24;
    objc_msgSend(v24, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    objc_msgSend(v25, "setIoSurfaceMemoryPoolId:", v13);
    objc_msgSend(v18, "addObject:", v25);
    v26 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
    if (!v26)
      goto LABEL_127;
    v27 = v26;
    v75 = a5;
    objc_msgSend(v26, "setReturnAllResults:", 1);
    objc_msgSend(v27, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    v28 = v13;
    objc_msgSend(v27, "setIoSurfaceMemoryPoolId:", v13);
    objc_msgSend(v18, "addObject:", v27);
    v29 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 == 1)
    {
      v30 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
      if (!v30)
        goto LABEL_127;
      v31 = v30;
      objc_msgSend(v30, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
      objc_msgSend(v31, "setIoSurfaceMemoryPoolId:", v28);
      objc_msgSend(v18, "addObject:", v31);
    }
    else
    {
      v31 = 0;
    }
    v74 = v19;
    if ((int)objc_msgSend(v19, "semanticDevelopmentVersion") < 1)
    {
      v41 = 0;
    }
    else
    {
      v40 = objc_alloc_init((Class)getVN5kJNH3eYuyaLxNpZr5Z7ziClass());
      if (!v40)
        goto LABEL_127;
      v41 = v40;
      objc_msgSend(v40, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
      objc_msgSend(v41, "setIoSurfaceMemoryPoolId:", v28);
      objc_msgSend(v18, "addObject:", v41);
    }
    if (v29 == 1)
    {
      v86 = 0;
      if (!objc_msgSend(v21, "setRevision:error:", 3737841664, &v86)
        || !objc_msgSend(v23, "setRevision:error:", 3737841664, &v86)
        || !objc_msgSend(v27, "setRevision:error:", 3737841667, &v86)
        || !objc_msgSend(v31, "setRevision:error:", 3737841668, &v86)
        || !objc_msgSend(v25, "setRevision:error:", 3737841664, &v86))
      {
        goto LABEL_127;
      }
      if ((int)objc_msgSend(v74, "semanticDevelopmentVersion") < 1)
        goto LABEL_46;
      v42 = v41;
      v43 = 3737841664;
    }
    else
    {
      v86 = 0;
      if (!objc_msgSend(v21, "setRevision:error:", 3737841668, &v86)
        || !objc_msgSend(v23, "setRevision:error:", 3737841668, &v86)
        || !objc_msgSend(v27, "setRevision:error:", 3737841672, &v86)
        || !objc_msgSend(v25, "setRevision:error:", 3737841670, &v86))
      {
        goto LABEL_127;
      }
      if ((int)objc_msgSend(v74, "semanticDevelopmentVersion") < 1)
        goto LABEL_46;
      v43 = 3737841668;
      v42 = v41;
    }
    if ((objc_msgSend(v42, "setRevision:error:", v43, &v86) & 1) == 0)
      goto LABEL_127;
LABEL_46:
    v39 = -[BWVisionInferenceProvider initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:]([BWVisionInferenceProvider alloc], "initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:", v75, v18, 0, 3, objc_msgSend(MEMORY[0x1E0C99E60], "set"), v80);
    -[BWVisionInferenceProvider bindIdealInputForRequest:fromAttachedMediaUsingKey:](v39, "bindIdealInputForRequest:fromAttachedMediaUsingKey:", v27, CFSTR("PrimaryFormat"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v21, CFSTR("VisionAestheticsObservation"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v23, CFSTR("VisionImageSaliencyObservation"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v27, CFSTR("VisionScenePrintObservation"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v31, CFSTR("VisionPCAPrintObservation"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v25, CFSTR("VisionJunkImageClassificationObservation"));
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v41, 0x1E4951138);
    v44 = 0;
    goto LABEL_47;
  }
  if (a3 != 802)
  {
    if (a3 != 801)
    {
      v39 = 0;
      goto LABEL_124;
    }
    if ((v10 & 0xFFFFFFFF0000) != 0)
      goto LABEL_65;
    if (objc_msgSend(a5, "inferenceType") != 801)
      a5 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
    v79 = objc_msgSend(a5, "constellationPointCount");
    v14 = v13;
    v15 = 0;
    v16 = (unsigned __int16)v10;
    v17 = (unsigned __int16)v10;
    switch((__int16)v10)
    {
      case 1:
        break;
      case 2:
        v15 = 0;
        v16 = 2;
        v17 = 2;
        break;
      case 3:
        v15 = 1;
        v16 = 2;
        v17 = 3737841664;
        break;
      case 4:
        v15 = 0;
        v16 = 3;
        v17 = 3;
        break;
      default:
        goto LABEL_65;
    }
    v49 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
    objc_msgSend(v49, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    objc_msgSend(v49, "setModelFileBackingStore:", 2);
    objc_msgSend(v49, "setIoSurfaceMemoryPoolId:", v14);
    if (v15)
    {
      v86 = 0;
      if ((objc_msgSend(v49, "setRevision:error:", 3737841664, &v86) & 1) == 0)
        goto LABEL_65;
    }
    else
    {
      objc_msgSend(v49, "setRevision:", v17);
    }
    if (v49)
    {
      v50 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
      v51 = (v10 & 0xFFFE) != 0
          ? -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"): -[BWVisionInferenceAdapter applicationProcessingDevice](self, "applicationProcessingDevice");
      objc_msgSend(v50, "setProcessingDevice:", v51);
      objc_msgSend(v50, "setModelFileBackingStore:", 2);
      objc_msgSend(v50, "setRevision:", v16);
      objc_msgSend(v50, "setIoSurfaceMemoryPoolId:", v14);
      objc_msgSend(v50, "setRefineMouthRegion:", objc_msgSend(a5, "refinesMouthLandmarks"));
      objc_msgSend(v50, "setRefineLeftEyeRegion:", objc_msgSend(a5, "refinesLeftEyeLandmarks"));
      objc_msgSend(v50, "setRefineRightEyeRegion:", objc_msgSend(a5, "refinesRightEyeLandmarks"));
      objc_msgSend(v50, "setPerformBlinkDetection:", objc_msgSend(a5, "detectsBlinking"));
      objc_msgSend(v50, "setCascadeStepCount:", objc_msgSend(a5, "cascadeStepCount"));
      v52 = v79 == 65 ? 1 : 2 * (v79 == 76);
      objc_msgSend(v50, "setConstellation:", v52);
      if (v50)
      {
        v87[0] = v49;
        v87[1] = v50;
        v53 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
        v54 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v55 = (VNProcessingDevice *)objc_msgSend(v50, "processingDevice");
        if (self)
        {
          v56 = v55;
          v57 = -[BWVisionInferenceAdapter graphicsProcessingDevice](self, "graphicsProcessingDevice") == v55;
          if (-[BWVisionInferenceAdapter neuralProcessingDevice](self, "neuralProcessingDevice") == v56)
            self = (BWVisionInferenceAdapter *)3;
          else
            self = (BWVisionInferenceAdapter *)v57;
        }
        v39 = -[BWVisionInferenceProvider initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:]([BWVisionInferenceProvider alloc], "initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:", a5, v53, 1, self, v54, a6);
        -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v49, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_1);
        if (objc_msgSend(a5, "detectLandmarksInFullSizeInput"))
          -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v50, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_18);
        -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v49, 0x1E4951058);
        v58 = v39;
        v59 = v50;
        v60 = CFSTR("VisionExtendedFaceObservations");
        goto LABEL_123;
      }
    }
LABEL_128:
    v39 = 0;
    v44 = -31702;
    if (!a7)
      return v39;
    goto LABEL_125;
  }
  v32 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a5 = +[BWFaceSegmentsWithLandmarksInferenceConfiguration configuration](BWFaceSegmentsWithLandmarksInferenceConfiguration, "configuration");
  if ((v10 & 0xFFFFFFFF0000) != 0)
  {
LABEL_65:
    v39 = 0;
    v44 = -31782;
    if (!a7)
      return v39;
    goto LABEL_125;
  }
  v33 = 3737841664;
  switch((unsigned __int16)v10)
  {
    case 1u:
      v34 = (void *)v32;
      v35 = v13;
      v81 = a6;
      v37 = 0;
      v76 = 0;
      v33 = (unsigned __int16)v10;
      v36 = 1;
      v78 = 3;
      v38 = 3737841664;
      break;
    case 3u:
      v34 = (void *)v32;
      v35 = v13;
      v81 = a6;
      v38 = 3737841667;
      v33 = 3737841665;
      v36 = 1;
      v37 = 1;
      v78 = 3737841664;
      v76 = 1;
      break;
    case 2u:
      v34 = (void *)v32;
      v35 = v13;
      v81 = a6;
      v36 = 0;
      v37 = 0;
      v76 = 1;
      v38 = 3;
      v78 = 3;
      break;
    default:
      goto LABEL_65;
  }
  v45 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
  objc_msgSend(v45, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  objc_msgSend(v45, "setModelFileBackingStore:", 2);
  objc_msgSend(v45, "setIoSurfaceMemoryPoolId:", v35);
  if (v36)
  {
    v86 = 0;
    if ((objc_msgSend(v45, "setRevision:error:", v38, &v86) & 1) == 0)
      goto LABEL_65;
  }
  else
  {
    objc_msgSend(v45, "setRevision:", v38);
  }
  if (!v45)
    goto LABEL_128;
  objc_msgSend(v34, "addObject:", v45);
  v46 = v35;
  if ((objc_msgSend(a5, "skipFaceLandmarkDetection") & 1) != 0)
  {
    v77 = a7;
    v47 = 0;
    v48 = v34;
  }
  else
  {
    v47 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
    objc_msgSend(v47, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
    objc_msgSend(v47, "setModelFileBackingStore:", 2);
    if (v37)
    {
      v86 = 0;
      v48 = v34;
      if ((objc_msgSend(v47, "setRevision:error:", 3737841664, &v86) & 1) == 0)
        goto LABEL_65;
    }
    else
    {
      objc_msgSend(v47, "setRevision:", v78);
      v48 = v34;
    }
    objc_msgSend(v47, "setRefineMouthRegion:", objc_msgSend(a5, "refinesMouthLandmarks"));
    objc_msgSend(v47, "setRefineLeftEyeRegion:", objc_msgSend(a5, "refinesLeftEyeLandmarks"));
    objc_msgSend(v47, "setRefineRightEyeRegion:", objc_msgSend(a5, "refinesRightEyeLandmarks"));
    objc_msgSend(v47, "setPerformBlinkDetection:", objc_msgSend(a5, "detectsBlinking"));
    objc_msgSend(v47, "setCascadeStepCount:", objc_msgSend(a5, "cascadeStepCount"));
    v61 = objc_msgSend(a5, "constellationPointCount");
    if (v61 == 65)
      v62 = 1;
    else
      v62 = 2 * (v61 == 76);
    objc_msgSend(v47, "setConstellation:", v62);
    objc_msgSend(v47, "setIoSurfaceMemoryPoolId:", v46);
    if (!v47)
      goto LABEL_128;
    v77 = a7;
    objc_msgSend(v48, "addObject:", v47);
  }
  v63 = objc_alloc_init((Class)getVNGenerateFaceSegmentsRequestClass());
  objc_msgSend(v63, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  objc_msgSend(v63, "setModelFileBackingStore:", 2);
  objc_msgSend(v63, "setRevision:", 1);
  objc_msgSend(v63, "setIoSurfaceMemoryPoolId:", v46);
  objc_msgSend(v48, "addObject:", v63);
  if ((objc_msgSend(a5, "skipSkinToneClassification") & 1) != 0)
  {
    v64 = 0;
    goto LABEL_94;
  }
  v64 = objc_alloc_init((Class)getVNClassifyFaceAttributesRequestClass());
  objc_msgSend(v64, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  objc_msgSend(v64, "setModelFileBackingStore:", 2);
  objc_msgSend(v64, "setIoSurfaceMemoryPoolId:", v46);
  v86 = 0;
  if (!objc_msgSend(v64, "setRevision:error:", 3737841664, &v86))
  {
LABEL_98:
    v39 = 0;
    v44 = -31782;
    goto LABEL_47;
  }
  if (!v64)
  {
LABEL_127:
    v39 = 0;
    v44 = -31702;
LABEL_47:
    a7 = v77;
    if (!v77)
      return v39;
    goto LABEL_125;
  }
  objc_msgSend(v48, "addObject:", v64);
LABEL_94:
  if ((objc_msgSend(a5, "skipFoodAndDrinkDetection") & 1) != 0)
  {
    v65 = 0;
    goto LABEL_101;
  }
  v65 = objc_alloc_init((Class)getVNRecognizeFoodAndDrinkRequestClass());
  objc_msgSend(v65, "setProcessingDevice:", -[BWVisionInferenceAdapter espressoBasedRequestProcessingDevice](self, "espressoBasedRequestProcessingDevice"));
  objc_msgSend(v65, "setModelFileBackingStore:", 2);
  objc_msgSend(v65, "setIoSurfaceMemoryPoolId:", v46);
  if (v76)
  {
    v86 = 0;
    if ((objc_msgSend(v65, "setRevision:error:", v33, &v86) & 1) == 0)
      goto LABEL_98;
  }
  else
  {
    objc_msgSend(v65, "setRevision:", v33);
  }
  objc_msgSend(v48, "addObject:", v65);
LABEL_101:
  v66 = (VNProcessingDevice *)objc_msgSend(v63, "processingDevice");
  if (self)
  {
    v67 = v66;
    v68 = -[BWVisionInferenceAdapter graphicsProcessingDevice](self, "graphicsProcessingDevice") == v66;
    if (-[BWVisionInferenceAdapter neuralProcessingDevice](self, "neuralProcessingDevice") == v67)
      v69 = 3;
    else
      v69 = v68;
  }
  else
  {
    v69 = 0;
  }
  v70 = [BWVisionInferenceProvider alloc];
  v39 = -[BWVisionInferenceProvider initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:](v70, "initWithConfiguration:requests:executesRequestsIndividually:executionTarget:preventionReasons:resourceProvider:", a5, v48, 1, v69, objc_msgSend(MEMORY[0x1E0C99E60], "set"), v81);
  if (objc_msgSend(a5, "detectFacesInFullSizeInput"))
    v71 = 1;
  else
    v71 = 4;
  v72 = MEMORY[0x1E0C809B0];
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_2;
  v84[3] = &unk_1E491E6A8;
  v85 = v71;
  v84[4] = a5;
  -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v45, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v84);
  if ((objc_msgSend(a5, "skipFaceLandmarkDetection") & 1) == 0
    && (objc_msgSend(a5, "detectFacesInFullSizeInput") & 1) == 0
    && objc_msgSend(a5, "detectLandmarksInFullSizeInput"))
  {
    v83[0] = v72;
    v83[1] = 3221225472;
    v83[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_3;
    v83[3] = &unk_1E491E6D0;
    v83[4] = a5;
    -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v47, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v83);
  }
  if ((objc_msgSend(a5, "detectFacesInFullSizeInput") & 1) == 0
    && (objc_msgSend(a5, "detectLandmarksInFullSizeInput") & 1) == 0)
  {
    v82[0] = v72;
    v82[1] = 3221225472;
    v82[2] = __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_4;
    v82[3] = &unk_1E491E6D0;
    v82[4] = a5;
    -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v63, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v82);
  }
  if ((objc_msgSend(a5, "skipSkinToneClassification") & 1) == 0)
    -[BWVisionInferenceProvider bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v39, "bindInputForRequest:fromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", v64, CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_38);
  -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v45, CFSTR("VisionFaceDetectionObservations"));
  -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v45, 0x1E4951058);
  if ((objc_msgSend(a5, "skipFaceLandmarkDetection") & 1) == 0)
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v47, 0x1E4951058);
  -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v63, 0x1E4951058);
  if ((objc_msgSend(a5, "skipSkinToneClassification") & 1) == 0)
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v39, "bindOutputForRequest:asMetadataUsingKey:", v64, 0x1E4951158);
  a7 = v77;
  if ((objc_msgSend(a5, "skipFoodAndDrinkDetection") & 1) == 0)
  {
    v60 = CFSTR("VisionFoodAndDrinkObservations");
    v58 = v39;
    v59 = v65;
LABEL_123:
    -[BWVisionInferenceProvider bindOutputForRequest:asMetadataUsingKey:](v58, "bindOutputForRequest:asMetadataUsingKey:", v59, v60);
  }
LABEL_124:
  v44 = 0;
  if (a7)
LABEL_125:
    *a7 = v44;
  return v39;
}

- (VNProcessingDevice)neuralProcessingDevice
{
  return self->_neuralProcessingDevice;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceAdapter;
  -[BWVisionInferenceAdapter dealloc](&v3, sel_dealloc);
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_17(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00038);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", &unk_1E4A00050);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v3, "setIncludesInvalidContent:", 1);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_2(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", objc_msgSend(a2, "width") / (unint64_t)*(unsigned int *)(a1 + 40));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", objc_msgSend(a2, "height") / (unint64_t)*(unsigned int *)(a1 + 40));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00068);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", &unk_1E4A00080);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", objc_msgSend(*(id *)(a1 + 32), "includesInvalidContent"));
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_3(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00098);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", &unk_1E4A000B0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", objc_msgSend(*(id *)(a1 + 32), "includesInvalidContent"));
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

id __99__BWVisionInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_5(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A000F8);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", &unk_1E4A00110);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

- (VNProcessingDevice)applicationProcessingDevice
{
  return self->_applicationProcessingDevice;
}

@end
