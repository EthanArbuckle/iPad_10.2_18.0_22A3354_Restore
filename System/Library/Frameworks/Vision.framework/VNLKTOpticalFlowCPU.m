@implementation VNLKTOpticalFlowCPU

- (VNLKTOpticalFlowCPU)initWithWidth:(int)a3 height:(int)a4 numScales:(int)a5
{
  VNLKTOpticalFlowCPU *v5;
  VNLKTOpticalFlowCPU *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int64x2_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64x2_t v17;
  int64x2_t v18;
  uint64_t v19;
  int64x2_t v20;
  int8x16_t v21;
  const double *v22;
  int64x2_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  size_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  size_t v32;
  void *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t i;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  LKTCPU *value;
  VNLKTOpticalFlowCPU *v79;
  std::bad_alloc *exception;
  std::bad_alloc *v82;
  objc_super v83;
  float64x2x2_t v84;

  v83.receiver = self;
  v83.super_class = (Class)VNLKTOpticalFlowCPU;
  v5 = -[VNLKTOpticalFlow initWithWidth:height:numScales:](&v83, sel_initWithWidth_height_numScales_, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v6 = v5;
  if (v5)
  {
    v7 = -[VNLKTOpticalFlow width](v5, "width");
    v8 = -[VNLKTOpticalFlow height](v6, "height");
    v9 = operator new();
    *(_QWORD *)v9 = &off_1E453A070;
    dispatch_get_global_queue(17, 0);
    *(_QWORD *)(v9 + 8) = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "activeProcessorCount");

    v12 = 0;
    v13 = 0;
    *(_DWORD *)(v9 + 16) = v11;
    *(_QWORD *)(v9 + 24) = v7;
    *(_QWORD *)(v9 + 32) = v8;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = 0u;
    *(_OWORD *)(v9 + 88) = 0u;
    *(_OWORD *)(v9 + 104) = 0u;
    *(_OWORD *)(v9 + 120) = 0u;
    *(_OWORD *)(v9 + 136) = 0u;
    *(_OWORD *)(v9 + 152) = 0u;
    *(_OWORD *)(v9 + 168) = 0u;
    *(_OWORD *)(v9 + 184) = 0u;
    *(_OWORD *)(v9 + 200) = 0u;
    *(_QWORD *)(v9 + 216) = 0;
    v14 = vdupq_n_s64(1uLL);
    v15 = 40;
    v16 = *(int64x2_t *)(v9 + 24);
    do
    {
      v17 = (uint64x2_t)vaddq_s64(v16, v14);
      *(int64x2_t *)(v9 + v15) = v16;
      v13 += 2 * v16.i64[1] * ((v16.i64[0] + 31) & 0x7FFFFFFFFFFFFFE0);
      v12 += 2 * v16.i64[1] * ((2 * v16.i64[0] + 31) & 0x7FFFFFFFFFFFFFE0);
      v16 = (int64x2_t)vsraq_n_u64((uint64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v17, 1uLL), (int8x16_t)v14), v17, 1uLL);
      v15 += 16;
    }
    while (v15 != 200);
    v18 = 0uLL;
    v19 = 40;
    v20 = vdupq_n_s64(0x1FuLL);
    v21 = (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFE0);
    do
    {
      v22 = (const double *)(v9 + v19);
      v84 = vld2q_f64(v22);
      v23 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vaddq_s64(vshlq_n_s64((int64x2_t)v84.val[0], 4uLL), v20), v21), (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(vshlq_n_s64((int64x2_t)v84.val[0], 3uLL), v20), v21));
      *(_QWORD *)&v84.val[0].f64[0] = *(_QWORD *)&v84.val[1].f64[0] * v23.i64[0];
      *(_QWORD *)&v84.val[0].f64[1] = *(_QWORD *)&v84.val[1].f64[1] * v23.i64[1];
      v18 = vaddq_s64(vaddq_s64((int64x2_t)v84.val[0], (int64x2_t)v84.val[0]), v18);
      v19 += 32;
    }
    while (v19 != 200);
    v24 = vaddvq_s64(v18)
        + ((4 * *(_QWORD *)(v9 + 40) + 31) & 0xFFFFFFFFFFFFFFE0) * *(_QWORD *)(v9 + 48)
        + 2
        * *(_QWORD *)(v9 + 48)
        * (((8 * *(_QWORD *)(v9 + 40) + 31) & 0x7FFFFFFFFFFFFFE0)
         + ((4 * *(_QWORD *)(v9 + 40) + 31) & 0xFFFFFFFFFFFFFFE0)
         + ((16 * *(_QWORD *)(v9 + 40) + 31) & 0x7FFFFFFFFFFFFFE0))
        + v12
        + v13;
    v26 = *(_QWORD *)(v9 + 200);
    v25 = *(char **)(v9 + 208);
    v27 = &v25[-v26];
    v28 = v24 - (_QWORD)&v25[-v26];
    if (v24 <= (unint64_t)&v25[-v26])
    {
      if (v24 < (unint64_t)&v25[-v26])
        *(_QWORD *)(v9 + 208) = v26 + v24;
    }
    else
    {
      v29 = *(_QWORD *)(v9 + 216);
      if (v29 - (uint64_t)v25 >= v28)
      {
        v40 = v24 + v26;
        bzero(v25, v24 - (_QWORD)&v25[-v26]);
        *(_QWORD *)(v9 + 208) = v40;
      }
      else
      {
        if ((v24 & 0x8000000000000000) != 0)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v30 = v29 - v26;
        v31 = 2 * v30;
        if (2 * v30 <= v24)
          v31 = v24;
        if (v30 >= 0x3FFFFFFFFFFFFFFFLL)
          v32 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v32 = v31;
        v33 = apple::vision::AlignedAllocator<unsigned char,32ul>::allocate(v32);
        v34 = &v27[(_QWORD)v33];
        v35 = (char *)v33 + v32;
        v36 = (char *)v33 + v24;
        bzero(v34, v28);
        v38 = *(char **)(v9 + 200);
        v37 = *(char **)(v9 + 208);
        if (v37 != v38)
        {
          do
          {
            v39 = *--v37;
            *--v34 = v39;
          }
          while (v37 != v38);
          v37 = *(char **)(v9 + 200);
        }
        *(_QWORD *)(v9 + 200) = v34;
        *(_QWORD *)(v9 + 208) = v36;
        *(_QWORD *)(v9 + 216) = v35;
        if (v37)
          free(v37);
      }
      v26 = *(_QWORD *)(v9 + 200);
    }
    v41 = 0;
    v42 = 0;
    v43 = 1;
    do
    {
      v44 = 0;
      v45 = v43;
      v46 = v9 + 224 + 80 * v41;
      v47 = (_QWORD *)(v9 + 48);
      do
      {
        *(_QWORD *)(v46 + v44) = v26 + v42;
        v42 += ((*(v47 - 1) + 31) & 0xFFFFFFFFFFFFFFE0) * *v47;
        v44 += 8;
        v47 += 2;
      }
      while (v44 != 80);
      v43 = 0;
      v41 = 1;
    }
    while ((v45 & 1) != 0);
    v48 = 0;
    v49 = (v42 + 31) & 0xFFFFFFFFFFFFFFE0;
    v50 = 1;
    do
    {
      v51 = 0;
      v52 = v50;
      v53 = v9 + 384 + 80 * v48;
      v54 = (_QWORD *)(v9 + 48);
      do
      {
        *(_QWORD *)(v53 + v51) = v26 + v49;
        v49 += ((2 * *(v54 - 1) + 31) & 0xFFFFFFFFFFFFFFE0) * *v54;
        v51 += 8;
        v54 += 2;
      }
      while (v51 != 80);
      v50 = 0;
      v48 = 1;
    }
    while ((v52 & 1) != 0);
    v55 = 0;
    v56 = (v49 + 31) & 0xFFFFFFFFFFFFFFE0;
    v57 = v26 + v56;
    v58 = (_QWORD *)(v9 + 544);
    for (i = 48; i != 208; i += 16)
    {
      v60 = *(_QWORD *)(v9 + 784 + i - 792);
      v61 = *(_QWORD *)(v9 + i);
      v62 = ((8 * v60 + 31) & 0xFFFFFFFFFFFFFFE0) * v61;
      *v58 = v57 + v55;
      v63 = v62 + v55;
      v58[10] = v57 + v63;
      v64 = v62 + v63;
      v65 = ((16 * v60 + 31) & 0xFFFFFFFFFFFFFFE0) * v61;
      v58[20] = v57 + v64;
      v66 = v65 + v64;
      v58[30] = v57 + v66;
      v55 = v65 + v66;
      ++v58;
    }
    v67 = *(_QWORD *)(v9 + 40);
    v68 = *(_QWORD *)(v9 + 48);
    v69 = ((16 * v67 + 31) & 0xFFFFFFFFFFFFFFE0) * v68;
    *(_QWORD *)(v9 + 864) = v57 + v55;
    v70 = v69 + v55;
    *(_QWORD *)(v9 + 872) = v57 + v70;
    v71 = v69 + v70;
    v72 = ((4 * v67 + 31) & 0xFFFFFFFFFFFFFFE0) * v68;
    *(_QWORD *)(v9 + 880) = v57 + v71;
    v73 = v72 + v71;
    *(_QWORD *)(v9 + 888) = v57 + v73;
    v74 = v72 + v73;
    v75 = ((8 * v67 + 31) & 0xFFFFFFFFFFFFFFE0) * v68;
    *(_QWORD *)(v9 + 896) = v57 + v74;
    v76 = v75 + v74;
    *(_QWORD *)(v9 + 904) = v57 + v76;
    v77 = v75 + v76;
    *(_QWORD *)(v9 + 912) = v57 + v77;
    if (v24 != ((v72 + v77) & 0xFFFFFFFFFFFFFFE0) + v56)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      exception->__vftable = 0;
      v82 = std::bad_alloc::bad_alloc(exception);
      v82->__vftable = (std::bad_alloc_vtbl *)&off_1E453A0A0;
    }
    value = v6->_opticalFlow.__ptr_.__value_;
    v6->_opticalFlow.__ptr_.__value_ = (LKTCPU *)v9;
    if (value)
      (*(void (**)(LKTCPU *))(*(_QWORD *)value + 8))(value);
  }
  v79 = v6;

  return v79;
}

- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4
{
  BOOL v7;

  -[VNLKTOpticalFlow setIsValid:](self, "setIsValid:", 0);
  if (a3)
  {
    if (-[VNLKTOpticalFlow _validateOutputImage:error:](self, "_validateOutputImage:error:", a3, a4))
    {
      self->_uv_user_ref = a3;
      v7 = 1;
      -[VNLKTOpticalFlow setIsValid:](self, "setIsValid:", 1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    self->_uv_user_ref = 0;
    return 1;
  }
  return v7;
}

- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5
{
  _BOOL4 v9;
  int v10;
  int v11;
  int v12;
  LKTCPU *value;
  __CVBuffer *uv_user_ref;
  id v15;
  __CVBuffer *v17;
  __CVBuffer *v18;
  __CVBuffer *v19;
  _DWORD v20[2];
  BOOL v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;

  if (-[VNLKTOpticalFlow isValid](self, "isValid"))
  {
    v9 = -[VNLKTOpticalFlow _validateInputImage:error:](self, "_validateInputImage:error:", a3, a5);
    if (v9)
    {
      v9 = -[VNLKTOpticalFlow _validateInputImage:error:](self, "_validateInputImage:error:", a4, a5);
      if (v9)
      {
        v20[0] = -[VNLKTOpticalFlow numScales](self, "numScales");
        v20[1] = -[VNLKTOpticalFlow numWarpings](self, "numWarpings");
        v21 = -[VNLKTOpticalFlow useNonLocalRegularization](self, "useNonLocalRegularization");
        v22 = -[VNLKTOpticalFlow nlreg_radius](self, "nlreg_radius");
        v23 = -[VNLKTOpticalFlow nlreg_padding](self, "nlreg_padding");
        -[VNLKTOpticalFlow nlreg_sigma_l](self, "nlreg_sigma_l");
        v24 = v10;
        -[VNLKTOpticalFlow nlreg_sigma_c](self, "nlreg_sigma_c");
        v25 = v11;
        -[VNLKTOpticalFlow nlreg_sigma_w](self, "nlreg_sigma_w");
        v26 = v12;
        value = self->_opticalFlow.__ptr_.__value_;
        v19 = a3;
        if (a3)
          CVPixelBufferRetain(a3);
        v18 = a4;
        if (a4)
          CVPixelBufferRetain(a4);
        uv_user_ref = self->_uv_user_ref;
        v17 = uv_user_ref;
        if (uv_user_ref)
          CVPixelBufferRetain(uv_user_ref);
        (*(void (**)(LKTCPU *, __CVBuffer **, __CVBuffer **, __CVBuffer **, _DWORD *))(*(_QWORD *)value + 16))(value, &v19, &v18, &v17, v20);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v17);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v18);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v19);
        LOBYTE(v9) = 1;
      }
    }
  }
  else if (a5)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 15, CFSTR("CPU optical flow not properly initialized"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 0;
    *a5 = v15;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4
{
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  LKTCPU *value;
  __CVBuffer *uv_user_ref;
  id v13;
  __CVBuffer *v15;
  __CVBuffer *v16;
  _DWORD v17[2];
  BOOL v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;

  if (-[VNLKTOpticalFlow isValid](self, "isValid"))
  {
    v7 = -[VNLKTOpticalFlow _validateInputImage:error:](self, "_validateInputImage:error:", a3, a4);
    if (v7)
    {
      v17[0] = -[VNLKTOpticalFlow numScales](self, "numScales");
      v17[1] = -[VNLKTOpticalFlow numWarpings](self, "numWarpings");
      v18 = -[VNLKTOpticalFlow useNonLocalRegularization](self, "useNonLocalRegularization");
      v19 = -[VNLKTOpticalFlow nlreg_radius](self, "nlreg_radius");
      v20 = -[VNLKTOpticalFlow nlreg_padding](self, "nlreg_padding");
      -[VNLKTOpticalFlow nlreg_sigma_l](self, "nlreg_sigma_l");
      v21 = v8;
      -[VNLKTOpticalFlow nlreg_sigma_c](self, "nlreg_sigma_c");
      v22 = v9;
      -[VNLKTOpticalFlow nlreg_sigma_w](self, "nlreg_sigma_w");
      v23 = v10;
      value = self->_opticalFlow.__ptr_.__value_;
      v16 = a3;
      if (a3)
        CVPixelBufferRetain(a3);
      uv_user_ref = self->_uv_user_ref;
      v15 = uv_user_ref;
      if (uv_user_ref)
        CVPixelBufferRetain(uv_user_ref);
      (*(void (**)(LKTCPU *, __CVBuffer **, __CVBuffer **, _DWORD *))(*(_QWORD *)value + 24))(value, &v16, &v15, v17);
      apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v15);
      apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v16);
      LOBYTE(v7) = 1;
    }
  }
  else if (a4)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 15, CFSTR("CPU optical flow not properly initialized"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = 0;
    *a4 = v13;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  LKTCPU *value;

  value = self->_opticalFlow.__ptr_.__value_;
  self->_opticalFlow.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(LKTCPU *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
