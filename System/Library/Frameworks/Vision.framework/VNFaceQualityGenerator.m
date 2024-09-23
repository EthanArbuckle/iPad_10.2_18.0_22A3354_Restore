@implementation VNFaceQualityGenerator

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("image");
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNFaceQualityGenerator;
  objc_msgSendSuper2(&v10, sel_keyForDetectorWithConfigurationOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "espressoModelFileNameForConfigurationOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if ((objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()) & 1) == 0
    || (unint64_t)(objc_msgSend(v6, "requestRevision") - 1) > 2)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (Class)v7;
}

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  char *v3;
  unint64_t v4;
  basic_string_view<char, std::char_traits<char>> result;

  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  v3 = "";
  v4 = 0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  uint64_t v6;
  unint64_t v7;
  size_t v8;
  const void *v9;
  __int128 *p_dst;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  std::string::size_type v20;
  const std::string::value_type *v21;
  const char *v22;
  char *v23;
  std::string *v24;
  shared_ptr<vision::mod::FaceQualityPredictor> v25;
  uint64_t v26;
  std::__shared_weak_count *cntrl;
  unint64_t *v28;
  unint64_t v29;
  shared_ptr<vision::mod::FaceQualityPredictor> *p_mFaceQualityPredictor;
  __shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  uint64_t v36;
  shared_ptr<vision::mod::FaceQualityPredictor> v37;
  void *v38;
  void *v39;
  id v40;
  __int128 __dst;
  int64_t v42;
  objc_super v43;
  shared_ptr<vision::mod::FaceQualityPredictor> v44;
  __int16 v45;
  char v46;
  uint64_t v47;
  int v48;
  char v49;

  v43.receiver = self;
  v43.super_class = (Class)VNFaceQualityGenerator;
  v40 = a3;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v43, sel_completeInitializationForSession_error_))
  {
    v11 = 0;
    goto LABEL_53;
  }
  -[VNDetector configurationOptions](self, "configurationOptions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "modelVersionIDForConfigurationOptions:", v38);
  v8 = v7;
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = (const void *)v6;
  if (v7 >= 0x17)
  {
    v12 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v12 = v7 | 7;
    v13 = v12 + 1;
    p_dst = (__int128 *)operator new(v12 + 1);
    *((_QWORD *)&__dst + 1) = v8;
    v42 = v13 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v42) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_10:
    memmove(p_dst, v9, v8);
  *((_BYTE *)p_dst + v8) = 0;
  v14 = objc_msgSend(v39, "network");
  v16 = v15;
  v17 = objc_msgSend(v39, "plan");
  v18 = HIBYTE(v42);
  v19 = SHIBYTE(v42);
  v20 = *((_QWORD *)&__dst + 1);
  if (v42 < 0)
    v18 = *((_QWORD *)&__dst + 1);
  if (v18 == 2)
  {
    v21 = (const std::string::value_type *)__dst;
    v22 = (const char *)&__dst;
    if (v42 < 0)
      v22 = (const char *)__dst;
    if (*(_WORD *)v22 == 12662 || *(_WORD *)v22 == 12918 || *(_WORD *)v22 == 13174)
    {
LABEL_26:
      v23 = (char *)operator new(0x230uLL);
      *(_OWORD *)(v23 + 8) = 0u;
      *(_QWORD *)v23 = &off_1E453B8B0;
      *((_QWORD *)v23 + 11) = 0;
      *((_OWORD *)v23 + 6) = 0u;
      v24 = (std::string *)(v23 + 112);
      if (v19 < 0)
      {
        std::string::__init_copy_ctor_external(v24, v21, v20);
      }
      else
      {
        *(_OWORD *)&v24->__r_.__value_.__l.__data_ = __dst;
        *((_QWORD *)v23 + 16) = v42;
      }
      *((_QWORD *)v23 + 21) = 0;
      *((_QWORD *)v23 + 22) = 0;
      *((_QWORD *)v23 + 23) = v17;
      *((_QWORD *)v23 + 24) = v14;
      *((_QWORD *)v23 + 25) = v16;
      *((_QWORD *)v23 + 68) = 0xFFFFFFFF00000000;
      *((_DWORD *)v23 + 138) = 65568;
      v23[556] = 0;
      v44.__ptr_ = (FaceQualityPredictor *)(v23 + 24);
      v44.__cntrl_ = (__shared_weak_count *)v23;
      if (espresso_network_query_blob_dimensions())
      {
        espresso_plan_get_error_info();
        syslog(5, "ERROR: Could not query the dimensions of the input blob: %s");
      }
      else
      {
        if (!espresso_network_bind_buffer())
        {
          v45 = 2;
          v46 = 0;
          v47 = 0x3F80000000000000;
          v48 = 32;
          v49 = 0;
          v36 = operator new();
          vision::mod::ImageProcessing_Preprocessor::ImageProcessing_Preprocessor(v36, (uint64_t)&v45);
          std::unique_ptr<vision::mod::ImageProcessing_Preprocessor>::reset[abi:ne180100]((uint64_t *)v23 + 21, v36);
          *(_OWORD *)(v23 + 56) = 0u;
          *(_OWORD *)(v23 + 72) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          *(_OWORD *)(v23 + 40) = 0u;
          v25 = v44;
          v26 = 9344;
          v44 = (shared_ptr<vision::mod::FaceQualityPredictor>)0;
          goto LABEL_37;
        }
        espresso_plan_get_error_info();
        syslog(5, "ERROR: Could not bind to the output blob: %s");
      }
      syslog(5, "[Error] Failed to load Face Quality model");
      v25 = (shared_ptr<vision::mod::FaceQualityPredictor>)0;
      v26 = 9307;
LABEL_37:
      cntrl = (std::__shared_weak_count *)v44.__cntrl_;
      if (v44.__cntrl_)
      {
        v28 = (unint64_t *)((char *)v44.__cntrl_ + 8);
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          v37 = v25;
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
          v25 = v37;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v18 == 8)
  {
    v21 = (const std::string::value_type *)__dst;
    v22 = (const char *)&__dst;
    if (v42 < 0)
      v22 = (const char *)__dst;
    if (*(_QWORD *)v22 == 0x32706F72645F3376
      || *(_QWORD *)v22 == 0x33706F72645F3376
      || *(_QWORD *)v22 == 0x34706F72645F3376)
    {
      goto LABEL_26;
    }
  }
  else
  {
    v22 = (const char *)__dst;
    if (v42 >= 0)
      v22 = (const char *)&__dst;
  }
  syslog(5, "[Error] Version %s is not supported", v22);
  v25 = (shared_ptr<vision::mod::FaceQualityPredictor>)0;
  v26 = 9340;
LABEL_42:
  p_mFaceQualityPredictor = &self->_mFaceQualityPredictor;
  v31 = self->_mFaceQualityPredictor.__cntrl_;
  self->_mFaceQualityPredictor = v25;
  if (v31)
  {
    v32 = (unint64_t *)((char *)v31 + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v31 + 16))(v31);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v31);
    }
  }
  if (SHIBYTE(v42) < 0)
    operator delete((void *)__dst);
  v11 = p_mFaceQualityPredictor->__ptr_ != 0;
  if (a4 && !p_mFaceQualityPredictor->__ptr_)
  {
    VNErrorForCVMLStatus((id)v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Failure to create face quality predictor"), v34);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_53:

  return v11;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  FaceQualityPredictor *ptr;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  float v27;
  unint64_t v28;
  unint64_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  BOOL v40;
  __CVBuffer *v41;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_17;
    objc_msgSend(v13, "orientation");
    if ((VNSetFaceOrientationInOptionsDictionary(v14, v12, a8) & 1) == 0)
      goto LABEL_17;
    objc_msgSend(v14, "unalignedBoundingBox");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    ptr = self->_mFaceQualityPredictor.__ptr_;
    v24 = *((_QWORD *)ptr + 14);
    v25 = *((_QWORD *)ptr + 15);
    v26 = objc_msgSend(v14, "requestRevision");
    v27 = 0.3825;
    if ((unint64_t)(v26 - 3737841664) <= 6 && ((1 << v26) & 0x75) != 0 || (unint64_t)(v26 - 1) < 3)
    {
LABEL_9:
      v28 = objc_msgSend(v13, "width");
      v29 = objc_msgSend(v13, "height");
      v30 = v16 * (double)v28;
      v31 = v18 * (double)v29;
      v32 = v22 * (double)v29;
      v33 = v20 * (double)v28;
      v34 = v30 - (float)(v27 * v33);
      v35 = v31 - (float)(v27 * v32);
      v36 = floorf(v34);
      v37 = floorf(v35);
      v38 = ceilf((float)(v34 + (float)(v33 + (float)((float)(v27 * v33) * 2.0))) - v36);
      v39 = ceilf((float)(v35 + (float)(v32 + (float)((float)(v27 * v32) * 2.0))) - v37);
      if (v38 != v39)
      {
        if (v38 <= v39)
        {
          v36 = v36 + (float)(vabds_f32(v38, v39) * -0.5);
          v38 = v39;
        }
        else
        {
          v37 = v37 + (float)(vabds_f32(v39, v38) * -0.5);
          v39 = v38;
        }
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      v41 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)v24, (unint64_t)(float)v25, 1111970369, v12, a8, v36, v37, v38, v39);
      *a7 = v41;
      v40 = v41 != 0;
      goto LABEL_18;
    }
    if (!v26)
    {
      v27 = 0.0;
      goto LABEL_9;
    }
    if (a8)
    {
      +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", objc_msgSend(v14, "requestRevision"), objc_opt_class());
      v40 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      v40 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  v40 = 0;
LABEL_19:

  return v40;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  FaceQualityPredictor *ptr;
  unint64_t v16;
  unint64_t v17;
  size_t Width;
  size_t Height;
  int CVPixelBufferImageType;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v25;
  _WORD *v26;
  uint64_t v27;
  float v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v12, objc_opt_class(), a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_13:
      a8 = 0;
      goto LABEL_14;
    }
    ptr = self->_mFaceQualityPredictor.__ptr_;
    v17 = *((_QWORD *)ptr + 14);
    v16 = *((_QWORD *)ptr + 15);
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    CVPixelBufferImageType = ImageProcessing_getCVPixelBufferImageType(a4);
    if (Width == (unint64_t)(float)v17 && Height == (unint64_t)(float)v16)
    {
      if (CVPixelBufferImageType == 4)
      {
        if (espresso_network_bind_input_cvpixelbuffer())
        {
          syslog(5, "ERROR: Could not bind the image to the input blob");
        }
        else
        {
          if (!espresso_plan_execute_sync())
          {
            if (*((char *)ptr + 111) < 0)
            {
              v26 = (_WORD *)*((_QWORD *)ptr + 11);
              v27 = *((_QWORD *)ptr + 12);
            }
            else
            {
              v26 = (_WORD *)((char *)ptr + 88);
              v27 = *((unsigned __int8 *)ptr + 111);
            }
            v28 = fminf(**((float **)ptr + 44) * 0.25, 1.0);
            if (v27 == 2 && *v26 == 12918)
              v28 = 1.0 / (exp(v28 * -3.78 + 2.0) + 1.0);
            if (v28 <= 1.0 && v28 >= 0.0)
            {
              objc_msgSend(v13, "setFaceCaptureQuality:originatingRequestSpecifier:", v14);
              v29[0] = v13;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
              a8 = (id *)objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            }
            if (!a8)
              goto LABEL_14;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("face quality of %f is out of range"), v28);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
          espresso_plan_get_error_info();
          syslog(5, "ERROR: Could not execute plan: %s", v25);
        }
        v21 = 9307;
        if (!a8)
          goto LABEL_14;
LABEL_11:
        VNErrorForCVMLStatus((id)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", CFSTR("Could not run network"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        *a8 = v23;

        goto LABEL_13;
      }
      syslog(5, "ERROR: Unexpected input image buffer format");
    }
    else
    {
      syslog(5, "ERROR: Unexpected input image buffer dimensions");
    }
    v21 = 9331;
    if (!a8)
    {
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_11;
  }
  a8 = 0;
LABEL_15:

  return a8;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_mFaceQualityPredictor.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
