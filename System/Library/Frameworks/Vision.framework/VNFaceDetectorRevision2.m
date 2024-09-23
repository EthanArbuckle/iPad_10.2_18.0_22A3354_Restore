@implementation VNFaceDetectorRevision2

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
  VNSizeRange *v4;
  VNSupportedImageSize *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", 448, 597, 448);
  v5 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", 1111970369, v4, v4, 2, 1, 1);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VNFaceDetectorRevision2_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __64__VNFaceDetectorRevision2_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetectorRevision2;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorOption_MetalContextPriority"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VNFaceBBoxAligner *v18;
  VNFaceBBoxAligner *faceBBoxAligner;
  const std::string::value_type *v20;
  BOOL v21;
  BOOL v22;
  int v23;
  uint64_t *v24;
  int v25;
  char v26;
  int v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD aBlock[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  const char *v43;
  uint64_t v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  int v48;
  void *v49[2];
  void *__p[2];
  __int128 v51;
  char v52;
  int v53;
  objc_super v54;
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54.receiver = self;
  v54.super_class = (Class)VNFaceDetectorRevision2;
  if (-[VNDetector completeInitializationForSession:error:](&v54, sel_completeInitializationForSession_error_, v6, a4))
  {
    -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      VNFrameworkBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "6ziz6uinva_opt.espresso");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pathForResource:ofType:", v8, CFSTR("net"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[VNDetector configurationOptions](self, "configurationOptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("FBBA: creating VNFaceBBoxAligner from VNFaceDetectorRevision2: %@"), v12);

        +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:error:](VNFaceBBoxAligner, "supportedComputeStageDevicesForOptions:error:", v10, a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "mutableCopy");
        v55 = CFSTR("VNComputeStageMain");
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));

        v17 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", CFSTR("VNFaceBoxAlignerType"), v17, a4);
        v18 = (VNFaceBBoxAligner *)objc_claimAutoreleasedReturnValue();
        faceBBoxAligner = self->_faceBBoxAligner;
        self->_faceBBoxAligner = v18;

        if (self->_faceBBoxAligner
          && +[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &self->_preferBackgroundProcessing, CFSTR("VNDetectorOption_PreferBackgroundProcessing"), v10, 0, a4))
        {
          v38 = 0;
          v39 = &v38;
          v40 = 0x8812000000;
          v41 = __Block_byref_object_copy__1469;
          v42 = __Block_byref_object_dispose__1470;
          v43 = " 0";
          v44 = 0x3DCCCCCD3F0CCCCDLL;
          v46 = 256;
          v47 = 0x5FFFFFFFFLL;
          v48 = 65552;
          *(_OWORD *)v49 = 0u;
          *(_OWORD *)__p = 0u;
          v51 = 0u;
          v52 = 0;
          v53 = 1041865114;
          v45 = 0;
          v20 = (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          std::string::__assign_external((std::string *)(v39 + 10), v20);
          v21 = +[VNComputeDeviceUtilities isNeuralEngineComputeDevice:](VNComputeDeviceUtilities, "isNeuralEngineComputeDevice:", v7);
          *((_BYTE *)v39 + 64) = v21;
          v22 = +[VNComputeDeviceUtilities isGPUComputeDevice:](VNComputeDeviceUtilities, "isGPUComputeDevice:", v7);
          *((_BYTE *)v39 + 65) = v22;
          v23 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:](VNEspressoHelpers, "espressoDeviceIDForComputeDevice:", v7);
          v24 = v39;
          *((_DWORD *)v39 + 17) = v23;
          if (self->_preferBackgroundProcessing && *((_BYTE *)v24 + 65))
          {
            v25 = 5;
          }
          else
          {
            v25 = +[VNEspressoHelpers espressoEngineForComputeDevice:](VNEspressoHelpers, "espressoEngineForComputeDevice:", v7);
            v24 = v39;
          }
          *((_DWORD *)v24 + 18) = v25;
          v27 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:](VNEspressoHelpers, "espressoStorageTypeForComputeDevice:", v7);
          v28 = v39;
          *((_DWORD *)v39 + 19) = v27;
          if (*((_BYTE *)v28 + 65))
          {
            -[VNDetector metalContext](self, "metalContext");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v29)
              v31 = *(void **)(v29 + 8);
            else
              v31 = 0;
            v32 = v31;
            *((_DWORD *)v39 + 17) = espresso_device_id_for_metal_device();

          }
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__VNFaceDetectorRevision2_completeInitializationForSession_error___block_invoke;
          aBlock[3] = &unk_1E4543480;
          aBlock[4] = self;
          aBlock[5] = &v38;
          v33 = _Block_copy(aBlock);
          v26 = VNExecuteBlock(v33, (uint64_t)a4);

          _Block_object_dispose(&v38, 8);
          if (SHIBYTE(v51) < 0)
            operator delete(__p[1]);
          if (SHIBYTE(__p[0]) < 0)
            operator delete(v49[0]);

        }
        else
        {
          v26 = 0;
        }

      }
      else if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("could not locate the face detection model file"));
        v26 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
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
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  float v30;
  float v31;
  _BOOL4 v32;
  _BOOL4 v33;
  unint64_t v34;
  unint64_t v35;
  __CVBuffer *v36;
  id v37;
  BOOL v38;
  id v40;
  float v41;
  float v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    goto LABEL_17;
  v21 = objc_msgSend(v19, "width");
  v22 = objc_msgSend(v20, "height");
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  if (v23 <= 0x1BF)
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, 448);
  v43 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v43, CFSTR("VNDetectorOption_MetalContextPriority"), v17, 1, a8))
  {
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v45 = CGRectIntegral(v44);
    v24 = v45.origin.x;
    v25 = v45.origin.y;
    v26 = v45.size.width;
    v27 = v45.size.height;
    v28 = (unint64_t)v45.size.width;
    v29 = (unint64_t)v45.size.height;
    v41 = (float)(unint64_t)v45.size.height;
    v42 = (float)(unint64_t)v45.size.width;
    (*(void (**)(ObjectDetector_DCNFaceDetector_v2 *, float *))(*(_QWORD *)self->_faceDetector.__ptr_ + 24))(self->_faceDetector.__ptr_, &v41);
    v32 = v31 < v42;
    v33 = v30 < v41;
    if (v32 && v33)
      v34 = (unint64_t)v31;
    else
      v34 = v28;
    if (v32 && v33)
      v35 = (unint64_t)v30;
    else
      v35 = v29;
    v40 = 0;
    v36 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v34, v35, 1111970369, v17, a8, &v40, v24, v25, v26, v27);
    v37 = v40;
    *a7 = v36;
    v38 = v36 != 0;
    if (v36)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v17, v37, v20);

  }
  else
  {
LABEL_17:
    v38 = 0;
  }

  return v38;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t (**v28)(void *, id *, double, double, double, double);
  id v29;
  id v30;
  uint64_t v32;
  void *v33;
  _QWORD aBlock[4];
  id v35;
  VNFaceDetectorRevision2 *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  const __CVBuffer *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  unsigned int v50;
  _QWORD v51[6];
  _QWORD v52[3];
  void **v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a5;
  v20 = a7;
  v21 = a9;
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v19, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v19, a8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v33 = v21;
      v32 = objc_msgSend(v23, "width");
      v25 = objc_msgSend(v24, "height");
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x4812000000;
      v51[3] = __Block_byref_object_copy__38;
      v51[4] = __Block_byref_object_dispose__39;
      v51[5] = "";
      memset(v52, 0, sizeof(v52));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __125__VNFaceDetectorRevision2_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E45434A8;
      v43 = a4;
      v35 = v19;
      v36 = self;
      v42 = v51;
      v37 = v24;
      v38 = v22;
      v44 = v32;
      v45 = v25;
      v50 = a6;
      v46 = x;
      v47 = y;
      v48 = width;
      v49 = height;
      v39 = v20;
      v41 = v33;
      v27 = v26;
      v40 = v27;
      v28 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
      if ((v28[2](v28, a8, x, y, width, height) & 1) != 0)
      {
        v21 = v33;
        if (+[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:](VNRuntimeUtilities, "linkTimeOrRunTimeBeforeVersion:", 393216))
        {
          v29 = &__block_literal_global_86_33184;
          objc_msgSend(v27, "sortWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);

        }
        v30 = v27;
      }
      else
      {
        v30 = 0;
        v21 = v33;
      }

      _Block_object_dispose(v51, 8);
      v53 = (void **)v52;
      std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v53);
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)purgeIntermediates
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[5];

  if (self->_faceDetector.__ptr_)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__VNFaceDetectorRevision2_purgeIntermediates__block_invoke;
    v11[3] = &unk_1E4547B88;
    v11[4] = self;
    if ((VNExecuteBlock(v11, 0) & 1) == 0)
      VNValidatedLog(4, (uint64_t)CFSTR("Exception thrown while trying to purge face detector layers."), v3, v4, v5, v6, v7, v8, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VNFaceDetectorRevision2;
  -[VNFaceDetector purgeIntermediates](&v10, sel_purgeIntermediates);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_faceBBoxAligner, 0);
  cntrl = self->_faceDetector.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

uint64_t __45__VNFaceDetectorRevision2_purgeIntermediates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  if ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 56) + 88))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56)) != 6016)
    VNValidatedLog(4, (uint64_t)CFSTR("Wiping layers for face detector unsuccessful."), v1, v2, v3, v4, v5, v6, vars0);
  return 1;
}

BOOL __125__VNFaceDetectorRevision2_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2, double a3, double a4, double a5, double a6)
{
  size_t Width;
  size_t Height;
  size_t v12;
  size_t v13;
  float *v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  float v45;
  uint64_t v46;
  float *v47;
  float v48;
  float v49;
  float v50;
  float v51;
  unint64_t v52;
  unint64_t v53;
  VNFaceObservation *v54;
  float v55;
  double v56;
  float v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  int v63;
  void *v64;
  double v65;
  uint64_t v66;
  int v67;
  double v68;
  void *v69;
  void *v70;
  int v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  void *v94;
  double v95;
  double v96;
  BOOL v97;
  _QWORD *v98;
  uint64_t v99;
  double v100;
  unint64_t v101;
  double r2;
  void *v105;
  float context;
  void *contexta;
  float v108;
  id v109;
  float v110;
  VNFaceObservation *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  _OWORD v118[2];
  float *v119;
  float *v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  float **v124;
  _BYTE v125[128];
  VNFaceObservation *v126;
  _QWORD v127[3];
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;

  v127[1] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
  *(_QWORD *)&v122 = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 96));
  v12 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
  *((_QWORD *)&v122 + 1) = v12;
  v13 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  *(_QWORD *)&v123 = v13;
  *((_QWORD *)&v123 + 1) = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 96));
  v121 = 1;
  v98 = a2;
  if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v121, CFSTR("VNDetectorOption_MetalContextPriority"), *(_QWORD *)(a1 + 32), 1, a2))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 56) + 96))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 80), v121);
    (*(void (**)(float **__return_ptr, _QWORD, __int128 *))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 56) + 48))(&v119, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), &v122);
    v95 = a5;
    v96 = a6;
    v14 = v119;
    v15 = v120;
    if (v119 != v120)
    {
      *(float *)&v105 = (float)v12;
      r2 = (float)v12;
      context = (float)v13;
      v100 = (float)v13;
      do
      {
        v16 = v14[6];
        v17 = fminf(v16, 0.0);
        if (v17 >= 0.0 && v17 <= 0.0)
        {
          v18 = v14[7];
          v19 = fminf(v18, 0.0);
          if (v19 >= 0.0 && v19 <= 0.0)
          {
            v20 = v14[9];
            v21 = (float)(v16 + v20) - context;
            if (v21 <= 0.0)
            {
              v22 = v14[8];
              v23 = (float)(v18 + v22) - *(float *)&v105;
              if (v23 <= 0.0)
              {
                v24 = v16 - (float)(v17 + fmaxf(v21, 0.0));
                v25 = v18 - (float)(v19 + fmaxf(v23, 0.0));
                v14[6] = v24;
                v14[7] = v25;
                v108 = v22;
                v26 = v22;
                v110 = v20;
                v27 = v20;
                v131.origin.x = 0.0;
                v131.origin.y = 0.0;
                v128.origin.x = v24;
                v128.origin.y = v25;
                v128.size.width = v20;
                v128.size.height = v22;
                v131.size.width = v100;
                v131.size.height = r2;
                v129 = CGRectIntersection(v128, v131);
                v132.origin.x = v129.origin.x;
                v132.origin.y = v129.origin.y;
                v28 = v129.size.width;
                v29 = v129.size.height;
                v129.origin.x = v24;
                v129.origin.y = v25;
                v129.size.width = v27;
                v129.size.height = v26;
                v132.size.width = v28;
                v132.size.height = v29;
                v130 = CGRectIntersection(v129, v132);
                if (v130.size.width * v130.size.height / (v27 * v26 + v28 * v29 - v130.size.width * v130.size.height) >= 0.9999)
                {
                  v14[6] = v24;
                  v14[7] = v25;
                  v14[8] = v108;
                  v14[9] = v110;
                  v30 = *(uint64_t **)(*(_QWORD *)(a1 + 88) + 8);
                  v31 = v30[7];
                  if (v31 >= v30[8])
                  {
                    v32 = std::vector<vision::mod::DetectedObject>::__push_back_slow_path<vision::mod::DetectedObject const&>(v30 + 6, (uint64_t)v14);
                  }
                  else
                  {
                    vision::mod::DetectedObject::DetectedObject(v30[7], (uint64_t)v14);
                    v32 = v31 + 80;
                    v30[7] = v31 + 80;
                  }
                  v30[7] = v32;
                }
              }
            }
          }
        }
        v14 += 20;
      }
      while (v14 != v15);
    }
    v33 = (void *)objc_opt_class();
    v34 = *(_QWORD *)(a1 + 96);
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48;
    v118[0] = v122;
    v118[1] = v123;
    objc_msgSend(v33, "printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:", *(_QWORD *)(a1 + 48), v35, v34, v118, *(_QWORD *)(a1 + 56));
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48);
    v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 56);
    v38 = v37 - v36;
    if (v37 == v36)
    {
      v41 = 1;
    }
    else
    {
      +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", *(_QWORD *)(a1 + 32), v98);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v94 = v39;
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v39, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
        v127[0] = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v40, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        v41 = 0;
        v42 = 0;
        v43 = v38 / 80;
        v44 = v95 / (float)Width;
        v45 = v96 / (float)Height;
        v101 = v38 / 80;
        if ((unint64_t)(v38 / 80) <= 1)
          v43 = 1;
        v99 = v43;
        while (1)
        {
          v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48);
          v47 = (float *)(v46 + 80 * v42);
          v49 = v47[6];
          v48 = v47[7];
          v51 = v47[8];
          v50 = v47[9];
          contexta = (void *)MEMORY[0x1A1B0B060]();
          v53 = *(_QWORD *)(a1 + 104);
          v52 = *(_QWORD *)(a1 + 112);
          v54 = [VNFaceObservation alloc];
          v55 = a3 + (float)(v49 * v44);
          v56 = (float)(v55 / (float)v53);
          v57 = a4 + (float)(v48 * v45);
          v58 = (float)(v57 / (float)v52);
          v59 = (float)((float)(v50 * v44) / (float)v53);
          v60 = (float)((float)(v51 * v45) / (float)v52);
          v111 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](v54, "initWithOriginatingRequestSpecifier:boundingBox:", v39, v56, v58, v59, v60);
          -[VNFaceObservation setUnalignedBoundingBox:](v111, "setUnalignedBoundingBox:", v56, v58, v59, v60);
          v62 = v46 + 80 * v42;
          v63 = *(unsigned __int8 *)(v62 + 48);
          if (*(_BYTE *)(v62 + 48))
          {
            *(float *)&v61 = (float)(*(float *)(v46 + 80 * v42 + 40) * 3.1416) / 180.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v105;
          }
          else
          {
            v64 = 0;
          }
          -[VNFaceObservation setRoll:](v111, "setRoll:", v64);
          if (v63)

          v66 = v46 + 80 * v42;
          v67 = *(unsigned __int8 *)(v66 + 49);
          if (*(_BYTE *)(v66 + 49))
          {
            *(float *)&v65 = (float)(*(float *)(v46 + 80 * v42 + 44) * 3.1416) / 180.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
            r2 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v68 = r2;
          }
          else
          {
            v68 = 0.0;
          }
          -[VNFaceObservation setYaw:](v111, "setYaw:", *(_QWORD *)&v68);
          if (v67)

          v126 = v111;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v69, CFSTR("VNDetectorProcessOption_InputFaceObservations"));

          objc_msgSend(*(id *)(a1 + 48), "orientation");
          v70 = *(void **)(a1 + 32);
          v117 = 0;
          v71 = VNSetFaceOrientationInOptionsDictionary(v111, v70, &v117);
          v72 = v117;
          if ((v71 & 1) != 0)
          {
            v73 = *(_QWORD *)(a1 + 32);
            v74 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
            v75 = *(unsigned int *)(a1 + 152);
            v76 = *(double *)(a1 + 120);
            v77 = *(double *)(a1 + 128);
            v78 = *(double *)(a1 + 136);
            v79 = *(double *)(a1 + 144);
            v80 = *(_QWORD *)(a1 + 64);
            v116 = v72;
            objc_msgSend(v74, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v75, v73, v80, &v116, *(_QWORD *)(a1 + 80), v76, v77, v78, v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = v116;

            if (!v81)
              goto LABEL_45;
            if (objc_msgSend(v81, "count") == 1)
            {
              v97 = v41;
              v114 = 0u;
              v115 = 0u;
              v112 = 0u;
              v113 = 0u;
              v82 = v81;
              v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
              if (v83)
              {
                v84 = *(_QWORD *)v113;
                do
                {
                  for (i = 0; i != v83; ++i)
                  {
                    if (*(_QWORD *)v113 != v84)
                      objc_enumerationMutation(v82);
                    v86 = *(_QWORD **)(*((_QWORD *)&v112 + 1) + 8 * i);
                    objc_msgSend(v86, "alignedBoundingBoxAsCGRect");
                    if (v86)
                    {
                      v86[12] = v87;
                      v86[13] = v88;
                      v86[14] = v89;
                      v86[15] = v90;
                    }
                    objc_msgSend(*(id *)(a1 + 40), "recordImageCropQuickLookInfoFromOptions:toObservation:", *(_QWORD *)(a1 + 32), v86);
                  }
                  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
                }
                while (v83);
              }

              v39 = v94;
              v41 = v97;
              objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v82);
              v91 = 1;
            }
            else
            {
LABEL_45:
              +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Failed to align a detected bounding box"), v109);
              v92 = objc_claimAutoreleasedReturnValue();

              v91 = 0;
              v109 = (id)v92;
            }

            v72 = v109;
          }
          else
          {
            v91 = 0;
          }

          objc_autoreleasePoolPop(contexta);
          if (!v71)
            break;
          if ((v91 & 1) == 0)
          {
            if (v98)
            {
              v72 = objc_retainAutorelease(v72);
              *v98 = v72;
            }
            break;
          }

          v41 = ++v42 >= v101;
          if (v42 == v99)
          {
            v41 = 1;
            goto LABEL_57;
          }
        }

      }
      else
      {
        v41 = 0;
      }
LABEL_57:

    }
    v124 = &v119;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)&v124);
  }
  else
  {
    return 0;
  }
  return v41;
}

uint64_t __66__VNFaceDetectorRevision2_completeInitializationForSession_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  __int128 v4;
  std::string *v5;
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __int128 v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v20;
  _QWORD v21[6];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = (char *)operator new(0x98uLL);
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &off_1E453BB50;
  *((_QWORD *)v3 + 3) = &off_1E453ADF8;
  v3[32] = 1;
  *((_QWORD *)v3 + 5) = *(_QWORD *)(v2 + 48);
  *((_QWORD *)v3 + 6) = *(id *)(v2 + 56);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(v2 + 64);
  if (*(char *)(v2 + 103) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v3 + 3, *(const std::string::value_type **)(v2 + 80), *(_QWORD *)(v2 + 88));
  }
  else
  {
    v4 = *(_OWORD *)(v2 + 80);
    *((_QWORD *)v3 + 11) = *(_QWORD *)(v2 + 96);
    *(_OWORD *)(v3 + 72) = v4;
  }
  v5 = (std::string *)(v3 + 96);
  v20 = a1;
  if (*(char *)(v2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(v2 + 104), *(_QWORD *)(v2 + 112));
  }
  else
  {
    v6 = *(_OWORD *)(v2 + 104);
    *((_QWORD *)v3 + 14) = *(_QWORD *)(v2 + 120);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *(_QWORD *)(v2 + 128);
  *((_QWORD *)v3 + 17) = 0;
  v8 = v3 + 136;
  *((_QWORD *)v3 + 15) = v7;
  v3[128] = 1;
  *((_QWORD *)v3 + 18) = 0;
  v9 = (char *)operator new(0x90uLL);
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = &off_1E453BB18;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *(_OWORD *)(v9 + 120) = 0u;
  *((_QWORD *)v9 + 17) = 0;
  *((_QWORD *)v9 + 3) = 0x3DCCCCCD3F0CCCCDLL;
  *((_QWORD *)v9 + 4) = 0;
  v9[41] = 1;
  *(_QWORD *)(v9 + 44) = 0x5FFFFFFFFLL;
  *((_DWORD *)v9 + 13) = 65552;
  *(_OWORD *)(v9 + 72) = 0u;
  *(_OWORD *)(v9 + 88) = 0u;
  v9[104] = 0;
  *(_OWORD *)(v9 + 56) = 0u;
  *((_DWORD *)v9 + 27) = 1041865114;
  *((_QWORD *)v9 + 14) = 0;
  *((_QWORD *)v9 + 15) = 0;
  *((_QWORD *)v9 + 16) = 0;
  v9[136] = 0;
  *(_QWORD *)&v10 = v9 + 24;
  *((_QWORD *)&v10 + 1) = v9;
  *(_OWORD *)(v3 + 136) = v10;
  *((_QWORD *)v9 + 3) = *(_QWORD *)(v2 + 48);
  objc_storeStrong((id *)v9 + 4, *(id *)(v2 + 56));
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v2 + 64);
  std::string::operator=((std::string *)(v9 + 56), (const std::string *)(v2 + 80));
  std::string::operator=((std::string *)(v9 + 80), (const std::string *)(v2 + 104));
  *((_QWORD *)v9 + 13) = *(_QWORD *)(v2 + 128);
  if (!*(_QWORD *)(v2 + 56))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.espresso.mainqueue", v11);
    v13 = *(void **)(*(_QWORD *)v8 + 8);
    *(_QWORD *)(*(_QWORD *)v8 + 8) = v12;

  }
  v14 = *(void **)(*(_QWORD *)v8 + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___ZN6vision3mod33ObjectDetector_DCNFaceDetector_v2C2ERKNS0_41ObjectDetector_DCNFaceDetector_v2_OptionsE_block_invoke;
  v21[3] = &__block_descriptor_48_e5_v8__0l;
  v21[4] = v3 + 24;
  v21[5] = v2 + 48;
  vision::mod::dispatch_sync_guard(v14, v21);
  *(_QWORD *)&v15 = v3 + 24;
  *((_QWORD *)&v15 + 1) = v3;
  v16 = *(std::__shared_weak_count **)(*(_QWORD *)(v20 + 32) + 64);
  *(_OWORD *)(*(_QWORD *)(v20 + 32) + 56) = v15;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  return 1;
}

@end
