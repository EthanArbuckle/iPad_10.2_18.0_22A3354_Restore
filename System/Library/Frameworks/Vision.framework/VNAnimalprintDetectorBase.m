@implementation VNAnimalprintDetectorBase

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  const void *v10;
  void **p_dst;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  _DWORD *v21;
  size_t v22;
  void *v23;
  void **v24;
  char v25;
  char v26;
  void **v27;
  BOOL v29;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  void *v34;
  void *v35;
  int v36;
  char v39;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  int32x2_t *ptr;
  const char *v46;
  const char *v47;
  shared_ptr<vision::mod::PetprintGenerator> *p_petprintGenerator;
  __shared_weak_count *cntrl;
  unint64_t *v50;
  unint64_t v51;
  const char *v53;
  const char *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void **__dst;
  size_t v59;
  int64_t v60;
  void *v61;
  char v62;
  objc_super v63;
  shared_ptr<vision::mod::PetprintGenerator> v64;
  uint64_t v65;
  void *__p[3];
  __int128 __src;
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)VNAnimalprintDetectorBase;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v63, sel_completeInitializationForSession_error_, v6, a4))
  {
    v12 = 0;
    goto LABEL_82;
  }
  -[VNDetector configurationOptions](self, "configurationOptions");
  v56 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "espressoModelFileNameForConfigurationOptions:", v56);
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v61, (char *)objc_msgSend(v55, "UTF8String"));
  v8 = objc_msgSend(v7, "modelVersionForOptions:", v56);
  v9 = *(_QWORD *)(v8 + 8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = *(const void **)v8;
  if (v9 >= 0x17)
  {
    v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v13 = v9 | 7;
    v14 = v13 + 1;
    p_dst = (void **)operator new(v13 + 1);
    v59 = v9;
    v60 = v14 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v60) = *(_QWORD *)(v8 + 8);
  p_dst = (void **)&__dst;
  if (v9)
LABEL_10:
    memmove(p_dst, v10, v9);
  *((_BYTE *)p_dst + v9) = 0;
  v15 = objc_msgSend(v57, "network");
  v17 = v16;
  v18 = objc_msgSend(v57, "plan");
  v19 = (char *)operator new(0x1F0uLL);
  *(_OWORD *)(v19 + 8) = 0u;
  *(_QWORD *)v19 = &off_1E453B808;
  *((_QWORD *)v19 + 3) = &off_1E453A388;
  *((_WORD *)v19 + 16) = 257;
  v19[34] = 0;
  *((_DWORD *)v19 + 9) = 1065353216;
  *((_QWORD *)v19 + 5) = 0;
  v20 = v19 + 40;
  *((_OWORD *)v19 + 3) = 0u;
  v21 = operator new(0xCuLL);
  *((_QWORD *)v19 + 6) = v21 + 3;
  *((_QWORD *)v19 + 7) = v21 + 3;
  *(_QWORD *)v21 = 0;
  v21[2] = 0;
  *((_QWORD *)v19 + 5) = v21;
  v19[64] = 0;
  *(_QWORD *)(v19 + 76) = 0;
  *(_QWORD *)(v19 + 68) = 0;
  v19[84] = 0;
  *((_QWORD *)v19 + 11) = 0;
  *((_QWORD *)v19 + 12) = v18;
  *((_QWORD *)v19 + 13) = v15;
  *((_QWORD *)v19 + 14) = v17;
  *((_QWORD *)v19 + 59) = 0;
  *((_QWORD *)v19 + 60) = 0;
  *((_QWORD *)v19 + 58) = 0;
  *((_DWORD *)v19 + 122) = 1065353216;
  *((_QWORD *)v19 + 3) = &off_1E453A7A0;
  v22 = HIBYTE(v60);
  if (v60 < 0)
    v22 = v59;
  v64.__ptr_ = (PetprintGenerator *)(v19 + 24);
  v64.__cntrl_ = (__shared_weak_count *)v19;
  if (v22 != 17)
  {
    v23 = (void *)v56;
    if (v22 != 2)
      goto LABEL_55;
    v24 = (void **)&__dst;
    if (v60 < 0)
      v24 = __dst;
    if (*(_WORD *)v24 != 12662)
      goto LABEL_55;
    *((_DWORD *)v19 + 122) = 1065353216;
    *((_DWORD *)v19 + 9) = 998277249;
    *(_QWORD *)&__src = 0xBEE978D5BECFDF3BLL;
    DWORD2(__src) = -1091022356;
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v20, (char *)&__src, (uint64_t)&__src + 12);
    v25 = 0;
    v26 = 0;
    goto LABEL_52;
  }
  v27 = (void **)&__dst;
  if (v60 < 0)
    v27 = __dst;
  v29 = *v27 == (void *)0x705F3376646F6E61 && v27[1] == (void *)0x646D5F31765F7465 && *((_BYTE *)v27 + 16) == 50;
  v23 = (void *)v56;
  if (v29)
  {
    *((_DWORD *)v19 + 122) = 1065353216;
    *((_DWORD *)v19 + 9) = 1065353216;
    *(_QWORD *)&__src = 0x8000000080000000;
    DWORD2(__src) = 0x80000000;
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v20, (char *)&__src, (uint64_t)&__src + 12);
    v26 = 0;
    v25 = 1;
LABEL_52:
    v39 = 1;
    goto LABEL_54;
  }
  v31 = *v27 == (void *)0x705F3476646F6E61 && v27[1] == (void *)0x646D5F32765F7465 && *((_BYTE *)v27 + 16) == 49;
  if (v31
    || (*v27 == (void *)0x705F3476646F6E61 ? (v32 = v27[1] == (void *)0x646D5F32765F7465) : (v32 = 0),
        v32 ? (v33 = *((_BYTE *)v27 + 16) == 50) : (v33 = 0),
        v33))
  {
    *((_DWORD *)v19 + 122) = 1067869798;
    *((_DWORD *)v19 + 9) = 998277249;
    *(_QWORD *)&__src = 0x8000000080000000;
    DWORD2(__src) = 0x80000000;
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v20, (char *)&__src, (uint64_t)&__src + 12);
    v39 = 0;
    v26 = 0;
    v25 = 1;
  }
  else
  {
    v34 = *v27;
    v35 = v27[1];
    v36 = *((unsigned __int8 *)v27 + 16);
    if (v34 != (void *)0x705F3476646F6E61 || v35 != (void *)0x646D5F32765F7465 || v36 != 51)
      goto LABEL_55;
    *((_DWORD *)v19 + 122) = 1067869798;
    *((_DWORD *)v19 + 9) = 998277249;
    *(_QWORD *)&__src = 0x8000000080000000;
    DWORD2(__src) = 0x80000000;
    std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v20, (char *)&__src, (uint64_t)&__src + 12);
    v39 = 0;
    v25 = 1;
    v26 = 1;
  }
LABEL_54:
  v19[32] = 1;
  v19[64] = v25;
  v19[33] = v39;
  v19[34] = v26;
LABEL_55:
  *((_DWORD *)v19 + 114) = 0;
  v40 = (char *)operator new(0x48uLL);
  *((_QWORD *)v40 + 1) = 0;
  *((_QWORD *)v40 + 2) = 0;
  *(_QWORD *)v40 = &off_1E453B920;
  *(_OWORD *)(v40 + 40) = 0u;
  *(_OWORD *)(v40 + 56) = 0u;
  *((_QWORD *)v40 + 3) = &off_1E453A8A0;
  *((_QWORD *)v40 + 4) = 1;
  *(_QWORD *)&__src = v40 + 24;
  *((_QWORD *)&__src + 1) = v40;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)(v19 + 464), &__src);
  v41 = (std::__shared_weak_count *)*((_QWORD *)&__src + 1);
  if (*((_QWORD *)&__src + 1))
  {
    v42 = (unint64_t *)(*((_QWORD *)&__src + 1) + 8);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  LOWORD(__src) = 2;
  BYTE2(__src) = 0;
  *(_QWORD *)((char *)&__src + 4) = 0x437F000000000000;
  HIDWORD(__src) = 32;
  v68 = 0;
  v44 = operator new();
  vision::mod::ImageProcessing_Preprocessor::ImageProcessing_Preprocessor(v44, (uint64_t)&__src);
  std::unique_ptr<vision::mod::ImageProcessing_Preprocessor>::reset[abi:ne180100]((uint64_t *)v19 + 60, v44);
  if (*((_QWORD *)v19 + 60))
  {
    ptr = (int32x2_t *)v64.__ptr_;
    __p[0] = 0;
    std::vector<unsigned long>::vector(&__src, 4uLL, __p);
    v65 = 0;
    std::vector<unsigned long>::vector(__p, 4uLL, &v65);
    if (espresso_network_bind_buffer())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not bind to the output TorsoprintGenerator blob: %s", v46);
    }
    else if (espresso_network_query_blob_dimensions())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not query the dimensions of the input blob: %s", v47);
    }
    else if (ptr[1].i8[2] && espresso_network_bind_buffer())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not bind to the output confidence blob: %s", v53);
    }
    else if (espresso_network_query_blob_dimensions())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not query the dimensions of the output blob: %s", v54);
    }
    else
    {
      ptr[5].i32[1] = *((_QWORD *)__p[0] + 2);
      ptr[6] = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)__src)));
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((_QWORD)__src)
    {
      *((_QWORD *)&__src + 1) = __src;
      operator delete((void *)__src);
    }
  }
  p_petprintGenerator = &self->_petprintGenerator;
  cntrl = self->_petprintGenerator.__cntrl_;
  self->_petprintGenerator = v64;
  if (cntrl)
  {
    v50 = (unint64_t *)((char *)cntrl + 8);
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  if (SHIBYTE(v60) < 0)
    operator delete(__dst);
  if (v62 < 0)
    operator delete(v61);

  v12 = p_petprintGenerator->__ptr_ != 0;
  if (a4 && !p_petprintGenerator->__ptr_)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to initialize frontalizer."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_82:
  return v12;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
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
  float v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double x;
  double y;
  double width;
  double height;
  PetprintGenerator *ptr;
  float v34;
  __CVBuffer *v35;
  BOOL v36;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNAnimalprintDetectorProcessOption_InputAnimalObservation"), v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_msgSend(v13, "width");
      v16 = objc_msgSend(v13, "height");
      objc_msgSend(v14, "boundingBox");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend((id)objc_opt_class(), "_animalBoundingBoxScalingFactorForAnimalDetectorRevision:", objc_msgSend(v14, "requestRevision"));
      v38.size.width = v22 * (double)v15;
      v38.origin.y = v20 * (double)v16;
      v38.size.height = v24 * (double)v16;
      v26 = (float)(v25 + -1.0);
      v27 = -(v38.size.width * v26) * 0.5;
      v28 = -(v38.size.height * v26) * 0.5;
      v38.origin.x = v18 * (double)v15;
      v39 = CGRectInset(v38, v27, v28);
      v40 = CGRectIntegral(v39);
      v42.origin.x = 0.0;
      v42.origin.y = 0.0;
      v42.size.width = (double)v15;
      v42.size.height = (double)v16;
      v41 = CGRectIntersection(v40, v42);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
      ptr = self->_petprintGenerator.__ptr_;
      LODWORD(v22) = *((_DWORD *)ptr + 12);
      v34 = *((float *)ptr + 13);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      v35 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v34, (unint64_t)*(float *)&v22, 1111970369, v12, a8, x, y, width, height);
      *a7 = v35;
      v36 = v35 != 0;
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PetprintGenerator *ptr;
  _QWORD *v21;
  void (**v22)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  char *v23;
  PetprintGenerator *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t *v33;
  int v34;
  uint64_t v35;
  float v36;
  void (**v37)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t DeepCopy;
  __int128 v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  PetprintGenerator *v52;
  int v53;
  float v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v59;
  unint64_t v60;
  VNAnimalprint *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  VNAnimalprint *v65;
  VNAnimalObservation *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  int v75;
  int v76;
  void *v77;
  void *v78;
  double v79;
  VNAnimalObservation *v80;
  void *v81;
  char *v82;
  unint64_t v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  __int128 v89;
  size_t Width;
  size_t BytesPerRow;
  char *v92;
  std::__shared_weak_count *v93;
  __int128 v94;
  _OWORD v95[6];
  uint64_t v96;
  int v97;
  void *v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  float *v102[3];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  v15 = a9;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v87 = v16;
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNAnimalprintDetectorProcessOption_InputAnimalObservation"), v13, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_7;
    v18 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    if ((_DWORD)v18)
    {
      if (a8)
      {
        +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v18, CFSTR("could not lock cropped image"));
        v19 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:

        goto LABEL_65;
      }
LABEL_7:
      v19 = 0;
      goto LABEL_64;
    }
    v86 = v17;
    ptr = self->_petprintGenerator.__ptr_;
    v21 = operator new(0x90uLL);
    v21[1] = 0;
    v21[2] = 0;
    *v21 = &off_1E453B958;
    v22 = &off_1E453A8D0;
    v21[3] = &off_1E453A8D0;
    v23 = (char *)(v21 + 3);
    v21[4] = 0;
    v21[5] = 0;
    v21[9] = 0;
    v21[8] = 0;
    v21[6] = 0;
    v21[7] = v21 + 8;
    *((_OWORD *)v21 + 5) = 0u;
    *((_OWORD *)v21 + 6) = 0u;
    *((_BYTE *)v21 + 112) = 0;
    *((_DWORD *)v21 + 32) = 1;
    v21[17] = 0;
    v21[15] = *((int *)ptr + 11);
    v92 = (char *)(v21 + 3);
    v93 = (std::__shared_weak_count *)v21;
    v84 = v15;
    v85 = v14;
    *(_QWORD *)&v89 = CVPixelBufferGetBaseAddress(a4);
    *((_QWORD *)&v89 + 1) = CVPixelBufferGetHeight(a4);
    Width = CVPixelBufferGetWidth(a4);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    v24 = self->_petprintGenerator.__ptr_;
    *((_DWORD *)v24 + 14) = 0;
    v105 = 0uLL;
    v25 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*((_QWORD **)v24 + 55), &v89, 4u);
    if ((v25 & 0x80) != 0)
    {
      v82 = v23;
      vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v95, *((_QWORD *)v24 + 55));
      v26 = *(char **)&v95[0];
      v83 = (uint64_t)(*((_QWORD *)&v95[0] + 1) - *(_QWORD *)&v95[0]) >> 5;
      if (*((_QWORD *)&v95[0] + 1) == *(_QWORD *)&v95[0])
      {
LABEL_39:
        v25 = (*(uint64_t (**)(_QWORD, _QWORD, char *))(**((_QWORD **)v24 + 55) + 24))(*((_QWORD *)v24 + 55), v105, v82);
        if ((v25 & 0x80) != 0)
          *((float *)v24 + 14) = *((float *)v24 + 14) / (float)v83;
      }
      else
      {
        v27 = 0;
        if (v83 <= 1)
          v28 = 1;
        else
          v28 = (uint64_t)(*((_QWORD *)&v95[0] + 1) - *(_QWORD *)&v95[0]) >> 5;
        while (1)
        {
          v29 = &v26[32 * v27];
          v103 = *(_OWORD *)v29;
          v104 = *((_OWORD *)v29 + 1);
          memset(v102, 0, sizeof(v102));
          LODWORD(v101) = 0;
          v30 = *((_QWORD *)v24 + 2);
          v99 = *(_QWORD **)v30;
          v31 = *((_DWORD *)v24 + 3);
          LODWORD(v100) = *(_DWORD *)(v30 + 8);
          HIDWORD(v100) = v31;
          LOBYTE(v101) = *((_BYTE *)v24 + 40);
          v95[0] = v103;
          v95[1] = v104;
          v32 = espresso_network_bind_input_vimagebuffer_bgra8();
          v33 = &CVML_status_internalError;
          if (!v32)
          {
            v34 = espresso_plan_execute_sync();
            v33 = &CVML_status_internalError;
            if (!v34)
              v33 = &CVML_status_ok;
          }
          v35 = *v33 + 128;
          if ((v35 & 0x80) == 0)
            break;
          vision::mod::PetprintGenerator::getPetPrint((uint64_t)v24, v102);
          if (*((_BYTE *)v24 + 10))
            v36 = **((float **)v24 + 33);
          else
            v36 = 1.0;
          v37 = v22;
          *((float *)v24 + 14) = v36 + *((float *)v24 + 14);
          v38 = operator new(8uLL);
          *v38 = v27;
          v100 = v38 + 1;
          v101 = v38 + 1;
          v39 = *((int *)v24 + 11);
          v99 = v38;
          vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v95, &v99, v102[0], 4 * v39, 1, 0);
          v97 = 1;
          v98 = 0;
          v40 = v39 & 0x3FFFFFFFFFFFFFFFLL;
          v22 = v37;
          *(_QWORD *)&v95[0] = v37;
          v96 = v40;
          if (v27)
          {
            v16 = v87;
            (*(void (**)(_QWORD, _OWORD *))(*(_QWORD *)v105 + 40))(v105, v95);
          }
          else
          {
            v16 = v87;
            DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v95);
            std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&v94, DeepCopy);
            v42 = v94;
            v94 = 0uLL;
            v43 = (std::__shared_weak_count *)*((_QWORD *)&v105 + 1);
            v105 = v42;
            if (v43)
            {
              p_shared_owners = (unint64_t *)&v43->__shared_owners_;
              do
                v45 = __ldaxr(p_shared_owners);
              while (__stlxr(v45 - 1, p_shared_owners));
              if (!v45)
              {
                ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                std::__shared_weak_count::__release_weak(v43);
              }
            }
            v46 = (std::__shared_weak_count *)*((_QWORD *)&v94 + 1);
            if (*((_QWORD *)&v94 + 1))
            {
              v47 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
              do
                v48 = __ldaxr(v47);
              while (__stlxr(v48 - 1, v47));
              if (!v48)
              {
                ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
                std::__shared_weak_count::__release_weak(v46);
              }
            }
            v38 = v99;
          }
          *(_QWORD *)&v95[0] = v22;
          free(v98);
          vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract((void **)v95);
          if (v38)
            operator delete(v38);
          if (v102[0])
            operator delete(v102[0]);
          if (++v27 == v28)
            goto LABEL_39;
        }
        v25 = v35 | 0x2800;
      }
    }
    else
    {
      v26 = 0;
    }
    v49 = (std::__shared_weak_count *)*((_QWORD *)&v105 + 1);
    if (*((_QWORD *)&v105 + 1))
    {
      v50 = (unint64_t *)(*((_QWORD *)&v105 + 1) + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    if (v26)
      operator delete(v26);
    if (v25 == 128)
    {
      v52 = self->_petprintGenerator.__ptr_;
      v15 = v84;
      v14 = v85;
      v53 = 0;
      if (*((_BYTE *)v52 + 10))
        v54 = *((float *)v52 + 14);
      else
        v54 = 1.0;
    }
    else
    {
      v54 = 0.0;
      v15 = v84;
      v14 = v85;
      if (a8)
      {
        VNErrorForCVMLStatus((id)v25);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v53 = 1;
    }
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    if (v53)
      goto LABEL_57;
    v59 = (*(uint64_t (**)(char *))(*(_QWORD *)v92 + 104))(v92);
    v60 = v59 >> 2;
    if (v59 >> 2 == *((_DWORD *)self->_petprintGenerator.__ptr_ + 11))
    {
      LODWORD(v89) = 0;
      std::vector<float>::vector(&v103, v60, &v89);
      vision::mod::PetprintGenerator::getPetPrint((uint64_t)self->_petprintGenerator.__ptr_, (float **)&v103);
      v61 = [VNAnimalprint alloc];
      v62 = v103;
      v63 = objc_msgSend(v16, "requestRevision");
      *(float *)&v64 = v54;
      v65 = -[VNAnimalprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v61, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v62, v60, 1, v59, v63, v64);
      v66 = [VNAnimalObservation alloc];
      objc_msgSend(v86, "boundingBox");
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v74 = v73;
      objc_msgSend(v86, "confidence");
      v76 = v75;
      objc_msgSend(v86, "labels");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "groupId");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v79) = v76;
      v80 = -[VNAnimalObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:](v66, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:", v16, v77, v78, v65, v68, v70, v72, v74, v79);

      objc_msgSend(v86, "uuid");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNObservation setUUID:](v80, "setUUID:", v81);

      v106[0] = v80;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_QWORD)v103)
      {
        *((_QWORD *)&v103 + 1) = v103;
        operator delete((void *)v103);
      }
      goto LABEL_58;
    }
    if (!a8)
    {
LABEL_57:
      v19 = 0;
    }
    else
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected size of animalprint descriptor"));
      v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_58:
    v55 = v93;
    if (v93)
    {
      v56 = (unint64_t *)&v93->__shared_owners_;
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    v17 = v86;
    goto LABEL_64;
  }
  v19 = 0;
LABEL_65:

  return v19;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_petprintGenerator.__cntrl_;
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

+ (const)modelVersionForOptions:(id)a3
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return &+[VNAnimalprintDetectorBase modelVersionForOptions:]::emptyString;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v7 = objc_msgSend(v6, "requestRevision");
    if (v7 == 1 || v7 == 3737841667)
    {
      objc_opt_class();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
LABEL_9:

  return (Class)v8;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    v13 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities mostPerformantComputeDevice](VNComputeDeviceUtilities, "mostPerformantComputeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNAnimalprintDetectorBase;
    objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (float)_animalBoundingBoxScalingFactorForAnimalDetectorRevision:(unint64_t)a3
{
  float result;
  float v4;

  result = 1.3;
  v4 = 1.0;
  if (a3 - 1 < 2)
    v4 = 1.3;
  if (a3 - 3737841664u >= 3)
    return v4;
  return result;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), "input");
}

@end
