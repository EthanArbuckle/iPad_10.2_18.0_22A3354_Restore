@implementation VNANFDMultiDetector

+ (Class)anfdMultiDetectorClassToProcessRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap](VNANFDMultiDetectorOriginalRequestInfo, "originatingRequestSpecifierToDetectorClassMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap](VNANFDMultiDetectorOriginalRequestInfo, "originatingRequestSpecifierToDetectorClassMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return (Class)v9;
}

void __60__VNANFDMultiDetector_detectedObjectRequestKeyToRequestInfo__block_invoke()
{
  objc_class *v0;
  void *v1;
  VNANFDMultiDetectorOriginalRequestInfo *v2;
  objc_class *v3;
  void *v4;
  VNANFDMultiDetectorOriginalRequestInfo *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  VNANFDMultiDetectorOriginalRequestInfo *v10;
  objc_class *v11;
  void *v12;
  VNANFDMultiDetectorOriginalRequestInfo *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanFaceDetectorOriginatingRequestSpecifier"), 0);
  v17[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanHeadDetectorOriginatingRequestSpecifier"), 1);
  v17[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@%@"), v8, CFSTR("_"), MEMORY[0x1E0C9AAB0], v1, v4);
  v16[2] = v9;
  v10 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorOriginatingRequestSpecifier"), 2);
  v17[2] = v10;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  v13 = -[VNMultiDetectorOriginalRequestInfo initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:]([VNANFDMultiDetectorOriginalRequestInfo alloc], "initWithOriginatingRequestSpecifierProcessingOptionKey:originalRequestResultsIndex:", CFSTR("VNANFDMultiDetectorProcessingOption_AnimalRecognitionOriginatingRequestSpecifier"), 3);
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
  +[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo = v14;

}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "detectorClassForConfigurationOptions:error:", v3, 0);
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(v4, "detectorClass"), "modelName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  VNShotflowDetector *v11;
  VNShotflowDetector *mMultiHeadedANFDDetector;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VNFaceBBoxAligner *v20;
  VNFaceBBoxAligner *faceBBoxAligner;
  BOOL v22;
  BOOL v23;
  objc_super v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNANFDMultiDetector;
  if (-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v25, sel_completeInitializationForSession_error_, v6, a4))
  {
    -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "detectorClass");
    v9 = objc_msgSend(v7, "network");
    objc_msgSend(v8, "processingDeviceDetectorWithEspressoNetwork:espressoPlan:", v9, v10, objc_msgSend(v7, "plan"));
    v11 = (VNShotflowDetector *)objc_claimAutoreleasedReturnValue();
    mMultiHeadedANFDDetector = self->_mMultiHeadedANFDDetector;
    self->_mMultiHeadedANFDDetector = v11;

    if (self->_mMultiHeadedANFDDetector)
    {
      v13 = (void *)objc_opt_class();
      if ((objc_msgSend(v13, "isEqual:", objc_opt_class()) & 1) != 0)
        goto LABEL_5;
      -[VNDetector configurationOptions](self, "configurationOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:error:](VNFaceBBoxAligner, "supportedComputeStageDevicesForOptions:error:", v14, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "mutableCopy");
      v26 = CFSTR("VNComputeStageMain");
      objc_msgSend(v15, "objectForKeyedSubscript:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));

      objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", CFSTR("VNFaceBoxAlignerType"), v16, a4);
      v20 = (VNFaceBBoxAligner *)objc_claimAutoreleasedReturnValue();
      faceBBoxAligner = self->_faceBBoxAligner;
      self->_faceBBoxAligner = v20;

      v22 = self->_faceBBoxAligner == 0;
      if (!v22)
      {
LABEL_5:
        v23 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failure to create multi-headed object detector."));
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v23 = 0;
    goto LABEL_10;
  }
  v23 = 0;
LABEL_11:

  return v23;
}

+ (id)requestInfoForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "detectedObjectRequestKeyToRequestInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNANFDMultiDetectorOriginalRequestInfo requestKeyFromRequest:](VNANFDMultiDetectorOriginalRequestInfo, "requestKeyFromRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  float v7;
  VNSupportedImageSize *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a1, "networkRequiredInputImagePixelFormatForConfigurationOptions:", v5);
  objc_msgSend((id)objc_msgSend(a1, "detectorClass"), "inputImageMinDimension");
  v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", v6, (unint64_t)v7, (unint64_t)v7, 1, objc_msgSend(a1, "inputImageAspectRatioHandlingForConfigurationOptions:", v5), 0);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSDictionary)detectedObjectClassToRequestKey
{
  if (+[VNANFDMultiDetector detectedObjectClassToRequestKey]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetector detectedObjectClassToRequestKey]::onceToken, &__block_literal_global_65);
  return (NSDictionary *)(id)+[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
}

+ (NSDictionary)detectedObjectRequestKeyToRequestInfo
{
  if (+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::onceToken, &__block_literal_global_71);
  return (NSDictionary *)(id)+[VNANFDMultiDetector detectedObjectRequestKeyToRequestInfo]::detectedObjectRequestKeyToRequestInfo;
}

+ (NSDictionary)recognizedAnimalObjectClassToAnimalName
{
  if (+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::onceToken, &__block_literal_global_72_27096);
  return (NSDictionary *)(id)+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName;
}

+ (NSArray)knownAnimalIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VNANFDMultiDetector_knownAnimalIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetector knownAnimalIdentifiers]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetector knownAnimalIdentifiers]::onceToken, block);
  return (NSArray *)(id)+[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNANFDMultiDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "detectorClass", a3), "inputLayerName");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return 1;
}

+ (void)_printDebugInfo:(id)a3 detectedObjectsRaw:(id)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int32x2_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  __CVBuffer *v29;
  id v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *__p[2];
  char v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  char v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v11 = a4;
  v12 = a7;
  if (+[VNFaceDetector shouldDumpDebugIntermediates](VNFaceDetector, "shouldDumpDebugIntermediates"))
  {
    v29 = a5;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v33;
      v16 = vdup_n_s32(0x7FC00000u);
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
          std::string::basic_string[abi:ne180100]<0>(__p, "unknown");
          v41 = (unint64_t)v16;
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v42 = 0;
          v43 = 0;
          v44 = 0;
          objc_msgSend(v18, "bounds");
          *(float *)&v19 = v19;
          *(float *)&v20 = v20;
          *(float *)&v21 = v21;
          v41 = __PAIR64__(LODWORD(v20), LODWORD(v19));
          *(float *)&v19 = v22;
          v42 = __PAIR64__(LODWORD(v19), LODWORD(v21));
          objc_msgSend(v18, "rotationAngle");
          LODWORD(v43) = v23;
          objc_msgSend(v18, "yawAngle");
          HIDWORD(v43) = v24;
          objc_msgSend(v18, "confidence");
          v47 = v25;
          v26 = v37;
          if (v37 >= v38)
          {
            v27 = std::vector<vision::mod::DetectedObject>::__push_back_slow_path<vision::mod::DetectedObject const&>(&v36, (uint64_t)__p);
          }
          else
          {
            vision::mod::DetectedObject::DetectedObject(v37, (uint64_t)__p);
            v27 = v26 + 80;
          }
          v37 = v27;
          if (v40 < 0)
            operator delete(__p[0]);
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
      }
      while (v14);
    }

    v28 = *(_OWORD *)&a6->width;
    v31[0] = *(_OWORD *)&a6->data;
    v31[1] = v28;
    +[VNFaceDetector printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:](VNFaceDetector, "printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:", v30, &v36, v29, v31, v12);
    __p[0] = &v36;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }

}

void __60__VNANFDMultiDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNANFDMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

void __45__VNANFDMultiDetector_knownAnimalIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "recognizedAnimalObjectClassToAnimalName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers;
  +[VNANFDMultiDetector knownAnimalIdentifiers]::knownAnimalIdentifiers = v2;

}

void __62__VNANFDMultiDetector_recognizedAnimalObjectClassToAnimalName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E459CF28;
  v2[1] = &unk_1E459CF40;
  v3[0] = CFSTR("Cat");
  v3[1] = CFSTR("Dog");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName;
  +[VNANFDMultiDetector recognizedAnimalObjectClassToAnimalName]::recognizedAnimalObjectClassToAnimalName = v0;

}

void __54__VNANFDMultiDetector_detectedObjectClassToRequestKey__block_invoke()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("_"), MEMORY[0x1E0C9AAB0], &unk_1E459CEE0, &unk_1E459CEF8, &unk_1E459CF10);
  v15[2] = v7;
  v14[3] = &unk_1E459CF28;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = &unk_1E459CF40;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey;
  +[VNANFDMultiDetector detectedObjectClassToRequestKey]::detectedObjectClassToRequestKey = v12;

}

- (BOOL)updateRuntimeParametersFromOptions:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  char *v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  __int128 v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  dispatch_block_t v49;
  void (**v50)(_QWORD);
  NSObject *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (**v60)(_QWORD);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  unint64_t v87;
  void *v88;
  id v89;
  id v90;
  unint64_t v91;
  unsigned __int8 v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id *v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  double v102;
  double v103;
  double v104;
  id v105;
  uint64_t v106;
  void *v107;
  CGFloat v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  float v114;
  float v115;
  int v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  uint64_t k;
  void *v127;
  id v128;
  const __CFString *v129;
  id v130;
  void *v131;
  id *v132;
  void *v134;
  id v135;
  uint64_t v136;
  id v137;
  id *v138;
  int v139;
  void *v140;
  void *v141;
  unint64_t v142;
  unint64_t j;
  void *v144;
  void *v145;
  dispatch_group_t v146;
  dispatch_group_t v147;
  id v148;
  void *v149;
  id v150;
  VNANFDMultiDetector *val;
  void *v153;
  unint64_t v154;
  id v155;
  id v156;
  id v157;
  NSObject *v158;
  unint64_t v159;
  char *v160;
  id v161;
  uint64_t v162;
  id v163;
  id *to;
  _QWORD v165[4];
  id v166;
  _QWORD v167[4];
  NSObject *v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  _QWORD *v175;
  _QWORD *v176;
  _QWORD *v177;
  _QWORD *v178;
  uint64_t *v179;
  id v180[2];
  __int128 v181;
  __int128 v182;
  unint64_t v183;
  unsigned int v184;
  int v185;
  _QWORD block[4];
  NSObject *v187;
  id v188;
  id v189;
  id v190;
  id v191;
  _QWORD *v192;
  _QWORD *v193;
  id v194[2];
  __int128 v195;
  __int128 v196;
  unint64_t v197;
  int v198;
  unsigned int v199;
  _QWORD v200[4];
  _QWORD v201[5];
  id v202;
  _QWORD v203[5];
  id v204;
  __int128 v205;
  __int128 v206;
  id location;
  _QWORD v208[6];
  int v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  uint64_t (*v213)(uint64_t, uint64_t);
  void (*v214)(uint64_t);
  id i;
  char *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a4;
  v150 = a6;
  v148 = a8;
  v149 = v16;
  val = self;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v128 = 0;
    goto LABEL_62;
  }
  v219 = 0;
  v220 = 0;
  v216 = 0;
  v217 = 0;
  v218 = 0;
  v135 = v17;
  v18 = objc_msgSend(v17, "width");
  v19 = objc_msgSend(v135, "height");
  LODWORD(v20) = 1050253722;
  LODWORD(v21) = 2.0;
  if (+[VNFaceDetector calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:](VNFaceDetector, "calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:", v18, v19, 3145728, &v220, &v219, &v216, x, y, width, height, v20, v21, a7))
  {
    VNRecordImageTilingWarning(v150, v220, v219);
    v23 = v216;
    v22 = v217;
    v24 = 0x1E0C99000uLL;
    v142 = v217 - v216;
    v154 = (v217 - v216) >> 5;
    v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:");
    objc_msgSend((id)objc_opt_class(), "detectedObjectRequestKeyToRequestInfo");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v134, "count");
    v210 = 0;
    v211 = &v210;
    v212 = 0x3032000000;
    v213 = __Block_byref_object_copy__27154;
    v214 = __Block_byref_object_dispose__27155;
    for (i = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25); v25; v24 = 0x1E0C99000)
    {
      v26 = (void *)v211[5];
      v27 = objc_alloc_init(*(Class *)(v24 + 3560));
      objc_msgSend(v26, "addObject:", v27);

      --v25;
    }
    v208[0] = 0;
    v208[1] = v208;
    v208[2] = 0x3812000000;
    v208[3] = __Block_byref_object_copy__86;
    v208[4] = __Block_byref_object_dispose__87;
    v208[5] = "";
    v209 = 0;
    objc_initWeak(&location, val);
    v28 = (void *)objc_opt_class();
    v139 = objc_msgSend(v28, "VNClassCode");
    objc_msgSend(v28, "detectorCropCreationAsyncTasksQueue");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = dispatch_group_create();
    objc_msgSend(v28, "detectorCropProcessingAsyncTasksQueue");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = dispatch_group_create();
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("Start processing tilesProcessingGroup. currentDetector: %@"), v29, v30, v31, v32, v33, v34, (uint64_t)val);
    if (v22 != v23)
    {
      v41 = 0;
      v42 = 0;
      v43 = v154;
      if (v154 <= 1)
        v43 = 1;
      v136 = v43;
      do
      {
        v162 = v41;
        v44 = *(_OWORD *)&v216[v41 + 16];
        v205 = *(_OWORD *)&v216[v41];
        v206 = v44;
        v203[0] = 0;
        v203[1] = v203;
        v203[2] = 0x3032000000;
        v203[3] = __Block_byref_object_copy__27154;
        v203[4] = __Block_byref_object_dispose__27155;
        v204 = 0;
        v201[0] = 0;
        v201[1] = v201;
        v201[2] = 0x3032000000;
        v201[3] = __Block_byref_object_copy__27154;
        v201[4] = __Block_byref_object_dispose__27155;
        v202 = 0;
        v200[0] = 0;
        v200[1] = v200;
        v200[2] = 0x2020000000;
        v200[3] = 0;
        v45 = (void *)objc_msgSend(v149, "mutableCopy");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
        block[3] = &unk_1E4548AB0;
        objc_copyWeak(v194, &location);
        v198 = v139;
        v192 = v203;
        v194[1] = v42;
        v158 = v147;
        v187 = v158;
        v199 = a3;
        v195 = v205;
        v196 = v206;
        v46 = v45;
        v188 = v46;
        v47 = v150;
        v189 = v47;
        v193 = v200;
        v48 = v148;
        v191 = v48;
        v197 = v154;
        v156 = v144;
        v190 = v156;
        v49 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
        v167[0] = MEMORY[0x1E0C809B0];
        v167[1] = 3221225472;
        v167[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
        v167[3] = &unk_1E4547CE8;
        objc_copyWeak(v180, &location);
        v175 = v203;
        v184 = a3;
        v50 = v49;
        v185 = v139;
        v173 = v50;
        v160 = v42;
        v180[1] = v42;
        v51 = v146;
        v168 = v51;
        v176 = v201;
        v177 = v200;
        v181 = v205;
        v182 = v206;
        v52 = v46;
        v169 = v52;
        v170 = v47;
        v174 = v48;
        v178 = v208;
        v179 = &v210;
        v171 = v145;
        v183 = v154;
        v53 = v141;
        v172 = v53;
        v60 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v167);
        if (v142 < 0x21)
        {
          VNValidatedLog(1, (uint64_t)CFSTR("Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@"), v54, v55, v56, v57, v58, v59, (uint64_t)val);
          v50[2](v50);
          VNValidatedLog(1, (uint64_t)CFSTR("Performing processRegionOfInterestBlock. currentDetector: %@"), v67, v68, v69, v70, v71, v72, (uint64_t)val);
          v60[2](v60);
          VNValidatedLog(1, (uint64_t)CFSTR("Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@"), v73, v74, v75, v76, v77, v78, (uint64_t)val);
        }
        else
        {
          VNValidatedLog(1, (uint64_t)CFSTR("Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@"), v54, v55, v56, v57, v58, v59, (uint64_t)val);
          objc_msgSend(v156, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v158, v50);
          VNValidatedLog(1, (uint64_t)CFSTR("Scheduling processRegionOfInterestBlock. currentDetector: %@"), v61, v62, v63, v64, v65, v66, (uint64_t)val);
          objc_msgSend(v53, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v51, v60);
        }

        objc_destroyWeak(v180);
        objc_destroyWeak(v194);

        _Block_object_dispose(v200, 8);
        _Block_object_dispose(v201, 8);

        _Block_object_dispose(v203, 8);
        ++v42;
        v41 = v162 + 32;
      }
      while ((char *)v136 != v160 + 1);
    }
    v79 = 0x1E0C99000uLL;
    if (v142 > 0x20)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Waiting for tilesCropCreationGroup. currentDetector: %@; group: %@"),
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        (uint64_t)val);
      if ((objc_msgSend(v144, "dispatchGroupWait:error:", v147, a7) & 1) != 0)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Waiting for tilesCropProcessingGroup. currentDetector: %@ group: %@"), v80, v81, v82, v83, v84, v85, (uint64_t)val);
        if ((objc_msgSend(v141, "dispatchGroupWait:error:", v146, a7) & 1) != 0)
        {
          VNValidatedLog(1, (uint64_t)CFSTR("Finish processing tilesCropCreationGroup and tilesCropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@"),
            v80,
            v81,
            v82,
            v83,
            v84,
            v85,
            (uint64_t)val);
          goto LABEL_17;
        }
        v129 = CFSTR("Timed out waiting for tilesCropProcessingGroup when processing %lu anod tiles. currentDetector: %@ group: %@");
      }
      else
      {
        v129 = CFSTR("Timed out waiting for tilesCropCreationGroup when processing %lu anod tiles. currentDetector: %@; group: %@");
      }
      VNValidatedLog(4, (uint64_t)v129, v80, v81, v82, v83, v84, v85, v154);
      goto LABEL_55;
    }
LABEL_17:
    kdebug_trace();
    if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v145, a7))
    {
      if (v142 >= 0x21)
      {
        v138 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        for (j = 0; j < objc_msgSend((id)v211[5], "count"); ++j)
        {
          objc_msgSend((id)v211[5], "objectAtIndexedSubscript:");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNANFDMultiDetector splitDetectedClassResultsIntoSubclasses:](val, "splitDetectedClassResultsIntoSubclasses:", v140);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = objc_alloc_init(*(Class *)(v79 + 3560));
          v155 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v87 = 0;
          v153 = v86;
          while (v87 < objc_msgSend(v86, "count"))
          {
            v159 = v87;
            objc_msgSend(v86, "objectAtIndexedSubscript:", v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v90 = v88;
            v161 = v89;
            v163 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            v91 = objc_msgSend(v90, "count");
            v92 = atomic_load((unsigned __int8 *)&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved);
            if ((v92 & 1) == 0
              && __cxa_guard_acquire(&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved))
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              _ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved = objc_claimAutoreleasedReturnValue();
              __cxa_guard_release(&_ZGVZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved);
              v79 = 0x1E0C99000;
            }
            if (v91)
            {
              v93 = 0;
              do
              {
                objc_msgSend(v90, "objectAtIndexedSubscript:", v93);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v94, "isEqual:", _ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved))
                {
                  v95 = v93 + 1;
                }
                else
                {
                  v96 = (id *)objc_alloc_init(MEMORY[0x1E0CB3788]);
                  objc_msgSend(v94, "boundingBox");
                  v98 = v97;
                  v100 = v99;
                  v102 = v101;
                  v104 = v103;
                  to = v96;
                  v105 = objc_alloc_init(*(Class *)(v79 + 3560));
                  v95 = v93 + 1;
                  if (v93 + 1 < v91)
                  {
                    v106 = v93 + 1;
                    do
                    {
                      objc_msgSend(v90, "objectAtIndexedSubscript:", v106);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v107, "isEqual:", _ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved) & 1) == 0)
                      {
                        objc_msgSend(v107, "boundingBox");
                        v223.origin.x = v108;
                        v223.origin.y = v109;
                        v111 = v110;
                        v113 = v112;
                        v221.origin.x = v98;
                        v221.origin.y = v100;
                        v221.size.width = v102;
                        v221.size.height = v104;
                        v223.size.width = v111;
                        v223.size.height = v113;
                        v222 = CGRectIntersection(v221, v223);
                        *(float *)&v222.size.width = v222.size.width
                                                   * v222.size.height
                                                   / (v102 * v104 + v111 * v113 - v222.size.width * v222.size.height);
                        if (*(float *)&v222.size.width >= 0.5)
                        {
                          v114 = v102 * v104;
                          v115 = v111 * v113;
                          if (v114 > v115)
                            v116 = v106;
                          else
                            v116 = v93;
                          v117 = v116;
                          objc_msgSend(v90, "objectAtIndexedSubscript:", v116);
                          v118 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v105, "addObject:", v118);

                          if (v117 == v93)
                          {
                            objc_msgSend(v90, "objectAtIndexedSubscript:", v106);
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v90, "setObject:atIndexedSubscript:", v119, v93);

                            objc_msgSend(v90, "objectAtIndexedSubscript:", v93);
                            v120 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v120, "boundingBox");
                            v98 = v121;
                            v100 = v122;
                            v102 = v123;
                            v104 = v124;
                            v94 = v120;
                          }
                          objc_msgSend(to, "addIndex:", v106);
                          objc_msgSend(v90, "setObject:atIndexedSubscript:", _ZZZ128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_E27duplicatedObjectToBeRemoved, v106);
                        }
                      }

                      ++v106;
                    }
                    while (v91 != v106);
                  }
                  objc_msgSend(v161, "setObject:forKey:", v105, v94);
                  objc_msgSend(v163, "addIndexes:", to);

                  v79 = 0x1E0C99000uLL;
                }

                v93 = v95;
              }
              while (v95 != v91);
            }
            v125 = (void *)objc_msgSend(objc_alloc(*(Class *)(v79 + 3560)), "initWithCapacity:", objc_msgSend(v90, "count") - objc_msgSend(v163, "count"));
            if (v91)
            {
              for (k = 0; k != v91; ++k)
              {
                if ((objc_msgSend(v163, "containsIndex:", k) & 1) == 0)
                {
                  objc_msgSend(v90, "objectAtIndexedSubscript:", k);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "addObject:", v127);

                }
              }
            }
            objc_msgSend(v90, "setArray:", v125);

            objc_msgSend(v157, "addObjectsFromArray:", v90);
            objc_msgSend(v155, "addEntriesFromDictionary:", v161);

            v87 = v159 + 1;
            v86 = v153;
          }
          objc_msgSend(v157, "sortUsingComparator:", &__block_literal_global_27175);
          objc_msgSend(v138, "addObject:", v157);
          objc_msgSend(v137, "addObject:", v155);

        }
        v165[0] = MEMORY[0x1E0C809B0];
        v165[1] = 3221225472;
        v165[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7;
        v165[3] = &unk_1E4547D88;
        v130 = v137;
        v166 = v130;
        objc_msgSend(v138, "enumerateObjectsUsingBlock:", v165);
        v131 = (void *)v211[5];
        v211[5] = (uint64_t)v138;
        v132 = v138;

      }
      v128 = (id)v211[5];
      goto LABEL_58;
    }
LABEL_55:
    v128 = 0;
LABEL_58:

    objc_destroyWeak(&location);
    _Block_object_dispose(v208, 8);
    _Block_object_dispose(&v210, 8);

    goto LABEL_59;
  }
  v128 = 0;
LABEL_59:
  if (v216)
  {
    v217 = v216;
    operator delete(v216);
  }
  v17 = v135;
LABEL_62:

  return v128;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  __CVBuffer *v34;
  id v35;
  BOOL v36;
  id v38;
  CGRect v39;
  CGRect v40;

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
    if (v21 >= v22)
      v21 = v22;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "detectorClass"), "inputImageMinDimension");
    if (v21 < (unint64_t)v23)
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v23);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v40 = CGRectIntegral(v39);
    v24 = v40.origin.x;
    v25 = v40.origin.y;
    v26 = v40.size.width;
    v27 = v40.size.height;
    objc_msgSend((id)objc_opt_class(), "getSuggestedImageSize:", (double)(unint64_t)v40.size.width, (double)(unint64_t)v40.size.height);
    v30 = v28 < (double)(unint64_t)v26;
    v31 = v29 < (double)(unint64_t)v27;
    if (v30 && v31)
      v32 = (unint64_t)v28;
    else
      v32 = (unint64_t)v26;
    if (v30 && v31)
      v33 = (unint64_t)v29;
    else
      v33 = (unint64_t)v27;
    v38 = 0;
    v34 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v32, v33, 1111970369, v17, a8, &v38, v24, v25, v26, v27);
    v35 = v38;
    *a7 = v34;
    v36 = v34 != 0;
    if (v34)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v17, v35, v20);

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSString *v24;
  void *v25;
  BOOL v26;
  id v27;
  objc_class *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t (**v45)(void *, id *, double, double, double, double);
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id obj;
  id *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD aBlock[5];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  const __CVBuffer *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  char v91;
  char v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v100 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v63 = a7;
  v67 = a8;
  v68 = v15;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v15, a8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v15, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v60 = v16;
    if (v16
      && (v56 = objc_msgSend(v16, "width"),
          v55 = objc_msgSend(v17, "height"),
          -[VNANFDMultiDetector updateRuntimeParametersFromOptions:error:](self, "updateRuntimeParametersFromOptions:error:", v68, a8)))
    {
      v53 = (void *)objc_opt_class();
      objc_msgSend(v53, "detectedObjectRequestKeyToRequestInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v54, "count");
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = v54;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      if (v19)
      {
        v61 = *(_QWORD *)v95;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v95 != v61)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v20);
            v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v64, "addObject:", v22);

            objc_msgSend(obj, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The request info is not found for request class %@"), v21);
LABEL_45:

              v51 = 0;
              goto LABEL_48;
            }
            +[VNANFDMultiDetectorOriginalRequestInfo requestClassNameFromRequestKey:](VNANFDMultiDetectorOriginalRequestInfo, "requestClassNameFromRequestKey:", v21);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v93 = 0;
            objc_msgSend(v23, "originatingRequestSpecifierKey");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = +[VNValidationUtilities getOptionalOriginatingRequestSpecifier:forKey:inOptions:specifyingRequestClass:error:](VNValidationUtilities, "getOptionalOriginatingRequestSpecifier:forKey:inOptions:specifyingRequestClass:error:", &v93, v25, v68, NSClassFromString(v24), v67);
            v27 = v93;

            if (!v26)
            {

              goto LABEL_45;
            }
            if (!v27)
              goto LABEL_18;
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[NSString isEqualToString:](v24, "isEqualToString:", v29);

            if (!v30)
            {
              objc_msgSend(v59, "setObject:forKey:", v27, v21);
LABEL_18:

              goto LABEL_26;
            }
            v92 = 1;
            if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v92, CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorUpperBody"), v68, 0, v67))
            {
              if (v92)
              {
                v31 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("%@"), v32);

                +[VNANFDMultiDetectorOriginalRequestInfo requestPropertiesFromRequestKey:](VNANFDMultiDetectorOriginalRequestInfo, "requestPropertiesFromRequestKey:", v21);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "isEqualToString:", v33);

                if (v36)
                  goto LABEL_23;

              }
              v91 = 1;
              if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v91, CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorFullBody"), v68, 0, v67))
              {
                if (!v91)
                  goto LABEL_18;
                v37 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("%@"), v38);

                +[VNANFDMultiDetectorOriginalRequestInfo requestPropertiesFromRequestKey:](VNANFDMultiDetectorOriginalRequestInfo, "requestPropertiesFromRequestKey:", v21);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "isEqualToString:", v33);

                if (!v40)
                {

                  goto LABEL_18;
                }
LABEL_23:
                objc_msgSend(v59, "setObject:forKey:", v27, v21);

                v41 = 3;
                goto LABEL_25;
              }
            }
            v41 = 1;
LABEL_25:

            if (v41 != 3)
              goto LABEL_45;
LABEL_26:
            ++v20;
          }
          while (v19 != v20);
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
          v19 = v42;
        }
        while (v42);
      }

      v43 = objc_msgSend(v53, "detectorClass");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E4547DD8;
      v81 = a4;
      v82 = v53;
      aBlock[4] = self;
      v74 = v60;
      v75 = v62;
      v76 = v59;
      v83 = x;
      v84 = y;
      v85 = width;
      v86 = height;
      v87 = v56;
      v88 = v55;
      v89 = v43;
      v77 = obj;
      v44 = v64;
      v78 = v44;
      v90 = a6;
      v79 = v63;
      v80 = v68;
      v45 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
      if ((v45[2](v45, v67, x, y, width, height) & 1) != 0)
      {
        if (+[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:](VNRuntimeUtilities, "linkTimeOrRunTimeBeforeVersion:", 393216))
        {
          v46 = &__block_literal_global_86_33184;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v47 = v44;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
          if (v48)
          {
            v49 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v70 != v49)
                  objc_enumerationMutation(v47);
                objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "sortWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);
              }
              v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
            }
            while (v48);
          }

        }
        v51 = v44;
      }
      else
      {
        v51 = 0;
      }

LABEL_48:
    }
    else
    {
      v51 = 0;
    }

  }
  else
  {
    v51 = 0;
  }

  return v51;
}

- (id)_alignFace:(id)a3 imageBuffer:(id)a4 qosClass:(unsigned int)a5 session:(id)a6 warningRecorder:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  VNFaceBBoxAligner *faceBBoxAligner;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];

  v10 = *(_QWORD *)&a5;
  v38[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v33 = a6;
  v34 = a7;
  v15 = (void *)MEMORY[0x1A1B0B060]();
  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "originatingRequestSpecifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", v17, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"), v18, CFSTR("VNDetectorProcessOption_InputImageBuffers"), 0);

  objc_msgSend(v14, "orientation");
  v36 = 0;
  LOBYTE(v18) = VNSetFaceOrientationInOptionsDictionary(v13, v19, &v36);
  v20 = v36;
  if ((v18 & 1) != 0)
  {
    v37 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("VNDetectorProcessOption_InputFaceObservations"));

    objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, CFSTR("VNDetectorProcessOption_Session"));
    faceBBoxAligner = self->_faceBBoxAligner;
    v23 = *MEMORY[0x1E0C9D628];
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v35 = v20;
    -[VNFaceBBoxAligner internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](faceBBoxAligner, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v10, v19, v34, &v35, 0, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v35;

    if (v27 && objc_msgSend(v27, "count") == 1 && objc_msgSend(v27, "count") != 1)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected number of aligned faces: %lu, should be 1"), objc_msgSend(v27, "count"));
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v31);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = v28;
    }
  }
  else
  {
    v27 = 0;
  }

  objc_autoreleasePoolPop(v15);
  if (v27)
  {
    v29 = v27;
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease(v20);
  }

  return v27;
}

- (BOOL)processDetectedObject:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 imageBuffer:(id)a7 qosClass:(unsigned int)a8 session:(id)a9 warningRecorder:(id)a10 detectedObjectResults:(id)a11 error:(id *)a12
{
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  VNFaceObservation *v31;
  VNFaceObservation *v32;
  float v33;
  double v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  VNDetectedObjectObservation *v54;
  VNHumanObservation *v55;
  int v56;
  double v57;
  uint64_t v58;
  BOOL v59;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  VNFaceObservation *v70;
  _BYTE v71[128];
  uint64_t v72;

  v13 = *(_QWORD *)&a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v65 = a4;
  v23 = a6;
  v61 = a7;
  v62 = a9;
  v63 = a10;
  v24 = a11;
  v25 = (void *)objc_opt_class();
  objc_msgSend(v25, "recognizedAnimalObjectClassToAnimalName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v22, "labelKey"))
  {
    case 1u:
      v31 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNFaceObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v65, x, y, width, height);
      v32 = v31;
      if (v23)
        -[VNDetectedObjectObservation setGroupId:]((uint64_t)v31, v23);
      -[VNFaceObservation setUnalignedBoundingBox:](v32, "setUnalignedBoundingBox:", x, y, width, height);
      objc_msgSend(v22, "confidence");
      -[VNObservation setConfidence:](v32, "setConfidence:");
      objc_msgSend(v22, "rotationAngle");
      v34 = (float)((float)(v33 * 3.1416) / 180.0);
      if (v34 > 3.14159265)
        v34 = v34 + -6.28318531;
      if (v34 <= -3.14159265)
        v34 = v34 + 6.28318531;
      *(float *)&v34 = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceObservation setRoll:](v32, "setRoll:", v35);

      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "yawAngle");
      *(float *)&v38 = (float)(v37 * 3.1416) / 180.0;
      objc_msgSend(v36, "numberWithFloat:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceObservation setYaw:](v32, "setYaw:", v39);

      v40 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "pitchAngle");
      *(float *)&v42 = (float)(v41 * 3.1416) / 180.0;
      objc_msgSend(v40, "numberWithFloat:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceObservation setPitch:](v32, "setPitch:", v43);

      if (!objc_msgSend(v25, "shouldAlignFacesForRequestWithSpecifier:", v65))
      {
        v70 = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
        v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
        objc_msgSend(v24, "addObjectsFromArray:", v45);

        goto LABEL_30;
      }
      -[VNANFDMultiDetector _alignFace:imageBuffer:qosClass:session:warningRecorder:error:](self, "_alignFace:imageBuffer:qosClass:session:warningRecorder:error:", v32, v61, v13, v62, v63, a12);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v45 = v44;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        if (v46)
        {
          v47 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v67 != v47)
                objc_enumerationMutation(v45);
              v49 = *(_QWORD **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_msgSend(v49, "alignedBoundingBoxAsCGRect");
              if (v49)
              {
                v49[12] = v50;
                v49[13] = v51;
                v49[14] = v52;
                v49[15] = v53;
              }
            }
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
          }
          while (v46);
        }

        goto LABEL_33;
      }

LABEL_35:
      v59 = 0;
LABEL_31:

      return v59;
    case 2u:
      v54 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNDetectedObjectObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v65, x, y, width, height);
      v27 = v54;
      if (v23)
        -[VNDetectedObjectObservation setGroupId:]((uint64_t)v54, v23);
      objc_msgSend(v22, "confidence");
      objc_msgSend(v27, "setConfidence:");
      objc_msgSend(v24, "addObject:", v27);
      goto LABEL_29;
    case 3u:
      v55 = [VNHumanObservation alloc];
      objc_msgSend(v22, "confidence");
      LODWORD(v57) = v56;
      v58 = -[VNHumanObservation initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:](v55, "initWithOriginatingRequestSpecifier:boundingBox:upperBodyOnly:confidence:", v65, 1, x, y, width, height, v57);
      v27 = (void *)v58;
      if (v23)
        -[VNDetectedObjectObservation setGroupId:](v58, v23);
      objc_msgSend(v24, "addObject:", v27);
      goto LABEL_29;
    case 4u:
    case 5u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "labelKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "confidence");
      LODWORD(v29) = v28;
      -[VNANFDMultiDetector processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:](self, "processRecognizedObjectWithIdentifier:originatingRequestSpecifier:objectBoundingBox:objectGroupId:objectConfidence:detectedObjectResults:", v27, v65, v23, v24, x, y, width, height, v29);
LABEL_29:

LABEL_30:
      v59 = 1;
      goto LABEL_31;
    default:
      if (a12)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected label key for detected object: %d"), objc_msgSend(v22, "labelKey"));
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v30);
        *a12 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_35;
  }
}

- (void)processRecognizedObjectWithIdentifier:(id)a3 originatingRequestSpecifier:(id)a4 objectBoundingBox:(CGRect)a5 objectGroupId:(id)a6 objectConfidence:(float)a7 detectedObjectResults:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  id v19;
  VNClassificationObservation *v20;
  double v21;
  VNClassificationObservation *v22;
  VNRecognizedObjectObservation *v23;
  void *v24;
  double v25;
  VNRecognizedObjectObservation *v26;
  _QWORD v27[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v27[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = [VNClassificationObservation alloc];
  *(float *)&v21 = a7;
  v22 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v20, "initWithOriginatingRequestSpecifier:identifier:confidence:", v17, v16, v21);
  v23 = [VNRecognizedObjectObservation alloc];
  v27[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = a7;
  v26 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v23, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v17, v24, 0, v18, x, y, width, height, v25);

  objc_msgSend(v19, "addObject:", v26);
}

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);

  return v4;
}

- (BOOL)isDetectedObject:(id)a3 ofAGivenObjectSubClass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "labels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsString:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VNShotflowDetector)VNShotflowDetector
{
  return self->_mMultiHeadedANFDDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBBoxAligner, 0);
  objc_storeStrong((id *)&self->_mMultiHeadedANFDDetector, 0);
}

uint64_t __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  id obj;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  _QWORD aBlock[10];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;

  v82 = *MEMORY[0x1E0C80C00];
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 96));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 96));
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__27154;
  v78 = __Block_byref_object_dispose__27155;
  v79 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
  aBlock[3] = &unk_1E4547DB0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = &v74;
  aBlock[6] = BaseAddress;
  aBlock[7] = Height;
  aBlock[8] = Width;
  aBlock[9] = BytesPerRow;
  v56 = _Block_copy(aBlock);
  v8 = VNExecuteBlock(v56, (uint64_t)a2);
  v9 = v75[5];
  v11 = *(_QWORD *)(a1 + 96);
  v10 = *(void **)(a1 + 104);
  v72[0] = BaseAddress;
  v72[1] = Height;
  v72[2] = Width;
  v72[3] = BytesPerRow;
  objc_msgSend(v10, "_printDebugInfo:detectedObjectsRaw:faceDetectorBGRAImage:tempImage:session:", *(_QWORD *)(a1 + 40), v9, v11, v72, *(_QWORD *)(a1 + 48));
  if ((v8 & 1) != 0)
  {
    if (objc_msgSend((id)v75[5], "count"))
    {
      objc_msgSend(*(id *)(a1 + 104), "detectedObjectClassToRequestKey");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = (id)v75[5];
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v69;
        v14 = (double)Height;
        v15 = (float)Width;
        v16 = (float)Height;
        v17 = 0x1E0CB3000uLL;
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v18);
          objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", objc_msgSend(v19, "labelKey"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKey:", v20);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v63);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            if (objc_msgSend(v19, "groupId"))
            {
              objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", objc_msgSend(v19, "groupId"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectForKey:", v21);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v62)
              {
                v22 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
                objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", objc_msgSend(v19, "groupId"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = v22;
                objc_msgSend(v59, "setObject:forKey:", v22, v23);

              }
            }
            else
            {
              v62 = 0;
            }
            objc_msgSend(v19, "bounds");
            v28 = *(_QWORD *)(a1 + 144);
            v29 = 0.0;
            v30 = 0.0;
            v31 = 0.0;
            if (v28)
            {
              v32 = *(double *)(a1 + 128) / v15;
              v33 = v32;
              v30 = (*(double *)(a1 + 112) + v24 * v33) / (double)v28;
              v31 = v26 * v33 / (double)v28;
            }
            v34 = *(_QWORD *)(a1 + 152);
            v35 = 0.0;
            if (v34)
            {
              v36 = v14 - (v25 + v27);
              v37 = *(double *)(a1 + 136) / v16;
              v38 = v37;
              v29 = (*(double *)(a1 + 120) + v36 * v38) / (double)v34;
              v35 = v27 * v38 / (double)v34;
            }
            v84.origin.x = 0.0;
            v84.origin.y = 0.0;
            v84.size.width = 1.0;
            v84.size.height = 1.0;
            v83.origin.x = v30;
            v83.origin.y = v29;
            v83.size.width = v31;
            v83.size.height = v35;
            if (CGRectIntersectsRect(v83, v84))
            {
              objc_msgSend(*(id *)(a1 + 160), "supportedLabelKeys");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", objc_msgSend(v19, "labelKey"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v39, "containsObject:", v40);

              if ((v41 & 1) == 0)
              {
                if (a2)
                {
                  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Not supported object type: %d"), objc_msgSend(v19, "labelKey"));
                  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:");
                  *a2 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_41;
                }
                goto LABEL_42;
              }
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v63);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v42)
              {
                if (a2)
                {
                  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The request info is not found for request class %@"), v63);
                  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v54);
                  *a2 = (id)objc_claimAutoreleasedReturnValue();

                }
                v53 = 0;
LABEL_41:

LABEL_42:
                v52 = 0;
                goto LABEL_43;
              }
              v57 = v42;
              objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", objc_msgSend(v42, "originalRequestResultsIndex"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(*(id *)(a1 + 32), "processDetectedObject:originatingRequestSpecifier:objectBoundingBox:objectGroupId:imageBuffer:qosClass:session:warningRecorder:detectedObjectResults:error:", v19, v61, v62, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 168), *(_QWORD *)(a1 + 48), v30, v29, v31, v35, *(_QWORD *)(a1 + 80), v43, a2);
              v45 = v12;
              v46 = v13;
              v47 = a2;
              v66 = 0u;
              v67 = 0u;
              v64 = 0u;
              v65 = 0u;
              v48 = v43;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (v49)
              {
                v50 = *(_QWORD *)v65;
                do
                {
                  for (i = 0; i != v49; ++i)
                  {
                    if (*(_QWORD *)v65 != v50)
                      objc_enumerationMutation(v48);
                    objc_msgSend(*(id *)(a1 + 32), "recordImageCropQuickLookInfoFromOptions:toObservation:", *(_QWORD *)(a1 + 88), *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
                  }
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
                }
                while (v49);
              }

              v17 = 0x1E0CB3000;
              a2 = v47;
              v13 = v46;
              v12 = v45;

              if ((v44 & 1) == 0)
              {
                v53 = v57;
                goto LABEL_41;
              }

            }
          }

          if (++v18 == v12)
          {
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
            if (v12)
              goto LABEL_5;
            break;
          }
        }
      }
      v52 = 1;
LABEL_43:

    }
    else
    {
      v52 = 1;
    }
  }
  else
  {
    v52 = 0;
  }

  _Block_object_dispose(&v74, 8);
  return v52;
}

uint64_t __121__VNANFDMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "detectAndProcessObjects:inputIsBGR:", a1 + 48, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t (**v12)(void *, id *, double, double, double, double);
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  VNAsyncStatus *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  VNAsyncStatus *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  int v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E4548A88;
    v41 = *(_DWORD *)(a1 + 148);
    v9 = WeakRetained;
    v34 = v9;
    v39 = *(_OWORD *)(a1 + 104);
    v40 = *(_OWORD *)(a1 + 120);
    v35 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 80);
    v36 = v10;
    v38 = v11;
    v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    v13 = *(double *)(a1 + 104);
    v14 = *(double *)(a1 + 112);
    v15 = *(double *)(a1 + 120);
    v16 = *(double *)(a1 + 128);
    v32 = 0;
    v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    v18 = v32;
    v19 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v17, v18);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@"),
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 136) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  id v15;
  VNAsyncStatus *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  VNAsyncStatus *v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  int v46;
  int v47;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E4547CC0;
    v39 = *(id *)(a1 + 72);
    v10 = v9;
    v46 = *(_DWORD *)(a1 + 188);
    v11 = *(_QWORD *)(a1 + 136);
    v35 = v10;
    v43 = v11;
    v36 = *(id *)(a1 + 32);
    v47 = *(_DWORD *)(a1 + 184);
    v41 = *(_OWORD *)(a1 + 88);
    v12 = *(_OWORD *)(a1 + 160);
    v44 = *(_OWORD *)(a1 + 144);
    v45 = v12;
    v42 = *(_QWORD *)(a1 + 104);
    v37 = *(id *)(a1 + 40);
    v38 = *(id *)(a1 + 48);
    v40 = *(id *)(a1 + 80);
    v13 = _Block_copy(aBlock);
    v33 = 0;
    v14 = VNExecuteBlock(v13, (uint64_t)&v33);
    v15 = v33;
    v16 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v14, v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    v19 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count");
    if (v19)
    {
      for (i = 0; i != v19; ++i)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "objectAtIndex:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "objectAtIndex:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObjectsFromArray:", v21);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: finish processing; currentDetector: %@"),
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v10);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 176) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 64), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v29);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8;
  v5[3] = &unk_1E4547D60;
  v6 = *(id *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v5);

}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9;
  v7[3] = &unk_1E4547D38;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40) != a3)
  {
    v8[1] = 3221225472;
    v8[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10;
    v8[3] = &unk_1E4547D10;
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8[0] = MEMORY[0x1E0C809B0];
    v9 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

    v5 = v7;
  }

}

void __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "groupId", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "groupId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v10, "groupId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNDetectedObjectObservation setGroupId:]((uint64_t)v5, v14);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

BOOL __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  _BOOL8 v15;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  int v27;
  int v28;

  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = 0;
      *a2 = v4;
      return v15;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "completed") & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E4547C98;
  v11 = *(id *)(a1 + 32);
  v27 = *(_DWORD *)(a1 + 144);
  v12 = *(_QWORD *)(a1 + 104);
  v18 = v11;
  v24 = v12;
  v19 = *(id *)(a1 + 40);
  v28 = *(_DWORD *)(a1 + 148);
  v13 = *(_OWORD *)(a1 + 128);
  v25 = *(_OWORD *)(a1 + 112);
  v26 = v13;
  v23 = *(_OWORD *)(a1 + 88);
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 72);
  v14 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v14, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 148), a2);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0;

  return v15;
}

BOOL __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 132), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __128__VNANFDMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

@end
