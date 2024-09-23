@implementation IHKBilateralHarmonizer

+ (id)getDefault
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  const char *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v8, v9, (uint64_t)CFSTR("stylotorch_1.3.0_har_5yfia6gt28_227200_gat_dkn9b63bjd_22752"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("Models"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc((Class)a1);
  LODWORD(v12) = 1050253722;
  LODWORD(v13) = 0.75;
  v15 = (void *)objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_baseHarmonizationStrength_(v11, v14, (uint64_t)v10, 1, (uint64_t)CFSTR("subject_rgba"), CFSTR("background_style"), CFSTR("decoder_swapped_grid_predictor_grid"), CFSTR("gating_module_subject_orig_out"), v12, v13, 128);

  return v15;
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 inputResolution:(unint64_t)a8
{
  double v8;

  LODWORD(v8) = 0;
  return (IHKBilateralHarmonizer *)objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, a7, 0, v8, a8);
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10
{
  double v10;
  double v11;

  LODWORD(v11) = 0;
  LODWORD(v10) = 1.0;
  return (IHKBilateralHarmonizer *)objc_msgSend_initWithNetwork_supportsAlpha_fgName_bgName_outName_gatingOutName_gatingThreshold_inputResolution_baseHarmonizationStrength_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, a7, 0, v11, v10);
}

- (IHKBilateralHarmonizer)initWithNetwork:(id)a3 supportsAlpha:(unsigned __int8)a4 fgName:(id)a5 bgName:(id)a6 outName:(id)a7 gatingOutName:(id)a8 gatingThreshold:(float)a9 inputResolution:(unint64_t)a10 baseHarmonizationStrength:(float)a11
{
  id v20;
  id v21;
  IHKBilateralHarmonizer *v22;
  __shared_weak_count *v23;
  TensorStorage *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  std::__shared_weak_count *cntrl;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  __shared_weak_count *v33;
  TensorStorage *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  NSLock *v43;
  NSLock *lock;
  IHKBilateralHarmonizer *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  char v54;
  char v55;
  char v56;
  uint64_t (**v57)();
  int v58;
  void *__p;
  char *v60;
  TensorStorage *v61;
  std::__shared_weak_count *v62;
  objc_super v63;

  v20 = a3;
  v21 = a5;
  v50 = a6;
  v49 = a7;
  v48 = a8;
  v63.receiver = self;
  v63.super_class = (Class)IHKBilateralHarmonizer;
  v22 = -[IHKBilateralHarmonizer init](&v63, sel_init);
  if (v22)
  {
    v51 = a10;
    v52 = a10;
    v53 = 1111970369;
    v54 = 1;
    v55 = 0;
    v56 = 0;
    v47 = v20;
    sub_23ECBC5D4((uint64_t)&v57, (uint64_t)&v51);
    v22->_fgInput.type_ = v58;
    if (&v22->_fgInput != (PixelBufferTensor *)&v57)
      sub_23ECB18EC(&v22->_fgInput.shape_.sizes_.__begin_, (char *)__p, v60, (v60 - (_BYTE *)__p) >> 3);
    v24 = v61;
    v23 = (__shared_weak_count *)v62;
    if (v62)
    {
      p_shared_owners = (unint64_t *)&v62->__shared_owners_;
      do
        v26 = __ldxr(p_shared_owners);
      while (__stxr(v26 + 1, p_shared_owners));
    }
    cntrl = (std::__shared_weak_count *)v22->_fgInput.storage_.__cntrl_;
    v22->_fgInput.storage_.__ptr_ = v24;
    v22->_fgInput.storage_.__cntrl_ = v23;
    if (cntrl)
    {
      v28 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v57 = &off_250F5D430;
    v30 = v62;
    if (v62)
    {
      v31 = (unint64_t *)&v62->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    if (__p)
    {
      v60 = (char *)__p;
      operator delete(__p);
    }
    v51 = a10;
    v52 = a10;
    v53 = 1111970369;
    v54 = 1;
    v55 = 0;
    v56 = 0;
    sub_23ECBC5D4((uint64_t)&v57, (uint64_t)&v51);
    v22->_bgInput.type_ = v58;
    if (&v22->_bgInput != (PixelBufferTensor *)&v57)
      sub_23ECB18EC(&v22->_bgInput.shape_.sizes_.__begin_, (char *)__p, v60, (v60 - (_BYTE *)__p) >> 3);
    v34 = v61;
    v33 = (__shared_weak_count *)v62;
    if (v62)
    {
      v35 = (unint64_t *)&v62->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    v37 = (std::__shared_weak_count *)v22->_bgInput.storage_.__cntrl_;
    v22->_bgInput.storage_.__ptr_ = v34;
    v22->_bgInput.storage_.__cntrl_ = v33;
    if (v37)
    {
      v38 = (unint64_t *)&v37->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v57 = &off_250F5D430;
    v40 = v62;
    if (v62)
    {
      v41 = (unint64_t *)&v62->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    if (__p)
    {
      v60 = (char *)__p;
      operator delete(__p);
    }
    objc_storeStrong((id *)&v22->_networkPath, a3);
    v22->_supportsAlpha = a4;
    objc_storeStrong((id *)&v22->_fgName, a5);
    objc_storeStrong((id *)&v22->_bgName, a6);
    objc_storeStrong((id *)&v22->_outName, a7);
    objc_storeStrong((id *)&v22->_gatingOutName, a8);
    v22->_gatingThreshold = a9;
    v20 = v47;
    v43 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v22->_lock;
    v22->_lock = v43;

    v22->_baseHarmonizationStrength = a11;
    v45 = v22;
  }

  return v22;
}

- (void)load
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  EspressoNet *v6;
  EspressoNet *value;
  EspressoNet *v8;
  const char *v9;
  EspressoNet *v10;

  v9 = (const char *)objc_msgSend_UTF8String(self->_networkPath, a2, v2, v3, v4);
  sub_23ECC2FCC(&v9, &v10);
  v6 = v10;
  v10 = 0;
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = v6;
  if (value)
  {
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
    v8 = v10;
    v10 = 0;
    if (v8)
      (*(void (**)(EspressoNet *))(*(_QWORD *)v8 + 8))(v8);
  }
}

- (CGImage)handleRequest:(id)a3
{
  id v4;
  IHKHarmonizationRequest *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGImage *v30;

  v4 = a3;
  v5 = [IHKHarmonizationRequest alloc];
  v10 = objc_msgSend_fg(v4, v6, v7, v8, v9);
  v15 = objc_msgSend_bg(v4, v11, v12, v13, v14);
  objc_msgSend_harmonizationStrength(v4, v16, v17, v18, v19);
  v21 = (void *)objc_msgSend_initWithForeground_background_forceHarmonization_harmonizationStrength_(v5, v20, v10, v15, 1);
  objc_msgSend_harmonize_(self, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (CGImage *)objc_msgSend_harmonized(v25, v26, v27, v28, v29);

  CGImageRetain(v30);
  return v30;
}

- (id)harmonize:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CVBuffer *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __CVBuffer *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  EspressoNet *value;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  NSString *gatingOutName;
  const char *v51;
  size_t v52;
  size_t v53;
  __int128 *p_dst;
  _BOOL8 v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  _BYTE *v61;
  _BYTE *v62;
  int64_t v63;
  char *v64;
  uint64_t (**v65)();
  std::__shared_weak_count *v66;
  float **v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  size_t v77;
  size_t v78;
  __int128 *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t *v84;
  _BYTE *v85;
  _BYTE *v86;
  int64_t v87;
  uint64_t (**v88)();
  unint64_t *v89;
  unint64_t *v90;
  unint64_t v91;
  const void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  CGImageRef v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  float v106;
  double v107;
  const char *v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  IHKHarmonizationResult *v112;
  double v113;
  const char *v114;
  uint64_t v115;
  void *shouldHarmonize;
  uint64_t v118;
  const char *v119;
  const char *v120;
  __int128 __dst;
  __int128 v122;
  int v123;
  _QWORD v124[5];
  CGImageRef imageOut;
  __int128 v126;
  char *v127;
  uint64_t (**v128)();
  uint64_t (**v129)();
  void *v130;
  std::__shared_weak_count *v131;
  std::__shared_weak_count *v132;
  void *v133[2];
  char v134;
  uint64_t (**v135)();
  void *__p;
  void *v137;
  std::__shared_weak_count *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = objc_msgSend_fg(v4, v5, v6, v7, v8);
  v13 = (__CVBuffer *)objc_msgSend_convertCGImageToBGRA_sRGB_PixelBuffer_(IHKImageUtils, v10, v9, v11, v12);
  v18 = objc_msgSend_bg(v4, v14, v15, v16, v17);
  v22 = (__CVBuffer *)objc_msgSend_convertCGImageToBGRA_sRGB_PixelBuffer_(IHKImageUtils, v19, v18, v20, v21);
  imageOut = 0;
  VTCreateCGImageFromCVPixelBuffer(v13, 0, &imageOut);
  objc_msgSend_lock(self->_lock, v23, v24, v25, v26);
  objc_msgSend_rescaleCVPixelBuffers_dest_(IHKImageUtils, v27, (uint64_t)v13, *((_QWORD *)self->_fgInput.storage_.__ptr_ + 1), v28);
  objc_msgSend_rescaleCVPixelBuffers_dest_(IHKImageUtils, v29, (uint64_t)v22, *((_QWORD *)self->_bgInput.storage_.__ptr_ + 1), v30);
  CVPixelBufferRelease(v13);
  CVPixelBufferRelease(v22);
  value = self->_net.__ptr_.__value_;
  v120 = (const char *)objc_msgSend_UTF8String(self->_fgName, v32, v33, v34, v35);
  sub_23ECC40B0((uint64_t)&v126, &v120, (uint64_t)&self->_fgInput);
  v119 = (const char *)objc_msgSend_UTF8String(self->_bgName, v36, v37, v38, v39);
  sub_23ECC40B0((uint64_t)v133, &v119, (uint64_t)&self->_bgInput);
  __dst = 0u;
  v122 = 0u;
  v123 = 1065353216;
  sub_23ECB982C((uint64_t)&__dst, (uint64_t)&v126, &v126);
  sub_23ECB982C((uint64_t)&__dst, (uint64_t)v133, (__int128 *)v133);
  sub_23ECC3A54((uint64_t)value, (uint64_t)&__dst, (uint64_t)v124);
  sub_23ECB8F84((uint64_t)&__dst);
  v135 = &off_250F5D430;
  v44 = v138;
  if (v138)
  {
    p_shared_owners = (unint64_t *)&v138->__shared_owners_;
    do
      v46 = __ldaxr(p_shared_owners);
    while (__stlxr(v46 - 1, p_shared_owners));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (__p)
  {
    v137 = __p;
    operator delete(__p);
  }
  if (v134 < 0)
    operator delete(v133[0]);
  v128 = &off_250F5D430;
  v47 = v132;
  if (v132)
  {
    v48 = (unint64_t *)&v132->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  if (v130)
  {
    v131 = (std::__shared_weak_count *)v130;
    operator delete(v130);
  }
  if ((SHIBYTE(v127) & 0x80000000) == 0)
  {
    gatingOutName = self->_gatingOutName;
    if (gatingOutName)
      goto LABEL_19;
LABEL_24:
    v55 = 1;
    v56 = 1.0;
    goto LABEL_45;
  }
  operator delete((void *)v126);
  gatingOutName = self->_gatingOutName;
  if (!gatingOutName)
    goto LABEL_24;
LABEL_19:
  v51 = (const char *)objc_msgSend_UTF8String(gatingOutName, v40, v41, v42, v43);
  v52 = strlen(v51);
  if (v52 > 0x7FFFFFFFFFFFFFF7)
    sub_23ECB1D38();
  v53 = v52;
  if (v52 >= 0x17)
  {
    v57 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v52 | 7) != 0x17)
      v57 = v52 | 7;
    v58 = v57 + 1;
    p_dst = (__int128 *)operator new(v57 + 1);
    *((_QWORD *)&__dst + 1) = v53;
    *(_QWORD *)&v122 = v58 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    BYTE7(v122) = v52;
    p_dst = &__dst;
    if (!v52)
      goto LABEL_29;
  }
  memmove(p_dst, v51, v53);
LABEL_29:
  *((_BYTE *)p_dst + v53) = 0;
  v59 = sub_23ECB70A4(v124, (uint64_t)&__dst);
  v60 = v59;
  if (!v59)
    sub_23ECB7054("unordered_map::at: key not found");
  *(_QWORD *)&v126 = &off_250F5D430;
  DWORD2(v126) = *((_DWORD *)v59 + 12);
  v128 = 0;
  v129 = 0;
  v127 = 0;
  v62 = (_BYTE *)v59[7];
  v61 = (_BYTE *)v59[8];
  v63 = v61 - v62;
  if (v61 != v62)
  {
    if (v63 < 0)
      sub_23ECB1668();
    v64 = (char *)operator new(v61 - v62);
    v65 = (uint64_t (**)())&v64[8 * (v63 >> 3)];
    v127 = v64;
    v129 = v65;
    memcpy(v64, v62, v63);
    v128 = v65;
  }
  v67 = (float **)v60[10];
  v66 = (std::__shared_weak_count *)v60[11];
  v130 = v67;
  v131 = v66;
  if (v66)
  {
    v68 = (unint64_t *)&v66->__shared_owners_;
    do
      v69 = __ldxr(v68);
    while (__stxr(v69 + 1, v68));
  }
  if (SBYTE7(v122) < 0)
    operator delete((void *)__dst);
  v56 = *v67[1];
  v55 = v56 > self->_gatingThreshold;
  *(_QWORD *)&v126 = &off_250F5D430;
  if (v66)
  {
    v70 = (unint64_t *)&v66->__shared_owners_;
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
  if (v127)
    operator delete(v127);
LABEL_45:
  if (!(objc_msgSend_forceHarmonization(v4, v40, v41, v42, v43) | v55))
  {
    objc_msgSend_unlock(self->_lock, v72, v73, v74, v75);
    v80 = 0;
    goto LABEL_71;
  }
  v76 = (const char *)objc_msgSend_UTF8String(self->_outName, v72, v73, v74, v75);
  v77 = strlen(v76);
  if (v77 > 0x7FFFFFFFFFFFFFF7)
    sub_23ECB1D38();
  v78 = v77;
  if (v77 >= 0x17)
  {
    v81 = (v77 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v77 | 7) != 0x17)
      v81 = v77 | 7;
    v82 = v81 + 1;
    v79 = (__int128 *)operator new(v81 + 1);
    *((_QWORD *)&__dst + 1) = v78;
    *(_QWORD *)&v122 = v82 | 0x8000000000000000;
    *(_QWORD *)&__dst = v79;
  }
  else
  {
    BYTE7(v122) = v77;
    v79 = &__dst;
    if (!v77)
      goto LABEL_55;
  }
  memmove(v79, v76, v78);
LABEL_55:
  *((_BYTE *)v79 + v78) = 0;
  v83 = sub_23ECB70A4(v124, (uint64_t)&__dst);
  v84 = v83;
  if (!v83)
    sub_23ECB7054("unordered_map::at: key not found");
  *(_QWORD *)&v126 = &off_250F5D430;
  DWORD2(v126) = *((_DWORD *)v83 + 12);
  v128 = 0;
  v129 = 0;
  v127 = 0;
  v86 = (_BYTE *)v83[7];
  v85 = (_BYTE *)v83[8];
  v87 = v85 - v86;
  if (v85 != v86)
  {
    if (v87 < 0)
      sub_23ECB1668();
    v127 = (char *)operator new(v85 - v86);
    v128 = (uint64_t (**)())v127;
    v88 = (uint64_t (**)())&v127[8 * (v87 >> 3)];
    v129 = v88;
    memcpy(v127, v86, v87);
    v128 = v88;
  }
  v89 = (unint64_t *)v84[11];
  v130 = (void *)v84[10];
  v131 = (std::__shared_weak_count *)v89;
  if (v89)
  {
    v90 = v89 + 1;
    do
      v91 = __ldxr(v90);
    while (__stxr(v91 + 1, v90));
  }
  *(_QWORD *)&v126 = &off_250F5D3E8;
  if (SBYTE7(v122) < 0)
    operator delete((void *)__dst);
  v92 = (const void *)*((_QWORD *)v130 + 1);
  v93 = *((_QWORD *)v130 + 11);
  v94 = *((_QWORD *)v130 + 12);
  v95 = 4 * v93 * *((_QWORD *)v130 + 13) * *((_QWORD *)v130 + 14);
  v96 = malloc_type_malloc(v95 * v94, 0xF7FFCDC5uLL);
  memcpy(v96, v92, v95 * v94);
  objc_msgSend_unlock(self->_lock, v97, v98, v99, v100);
  v101 = imageOut;
  objc_msgSend_harmonizationStrength(v4, v102, v103, v104, v105, v96, v94, v93, v95);
  *(float *)&v107 = v106 * self->_baseHarmonizationStrength;
  v80 = objc_msgSend_autoApplyGridBufferWithGridBuffer_image_assume_BGRA_sRGB_gridStrength_(_TtC21ImageHarmonizationKit21IHKBilateralGridUtils, v108, (uint64_t)&v118, (uint64_t)v101, 1, v107);
  free(v96);
  *(_QWORD *)&v126 = &off_250F5D430;
  v109 = v131;
  if (v131)
  {
    v110 = (unint64_t *)&v131->__shared_owners_;
    do
      v111 = __ldaxr(v110);
    while (__stlxr(v111 - 1, v110));
    if (!v111)
    {
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
    }
  }
  if (v127)
  {
    v128 = (uint64_t (**)())v127;
    operator delete(v127);
  }
LABEL_71:
  CGImageRelease(imageOut);
  v112 = [IHKHarmonizationResult alloc];
  *(float *)&v113 = v56;
  shouldHarmonize = (void *)objc_msgSend_initWithHarmonized_gatingScore_shouldHarmonize_(v112, v114, v80, v55, v115, v113);
  sub_23ECB8F84((uint64_t)v124);

  return shouldHarmonize;
}

- (NSString)networkPath
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (unsigned)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;
  __shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  EspressoNet *value;

  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_gatingOutName, 0);
  objc_storeStrong((id *)&self->_outName, 0);
  objc_storeStrong((id *)&self->_bgName, 0);
  objc_storeStrong((id *)&self->_fgName, 0);
  self->_bgInput._vptr$Tensor = (void **)&off_250F5D430;
  cntrl = self->_bgInput.storage_.__cntrl_;
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
      begin = self->_bgInput.shape_.sizes_.__begin_;
      if (!begin)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  begin = self->_bgInput.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_bgInput.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_7:
  self->_fgInput._vptr$Tensor = (void **)&off_250F5D430;
  v7 = self->_fgInput.storage_.__cntrl_;
  if (!v7)
    goto LABEL_11;
  v8 = (unint64_t *)((char *)v7 + 8);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (v9)
  {
LABEL_11:
    v10 = self->_fgInput.shape_.sizes_.__begin_;
    if (!v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v7 + 16))(v7);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  v10 = self->_fgInput.shape_.sizes_.__begin_;
  if (v10)
  {
LABEL_12:
    self->_fgInput.shape_.sizes_.__end_ = v10;
    operator delete(v10);
  }
LABEL_13:
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 4;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = &off_250F5D560;
  *((_DWORD *)self + 20) = 4;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = &off_250F5D560;
  return self;
}

@end
