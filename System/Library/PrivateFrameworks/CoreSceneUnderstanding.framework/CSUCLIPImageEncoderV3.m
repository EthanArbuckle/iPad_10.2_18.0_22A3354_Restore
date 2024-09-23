@implementation CSUCLIPImageEncoderV3

- (CSUCLIPImageEncoderV3)initWithConfiguration:(id)a3
{
  id v5;
  CSUCLIPImageEncoderV3 *v6;
  CSUCLIPImageEncoderV3 *v7;
  CSUCLIPImageEncoderV3 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUCLIPImageEncoderV3;
  v6 = -[CSUCLIPImageEncoderV3 init](&v10, sel_init);
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  EspressoNet *v15;
  EspressoNet *value;
  EspressoNet *v17;
  void **v18;
  void *v19;
  void **v20;
  void **v21;
  void *v22;
  void **v23;
  void *v25;
  void **v26;
  uint64_t v27;
  int v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  void *v37[2];
  void *v38[2];
  int v39;
  void *__p;
  char v41;
  const char *v42;
  EspressoNet *v43;

  if (!self->_net.__ptr_.__value_)
  {
    objc_msgSend_espressoNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = objc_msgSend_espressoExecutionEngine(self->_configuration, v11, v12, v13, v14);
    v29 = 1;
    v30 = 0;
    v31 = 0;
    v32 = 0xFFFFFFFFLL;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    *(_OWORD *)v37 = 0u;
    *(_OWORD *)v38 = 0u;
    v39 = 1065353216;
    v41 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v42, (uint64_t)&v25, &v43);
    v15 = v43;
    v43 = 0;
    value = self->_net.__ptr_.__value_;
    self->_net.__ptr_.__value_ = v15;
    if (value)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
      v17 = v43;
      v43 = 0;
      if (v17)
        (*(void (**)(EspressoNet *))(*(_QWORD *)v17 + 8))(v17);
    }
    if (v41 < 0)
      operator delete(__p);
    v18 = (void **)v38[0];
    if (v38[0])
    {
      do
      {
        v23 = (void **)*v18;
        if (*((char *)v18 + 39) < 0)
          operator delete(v18[2]);
        operator delete(v18);
        v18 = v23;
      }
      while (v23);
    }
    v19 = v37[0];
    v37[0] = 0;
    if (v19)
      operator delete(v19);
    v20 = (void **)v25;
    if (v25)
    {
      v21 = v26;
      v22 = v25;
      if (v26 != v25)
      {
        do
        {
          if (*((char *)v21 - 1) < 0)
            operator delete(*(v21 - 3));
          v21 -= 3;
        }
        while (v21 != v20);
        v22 = v25;
      }
      v26 = v20;
      operator delete(v22);
    }

  }
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
  sub_23A02CCAC(v11, "Image Transfer");
  return 1;
}

- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend__unsafeRunOnInputImage_completion_(self, v7, (uint64_t)a3, (uint64_t)v6, v8);

}

- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char Resources;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  EspressoNet *value;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  CSUCLIPImageEncoderV3NetworkOutput *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  size_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  size_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78[2];
  void *v79;
  void *v80;
  std::__shared_weak_count *v81;
  const char *v82;
  _OWORD v83[2];
  int v84;
  _QWORD v85[5];
  id v86;
  void *__dst[2];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, id))a4;
  v86 = 0;
  Resources = objc_msgSend_loadResources_(self, v7, (uint64_t)&v86, v8, v9);
  v15 = v86;
  if ((Resources & 1) != 0)
  {
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v82 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_239FF5760((uint64_t)v78, a3);
    sub_239FF6364((uint64_t)__dst, &v82, (uint64_t)v78);
    memset(v83, 0, sizeof(v83));
    v84 = 1065353216;
    sub_239FF6528((uint64_t)v83, (uint64_t)__dst, (__int128 *)__dst);
    sub_239FF1424((uint64_t)value, (uint64_t)v83, (uint64_t)v85);
    sub_239FF5234((uint64_t)v83);
    *((_QWORD *)&v88 + 1) = &off_250B0DCE8;
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
    if (*((_QWORD *)&v91 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (*((_QWORD *)&v89 + 1))
    {
      *(_QWORD *)&v90 = *((_QWORD *)&v89 + 1);
      operator delete(*((void **)&v89 + 1));
    }
    if (SBYTE7(v88) < 0)
      operator delete(__dst[0]);
    v78[0] = &off_250B0DCE8;
    v25 = v81;
    if (v81)
    {
      p_shared_owners = (unint64_t *)&v81->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    if (v79)
    {
      v80 = v79;
      operator delete(v79);
    }

    v28 = [CSUCLIPImageEncoderV3NetworkOutput alloc];
    objc_msgSend_imageEmbeddingTensorName(self->_configuration, v29, v30, v31, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      goto LABEL_35;
    v35 = objc_retainAutorelease(v33);
    v40 = (const char *)objc_msgSend_UTF8String(v35, v36, v37, v38, v39);
    v41 = strlen(v40);
    if (v41 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v42 = (void *)v41;
    if (v41 >= 0x17)
    {
      v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v41 | 7) != 0x17)
        v44 = v41 | 7;
      v45 = v44 + 1;
      v43 = operator new(v44 + 1);
      __dst[1] = v42;
      *(_QWORD *)&v88 = v45 | 0x8000000000000000;
      __dst[0] = v43;
    }
    else
    {
      BYTE7(v88) = v41;
      v43 = __dst;
      if (!v41)
      {
LABEL_28:
        *((_BYTE *)v42 + (_QWORD)v43) = 0;
        v46 = sub_239FF2E64(v85, (uint64_t)__dst);
        v47 = v46;
        if (SBYTE7(v88) < 0)
        {
          operator delete(__dst[0]);
          if (v47)
          {
LABEL_30:
            v48 = objc_retainAutorelease(v35);
            v53 = (const char *)objc_msgSend_UTF8String(v48, v49, v50, v51, v52);
            v54 = strlen(v53);
            if (v54 > 0x7FFFFFFFFFFFFFF7)
              sub_239FEBDE0();
            v55 = (void *)v54;
            if (v54 >= 0x17)
            {
              v58 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v54 | 7) != 0x17)
                v58 = v54 | 7;
              v59 = v58 + 1;
              v56 = operator new(v58 + 1);
              v78[1] = v55;
              v79 = (void *)(v59 | 0x8000000000000000);
              v78[0] = v56;
            }
            else
            {
              HIBYTE(v79) = v54;
              v56 = v78;
              if (!v54)
                goto LABEL_40;
            }
            memmove(v56, v53, (size_t)v55);
LABEL_40:
            *((_BYTE *)v55 + (_QWORD)v56) = 0;
            v60 = sub_239FF2E64(v85, (uint64_t)v78);
            if (!v60)
              sub_239FF1D10("unordered_map::at: key not found");
            v64 = v60[10];
            v65 = *(_OWORD *)(v64 + 40);
            v66 = *(_OWORD *)(v64 + 24);
            *(_OWORD *)__dst = *(_OWORD *)(v64 + 8);
            v88 = v66;
            v89 = v65;
            v67 = *(_OWORD *)(v64 + 88);
            v68 = *(_OWORD *)(v64 + 104);
            v69 = *(_OWORD *)(v64 + 72);
            v90 = *(_OWORD *)(v64 + 56);
            v91 = v69;
            v70 = *(_OWORD *)(v64 + 120);
            v71 = *(_OWORD *)(v64 + 136);
            v72 = *(_OWORD *)(v64 + 152);
            v97 = *(_QWORD *)(v64 + 168);
            v95 = v71;
            v96 = v72;
            v93 = v68;
            v94 = v70;
            v92 = v67;
            objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v61, (uint64_t)__dst, v62, v63);
            v73 = objc_claimAutoreleasedReturnValue();
            if (SHIBYTE(v79) < 0)
              operator delete(v78[0]);
            v57 = (void *)v73;
            goto LABEL_44;
          }
        }
        else if (v46)
        {
          goto LABEL_30;
        }
LABEL_35:
        v57 = 0;
LABEL_44:

        v77 = (void *)objc_msgSend_initWithImageEmbedding_(v28, v74, (uint64_t)v57, v75, v76);
        v6[2](v6, v77, v15);

        sub_239FF5234((uint64_t)v85);
        goto LABEL_45;
      }
    }
    memmove(v43, v40, (size_t)v42);
    goto LABEL_28;
  }
  v6[2](v6, 0, v15);
LABEL_45:

}

- (CSUCLIPImageEncoderV3Configuration)configuration
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
