@implementation CVNLPCLIPModel

- (CVNLPCLIPModel)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSString *modelName;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  size_t v26;
  size_t v27;
  __int128 *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  size_t v34;
  __int128 *p_dst;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unsigned __int8 v48;
  uint64_t v49;
  unint64_t v50;
  NSObject *v51;
  char *v52;
  CLIPModel *v53;
  __shared_weak_count *cntrl;
  unint64_t *v55;
  unint64_t v56;
  CVNLPCLIPModel *v57;
  void *exception;
  void *v60[2];
  unint64_t v61;
  void *v62[2];
  char v63;
  __int128 v64;
  unint64_t v65;
  void *v66[2];
  uint64_t v67;
  BundleHelper *v68;
  void *v69[2];
  char v70;
  __int128 __dst;
  unint64_t v72;
  void *__p[2];
  uint64_t v74;
  const __CFURL *v75;
  void *v76;
  std::string v77;
  uint8_t buf[8];
  std::string v79;

  v6 = a3;
  v76 = &unk_1E60CCF80;
  memset(&v77, 0, sizeof(v77));
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CVNLPCLIPModelURL, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    modelName = self->_modelName;
    self->_modelName = 0;

    objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CVNLPCLIPModelURL, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      CFRetain(v15);
    sub_1B034AEC8(&v75, v16);

    sub_1B0348B9C(&v75, v66);
    if (v75)
      CFRelease(v75);
    if (SHIBYTE(v67) < 0)
    {
      sub_1B02EB0A8(__p, v66[0], (unint64_t)v66[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v66;
      v74 = v67;
    }
    sub_1B034B450((uint64_t)buf, (uint64_t)__p);
    std::string::operator=(&v77, &v79);
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v79.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v74) & 0x80000000) == 0)
      {
LABEL_16:
        if ((SHIBYTE(v67) & 0x80000000) == 0)
        {
LABEL_17:

          goto LABEL_63;
        }
LABEL_20:
        operator delete(v66[0]);
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v74) & 0x80000000) == 0)
    {
      goto LABEL_16;
    }
    operator delete(__p[0]);
    if ((SHIBYTE(v67) & 0x80000000) == 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)CVNLPCLIPModelName, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_storeStrong((id *)&self->_modelName, CVNLPCLIPModelNameDefaultValue);
    v32 = (const char *)objc_msgSend_UTF8String(self->_modelName, v29, v30, v31);
    v33 = strlen(v32);
    if (v33 > 0x7FFFFFFFFFFFFFF7)
      sub_1B02D78C4();
    v34 = v33;
    if (v33 >= 0x17)
    {
      v39 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v33 | 7) != 0x17)
        v39 = v33 | 7;
      v40 = v39 + 1;
      p_dst = (__int128 *)operator new(v39 + 1);
      *((_QWORD *)&__dst + 1) = v34;
      v72 = v40 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v72) = v33;
      p_dst = &__dst;
      if (!v33)
      {
LABEL_47:
        *((_BYTE *)p_dst + v34) = 0;
        v66[0] = (void *)0x736C65646F4DLL;
        HIBYTE(v67) = 6;
        v68 = objc_alloc_init(BundleHelper);
        sub_1B0348CDC(v62, (uint64_t)v66);
        sub_1B034B450((uint64_t)buf, (uint64_t)v62);
        std::string::operator=(&v77, &v79);
        if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v79.__r_.__value_.__l.__data_);
          if ((v63 & 0x80000000) == 0)
          {
LABEL_49:

            if ((SHIBYTE(v67) & 0x80000000) == 0)
              goto LABEL_50;
            goto LABEL_54;
          }
        }
        else if ((v63 & 0x80000000) == 0)
        {
          goto LABEL_49;
        }
        operator delete(v62[0]);

        if ((SHIBYTE(v67) & 0x80000000) == 0)
        {
LABEL_50:
          if ((SHIBYTE(v72) & 0x80000000) == 0)
          {
LABEL_51:
            *(_OWORD *)v60 = __dst;
            v61 = v72;
LABEL_56:
            sub_1B034911C(buf, (uint64_t)&v76, (uint64_t)v60);
            std::string::operator=(&v77, &v79);
            if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v79.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v61) & 0x80000000) == 0)
              goto LABEL_61;
            v38 = v60[0];
            goto LABEL_60;
          }
LABEL_55:
          sub_1B02EB0A8(v60, (void *)__dst, *((unint64_t *)&__dst + 1));
          goto LABEL_56;
        }
LABEL_54:
        operator delete(v66[0]);
        if ((SHIBYTE(v72) & 0x80000000) == 0)
          goto LABEL_51;
        goto LABEL_55;
      }
    }
    memmove(p_dst, v32, v34);
    goto LABEL_47;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v18, (uint64_t)CVNLPCLIPModelName, v19);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = self->_modelName;
  self->_modelName = v20;

  v25 = (const char *)objc_msgSend_UTF8String(self->_modelName, v22, v23, v24);
  v26 = strlen(v25);
  if (v26 > 0x7FFFFFFFFFFFFFF7)
    sub_1B02D78C4();
  v27 = v26;
  if (v26 >= 0x17)
  {
    v36 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17)
      v36 = v26 | 7;
    v37 = v36 + 1;
    v28 = (__int128 *)operator new(v36 + 1);
    *((_QWORD *)&__dst + 1) = v27;
    v72 = v37 | 0x8000000000000000;
    *(_QWORD *)&__dst = v28;
    goto LABEL_28;
  }
  HIBYTE(v72) = v26;
  v28 = &__dst;
  if (v26)
LABEL_28:
    memmove(v28, v25, v27);
  *((_BYTE *)v28 + v27) = 0;
  v66[0] = (void *)0x736C65646F4DLL;
  HIBYTE(v67) = 6;
  v68 = objc_alloc_init(BundleHelper);
  sub_1B0348CDC(v69, (uint64_t)v66);
  sub_1B034B450((uint64_t)buf, (uint64_t)v69);
  std::string::operator=(&v77, &v79);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v79.__r_.__value_.__l.__data_);
    if ((v70 & 0x80000000) == 0)
    {
LABEL_31:

      if ((SHIBYTE(v67) & 0x80000000) == 0)
        goto LABEL_32;
LABEL_36:
      operator delete(v66[0]);
      if ((SHIBYTE(v72) & 0x80000000) == 0)
        goto LABEL_33;
LABEL_37:
      sub_1B02EB0A8(&v64, (void *)__dst, *((unint64_t *)&__dst + 1));
      goto LABEL_38;
    }
  }
  else if ((v70 & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(v69[0]);

  if (SHIBYTE(v67) < 0)
    goto LABEL_36;
LABEL_32:
  if (SHIBYTE(v72) < 0)
    goto LABEL_37;
LABEL_33:
  v64 = __dst;
  v65 = v72;
LABEL_38:
  sub_1B034911C(buf, (uint64_t)&v76, (uint64_t)&v64);
  std::string::operator=(&v77, &v79);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v79.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v65) & 0x80000000) == 0)
      goto LABEL_61;
  }
  else if ((SHIBYTE(v65) & 0x80000000) == 0)
  {
    goto LABEL_61;
  }
  v38 = (void *)v64;
LABEL_60:
  operator delete(v38);
LABEL_61:
  if (SHIBYTE(v72) < 0)
    operator delete((void *)__dst);
LABEL_63:
  if (!sub_1B03177C0((uint64_t)&v76))
  {
    exception = __cxa_allocate_exception(0x28uLL);
    sub_1B03492EC((uint64_t)exception, (uint64_t)&v76);
    __cxa_throw(exception, (struct type_info *)&unk_1E60CB170, (void (*)(void *))sub_1B0349514);
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v41, (uint64_t)CVNLPCLIPModelEspressoEngine, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v44, (uint64_t)CVNLPCLIPModelEspressoEngine, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0349558(v46, buf);

    v47 = sub_1B0349660((uint64_t)buf);
    v48 = v47;
    v49 = v47 & 0xFFFFFF00;
    v50 = v47 & 0xFFFFFFFF00000000;
    if (v79.__r_.__value_.__s.__data_[15] < 0)
      operator delete(*(void **)buf);
    goto LABEL_76;
  }
  if (qword_1ED537960 == -1)
  {
    if (byte_1ED537958)
    {
LABEL_69:
      v48 = 0;
      v50 = 0;
      v49 = 0;
      goto LABEL_76;
    }
  }
  else
  {
    dispatch_once(&qword_1ED537960, &unk_1E60CDAA8);
    if (byte_1ED537958)
      goto LABEL_69;
  }
  if (qword_1EEEB2D28 != -1)
    dispatch_once(&qword_1EEEB2D28, &unk_1E60CDA48);
  v51 = (id)qword_1EEEB2D18;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B02D2000, v51, OS_LOG_TYPE_DEBUG, "Setting Espresso engine to CPU since ANE is not available and we are investigating issues when running on pre-ANE devices with MPS.", buf, 2u);
  }

  v48 = 0;
  v49 = 0;
  v50 = 0x100000000;
LABEL_76:
  objc_storeStrong((id *)&self->_options, a3);
  v52 = (char *)operator new(0x138uLL);
  *((_QWORD *)v52 + 1) = 0;
  *((_QWORD *)v52 + 2) = 0;
  *(_QWORD *)v52 = &off_1E60CD738;
  sub_1B0317BEC((uint64_t)buf, (uint64_t)&v76);
  v53 = (CLIPModel *)(v52 + 24);
  sub_1B038B4AC((uint64_t)(v52 + 24), (uint64_t)buf, v49 | v48 | v50 & 0xFF00000000);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v79.__r_.__value_.__l.__data_);
    cntrl = self->_model.__cntrl_;
    self->_model.__ptr_ = v53;
    self->_model.__cntrl_ = (__shared_weak_count *)v52;
    if (!cntrl)
      goto LABEL_83;
  }
  else
  {
    cntrl = self->_model.__cntrl_;
    self->_model.__ptr_ = v53;
    self->_model.__cntrl_ = (__shared_weak_count *)v52;
    if (!cntrl)
      goto LABEL_83;
  }
  v55 = (unint64_t *)((char *)cntrl + 8);
  do
    v56 = __ldaxr(v55);
  while (__stlxr(v56 - 1, v55));
  if (!v56)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v57 = self;
    if ((SHIBYTE(v77.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_86;
    goto LABEL_84;
  }
LABEL_83:
  v57 = self;
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
LABEL_84:
    operator delete(v77.__r_.__value_.__l.__data_);
LABEL_86:

  return v57;
}

- (id)encodeImage:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  CVNLPCLIPEmbedding *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  void *v28;
  uint64_t **v29;
  objc_class *v30;
  id v31;
  const char *v32;
  uint64_t **v33;
  objc_class *v34;
  id v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  char v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  CVNLPCLIPEmbedding *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  std::runtime_error *exception;
  void *v67;
  uint64_t v68;
  void *__p;
  void *v70;
  uint64_t ***v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  uint64_t **v74;
  uint64_t ***v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_options(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CVNLPCLIPModelURL, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (qword_1EEEB2D28 != -1)
      dispatch_once(&qword_1EEEB2D28, &unk_1E60CDA48);
    v11 = (id)qword_1EEEB2D18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v67) = 0;
      _os_log_impl(&dword_1B02D2000, v11, OS_LOG_TYPE_DEBUG, "Using user-provided CLIP model to encode image instead of Vision.", (uint8_t *)&v67, 2u);
    }

    objc_msgSend_model(self, v12, v13, v14);
    sub_1B038D0A4(*v74, a3, (uint64_t)&v67);
    v15 = (std::__shared_weak_count *)v75;
    if (v75)
    {
      v16 = (unint64_t *)(v75 + 1);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if ((_DWORD)v68 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v72 + 24))(v72);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v19, v18, (unint64_t)v19 & 0xFFFFFFFFFFFFFFFCLL);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [CVNLPCLIPEmbedding alloc];
    v24 = (void *)objc_msgSend_initWithData_(v21, v22, (uint64_t)v20, v23);

    v67 = &unk_1E60CCA78;
    v25 = v73;
    if (v73)
    {
      p_shared_owners = (unint64_t *)&v73->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
        v28 = __p;
        if (!__p)
          return v24;
        goto LABEL_17;
      }
    }
    v28 = __p;
    if (__p)
    {
LABEL_17:
      v70 = v28;
      operator delete(v28);
    }
  }
  else
  {
    v74 = 0;
    v75 = &v74;
    v76 = 0x2050000000;
    v29 = (uint64_t **)qword_1ED537968;
    v77 = qword_1ED537968;
    if (!qword_1ED537968)
    {
      v67 = (void *)MEMORY[0x1E0C809B0];
      v68 = 3221225472;
      __p = sub_1B034B248;
      v70 = &unk_1E60CDE98;
      v71 = &v74;
      sub_1B034B248((uint64_t)&v67);
      v29 = v75[3];
    }
    v30 = objc_retainAutorelease(v29);
    _Block_object_dispose(&v74, 8);
    v31 = objc_alloc_init(v30);
    if ((objc_msgSend_setRevision_error_(v31, v32, 3737841671, (uint64_t)a4) & 1) != 0)
    {
      v74 = 0;
      v75 = &v74;
      v76 = 0x2050000000;
      v33 = (uint64_t **)qword_1ED537978;
      v77 = qword_1ED537978;
      if (!qword_1ED537978)
      {
        v67 = (void *)MEMORY[0x1E0C809B0];
        v68 = 3221225472;
        __p = sub_1B034B34C;
        v70 = &unk_1E60CDE98;
        v71 = &v74;
        sub_1B034B34C((uint64_t)&v67);
        v33 = v75[3];
      }
      v34 = objc_retainAutorelease(v33);
      _Block_object_dispose(&v74, 8);
      v35 = [v34 alloc];
      v37 = (void *)objc_msgSend_initWithCVPixelBuffer_options_(v35, v36, (uint64_t)a3, MEMORY[0x1E0C9AA70]);
      v78[0] = v31;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v78, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_performRequests_error_(v37, v40, (uint64_t)v39, (uint64_t)a4);

      if ((v41 & 1) != 0)
      {
        objc_msgSend_results(v31, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sceneprints(v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = [CVNLPCLIPEmbedding alloc];
        objc_msgSend_descriptorData(v57, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend_initWithData_(v58, v63, (uint64_t)v62, v64);

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  return v24;
}

- (id)encodeText:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  void *v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  CVNLPCLIPEmbedding *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::runtime_error *exception;
  void *__dst[2];
  unint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  void *v39;
  int v40;
  void *__p;
  void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v5 = a3;
  objc_msgSend_model(self, v6, v7, v8);
  v9 = v37;
  v10 = objc_retainAutorelease(v5);
  v14 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    sub_1B02D78C4();
  v16 = (void *)v15;
  if (v15 >= 0x17)
  {
    v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v18 = v15 | 7;
    v19 = v18 + 1;
    v17 = (void **)operator new(v18 + 1);
    __dst[1] = v16;
    v36 = v19 | 0x8000000000000000;
    __dst[0] = v17;
    goto LABEL_8;
  }
  HIBYTE(v36) = v15;
  v17 = __dst;
  if (v15)
LABEL_8:
    memmove(v17, v14, (size_t)v16);
  *((_BYTE *)v16 + (_QWORD)v17) = 0;
  sub_1B0389BDC(*(_QWORD *)(v9 + 8), (uint64_t)__dst, (uint64_t)&v39);
  if (SHIBYTE(v36) < 0)
    operator delete(__dst[0]);
  v20 = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v40 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v43 + 24))(v43);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v24, v23, (unint64_t)v24 & 0xFFFFFFFFFFFFFFFCLL);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [CVNLPCLIPEmbedding alloc];
  v29 = (void *)objc_msgSend_initWithData_(v26, v27, (uint64_t)v25, v28);

  v39 = &unk_1E60CCA78;
  v30 = v44;
  if (v44)
  {
    v31 = (unint64_t *)&v44->__shared_owners_;
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
    v42 = __p;
    operator delete(__p);
  }

  return v29;
}

- (id)encodeTextAverage:(id)a3 error:(id *)a4
{
  const char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  __int128 *p_dst;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  CVNLPCLIPEmbedding *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void **v45;
  void **v46;
  void *v47;
  std::runtime_error *exception;
  id obj;
  uint64_t v53;
  id v54;
  void *v55;
  char *v56;
  char *v57;
  __int128 __dst;
  unint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  int v65;
  void *__p;
  void *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v56 = 0;
  v57 = 0;
  v55 = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v60, (uint64_t)&v64, 16, a4);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v53 = *(_QWORD *)v61;
    do
    {
      v9 = 0;
      v10 = v6;
      do
      {
        if (*(_QWORD *)v61 != v53)
          objc_enumerationMutation(obj);
        v11 = v5;
        v54 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v9));
        v15 = (const char *)objc_msgSend_UTF8String(v54, v12, v13, v14);
        v16 = strlen(v15);
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          sub_1B02D78C4();
        v17 = v16;
        if (v16 >= 0x17)
        {
          v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v19 = v16 | 7;
          v20 = v19 + 1;
          p_dst = (__int128 *)operator new(v19 + 1);
          *((_QWORD *)&__dst + 1) = v17;
          v59 = v20 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
LABEL_13:
          memmove(p_dst, v15, v17);
          goto LABEL_14;
        }
        HIBYTE(v59) = v16;
        p_dst = &__dst;
        if (v16)
          goto LABEL_13;
LABEL_14:
        *((_BYTE *)p_dst + v17) = 0;

        v5 = v11;
        if (v8 >= v7)
        {
          v22 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v10) >> 3) + 1;
          if (v22 > 0xAAAAAAAAAAAAAAALL)
            sub_1B02D7758();
          if (0x5555555555555556 * ((v7 - v10) >> 3) > v22)
            v22 = 0x5555555555555556 * ((v7 - v10) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v7 - v10) >> 3) >= 0x555555555555555)
            v23 = 0xAAAAAAAAAAAAAAALL;
          else
            v23 = v22;
          if (v23)
          {
            if (v23 > 0xAAAAAAAAAAAAAAALL)
              sub_1B02D72AC();
            v24 = (char *)operator new(24 * v23);
          }
          else
          {
            v24 = 0;
          }
          v6 = &v24[8 * ((v8 - v10) >> 3)];
          *(_OWORD *)v6 = __dst;
          *((_QWORD *)v6 + 2) = v59;
          v7 = &v24[24 * v23];
          v59 = 0;
          __dst = 0uLL;
          v25 = v6 + 24;
          if (v8 == v10)
          {
            v55 = &v24[8 * ((v8 - v10) >> 3)];
            v57 = &v24[24 * v23];
          }
          else
          {
            v26 = v8;
            do
            {
              v27 = *(_OWORD *)(v26 - 24);
              *((_QWORD *)v6 - 1) = *((_QWORD *)v26 - 1);
              *(_OWORD *)(v6 - 24) = v27;
              v6 -= 24;
              *((_QWORD *)v26 - 2) = 0;
              *((_QWORD *)v26 - 1) = 0;
              *((_QWORD *)v26 - 3) = 0;
              v26 -= 24;
            }
            while (v26 != v10);
            v55 = v6;
            v56 = v25;
            v57 = &v24[24 * v23];
            do
            {
              if (*(v8 - 1) < 0)
                operator delete(*((void **)v8 - 3));
              v8 -= 24;
            }
            while (v8 != v10);
          }
          if (v10)
            operator delete(v10);
          v56 = v25;
          if (SHIBYTE(v59) < 0)
            operator delete((void *)__dst);
          v10 = v6;
          v8 = v25;
        }
        else
        {
          v21 = __dst;
          *((_QWORD *)v8 + 2) = v59;
          *(_OWORD *)v8 = v21;
          v8 += 24;
          v56 = v8;
        }

        ++v9;
      }
      while (v9 != v5);
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v60, (uint64_t)&v64, 16);
    }
    while (v5);
  }

  objc_msgSend_model(self, v29, v30, v31);
  sub_1B038D840(v60, &v55, (uint64_t)&v64);
  v32 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
  if (*((_QWORD *)&v60 + 1))
  {
    v33 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v65 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v68 + 24))(v68);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v36, v35, (unint64_t)v36 & 0xFFFFFFFFFFFFFFFCLL);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = [CVNLPCLIPEmbedding alloc];
  v41 = (void *)objc_msgSend_initWithData_(v38, v39, (uint64_t)v37, v40);

  v64 = &unk_1E60CCA78;
  v42 = v69;
  if (v69)
  {
    p_shared_owners = (unint64_t *)&v69->__shared_owners_;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  if (__p)
  {
    v67 = __p;
    operator delete(__p);
  }
  v45 = (void **)v55;
  if (v55)
  {
    v46 = (void **)v56;
    v47 = v55;
    if (v56 != v55)
    {
      do
      {
        if (*((char *)v46 - 1) < 0)
          operator delete(*(v46 - 3));
        v46 -= 3;
      }
      while (v46 != v45);
      v47 = v55;
    }
    v56 = (char *)v45;
    operator delete(v47);
  }

  return v41;
}

- (shared_ptr<cvnlp::clip::CLIPModel>)model
{
  CLIPModel **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<cvnlp::clip::CLIPModel> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (CLIPModel *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLIPModel *)self;
  return result;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  cntrl = self->_model.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
