@implementation CSUDetectionPrintNetwork

- (CSUDetectionPrintNetwork)initWithConfiguration:(id)a3
{
  id v5;
  CSUDetectionPrintNetwork *v6;
  CSUDetectionPrintNetwork *v7;
  CSUDetectionPrintNetwork *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUDetectionPrintNetwork;
  v6 = -[CSUDetectionPrintNetwork init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResourcesAndReturnError:(id *)a3
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
  sub_23A0110D8(v11, "Image Transfer");
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
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char ResourcesAndReturnError;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  size_t v57;
  void *v58;
  void **v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  CSUDetectionPrintNetworkOutput *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void (**v86)(id, void *, _QWORD);
  id obj;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  void *__dst[2];
  void *v93;
  void *v94;
  std::__shared_weak_count *v95;
  const char *v96;
  _OWORD v97[2];
  int v98;
  _QWORD v99[5];
  id v100;
  _BYTE v101[128];
  void *v102[2];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v86 = (void (**)(id, void *, _QWORD))a4;
  v100 = 0;
  ResourcesAndReturnError = objc_msgSend_loadResourcesAndReturnError_(self, v6, (uint64_t)&v100, v7, v8);
  v10 = v100;
  v15 = v10;
  if ((ResourcesAndReturnError & 1) != 0)
  {
    v84 = v10;
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v96 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_239FF5760((uint64_t)__dst, a3);
    sub_239FF6364((uint64_t)v102, &v96, (uint64_t)__dst);
    memset(v97, 0, sizeof(v97));
    v98 = 1065353216;
    sub_239FF6528((uint64_t)v97, (uint64_t)v102, (__int128 *)v102);
    sub_239FF1424((uint64_t)value, (uint64_t)v97, (uint64_t)v99);
    sub_239FF5234((uint64_t)v97);
    *((_QWORD *)&v103 + 1) = &off_250B0DCE8;
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v106 + 1);
    if (*((_QWORD *)&v106 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v106 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (*((_QWORD *)&v104 + 1))
    {
      *(_QWORD *)&v105 = *((_QWORD *)&v104 + 1);
      operator delete(*((void **)&v104 + 1));
    }
    if (SBYTE7(v103) < 0)
      operator delete(v102[0]);
    __dst[0] = &off_250B0DCE8;
    v25 = v95;
    if (v95)
    {
      p_shared_owners = (unint64_t *)&v95->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    if (v93)
    {
      v94 = v93;
      operator delete(v93);
    }

    objc_msgSend_outputTapPointFeatures(self->_configuration, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v32, v33, v34, v35, v36);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend_count(v85, v37, v38, v39, v40);
    v42 = objc_alloc(MEMORY[0x24BDBCED8]);
    v46 = (void *)objc_msgSend_initWithCapacity_(v42, v43, v41, v44, v45);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v85;
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v88, (uint64_t)v101, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v89 != v49)
            objc_enumerationMutation(obj);
          v51 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i));
          v56 = (const char *)objc_msgSend_UTF8String(v51, v52, v53, v54, v55);
          v57 = strlen(v56);
          if (v57 >= 0x7FFFFFFFFFFFFFF8)
            sub_239FEBDE0();
          v58 = (void *)v57;
          if (v57 >= 0x17)
          {
            v60 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v57 | 7) != 0x17)
              v60 = v57 | 7;
            v61 = v60 + 1;
            v59 = (void **)operator new(v60 + 1);
            __dst[1] = v58;
            v93 = (void *)(v61 | 0x8000000000000000);
            __dst[0] = v59;
LABEL_30:
            memmove(v59, v56, (size_t)v58);
            goto LABEL_31;
          }
          HIBYTE(v93) = v57;
          v59 = __dst;
          if (v57)
            goto LABEL_30;
LABEL_31:
          *((_BYTE *)v58 + (_QWORD)v59) = 0;
          v62 = sub_239FF2E64(v99, (uint64_t)__dst);
          if (!v62)
            sub_239FF1D10("unordered_map::at: key not found");
          v66 = v62[10];
          v67 = *(_OWORD *)(v66 + 40);
          v68 = *(_OWORD *)(v66 + 24);
          *(_OWORD *)v102 = *(_OWORD *)(v66 + 8);
          v103 = v68;
          v104 = v67;
          v69 = *(_OWORD *)(v66 + 88);
          v70 = *(_OWORD *)(v66 + 104);
          v71 = *(_OWORD *)(v66 + 72);
          v105 = *(_OWORD *)(v66 + 56);
          v106 = v71;
          v72 = *(_OWORD *)(v66 + 120);
          v73 = *(_OWORD *)(v66 + 136);
          v74 = *(_OWORD *)(v66 + 152);
          v112 = *(_QWORD *)(v66 + 168);
          v110 = v73;
          v111 = v74;
          v108 = v70;
          v109 = v72;
          v107 = v69;
          objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v63, (uint64_t)v102, v64, v65);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (SHIBYTE(v93) < 0)
            operator delete(__dst[0]);

          objc_msgSend_setObject_forKeyedSubscript_(v46, v76, (uint64_t)v75, (uint64_t)v51, v77);
        }
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v88, (uint64_t)v101, 16);
      }
      while (v48);
    }

    v79 = [CSUDetectionPrintNetworkOutput alloc];
    v83 = (void *)objc_msgSend_initWithDetectionPrintPerTapPoint_(v79, v80, (uint64_t)v46, v81, v82);
    ((void (**)(id, void *, id))v86)[2](v86, v83, v84);

    sub_239FF5234((uint64_t)v99);
    v15 = v84;
  }
  else
  {
    ((void (**)(id, void *, id))v86)[2](v86, 0, v10);
  }

}

- (CSUDetectionPrintNetworkConfiguration)configuration
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
