@implementation VNImageSegmenter

+ (int64_t)maximumTargetPoints
{
  return 512;
}

+ (BOOL)supportsExecution
{
  return VNANEComputeDeviceSupportsExecution(13);
}

+ (BOOL)modelFullyANEResident
{
  void *v2;
  void *v3;
  BOOL v4;

  VNANEArchitectureName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue") != 13;
  else
    v4 = 0;

  return v4;
}

+ (id)_observationFeatureNameToSegmenterCategoryMappingsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "specifiesRequestClass:", objc_opt_class())
    && objc_msgSend(v5, "requestRevision") == 1)
  {
    v8[0] = CFSTR("VNImageSegmentationFeatureForeground");
    v8[1] = CFSTR("VNImageSegmentationFeatureBackground");
    v9[0] = &unk_1E459CE80;
    v9[1] = &unk_1E459CE98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v5);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VNImageSegmenter_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageSegmenter configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNImageSegmenter configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)supportedFeaturesForOptions:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_observationFeatureNameToSegmenterCategoryMappingsForOriginatingRequestSpecifier:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities computeDevicesOfTypes:](VNComputeDeviceUtilities, "computeDevicesOfTypes:", 4, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  VNModelCatalogBridgingInterface *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(VNModelCatalogBridgingInterface);
  -[VNModelCatalogBridgingInterface foregroundBackgroundSegmentationModelBundleURLWithError:](v5, "foregroundBackgroundSegmentationModelBundleURLWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("foregroundbackgroundsegmenter.mlmodelc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("model.specialization.bundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)modelDropRevisionForConfigurationOptions:(id)a3 error:(id *)a4
{
  VNModelCatalogBridgingInterface *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v5 = objc_alloc_init(VNModelCatalogBridgingInterface);
  -[VNModelCatalogBridgingInterface foregroundBackgroundSegmentationModelBundleURLWithError:](v5, "foregroundBackgroundSegmentationModelBundleURLWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("foregroundbackgroundsegmenter.mlmodelc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("metadata.json"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

    if ((v12 & 1) == 0)
    {
      +[VNError errorForMissingOptionNamed:](VNError, "errorForMissingOptionNamed:", CFSTR("metadata.json missing in .mlmodelc bundle "));
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }
    v13 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithContentsOfFile:options:error:", v14, 1, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v21 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 1, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", CFSTR("version"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v20, "setNumberStyle:", 1);
        objc_msgSend(v20, "numberFromString:", v19);
        v21 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[VNError errorForMissingOptionNamed:](VNError, "errorForMissingOptionNamed:", CFSTR("version missing"));
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_16;
    }
    if (a4)
    {
      +[VNError errorForInvalidFormatErrorWithLocalizedDescription:](VNError, "errorForInvalidFormatErrorWithLocalizedDescription:", CFSTR("metadata.json is not formatted correctly"));
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_13:
      v21 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v24;

  v6 = a3;
  objc_msgSend(a1, "modelURLForConfigurationOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelDropRevisionForConfigurationOptions:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v24 = v9;
  VNValidatedLog(1, (uint64_t)CFSTR("segmentation model : %@ MD%f"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);

  if (!v7)
    goto LABEL_13;
  if (!objc_msgSend(MEMORY[0x1E0DC6C40], "isProgramLibraryAtURL:", v7))
  {
    if (objc_msgSend(MEMORY[0x1E0DC6C38], "isModelSourceURL:", v7))
    {
      objc_msgSend(MEMORY[0x1E0DC6C38], "modelSourceFromURL:error:", v7, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(a1, "E5RTProgramLibraryCompilationOptionsForModelSource:configurationOptions:error:", v17, v6, a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        VNANEArchitectureName();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        VNANEGenerationNumberForArchitectureName((uint64_t)v19, (uint64_t)a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_14;
        if ((unint64_t)objc_msgSend(v20, "integerValue") <= 0xD)
          objc_msgSend(v18, "setCustomCompilationOptions:", CFSTR("MemCacheStrategy=None"));
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0DC6C40], "compileModelSource:options:error:", v17, v18, a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_14:
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }
      goto LABEL_17;
    }
    if (a4)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Could not open program library for %@"), v22, *(_QWORD *)&v24);

      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v17);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0DC6C40], "programLibraryForURL:error:", v7, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v16;
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;
  id v18;

  v6 = a3;
  objc_msgSend(a1, "modelURLForConfigurationOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v7, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("VNImageSegmenter2:%@"), v9);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__VNImageSegmenter_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
    aBlock[3] = &unk_1E4548D60;
    v18 = a1;
    v17 = v6;
    v11 = _Block_copy(aBlock);
    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detectorDescriptorsCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForIdentifier:creationBlock:error:", v10, v11, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __72__VNImageSegmenter_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "E5RTProgramLibraryForConfigurationOptions:error:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "functionNamed:error:", CFSTR("main"), a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptorOfClass:forInput:error:", objc_opt_class(), CFSTR("input"), a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v6;
    if (v6)
    {
      v22[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = 0; objc_msgSend(&unk_1E459E228, "count", v20, v21) > i; ++i)
      {
        v9 = objc_opt_class();
        objc_msgSend(&unk_1E459E228, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "descriptorOfClass:forInput:error:", v9, v10, a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v7, "addObject:", v11);

      }
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (j = 0; ; ++j)
      {
        if (objc_msgSend(&unk_1E459E240, "count") <= j)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6CC0]), "initWithMajor:", 1);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C30]), "initWithFunction:inputDescriptors:inputImageDescriptors:outputDescriptors:confidencesOutputDescriptors:networkVersion:", v5, v7, v20, v13, 0, v18);

          goto LABEL_16;
        }
        v15 = objc_opt_class();
        objc_msgSend(&unk_1E459E240, "objectAtIndexedSubscript:", j);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "descriptorOfClass:forOutput:error:", v15, v16, a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          break;
        objc_msgSend(v13, "addObject:", v17);

      }
      v12 = 0;
LABEL_16:

LABEL_17:
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __57__VNImageSegmenter_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageSegmenter;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageSegmenter configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromImageBuffer:(vImage_Buffer *)a4 ofType:(int)a5 options:(id)a6 error:(id *)a7
{
  __int16 v8;
  id v11;
  __CVBuffer *DeepCopyCVPixelBufferFromVImageBuffer;
  __CVBuffer *v13;
  __CVBuffer *v14;
  VNImageBuffer *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  unsigned int v35;

  v8 = a5;
  v11 = a6;
  v35 = 0;
  DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)a4, v8, (int *)&v35);
  if (DeepCopyCVPixelBufferFromVImageBuffer)
  {
    v13 = DeepCopyCVPixelBufferFromVImageBuffer;
    if (CVPixelBufferGetPixelFormatType(DeepCopyCVPixelBufferFromVImageBuffer) == a3)
    {
      v14 = CVPixelBufferRetain(v13);
    }
    else
    {
      v15 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:", v13, 1, 0);
      objc_msgSend(v11, "objectForKey:", CFSTR("scaleX"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      objc_msgSend(v11, "objectForKey:", CFSTR("scaleY"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(v11, "objectForKey:", CFSTR("normOrigOffsetX"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      objc_msgSend(v11, "objectForKey:", CFSTR("normOrigOffsetY"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      objc_msgSend(v11, "objectForKey:", CFSTR("inputSizeWidth"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      objc_msgSend(v11, "objectForKey:", CFSTR("inputSizeHeight"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      v14 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v15, "croppedBufferWithWidth:height:format:cropRect:options:error:", (double)(unint64_t)(v24 * (double)-[VNImageBuffer width](v15, "width")), (double)(unint64_t)(v27 * (double)-[VNImageBuffer height](v15, "height")), (double)(unint64_t)(v18 * v30), (double)(unint64_t)(v21 * v33));
    }
    CVPixelBufferRelease(v13);
  }
  else if (a7)
  {
    +[VNError errorForOSStatus:localizedDescription:](VNError, "errorForOSStatus:localizedDescription:", v35, CFSTR("could not create image pixel buffer"));
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 category:(int)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v10;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  _OWORD v19[2];
  void *v20[2];
  __int128 v21;
  unsigned int v22;

  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22 = 0;
  *(_OWORD *)v20 = 0u;
  v21 = 0u;
  if (v14
    && (objc_msgSend(v14, "generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:", v15, v10, 0, &v22),
        v20[0]))
  {
    v19[0] = *(_OWORD *)v20;
    v19[1] = v21;
    a8 = -[VNImageSegmenter _createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:](self, "_createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:", v12, v19, v22, v16, a8);
    free(v20[0]);
  }
  else if (a8)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("could not create mask for feature category %d"), v10);
    +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v17);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    a8 = 0;
  }

  return (__CVBuffer *)a8;
}

- (__CVBuffer)_createPixelBufferOfFormat:(unsigned int)a3 fromSegmenter:(id)a4 instanceFeatures:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  _OWORD v17[2];
  void *v18[2];
  __int128 v19;
  unsigned int v20;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20 = 0;
  *(_OWORD *)v18 = 0u;
  v19 = 0u;
  if (v12 && (objc_msgSend(v12, "generateMaskForInstanceFeatures:maskImageType:", v13, &v20), v18[0]))
  {
    v17[0] = *(_OWORD *)v18;
    v17[1] = v19;
    a7 = -[VNImageSegmenter _createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:](self, "_createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:", v10, v17, v20, v14, a7);
    free(v18[0]);
  }
  else if (a7)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("could not create mask for all features"));
    +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v15);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return (__CVBuffer *)a7;
}

- (BOOL)_addInstanceMaskBuffersForCategory:(id)a3 toInstanceMaskArray:(id)a4 connectedComponentResult:(const void *)a5 featureInstanceMaskMap:(id)a6 options:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  double **v16;
  double **v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  VNFgBgE5MLInstanceSegmenter *fgbgInstanceSegmenter;
  __CVBuffer *v25;
  BOOL v26;
  id v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  _OWORD v35[2];
  void *v36[2];
  __int128 v37;

  v32 = a3;
  v33 = a4;
  v14 = a6;
  v15 = a7;
  v17 = (double **)*((_QWORD *)a5 + 10);
  v16 = (double **)*((_QWORD *)a5 + 11);
  while (1)
  {
    if (v17 == v16)
    {
      v29 = 1;
      goto LABEL_23;
    }
    v18 = **v17;
    v19 = (*v17)[1];
    v20 = (int)v18;
    v21 = (int)v19;
    if ((v20 & 0x80000000) != 0 || (v22 = *((_QWORD *)a5 + 13), v22 <= v20) || (v21 & 0x80000000) != 0)
    {
      if (a8)
        goto LABEL_20;
      v22 = *((_QWORD *)a5 + 13);
    }
    else if (a8 && *((_QWORD *)a5 + 14) <= v21)
    {
LABEL_20:
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Point (%i, %i) is out of the mask image bounds of %lu x %lu"), v20, v21, *((_QWORD *)a5 + 13), *((_QWORD *)a5 + 14));
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v30);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    v23 = *(_QWORD *)(*(_QWORD *)a5 + 8 * (unint64_t)(v18 + v19 * (double)v22));
    *(_OWORD *)v36 = 0u;
    v37 = 0u;
    fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
    if (fgbgInstanceSegmenter)
      -[VNFgBgE5MLInstanceSegmenter generateMaskForLabel:fromConnectedComponents:error:](fgbgInstanceSegmenter, "generateMaskForLabel:fromConnectedComponents:error:", v23, a5, a8);
    v35[0] = *(_OWORD *)v36;
    v35[1] = v37;
    v25 = -[VNImageSegmenter _createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:](self, "_createPixelBufferOfFormat:fromImageBuffer:ofType:options:error:", 1278226534, v35, 1, v15, a8);
    free(v36[0]);
    v36[0] = 0;
    if (!v25)
      goto LABEL_22;
    v34 = 0;
    v26 = +[VNValidationUtilities getOptionalArray:forKey:inOptions:withElementsOfClass:error:](VNValidationUtilities, "getOptionalArray:forKey:inOptions:withElementsOfClass:error:", &v34, CFSTR("targetPts"), v15, objc_opt_class(), a8);
    v27 = v34;
    v28 = v27;
    if (!v26)
      break;
    if (!objc_msgSend(v27, "count")
      || -[VNImageSegmenter _instanceMask:containsTargetPoints:](self, "_instanceMask:containsTargetPoints:", v25, v28))
    {
      objc_msgSend(v33, "addObject:", v25);

      objc_msgSend(v14, "addObject:", v32);
    }

    v17 += 3;
  }

LABEL_22:
  v29 = 0;
LABEL_23:

  return v29;
}

- (id)_observationsFromSegmenter:(id)a3 instanceFeatures:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 maskPixelFormatType:(unsigned int)a7 error:(id *)a8
{
  __CVBuffer *v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  __CVBuffer *v30;
  id v31;
  VNFgBgE5MLInstanceSegmenter *fgbgInstanceSegmenter;
  uint64_t v33;
  VNFgBgE5MLInstanceSegmenter *v34;
  uint64_t v35;
  VNFgBgE5MLInstanceSegmenter *v36;
  VNFgBgE5MLInstanceSegmenter *v37;
  VNFgBgE5MLInstanceSegmenter *v38;
  uint64_t v39;
  VNFgBgE5MLInstanceSegmenter *v40;
  BOOL v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  VNInstanceMaskObservation *v46;
  void *v48;
  CVPixelBufferRef texture;
  id v50;
  id v51;
  id v52;
  VNInstanceMaskObservation *obj;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[2];
  void *v64[2];
  __int128 v65;
  void *v66[2];
  void *__p[2];
  __int128 v68;
  _OWORD v69[4];
  void *v70[2];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74[2];
  __int128 v75;
  void *v76[2];
  void *v77[2];
  __int128 v78;
  _OWORD v79[4];
  _OWORD v80[2];
  void *v81[2];
  __int128 v82;
  void *v83[2];
  void *v84[2];
  __int128 v85;
  _OWORD v86[4];
  void *v87[2];
  __int128 v88;
  void *v89[2];
  __int128 v90;
  int v91;
  id v92;
  void **v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v54 = a4;
  v50 = a5;
  v58 = a6;
  v52 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = -[VNImageSegmenter _createPixelBufferOfFormat:fromSegmenter:instanceFeatures:options:error:](self, "_createPixelBufferOfFormat:fromSegmenter:instanceFeatures:options:error:", 1278226534, v56, v54, v58, a8);
  texture = v13;
  if (v13)
  {
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("disableCCRefinement"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend((id)v14, "BOOLValue");

    v92 = 0;
    LOBYTE(v14) = +[VNValidationUtilities getOptionalArray:forKey:inOptions:withElementsOfClass:error:](VNValidationUtilities, "getOptionalArray:forKey:inOptions:withElementsOfClass:error:", &v92, CFSTR("targetPts"), v58, objc_opt_class(), a8);
    v16 = v92;
    v48 = v16;
    if ((v14 & 1) == 0)
      goto LABEL_74;
    v17 = objc_msgSend(v16, "count");
    if ((v15 & 1) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = (VNInstanceMaskObservation *)v54;
      v18 = -[VNInstanceMaskObservation countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v95, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v60;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v60 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v21, "miyoshiCategoryName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Foreground Object"));

            if (v23)
              objc_msgSend(v57, "addObject:", CFSTR("VNImageSegmentationFeatureForeground"));
            objc_msgSend(v21, "miyoshiCategoryName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Background Object"));

            if (v25)
              objc_msgSend(v57, "addObject:", CFSTR("VNImageSegmentationFeatureBackground"));
            objc_msgSend(v21, "miyoshiCategoryName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Scene Background"));
            if (v17)
              v28 = v27;
            else
              v28 = 0;

            if (v28)
              objc_msgSend(v57, "addObject:", CFSTR("VNImageSegmentationFeatureBackground"));
            v94 = v21;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[VNImageSegmenter _createPixelBufferOfFormat:fromSegmenter:instanceFeatures:category:options:error:](self, "_createPixelBufferOfFormat:fromSegmenter:instanceFeatures:category:options:error:", 1278226534, v56, v29, objc_msgSend(v21, "miyoshiCategory"), v58, a8);

            if (!v30)
            {
              v31 = 0;
              goto LABEL_73;
            }
            objc_msgSend(v55, "addObject:", v30);

          }
          v18 = -[VNInstanceMaskObservation countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v95, 16);
          if (v18)
            continue;
          break;
        }
      }

      goto LABEL_72;
    }
    v91 = 0;
    *(_OWORD *)v89 = 0u;
    v90 = 0u;
    fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
    v33 = objc_msgSend(&unk_1E459CE80, "intValue");
    if (fgbgInstanceSegmenter)
    {
      -[VNFgBgE5MLInstanceSegmenter generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:](fgbgInstanceSegmenter, "generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:", v54, v33, 0, &v91);
    }
    else
    {
      *(_OWORD *)v89 = 0u;
      v90 = 0u;
    }
    *(_OWORD *)v87 = 0u;
    v88 = 0u;
    v34 = self->_fgbgInstanceSegmenter;
    v35 = objc_msgSend(&unk_1E459CE98, "intValue");
    if (v34)
    {
      -[VNFgBgE5MLInstanceSegmenter generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:](v34, "generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:", v54, v35, 0, &v91);
    }
    else
    {
      *(_OWORD *)v87 = 0u;
      v88 = 0u;
    }
    v36 = self->_fgbgInstanceSegmenter;
    v80[0] = *(_OWORD *)v89;
    v80[1] = v90;
    if (v36)
    {
      -[VNFgBgE5MLInstanceSegmenter generateInstanceConnectedComponentsFromMask:](v36, "generateInstanceConnectedComponentsFromMask:", v80);
      v37 = self->_fgbgInstanceSegmenter;
      v72 = *(_OWORD *)v87;
      v73 = v88;
      if (v37)
      {
        -[VNFgBgE5MLInstanceSegmenter generateInstanceConnectedComponentsFromMask:](v37, "generateInstanceConnectedComponentsFromMask:", &v72);
        goto LABEL_35;
      }
    }
    else
    {
      memset(v86, 0, sizeof(v86));
      *(_OWORD *)v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      *(_OWORD *)v83 = 0u;
      *(_OWORD *)v81 = 0u;
      v72 = *(_OWORD *)v87;
      v73 = v88;
    }
    memset(v79, 0, sizeof(v79));
    *(_OWORD *)v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    *(_OWORD *)v76 = 0u;
    *(_OWORD *)v74 = 0u;
LABEL_35:
    free(v89[0]);
    v89[0] = 0;
    free(v87[0]);
    v87[0] = 0;
    if (!-[VNImageSegmenter _addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:](self, "_addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:", CFSTR("VNImageSegmentationFeatureForeground"), v55, v81, v57, v58, a8)|| !-[VNImageSegmenter _addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:](self, "_addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:", CFSTR("VNImageSegmentationFeatureBackground"), v55, v74, v57, v58, a8))
    {
      goto LABEL_54;
    }
    if (!v17)
      goto LABEL_53;
    *(_OWORD *)v70 = 0u;
    v71 = 0u;
    v38 = self->_fgbgInstanceSegmenter;
    v39 = objc_msgSend(&unk_1E459CEB0, "intValue");
    if (v38)
    {
      -[VNFgBgE5MLInstanceSegmenter generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:](v38, "generateMaskFromInstanceFeatures:toCategory:drawBox:maskImageType:", v54, v39, 0, &v91);
    }
    else
    {
      *(_OWORD *)v70 = 0u;
      v71 = 0u;
    }
    v40 = self->_fgbgInstanceSegmenter;
    v63[0] = *(_OWORD *)v70;
    v63[1] = v71;
    if (v40)
    {
      -[VNFgBgE5MLInstanceSegmenter generateInstanceConnectedComponentsFromMask:](v40, "generateInstanceConnectedComponentsFromMask:", v63);
    }
    else
    {
      memset(v69, 0, sizeof(v69));
      *(_OWORD *)__p = 0u;
      v68 = 0u;
      v65 = 0u;
      *(_OWORD *)v66 = 0u;
      *(_OWORD *)v64 = 0u;
    }
    free(v70[0]);
    v70[0] = 0;
    v41 = -[VNImageSegmenter _addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:](self, "_addInstanceMaskBuffersForCategory:toInstanceMaskArray:connectedComponentResult:featureInstanceMaskMap:options:error:", CFSTR("VNImageSegmentationFeatureScene"), v55, v64, v57, v58, a8);
    v93 = (void **)v69;
    std::vector<std::vector<CGPoint>>::__destroy_vector::operator()[abi:ne180100](&v93);
    if (__p[1])
    {
      *(void **)&v68 = __p[1];
      operator delete(__p[1]);
    }
    if (v66[0])
    {
      v66[1] = v66[0];
      operator delete(v66[0]);
    }
    if (v64[1])
    {
      *(void **)&v65 = v64[1];
      operator delete(v64[1]);
    }
    v42 = v64[0];
    v64[0] = 0;
    if (v42)
      MEMORY[0x1A1B0A880](v42, 0x1000C8000313F17);
    if (v41)
LABEL_53:
      v43 = 1;
    else
LABEL_54:
      v43 = 0;
    v64[0] = v79;
    std::vector<std::vector<CGPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)v64);
    if (v77[1])
    {
      *(void **)&v78 = v77[1];
      operator delete(v77[1]);
    }
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    if (v74[1])
    {
      *(void **)&v75 = v74[1];
      operator delete(v74[1]);
    }
    v44 = v74[0];
    v74[0] = 0;
    if (v44)
      MEMORY[0x1A1B0A880](v44, 0x1000C8000313F17);
    v74[0] = v86;
    std::vector<std::vector<CGPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)v74);
    if (v84[1])
    {
      *(void **)&v85 = v84[1];
      operator delete(v84[1]);
    }
    if (v83[0])
    {
      v83[1] = v83[0];
      operator delete(v83[0]);
    }
    if (v81[1])
    {
      *(void **)&v82 = v81[1];
      operator delete(v81[1]);
    }
    v45 = v81[0];
    v81[0] = 0;
    if (v45)
      MEMORY[0x1A1B0A880](v45, 0x1000C8000313F17);
    if ((v43 & 1) != 0)
    {
LABEL_72:
      v46 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceMask:numComponents:regionOfInterest:]([VNInstanceMaskObservation alloc], "initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceMask:numComponents:regionOfInterest:", v50, v55, v57, texture, objc_msgSend(v55, "count") + 1, 0.0, 0.0, 1.0, 1.0);
      -[VNObservation setUUID:](v46, "setUUID:", v52);
      objc_msgSend(v51, "addObject:", v46);
      obj = v46;
      v31 = v51;
LABEL_73:

      goto LABEL_75;
    }
LABEL_74:
    v31 = 0;
LABEL_75:

    v13 = texture;
    goto LABEL_76;
  }
  v31 = 0;
LABEL_76:
  CVPixelBufferRelease(v13);

  return v31;
}

- (BOOL)_instanceMask:(__CVBuffer *)a3 containsTargetPoints:(id)a4
{
  id v5;
  size_t Height;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  size_t v16;
  uint64_t v17;
  size_t v18;
  BOOL v19;
  size_t BytesPerRow;
  _BOOL4 v21;
  int v22;
  id obj;
  size_t Width;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v7)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v8 = 0;
  v9 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v11, "x");
      objc_msgSend(v11, "y");
      CVPixelBufferGetWidth(a3);
      CVPixelBufferGetHeight(a3);
      VisionCoreImagePointForNormalizedPoint();
      v13 = v12;
      v15 = v14;
      v16 = CVPixelBufferGetHeight(a3);
      v17 = (int)v13;
      if ((v17 & 0x80000000) != 0
        || (v18 = (int)((double)v16 - v15), (v18 & 0x80000000) != 0)
        || (Width > v17 ? (v19 = Height > v18) : (v19 = 0), !v19))
      {

        goto LABEL_18;
      }
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v21 = *((float *)CVPixelBufferGetBaseAddress(a3) + (int)((BytesPerRow >> 2) * v18) + v17) != 0.0;
      v8 |= v21;
      v22 = 2 * v21;
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      if (v22)
      {

        if (v22 == 2)
          goto LABEL_22;
LABEL_18:
        v8 = 0;
        goto LABEL_22;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
      continue;
    break;
  }
LABEL_20:

LABEL_22:
  return v8 & 1;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  VNFgBgE5MLInstanceSegmenter *v7;
  VNFgBgE5MLInstanceSegmenter *fgbgInstanceSegmenter;
  VNFgBgE5MLInstanceSegmenter *v9;
  BOOL v10;
  id v11;
  void *v12;
  float v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNImageSegmenter;
  if (-[VNE5RTBasedDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, v6, a4))
  {
    +[VNFgBgE5MLInstanceSegmenter instanceSegmenterWithRevision:error:](VNFgBgE5MLInstanceSegmenter, "instanceSegmenterWithRevision:error:", 1, a4);
    v7 = (VNFgBgE5MLInstanceSegmenter *)objc_claimAutoreleasedReturnValue();
    fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
    self->_fgbgInstanceSegmenter = v7;

    v9 = self->_fgbgInstanceSegmenter;
    v10 = v9 != 0;
    if (v9)
    {
      -[VNFgBgE5MLInstanceSegmenter configuration](v9, "configuration");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "thresholds");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultValidMinimumMaskPixelCount");
      self->_minimumMaskPixelCount = (unint64_t)v13;
    }
    else
    {
      v11 = *a4;
      v14 = objc_msgSend(v11, "code");
      objc_msgSend(v11, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageSegmenter errorForVNFgBgInstanceSegmenterErrorCode:localizedDescription:](self, "errorForVNFgBgInstanceSegmenterErrorCode:localizedDescription:", v14, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  VNFgBgE5MLInputTensors *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  VNFgBgE5MLInputTensors *v35;
  VNFgBgE5MLInputTensors *v36;
  void *v37;
  void *v38;
  id v40;
  void *__p[3];
  id v42;

  v40 = a3;
  v9 = a5;
  v42 = 0;
  v10 = +[VNValidationUtilities getOptionalArray:forKey:inOptions:withElementsOfClass:error:](VNValidationUtilities, "getOptionalArray:forKey:inOptions:withElementsOfClass:error:", &v42, CFSTR("targetPts"), v9, objc_opt_class(), a6);
  v11 = v42;
  v12 = v11;
  if (v10
    && (!objc_msgSend(v11, "count")
     || -[VNImageSegmenter _validatePoints:error:](self, "_validatePoints:error:", v12, a6)))
  {
    if (objc_msgSend(v12, "count"))
    {
      -[VNImageSegmenter _oneDimensionalArrayFromInputVNPointArray:](self, "_oneDimensionalArrayFromInputVNPointArray:", v12);
      v35 = [VNFgBgE5MLInputTensors alloc];
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v37, "queryNumber");
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "maxSpatialLength");
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputSize");
      v18 = v17;
      v20 = v19;
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[VNFgBgE5MLInputTensors initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:](v35, "initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:", __p, v13, v15, objc_msgSend(v21, "radius"), a6, v18, v20);

      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      v36 = [VNFgBgE5MLInputTensors alloc];
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v38, "queryNumber");
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "maxSpatialLength");
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "inputSize");
      v29 = v28;
      v31 = v30;
      -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[VNFgBgE5MLInputTensors initWithTargetPoint:queryNumber:maxSpatialLength:inputSize:radius:error:](v36, "initWithTargetPoint:queryNumber:maxSpatialLength:inputSize:radius:error:", v24, v26, objc_msgSend(v32, "radius"), a6, -1.0, -1.0, v29, v31);

    }
    -[VNFgBgE5MLInstanceSegmenter process](self->_fgbgInstanceSegmenter, "process");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v33, "newInputsForFunctionDescriptor:inputSurfaces:croppedPixelBuffer:error:", v40, v22, a4, a6);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  VNFgBgE5MLOutputs *v14;
  VNFgBgE5MLInstanceSegmenter *fgbgInstanceSegmenter;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v32 = a5;
  v30 = v12;
  v31 = a6;
  v29 = v13;
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("minMask"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a7;
  self->_minimumMaskPixelCount = objc_msgSend(v28, "unsignedIntegerValue");
  v14 = -[VNFgBgE5MLOutputs initWithOutputs:descriptor:]([VNFgBgE5MLOutputs alloc], "initWithOutputs:descriptor:", v12, v13);
  fgbgInstanceSegmenter = self->_fgbgInstanceSegmenter;
  -[VNFgBgE5MLOutputs segments](v14, "segments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFgBgE5MLOutputs predictionMiyoshiConfidence](v14, "predictionMiyoshiConfidence");
  v16 = objc_claimAutoreleasedReturnValue();
  -[VNFgBgE5MLOutputs predictionCocoConfidence](v14, "predictionCocoConfidence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFgBgE5MLOutputs predictionIoU](v14, "predictionIoU");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFgBgE5MLOutputs stabilityScore](v14, "stabilityScore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFgBgE5MLOutputs decodeMatch](v14, "decodeMatch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = 0;
  v21 = (void *)v16;
  -[VNFgBgE5MLInstanceSegmenter composeInstanceFeatures:miyoshiConfidence:cocoConfidence:predictionIoU:stabilityScore:decodeMatch:isRotated:minimumMaskPixelCount:](fgbgInstanceSegmenter, "composeInstanceFeatures:miyoshiConfidence:cocoConfidence:predictionIoU:stabilityScore:decodeMatch:isRotated:minimumMaskPixelCount:", v27, v16, v17, v18, v19, v20, v25, self->_minimumMaskPixelCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[VNImageSegmenter _observationsFromSegmenter:instanceFeatures:originatingRequestSpecifier:options:maskPixelFormatType:error:](self, "_observationsFromSegmenter:instanceFeatures:originatingRequestSpecifier:options:maskPixelFormatType:error:", self->_fgbgInstanceSegmenter, v22, v32, v31, 0, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)errorForVNFgBgInstanceSegmenterErrorCode:(int64_t)a3 localizedDescription:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFF9)
    v6 = 11;
  else
    v6 = *((_QWORD *)&unk_1A15F9020 + a3 + 6);
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __CVBuffer *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CVBuffer *v42;
  BOOL v43;
  id v45;
  __int128 v46;
  double v47;
  double v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "width");
    v22 = objc_msgSend(v20, "height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v20, "width"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("inputSizeWidth"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v20, "height"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("inputSizeHeight"));

    -[VNFgBgE5MLInstanceSegmenter configuration](self->_fgbgInstanceSegmenter, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "inputSize");
    v28 = v26;
    v29 = v27;
    v30 = width;
    v31 = width * (double)v21;
    v32 = height;
    v33 = height * (double)v22;
    if (v26 >= v27)
      v26 = v27;
    if (v31 >= v33)
      v34 = v33;
    else
      v34 = v31;
    if (v34 < v26)
    {
      if (v30 >= v32)
        v35 = v32;
      else
        v35 = v30;
      if (v35 <= 0.0)
        v35 = 1.0;
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)(v26 / v35));
    }
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    v47 = 0.0;
    v48 = 0.0;
    v46 = *MEMORY[0x1E0C9D538];
    v45 = 0;
    v36 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", (unint64_t)v28, (unint64_t)v29, 1111970369, 1, v17, a8, x * (double)v21, y * (double)v22, v31, v33, &v46, &v48, &v47, &v45);
    v37 = v45;
    *a7 = v36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v46);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v38, CFSTR("normOrigOffsetX"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v46 + 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v39, CFSTR("normOrigOffsetY"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v40, CFSTR("scaleX"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v41, CFSTR("scaleY"));

    v42 = *a7;
    v43 = *a7 != 0;
    if (v42)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v17, v37, v20);

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (BOOL)_validatePoints:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGRect v28;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") < 0x201)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "x");
          v13 = v12;
          objc_msgSend(v11, "y");
          v27.y = v14;
          v28.origin.x = 0.0;
          v28.origin.y = 0.0;
          v28.size.width = 1.0;
          v28.size.height = 1.0;
          v27.x = v13;
          if (!CGRectContainsPoint(v28, v27))
          {
            if (a4)
            {
              v15 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v11, "x");
              v17 = v16;
              objc_msgSend(v11, "y");
              objc_msgSend(v15, "stringWithFormat:", CFSTR(" pointOfInterest value is out of bounds: %f,%f"), v17, v18, (_QWORD)v21);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 4, v19);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              LOBYTE(a4) = 0;
            }
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
          continue;
        break;
      }
    }
    LOBYTE(a4) = 1;
LABEL_15:

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("target points array contains more than maximum allowed quantity of %lu"), 512);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 4, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (vector<float,)_oneDimensionalArrayFromInputVNPointArray:(VNImageSegmenter *)self
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  vector<float, std::allocator<float>> *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v19 = -1082130432;
  std::vector<float>::vector(retstr, 0x400uLL, &v19);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        if (v8 < (unint64_t)(retstr->__end_ - retstr->__begin_))
        {
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "x", (_QWORD)v15);
          *(float *)&v12 = v12;
          retstr->__begin_[2 * v8] = *(float *)&v12;
          objc_msgSend(v11, "y");
          *(float *)&v13 = v13;
          *(float *)((char *)retstr->__begin_ + ((8 * v8++) | 4)) = 1.0 - *(float *)&v13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fgbgInstanceSegmenter, 0);
}

@end
