@implementation _EARAppLmArtifact

- (_EARAppLmArtifact)initWithVersion:(id)a3 andLocale:(id)a4
{
  id v6;
  id v7;
  _EARAppLmArtifact *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *size;
  unint64_t *v13;
  unint64_t v14;
  void *v16[2];
  char v17;
  void *v18[2];
  uint64_t v19;
  std::string v20;
  void *__p;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_EARAppLmArtifact;
  v8 = -[_EARAppLmArtifact init](&v27, sel_init);
  if (!v8)
    goto LABEL_27;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
    if (v7)
    {
LABEL_4:
      objc_msgSend(v7, "ear_toString");
      goto LABEL_7;
    }
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    if (v7)
      goto LABEL_4;
  }
  v18[0] = 0;
  v18[1] = 0;
  v19 = 0;
LABEL_7:
  std::string::basic_string[abi:ne180100]<0>(v16, "_");
  quasar::Locale::fromInternalShortIdentifier((uint64_t)v18, (char *)v16, &v20);
  std::allocate_shared[abi:ne180100]<quasar::artifact::AppLmArtifact,std::allocator<quasar::artifact::AppLmArtifact>,std::string,quasar::Locale,void>(&v26);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v8->super._artifact, &v26);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
  if (*((_QWORD *)&v26 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v22 < 0)
    operator delete(__p);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  if (v17 < 0)
    operator delete(v16[0]);
  if (SHIBYTE(v19) < 0)
    operator delete(v18[0]);
  if (SHIBYTE(v25) < 0)
    operator delete(v23);
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = 0uLL;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v8->_cachedLmData, (__int128 *)&v20);
  size = (std::__shared_weak_count *)v20.__r_.__value_.__l.__size_;
  if (v20.__r_.__value_.__l.__size_)
  {
    v13 = (unint64_t *)(v20.__r_.__value_.__l.__size_ + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
LABEL_27:

  return v8;
}

- (_EARAppLmArtifact)initWithPath:(id)a3
{
  id v4;
  _EARAppLmArtifact *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _EARAppLmArtifact *v9;
  __int128 v11;
  objc_super v12;
  void *__p;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_EARAppLmArtifact;
  v5 = -[_EARAppLmArtifact init](&v12, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p = 0;
      v14 = 0;
      v15 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::artifact::AppLmArtifact,std::allocator<quasar::artifact::AppLmArtifact>,std::string,void>(&v11);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v5->super._artifact, &v11);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (SHIBYTE(v15) < 0)
      operator delete(__p);
  }
  v9 = v5;

  return v9;
}

- (_EARAppLmArtifact)initWithAppLmArtifact:(shared_ptr<quasar::artifact::AppLmArtifact>)a3
{
  uint64_t *var0;
  _EARAppLmArtifact *v4;
  _EARAppLmArtifact *v5;
  objc_super v7;

  var0 = (uint64_t *)a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)_EARAppLmArtifact;
  v4 = -[_EARAppLmArtifact init](&v7, sel_init, a3.var0, a3.var1);
  v5 = v4;
  if (v4)
  {
    if (*var0)
    {
      std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->super._artifact.__ptr_, var0);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (shared_ptr<quasar::AppLmData>)_tryToLoadCachedLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  AppLmData **v5;
  AppLmData **v9;
  id v10;
  id v11;
  NSString *cachedConfigFilepath;
  __shared_weak_count *cntrl;
  unint64_t *v14;
  unint64_t v15;
  AppLmData *v16;
  __shared_weak_count *v17;
  id v18;
  shared_ptr<quasar::AppLmData> result;

  v9 = v5;
  v18 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_cachedLmData.__ptr_
    && (cachedConfigFilepath = self->_cachedConfigFilepath) != 0
    && self->_cachedNcsRoot
    && self->_cachedDataRoot
    && -[NSString isEqualToString:](cachedConfigFilepath, "isEqualToString:", v18)
    && -[NSString isEqualToString:](self->_cachedNcsRoot, "isEqualToString:", v10)
    && -[NSString isEqualToString:](self->_cachedDataRoot, "isEqualToString:", v11))
  {
    cntrl = self->_cachedLmData.__cntrl_;
    *v9 = self->_cachedLmData.__ptr_;
    v9[1] = (AppLmData *)cntrl;
    if (cntrl)
    {
      v14 = (unint64_t *)((char *)cntrl + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
  }
  else
  {
    *v9 = 0;
    v9[1] = 0;
  }

  result.__cntrl_ = v17;
  result.__ptr_ = v16;
  return result;
}

- (void)_cacheLmData:(shared_ptr<quasar:(id)a4 :(id)a5 AppLmData>)a3 configFilepath:(id)a6 ncsRoot:dataRoot:
{
  uint64_t *ptr;
  __shared_weak_count *v10;
  NSString *v11;
  NSString *v12;
  NSString *cachedConfigFilepath;
  NSString *cachedNcsRoot;
  NSString *v15;
  NSString *cachedDataRoot;
  __shared_weak_count *v17;

  ptr = (uint64_t *)a3.__ptr_;
  v10 = a3.__cntrl_;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&self->_cachedLmData.__ptr_, ptr);
  cachedConfigFilepath = self->_cachedConfigFilepath;
  self->_cachedConfigFilepath = (NSString *)v10;
  v17 = v10;

  cachedNcsRoot = self->_cachedNcsRoot;
  self->_cachedNcsRoot = v11;
  v15 = v11;

  cachedDataRoot = self->_cachedDataRoot;
  self->_cachedDataRoot = v12;

}

- (shared_ptr<quasar::AppLmData>)_loadRawAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  __int128 *v5;
  __int128 *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  AppLmData *v14;
  __shared_weak_count *v15;
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v17;
  quasar::artifact::AppLmArtifact *v18;
  __shared_weak_count *cntrl;
  unint64_t *v20;
  unint64_t v21;
  quasar::artifact::AppLmArtifactLifeCycleStage *LifeCycleStage;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  void *__p[2];
  char v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  quasar::artifact::AppLmArtifact *v47;
  __shared_weak_count *v48;
  __int128 v49;
  uint8_t buf[8];
  void *v51;
  char v52;
  uint64_t v53;
  shared_ptr<quasar::AppLmData> result;

  v9 = v5;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[_EARAppLmArtifact _tryToLoadCachedLmData:ncsRoot:dataRoot:](self, "_tryToLoadCachedLmData:ncsRoot:dataRoot:", v10, v11, v12);
  if ((_QWORD)v49)
  {
    v13 = *((_QWORD *)&v49 + 1);
    *(_QWORD *)v9 = v49;
    *((_QWORD *)v9 + 1) = v13;
    goto LABEL_3;
  }
  ptr = self->super._artifact.__ptr_;
  if (!ptr
  {
    v47 = 0;
    v48 = 0;
    EarArtifactLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", buf, 2u);
    }

    goto LABEL_38;
  }
  v18 = v17;
  cntrl = self->super._artifact.__cntrl_;
  v47 = v17;
  v48 = cntrl;
  if (cntrl)
  {
    v20 = (unint64_t *)((char *)cntrl + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  LifeCycleStage = quasar::artifact::AppLmArtifact::getLifeCycleStage(v17);
  if ((quasar::artifact::AppLmArtifactLifeCycleStage::isTextNormalized(LifeCycleStage) & 1) != 0)
  {
    v23 = 0;
    if (v12)
      goto LABEL_11;
  }
  else
  {
    if (v11)
      +[_EARQuasarTokenizer tokenizerWithNcsRoot:](_EARQuasarTokenizer, "tokenizerWithNcsRoot:", v11);
    else
      +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v10);
    v23 = *(_QWORD *)buf;
    if (v12)
    {
LABEL_11:
      if (v10)
      {
        objc_msgSend(v10, "ear_toString");
      }
      else
      {
        v44 = 0uLL;
        v45 = 0;
      }
      quasar::filesystem::Path::Path(buf, &v44);
      v43 = v23;
      objc_msgSend(v12, "ear_toString");
      quasar::artifact::AppLmArtifact::loadAppLmData(v18, (kaldi::quasar::Vocab *)buf, &v43, (uint64_t)__p, &v46);
      std::shared_ptr<quasar::AppLmData>::operator=[abi:ne180100]<quasar::AppLmData,std::default_delete<quasar::AppLmData>,void>(&v49, &v46);
      v25 = v46;
      v46 = 0;
      if (v25)
        (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
      if (v42 < 0)
        operator delete(__p[0]);
      v26 = v43;
      v43 = 0;
      if (!v26)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
  }
  else
  {
    v44 = 0uLL;
    v45 = 0;
  }
  quasar::filesystem::Path::Path(buf, &v44);
  v40 = v23;
  std::string::basic_string[abi:ne180100]<0>(__p, "app-lm.data");
  quasar::artifact::AppLmArtifact::loadAppLmData(v18, (kaldi::quasar::Vocab *)buf, &v40, (uint64_t)__p, &v46);
  std::shared_ptr<quasar::AppLmData>::operator=[abi:ne180100]<quasar::AppLmData,std::default_delete<quasar::AppLmData>,void>(&v49, &v46);
  v38 = v46;
  v46 = 0;
  if (v38)
    (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
  if (v42 < 0)
    operator delete(__p[0]);
  v26 = v40;
  v40 = 0;
  if (!v26)
    goto LABEL_25;
LABEL_24:
  (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
LABEL_25:
  *(_QWORD *)buf = &unk_1E5D343A0;
  if (v52 < 0)
    operator delete(v51);
  if (SHIBYTE(v45) < 0)
    operator delete((void *)v44);
  v39 = v49;
  if (*((_QWORD *)&v49 + 1))
  {
    v27 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  -[_EARAppLmArtifact _cacheLmData:configFilepath:ncsRoot:dataRoot:](self, "_cacheLmData:configFilepath:ncsRoot:dataRoot:", &v39, v10, v11, v12);
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
  if (*((_QWORD *)&v39 + 1))
  {
    v30 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  *v9 = v49;
  v9 = &v49;
LABEL_38:
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v32 = (std::__shared_weak_count *)v48;
  if (v48)
  {
    v33 = (unint64_t *)((char *)v48 + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = (std::__shared_weak_count *)*((_QWORD *)&v49 + 1);
  if (*((_QWORD *)&v49 + 1))
  {
    v36 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
LABEL_3:

  result.__cntrl_ = v15;
  result.__ptr_ = v14;
  return result;
}

- (id)loadAppLmData:(id)a3 dataRoot:(id)a4
{
  -[_EARAppLmArtifact loadAppLmData:ncsRoot:dataRoot:](self, "loadAppLmData:ncsRoot:dataRoot:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadAppLmData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  _EARAppLmData *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  _EARAppLmData *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  -[_EARAppLmArtifact _loadRawAppLmData:ncsRoot:dataRoot:](self, "_loadRawAppLmData:ncsRoot:dataRoot:", a3, a4, a5);
  if (v18)
  {
    v5 = [_EARAppLmData alloc];
    v16 = v18;
    v17 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = -[_EARAppLmData initWithAppLmData:](v5, "initWithAppLmData:", &v16);
    v9 = v17;
    if (v17)
    {
      v10 = (unint64_t *)&v17->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v8;
}

- (id)loadCustomPronData:(id)a3 dataRoot:(id)a4
{
  -[_EARAppLmArtifact loadCustomPronData:ncsRoot:dataRoot:](self, "loadCustomPronData:ncsRoot:dataRoot:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadCustomPronData:(id)a3 ncsRoot:(id)a4 dataRoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v12;
  quasar::artifact::AppLmArtifact *v13;
  __shared_weak_count *cntrl;
  unint64_t *v15;
  unint64_t v16;
  const quasar::lm::SymbolTableData *SymbolTableData;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  unint64_t *p_shared_owners;
  _EARCustomPronData *v22;
  unint64_t v23;
  _EARCustomPronData *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  uint8_t buf[8];
  std::__shared_weak_count *v44;
  quasar::artifact::AppLmArtifact *v45;
  __shared_weak_count *v46;
  uint8_t v47[8];
  std::__shared_weak_count *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ptr = self->super._artifact.__ptr_;
  if (ptr)
  {
    if (v12)
    {
      v13 = v12;
      cntrl = self->super._artifact.__cntrl_;
      v45 = v12;
      v46 = cntrl;
      if (cntrl)
      {
        v15 = (unint64_t *)((char *)cntrl + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      -[_EARAppLmArtifact _loadRawAppLmData:ncsRoot:dataRoot:](self, "_loadRawAppLmData:ncsRoot:dataRoot:", v8, v9, v10);
      if (*(_QWORD *)buf)
      {
        SymbolTableData = (const quasar::lm::SymbolTableData *)quasar::LmData::getSymbolTableData(*(quasar::LmData **)buf);
        quasar::artifact::AppLmArtifact::loadCustomPronData(v13, SymbolTableData, &v42);
        v18 = v42;
        *(_QWORD *)v47 = v42;
        if (v42)
        {
          v19 = (std::__shared_weak_count *)operator new();
          v20 = v42;
          v19->__shared_owners_ = 0;
          p_shared_owners = (unint64_t *)&v19->__shared_owners_;
          v19->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46070;
          v19->__shared_weak_owners_ = 0;
          v19[1].__vftable = (std::__shared_weak_count_vtbl *)v20;
          v48 = v19;
          v22 = [_EARCustomPronData alloc];
          v40 = v18;
          v41 = v19;
          do
            v23 = __ldxr(p_shared_owners);
          while (__stxr(v23 + 1, p_shared_owners));
          v24 = -[_EARCustomPronData initWithCustomPronData:](v22, "initWithCustomPronData:", &v40);
          v25 = v41;
          if (v41)
          {
            v26 = (unint64_t *)&v41->__shared_owners_;
            do
              v27 = __ldaxr(v26);
            while (__stlxr(v27 - 1, v26));
            if (!v27)
            {
              ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
              std::__shared_weak_count::__release_weak(v25);
            }
          }
          v28 = v48;
          if (v48)
          {
            v29 = (unint64_t *)&v48->__shared_owners_;
            do
              v30 = __ldaxr(v29);
            while (__stlxr(v30 - 1, v29));
            if (!v30)
            {
              ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
              std::__shared_weak_count::__release_weak(v28);
            }
          }
          goto LABEL_27;
        }
      }
      else
      {
        EarArtifactLogger();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_1AD756000, v32, OS_LOG_TYPE_DEFAULT, "Failed to load app lm data object for use parsing custom prons", v47, 2u);
        }

      }
      v24 = 0;
LABEL_27:
      v33 = v44;
      if (v44)
      {
        v34 = (unint64_t *)&v44->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v36 = (std::__shared_weak_count *)v46;
      if (v46)
      {
        v37 = (unint64_t *)((char *)v46 + 8);
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }
      goto LABEL_37;
    }
  }
  EarArtifactLogger();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v31, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", buf, 2u);
  }

  v24 = 0;
LABEL_37:

  return v24;
}

- (id)loadOovs
{
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v13;
  uint8_t buf[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ptr = self->super._artifact.__ptr_;
  if (!ptr
  {
    v13 = 0;
    EarArtifactLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", buf, 2u);
    }

    goto LABEL_11;
  }
  cntrl = self->super._artifact.__cntrl_;
  v13 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  quasar::artifact::AppLmArtifact::loadOovs(v4, (uint64_t *)buf);
  if (!*(_QWORD *)buf)
  {
    std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100]((void ***)buf, 0);
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  EARHelpers::VectorToArray<std::string>(*(__int128 ***)buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100]((void ***)buf, 0);
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v8;
}

- (id)loadLmHandle
{
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v4;
  quasar::artifact::AppLmArtifact *v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  _BOOL4 hasInfo;
  _BOOL4 v10;
  float v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  std::string::size_type v15;
  uint64_t v16;
  _EARLmHandle *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void *__p[2];
  char v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  quasar::artifact::AppLmArtifact *v36;
  __shared_weak_count *v37;
  std::string __str;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  ptr = self->super._artifact.__ptr_;
  if (!ptr
  {
    v36 = 0;
    v37 = 0;
    EarArtifactLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__str.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1AD756000, v13, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", (uint8_t *)&__str, 2u);
    }

    goto LABEL_18;
  }
  v5 = v4;
  cntrl = self->super._artifact.__cntrl_;
  v36 = v4;
  v37 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v34 = 0;
  v35 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__str, "language-model-weight");
  hasInfo = quasar::artifact::Artifact::hasInfo((uint64_t)v5, (const void **)&__str.__r_.__value_.__l.__data_);
  v10 = hasInfo;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__str.__r_.__value_.__l.__data_);
    if (v10)
      goto LABEL_8;
  }
  else if (hasInfo)
  {
LABEL_8:
    std::string::basic_string[abi:ne180100]<0>(__p, "language-model-weight");
    quasar::artifact::Artifact::getInfo((uint64_t)v5, (uint64_t)__p, &__str);
    v11 = std::stof(&__str, 0);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    if (v33 < 0)
      operator delete(__p[0]);
    EarArtifactLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__str.__r_.__value_.__l.__data_) = 134217984;
      *(double *)((char *)__str.__r_.__value_.__r.__words + 4) = v11;
      _os_log_impl(&dword_1AD756000, v12, OS_LOG_TYPE_DEFAULT, "Interpolating app-lm with a weight of %f", (uint8_t *)&__str, 0xCu);
    }

    quasar::artifact::AppLmArtifact::getLmHandle(v5, v11, &__str);
    std::shared_ptr<kaldi::quasar::LmHandle>::operator=[abi:ne180100]<kaldi::quasar::LmHandle,std::default_delete<kaldi::quasar::LmHandle>,void>(&v34, (uint64_t *)&__str);
    goto LABEL_23;
  }
  EarArtifactLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__str.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1AD756000, v14, OS_LOG_TYPE_DEFAULT, "Interpolating app-lm with default weight", (uint8_t *)&__str, 2u);
  }

  quasar::artifact::AppLmArtifact::getLmHandle(v5, 0.0, &__str);
  std::shared_ptr<kaldi::quasar::LmHandle>::operator=[abi:ne180100]<kaldi::quasar::LmHandle,std::default_delete<kaldi::quasar::LmHandle>,void>(&v34, (uint64_t *)&__str);
LABEL_23:
  v15 = __str.__r_.__value_.__r.__words[0];
  __str.__r_.__value_.__r.__words[0] = 0;
  if (v15)
    (*(void (**)(std::string::size_type))(*(_QWORD *)v15 + 8))(v15);
  v16 = v34;
  if (v34)
  {
    v17 = [_EARLmHandle alloc];
    v30 = v34;
    v31 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
    }
    v5 = -[_EARLmHandle _initWithHandle:](v17, "_initWithHandle:", &v30);
    v20 = v31;
    if (v31)
    {
      v21 = (unint64_t *)&v31->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  v23 = v35;
  if (v35)
  {
    v24 = (unint64_t *)&v35->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (!v16)
LABEL_18:
    v5 = 0;
  v26 = (std::__shared_weak_count *)v37;
  if (v37)
  {
    v27 = (unint64_t *)((char *)v37 + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  return v5;
}

- (BOOL)isAdaptableToSpeechModelVersion:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v9;
  quasar::artifact::AppLmArtifact *v10;
  __shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  char isAdaptableToSpeechModelVersion;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  uint64_t v21;
  void *v22[2];
  char v23;
  void *v24[2];
  uint64_t v25;
  quasar::artifact::AppLmArtifact *v26;
  __shared_weak_count *v27;
  Locale buf;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ptr = self->super._artifact.__ptr_;
  if (ptr
  {
    v10 = v9;
    cntrl = self->super._artifact.__cntrl_;
    v26 = v9;
    v27 = cntrl;
    if (cntrl)
    {
      v12 = (unint64_t *)((char *)cntrl + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
    }
    else
    {
      v24[0] = 0;
      v24[1] = 0;
      v25 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v22, "_");
    quasar::Locale::fromInternalShortIdentifier((uint64_t)v24, (char *)v22, (std::string *)&buf);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v21 = 0;
    }
    isAdaptableToSpeechModelVersion = quasar::artifact::AppLmArtifact::isAdaptableToSpeechModelVersion(v10, &buf, (unsigned __int8 *)__p);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    if (v29 < 0)
      operator delete(*(void **)&buf.var0.__r_.var0);
    if (*((char *)&buf.var0.__r_.__value_.var0.var1 + 23) < 0)
      operator delete(buf.var0.__r_.__value_.var0.var1.__data_);
    if (v23 < 0)
      operator delete(v22[0]);
    if (SHIBYTE(v25) < 0)
      operator delete(v24[0]);
  }
  else
  {
    v26 = 0;
    v27 = 0;
    EarArtifactLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.__r_.__value_.var0.var0.__data_ = 0;
      _os_log_impl(&dword_1AD756000, v14, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", (uint8_t *)&buf, 2u);
    }

    isAdaptableToSpeechModelVersion = 0;
  }
  v16 = (std::__shared_weak_count *)v27;
  if (v27)
  {
    v17 = (unint64_t *)((char *)v27 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return isAdaptableToSpeechModelVersion;
}

- (unint64_t)getLifeCycleStage
{
  Artifact *ptr;
  quasar::artifact::AppLmArtifact *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  quasar::artifact::AppLmArtifactLifeCycleStage *LifeCycleStage;
  quasar::artifact::AppLmArtifactLifeCycleStages *v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  quasar::artifact::AppLmArtifactLifeCycleStages *v14;
  int v15;
  uint64_t v16;
  quasar::artifact::AppLmArtifactLifeCycleStages *v17;
  int v18;
  uint64_t v19;
  quasar::artifact::AppLmArtifactLifeCycleStages *v20;
  int v21;
  uint64_t v22;
  quasar::artifact::AppLmArtifactLifeCycleStages *v23;
  int v24;
  uint64_t v25;
  quasar::artifact::AppLmArtifactLifeCycleStages *v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint8_t v31[16];
  quasar::artifact::AppLmArtifact *v32;
  __shared_weak_count *v33;

  ptr = self->super._artifact.__ptr_;
  if (ptr
  {
    cntrl = self->super._artifact.__cntrl_;
    v32 = v4;
    v33 = cntrl;
    if (cntrl)
    {
      v6 = (unint64_t *)((char *)cntrl + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    LifeCycleStage = quasar::artifact::AppLmArtifact::getLifeCycleStage(v4);
    v9 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
    v10 = (int)v9;
    v11 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v9);
    if (v10 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v11 + 64))
    {
      v12 = 1;
    }
    else
    {
      v14 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
      v15 = (int)v14;
      v16 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v14);
      if (v15 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v16 + 128))
      {
        v12 = 2;
      }
      else
      {
        v17 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
        v18 = (int)v17;
        v19 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v17);
        if (v18 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v19 + 192))
        {
          v12 = 3;
        }
        else
        {
          v20 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
          v21 = (int)v20;
          v22 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v20);
          if (v21 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v22 + 256))
          {
            v12 = 4;
          }
          else
          {
            v23 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
            v24 = (int)v23;
            v25 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v23);
            if (v24 == quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v25 + 320))
            {
              v12 = 5;
            }
            else
            {
              v26 = (quasar::artifact::AppLmArtifactLifeCycleStages *)quasar::artifact::AppLmArtifactLifeCycleStage::operator int((uint64_t)LifeCycleStage);
              v27 = quasar::artifact::AppLmArtifactLifeCycleStages::get(v26);
              quasar::artifact::AppLmArtifactLifeCycleStage::operator int(v27);
              v12 = 0;
            }
          }
        }
      }
    }
    if (cntrl)
    {
      v28 = (unint64_t *)((char *)cntrl + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
  else
  {
    EarArtifactLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1AD756000, v13, OS_LOG_TYPE_DEFAULT, "Failed to dynamic cast Artifact to AppLmArtifact", v31, 2u);
    }

    return 0;
  }
  return v12;
}

+ (BOOL)createEmptyArtifact:(id)a3 version:(id)a4 locale:(id)a5 saveTo:(id)a6
{
  id v9;
  id v10;
  id v11;
  EARLogger *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v17[2];
  char v18;
  void *v19[2];
  uint64_t v20;
  void *v21[2];
  uint64_t v22;
  void *v23[2];
  uint64_t v24;
  uint64_t v25;
  std::string v26;
  void *__p;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (EARLogger *)a6;
  EARLogger::initializeLogging(v12);
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
    if (v10)
      goto LABEL_3;
LABEL_6:
    v21[0] = 0;
    v21[1] = 0;
    v22 = 0;
    if (v11)
      goto LABEL_4;
    goto LABEL_7;
  }
  v23[0] = 0;
  v23[1] = 0;
  v24 = 0;
  if (!v10)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v10, "ear_toString");
  if (v11)
  {
LABEL_4:
    objc_msgSend(v11, "ear_toString");
    goto LABEL_8;
  }
LABEL_7:
  v19[0] = 0;
  v19[1] = 0;
  v20 = 0;
LABEL_8:
  std::string::basic_string[abi:ne180100]<0>(v17, "_");
  quasar::Locale::fromInternalShortIdentifier((uint64_t)v19, (char *)v17, &v26);
  quasar::artifact::CreateEmptyArtifact((const void **)v23, (uint64_t)v21, &v25);
  if (v28 < 0)
    operator delete(__p);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (v18 < 0)
    operator delete(v17[0]);
  if (SHIBYTE(v20) < 0)
    operator delete(v19[0]);
  if (SHIBYTE(v22) < 0)
    operator delete(v21[0]);
  if (SHIBYTE(v24) < 0)
    operator delete(v23[0]);
  v13 = v25;
  if (v12)
    -[EARLogger ear_toString](v12, "ear_toString");
  else
    memset(&v26, 0, sizeof(v26));
  v14 = quasar::artifact::Artifact::write(v13, (unsigned __int8 *)&v26);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  v15 = v25;
  v25 = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

  return v14;
}

+ (BOOL)createPhraseCountsArtifact:(id)a3 version:(id)a4 locale:(id)a5 rawPhraseCountsPath:(id)a6 customPronunciationsPath:(id)a7 saveTo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  EARLogger *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  char v26;
  __int128 v27;
  uint64_t v28;
  _QWORD v29[3];
  char v30;
  void *v31[2];
  char v32;
  void *v33[2];
  uint64_t v34;
  void *v35[2];
  uint64_t v36;
  const void *v37[2];
  uint64_t v38;
  uint64_t v39;
  std::string v40;
  void *v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (EARLogger *)a8;
  EARLogger::initializeLogging(v18);
  if (v13)
  {
    objc_msgSend(v13, "ear_toString");
    if (v14)
      goto LABEL_3;
LABEL_6:
    v35[0] = 0;
    v35[1] = 0;
    v36 = 0;
    if (v15)
      goto LABEL_4;
    goto LABEL_7;
  }
  v37[0] = 0;
  v37[1] = 0;
  v38 = 0;
  if (!v14)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v14, "ear_toString");
  if (v15)
  {
LABEL_4:
    objc_msgSend(v15, "ear_toString");
    goto LABEL_8;
  }
LABEL_7:
  v33[0] = 0;
  v33[1] = 0;
  v34 = 0;
LABEL_8:
  std::string::basic_string[abi:ne180100]<0>(v31, "_");
  quasar::Locale::fromInternalShortIdentifier((uint64_t)v33, (char *)v31, &v40);
  if (v16)
  {
    objc_msgSend(v16, "ear_toString");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0;
  }
  quasar::filesystem::Path::Path(v29, &v27);
  if (v17)
  {
    objc_msgSend(v17, "ear_toString");
  }
  else
  {
    v23 = 0uLL;
    v24 = 0;
  }
  quasar::filesystem::Path::Path(v25, &v23);
  quasar::artifact::CreatePhraseCountsArtifact(v37, (uint64_t)v35, (kaldi::quasar::Vocab *)v29, (kaldi::quasar::Vocab *)v25, &v39);
  v25[0] = &unk_1E5D343A0;
  if (v26 < 0)
    operator delete((void *)v25[1]);
  if (SHIBYTE(v24) < 0)
    operator delete((void *)v23);
  v29[0] = &unk_1E5D343A0;
  if (v30 < 0)
    operator delete((void *)v29[1]);
  if (SHIBYTE(v28) < 0)
    operator delete((void *)v27);
  if (v42 < 0)
    operator delete(v41);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  if (v32 < 0)
    operator delete(v31[0]);
  if (SHIBYTE(v34) < 0)
    operator delete(v33[0]);
  if (SHIBYTE(v36) < 0)
    operator delete(v35[0]);
  if (SHIBYTE(v38) < 0)
    operator delete((void *)v37[0]);
  v19 = v39;
  if (v18)
    -[EARLogger ear_toString](v18, "ear_toString");
  else
    memset(&v40, 0, sizeof(v40));
  v20 = quasar::artifact::Artifact::write(v19, (unsigned __int8 *)&v40);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  v21 = v39;
  v39 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);

  return v20;
}

+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  objc_msgSend(a1, "transitionArtifactAt:toStage:configPath:ncsRoot:dataRoot:estimationRoot:minimize:", a3, a4, a5, 0, a6, a7, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  EARLogger *v18;
  quasar::artifact::AppLmArtifact *v19;
  quasar::artifact::AppLmArtifactLifeCycleStage *LifeCycleStage;
  _EARQuasarTokenizer *isTextNormalized;
  uint64_t v22;
  quasar::artifact *v23;
  uint64_t v24;
  quasar::artifact::AppLmArtifact *v25;
  quasar::artifact::AppLmArtifact *v26;
  NSObject *v27;
  _BOOL4 v28;
  _EARAppLmArtifact *v29;
  std::__shared_weak_count *v30;
  quasar::artifact::AppLmArtifact *v31;
  _EARAppLmArtifact *v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  quasar::artifact::AppLmArtifact *v36;
  quasar::artifact::AppLmArtifact *v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  quasar::artifact::AppLmArtifact *v41;
  quasar::artifact::AppLmArtifact *v42;
  void *v43[2];
  uint64_t v44;
  uint8_t buf[16];
  uint64_t v46;
  void *__p[2];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (EARLogger *)a8;
  EARLogger::initializeLogging(v18);
  if (v14)
  {
    objc_msgSend(v14, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v48 = 0;
  }
  v19 = (quasar::artifact::AppLmArtifact *)operator new();
  quasar::artifact::AppLmArtifact::AppLmArtifact(v19);
  if (SHIBYTE(v48) < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "app-lm.data");
  std::string::basic_string[abi:ne180100]<0>(v43, "app-lm.NGRAM");
  LifeCycleStage = quasar::artifact::AppLmArtifact::getLifeCycleStage(v19);
  isTextNormalized = (_EARQuasarTokenizer *)quasar::artifact::AppLmArtifactLifeCycleStage::isTextNormalized(LifeCycleStage);
  if ((isTextNormalized & 1) != 0)
  {
    v22 = 0;
    if (!v17)
      goto LABEL_8;
  }
  else
  {
    if (v16)
      isTextNormalized = +[_EARQuasarTokenizer tokenizerWithNcsRoot:](_EARQuasarTokenizer, "tokenizerWithNcsRoot:", v16);
    else
      isTextNormalized = +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v15);
    v22 = *(_QWORD *)buf;
    if (!v17)
    {
LABEL_8:
      if (!v18)
        goto LABEL_20;
      goto LABEL_17;
    }
  }
  isTextNormalized = (_EARQuasarTokenizer *)objc_msgSend(v17, "ear_toString");
  if (SHIBYTE(v48) < 0)
    operator delete(__p[0]);
  *(_OWORD *)__p = *(_OWORD *)buf;
  v48 = v46;
  if (v18)
  {
LABEL_17:
    isTextNormalized = (_EARQuasarTokenizer *)-[EARLogger ear_toString](v18, "ear_toString");
    if (SHIBYTE(v44) < 0)
      operator delete(v43[0]);
    *(_OWORD *)v43 = *(_OWORD *)buf;
    v44 = v46;
  }
LABEL_20:
  v41 = v19;
  switch(a4)
  {
    case 1uLL:
      v23 = (quasar::artifact *)(quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized)
                               + 64);
      if (v15)
        goto LABEL_30;
      goto LABEL_32;
    case 2uLL:
      v23 = (quasar::artifact *)(quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized)
                               + 128);
      if (v15)
        goto LABEL_30;
      goto LABEL_32;
    case 3uLL:
      v23 = (quasar::artifact *)(quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized)
                               + 192);
      if (!v15)
        goto LABEL_32;
      goto LABEL_30;
    case 4uLL:
      v23 = (quasar::artifact *)(quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized)
                               + 256);
      if (!v15)
        goto LABEL_32;
      goto LABEL_30;
    case 5uLL:
      v23 = (quasar::artifact *)(quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized)
                               + 320);
      if (!v15)
        goto LABEL_32;
      goto LABEL_30;
    default:
      v23 = (quasar::artifact *)quasar::artifact::AppLmArtifactLifeCycleStages::get((quasar::artifact::AppLmArtifactLifeCycleStages *)isTextNormalized);
      if (v15)
      {
LABEL_30:
        objc_msgSend(v15, "ear_toString");
      }
      else
      {
LABEL_32:
        memset(buf, 0, sizeof(buf));
        v46 = 0;
      }
      v40 = v22;
      quasar::artifact::TransitionArtifact(&v41, v23, (__int128 *)buf, &v40, (uint64_t)__p, a9, &v42);
      v24 = v40;
      v40 = 0;
      if (v24)
        (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
      if (SHIBYTE(v46) < 0)
        operator delete(*(void **)buf);
      v25 = v41;
      v41 = 0;
      if (v25)
        (*(void (**)(quasar::artifact::AppLmArtifact *))(*(_QWORD *)v25 + 8))(v25);
      v26 = v42;
      EarArtifactLogger();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD756000, v27, OS_LOG_TYPE_DEFAULT, "Transitioned artifact", buf, 2u);
        }

        v29 = [_EARAppLmArtifact alloc];
        v38 = v42;
        if (v42)
        {
          v30 = (std::__shared_weak_count *)operator new();
          v31 = v42;
          v30->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46460;
          v30->__shared_owners_ = 0;
          v30->__shared_weak_owners_ = 0;
          v30[1].__vftable = (std::__shared_weak_count_vtbl *)v31;
        }
        else
        {
          v30 = 0;
        }
        v39 = v30;
        v42 = 0;
        v32 = -[_EARAppLmArtifact initWithAppLmArtifact:](v29, "initWithAppLmArtifact:", &v38);
        v33 = v39;
        if (v39)
        {
          p_shared_owners = (unint64_t *)&v39->__shared_owners_;
          do
            v35 = __ldaxr(p_shared_owners);
          while (__stlxr(v35 - 1, p_shared_owners));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
      }
      else
      {
        if (v28)
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_1AD756000, v27, OS_LOG_TYPE_DEFAULT, "Transitioning artifact at %@ failed", buf, 0xCu);
        }

        v32 = 0;
      }
      v36 = v42;
      v42 = 0;
      if (v36)
        (*(void (**)(quasar::artifact::AppLmArtifact *))(*(_QWORD *)v36 + 8))(v36);
      if (SHIBYTE(v44) < 0)
        operator delete(v43[0]);
      if (SHIBYTE(v48) < 0)
        operator delete(__p[0]);

      return v32;
  }
}

+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 dataRoot:(id)a6 estimationRoot:(id)a7 minimize:(BOOL)a8 saveTo:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  LOBYTE(v20) = a8;
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "transitionArtifactAt:toStage:configPath:ncsRoot:dataRoot:estimationRoot:minimize:saveTo:", v14, a4, v15, 0, v16, v17, v20, v18);

  return a4;
}

+ (BOOL)transitionArtifactAt:(id)a3 toStage:(unint64_t)a4 configPath:(id)a5 ncsRoot:(id)a6 dataRoot:(id)a7 estimationRoot:(id)a8 minimize:(BOOL)a9 saveTo:(id)a10
{
  id v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v21;

  v16 = a10;
  LOBYTE(v21) = a9;
  +[_EARAppLmArtifact transitionArtifactAt:toStage:configPath:ncsRoot:dataRoot:estimationRoot:minimize:](_EARAppLmArtifact, "transitionArtifactAt:toStage:configPath:ncsRoot:dataRoot:estimationRoot:minimize:", a3, a4, a5, a6, a7, a8, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = objc_msgSend(v17, "write:", v16);
  else
    v19 = 0;

  return v19;
}

+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4
{
  objc_msgSend(a1, "loadLmHandleFromArtifactAt:configPath:ncsRoot:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadLmHandleFromArtifactAt:(id)a3 configPath:(id)a4 ncsRoot:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  _EARLmHandle *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  __int128 __p;
  uint64_t v29;
  _QWORD v30[2];
  std::__shared_weak_count *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
    +[_EARQuasarTokenizer tokenizerWithNcsRoot:](_EARQuasarTokenizer, "tokenizerWithNcsRoot:", v9);
  else
    +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v8);
  v10 = v32;
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
    if (v8)
    {
LABEL_6:
      objc_msgSend(v8, "ear_toString");
      goto LABEL_9;
    }
  }
  else
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    if (v8)
      goto LABEL_6;
  }
  __p = 0uLL;
  v29 = 0;
LABEL_9:
  v27 = (uint64_t)v10;
  quasar::artifact::LoadLmHandleFromArtifact(&__p, &v27, v30);
  v11 = v30[0];
  v30[1] = v30[0];
  if (v30[0])
  {
    v12 = (unint64_t *)operator new();
    v13 = v30[0];
    *v12 = (unint64_t)&unk_1E5D45E78;
    v12[1] = 0;
    v12[2] = 0;
    v12[3] = v13;
  }
  else
  {
    v12 = 0;
  }
  v31 = (std::__shared_weak_count *)v12;
  v30[0] = 0;
  v14 = v27;
  v27 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  if (SHIBYTE(v29) < 0)
    operator delete((void *)__p);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(v32);
    if (!v11)
      goto LABEL_27;
  }
  else if (!v11)
  {
    goto LABEL_27;
  }
  v15 = [_EARLmHandle alloc];
  v25 = v11;
  v26 = (std::__shared_weak_count *)v12;
  if (v12)
  {
    v16 = v12 + 1;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v12 = -[_EARLmHandle _initWithHandle:](v15, "_initWithHandle:", &v25);
  v18 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
LABEL_27:
  v21 = v31;
  if (v31)
  {
    v22 = (unint64_t *)&v31->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (!v11)
    v12 = 0;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataRoot, 0);
  objc_storeStrong((id *)&self->_cachedNcsRoot, 0);
  objc_storeStrong((id *)&self->_cachedConfigFilepath, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_cachedLmData);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
