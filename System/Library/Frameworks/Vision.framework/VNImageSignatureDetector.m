@implementation VNImageSignatureDetector

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
  block[2] = __65__VNImageSignatureDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __65__VNImageSignatureDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageSignatureDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureprintType"));
  objc_msgSend(v2, "addObject:", CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureHashType"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t (**v7)(void *, const __CFString *, id *);
  void *v8;
  _QWORD aBlock[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNImageSignatureDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v11, sel_completeInitializationForSession_error_, a3))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &self->_imageSignatureprintType, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureprintType"), v6, a4)&& +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &self->_imageSignatureHashType, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureHashType"), v6, a4))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__VNImageSignatureDetector_completeInitializationForSession_error___block_invoke;
      aBlock[3] = &unk_1E4548788;
      aBlock[4] = self;
      v7 = (uint64_t (**)(void *, const __CFString *, id *))_Block_copy(aBlock);
      if (-[VNImageSignatureDetector imageSignatureprintType](self, "imageSignatureprintType") == 3)
      {
        LOBYTE(a4) = v7[2](v7, CFSTR("neuralhash_128x96_seed1"), a4);
      }
      else if (a4)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown signature print type: %lu"), -[VNImageSignatureDetector imageSignatureprintType](self, "imageSignatureprintType"));
        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v8);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }

    }
    else
    {
      LOBYTE(a4) = 0;
    }

  }
  else
  {
    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  VN6Ac6Cyl5O5oK19HboyMBR *v14;
  VN6Ac6Cyl5O5oK19HboyMBR *v15;
  unint64_t v16;
  VN6B8mkraBUpwUqskMYPtS3 *v17;
  VN3XKGTKNBvy6h4RFtpxLyW *v18;
  VN3XKGTKNBvy6h4RFtpxLyW *v19;
  void *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  _QWORD *v29;
  std::__shared_weak_count *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v10, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", CFSTR("VNComputeStageMain"), v10, a7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[VNImageSignatureDetector _calculateImageSignatureprintDescriptorFromOptions:error:](self, "_calculateImageSignatureprintDescriptorFromOptions:error:", v10, a7);
      if (v29)
      {
        v13 = (*(uint64_t (**)(_QWORD *))(*v29 + 104))(v29);
        v14 = [VN6Ac6Cyl5O5oK19HboyMBR alloc];
        v15 = -[VN6Ac6Cyl5O5oK19HboyMBR initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:](v14, "initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:", v29[7], v13 >> 2, 1, v13, -[VNImageSignatureDetector imageSignatureprintType](self, "imageSignatureprintType"), v11);
        -[VNImageSignatureDetector _calculateImageSignatureHashDescriptorFrom:options:error:](self, "_calculateImageSignatureHashDescriptorFrom:options:error:", &v29, v10, a7);
        if (v27)
        {
          v16 = (*(uint64_t (**)())(*v27 + 104))();
          v17 = -[VN6B8mkraBUpwUqskMYPtS3 initWithData:elementCount:elementType:lengthInBytes:imageSignatureHashType:requestRevision:]([VN6B8mkraBUpwUqskMYPtS3 alloc], "initWithData:elementCount:elementType:lengthInBytes:imageSignatureHashType:requestRevision:", v27[7], v16 >> 2, 1, v16, -[VNImageSignatureDetector imageSignatureHashType](self, "imageSignatureHashType"), 1);
          v18 = -[VN3XKGTKNBvy6h4RFtpxLyW initWithOriginatingRequestSpecifier:imageSignatureprint:imageSignatureHash:]([VN3XKGTKNBvy6h4RFtpxLyW alloc], "initWithOriginatingRequestSpecifier:imageSignatureprint:imageSignatureHash:", v11, v15, v17);
          v19 = v18;
          if (v18)
          {
            v31[0] = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else if (a7)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unknown error creating VNObservation object"));
            v20 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }
        if (v28)
        {
          p_shared_owners = (unint64_t *)&v28->__shared_owners_;
          do
            v22 = __ldaxr(p_shared_owners);
          while (__stlxr(v22 - 1, p_shared_owners));
          if (!v22)
          {
            ((void (*)())v28->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v28);
          }
        }

      }
      else
      {
        v20 = 0;
      }
      v23 = v30;
      if (v30)
      {
        v24 = (unint64_t *)&v30->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureprintDescriptorFromOptions:(id)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  vision::mod::ImageDescriptorBufferAbstract *v16;
  __int128 v17;
  void *v18;
  ImageDescriptorBufferAbstract *v19;
  __shared_weak_count *v20;
  __int128 v21;
  uint64_t v22;
  id v23[3];
  shared_ptr<vision::mod::ImageDescriptorBufferAbstract> result;

  v7 = v4;
  v8 = a3;
  memset(v23, 0, sizeof(v23));
  v9 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", v23, objc_opt_class(), CFSTR("VNImageSignatureDetectorProcessOption_ImageSignatureprintInput"), v8, a4);
  v10 = v23[0];
  if (!v9)
    goto LABEL_11;
  v22 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v22, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureprintType"), v8, a4))goto LABEL_11;
  v11 = v22;
  if (v11 != -[VNImageSignatureDetector imageSignatureprintType](self, "imageSignatureprintType"))
  {
    if (a4)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Mismatch in signature print type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      *a4 = v18;
    }
LABEL_11:
    *v7 = 0;
    v7[1] = 0;
    goto LABEL_12;
  }
  if (v22 != 3)
  {
    if (a4)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Unknown signature print type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v10, "descriptorData");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (void *)objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v10, "elementCount");
  v15 = operator new(0x90uLL);
  v15[1] = 0;
  v15[2] = 0;
  *v15 = &off_1E453B958;
  v16 = vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((vision::mod::ImageDescriptorBufferAbstract *)(v15 + 3), v13, 4 * v14, 1, 0);
  v15[3] = &off_1E453A8D0;
  *((_DWORD *)v15 + 32) = 1;
  v15[17] = 0;
  v15[15] = v14 & 0x3FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v17 = v16;
  *((_QWORD *)&v17 + 1) = v15;
  v21 = v17;

  *(_OWORD *)v7 = v21;
LABEL_12:

  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureHashDescriptorFrom:(const void *)a3 options:(id)a4 error:(id *)a5
{
  _QWORD *v5;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  ImageDescriptorBufferAbstract *v13;
  __shared_weak_count *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  uint64_t v19;
  shared_ptr<vision::mod::ImageDescriptorBufferAbstract> result;

  v9 = v5;
  v10 = a4;
  v19 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v19, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureHashType"), v10, a5))
  {
LABEL_7:
    *v9 = 0;
    v9[1] = 0;
    goto LABEL_8;
  }
  v11 = v19;
  if (v11 != -[VNImageSignatureDetector imageSignatureHashType](self, "imageSignatureHashType"))
  {
    if (a5)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Mismatch in signature hash type"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)self->_hyperplaneLSHProcessor.__ptr_.__value_ + 64))(&v18);
  v12 = (void *)(*(uint64_t (**)(ImageDescriptorProcessorHyperplaneLSH *, _QWORD, _QWORD))(*(_QWORD *)self->_hyperplaneLSHProcessor.__ptr_.__value_ + 160))(self->_hyperplaneLSHProcessor.__ptr_.__value_, *(_QWORD *)a3, v18);
  if (v12 == 128)
  {
    *(_OWORD *)v9 = v18;
  }
  else
  {
    if (a5)
    {
      VNErrorForCVMLStatus(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    *v9 = 0;
    v9[1] = 0;
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
LABEL_8:

  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (unint64_t)imageSignatureHashType
{
  return self->_imageSignatureHashType;
}

- (void).cxx_destruct
{
  ImageDescriptorProcessorHyperplaneLSH *value;

  value = self->_hyperplaneLSHProcessor.__ptr_.__value_;
  self->_hyperplaneLSHProcessor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

BOOL __67__VNImageSignatureDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  id v19;
  void *__p[2];
  char v21;

  v5 = a2;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v7 == 1)
  {
    v8 = v5;
    VNFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForResource:ofType:", v8, CFSTR("dat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Model file %@.dat is missing"), v8);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Loading Resource Error"), v18, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v19);
    }

    v11 = objc_retainAutorelease(v10);
    v12 = (char *)objc_msgSend(v11, "UTF8String");
    v13 = operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, v12);
    vision::mod::ImageDescriptorProcessorHyperplaneLSH::ImageDescriptorProcessorHyperplaneLSH(v13, (uint64_t)__p);
    if (v21 < 0)
      operator delete(__p[0]);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v14 + 56);
    *(_QWORD *)(v14 + 56) = v13;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

  }
  else if (a3)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown signature hash type: %lu"), objc_msgSend(*(id *)(a1 + 32), "imageSignatureHashType"));
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 == 1;
}

@end
