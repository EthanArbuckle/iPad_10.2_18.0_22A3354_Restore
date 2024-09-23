@implementation CSUImageCaptioningEncoder

- (CSUImageCaptioningEncoder)initWithConfiguration:(id)a3
{
  id v5;
  CSUImageCaptioningEncoder *v6;
  CSUImageCaptioningEncoder *v7;
  CSUImageCaptioningEncoder *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUImageCaptioningEncoder;
  v6 = -[CSUImageCaptioningEncoder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  size_t v13;
  __int128 *p_dst;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  EspressoNet *value;
  void **v24;
  void *v25;
  void **v26;
  void **v27;
  void *v28;
  void **v29;
  void *v31;
  void **v32;
  uint64_t v33;
  int v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  void *v43[2];
  void *v44[2];
  int v45;
  void *__p;
  char v47;
  __int128 __dst;
  unint64_t v49;

  if (self->_net.__ptr_.__value_)
    return 1;
  objc_msgSend_encoderNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
  v12 = strlen(v11);
  if (v12 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v13 = v12;
  if (v12 >= 0x17)
  {
    v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v15 = v12 | 7;
    v16 = v15 + 1;
    p_dst = (__int128 *)operator new(v15 + 1);
    *((_QWORD *)&__dst + 1) = v13;
    v49 = v16 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v49) = v12;
    p_dst = &__dst;
    if (!v12)
      goto LABEL_10;
  }
  memmove(p_dst, v11, v13);
LABEL_10:
  *((_BYTE *)p_dst + v13) = 0;

  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = objc_msgSend_espressoExecutionEngine(self->_configuration, v17, v18, v19, v20);
  v35 = 1;
  v36 = 0;
  v37 = 0;
  v38 = 0xFFFFFFFFLL;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  *(_OWORD *)v43 = 0u;
  *(_OWORD *)v44 = 0u;
  v45 = 1065353216;
  v47 = 0;
  LOBYTE(__p) = 0;
  v21 = operator new();
  *(_QWORD *)v21 = &off_250B0DB68;
  v22 = operator new(0x128uLL);
  v22[1] = 0;
  v22[2] = 0;
  *v22 = &off_250B0DDF0;
  *(_QWORD *)(v21 + 8) = sub_239FF6D14((uint64_t)(v22 + 3), &__dst, (uint64_t)&v31);
  *(_QWORD *)(v21 + 16) = v22;
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = (EspressoNet *)v21;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
  if (v47 < 0)
    operator delete(__p);
  v24 = (void **)v44[0];
  if (v44[0])
  {
    do
    {
      v29 = (void **)*v24;
      if (*((char *)v24 + 39) < 0)
        operator delete(v24[2]);
      operator delete(v24);
      v24 = v29;
    }
    while (v29);
  }
  v25 = v43[0];
  v43[0] = 0;
  if (v25)
    operator delete(v25);
  v26 = (void **)v31;
  if (v31)
  {
    v27 = v32;
    v28 = v31;
    if (v32 != v31)
    {
      do
      {
        if (*((char *)v27 - 1) < 0)
          operator delete(*(v27 - 3));
        v27 -= 3;
      }
      while (v27 != v26);
      v28 = v31;
    }
    v32 = v26;
    operator delete(v28);
  }
  if (SHIBYTE(v49) < 0)
    operator delete((void *)__dst);
  return 1;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  VTPixelTransferSessionRef **value;
  PixelBufferTransfer *v9;
  CFTypeRef *v10;
  uint64_t v11;

  value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
  if (!value)
  {
    value = (VTPixelTransferSessionRef **)operator new();
    sub_239FF7DAC(value);
    v9 = self->_transferSession.__ptr_.__value_;
    self->_transferSession.__ptr_.__value_ = (PixelBufferTransfer *)value;
    if (v9)
    {
      v10 = *(CFTypeRef **)v9;
      *(_QWORD *)v9 = 0;
      if (v10)
      {
        if (*v10)
          CFRelease(*v10);
        MEMORY[0x23B83FE88](v10, 0x20C4093837F09);
      }
      MEMORY[0x23B83FE88](v9, 0x20C4093837F09);
      value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
    }
  }
  v11 = VTPixelTransferSessionTransferImage(**value, a3, a4);
  sub_23A020934(v11, "Image Transfer");
  return 1;
}

- (id)computeEncodedCaptioningFeaturesForImage:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EspressoNet *value;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54[2];
  void *v55;
  void *v56;
  std::__shared_weak_count *v57;
  const char *v58;
  _OWORD v59[2];
  int v60;
  _QWORD v61[5];
  uint8_t buf[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend_loadResources_(self, a2, (uint64_t)a4, (uint64_t)a4, v4))
  {
LABEL_26:
    v37 = 0;
    return v37;
  }
  if (!a3)
  {
    sub_23A016E78();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239FE9000, v36, OS_LOG_TYPE_INFO, "Input image to computeEncodedCaptioningFeaturesForImage is null", buf, 2u);
    }

    goto LABEL_26;
  }
  value = self->_net.__ptr_.__value_;
  objc_msgSend_inputImageTensorName(self->_configuration, v7, v8, v9, v10);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v58 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  sub_239FF5760((uint64_t)v54, a3);
  sub_239FF6364((uint64_t)buf, &v58, (uint64_t)v54);
  memset(v59, 0, sizeof(v59));
  v60 = 1065353216;
  sub_239FF6528((uint64_t)v59, (uint64_t)buf, (__int128 *)buf);
  sub_239FF1424((uint64_t)value, (uint64_t)v59, (uint64_t)v61);
  sub_239FF5234((uint64_t)v59);
  *((_QWORD *)&v63 + 1) = &off_250B0DCE8;
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
  if (*((_QWORD *)&v66 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v66 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (*((_QWORD *)&v64 + 1))
  {
    *(_QWORD *)&v65 = *((_QWORD *)&v64 + 1);
    operator delete(*((void **)&v64 + 1));
  }
  if (SBYTE7(v63) < 0)
    operator delete(*(void **)buf);
  v54[0] = &off_250B0DCE8;
  v20 = v57;
  if (v57)
  {
    p_shared_owners = (unint64_t *)&v57->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }

  objc_msgSend_imageEmbeddingTensorName(self->_configuration, v23, v24, v25, v26);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
  v33 = strlen(v32);
  if (v33 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v34 = (void *)v33;
  if (v33 >= 0x17)
  {
    v39 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17)
      v39 = v33 | 7;
    v40 = v39 + 1;
    v35 = operator new(v39 + 1);
    v54[1] = v34;
    v55 = (void *)(v40 | 0x8000000000000000);
    v54[0] = v35;
  }
  else
  {
    HIBYTE(v55) = v33;
    v35 = v54;
    if (!v33)
      goto LABEL_32;
  }
  memmove(v35, v32, (size_t)v34);
LABEL_32:
  *((_BYTE *)v34 + (_QWORD)v35) = 0;
  v41 = sub_239FF2E64(v61, (uint64_t)v54);
  if (!v41)
    sub_239FF1D10("unordered_map::at: key not found");
  v45 = v41[10];
  v46 = *(_OWORD *)(v45 + 40);
  v47 = *(_OWORD *)(v45 + 24);
  *(_OWORD *)buf = *(_OWORD *)(v45 + 8);
  v63 = v47;
  v64 = v46;
  v48 = *(_OWORD *)(v45 + 88);
  v49 = *(_OWORD *)(v45 + 104);
  v50 = *(_OWORD *)(v45 + 72);
  v65 = *(_OWORD *)(v45 + 56);
  v66 = v50;
  v51 = *(_OWORD *)(v45 + 120);
  v52 = *(_OWORD *)(v45 + 136);
  v53 = *(_OWORD *)(v45 + 152);
  v72 = *(_QWORD *)(v45 + 168);
  v70 = v52;
  v71 = v53;
  v68 = v49;
  v69 = v51;
  v67 = v48;
  objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v42, (uint64_t)buf, v43, v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v55) < 0)
    operator delete(v54[0]);

  sub_239FF5234((uint64_t)v61);
  return v37;
}

- (CSUImageCaptioningEncoderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  PixelBufferTransfer *value;
  CFTypeRef *v4;
  EspressoNet *v5;

  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_transferSession.__ptr_.__value_;
  self->_transferSession.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(CFTypeRef **)value;
    *(_QWORD *)value = 0;
    if (v4)
    {
      if (*v4)
        CFRelease(*v4);
      MEMORY[0x23B83FE88](v4, 0x20C4093837F09);
    }
    MEMORY[0x23B83FE88](value, 0x20C4093837F09);
  }
  v5 = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
