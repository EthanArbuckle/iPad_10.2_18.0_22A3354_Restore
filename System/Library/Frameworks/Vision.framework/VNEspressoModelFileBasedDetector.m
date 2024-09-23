@implementation VNEspressoModelFileBasedDetector

- (unint64_t)networkRequiredInputImageWidth
{
  return self->_networkRequiredInputImageWidth;
}

- (unint64_t)networkRequiredInputImageHeight
{
  return self->_networkRequiredInputImageHeight;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNEspressoModelFileBasedDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v9, sel_completeInitializationForSession_error_, a3))
    return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VNEspressoModelFileBasedDetector _loadEspressoModelWithConfigurationOptions:error:](self, "_loadEspressoModelWithConfigurationOptions:error:", v6, a4);

  return v7;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(id *, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities allComputeDevices](VNComputeDeviceUtilities, "allComputeDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__VNEspressoModelFileBasedDetector_supportedComputeStageDevicesForOptions_error___block_invoke;
  v17 = &unk_1E4547618;
  v8 = v5;
  v18 = v8;
  v20 = a1;
  v9 = v6;
  v19 = v9;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("VNComputeStageMain");
  objc_msgSend(v7, "objectsAtIndexes:", v10, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "espressoModelFileNameForConfigurationOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass((Class)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ did not provide a valid model file name"), v8);

    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (BOOL)_loadEspressoModelWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  unsigned int v30;

  v6 = a3;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend((id)objc_opt_class(), "espressoModelPathForConfigurationOptions:error:", v8, a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28
      || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "BOOLValue"),
          v9,
          v30 = 0,
          !+[VNValidationUtilities getEspressoPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getEspressoPriority:forKey:inOptions:withDefaultValue:error:", &v30, CFSTR("VNDetectorOption_EspressoPlanPriority"), v6, 0, a4)))
    {
      v20 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v27 = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorInitOption_MemoryPoolId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    v13 = v30;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    LOBYTE(v12) = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:](VNEspressoHelpers, "createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:", v28, v7, v26, v13, v14, v15, v16, v12, &v29, a4);
    v17 = v29;
    v18 = v29;

    if ((v12 & 1) == 0)
    {
      v20 = 0;
LABEL_19:
      v8 = v27;

      goto LABEL_20;
    }
    objc_storeStrong((id *)&self->_espressoResources, v17);
    objc_msgSend((id)objc_opt_class(), "espressoModelInputImageDimensionsBlobNameForConfigurationOptions:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (-[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &self->_networkRequiredInputImageWidth, &self->_networkRequiredInputImageHeight, v19, a4))
      {
        if (self->_networkRequiredInputImageWidth && self->_networkRequiredInputImageHeight)
        {
          v20 = 1;
LABEL_18:

          goto LABEL_19;
        }
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected network input image size"));
          v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ did not provide a valid model input image dimensions blob name"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
    goto LABEL_18;
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)getWidth:(unint64_t *)a3 height:(unint64_t *)a4 ofEspressoModelNetworkBlobNamed:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t blob_dimensions;
  void *v13;

  v10 = a5;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "network");
  if (objc_msgSend(v10, "length"))
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  blob_dimensions = espresso_network_query_blob_dimensions();

  if ((_DWORD)blob_dimensions)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not obtain the dimensions of \"%@\"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", blob_dimensions, v13);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (a3)
      *a3 = 0;
    if (a4)
      *a4 = 0;
  }

  return (_DWORD)blob_dimensions == 0;
}

- (VNEspressoResources)espressoResources
{
  return self->_espressoResources;
}

void __73__VNEspressoModelFileBasedDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNEspressoModelFileBasedDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  objc_msgSend(v2, "addObject:", CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));
  objc_msgSend(v2, "addObject:", CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VNEspressoModelFileBasedDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNEspressoModelFileBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  VNSupportedImageSize *v12;
  VNSupportedImageSize *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorInternalOption_ModelComputeDevice"));
    objc_msgSend(a1, "espressoModelPathForConfigurationOptions:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(a1, "espressoModelInputImageDimensionsBlobNameForConfigurationOptions:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = 0;
      if (+[VNEspressoHelpers getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:](VNEspressoHelpers, "getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:", &v17, &v16, v10, v9, a4))
      {
        v11 = objc_msgSend(a1, "networkRequiredInputImagePixelFormatForConfigurationOptions:", v6);
        v12 = [VNSupportedImageSize alloc];
        v13 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:](v12, "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", v11, v17, v16, 1, 0, 0);
        v18[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v11;

  v4 = a3;
  if ((id)objc_opt_class() == a1
    || !+[VisionCoreRuntimeUtilities item:overridesClassSelector:](VNRuntimeUtilities, "item:overridesClassSelector:", a1, sel_espressoModelPathForConfigurationOptions_error_))
  {
    v8 = 0;
  }
  else
  {
    v11 = 0;
    objc_msgSend(a1, "espressoModelPathForConfigurationOptions:error:", v4, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    objc_msgSend(v6, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v5 != 0, v7);

    if (v5)
    {
      objc_msgSend(v5, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hasSuffix:", CFSTR(".espresso.net")))
      {
        objc_msgSend(v8, "stringByDeletingPathExtension");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)espressoModelWeightsFilePathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;

  v6 = a3;
  objc_msgSend(a1, "espressoModelPathForConfigurationOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathForConfigurationOptions:error:]::onceToken != -1)
      dispatch_once(&+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathForConfigurationOptions:error:]::onceToken, &__block_literal_global_25351);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathForConfigurationOptions_error___block_invoke_2;
    aBlock[3] = &unk_1E4547660;
    v8 = v7;
    v13 = v8;
    v9 = _Block_copy(aBlock);
    objc_msgSend((id)+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathForConfigurationOptions:error:]::weightsFilePathCache, "objectForIdentifier:creationBlock:error:", v8, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

id __94__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathForConfigurationOptions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[VNEspressoHelpers weightsFilePathForEspressoNetworkModelFilePath:error:](VNEspressoHelpers, "weightsFilePathForEspressoNetworkModelFilePath:error:", *(_QWORD *)(a1 + 32), a2);
}

void __94__VNEspressoModelFileBasedDetector_espressoModelWeightsFilePathForConfigurationOptions_error___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC6CA0]);
  v1 = (void *)+[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathForConfigurationOptions:error:]::weightsFilePathCache;
  +[VNEspressoModelFileBasedDetector espressoModelWeightsFilePathForConfigurationOptions:error:]::weightsFilePathCache = (uint64_t)v0;

}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  __CVBuffer *v29;
  BOOL v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth");
    v21 = -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight");
    v22 = (double)(unint64_t)objc_msgSend(v19, "width");
    v23 = width * v22;
    v24 = (double)(unint64_t)objc_msgSend(v19, "height");
    v25 = height * v24;
    if (v23 >= v25)
      v26 = v25;
    else
      v26 = v23;
    if (v20 >= v21)
      v27 = v21;
    else
      v27 = v20;
    if (v26 < (double)(unint64_t)v27)
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, v27);
    -[VNDetector configurationOptions](self, "configurationOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (__CVBuffer *)objc_msgSend(v19, "croppedBufferWithWidth:height:format:cropRect:options:error:", v20, v21, objc_msgSend((id)objc_opt_class(), "networkRequiredInputImagePixelFormatForConfigurationOptions:", v28), v17, a8, x * v22, y * v24, v23, v25);
    *a7 = v29;
    v30 = v29 != 0;

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (int)espressoModelNetworkLayersStorageTypeForConfigurationOptions:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:](VNEspressoHelpers, "espressoStorageTypeForComputeDevice:", v4);

  return v5;
}

- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkInputBlobName:forModel:error:](self, "bindBuffer:toNetworkInputBlobName:forModel:error:", a3, v8, v9, a5);

  return (char)a5;
}

- (BOOL)bindBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, a4, 0x10000, 0x10000, a5, a6);
}

- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", a3, v8, v9, a5);

  return (char)a5;
}

- (BOOL)bindClientBuffer:(id *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, a4, 0x10000, 0x20000, a5, a6);
}

- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, v8, 0x20000, 0x10000, v9, a5);

  return (char)a5;
}

- (BOOL)bindBuffer:(id *)a3 toNetworkOutputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  return -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, a4, 0x20000, 0x10000, a5, a6);
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, v10, v7, 0x10000, v11, a6);

  return (char)a6;
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  void *v13;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[VNEspressoModelFileBasedDetector _bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:](self, "_bindBuffer:toNetworkBlobName:bindMode:bindPtr:forModel:error:", a3, v12, v9, v8, v13, a7);

  return (char)a7;
}

- (BOOL)_bindBuffer:(id *)a3 toNetworkBlobName:(id)a4 bindMode:(int)a5 bindPtr:(int)a6 forModel:(id)a7 error:(id *)a8
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;

  v10 = a4;
  v11 = a7;
  objc_msgSend(v11, "network");
  v12 = objc_retainAutorelease(v10);
  objc_msgSend(v12, "UTF8String");
  v13 = espresso_network_bind_buffer();
  v14 = v13;
  if (a8 && (_DWORD)v13)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v13, CFSTR("failed to bind buffer to network"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14 == 0;
}

- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VNEspressoModelFileBasedDetector bindPixelBuffer:toNetworkBlobName:forModel:error:](self, "bindPixelBuffer:toNetworkBlobName:forModel:error:", a3, v8, v9, a5);

  return (char)a5;
}

- (BOOL)bindLockedPixelBuffer:(__CVBuffer *)a3 toNetworkInputBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "network");
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "UTF8String");
  v11 = espresso_network_bind_input_cvpixelbuffer();
  v12 = v11;
  if (a6 && (_DWORD)v11)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v11, CFSTR("failed to bind pixel buffer to network"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12 == 0;
}

- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VNEspressoModelFileBasedDetector bindPixelBuffer:toNetworkBlobName:forModel:error:](self, "bindPixelBuffer:toNetworkBlobName:forModel:error:", a3, v8, v9, a5);

  return (char)a5;
}

- (BOOL)bindPixelBuffer:(__CVBuffer *)a3 toNetworkBlobName:(id)a4 forModel:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "network");
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "UTF8String");
  v11 = espresso_network_bind_cvpixelbuffer();
  v12 = v11;
  if (a6 && (_DWORD)v11)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v11, CFSTR("failed to bind pixel buffer to network"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12 == 0;
}

- (BOOL)executePlanAndReturnError:(id *)a3
{
  void *v5;

  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[VNEspressoModelFileBasedDetector executePlanForModel:error:](self, "executePlanForModel:error:", v5, a3);

  return (char)a3;
}

- (BOOL)executePlanForModel:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;

  v5 = a3;
  objc_msgSend(v5, "plan");
  v6 = espresso_plan_execute_sync();
  v7 = v6;
  if (a4 && (_DWORD)v6)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v6, CFSTR("inference plan failed to execute"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 0;
}

- (unint64_t)inputImageAspectRatioHandling
{
  return self->_inputImageAspectRatioHandling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoResources, 0);
}

uint64_t __81__VNEspressoModelFileBasedDetector_supportedComputeStageDevicesForOptions_error___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1B0B060]();
  v5 = (void *)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("VNDetectorInternalOption_ModelComputeDevice"));
  objc_msgSend(a1[6], "espressoModelWeightsFilePathForConfigurationOptions:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(a1[5], "fileExistsAtPath:", v6);
    if (((v7 | objc_msgSend(v6, "hasSuffix:", CFSTR(".espresso.weights"))) & 1) == 0)
      v7 = +[VNComputeDeviceUtilities isNeuralEngineComputeDevice:](VNComputeDeviceUtilities, "isNeuralEngineComputeDevice:", v3);
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

@end
