@implementation BWSoftISPProcessorController

- (uint64_t)_loadSetupAndPrepareSoftISPProcessor
{
  id *v1;
  int *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  unsigned int v30;
  id *v31;
  id obj;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  v2 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  if (a1[7])
    return 0;
  v3 = (void *)objc_msgSend(a1, "configuration");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"), CFSTR("NRFParameters"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Common"));
  v37 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("DefaultSensorIDs"));
  v7 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  v30 = v7;
  v31 = v1;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_msgSend(v3, "sensorConfigurationsByPortType");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v8)
  {
    v9 = v8;
    v33 = *(_QWORD *)v39;
    v10 = MEMORY[0x1E0C9AA70];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v13 = (void *)objc_msgSend((id)objc_msgSend(v3, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v12);
        v14 = v3;
        v15 = objc_msgSend(v13, "sensorIDString");
        objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[FigCaptureCameraParameters sensorIDFromSensorIDString:](FigCaptureCameraParameters, "sensorIDFromSensorIDString:", v15)), v12);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v12);
        v16 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("SoftISPTuning"));
        if (v16)
          v17 = v16;
        else
          v17 = v10;
        v18 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ModuleConfig"));
        if (v18)
          v19 = v18;
        else
          v19 = v10;
        v43[1] = v19;
        v44 = v15;
        v3 = v14;
        v42[0] = CFSTR("SoftISPTuning");
        v42[1] = CFSTR("ModuleConfig");
        v43[0] = v17;
        v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1), v12);
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), v12);
        objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(v13, "moduleCalibration"), v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v9);
  }
  if (!objc_msgSend(v37, "count"))
  {
    v27 = 4294954516;
    v1 = v31;
    v2 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    goto LABEL_34;
  }
  v20 = BWLoadProcessorBundle((uint64_t)CFSTR("NRF"), v30);
  v1 = v31;
  v2 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  if (!v20)
    goto LABEL_30;
  v21 = v20;
  v22 = objc_alloc_init((Class)objc_msgSend(v20, "classNamed:", CFSTR("SoftISPProcessor")));
  v31[7] = v22;
  if (!v22)
    goto LABEL_30;
  v23 = (void *)objc_msgSend(-[BWSoftISPProcessorController _prepareDescriptorByPipelineType](v31), "allKeys");
  if (!objc_msgSend(v23, "count"))
  {
    v27 = 4294954516;
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v31[7], "setDeviceGeneration:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
  objc_msgSend(v31[7], "setCameraInfoByPortType:", v35);
  objc_msgSend(v31[7], "setModuleCalibrationByPortType:", v36);
  objc_msgSend(v31[7], "setTuningParameters:", v37);
  objc_msgSend(v31[7], "setMetalCommandQueue:", objc_msgSend(v3, "metalCommandQueue"));
  objc_msgSend(v31[7], "setSupportedPipelineTypes:", v23);
  objc_msgSend(v31[7], "setOutputCompressionLevelByPipeline:", -[BWSoftISPProcessorController _lossyCompressionLevelByPipelineType](v31));
  v24 = objc_msgSend(v31[7], "setup");
  if ((_DWORD)v24)
  {
    v27 = v24;
    goto LABEL_34;
  }
  v25 = objc_alloc_init((Class)objc_msgSend(v21, "classNamed:", CFSTR("SoftISPPrepareDescriptor")));
  v31[8] = v25;
  if (!v25)
  {
LABEL_30:
    v27 = 4294954510;
LABEL_34:

    *(id *)((char *)v1 + v2[333]) = 0;
    v28 = &OBJC_IVAR___BWSoftISPProcessorController__prepareDescriptor;

    v26 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v31[8], "setInputPixelFormat:", objc_msgSend(v3, "sensorRawPixelFormat"));
  objc_msgSend(v31[8], "setMaximumWidth:", (int)objc_msgSend(v3, "inputDimensions"));
  objc_msgSend(v31[8], "setMaximumHeight:", objc_msgSend(v3, "inputDimensions") >> 32);
  objc_msgSend(v31[8], "setStageConfigMode:", 1);
  v26 = objc_msgSend(v34, "copy");
  v27 = 0;
  v28 = &OBJC_IVAR___BWSoftISPProcessorController__sensorIDByPortType;
LABEL_26:
  *(id *)((char *)v1 + *v28) = (id)v26;
  return v27;
}

- (id)_prepareDescriptorByPipelineType
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)objc_msgSend(v1, "configuration");
    v4 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "inputDimensions");
    v5 = (void *)BWDimensionsWithQSubResolutionFlavor((void *)objc_msgSend(v3, "inputDimensionsByQSubResolutionFlavorByPortType"), 1);
    v6 = FigCaptureLargestDimensionsFromDimensionsArray(v5);
    v7 = (void *)BWDimensionsWithQSubResolutionFlavor((void *)objc_msgSend(v3, "inputDimensionsByQSubResolutionFlavorByPortType"), 2);
    v8 = FigCaptureLargestDimensionsFromDimensionsArray(v7);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (FigCaptureVideoDimensionsAreValid(v4))
    {
      objc_msgSend(v9, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v4));
      objc_msgSend(v10, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v4));
    }
    if (FigCaptureVideoDimensionsAreValid(v6) && !FigCaptureVideoDimensionsAreEqual(v4, v6))
    {
      objc_msgSend(v9, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v6));
      objc_msgSend(v10, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v6));
    }
    if (FigCaptureVideoDimensionsAreValid(v8))
      objc_msgSend(v9, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v8));
    v11 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "sensorRawPixelFormat");
    if (objc_msgSend(v3, "standardYUVProcessingEnabled"))
    {
      v12 = FigCaptureLargestDimensionsFromDimensionsArray(v10);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v12, v11), &unk_1E49F8A30);
      if (objc_msgSend(v3, "gdcEnabled"))
        objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v12, v11), &unk_1E49F8A48);
    }
    if (objc_msgSend(v3, "rawNightModeEnabled"))
    {
      v13 = FigCaptureLargestDimensionsFromDimensionsArray(v10);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v13, v11), &unk_1E49F8A60);
    }
    if ((objc_msgSend(v3, "deepFusionEnabled") & 1) != 0 || objc_msgSend(v3, "learnedNREnabled"))
    {
      v14 = FigCaptureLargestDimensionsFromDimensionsArray(v10);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v14, v11), &unk_1E49F8A78);
      if (objc_msgSend(v3, "quadraProcessingEnabled"))
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49F8A90)&& !objc_msgSend(v3, "qBinProcessingMode"))
        {
          v10 = v9;
        }
        v15 = FigCaptureLargestDimensionsFromDimensionsArray(v10);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v15, v11), &unk_1E49F8AA8);
      }
    }
    if (objc_msgSend(v3, "qBinProcessingMode"))
    {
      v16 = HIDWORD(v8);
      if ((v8 & 0x80000000) == 0)
        v17 = v8;
      else
        v17 = v8 + 1;
      v18 = (v17 >> 1);
      v19 = ((int)v16 / 2);
      if ((objc_msgSend(v3, "qBinProcessingMode") & 1) != 0)
        objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v18 | (v19 << 32), v11), &unk_1E49F8AC0);
      if ((objc_msgSend(v3, "qBinProcessingMode") & 2) != 0)
        objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v18 | (v19 << 32), v11), &unk_1E49F8AD8);
    }
    if (objc_msgSend(v3, "linearRGBForDisparityEnabled"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v4, v11), &unk_1E49F8AF0);
    v20 = (void *)objc_msgSend(v2, "copy");

    objc_msgSend(v20, "count");
    return v20;
  }
  return result;
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 processingMode:(int)a4
{
  return -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:](self, "outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:", *(_QWORD *)&a3, 0, *(_QWORD *)&a4, 0);
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5 isQuadra:(BOOL)a6
{
  return -[SoftISPProcessor outputPixelFormatForPipeline:inputPixelFormat:](self->_processor, "outputPixelFormatForPipeline:inputPixelFormat:", -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, a3, a4, a5, 0, a6), -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
}

- (uint64_t)_pipelineTypeForCaptureType:(uint64_t)a3 captureFlags:(int)a4 processingMode:(int)a5 gdcEnabled:(int)a6 isQuadra:
{
  unsigned int v6;
  _BOOL4 v7;
  BOOL v8;
  int v9;
  int v10;
  unsigned int v11;

  if (result)
  {
    switch(a4)
    {
      case 0:
        v6 = 0;
        v7 = 1;
        switch(a2)
        {
          case 1:
            if (a5)
              v6 = 19;
            else
              v6 = 16;
            v7 = (a3 & 0x80) == 0;
            if ((a3 & 0x80) != 0)
              v6 = 0;
            goto LABEL_21;
          case 2:
          case 7:
          case 10:
            goto LABEL_4;
          case 11:
            if (a5)
              v6 = 19;
            else
              v6 = 16;
            if ((a3 & 0x800000000) != 0)
              v6 = 26;
            goto LABEL_9;
          case 12:
            if ((a5 & 1) != 0)
              goto LABEL_40;
            v8 = a6 == 0;
            v6 = 20;
            v9 = 24;
            break;
          default:
            goto LABEL_21;
        }
        goto LABEL_5;
      case 1:
LABEL_4:
        v8 = a5 == 0;
        v6 = 16;
        v9 = 19;
LABEL_5:
        if (!v8)
          v6 = v9;
        goto LABEL_9;
      case 2:
        if ((a5 & 1) != 0)
          goto LABEL_40;
        v7 = 1;
        v6 = 16;
        goto LABEL_21;
      case 3:
        if ((a5 & 1) != 0)
        {
LABEL_40:
          result = 0;
        }
        else
        {
          v7 = 1;
          v6 = 21;
LABEL_21:
          v10 = v7 | a5;
          if (a6)
            v11 = 24;
          else
            v11 = 20;
          if (v10)
            result = v6;
          else
            result = v11;
        }
        break;
      case 4:
        result = 0;
        if (!a6 || (a5 & 1) != 0)
          return result;
        v7 = 1;
        v6 = 51;
        goto LABEL_21;
      case 5:
        result = 0;
        if (!a6 || (a5 & 1) != 0)
          return result;
        v7 = 1;
        v6 = 52;
        goto LABEL_21;
      case 6:
        v6 = 0;
        v7 = 0;
        goto LABEL_21;
      default:
        v6 = 0;
LABEL_9:
        v7 = 1;
        goto LABEL_21;
    }
  }
  return result;
}

- (BWSoftISPProcessorController)initWithConfiguration:(id)a3
{
  BWSoftISPProcessorController *v4;
  void *v5;
  int SetupAndPrepareSoft;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWSoftISPProcessorController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v8, sel_initWithName_type_configuration_, CFSTR("SoftISP"), 12, a3);
  if (v4)
  {
    if (!FigCaptureVideoDimensionsAreValid(objc_msgSend(a3, "inputDimensions"))
      || !objc_msgSend(a3, "sensorRawPixelFormat")
      || (v5 = (void *)MEMORY[0x1A858DD40](),
          SetupAndPrepareSoft = -[BWSoftISPProcessorController _loadSetupAndPrepareSoftISPProcessor]((id *)&v4->super.super.isa),
          objc_autoreleasePoolPop(v5),
          SetupAndPrepareSoft))
    {

      return 0;
    }
  }
  return v4;
}

- (id)_lossyCompressionLevelByPipelineType
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = (void *)objc_msgSend(-[BWSoftISPProcessorController _prepareDescriptorByPipelineType](v1), "allKeys", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          switch(objc_msgSend(v8, "intValue"))
          {
            case 0x10u:
            case 0x13u:
              v11 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "lossyCompressionLevel");
              if ((v11 - 1) < 3)
                v12 = (v11 + 1);
              else
                v12 = 0;
              v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
              v9 = v2;
              break;
            default:
              v9 = v2;
              v10 = &unk_1E49F8B08;
              break;
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (void)dealloc
{
  opaqueCMFormatDescription *inputFormatDescription;
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *lscFormatDescription;
  opaqueCMFormatDescription *flashLSCFormatDescription;
  objc_super v7;

  -[BWSoftISPProcessorController reset](self, "reset");

  inputFormatDescription = self->_inputFormatDescription;
  if (inputFormatDescription)
    CFRelease(inputFormatDescription);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  lscFormatDescription = self->_lscFormatDescription;
  if (lscFormatDescription)
    CFRelease(lscFormatDescription);
  flashLSCFormatDescription = self->_flashLSCFormatDescription;
  if (flashLSCFormatDescription)
    CFRelease(flashLSCFormatDescription);

  v7.receiver = self;
  v7.super_class = (Class)BWSoftISPProcessorController;
  -[BWStillImageProcessorController dealloc](&v7, sel_dealloc);
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5
{
  return -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:](self, "outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, 0);
}

- (unsigned)outputPixelFormatForInput:(id)a3
{
  const void *v5;

  v5 = (const void *)objc_msgSend(a3, "frame");
  return -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:](self, "outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:", objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType"), objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags"), objc_msgSend(a3, "processingMode"), objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1);
}

- (unsigned)auxiliaryPixelFormatForInput:(id)a3
{
  const void *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  uint64_t v11;

  v5 = (const void *)objc_msgSend(a3, "frame");
  v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  v7 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType");
  v8 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags");
  v9 = objc_msgSend(a3, "processingMode");
  v10 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "deliverDeferredPhotoProxyImage");
  if (!self)
    goto LABEL_8;
  if (v7 == 12)
  {
    v11 = *(_DWORD *)&v10 & (v8 >> 20);
    return -[SoftISPProcessor auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:](self->_processor, "auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:", -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, v7, v8, v9, 0, v6 == 1), v11, -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
  }
  if (v7 == 11)
  {
    v11 = 2;
    return -[SoftISPProcessor auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:](self->_processor, "auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:", -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, v7, v8, v9, 0, v6 == 1), v11, -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
  }
  if (v7 != 10)
  {
LABEL_8:
    v11 = 0;
    return -[SoftISPProcessor auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:](self->_processor, "auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:", -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, v7, v8, v9, 0, v6 == 1), v11, -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
  }
  v11 = (v8 >> 20) & 1;
  return -[SoftISPProcessor auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:](self->_processor, "auxiliaryPixelFormatForPipeline:auxiliaryType:inputPixelFormat:", -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, v7, v8, v9, 0, v6 == 1), v11, -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4
{
  _BOOL4 v7;
  uint64_t v8;
  __CVBuffer *ImageBuffer;
  _BOOL8 v10;
  id *v11;
  uint64_t v12;

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1;
    v8 = -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType"), objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags"), objc_msgSend(a3, "processingMode"), objc_msgSend(a3, "gdcEnabled"), v7);
    -[SoftISPPrepareDescriptor setSensorID:](self->_prepareDescriptor, "setSensorID:", (unsigned __int16)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_sensorIDByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType")), "unsignedIntValue"));
    -[SoftISPPrepareDescriptor setInputPixelFormat:](self->_prepareDescriptor, "setInputPixelFormat:", -[BWStillImageProcessorControllerConfiguration sensorRawPixelFormat](-[BWStillImageProcessorController configuration](self, "configuration"), "sensorRawPixelFormat"));
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    -[SoftISPPrepareDescriptor setMaximumWidth:](self->_prepareDescriptor, "setMaximumWidth:", CVPixelBufferGetWidth(ImageBuffer));
    -[SoftISPPrepareDescriptor setMaximumHeight:](self->_prepareDescriptor, "setMaximumHeight:", CVPixelBufferGetHeight(ImageBuffer));
    if (-[BWStillImageProcessorControllerConfiguration cmiResourceEnabled](-[BWStillImageProcessorController configuration](self, "configuration"), "cmiResourceEnabled"))v10 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12;
    else
      v10 = 0;
    -[SoftISPPrepareDescriptor setCmiResourceEnabled:](self->_prepareDescriptor, "setCmiResourceEnabled:", v10);
    v11 = (id *)-[SoftISPProcessor prepareToProcess:prepareDescriptor:](self->_processor, "prepareToProcess:prepareDescriptor:", v8, self->_prepareDescriptor);
    if (!(_DWORD)v11)
    {
      -[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BWStillImageProcessorControllerDelegate processorController:willAddSampleBuffer:processorInput:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:willAddSampleBuffer:processorInput:", self, a4, a3);
      v11 = -[BWSoftISPProcessorController _addFrame:]((id *)&self->super.super.isa, a4);
    }
    v12 = (uint64_t)v11;
  }
  else
  {
    v12 = 4294954516;
  }
  -[BWStillImageProcessorControllerRequest setErr:](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "setErr:", v12);
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (id)_addFrame:(id *)result
{
  id *v3;
  void *v4;
  int v5;
  unint64_t v6;
  const void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  __int16 v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  CFDictionaryRef DictionaryRepresentation;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  CFDictionaryRef v42;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  _BOOL4 v48;
  unsigned int v49;
  _BOOL4 v50;
  unsigned int v51;
  unsigned int v52;
  _BOOL4 v53;
  _BOOL4 v54;
  _BOOL4 v55;
  void *v56;
  _QWORD v57[4];
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(result, "currentRequest");
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "captureType");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureStreamSettings"), "captureFlags");
  v7 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  v56 = v4;
  v8 = objc_msgSend((id)objc_msgSend(v4, "input"), "processingMode");
  v9 = -[BWSoftISPProcessorController _tuningTypeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((uint64_t)v3, a2, v8, v5, v6, (char)v7);
  v48 = -[BWSoftISPProcessorController _rnfEnabledForFrame:processingMode:captureFlags:]((_BOOL8)v3, a2, v8, v6);
  v49 = -[BWSoftISPProcessorController _hrEnabledForFrame:processingMode:captureFlags:captureFrameFlags:]((unint64_t)v3, a2, v8, v6, (char)v7);
  v50 = (v49 & 1) == 0
     && -[BWSoftISPProcessorController _sfhrEnabledForFrame:processingMode:captureType:captureFlags:captureFrameFlags:tuningType:]((uint64_t)v3, a2, v8, v5, v6, (char)v7, v9);
  v46 = -[BWSoftISPProcessorController _rawMBNREnabledForFrame:processingMode:captureFlags:tuningType:]((uint64_t)v3, a2, v8, v6, v9);
  v10 = -[BWSoftISPProcessorController _awbModeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((uint64_t)v3, a2, v8, v5, v6, (unint64_t)v7);
  v11 = -[BWSoftISPProcessorController _awbPurgeResourcesForFrameCount:captureFlags:]((uint64_t)v3, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "frameStatisticsByPortType"), "frameCount"), v6);
  v12 = -[BWSoftISPProcessorController _awbRegionOfInterestWithinSensorCropRectForFrame:processingMode:captureFlags:](v3, (CMSampleBufferRef)a2, v8, v6);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v52 = -[BWSoftISPProcessorController _ltmModeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((unint64_t)v3, a2, v8, v5, v6, (char)v7);
  v53 = -[BWSoftISPProcessorController _faceDetectionEnabledForFrame:processingMode:captureType:captureFlags:]((_BOOL8)v3, a2, v8, v5);
  v20 = v5 == 11 && v8 != 1;
  v54 = v20;
  v55 = -[BWSoftISPProcessorController _gnuEnabledForFrame:processingMode:captureFlags:tuningType:]((uint64_t)v3, a2, v8, v6, v9);
  v51 = v9;
  v23 = -[BWSoftISPProcessorController _opcEnabledForFrame:processingMode:captureFlags:tuningType:]((_BOOL8)v3, a2, v21, v22, v9);
  v25 = -[BWSoftISPProcessorController _allowUnclampedOutputsForFrame:processingMode:](v3, v24, v8);
  v26 = -[BWSoftISPProcessorController _outputBufferRectWithinSensorCropRectForFrame:](v3, a2);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "deliverDeferredPhotoProxyImage");
  if (v5 == 12)
  {
    v35 = *(_DWORD *)&v33 & (v6 >> 20);
  }
  else
  {
    if (v5 != 11)
    {
      v34 = v10;
      if (v5 == 10)
        v47 = (v6 >> 20) & 1;
      else
        v47 = 0;
      goto LABEL_19;
    }
    v35 = 2;
  }
  v47 = v35;
  v34 = v10;
LABEL_19:
  v36 = (v6 >> 15) & 1;
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("PDC"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36), CFSTR("CAR"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48), CFSTR("RNF"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v49), CFSTR("HR"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25), CFSTR("AllowUnclampedOutputs"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50 & (v25 ^ 1)), CFSTR("SFHR"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46), CFSTR("RawMBNR"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 == 2), CFSTR("Aux"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34), CFSTR("AWBMode"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11), CFSTR("AWBPurgeResources"));
  v58.origin.x = v12;
  v58.origin.y = v14;
  v58.size.width = v16;
  v58.size.height = v18;
  if (!CGRectIsNull(v58))
  {
    v59.origin.x = v12;
    v59.origin.y = v14;
    v59.size.width = v16;
    v59.size.height = v18;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v59);
    objc_msgSend(v37, "setObject:forKeyedSubscript:", CFAutorelease(DictionaryRepresentation), CFSTR("AWBRegionOfInterestRectWithinSensorCropRect"));
  }
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v52), CFSTR("LTMMode"));
  v39 = (void *)MEMORY[0x1E0CB37E8];
  v40 = objc_msgSend((id)objc_msgSend(v3, "configuration"), "ltmHDRCurvesEnabled");
  if (v52)
    v41 = v40;
  else
    v41 = 0;
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v39, "numberWithInt:", v41), CFSTR("LTMHDRCurves"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53), CFSTR("VSN"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54), CFSTR("SSC"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55), CFSTR("GNU"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23), CFSTR("OPC"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v51), CFSTR("TuningType"));
  v60.origin.x = v26;
  v60.origin.y = v28;
  v60.size.width = v30;
  v60.size.height = v32;
  v42 = CGRectCreateDictionaryRepresentation(v60);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", CFAutorelease(v42), CFSTR("OutputBufferRectWithinSensorCropRect"));
  v57[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
  objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1), CFSTR("SoftISPAuxiliaryType"));
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id *)objc_msgSend(v3[7], "addFrame:uniqueID:processingOptions:", a2, objc_msgSend(v56, "uniqueID", v44, v45), v37);
}

- (uint64_t)_tuningTypeForFrame:(int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:
{
  void *v10;
  void *v11;
  int v12;
  float v13;
  _BOOL4 v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;
  int v19;

  if (result)
  {
    v10 = (void *)result;
    v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    if (v12 == 1)
    {
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
      v14 = v13 > 1.0;
    }
    else
    {
      v14 = 0;
    }
    switch(a3)
    {
      case 0:
      case 5:
        if ((a5 & 0x80) != 0)
          goto LABEL_17;
        goto LABEL_10;
      case 1:
      case 2:
      case 3:
        if (v14)
          return 100;
        else
          return 1;
      case 4:
        if ((a5 & 0x200000000) != 0)
          v16 = 142;
        else
          v16 = 22;
        if ((a6 & 8) == 0)
          v16 = 0;
        if ((a5 & 0x200000000) != 0)
          v19 = 141;
        else
          v19 = 21;
        if ((a6 & 4) != 0)
          v16 = v19;
        if ((a5 & 0x200000000) != 0)
          v18 = 140;
        else
          v18 = 20;
        v17 = (a6 & 2) == 0;
        goto LABEL_89;
      case 6:
LABEL_17:
        if (v14)
          v16 = 100;
        else
          v16 = 1;
        v17 = (a5 & 0x100000000) == 0;
        v18 = 190;
        goto LABEL_89;
      default:
LABEL_10:
        result = 0;
        switch(a4)
        {
          case 1:
          case 7:
            if (v14)
              v15 = 100;
            else
              v15 = 1;
            if ((a5 & 0x100000000) != 0)
              return 100;
            else
              return v15;
          case 2:
            if (objc_msgSend((id)objc_msgSend(v10, "configuration"), "documentScanningEnabled")
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled"))
            {
              if (v14)
                return 172;
              else
                return 171;
            }
            v18 = 180;
            if (v14)
              v16 = 180;
            else
              v16 = 170;
            v17 = (a5 & 0x100000000) == 0;
            break;
          case 10:
            if ((a6 & 2) != 0)
            {
              if (v14)
                return 101;
              else
                return 2;
            }
            if (v14)
              v16 = 103;
            else
              v16 = 4;
            if ((a6 & 8) == 0)
              v16 = 0;
            if (v14)
              v18 = 102;
            else
              v18 = 3;
            v17 = (a6 & 4) == 0;
            break;
          case 11:
            if (v14)
              v16 = 110;
            else
              v16 = 10;
            if (v14)
              v18 = 160;
            else
              v18 = 150;
            v17 = (a5 & 0x800000000) == 0;
            break;
          case 12:
            if ((a5 & 0x200000000) != 0)
            {
              if (v12 == 1)
                return 143;
              if ((a6 & 2) != 0)
                return 140;
              if ((a6 & 4) != 0)
                return 141;
              if ((a6 & 8) != 0)
                return 142;
              return 0;
            }
            if ((a6 & 2) != 0)
            {
              if (v14)
                v16 = 120;
              else
                v16 = 20;
              v17 = (a5 & 0x100000000) == 0;
              v18 = 130;
            }
            else if ((a6 & 4) != 0)
            {
              if (v14)
                v16 = 121;
              else
                v16 = 21;
              v17 = (a5 & 0x100000000) == 0;
              v18 = 131;
            }
            else
            {
              if ((a6 & 8) == 0)
                return 0;
              if (v14)
                v16 = 122;
              else
                v16 = 22;
              v17 = (a5 & 0x100000000) == 0;
              v18 = 132;
            }
            break;
          default:
            return result;
        }
LABEL_89:
        if (v17)
          result = v16;
        else
          result = v18;
        break;
    }
  }
  return result;
}

- (BOOL)_rnfEnabledForFrame:(int)a3 processingMode:(char)a4 captureFlags:
{
  int v6;

  if (result)
  {
    v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    result = v6 != 1;
    if (a3 == 6)
    {
      return 0;
    }
    else if (!a3)
    {
      return (a4 & 0x80) == 0 && v6 != 1;
    }
  }
  return result;
}

- (unint64_t)_hrEnabledForFrame:(unsigned int)a3 processingMode:(unint64_t)a4 captureFlags:(char)a5 captureFrameFlags:
{
  void *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  CFTypeRef v12;
  int v14;

  if (result)
  {
    v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if ((objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue") & 1) != 0)
      return 0;
    v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D30], 0);
    v11 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CA8], 0);
    v12 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D48], 0);
    if (!v10 && (!v11 || v12 == 0))
      return 0;
    result = 0;
    if (a3 <= 6)
    {
      if (((1 << a3) & 0x62) == 0)
      {
        if (((1 << a3) & 0x11) == 0)
          return result;
        v14 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
        if (a5 & 8 | a4 & 0x100000)
          return (a4 >> 33) & (v14 == 1);
      }
      return 1;
    }
  }
  return result;
}

- (BOOL)_sfhrEnabledForFrame:(unsigned int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:(uint64_t)a7 tuningType:
{
  void *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;

  if (!a1)
    return 0;
  v13 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v14 = objc_msgSend((id)objc_msgSend((id)a1, "configuration"), "sfhrSupportEnabled");
  v15 = objc_msgSend((id)objc_msgSend((id)a1, "configuration"), "lowlightSFHRSupportEnabled");
  v16 = 0;
  if ((a5 & 0x1000000) != 0)
    return v16;
  v17 = v15;
  if (!(v14 | v15))
    return v16;
  v18 = objc_msgSend(*(id *)(a1 + 56), "tuningFlagForProcessingOption:tuningType:metadata:", CFSTR("SFHR"), a7, v13);
  if (!v18)
  {
    if ((a5 & 0x100000) == 0)
    {
      v16 = 0;
      if (a3 > 6 || ((1 << a3) & 0x73) == 0)
        return v16;
      if ((a6 & 8) != 0 || (v14 & (a5 >> 3) | v17) != 1)
        v16 = 0;
      else
        v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled") ^ 1;
      goto LABEL_6;
    }
    if ((a6 & 4) != 0)
    {
      v16 = 0;
      if (a3 <= 6 && ((1 << a3) & 0x51) != 0)
      {
        if (a4 == 12 || a4 == 10 || a5 == 0x4000000000)
          v16 = v14;
        else
          v16 = 0;
      }
      goto LABEL_6;
    }
    return 0;
  }
  v16 = v18 == 1;
LABEL_6:
  if (!a3 && a4 == 11)
  {
    v19 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue");
    v20 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
    if (v19 == 1 && v20 == 1)
      *(_BYTE *)(a1 + 148) = v16;
    else
      return *(_BYTE *)(a1 + 148) != 0;
  }
  return v16;
}

- (uint64_t)_rawMBNREnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  uint64_t v8;
  void *v9;
  int v10;

  if (result)
  {
    v8 = result;
    v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    result = objc_msgSend(*(id *)(v8 + 56), "tuningFlagForProcessingOption:tuningType:metadata:", CFSTR("RawMBNR"), a5, v9);
    if ((_DWORD)result != 1)
    {
      if ((_DWORD)result == 2)
        return 0;
      if ((a3 - 1) >= 5)
      {
        if (a3 || (a4 & 0x80) != 0)
          return 0;
        return (a4 & 0x200000000) == 0 || v10 != 1;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)_awbModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(unint64_t)a6 captureFrameFlags:
{
  uint64_t v11;
  void *v12;
  char v13;
  int v14;
  int v15;

  if (result)
  {
    v11 = result;
    v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06840]), "BOOLValue");
    if (a4 != 11 && (v13 & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = 0;
      switch(a3)
      {
        case 0:
        case 4:
          if (a4 == 11)
          {
            v14 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue");
            v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
            if (v14 == 1 && v15 == 1)
            {
              if ((a5 & 0x800000000) != 0)
                result = 3;
              else
                result = 2;
            }
            else
            {
              objc_msgSend(v12, "addEntriesFromDictionary:", *(_QWORD *)(v11 + 120));
              result = BWIsLastAdaptiveBracketingFrame(target);
              if ((_DWORD)result)
              {

                result = 0;
                *(_QWORD *)(v11 + 120) = 0;
              }
            }
          }
          else if (a4 == 2)
          {
            result = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue") ^ 1;
          }
          else
          {
            if ((a5 & 0x8000000000) == 0)
              return 0;
            if (a4 == 1)
              result = 1;
            else
              result = (a6 >> 4) & 1;
          }
          break;
        case 1:
        case 5:
          result = (a5 >> 39) & 1;
          break;
        case 2:
          result = 1;
          break;
        case 6:
          result = (a5 >> 38) & 1;
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (uint64_t)_awbPurgeResourcesForFrameCount:(unint64_t)a3 captureFlags:
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  if (result)
  {
    v5 = result;
    if (objc_msgSend((id)objc_msgSend((id)result, "configuration"), "stillImageProcessingMode"))
      return 0;
    v6 = BWStillImageAutoWhiteBalanceReflowMaximumFrameCount();
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      result = 0;
      v8 = (a3 >> 39) & (v7 > a2);
      if (*(_BYTE *)(v5 + 112))
        v8 = 1;
      *(_BYTE *)(v5 + 112) = v8;
      if (v7 <= a2)
      {
        if (*(_BYTE *)(v5 + 112))
        {
          *(_BYTE *)(v5 + 112) = 0;
          return 1;
        }
      }
    }
  }
  return result;
}

- (double)_awbRegionOfInterestWithinSensorCropRectForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:
{
  uint64_t v8;
  __CVBuffer *ImageBuffer;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  __int128 v15;
  _BYTE v16[32];

  if (!a1)
    return 0.0;
  v8 = MEMORY[0x1E0C9D628];
  v15 = *MEMORY[0x1E0C9D628];
  *(_OWORD *)v16 = *MEMORY[0x1E0C9D628];
  *(_OWORD *)&v16[16] = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  psn_pixelBufferDimensions(ImageBuffer);
  v10 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (a3 == 6 && (a4 & 0x4000000000) != 0)
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(a1, "currentRequest"), "input");
    if ((objc_msgSend((id)objc_msgSend(v11, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v11, "captureSettings"), "masterPortType")) & 1) == 0)FigCFDictionaryGetCGRectIfPresent();
  }
  if (CGRectIsNull(*(CGRect *)v16))
    return *(double *)v8;
  v12 = *MEMORY[0x1E0D06D20];
  if (objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]))
    v13 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v12), "intValue");
  else
    v13 = 1.0;
  FigCFDictionaryGetCGRectIfPresent();
  return v13 * (*(double *)&v15 + *(double *)v16);
}

- (unint64_t)_ltmModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(char)a6 captureFrameFlags:
{
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v18;
  double v19;

  if (!result)
    return result;
  v11 = result;
  v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  if ((a3 - 2) < 2)
    return 0;
  v14 = v13;
  if (a3 != 4 && a3)
    return 1;
  result = 1;
  if (a4 > 10)
  {
    if (a4 == 12)
    {
LABEL_21:
      if ((a6 & 0x14) == 0)
        return (a5 >> 33) & (v14 == 1);
      return result;
    }
    if (a4 != 11)
      return result;
    v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue");
    v16 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
    if (v15 == 1 && v16 == 1)
      return 2;
    objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
    v19 = v18;
    FigCaptureComputeImageGainFromMetadata();
    if (vabdd_f64(v19, *(double *)(v11 + 136)) < 0.0001 && vabds_f32(0.0, *(float *)(v11 + 144)) < 0.0001)
      objc_msgSend(v12, "addEntriesFromDictionary:", *(_QWORD *)(v11 + 128));
    if (BWIsLastAdaptiveBracketingFrame(target))
    {

      *(_QWORD *)(v11 + 128) = 0;
      *(_QWORD *)(v11 + 136) = 0;
      *(_DWORD *)(v11 + 144) = 0;
      *(_BYTE *)(v11 + 148) = 0;
    }
    return 0;
  }
  if (a4 != 2)
  {
    if (a4 != 10)
      return result;
    goto LABEL_21;
  }
  if (!objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue"))
    return 1;
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v11, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled");
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v11, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled");
  return result;
}

- (BOOL)_faceDetectionEnabledForFrame:(_BOOL8)result processingMode:(CMAttachmentBearerRef)target captureType:(int)a3 captureFlags:(int)a4
{
  void *v6;
  int v7;
  int v8;

  if (result)
  {
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    result = 0;
    if (!a3 && a4 == 11)
    {
      v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue");
      v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
      return v7 == 1 && v8 < 7;
    }
  }
  return result;
}

- (BOOL)_gnuEnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  void *v9;
  int v10;
  _BOOL8 v11;
  int v12;

  if (!a1)
    return 0;
  v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  v11 = v10 != 1;
  v12 = objc_msgSend(*(id *)(a1 + 56), "tuningFlagForProcessingOption:tuningType:metadata:", CFSTR("GNU"), a5, v9);
  if (v12)
    return v12 == 1;
  switch(a3)
  {
    case 0:
      v11 = (a4 & 0x800000080) == 0 && v10 != 1;
      break;
    case 1:
    case 2:
    case 3:
    case 5:
      return v11;
    case 4:
      return 1;
    default:
      return 0;
  }
  return v11;
}

- (BOOL)_opcEnabledForFrame:(uint64_t)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "tuningFlagForProcessingOption:tuningType:metadata:", CFSTR("OPC"), a5, CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) == 1;
  return result;
}

- (void)_allowUnclampedOutputsForFrame:(int)a3 processingMode:
{
  if (result)
  {
    LODWORD(result) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled");
    if (a3 == 2)
      return 0;
    else
      return (void *)result;
  }
  return result;
}

- (double)_outputBufferRectWithinSensorCropRectForFrame:(void *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __CVBuffer *ImageBuffer;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  int v26;
  double MidX;
  int v28;
  int v29;
  double MidY;
  int v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (!a1)
    return 0.0;
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v6 = *MEMORY[0x1E0D06D20];
  if (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]))
    v7 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v6), "intValue");
  else
    v7 = 1;
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  v9 = psn_pixelBufferDimensions(ImageBuffer);
  v10 = objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensions");
  v11 = v10;
  v12 = HIDWORD(v10);
  if (v7 == 1)
  {
    v13 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", &unk_1E49F8A90));
    v14 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49F8A90));
    if (FigCaptureVideoDimensionsAreEqual(v9, v13))
    {
      LODWORD(v12) = HIDWORD(v14);
      v11 = v14;
    }
    v15 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", &unk_1E49F8B20));
    v16 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49F8B20));
    if (((int)v15 > (int)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensions")
       || SHIDWORD(v15) > (int)((unint64_t)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensions") >> 32))
      && FigCaptureVideoDimensionsAreEqual(v9, v15))
    {
      v12 = HIDWORD(v16);
      v11 = v16;
    }
  }
  v48 = *MEMORY[0x1E0C9D628];
  v49 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v50 = *MEMORY[0x1E0C9D628];
  FigCFDictionaryGetCGRectIfPresent();
  if (FigCFDictionaryGetCGRectIfPresent())
  {
    v17 = *((double *)&v48 + 1);
    v18 = *(double *)&v48;
    v20 = *((double *)&v49 + 1);
    v19 = *(double *)&v49;
  }
  else
  {
    v19 = (double)(int)v9;
    v20 = (double)SHIDWORD(v9);
    v17 = 0.0;
    v18 = 0.0;
  }
  v21 = (*(double *)&v50 + v18) * (double)v7;
  v22 = (*((double *)&v50 + 1) + v17) * (double)v7;
  v23 = v19 * (double)v7;
  v24 = v20 * (double)v7;
  v25 = v11 * v7;
  v26 = v12 * v7;
  v51.origin.x = v21;
  v51.origin.y = v22;
  v51.size.width = v23;
  v51.size.height = v24;
  MidX = CGRectGetMidX(v51);
  if (v25 >= 0)
    v28 = v25;
  else
    v28 = v25 + 1;
  v29 = (int)(MidX - (double)(v28 >> 1));
  v52.origin.x = v21;
  v52.origin.y = v22;
  v52.size.width = v23;
  v52.size.height = v24;
  MidY = CGRectGetMidY(v52);
  if (v26 >= 0)
    v31 = v26;
  else
    v31 = v26 + 1;
  v32 = (double)(int)(MidY - (double)(v31 >> 1));
  objc_msgSend((id)objc_msgSend(a1, "configuration"), "sensorCenterOffset");
  v35 = v34;
  v36 = v33;
  v47 = (double)v29;
  if (v34 != *MEMORY[0x1E0C9D538] || v33 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v53.origin.x = (double)v29;
    v53.origin.y = v32;
    v53.size.width = (double)v25;
    v53.size.height = (double)v26;
    CGRectOffset(v53, v35, v36);
    FigCaptureMetadataUtilitiesRoundDenormalizedRectToRawSensorCFABoundary(v4);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v54.origin.x = v21;
    v54.origin.y = v22;
    v54.size.width = v23;
    v45 = v40;
    v54.size.height = v24;
    v55.origin.x = v38;
    v55.origin.y = v45;
    v55.size.width = v42;
    v55.size.height = v44;
    if (CGRectContainsRect(v54, v55))
      return v38;
  }
  return v47;
}

- (void)reset
{
  -[SoftISPProcessor resetState](self->_processor, "resetState");
  -[SoftISPProcessor setDelegate:](self->_processor, "setDelegate:", 0);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWSoftISPProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWSoftISPProcessorControllerRequest initWithInput:delegate:]([BWSoftISPProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  BWStillImageProcessorControllerRequest *v3;
  BWStillImageProcessorControllerInput *v4;

  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  -[SoftISPProcessor setDelegate:](self->_processor, "setDelegate:", self);
  v4 = -[BWStillImageProcessorControllerRequest input](v3, "input");
  if (-[BWStillImageProcessorControllerInput frame](v4, "frame"))
    -[BWStillImageProcessorControllerInputUpdatesDelegate input:addFrame:](-[BWStillImageProcessorControllerInput delegate](v4, "delegate"), "input:addFrame:", v4, -[BWStillImageProcessorControllerInput frame](v4, "frame"));
  return 0;
}

- (int)process
{
  return -[SoftISPProcessor process](self->_processor, "process");
}

- (id)metalImageBufferProcessor
{
  return self->_processor;
}

- (id)externalMemoryDescriptor
{
  uint64_t v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("PrepareDescriptorByPipelineType");
  v6[0] = -[BWSoftISPProcessorController _prepareDescriptorByPipelineType](self);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)-[SoftISPProcessor externalMemoryDescriptorForConfiguration:](self->_processor, "externalMemoryDescriptorForConfiguration:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D08A80]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", 0, 0, 0, -[BWStillImageProcessorControllerConfiguration cmiResourceEnabled](-[BWStillImageProcessorController configuration](self, "configuration"), "cmiResourceEnabled"), v3));
}

- (__CVBuffer)newOutputPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  unsigned int v6;
  unsigned int v7;
  BWStillImageProcessorControllerRequest *v9;

  v6 = a6;
  v7 = a5;
  v9 = -[BWStillImageProcessorController currentRequest](self, "currentRequest", a3, *(_QWORD *)&a4);
  return (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:dimensions:](-[BWStillImageProcessorControllerRequest delegate](v9, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", self, -[BWStillImageProcessorControllerRequest input](v9, "input"), 1, v7 | ((unint64_t)v6 << 32));
}

- (__CVBuffer)newOutputAuxiliaryPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  unsigned int v6;
  unsigned int v7;
  BWStillImageProcessorControllerRequest *v9;

  v6 = a6;
  v7 = a5;
  v9 = -[BWStillImageProcessorController currentRequest](self, "currentRequest", a3, *(_QWORD *)&a4);
  return (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:dimensions:](-[BWStillImageProcessorControllerRequest delegate](v9, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", self, -[BWStillImageProcessorControllerRequest input](v9, "input"), 28, v7 | ((unint64_t)v6 << 32));
}

- (void)outputFrameEnqueued:(id)a3
{
  BWStillImageProcessorControllerRequest *v5;
  void *v6;
  __CVBuffer *ImageBuffer;
  void *v8;
  int v9;
  int v10;
  int v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  double v14;
  const void *v15;
  const void *AttachedMedia;
  const void *v17;
  int v18;
  unint64_t v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  double v22;
  double v23;
  double width;
  double height;
  __int128 v26;
  CGSize v27;
  CGSize size;
  CMSampleBufferRef sbuf;
  CGSize v30;

  sbuf = 0;
  v5 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingOptions"), "objectForKeyedSubscript:", CFSTR("HR")), "BOOLValue")&& (v6 = (void *)objc_msgSend(a3, "metadata"), (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue") & 1) != 0)|| (-[BWStillImageProcessorControllerRequest setErr:](v5, "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput frame](-[BWStillImageProcessorControllerRequest input](v5, "input"), "frame"), (__CVBuffer *)objc_msgSend(a3, "pixelBuffer"), (CFTypeRef *)&self->_outputFormatDescription, &sbuf)), -[BWStillImageProcessorControllerRequest err](v5, "err")))
  {
    v8 = 0;
  }
  else
  {
    if (objc_msgSend(a3, "resource"))
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E0D05A10], (CFTypeRef)objc_msgSend(a3, "resource"), kCVAttachmentMode_ShouldPropagate);
    }
    v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "metadata"), "mutableCopy");
    v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05DF8]), "intValue");
    if (v9 >= 1)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
      if (v10 == 1 && v11 == 1)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        BWCopyWhiteBalanceMetadata(v8, v12);

        self->_digitalFlashAWBMetadata = v12;
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        BWCopyLTMMetadata(v8, v13);

        self->_digitalFlashLTMMetadata = v13;
        objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
        self->_digitalFlashLTMExposureTime = v14;
        FigCaptureComputeImageGainFromMetadata();
      }
    }
    CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], v8, 1u);
    v15 = (const void *)objc_msgSend(a3, "getAuxiliaryPixelBufferForAuxiliaryType:", 1);
    if (v15)
      CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05C58], v15, 1u);
    if (objc_msgSend(a3, "lscPixelBuffer")
      && !BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1E495B158, (__CVBuffer *)objc_msgSend(a3, "lscPixelBuffer"), (CFTypeRef *)&self->_lscFormatDescription, 0, 0, 1)&& objc_msgSend((id)objc_msgSend(a3, "lscParameters"), "count"))
    {
      AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B158);
      v17 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", objc_msgSend(a3, "lscParameters"));
      CMSetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05C98], v17, 1u);
      CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05C90], AttachedMedia, 1u);
    }
    if (objc_msgSend(a3, "flashLSCPixelBuffer"))
      BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1E495B178, (__CVBuffer *)objc_msgSend(a3, "flashLSCPixelBuffer"), (CFTypeRef *)&self->_flashLSCFormatDescription, 0, 0, 1);
    v18 = -[SoftISPProcessor pipelineType](self->_processor, "pipelineType");
    if (self && v18 == 19)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E49F8A18, *MEMORY[0x1E0D05F18]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D05FD0]);
    }
    v19 = psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend(a3, "pixelBuffer"));
    size = (CGSize)*MEMORY[0x1E0C9D820];
    v20 = (const __CFDictionary *)CMGetAttachment(sbuf, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0);
    if (v20 && CGSizeMakeWithDictionaryRepresentation(v20, &size))
    {
      v30.width = (double)(int)v19;
      v30.height = (double)SHIDWORD(v19);
      v21 = CGSizeCreateDictionaryRepresentation(v30);
      CMSetAttachment(sbuf, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), v21, 1u);
      v26 = *MEMORY[0x1E0C9D628];
      v27 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      objc_msgSend(a3, "processingOptions");
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        v23 = *((double *)&v26 + 1);
        v22 = *(double *)&v26;
        height = v27.height;
        width = v27.width;
      }
      else
      {
        width = size.width;
        height = size.height;
        v26 = 0uLL;
        v27 = size;
        v23 = 0.0;
        v22 = 0.0;
      }
      BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(sbuf, CFSTR("OriginalCameraIntrinsicMatrix"), 0, 0, v22, v23, width, height, 0.0, 0.0, (double)(int)v19, (double)SHIDWORD(v19));
    }
    -[BWStillImageProcessorControllerInput setFrame:](-[BWStillImageProcessorControllerRequest input](v5, "input", v26, v27), "setFrame:", 0);
    -[BWStillImageProcessorControllerRequest setOutputFrame:](v5, "setOutputFrame:", sbuf);
  }
  if (sbuf)
    CFRelease(sbuf);

}

@end
