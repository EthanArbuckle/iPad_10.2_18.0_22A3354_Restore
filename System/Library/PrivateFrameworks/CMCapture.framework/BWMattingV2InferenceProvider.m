@implementation BWMattingV2InferenceProvider

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (NSArray)cloneVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (!self->_lowResSegmentationCloneOutputVideoRequirement)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3[0] = self->_lowResSegmentationCloneOutputVideoRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", -[BWMattingV2InferenceProvider executionTarget](self, "executionTarget"));
}

- (int)executionTarget
{
  return 1;
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  int v4;
  unsigned int v5;
  float v7;
  unint64_t v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  v4 = objc_msgSend(a2, "width");
  v5 = objc_msgSend(a2, "height");
  LODWORD(a2) = v5;
  v7 = *(float *)(a1 + 32);
  if (v7 != 0.0)
  {
    v8 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v4 | ((unint64_t)v5 << 32), v7);
    v4 = v8;
    a2 = (void *)HIDWORD(v8);
  }
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", (unint64_t)(float)((float)v4 / *(float *)(a1 + 36)));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", (unint64_t)(float)((float)(int)a2 / *(float *)(a1 + 36)));
  if (*(_BYTE *)(a1 + 40))
    v9 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", CFSTR("Matting"));
  else
    v9 = 0;
  -[BWInferenceVideoFormatRequirements setCropDescriptor:](v3, "setCropDescriptor:", v9);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00EF0);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v11[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
}

- (BWMattingV2InferenceProvider)initWithConfiguration:(id)a3
{
  BWMattingV2InferenceProvider *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  float v7;
  int v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;
  BWInferenceLazyVideoRequirement *v15;
  uint64_t v16;
  BWInferenceLazyVideoRequirement *v17;
  BWInferenceLazyVideoRequirement *v18;
  __int16 v19;
  void *v20;
  void *v21;
  BWInferenceVideoFormatRequirements *v22;
  BWInferenceVideoRequirement *v23;
  BWInferenceLazyVideoRequirement *v24;
  uint64_t v25;
  BWInferenceLazyVideoRequirement *v26;
  uint64_t v27;
  BWInferenceCloneVideoRequirement *v28;
  BWInferenceVideoFormatRequirements *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  __CFString *v37;
  const __CFString *v38;
  BWInferenceVideoRequirement *v39;
  BWInferenceLazyVideoRequirement *v40;
  BWInferenceLazyVideoRequirement *v41;
  BWInferenceMetadataRequirement *v42;
  uint64_t v43;
  __int16 v45;
  NSMutableArray *v46;
  NSMutableArray *v47;
  id v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  _QWORD v51[4];
  int v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  int v59;
  _QWORD v60[4];
  int v61;
  int v62;
  _QWORD v63[4];
  int v64;
  int v65;
  char v66;
  objc_super v67;
  __CFString *v68;
  _BYTE v69[128];
  BWInferenceVideoFormatRequirements *v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)BWMattingV2InferenceProvider;
  v4 = -[BWMattingV2InferenceProvider init](&v67, sel_init);
  if (!v4)
    return v4;
  v50 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a3 || (objc_msgSend(a3, "mainImageDownscalingFactor"), v7 == 0.0))
  {
LABEL_21:

    return 0;
  }
  v4->_sensorConfigurationsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "sensorConfigurationsByPortType");
  v8 = -[FigCaptureCameraParameters mattingVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "mattingVersion");
  if (!v8)
  {
    v9 = -[NSArray firstObject](-[NSDictionary allValues](v4->_sensorConfigurationsByPortType, "allValues"), "firstObject");
    v8 = -[FigCaptureCameraParameters mattingVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "mattingVersionForPortType:sensorIDString:", objc_msgSend(v9, "portType"), objc_msgSend(v9, "sensorIDString"));
  }
  v4->_mattingProcessorVersion = v8;
  v4->_mattingTuningConfiguration = objc_msgSend(a3, "tuningConfiguration");
  v4->_submitWithoutSynchronization = objc_msgSend(a3, "submitWithoutSynchronization");
  v4->_appliesFinalCropRect = objc_msgSend(a3, "appliesFinalCropRect");
  objc_msgSend(a3, "mainImageDownscalingFactor");
  v11 = v10;
  objc_msgSend(a3, "targetAspectRatio");
  v13 = v12;
  v14 = objc_msgSend(a3, "appliesFinalCropRect");
  v15 = [BWInferenceLazyVideoRequirement alloc];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke;
  v63[3] = &__block_descriptor_41_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
  v64 = v13;
  v65 = v11;
  v66 = v14;
  v16 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v15, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v63);
  v4->_primaryFormatInputVideoRequirement = (BWInferenceVideoRequirement *)v16;
  -[NSMutableArray addObject:](v50, "addObject:", v16);
  if (objc_msgSend(a3, "depthDataDeliveryEnabled"))
  {
    v17 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("Depth"), CFSTR("Depth"), &__block_literal_global_68);
    v4->_depthInputVideoRequirement = &v17->super;
    -[NSMutableArray addObject:](v50, "addObject:", v17);
    v18 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("Depth"), CFSTR("Depth"), &__block_literal_global_15);
    v4->_disparityInputVideoRequirement = &v18->super;
    -[NSMutableArray addObject:](v50, "addObject:", v18);
  }
  v19 = objc_msgSend(a3, "enabledMattes");
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = v20;
  if ((v19 & 4) != 0)
  {
    objc_msgSend(v20, "addObject:", &unk_1E49FA470);
    if ((v19 & 8) == 0)
    {
LABEL_10:
      if ((v19 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_37;
    }
  }
  else if ((v19 & 8) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v21, "addObject:", &unk_1E49FA488);
  if ((v19 & 0x10) == 0)
  {
LABEL_11:
    if ((v19 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v21, "addObject:", &unk_1E49FA4A0);
  if ((v19 & 0x20) == 0)
  {
LABEL_12:
    if ((v19 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_38:
  objc_msgSend(v21, "addObject:", &unk_1E49FA4B8);
  if ((v19 & 0x40) != 0)
LABEL_13:
    objc_msgSend(v21, "addObject:", &unk_1E49FA4D0);
LABEL_14:
  v4->_enabledSemanticMattingOutputTypes = (NSArray *)objc_msgSend(v21, "copy");
  if ((v19 & 2) != 0)
  {
    v22 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v22, "setWidth:", 512);
    -[BWVideoFormatRequirements setHeight:](v22, "setHeight:", 384);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v22, "setSupportedPixelFormats:", &unk_1E4A00F50);
    -[BWInferenceVideoFormatRequirements setDeviceOriented:](v22, "setDeviceOriented:", 0);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v22, "setBytesPerRowAlignment:", 64);
    v71[0] = v22;
    v23 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E49511B8, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1)));
    v4->_segmentationInputVideoRequirement = v23;
    -[NSMutableArray addObject:](v50, "addObject:", v23);
    v24 = [BWInferenceLazyVideoRequirement alloc];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_30;
    v60[3] = &__block_descriptor_40_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
    v61 = v11;
    v62 = v13;
    v25 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v24, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E495AF38, CFSTR("PrimaryFormat"), v60);
    v4->_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement *)v25;
    -[NSMutableArray addObject:](v49, "addObject:", v25);
    if (objc_msgSend(a3, "depthDataDeliveryEnabled") && (v19 & 1) != 0)
    {
      v26 = [BWInferenceLazyVideoRequirement alloc];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_2;
      v58[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      v59 = v11;
      v27 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v26, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E495AF58, CFSTR("PrimaryFormat"), v58);
      v4->_refinedDepthOutputVideoRequirement = (BWInferenceVideoRequirement *)v27;
      -[NSMutableArray addObject:](v49, "addObject:", v27);
    }
    if ((v19 & 0x80) != 0)
    {
      v28 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", 0x1E495B0D8, v4->_segmentationInputVideoRequirement);
      v4->_lowResSegmentationCloneOutputVideoRequirement = v28;
      if (!v28
        || VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v4->_lowResSegmentationCloneCopySession))
      {
        goto LABEL_21;
      }
    }
  }
  v45 = v19;
  v46 = v6;
  v47 = v5;
  v48 = a3;
  v29 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v29, "setWidth:", 512);
  -[BWVideoFormatRequirements setHeight:](v29, "setHeight:", 384);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v29, "setSupportedPixelFormats:", &unk_1E4A00F80);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v29, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v29, "setBytesPerRowAlignment:", 64);
  v70 = v29;
  v30 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1));
  v4->_semanticMatteInputVideoRequirementsByMattingOutputType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4->_semanticMatteOutputVideoRequirementsByMattingOutputType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v31 = objc_msgSend(&unk_1E4A00F38, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v55 != v33)
          objc_enumerationMutation(&unk_1E4A00F38);
        v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (-[NSArray containsObject:](v4->_enabledSemanticMattingOutputTypes, "containsObject:", v35))
        {
          v36 = objc_msgSend(v35, "intValue");
          v37 = mv2ip_inputAttachedMediaKeyForMattingOutputType(v36);
          v38 = mv2ip_outputAttachedMediaKeyForMattingOutputType(v36);
          v39 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", v37, v30);
          -[NSMutableArray addObject:](v50, "addObject:", v39);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_semanticMatteInputVideoRequirementsByMattingOutputType, "setObject:forKeyedSubscript:", v39, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36));

          v40 = [BWInferenceLazyVideoRequirement alloc];
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_3;
          v51[3] = &__block_descriptor_40_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
          v52 = v11;
          v53 = v13;
          v41 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v40, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", v38, CFSTR("PrimaryFormat"), v51);
          -[NSMutableArray addObject:](v49, "addObject:", v41);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_semanticMatteOutputVideoRequirementsByMattingOutputType, "setObject:forKeyedSubscript:", v41, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36));

        }
      }
      v32 = objc_msgSend(&unk_1E4A00F38, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v32);
  }
  if ((v45 & 0x100) != 0)
  {
    v42 = [BWInferenceMetadataRequirement alloc];
    v68 = CFSTR("MattedMasksContainValidContent");
    v43 = -[BWInferenceMetadataRequirement initWithMetadataKeys:](v42, "initWithMetadataKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1));
    v4->_outputMasksContainsValidContentRequirement = (BWInferenceMetadataRequirement *)v43;
    -[NSMutableArray addObject:](v46, "addObject:", v43);
  }
  v4->_inputVideoRequirements = v50;
  v4->_outputVideoRequirements = v49;
  v4->_inputMetadataRequirements = v47;
  v4->_outputMetadataRequirements = v46;
  v4->_metalCommandQueue = (MTLCommandQueue *)(id)objc_msgSend(v48, "metalCommandQueue");
  v4->_sdofRenderingTuningParameters = (NSDictionary *)(id)objc_msgSend(v48, "sdofRenderingTuningParameters");
  return v4;
}

+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3
{
  return mv2ip_inputAttachedMediaKeyForMattingOutputType(a3);
}

+ (void)initialize
{
  objc_opt_class();
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_10(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00F08);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_14(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00F20);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_30(uint64_t a1, void *a2)
{
  return mv2ip_outputMatteInferenceVideoFormat(a2, *(float *)(a1 + 32), *(float *)(a1 + 36));
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "width") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "height") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00F68);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  return mv2ip_outputMatteInferenceVideoFormat(a2, *(float *)(a1 + 32), *(float *)(a1 + 36));
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *lowResSegmentationCloneCopySession;
  objc_super v4;

  -[FigMatting finishProcessing](self->_mattingProcessor, "finishProcessing");
  lowResSegmentationCloneCopySession = self->_lowResSegmentationCloneCopySession;
  if (lowResSegmentationCloneCopySession)
    CFRelease(lowResSegmentationCloneCopySession);

  v4.receiver = self;
  v4.super_class = (Class)BWMattingV2InferenceProvider;
  -[BWMattingV2InferenceProvider dealloc](&v4, sel_dealloc);
}

- (int)type
{
  return 201;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

- (id)newStorage
{
  NSArray *v3;
  void *v4;
  void *v5;

  v3 = -[BWMattingV2InferenceProvider cloneVideoRequirements](self, "cloneVideoRequirements");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "addObjectsFromArray:", self->_inputVideoRequirements);
  objc_msgSend(v4, "addObjectsFromArray:", self->_outputVideoRequirements);
  if (-[NSArray count](v3, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v3);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v5, "addObjectsFromArray:", self->_outputVideoRequirements);
  if (-[NSArray count](v3, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v3);
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:]([BWMattingInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v4, v5);
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  _DWORD *v4;
  int v5;

  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!self->_mattingProcessor
    && (-[BWMattingV2InferenceProvider _loadMattingProcessor]((uint64_t)self)
     || -[BWMattingV2InferenceProvider _configureMattingProcessor](self)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v5 = -31702;
  }
  else
  {
    v5 = 0;
  }
  if (*v4 == 1)
    kdebug_trace();
  return v5;
}

- (uint64_t)_loadMattingProcessor
{
  uint64_t v2;

  if (!a1)
    return 0;
  if (BWLoadProcessorBundle((uint64_t)CFSTR("Matting"), *(unsigned int *)(a1 + 24)))
  {
    v2 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("FigMatting"))), "initWithCommandQueue:", *(_QWORD *)(a1 + 168));
    *(_QWORD *)(a1 + 16) = v2;
    if (v2)
      return 0;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return FigSignalErrorAt();
}

- (_QWORD)_configureMattingProcessor
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  _DWORD v29[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[BWMattingV2InferenceProvider _processorOptions](result);
    if (!v2)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return (_QWORD *)FigSignalErrorAt();
    }
    objc_msgSend((id)v1[2], "setOptions:", v2);
    v3 = objc_msgSend((id)v1[9], "videoFormat");
    if (!v3)
      goto LABEL_33;
    v4 = (void *)v3;
    v5 = (void *)v1[10];
    if (v5)
    {
      v6 = (void *)objc_msgSend(v5, "videoFormat");
      if (!v6)
      {
LABEL_33:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)v1[12];
    if (v7)
    {
      v8 = (void *)objc_msgSend(v7, "videoFormat");
      if (!v8)
        goto LABEL_33;
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)v1[16];
    v10 = (v1[15] != 0) | (2 * (v1[13] != 0));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v28 = v4;
      v13 = *(_QWORD *)v31;
LABEL_14:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        result = (_QWORD *)objc_msgSend((id)objc_msgSend((id)v1[17], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "intValue"))), "videoFormat");
        if (!result)
          break;
        v8 = result;
        v16 = objc_msgSend(v15, "intValue");
        v17 = 0;
        if (v16 > 15)
        {
          if (v16 == 16 || v16 == 32 || v16 == 64)
LABEL_20:
            v17 = v16;
        }
        else
        {
          switch(v16)
          {
            case 1:
            case 2:
            case 4:
            case 8:
              goto LABEL_20;
            default:
              break;
          }
        }
        v10 |= v17;
        if (v12 == ++v14)
        {
          v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          v12 = v18;
          if (!v18)
          {
            v4 = v28;
            goto LABEL_29;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_29:
      v19 = objc_msgSend(v4, "width");
      v20 = objc_msgSend(v4, "height");
      v21 = objc_msgSend(v6, "width");
      v22 = objc_msgSend(v6, "height");
      v23 = objc_msgSend(v8, "width");
      v24 = objc_msgSend(v8, "height");
      v25 = *((_DWORD *)v1 + 7);
      v26 = (void *)v1[2];
      v29[0] = v19;
      v29[1] = v20;
      v29[2] = v21;
      v29[3] = v22;
      v29[4] = v23;
      v29[5] = v24;
      v29[6] = v10;
      v29[7] = v25;
      objc_msgSend(v26, "setConfig:", v29);
      v27 = objc_msgSend((id)v1[2], "prepareToProcess:", 0);
      result = 0;
      if (v27)
        return (_QWORD *)FigSignalErrorAt();
    }
  }
  return result;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  _DWORD *v11;
  id v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGSize v17;
  const __CFDictionary *v18;
  uint64_t v19;
  __CVBuffer *v20;
  void *v21;
  BWInferenceVideoRequirement *refinedDepthOutputVideoRequirement;
  void *v23;
  __CVBuffer *v24;
  BWInferenceCloneVideoRequirement *lowResSegmentationCloneOutputVideoRequirement;
  uint64_t v26;
  NSArray *enabledSemanticMattingOutputTypes;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  __CVBuffer *v44;
  uint64_t v45;
  MTLCommandQueue *metalCommandQueue;
  void *v47;
  char v48;
  __CVBuffer *destinationBuffer;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  __CVBuffer *v56;
  id v57;
  _QWORD v58[5];
  _QWORD v59[2];
  uint64_t (*v60)(uint64_t);
  void *v61;
  BWMattingV2InferenceProvider *v62;
  id v63;
  int v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CGRect rect;
  __CFString *v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = (double *)MEMORY[0x1E0C9D628];
  if (!self->_mattingProcessor)
    goto LABEL_75;
  v14 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_primaryFormatInputVideoRequirement);
  if (v14)
  {
    if (self->_depthInputVideoRequirement)
    {
      v15 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v15)
      {
LABEL_75:
        v26 = FigSignalErrorAt();
        LOBYTE(v14) = 0;
        goto LABEL_67;
      }
    }
    else
    {
      v15 = 0;
    }
    if (self->_disparityInputVideoRequirement)
    {
      v16 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v16)
        goto LABEL_75;
    }
    else
    {
      v16 = 0;
    }
    v17 = (CGSize)*((_OWORD *)v13 + 1);
    rect.origin = *(CGPoint *)v13;
    rect.size = v17;
    if (self->_refinedDepthOutputVideoRequirement)
    {
      v18 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08798], 0);
      if (!v18 || !CGRectMakeWithDictionaryRepresentation(v18, &rect))
        goto LABEL_75;
    }
    if (self->_segmentationInputVideoRequirement)
    {
      v19 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v19)
        goto LABEL_75;
      v20 = (__CVBuffer *)v19;
      v21 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)self->_segmentationOutputVideoRequirement, a4, 1);
      if (!v21)
        goto LABEL_75;
      v54 = v21;
      refinedDepthOutputVideoRequirement = self->_refinedDepthOutputVideoRequirement;
      if (refinedDepthOutputVideoRequirement)
      {
        v23 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)refinedDepthOutputVideoRequirement, a4, 0);
        if (!v23)
          goto LABEL_75;
      }
      else
      {
        v23 = 0;
      }
      v53 = v23;
      lowResSegmentationCloneOutputVideoRequirement = self->_lowResSegmentationCloneOutputVideoRequirement;
      if (lowResSegmentationCloneOutputVideoRequirement)
      {
        v24 = (__CVBuffer *)-[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)lowResSegmentationCloneOutputVideoRequirement, a4, 1);
        if (!v24 || !self->_lowResSegmentationCloneCopySession)
        {
          LOBYTE(v14) = 0;
          v26 = 0;
          goto LABEL_67;
        }
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
      v53 = 0;
      v54 = 0;
      v20 = 0;
    }
    v51 = v16;
    v52 = v15;
    destinationBuffer = v24;
    v55 = a7;
    v56 = v20;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    enabledSemanticMattingOutputTypes = self->_enabledSemanticMattingOutputTypes;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](enabledSemanticMattingOutputTypes, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v70;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v70 != v30)
            objc_enumerationMutation(enabledSemanticMattingOutputTypes);
          v32 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "intValue");
          v33 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_semanticMatteInputVideoRequirementsByMattingOutputType, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32)));
          if (!v33
            || (objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32)), (v34 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, -[NSMutableDictionary objectForKeyedSubscript:](self->_semanticMatteOutputVideoRequirementsByMattingOutputType, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32)), a4, 1)) == 0))
          {
            LOBYTE(v14) = 0;
            v26 = 4294935578;
            goto LABEL_61;
          }
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v34, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32));
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](enabledSemanticMattingOutputTypes, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        if (v29)
          continue;
        break;
      }
    }
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (self->_outputMasksContainsValidContentRequirement)
    {
      v36 = v35;
      if (v20)
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", mv2ip_pixelBufferContainsValidContent(v20)), 0x1E495AF38);
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v66 != v39)
              objc_enumerationMutation(v12);
            v41 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            v42 = mv2ip_outputAttachedMediaKeyForMattingOutputType(objc_msgSend(v41, "intValue"));
            if (v42)
            {
              v43 = v42;
              v44 = (__CVBuffer *)objc_msgSend(v12, "objectForKeyedSubscript:", v41);
              if (v44)
                objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", mv2ip_pixelBufferContainsValidContent(v44)), v43);
            }
          }
          v38 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        }
        while (v38);
      }
      if (objc_msgSend(v36, "count"))
      {
        v74 = CFSTR("MattedMasksContainValidContent");
        v75 = v36;
        objc_msgSend(a4, "setDictionary:forMetadataRequirement:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1), self->_outputMasksContainsValidContentRequirement);
      }
    }
    -[FigMatting setImagePixelBuffer:](self->_mattingProcessor, "setImagePixelBuffer:", v14);
    -[FigMatting setInputDepthPixelBuffer:](self->_mattingProcessor, "setInputDepthPixelBuffer:", v52);
    -[FigMatting setInputDisparityPixelBuffer:](self->_mattingProcessor, "setInputDisparityPixelBuffer:", v51);
    -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    -[FigMatting setInputSegmentationPixelBuffer:](self->_mattingProcessor, "setInputSegmentationPixelBuffer:", v56);
    -[FigMatting setOutputMattePixelBuffer:](self->_mattingProcessor, "setOutputMattePixelBuffer:", v54);
    -[FigMatting setOutputRefinedDisparityPixelBuffer:](self->_mattingProcessor, "setOutputRefinedDisparityPixelBuffer:", v53);
    -[FigMatting setInputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setInputSemanticsHairPixelBuffer:", objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E49FA470));
    -[FigMatting setInputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkinPixelBuffer:", objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E49FA488));
    -[FigMatting setInputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setInputSemanticsTeethPixelBuffer:", objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E49FA4A0));
    -[FigMatting setInputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setInputSemanticsGlassesPixelBuffer:", objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E49FA4B8));
    -[FigMatting setInputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkyPixelBuffer:", objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E49FA4D0));
    -[FigMatting setOutputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsHairPixelBuffer:", objc_msgSend(v57, "objectForKeyedSubscript:", &unk_1E49FA470));
    -[FigMatting setOutputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkinPixelBuffer:", objc_msgSend(v57, "objectForKeyedSubscript:", &unk_1E49FA488));
    -[FigMatting setOutputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsTeethPixelBuffer:", objc_msgSend(v57, "objectForKeyedSubscript:", &unk_1E49FA4A0));
    -[FigMatting setOutputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsGlassesPixelBuffer:", objc_msgSend(v57, "objectForKeyedSubscript:", &unk_1E49FA4B8));
    -[FigMatting setOutputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkyPixelBuffer:", objc_msgSend(v57, "objectForKeyedSubscript:", &unk_1E49FA4D0));
    if (-[FigMatting process](self->_mattingProcessor, "process"))
    {
      v26 = FigSignalErrorAt();
      LOBYTE(v14) = 0;
LABEL_61:
      a7 = v55;
      v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      v13 = (double *)MEMORY[0x1E0C9D628];
    }
    else
    {
      a7 = v55;
      v13 = (double *)MEMORY[0x1E0C9D628];
      if (destinationBuffer
        && v56
        && VTPixelTransferSessionTransferImage(self->_lowResSegmentationCloneCopySession, v56, destinationBuffer))
      {
        LOBYTE(v14) = 0;
        v26 = 4294935586;
      }
      else
      {
        v45 = MEMORY[0x1E0C809B0];
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v60 = __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
        v61 = &unk_1E4923840;
        v64 = 0;
        v62 = self;
        v63 = v55;
        if (self->_submitWithoutSynchronization)
        {
          __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke((uint64_t)v59);
        }
        else
        {
          metalCommandQueue = self->_metalCommandQueue;
          if (metalCommandQueue)
          {
            v47 = (void *)-[MTLCommandQueue commandBuffer](metalCommandQueue, "commandBuffer");
            objc_msgSend(v47, "setLabel:", CFSTR("inference_matting_async_completion"));
            v58[0] = v45;
            v58[1] = 3221225472;
            v58[2] = __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2;
            v58[3] = &unk_1E4922398;
            v58[4] = v59;
            objc_msgSend(v47, "addScheduledHandler:", v58);
            objc_msgSend(v47, "commit");
          }
          else
          {
            -[FigMatting finishScheduling](self->_mattingProcessor, "finishScheduling");
            v60((uint64_t)v59);
          }
        }
        v26 = 0;
        LOBYTE(v14) = 1;
      }
      v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
  }
  else
  {
    v26 = FigSignalErrorAt();
  }
LABEL_67:
  -[FigMatting setImagePixelBuffer:](self->_mattingProcessor, "setImagePixelBuffer:", 0);
  -[FigMatting setInputDepthPixelBuffer:](self->_mattingProcessor, "setInputDepthPixelBuffer:", 0);
  -[FigMatting setInputDisparityPixelBuffer:](self->_mattingProcessor, "setInputDisparityPixelBuffer:", 0);
  -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *v13, v13[1], v13[2], v13[3]);
  -[FigMatting setFaceLandmarks:](self->_mattingProcessor, "setFaceLandmarks:", 0);
  -[FigMatting setFaceSegments:](self->_mattingProcessor, "setFaceSegments:", 0);
  -[FigMatting setExifOrientation:](self->_mattingProcessor, "setExifOrientation:", 0);
  -[FigMatting setInputSegmentationPixelBuffer:](self->_mattingProcessor, "setInputSegmentationPixelBuffer:", 0);
  -[FigMatting setOutputMattePixelBuffer:](self->_mattingProcessor, "setOutputMattePixelBuffer:", 0);
  -[FigMatting setOutputRefinedDisparityPixelBuffer:](self->_mattingProcessor, "setOutputRefinedDisparityPixelBuffer:", 0);
  -[FigMatting setInputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setInputSemanticsHairPixelBuffer:", 0);
  -[FigMatting setInputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkinPixelBuffer:", 0);
  -[FigMatting setInputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setInputSemanticsTeethPixelBuffer:", 0);
  -[FigMatting setInputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setInputSemanticsGlassesPixelBuffer:", 0);
  -[FigMatting setInputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkyPixelBuffer:", 0);
  -[FigMatting setOutputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsHairPixelBuffer:", 0);
  -[FigMatting setOutputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkinPixelBuffer:", 0);
  -[FigMatting setOutputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsTeethPixelBuffer:", 0);
  -[FigMatting setOutputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsGlassesPixelBuffer:", 0);
  -[FigMatting setOutputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkyPixelBuffer:", 0);

  if (*v11 == 1)
    kdebug_trace();
  if (a7)
    v48 = v14;
  else
    v48 = 1;
  if ((v48 & 1) == 0)
    (*((void (**)(id, uint64_t, BWMattingV2InferenceProvider *))a7 + 2))(a7, v26, self);
  return v26;
}

- (void)_outputPixelBufferForOutputVideoRequirement:(void *)a3 storage:(int)a4 isMatte:
{
  void *v7;

  if (!a1)
    return 0;
  v7 = (void *)objc_msgSend(a3, "pixelBufferForRequirement:", a2);
  if (!v7)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a2), "newPixelBuffer");
    objc_msgSend(a3, "setPixelBuffer:forRequirement:", v7, a2);
    if (v7)
      CFRelease(v7);
  }
  if (a4)
    CVBufferSetAttachment((CVBufferRef)v7, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
  return v7;
}

uint64_t __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  _DWORD *v10;
  NSMutableArray *outputMetadataRequirements;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[BWMattingV2InferenceProvider propagateMattingOutputToSampleBuffer:storage:](self, a6, a4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(outputMetadataRequirements);
        v16 = (void *)objc_msgSend(a4, "newMetadataDictionarySatisfyingRequirement:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
        objc_msgSend(a3, "addEntriesFromDictionary:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }
  if (*v10 == 1)
    kdebug_trace();
}

- (void)propagateMattingOutputToSampleBuffer:(void *)a3 storage:
{
  _QWORD *v4;
  CFStringRef *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  unint64_t v10;
  const __CFString *v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  __int128 v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unint64_t v57;
  void *v58;
  const void *v59;
  CFTypeRef cf;
  const void *v61;
  void *v62;
  id obj;
  unsigned int v65;
  uint64_t v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = a1;
  v5 = (CFStringRef *)MEMORY[0x1E0D05CB0];
  if (!a1[13])
  {
    cf = 0;
    v61 = 0;
    v62 = 0;
    goto LABEL_17;
  }
  BWSampleBufferRemoveAttachedMedia(a2, 0x1E49511B8);
  v6 = objc_msgSend(a3, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", v4[13], a2);
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return;
  }
  v7 = (void *)v6;
  v8 = (unsigned __int16)(*((_DWORD *)v4 + 6) - 1) | 0x10000u;
  v77 = *MEMORY[0x1E0D08660];
  v78[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
  CMSetAttachment(v7, (CFStringRef)*MEMORY[0x1E0D08730], v9, 1u);
  if (*((_BYTE *)v4 + 33))
  {
    v10 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
    v11 = *v5;
    CMGetAttachment(a2, *v5, 0);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v72 = *MEMORY[0x1E0C9D628];
    v73 = v15;
    v16 = v14;
    v17 = v13;
    v18 = v12;
    v19 = *(double *)&v72;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v72, *((double *)&v72 + 1), *(double *)&v73, *((double *)&v73 + 1));
      v19 = v20;
      v18 = v21;
      v17 = v22;
      v16 = v23;
    }
    v24 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)v7);
    v25 = (void *)CMGetAttachment(v7, v11, 0);
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v25, v10, v24, v19, v18, v17, v16, *(double *)&v72, v12, v13, v14);
  }
  BWSampleBufferSetAttachedMedia(a2, 0x1E495AF38, (uint64_t)v7);
  v26 = a1[15];
  if (v26)
  {
    v27 = (const void *)objc_msgSend(a3, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", v26, a2);
    if (!v27)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_39;
    }
    BWSampleBufferSetAttachedMedia(a2, 0x1E495AF58, (uint64_t)v27);
  }
  else
  {
    v27 = 0;
  }
  v4 = a1;
  v28 = a1[14];
  v61 = v27;
  v62 = v7;
  if (!v28)
  {
    cf = 0;
LABEL_17:
    v30 = *((_DWORD *)v4 + 6);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = (id)v4[16];
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v31)
    {
      v32 = v31;
      v65 = (unsigned __int16)(v30 - 2) | 0x10000;
      v66 = *(_QWORD *)v69;
      v33 = *MEMORY[0x1E0D08770];
      v34 = (const __CFString *)*MEMORY[0x1E0D08738];
      v35 = *v5;
      v36 = *MEMORY[0x1E0C9D628];
      v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v38 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      do
      {
        v40 = 0;
        v41 = a1;
        do
        {
          if (*(_QWORD *)v69 != v66)
            objc_enumerationMutation(obj);
          v42 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v40), "intValue");
          v43 = mv2ip_inputAttachedMediaKeyForMattingOutputType(v42);
          v44 = mv2ip_outputAttachedMediaKeyForMattingOutputType(v42);
          BWSampleBufferRemoveAttachedMedia(a2, (uint64_t)v43);
          v45 = objc_msgSend(a3, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", objc_msgSend((id)v41[18], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42)), a2);
          if (v45)
          {
            v46 = (void *)v45;
            v74 = v33;
            v75 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65);
            CMSetAttachment(v46, v34, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1), 1u);
            if (*((_BYTE *)v41 + 33))
            {
              v47 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
              CMGetAttachment(a2, v35, 0);
              v48 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
              v72 = *MEMORY[0x1E0C9D628];
              v73 = v48;
              v49 = v36;
              v50 = v37;
              v51 = v38;
              v52 = v39;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v72, *((double *)&v72 + 1), *(double *)&v73, *((double *)&v73 + 1));
                v49 = v53;
                v50 = v54;
                v51 = v55;
                v52 = v56;
              }
              v57 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)v46);
              v58 = (void *)CMGetAttachment(v46, v35, 0);
              FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v58, v47, v57, v49, v50, v51, v52, v36, v37, v38, v39);
              v41 = a1;
            }
            BWSampleBufferSetAttachedMedia(a2, (uint64_t)v44, (uint64_t)v46);
            CFRelease(v46);
          }
          ++v40;
        }
        while (v32 != v40);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v32);
    }
    v27 = v61;
    v7 = v62;
    v59 = cf;
    if (!v62)
      goto LABEL_32;
    goto LABEL_31;
  }
  v29 = objc_msgSend(a3, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", v28, a2);
  if (v29)
  {
    cf = (CFTypeRef)v29;
    BWSampleBufferSetAttachedMedia(a2, 0x1E495B0D8, v29);
    goto LABEL_17;
  }
LABEL_39:
  v59 = 0;
LABEL_31:
  CFRelease(v7);
LABEL_32:
  if (v27)
    CFRelease(v27);
  if (v59)
    CFRelease(v59);
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result;
  _QWORD *v5;

  result = -[BWMattingV2InferenceProvider _loadMattingProcessor]((uint64_t)self);
  if (!result)
  {
    v5 = -[BWMattingV2InferenceProvider _processorOptions](self);
    if (v5)
    {
      -[FigMatting setOptions:](self->_mattingProcessor, "setOptions:", v5);
      return -[FigMatting prewarmWithTuningParameters:](self->_mattingProcessor, "prewarmWithTuningParameters:", 0);
    }
    else
    {
      return -31702;
    }
  }
  return result;
}

- (_QWORD)_processorOptions
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = result[15];
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = *MEMORY[0x1E0D06188];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D06188]);
    if (v2)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v1[23], CFSTR("SDOFRenderingParameters"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = (id)v1[1];
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v1[1], "objectForKeyedSubscript:", v10), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("MattingParameters"));
        v12 = objc_msgSend(v11, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@V%d"), CFSTR("Matting"), *((unsigned int *)v1 + 6)));
        if (!v12)
          break;
        objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "setObject:forKeyedSubscript:", v12, v10);
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_6;
          break;
        }
      }
    }
    if (objc_msgSend(v3, "count"))
      v13 = v3;
    else
      v13 = 0;
    return (id)objc_msgSend(v13, "copy");
  }
  return result;
}

@end
