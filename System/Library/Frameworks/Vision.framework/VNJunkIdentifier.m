@implementation VNJunkIdentifier

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VNJunkIdentifier_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (BOOL)shouldDumpDebugIntermediates
{
  if (+[VNJunkIdentifier shouldDumpDebugIntermediates]::onceToken != -1)
    dispatch_once(&+[VNJunkIdentifier shouldDumpDebugIntermediates]::onceToken, &__block_literal_global_18122);
  return +[VNJunkIdentifier shouldDumpDebugIntermediates]::dumpDebug;
}

void __48__VNJunkIdentifier_shouldDumpDebugIntermediates__block_invoke()
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("VN_DEBUG_DUMP_JUNK_INTERMEDIATES"));

  if (v1)
    +[VNJunkIdentifier shouldDumpDebugIntermediates]::dumpDebug = 1;
}

void __57__VNJunkIdentifier_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNJunkIdentifier;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_MetalContextPriority"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNJunkIdentifier configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VNJunkIdentifier;
  if (!-[VNDetector completeInitializationForSession:error:](&v23, sel_completeInitializationForSession_error_, a3))
    return 0;
  VNFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("junk-descriptor-current"), CFSTR("bin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("junk-classifier-current"), CFSTR("bin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("junk-classifier-labels-current"), CFSTR("txt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDetector configurationOptions](self, "configurationOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v22 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v22, CFSTR("VNDetectorOption_MetalContextPriority"), v10, 1, a4))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__VNJunkIdentifier_completeInitializationForSession_error___block_invoke;
    aBlock[3] = &unk_1E4546238;
    aBlock[4] = self;
    v17 = v8;
    v18 = v9;
    v21 = v12;
    v19 = v7;
    v20 = v22;
    v13 = _Block_copy(aBlock);
    v14 = VNExecuteBlock(v13, (uint64_t)a4);

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  void *v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  unint64_t v26;
  void *v27;
  VNClassificationObservation *v28;
  double v29;
  VNClassificationObservation *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = *(_QWORD *)&a3;
  v41[1] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v19 = a8;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    goto LABEL_18;
  v22 = objc_msgSend(v20, "width");
  v23 = objc_msgSend(v21, "height");
  (*((void (**)(ImageDescriptorProcessorAbstract *))self->mJunkDescriptorImpl.__ptr_->var0 + 19))(self->mJunkDescriptorImpl.__ptr_);
  if (v23 >= v22)
    v26 = v22;
  else
    v26 = v23;
  if (v24 >= v25)
    v24 = v25;
  if (v26 >= (unint64_t)v24 >> 2)
  {
    if (!+[VNJunkIdentifier shouldDumpDebugIntermediates](VNJunkIdentifier, "shouldDumpDebugIntermediates"))
    {
      v35 = 0;
      v36 = 0;
      goto LABEL_14;
    }
    NSTemporaryDirectory();
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v32, "stringByAppendingPathComponent:", CFSTR("VN_junk_classifier_debug_intermediates"));
    v33 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v33;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v33, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, 0, a7);

    if ((v32 & 1) != 0)
    {
      v35 = v38;
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v35, CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
      v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("VNImageClassifierProcessingOption_DebugInfo"));

LABEL_14:
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E459CA60, CFSTR("VNImageBufferOption_DownscaleCGInterpolationQuality"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E459CA78, CFSTR("VNImageBufferOption_UpscaleCGInterpolationQuality"));
      v40.receiver = self;
      v40.super_class = (Class)VNJunkIdentifier;
      -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v40, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }

LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
  VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v24 >> 2);
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v17, a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = [VNClassificationObservation alloc];
    LODWORD(v29) = 1.0;
    v30 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v28, "initWithOriginatingRequestSpecifier:identifier:confidence:", v27, CFSTR("junk"), v29);
    v41[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }

LABEL_19:
  return v31;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  BOOL v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = +[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v17, self->mJunkDescriptorImpl.__ptr_, 1, v16, a7, a8, x, y, width, height);
  else
    v18 = 0;

  return v18;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  VNClassificationObservation *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  void *v44;
  void *v45;
  VNClassificationObservation *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  _QWORD v51[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51[1] = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v18 = a7;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    (*((void (**)(uint64_t *__return_ptr))self->mJunkDescriptorImpl.__ptr_->var0 + 8))(&v49);
    -[VNDetector metalContext](self, "metalContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = 0;
    if (+[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v19, a4, self->mJunkDescriptorImpl.__ptr_, 0, 3, v49, x, y, width, height, v17, v20, 0, &v48, &v47, a8))
    {
      VNRecordImageTilingWarning(v18, v48, v47);
      LODWORD(v21) = 0;
      +[VNImageClassifier classifyImageWithDescriptors:usingImageClassifier:andMinConfidenceForClassification:options:metalContext:error:](VNImageClassifier, "classifyImageWithDescriptors:usingImageClassifier:andMinConfidenceForClassification:options:metalContext:error:", v49, self->mJunkClassifierImpl.__ptr_, v17, v20, a8, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        if (objc_msgSend(v22, "count"))
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "confidence");
          v26 = v25;

        }
        else
        {
          v26 = 0;
        }
        +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v17, a8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = [VNClassificationObservation alloc];
          LODWORD(v30) = v26;
          v46 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v29, "initWithOriginatingRequestSpecifier:identifier:confidence:", v28, CFSTR("junk"), v30);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v45 && v31)
          {
            objc_msgSend(v19, "fileURL");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringByDeletingPathExtension");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v34, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VNJunkIdentifier processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:]::image_name_offset);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "stringValue");
              v36 = objc_claimAutoreleasedReturnValue();

              v34 = (void *)v36;
            }
            objc_msgSend(v34, "stringByAppendingString:", CFSTR(".json"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringByAppendingString:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 1, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "writeToFile:atomically:", v38, 1);
            ++-[VNJunkIdentifier processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:]::image_name_offset;

          }
          v51[0] = v46;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

    v40 = v50;
    if (v50)
    {
      p_shared_owners = (unint64_t *)&v50->__shared_owners_;
      do
        v42 = __ldaxr(p_shared_owners);
      while (__stlxr(v42 - 1, p_shared_owners));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->mJunkClassifierImpl);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->mJunkDescriptorImpl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

uint64_t __59__VNJunkIdentifier_completeInitializationForSession_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  const std::string::value_type *v4;
  const char *v5;
  char *v6;
  _QWORD **v7;
  char *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  const char *v20;
  char *v21;
  __int128 v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t result;
  id v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v29 = 0;
  v30 = 0;
  v4 = (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  v6 = (char *)operator new(0xA0uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E453B6F0;
  *((_QWORD *)v6 + 3) = &off_1E453A600;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_QWORD *)v6 + 10) = 0;
  *((_DWORD *)v6 + 22) = 1065353216;
  *((_QWORD *)v6 + 12) = 0;
  *(_OWORD *)(v6 + 104) = 0u;
  *((_DWORD *)v6 + 30) = 1;
  *(int32x2_t *)(v6 + 124) = vdup_n_s32(0x3DCCCCCDu);
  *(_QWORD *)(v6 + 132) = 5;
  *((_OWORD *)v6 + 9) = 0u;
  v7 = (_QWORD **)(v6 + 144);
  vision::mod::ImageClassifierAbstract::initLabels((vision::mod::ImageClassifierAbstract *)(v6 + 24), v5);
  v8 = (char *)operator new(0x80uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_1E453B6B8;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *((_QWORD *)v8 + 15) = 0;
  *(_QWORD *)&v9 = v8 + 24;
  *((_QWORD *)&v9 + 1) = v8;
  v10 = (std::__shared_weak_count *)*((_QWORD *)v6 + 19);
  *((_OWORD *)v6 + 9) = v9;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](*v7, v29, (uint64_t)v30);
  std::string::__assign_external((std::string *)(*v7 + 7), v4);
  *((_BYTE *)*v7 + 48) = 0;
  (*(void (**)(char *, uint64_t *))(*((_QWORD *)v6 + 3) + 32))(v6 + 24, &v29);
  *(_QWORD *)&v13 = v6 + 24;
  *((_QWORD *)&v13 + 1) = v6;
  v33 = v13;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 72, &v33);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
  if (*((_QWORD *)&v33 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v30;
  if (v30)
  {
    v18 = (unint64_t *)&v30->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    goto LABEL_24;
  v20 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String");
  v31 = 0;
  v32 = 0;
  v21 = (char *)operator new(0x58uLL);
  *((_QWORD *)v21 + 1) = 0;
  *((_QWORD *)v21 + 2) = 0;
  *(_QWORD *)v21 = &off_1E453B990;
  v33 = xmmword_1A15DD910;
  v34 = 0;
  v35 = 0;
  vision::mod::ImageDescriptorProcessorEspresso::ImageDescriptorProcessorEspresso((uint64_t)(v21 + 24), (id *)&v33, v20, "model_junk_12_espresso", 0, 1);
  *((_QWORD *)v21 + 3) = &off_1E453A960;
  *(_QWORD *)&v22 = v21 + 24;
  *((_QWORD *)&v22 + 1) = v21;
  *((_DWORD *)v21 + 9) = 998277249;
  *(_QWORD *)(v21 + 52) = 0;
  *(_QWORD *)(v21 + 44) = 0;
  *(_DWORD *)(v21 + 59) = 0;
  v33 = v22;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 56, &v33);
  v23 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
  if (*((_QWORD *)&v33 + 1))
  {
    v24 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v26 + 56))
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v26 + 72) + 32))(*(_QWORD *)(v26 + 72));
    result = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 112) = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 96) = 1;
  }
  else
  {
LABEL_24:
    if (a2)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a2 = v28;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
