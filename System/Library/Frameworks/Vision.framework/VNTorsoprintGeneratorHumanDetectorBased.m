@implementation VNTorsoprintGeneratorHumanDetectorBased

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
  size_t v20;
  void **v21;
  BOOL v23;
  __int128 v24;
  float v25;
  BOOL v26;
  BOOL v28;
  BOOL v30;
  BOOL v32;
  BOOL v34;
  BOOL v36;
  char v38;
  char v40;
  char v41;
  size_t v42;
  int v43;
  void **v44;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  void *v51;
  void *v52;
  uint64_t v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  void **v57;
  BOOL v60;
  void *v62;
  void *v63;
  uint64_t v64;
  BOOL v65;
  void **v67;
  void **v68;
  void *v69;
  int v70;
  char *v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  char v77;
  int32x2_t *ptr;
  const char *v79;
  shared_ptr<vision::mod::TorsoprintGenerator> *p_torsoprintGenerator;
  __shared_weak_count *cntrl;
  unint64_t *v82;
  unint64_t v83;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  void *v89;
  void **__dst;
  size_t v91;
  int64_t v92;
  objc_super v93;
  shared_ptr<vision::mod::TorsoprintGenerator> v94;
  uint64_t v95;
  void *__p[3];
  __int128 v97;
  char v98;

  v6 = a3;
  v93.receiver = self;
  v93.super_class = (Class)VNTorsoprintGeneratorHumanDetectorBased;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v93, sel_completeInitializationForSession_error_, v6, a4))
  {
    v12 = 0;
    goto LABEL_189;
  }
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDetector configurationOptions](self, "configurationOptions");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "modelVersionForOptions:", v89);
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
    v91 = v9;
    v92 = v14 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v92) = *(_QWORD *)(v8 + 8);
  p_dst = (void **)&__dst;
  if (v9)
LABEL_10:
    memmove(p_dst, v10, v9);
  *((_BYTE *)p_dst + v9) = 0;
  v15 = objc_msgSend(v7, "network");
  v17 = v16;
  v18 = objc_msgSend(v7, "plan");
  v19 = (char *)operator new(0x290uLL);
  *(_OWORD *)(v19 + 8) = 0u;
  *((_QWORD *)v19 + 3) = &off_1E453A3C0;
  *(_QWORD *)v19 = &off_1E453B878;
  *((_OWORD *)v19 + 2) = 0u;
  *((_WORD *)v19 + 24) = 257;
  v19[50] = 0;
  *((_DWORD *)v19 + 13) = 1065353216;
  *((_WORD *)v19 + 28) = 0;
  *(_OWORD *)(v19 + 60) = 0u;
  v19[76] = 0;
  *((_QWORD *)v19 + 10) = 0;
  *((_QWORD *)v19 + 11) = v18;
  *((_QWORD *)v19 + 12) = v15;
  *((_QWORD *)v19 + 13) = v17;
  LODWORD(v97) = 0;
  std::vector<float>::vector((_QWORD *)v19 + 77, 4uLL, &v97);
  *((_QWORD *)v19 + 81) = 0;
  *((_QWORD *)v19 + 3) = &off_1E453A850;
  v94.__ptr_ = (TorsoprintGenerator *)(v19 + 24);
  v94.__cntrl_ = (__shared_weak_count *)v19;
  v20 = HIBYTE(v92);
  v21 = __dst;
  if (v92 < 0)
    v20 = v91;
  if (v20 != 4)
  {
    if (v20 != 10)
    {
      if (v20 != 19)
      {
        if (v92 >= 0)
          v21 = (void **)&__dst;
        goto LABEL_84;
      }
      if (v92 >= 0)
        v21 = (void **)&__dst;
      v23 = *v21 == (void *)0x745F3376646F6E61
         && v21[1] == (void *)0x5F33765F6F73726FLL
         && *(void **)((char *)v21 + 11) == (void *)0x32646D5F33765F6FLL;
      v24 = xmmword_1A15FB700;
      v25 = 1.0;
      if (!v23)
      {
        v26 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F33765F6F73726FLL;
        if (!v26 || *(void **)((char *)v21 + 11) != (void *)0x33646D5F33765F6FLL)
        {
          v28 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F33765F6F73726FLL;
          if (!v28 || *(void **)((char *)v21 + 11) != (void *)0x34646D5F33765F6FLL)
          {
            v30 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F34765F6F73726FLL;
            if (!v30 || *(void **)((char *)v21 + 11) != (void *)0x31646D5F34765F6FLL)
            {
              v32 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F34765F6F73726FLL;
              if (!v32 || *(void **)((char *)v21 + 11) != (void *)0x32646D5F34765F6FLL)
              {
                v34 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F35765F6F73726FLL;
                if (!v34 || *(void **)((char *)v21 + 11) != (void *)0x31646D5F35765F6FLL)
                {
                  v36 = *v21 == (void *)0x745F3376646F6E61 && v21[1] == (void *)0x5F35765F6F73726FLL;
                  if (!v36 || *(void **)((char *)v21 + 11) != (void *)0x32646D5F35765F6FLL)
                  {
LABEL_84:
                    syslog(5, "[Error] Failed to find the default network options for version . %s", (const char *)v21);
                    v41 = 1;
                    goto LABEL_88;
                  }
                }
              }
            }
          }
        }
      }
      v38 = 0;
      goto LABEL_86;
    }
    if (v92 >= 0)
      v21 = (void **)&__dst;
    if (*v21 != (void *)0x616D735F322E3276 || *((_WORD *)v21 + 4) != 27756)
      goto LABEL_84;
    v24 = xmmword_1A15FB710;
LABEL_85:
    v25 = 1.0;
    v38 = 1;
LABEL_86:
    v40 = 1;
    goto LABEL_87;
  }
  if (v92 >= 0)
    v21 = (void **)&__dst;
  v24 = xmmword_1A15FB710;
  if (*(_DWORD *)v21 == 841888374)
    goto LABEL_85;
  if (*(_DWORD *)v21 != 808334198)
    goto LABEL_84;
  v38 = 0;
  v40 = 0;
  v25 = 0.0039216;
LABEL_87:
  v41 = 0;
  *(_OWORD *)*((_QWORD *)v19 + 77) = v24;
  v19[56] = v38;
  v19[48] = v40;
  *((float *)v19 + 13) = v25;
LABEL_88:
  v19[57] = 0;
  v42 = HIBYTE(v92);
  v43 = SHIBYTE(v92);
  if (v92 < 0)
    v42 = v91;
  if (v42 == 19)
  {
    v44 = __dst;
    if (v92 >= 0)
      v44 = (void **)&__dst;
    if (*v44 == (void *)0x745F3376646F6E61
      && v44[1] == (void *)0x5F34765F6F73726FLL
      && *(void **)((char *)v44 + 11) == (void *)0x31646D5F34765F6FLL)
    {
      goto LABEL_122;
    }
    v47 = *v44 == (void *)0x745F3376646F6E61 && v44[1] == (void *)0x5F34765F6F73726FLL;
    v48 = v47 && *(void **)((char *)v44 + 11) == (void *)0x32646D5F34765F6FLL;
    if (v48
      || (*v44 == (void *)0x745F3376646F6E61 ? (v49 = v44[1] == (void *)0x5F35765F6F73726FLL) : (v49 = 0),
          v49 ? (v50 = *(void **)((char *)v44 + 11) == (void *)0x31646D5F35765F6FLL) : (v50 = 0),
          v50
       || ((v51 = *v44, v52 = v44[1], v53 = *(uint64_t *)((char *)v44 + 11), v51 == (void *)0x745F3376646F6E61)
         ? (v54 = v52 == (void *)0x5F35765F6F73726FLL)
         : (v54 = 0),
           v54 ? (v55 = v53 == 0x32646D5F35765F6FLL) : (v55 = 0),
           v55)))
    {
LABEL_122:
      v19[57] = 1;
    }
    v19[50] = 0;
    v56 = v43 < 0;
    v57 = (void **)&__dst;
    if (v56)
      v57 = __dst;
    if (*v57 != (void *)0x745F3376646F6E61
      || v57[1] != (void *)0x5F33765F6F73726FLL
      || *(void **)((char *)v57 + 11) != (void *)0x32646D5F33765F6FLL)
    {
      v60 = *v57 == (void *)0x745F3376646F6E61 && v57[1] == (void *)0x5F33765F6F73726FLL;
      if (!v60 || *(void **)((char *)v57 + 11) != (void *)0x33646D5F33765F6FLL)
      {
        v62 = *v57;
        v63 = v57[1];
        v64 = *(uint64_t *)((char *)v57 + 11);
        v65 = v62 == (void *)0x745F3376646F6E61 && v63 == (void *)0x5F33765F6F73726FLL;
        if (!v65 || v64 != 0x34646D5F33765F6FLL)
          goto LABEL_163;
      }
    }
  }
  else
  {
    v19[50] = 0;
    if (v42 == 10)
    {
      v68 = __dst;
      if (v43 >= 0)
        v68 = (void **)&__dst;
      v69 = *v68;
      v70 = *((unsigned __int16 *)v68 + 4);
      if (v69 != (void *)0x616D735F322E3276 || v70 != 27756)
        goto LABEL_163;
    }
    else
    {
      if (v42 != 4)
        goto LABEL_163;
      v67 = __dst;
      if (v43 >= 0)
        v67 = (void **)&__dst;
      if (*(_DWORD *)v67 != 841888374 && *(_DWORD *)v67 != 808334198)
        goto LABEL_163;
    }
  }
  v19[50] = 1;
LABEL_163:
  *((_DWORD *)v19 + 160) = 0;
  v72 = (char *)operator new(0x48uLL);
  *((_QWORD *)v72 + 1) = 0;
  *((_QWORD *)v72 + 2) = 0;
  *(_QWORD *)v72 = &off_1E453B920;
  *(_OWORD *)(v72 + 40) = 0u;
  *(_OWORD *)(v72 + 56) = 0u;
  *((_QWORD *)v72 + 3) = &off_1E453A8A0;
  *((_QWORD *)v72 + 4) = 1;
  *(_QWORD *)&v97 = v72 + 24;
  *((_QWORD *)&v97 + 1) = v72;
  std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)(v19 + 32), &v97);
  v73 = (std::__shared_weak_count *)*((_QWORD *)&v97 + 1);
  if (*((_QWORD *)&v97 + 1))
  {
    v74 = (unint64_t *)(*((_QWORD *)&v97 + 1) + 8);
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
  }
  LOWORD(v97) = 2;
  BYTE2(v97) = 0;
  *(_QWORD *)((char *)&v97 + 4) = 0x437F000000000000;
  HIDWORD(v97) = 32;
  v98 = 0;
  v76 = operator new();
  vision::mod::ImageProcessing_Preprocessor::ImageProcessing_Preprocessor(v76, (uint64_t)&v97);
  std::unique_ptr<vision::mod::ImageProcessing_Preprocessor>::reset[abi:ne180100]((uint64_t *)v19 + 81, v76);
  if (*((_QWORD *)v19 + 81))
    v77 = v41;
  else
    v77 = 1;
  if ((v77 & 1) == 0)
  {
    ptr = (int32x2_t *)v94.__ptr_;
    __p[0] = 0;
    std::vector<unsigned long>::vector(&v97, 4uLL, __p);
    v95 = 0;
    std::vector<unsigned long>::vector(__p, 4uLL, &v95);
    if (espresso_network_bind_buffer())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not bind to the output TorsoprintGenerator blob: %s", v79);
    }
    else if (ptr[4].i8[0] && espresso_network_bind_buffer())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not bind to the output segmentation blob: %s", v85);
    }
    else if (ptr[4].i8[1] && espresso_network_bind_buffer())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not bind to the output confidence blob: %s", v86);
    }
    else if (espresso_network_query_blob_dimensions())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not query the dimensions of the input blob: %s", v87);
    }
    else if (espresso_network_query_blob_dimensions())
    {
      espresso_plan_get_error_info();
      syslog(5, "ERROR: Could not query the dimensions of the output blob: %s", v88);
    }
    else
    {
      ptr[4].i32[1] = *((_QWORD *)__p[0] + 2);
      ptr[5] = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)v97)));
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((_QWORD)v97)
    {
      *((_QWORD *)&v97 + 1) = v97;
      operator delete((void *)v97);
    }
  }
  p_torsoprintGenerator = &self->_torsoprintGenerator;
  cntrl = self->_torsoprintGenerator.__cntrl_;
  *p_torsoprintGenerator = v94;
  if (cntrl)
  {
    v82 = (unint64_t *)((char *)cntrl + 8);
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v12 = p_torsoprintGenerator->__ptr_ != 0;
  if (a4 && !p_torsoprintGenerator->__ptr_)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not create torso print generator"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (SHIBYTE(v92) < 0)
    operator delete(__dst);

LABEL_189:
  return v12;
}

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  __CVBuffer *v7;
  uint64_t v9;
  VNTorsoprint *v10;
  TorsoprintGenerator *ptr;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  int v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  float *v26;
  unint64_t v27;
  uint64_t v28;
  float v29;
  float v30;
  float *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  float *v36;
  int v37;
  uint64_t v38;
  int v39;
  float v40;
  float *v41;
  uint64_t v42;
  float v43;
  float *v44;
  float v45;
  float v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t DeepCopy;
  __int128 v50;
  std::__shared_weak_count *v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  unint64_t v62;
  TorsoprintGenerator *v63;
  float v64;
  VNTorsoprint *v65;
  double v66;
  unint64_t *v67;
  unint64_t v68;
  unint64_t v70;
  id *v71;
  unint64_t v72;
  char *v73;
  __CVBuffer *v74;
  VNTorsoprintGeneratorHumanDetectorBased *v75;
  uint64_t v76;
  _QWORD *v77;
  std::__shared_weak_count *v78;
  __int128 v79;
  size_t Width;
  size_t BytesPerRow;
  __int128 v82;
  _OWORD v83[6];
  uint64_t v84;
  int v85;
  void *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;

  v7 = a3;
  v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if ((_DWORD)v9)
  {
    if (a5)
    {
      +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v9, CFSTR("unable to lock base address of pixel buffer"));
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    return v10;
  }
  v72 = a4;
  *(_QWORD *)&v79 = CVPixelBufferGetBaseAddress(v7);
  *((_QWORD *)&v79 + 1) = CVPixelBufferGetHeight(v7);
  Width = CVPixelBufferGetWidth(v7);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v7);
  ptr = self->_torsoprintGenerator.__ptr_;
  v12 = (std::__shared_weak_count *)operator new(0x90uLL);
  v12->__shared_owners_ = 0;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B958;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E453A8D0;
  v13 = v12 + 1;
  v12[1].__shared_owners_ = 0;
  v12[1].__shared_weak_owners_ = 0;
  v12[3].__vftable = 0;
  v12[2].__shared_weak_owners_ = 0;
  v12[2].__vftable = 0;
  v12[2].__shared_owners_ = (uint64_t)&v12[2].__shared_weak_owners_;
  *(_OWORD *)&v12[3].__shared_owners_ = 0u;
  v12[4].std::__shared_count = 0u;
  LOBYTE(v12[4].__shared_weak_owners_) = 0;
  LODWORD(v12[5].__shared_owners_) = 1;
  v12[5].__shared_weak_owners_ = 0;
  v12[5].__vftable = (std::__shared_weak_count_vtbl *)*((int *)ptr + 9);
  v77 = &v12[1].__vftable;
  v78 = v12;
  *((_DWORD *)ptr + 12) = 0;
  v92 = 0uLL;
  v74 = v7;
  v75 = self;
  v14 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*((_QWORD **)ptr + 1), &v79, 4u);
  if ((v14 & 0x80) != 0)
  {
    v71 = a5;
    vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v83, *((_QWORD *)ptr + 1));
    v15 = *(char **)&v83[0];
    v70 = (uint64_t)(*((_QWORD *)&v83[0] + 1) - *(_QWORD *)&v83[0]) >> 5;
    if (*((_QWORD *)&v83[0] + 1) == *(_QWORD *)&v83[0])
    {
LABEL_67:
      a5 = v71;
      v14 = (*(uint64_t (**)(_QWORD, _QWORD, std::__shared_weak_count *))(**((_QWORD **)ptr + 1) + 24))(*((_QWORD *)ptr + 1), v92, v13);
      if ((v14 & 0x80) != 0)
        *((float *)ptr + 12) = *((float *)ptr + 12) / (float)v70;
    }
    else
    {
      v16 = 0;
      v17 = (uint64_t)(*((_QWORD *)&v83[0] + 1) - *(_QWORD *)&v83[0]) >> 5;
      if (v70 <= 1)
        v17 = 1;
      v76 = v17;
      v73 = *(char **)&v83[0];
      while (1)
      {
        v18 = &v15[32 * v16];
        v19 = *((_OWORD *)v18 + 1);
        v90 = *(_OWORD *)v18;
        v91 = v19;
        LODWORD(v89) = 0;
        v87 = 0;
        v88 = 0;
        HIDWORD(v88) = *((_DWORD *)ptr + 7);
        LOBYTE(v89) = *((_BYTE *)ptr + 24);
        v83[0] = v90;
        v83[1] = v19;
        v20 = espresso_network_bind_input_vimagebuffer_bgra8();
        v21 = &CVML_status_IOError;
        if (!v20)
        {
          v22 = espresso_plan_execute_sync();
          v21 = &CVML_status_IOError;
          if (!v22)
            v21 = &CVML_status_ok;
        }
        v23 = *v21;
        v24 = v23 + 128;
        if ((((_DWORD)v23 + 128) & 0x80) == 0)
        {
          v14 = v24 | 0x2500;
          a5 = v71;
          goto LABEL_71;
        }
        if (*((int *)ptr + 9) < 1)
        {
          v25 = 0;
        }
        else
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = 0.0;
          do
          {
            v30 = *(float *)(*((_QWORD *)ptr + 11) + 4 * v28);
            if ((unint64_t)v26 >= v27)
            {
              v32 = v26 - v25;
              v33 = v32 + 1;
              if ((unint64_t)(v32 + 1) >> 62)
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v27 - (_QWORD)v25) >> 1 > v33)
                v33 = (uint64_t)(v27 - (_QWORD)v25) >> 1;
              if (v27 - (unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
                v34 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v34 = v33;
              if (v34)
                v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v34);
              else
                v35 = 0;
              v36 = (float *)(v34 + 4 * v32);
              *v36 = v30;
              v31 = v36 + 1;
              while (v26 != v25)
              {
                v37 = *((_DWORD *)v26-- - 1);
                *((_DWORD *)v36-- - 1) = v37;
              }
              v27 = v34 + 4 * v35;
              if (v25)
                operator delete(v25);
              v25 = v36;
            }
            else
            {
              *v26 = v30;
              v31 = v26 + 1;
            }
            v29 = v29 + v30;
            ++v28;
            v26 = v31;
          }
          while (v28 < *((int *)ptr + 9));
          if (*((_BYTE *)ptr + 25))
          {
            v38 = *((unsigned int *)ptr + 9);
            v7 = v74;
            self = v75;
            v15 = v73;
            if ((int)v38 >= 1)
            {
              v39 = *((unsigned __int8 *)ptr + 26);
              v40 = 0.0;
              v41 = v25;
              v42 = *((unsigned int *)ptr + 9);
              do
              {
                v43 = *v41;
                if (v39)
                {
                  v43 = v43 - (float)(v29 / (float)(int)v38);
                  *v41 = v43;
                }
                v40 = v40 + (float)(v43 * v43);
                ++v41;
                --v42;
              }
              while (v42);
              v44 = v25;
              v45 = sqrtf(v40);
              do
              {
                *v44 = *v44 / v45;
                ++v44;
                --v38;
              }
              while (v38);
            }
          }
          else
          {
            v7 = v74;
            self = v75;
            v15 = v73;
          }
        }
        v46 = *((_BYTE *)ptr + 33) ? **((float **)ptr + 53) : 1.0;
        *((float *)ptr + 12) = v46 + *((float *)ptr + 12);
        v47 = operator new(8uLL);
        *v47 = v16;
        v88 = v47 + 1;
        v89 = v47 + 1;
        v48 = *((int *)ptr + 9);
        v87 = v47;
        vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v83, &v87, v25, 4 * v48, 1, 0);
        v85 = 1;
        v86 = 0;
        *(_QWORD *)&v83[0] = &off_1E453A8D0;
        v84 = v48 & 0x3FFFFFFFFFFFFFFFLL;
        if (v16)
        {
          (*(void (**)(_QWORD, _OWORD *))(*(_QWORD *)v92 + 40))(v92, v83);
        }
        else
        {
          DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v83);
          std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&v82, DeepCopy);
          v50 = v82;
          v82 = 0uLL;
          v51 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
          v92 = v50;
          if (v51)
          {
            p_shared_owners = (unint64_t *)&v51->__shared_owners_;
            do
              v53 = __ldaxr(p_shared_owners);
            while (__stlxr(v53 - 1, p_shared_owners));
            if (!v53)
            {
              ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
              std::__shared_weak_count::__release_weak(v51);
            }
          }
          v54 = (std::__shared_weak_count *)*((_QWORD *)&v82 + 1);
          if (*((_QWORD *)&v82 + 1))
          {
            v55 = (unint64_t *)(*((_QWORD *)&v82 + 1) + 8);
            do
              v56 = __ldaxr(v55);
            while (__stlxr(v56 - 1, v55));
            if (!v56)
            {
              ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
              std::__shared_weak_count::__release_weak(v54);
            }
          }
        }
        *(_QWORD *)&v83[0] = &off_1E453A8D0;
        free(v86);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract((void **)v83);
        if (v87)
          operator delete(v87);
        if (v25)
          operator delete(v25);
        if ((v24 & 0x80) == 0)
          break;
        if (++v16 == v76)
          goto LABEL_67;
      }
      a5 = v71;
      v14 = 9600;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_71:
  v57 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
  if (*((_QWORD *)&v92 + 1))
  {
    v58 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  if (v15)
    operator delete(v15);
  v60 = CVPixelBufferUnlockBaseAddress(v7, 1uLL);
  if (v14 != 128)
  {
    if (a5)
    {
      VNErrorForCVMLStatus((id)v14);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_84;
    }
LABEL_90:
    v10 = 0;
    goto LABEL_93;
  }
  if (!(_DWORD)v60)
  {
    v62 = (*(uint64_t (**)(_QWORD *))(*v77 + 104))(v77);
    v63 = self->_torsoprintGenerator.__ptr_;
    if (v62 >> 2 == *((_DWORD *)v63 + 9))
    {
      if (*((_BYTE *)v63 + 33))
        v64 = *((float *)v63 + 12);
      else
        v64 = 1.0;
      v65 = [VNTorsoprint alloc];
      *(float *)&v66 = v64;
      v10 = -[VNTorsoprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v65, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v77[7], v62 >> 2, 1, v62, v72, v66);
      goto LABEL_93;
    }
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected size of torsoprint descriptor"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_84;
    }
    goto LABEL_90;
  }
  if (!a5)
    goto LABEL_90;
  +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v60, CFSTR("unable to lock base address of pixel buffer"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_84:
  v10 = 0;
  *a5 = v61;
LABEL_93:
  if (v78)
  {
    v67 = (unint64_t *)&v78->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  return v10;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  __CVBuffer *v26;
  BOOL v27;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredDetectedObjectObservationInOptions:withOptionName:forObservationClass:error:](VNValidationUtilities, "requiredDetectedObjectObservationInOptions:withOptionName:forObservationClass:error:", v12, CFSTR("VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation"), objc_opt_class(), a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "boundingBox");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = objc_msgSend(v13, "width");
      v25 = objc_msgSend(v13, "height");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
      v26 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), 1111970369, v12, a8, v17 * (double)v24, v19 * (double)v25, v21 * (double)v24, v23 * (double)v25);
      *a7 = v26;
      v27 = v26 != 0;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredDetectedObjectObservationInOptions:withOptionName:forObservationClass:error:](VNValidationUtilities, "requiredDetectedObjectObservationInOptions:withOptionName:forObservationClass:error:", v12, CFSTR("VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation"), objc_opt_class(), a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "vn_cloneObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v16;

        -[VNTorsoprintGeneratorHumanDetectorBased torsoprintForImageBuffer:requestRevision:error:](self, "torsoprintForImageBuffer:requestRevision:error:", a4, objc_msgSend(v13, "requestRevision"), a8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "setTorsoprint:", v18);
          v21[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }

        goto LABEL_14;
      }
      if (a8)
      {
        +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    v17 = 0;
    v19 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_torsoprintGenerator.__cntrl_;
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
  return &+[VNTorsoprintGeneratorHumanDetectorBased modelVersionForOptions:]::emptyModelVersion;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), "torso__0");
}

@end
