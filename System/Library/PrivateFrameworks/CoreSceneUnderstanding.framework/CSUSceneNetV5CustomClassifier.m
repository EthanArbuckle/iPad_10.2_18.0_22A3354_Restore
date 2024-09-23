@implementation CSUSceneNetV5CustomClassifier

- (CSUSceneNetV5CustomClassifier)initWithConfiguration:(id)a3
{
  id v5;
  CSUSceneNetV5CustomClassifier *v6;
  CSUSceneNetV5CustomClassifier *v7;
  CSUSceneNetV5CustomClassifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUSceneNetV5CustomClassifier;
  v6 = -[CSUSceneNetV5CustomClassifier init](&v10, sel_init);
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
  BOOL v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  EspressoNet *v17;
  EspressoNet *value;
  EspressoNet *v19;
  void **v20;
  void *v21;
  void **v22;
  void **v23;
  void *v24;
  void **v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  const char *v48;
  EspressoNet *v49;

  if (self->_net.__ptr_.__value_)
    return 1;
  objc_msgSend_espressoNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v48 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11, v12);
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = objc_msgSend_espressoExecutionEngine(self->_configuration, v13, v14, v15, v16);
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
  sub_239FEE07C(&v48, (uint64_t)&v31, &v49);
  v17 = v49;
  v49 = 0;
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = v17;
  if (value)
  {
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
    v19 = v49;
    v49 = 0;
    if (v19)
      (*(void (**)(EspressoNet *))(*(_QWORD *)v19 + 8))(v19);
  }
  if (v47 < 0)
    operator delete(__p);
  v20 = (void **)v44[0];
  if (v44[0])
  {
    do
    {
      v25 = (void **)*v20;
      if (*((char *)v20 + 39) < 0)
        operator delete(v20[2]);
      operator delete(v20);
      v20 = v25;
    }
    while (v25);
  }
  v21 = v43[0];
  v43[0] = 0;
  if (v21)
    operator delete(v21);
  v22 = (void **)v31;
  if (v31)
  {
    v23 = v32;
    v24 = v31;
    if (v32 != v31)
    {
      do
      {
        if (*((char *)v23 - 1) < 0)
          operator delete(*(v23 - 3));
        v23 -= 3;
      }
      while (v23 != v22);
      v24 = v31;
    }
    v32 = v22;
    operator delete(v24);
  }

  objc_msgSend_taxonomyWithError_(self->_configuration, v26, (uint64_t)a3, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29 != 0;

  return v5;
}

- (void)runOnInputScenePrint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend_unsafeRunOnInputScenePrint_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);

}

- (id)allClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23A016470;
  v13[3] = &unk_250B0DF68;
  v14 = v7;
  v8 = v7;
  if (objc_msgSend_enumerateClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)allClassificationLikelihoods:(id)a3
{
  uint64_t v3;

  objc_msgSend_allClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)labelsFromClassificationLikelihoods:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_allClassificationLikelihoods_(self, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  std::runtime_error *exception;

  v8 = a3;
  v9 = a4;
  objc_msgSend_taxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v25 = 0;
    goto LABEL_9;
  }
  objc_msgSend_vocabularyName(self->_configuration, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v24 = (_QWORD *)objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_23A020B0C(v17, v18, v24, v9);
  v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)enumerateLabelsFromClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  ((void (*)(CSUSceneNetV5CustomClassifier *, char *, id, id))MEMORY[0x24BEDD108])(self, sel_enumerateClassificationLikelihoods_usingBlock_, a3, a4);
}

- (void)unsafeRunOnInputScenePrint:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char ResourcesAndReturnError;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  EspressoNet *value;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  CSUSceneNetV5CustomClassifierNetworkOutput *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  size_t v41;
  void *v42;
  void **v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  __int16 v65;
  void *__dst[2];
  void *__p;
  void *v68;
  std::__shared_weak_count *v69;
  const char *v70;
  _OWORD v71[2];
  int v72;
  _QWORD v73[5];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v74 = 0;
  ResourcesAndReturnError = objc_msgSend_loadResourcesAndReturnError_(self, v8, (uint64_t)&v74, v9, v10);
  v16 = v74;
  if ((ResourcesAndReturnError & 1) == 0)
  {
    v7[2](v7, 0, v16);
    goto LABEL_31;
  }
  value = self->_net.__ptr_.__value_;
  v64 = v6;
  objc_msgSend_inputImageTensorName(self->_configuration, v12, v13, v14, v15);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v70 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  v23 = sub_23A016718(v6);
  v65 = 1;
  sub_239FF3910((uint64_t)__dst, v23, &v65);
  sub_23A016D1C((uint64_t)&v75, &v70, (uint64_t)__dst);
  memset(v71, 0, sizeof(v71));
  v72 = 1065353216;
  sub_239FF6528((uint64_t)v71, (uint64_t)&v75, &v75);
  sub_239FF1424((uint64_t)value, (uint64_t)v71, (uint64_t)v73);
  sub_239FF5234((uint64_t)v71);
  *((_QWORD *)&v76 + 1) = &off_250B0DCE8;
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
  if (*((_QWORD *)&v79 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (*((_QWORD *)&v77 + 1))
  {
    *(_QWORD *)&v78 = *((_QWORD *)&v77 + 1);
    operator delete(*((void **)&v77 + 1));
  }
  if (SBYTE7(v76) < 0)
    operator delete((void *)v75);
  __dst[0] = &off_250B0DCE8;
  v27 = v69;
  if (v69)
  {
    p_shared_owners = (unint64_t *)&v69->__shared_owners_;
    do
      v29 = __ldaxr(p_shared_owners);
    while (__stlxr(v29 - 1, p_shared_owners));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (__p)
  {
    v68 = __p;
    operator delete(__p);
  }

  v30 = [CSUSceneNetV5CustomClassifierNetworkOutput alloc];
  objc_msgSend_classificationTensorName(self->_configuration, v31, v32, v33, v34);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = (const char *)objc_msgSend_UTF8String(v35, v36, v37, v38, v39);
  v41 = strlen(v40);
  if (v41 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v42 = (void *)v41;
  if (v41 >= 0x17)
  {
    v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17)
      v44 = v41 | 7;
    v45 = v44 + 1;
    v43 = (void **)operator new(v44 + 1);
    __dst[1] = v42;
    __p = (void *)(v45 | 0x8000000000000000);
    __dst[0] = v43;
  }
  else
  {
    HIBYTE(__p) = v41;
    v43 = __dst;
    if (!v41)
      goto LABEL_27;
  }
  memmove(v43, v40, (size_t)v42);
LABEL_27:
  *((_BYTE *)v42 + (_QWORD)v43) = 0;
  v6 = v64;
  v46 = sub_239FF2E64(v73, (uint64_t)__dst);
  if (!v46)
    sub_239FF1D10("unordered_map::at: key not found");
  v50 = v46[10];
  v51 = *(_OWORD *)(v50 + 40);
  v52 = *(_OWORD *)(v50 + 24);
  v75 = *(_OWORD *)(v50 + 8);
  v76 = v52;
  v77 = v51;
  v53 = *(_OWORD *)(v50 + 88);
  v54 = *(_OWORD *)(v50 + 104);
  v55 = *(_OWORD *)(v50 + 72);
  v78 = *(_OWORD *)(v50 + 56);
  v79 = v55;
  v56 = *(_OWORD *)(v50 + 120);
  v57 = *(_OWORD *)(v50 + 136);
  v58 = *(_OWORD *)(v50 + 152);
  v85 = *(_QWORD *)(v50 + 168);
  v84 = v58;
  v83 = v57;
  v82 = v56;
  v81 = v54;
  v80 = v53;
  objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v47, (uint64_t)&v75, v48, v49);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p) < 0)
    operator delete(__dst[0]);

  v63 = (void *)objc_msgSend_initWithClassificationLikelihoods_(v30, v60, (uint64_t)v59, v61, v62);
  ((void (**)(id, void *, id))v7)[2](v7, v63, v16);

  sub_239FF5234((uint64_t)v73);
LABEL_31:

}

- (CSUSceneNetV5CustomClassifierConfiguration)configuration
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
