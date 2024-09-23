@implementation VNImageAnalyzerBasedDetector

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  return 0;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (BOOL)providesSceneLabelsForConfiguration:(id)a3
{
  return 0;
}

+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 0;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities espressoV1ModelComputeDevices](VNComputeDeviceUtilities, "espressoV1ModelComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  VNSupportedImageSize *v11;
  VNSupportedImageSize *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "modelPathForConfiguration:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(a1, "inputImageBlobNameForConfiguration:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15 = 0;
      v16 = 0;
      if (+[VNEspressoHelpers getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:](VNEspressoHelpers, "getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:", &v16, &v15, v9, v8, a4))
      {
        v10 = objc_msgSend(a1, "analysisPixelFormatTypeForConfiguration:", v6);
        v11 = [VNSupportedImageSize alloc];
        v12 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:](v11, "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", v10, v16, v15, 1, 0, 0);
        v17[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
    }
    else if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VNImageAnalyzerBasedDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __69__VNImageAnalyzerBasedDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerBasedDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageAnalyzerBasedDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (CGSize)inputImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_networkRequiredInputImageSize.width;
  height = self->_networkRequiredInputImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 0;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  id v14;

  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    *((_DWORD *)a3 + 9) = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:](VNEspressoHelpers, "espressoDeviceIDForComputeDevice:", v6);
    *((_DWORD *)a3 + 8) = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:](VNEspressoHelpers, "espressoStorageTypeForComputeDevice:", v6);
    *((_DWORD *)a3 + 6) = +[VNEspressoHelpers espressoEngineForComputeDevice:](VNEspressoHelpers, "espressoEngineForComputeDevice:", v6);
    *((_DWORD *)a3 + 7) = 0;
    *((_BYTE *)a3 + 385) = 1;
    objc_msgSend(v8, "modelPathForConfiguration:error:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingPathExtension");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::__assign_external((std::string *)a3, (const std::string::value_type *)objc_msgSend(v11, "UTF8String"));

    v12 = objc_msgSend(v8, "analysisPixelFormatTypeForConfiguration:", v7);
    if (v12 <= 1094862673)
    {
      if (v12 == 8)
      {
        v13 = 1;
        goto LABEL_14;
      }
      if (v12 == 32)
      {
        v13 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      switch(v12)
      {
        case 1380401729:
          v13 = 2;
          goto LABEL_14;
        case 1111970369:
          v13 = 4;
          goto LABEL_14;
        case 1094862674:
          v13 = 16;
LABEL_14:
          *((_DWORD *)a3 + 10) = v13;
          objc_msgSend(v8, "inputImageBlobNameForConfiguration:", v7);
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::__assign_external((std::string *)a3 + 2, (const std::string::value_type *)objc_msgSend(v14, "UTF8String"));

          goto LABEL_15;
      }
    }
    v13 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v6 != 0;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 0;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5, *(_QWORD *)&a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)supportedClassificationIdentifiersAcceptedByBlock:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *cachedSupportedClassificationIdentifiers;
  uint64_t *LabelsList;
  uint64_t *DisallowedLabels;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *context;

  v6 = a3;
  if ((-[VNImageAnalyzerBasedDetector _validateProvidesSceneLabelsAndReturnError:]((uint64_t)self, a4) & 1) != 0)
  {
    cachedSupportedClassificationIdentifiers = self->_cachedSupportedClassificationIdentifiers;
    if (!cachedSupportedClassificationIdentifiers)
    {
      LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, 2u);
      DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels((uint64_t)self->_imageAnalyzer.__ptr_, 2u);
      context = (void *)MEMORY[0x1A1B0B060]();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((LabelsList[1] - *LabelsList) >> 3) - DisallowedLabels[3]);
      v11 = *LabelsList;
      v12 = LabelsList[1];
      if (*LabelsList != v12)
      {
        do
        {
          if (!std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(DisallowedLabels, (unsigned __int8 *)v11))
          {
            v13 = objc_alloc(MEMORY[0x1E0CB3940]);
            v14 = v11;
            if (*(char *)(v11 + 23) < 0)
              v14 = *(_QWORD *)v11;
            v15 = (void *)objc_msgSend(v13, "initWithUTF8String:", v14);
            if (_isAcceptableRecognizedObjectIdentifier(v15, v6))
              objc_msgSend(v10, "addObject:", v15);

          }
          v11 += 24;
        }
        while (v11 != v12);
      }
      objc_msgSend(v10, "sortUsingSelector:", sel_compare_);
      v16 = (NSArray *)objc_msgSend(v10, "copy");
      v17 = self->_cachedSupportedClassificationIdentifiers;
      self->_cachedSupportedClassificationIdentifiers = v16;

      objc_autoreleasePoolPop(context);
      cachedSupportedClassificationIdentifiers = self->_cachedSupportedClassificationIdentifiers;
    }
    v18 = cachedSupportedClassificationIdentifiers;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:(void *)a3 identifierAcceptingBlock:(id)a4 operationPointsProvider:(id)a5 originatingRequestSpecifier:(id)a6 qosClass:(unsigned int)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  VNClassificationObservation *v28;
  double v29;
  VNClassificationObservation *v30;
  id v31;
  char v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *__p[5];
  void *v41[2];
  void *v42[2];
  int v43;

  v13 = a4;
  v14 = a5;
  v37 = a6;
  if ((-[VNImageAnalyzerBasedDetector _validateProvidesSceneLabelsAndReturnError:]((uint64_t)self, a8) & 1) == 0)
  {
    v17 = 0;
    goto LABEL_31;
  }
  *(_OWORD *)v41 = 0u;
  *(_OWORD *)v42 = 0u;
  v43 = 1065353216;
  vision::mod::ImageAnalyzer::getSceneLabelsConfidences((vision::mod::ImageAnalyzer *)__p, 0.0, (uint64_t)a3);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign((uint64_t)v41, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)__p[2]);
  v15 = __p[0];
  __p[0] = 0;
  if (v15)
    operator delete(v15);
  if (!v14)
  {
    v16 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v14, "operationPointsAndReturnError:", a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
LABEL_9:
    v36 = v14;
    v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v19 = (void *)objc_msgSend(v18, "initWithCapacity:", v42[1]);
    v35 = (void *)MEMORY[0x1A1B0B060]();
    v20 = (char *)v42[0];
    if (v42[0])
    {
      v21 = 0;
      while (1)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = v20 + 16;
        if (v20[39] < 0)
          v23 = (_QWORD *)*v23;
        v24 = (void *)objc_msgSend(v22, "initWithUTF8String:", v23, v35);
        if (_isAcceptableRecognizedObjectIdentifier(v24, v13))
        {
          if (v16)
          {
            v38 = v21;
            v39 = 0;
            v25 = objc_msgSend(v16, "getClassificationMetrics:forClassificationIdentifier:error:", &v39, v24, &v38);
            v26 = v39;
            v27 = v38;

            if ((v25 & 1) == 0)
            {

              v32 = 0;
              goto LABEL_25;
            }
            v21 = v27;
          }
          else
          {
            v26 = 0;
          }
          v28 = [VNClassificationObservation alloc];
          LODWORD(v29) = *((_DWORD *)v20 + 10);
          v30 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v28, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", v37, v24, v26, v29);
          if (v30)
            objc_msgSend(v19, "addObject:", v30);

        }
        v20 = *(char **)v20;
        if (!v20)
          goto LABEL_24;
      }
    }
    v21 = 0;
LABEL_24:
    v24 = &__block_literal_global_88;
    v31 = &__block_literal_global_88;
    objc_msgSend(v19, "sortWithOptions:usingComparator:", 16, &__block_literal_global_88);
    v32 = 1;
    v27 = v21;
LABEL_25:

    objc_autoreleasePoolPop(v35);
    if ((v32 & 1) != 0)
      v17 = v19;
    else
      v17 = 0;

    v14 = v36;
    goto LABEL_29;
  }
  v17 = 0;
LABEL_29:
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v42[0]);
  v33 = v41[0];
  v41[0] = 0;
  if (v33)
    operator delete(v33);
LABEL_31:

  return v17;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  ImageAnalyzer *ptr;
  const char *v23;
  objc_super v24;
  __n128 v25;
  id v26;
  std::string __str;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VNImageAnalyzerBasedDetector;
  v7 = -[VNDetector completeInitializationForSession:error:](&v24, sel_completeInitializationForSession_error_, v6, a4);
  if (self)
    v8 = v7;
  else
    v8 = 0;
  if ((v8 & 1) != 0)
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_class();
    objc_msgSend(v11, "modelPathForConfiguration:error:", v10, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_9:
      v9 = 0;
LABEL_26:

      goto LABEL_27;
    }
    if (objc_msgSend(v11, "providesSceneLabelsForConfiguration:", v10))
    {
      objc_msgSend(v11, "sceneLabelsFilePathForConfiguration:error:", v10, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_9;
    }
    else
    {
      v13 = 0;
    }
    if (objc_msgSend(v11, "providesSegmentationLabelsForConfiguration:", v10))
    {
      objc_msgSend(v11, "segmentationLabelsFilePathForConfiguration:error:", v10, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v9 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v14 = 0;
    }
    vision::mod::ImageAnalyzer_Options::ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
    if (-[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](self, "configureImageAnalyzerOptions:error:", &__str, a4))
    {
      v26 = (id)8576;
      v15 = (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      v16 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      v17 = (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      vision::mod::ImageAnalyzer::createImageAnalyzer(&v25, (uint64_t *)&v26, v15, v16, 0, v17, 0, 0, &__str, v23, (const vision::mod::ImageAnalyzer_Options *)v24.receiver);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_imageAnalyzer, (__int128 *)&v25);
      v18 = (std::__shared_weak_count *)v25.n128_u64[1];
      if (v25.n128_u64[1])
      {
        v19 = (unint64_t *)(v25.n128_u64[1] + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      ptr = self->_imageAnalyzer.__ptr_;
      v9 = ptr != 0;
      if (ptr)
      {
        self->_networkUsesAnisotropicScaling = *((_BYTE *)ptr + 385);
        self->_networkRequiredInputImageSize = (_Geometry2D_size2D_)vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(*((uint64x2_t *)ptr + 42))));
      }
      else if (a4)
      {
        VNErrorForCVMLStatus(v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = 0;
    }
    vision::mod::ImageAnalyzer_Options::~ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);

    goto LABEL_25;
  }
  v9 = 0;
LABEL_27:

  return v9;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_super v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = *(_QWORD *)&a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  if (-[VNImageAnalyzerBasedDetector analysisTypesForProcessOptions:](self, "analysisTypesForProcessOptions:", v17))
  {
    v22.receiver = self;
    v22.super_class = (Class)VNImageAnalyzerBasedDetector;
    -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v22, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
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
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  __CVBuffer *v37;
  id v38;
  BOOL v39;
  id v41;
  uint64_t v42;

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
    v42 = 0;
    v23 = v17;
    if (self
      && +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v42, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v23, -[VNImageAnalyzerBasedDetector defaultImageCropAndScaleOption](self, "defaultImageCropAndScaleOption"), a8))
    {
      v24 = (double)v21;
      v25 = (double)v22;
      v26 = width * (double)v21;
      v27 = height * (double)v22;
      if (!self->_networkUsesAnisotropicScaling && v42 == 2)
        v42 = 0;

      v28 = self->_networkRequiredInputImageSize.width;
      if (v28 >= self->_networkRequiredInputImageSize.height)
        v28 = self->_networkRequiredInputImageSize.height;
      if (v26 >= v27)
        v29 = height * (double)v22;
      else
        v29 = width * (double)v21;
      v30 = v29;
      if (v28 > v30)
      {
        if (width >= height)
          v31 = height;
        else
          v31 = width;
        if (v31 > 0.0)
          v28 = v28 / v31;
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v28);
      }
      v32 = (void *)objc_opt_class();
      -[VNDetector configurationOptions](self, "configurationOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "analysisPixelFormatTypeForConfiguration:", v33);

      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      v35 = (unint64_t)self->_networkRequiredInputImageSize.width;
      v36 = (unint64_t)self->_networkRequiredInputImageSize.height;
      v41 = 0;
      v37 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v35, v36, v34, v42, v23, a8, x * v24, y * v25, v26, v27, 0, 0, 0, &v41);
      v38 = v41;
      *a7 = v37;
      v39 = v37 != 0;
      if (v37)
      {
        -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v23, v38, v20);
        v39 = 1;
      }
      v23 = v38;
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  unsigned int v14;
  int v15;
  signed int PixelFormatType;
  void *v17;
  void *v18;
  id v19;
  _QWORD aBlock[5];
  id v22;
  id v23;
  uint64_t *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v13 = a5;
  v14 = -[VNImageAnalyzerBasedDetector analysisTypesForProcessOptions:](self, "analysisTypesForProcessOptions:", v13);
  if (!self)
    goto LABEL_19;
  v15 = v14;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType <= 1094862673)
  {
    if (PixelFormatType != 8 && PixelFormatType != 32)
    {
LABEL_17:
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("the image processing type is unknown"));
        v19 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_19:
      v19 = 0;
      goto LABEL_16;
    }
  }
  else if (PixelFormatType != 1094862674 && PixelFormatType != 1111970369 && PixelFormatType != 1380401729)
  {
    goto LABEL_17;
  }
  vision::mod::ImageAnalyzer::analyzeUsingCVPixelBuffer((vision::mod::ImageAnalyzer *)self->_imageAnalyzer.__ptr_, v15, a4);
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__891;
    v30 = __Block_byref_object_dispose__892;
    v31 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __130__VNImageAnalyzerBasedDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E4543400;
    v24 = &v26;
    aBlock[4] = self;
    v22 = v13;
    v23 = v17;
    v25 = a6;
    v18 = _Block_copy(aBlock);
    if ((VNExecuteBlock(v18, (uint64_t)a8) & 1) != 0)
      v19 = (id)v27[5];
    else
      v19 = 0;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v19 = 0;
  }

LABEL_16:
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSupportedClassificationIdentifiers, 0);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_imageAnalyzer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

BOOL __130__VNImageAnalyzerBasedDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "observationsForLastAnalysisOfImageAnalyzer:processOptions:originatingRequestSpecifier:qosClass:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
}

- (uint64_t)_validateProvidesSceneLabelsAndReturnError:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (result)
  {
    v3 = (void *)result;
    v4 = objc_opt_class();
    objc_msgSend(v3, "configurationOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend((id)v4, "providesSceneLabelsForConfiguration:", v5);

    if ((v4 & 1) != 0)
    {
      return 1;
    }
    else
    {
      if (a2)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ does not provide classification labels"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v9);
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
      return 0;
    }
  }
  return result;
}

@end
