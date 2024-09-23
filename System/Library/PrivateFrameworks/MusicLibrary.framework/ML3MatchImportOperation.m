@implementation ML3MatchImportOperation

- (unint64_t)importSource
{
  return 2;
}

- (void)main
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  int v11;
  int v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[ML3ImportOperation import](self, "import");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_6;
  -[ML3ImportOperation import](self, "import");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playlistData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[ML3ImportOperation import](self, "import");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albumArtistData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_5;
  }
  -[ML3ImportOperation import](self, "import");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "albumData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MatchImportOperation.mm"), 39, CFSTR("Attempted to start match import operation without DAAP payload data."));
LABEL_7:

LABEL_8:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  if (*((_BYTE *)v19 + 24) && (-[ML3MatchImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __31__ML3MatchImportOperation_main__block_invoke;
    v17[3] = &unk_1E5B65CC8;
    v17[4] = self;
    v17[5] = &v18;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v17);
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[ML3MatchImportOperation isCancelled](self, "isCancelled");
    v12 = *((unsigned __int8 *)v19 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v23 = v11;
    v24 = 1024;
    v25 = v12;
    v26 = 2048;
    v27 = v13 - v9;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[MLMatchImportOperation] Match import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v19 + 24))
    v14 = -[ML3MatchImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v14 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v14);
  _Block_object_dispose(&v18, 8);
}

- (BOOL)_performMatchImportWithTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ML3MatchImportOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_4;
  if (-[ML3DAAPImportOperation performImportOfSourceType:usingConnection:](self, "performImportOfSourceType:usingConnection:", 2, v4))
  {
    -[ML3ImportOperation import](self, "import");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyKeepLocalStateDidChange");

LABEL_4:
    v7 = 1;
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "failed to process match import data", v10, 2u);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  Element *var0;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v5 = v3;
  v6 = operator new();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)var0;
  v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v16 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  ML3DAAPTrackImportItem::ML3DAAPTrackImportItem(v6, v8, v9);
  *v7 = &off_1E5B4D378;
  *v5 = v7;
  v12 = operator new();
  *(_QWORD *)v12 = &off_1E5B517D8;
  *(_QWORD *)(v12 + 8) = 0;
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = v7;
  v5[1] = v12;
  if (v16)
  {
    v14 = (unint64_t *)&v16->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  result.var1 = v13;
  result.var0 = (ML3DAAPImportItem *)v12;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
  uint64_t *v5;
  __shared_weak_count *var1;
  Element *var0;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  _QWORD *v21;
  __shared_weak_count *v22;
  ML3DAAPImportItem *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[3];
  void *__p;
  void *v37;
  uint64_t v38;
  uint64_t v39[2];
  void **v40;
  shared_ptr<ML3DAAPImportItem> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = v5;
  v10 = operator new();
  v11 = *((_QWORD *)var0 + 1);
  v33 = *(_QWORD *)var0;
  v34 = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v30 = 0;
  v31 = 0;
  v32 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v30, *(const void **)var1, *((_QWORD *)var1 + 1), (uint64_t)(*((_QWORD *)var1 + 1) - *(_QWORD *)var1) >> 3);
  v27 = 0;
  v28 = 0;
  v29 = 0;
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)&v27, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
  v14 = (std::__shared_weak_count *)v34;
  v39[0] = v33;
  v39[1] = v34;
  if (v34)
  {
    v15 = (unint64_t *)(v34 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  __p = 0;
  v37 = 0;
  v38 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v30, (uint64_t)v31, (v31 - (_BYTE *)v30) >> 3);
  memset(v35, 0, sizeof(v35));
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v35, v27, v28, 0xCCCCCCCCCCCCCCCDLL * ((v28 - v27) >> 3));
  ML3DAAPContainerImportItem::ML3DAAPContainerImportItem(v10, v39, (uint64_t)&__p, v35);
  v40 = (void **)v35;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100](&v40);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  *(_QWORD *)v10 = &off_1E5B4E928;
  ML3DAAPImportItem::getIntegerValue((ML3DAAPImportItem *)v10, 184549430);
  *(_BYTE *)(v10 + 288) = *(_DWORD *)(v10 + 240) == 7;
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 32))(v10, 184549431);
  v20 = *(_BYTE *)(v10 + 288) == 0;
  *(_BYTE *)(v10 + 289) = v19 != 0;
  if (v19)
    v20 = 0;
  *(_BYTE *)(v10 + 17) = v20;
  *v9 = v10;
  v21 = (_QWORD *)operator new();
  *v21 = &off_1E5B51AE8;
  v21[1] = 0;
  v21[2] = 0;
  v21[3] = v10;
  v9[1] = (uint64_t)v21;
  __p = &v27;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v23 = (ML3DAAPImportItem *)v30;
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  v24 = (std::__shared_weak_count *)v34;
  if (v34)
  {
    v25 = (unint64_t *)(v34 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  result.var1 = v22;
  result.var0 = v23;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  Element *var0;
  _QWORD *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  id v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  ML3DAAPImportItem *v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25[2];
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v6 = v3;
  v7 = (_QWORD *)operator new();
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v22 = *(_QWORD *)var0;
  v24 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  -[ML3ImportOperation import](self, "import", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v25[1] = (uint64_t)v24;
  if (v24)
  {
    v13 = (unint64_t *)&v24->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  ML3DAAPAlbumImportItem::ML3DAAPAlbumImportItem((uint64_t)v7, v25, v12);
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  *v7 = &off_1E5B4DF58;

  *v6 = v7;
  v17 = (_QWORD *)operator new();
  *v17 = &off_1E5B51998;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = v7;
  v6[1] = v17;

  if (v24)
  {
    v20 = (unint64_t *)&v24->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  Element *var0;
  _QWORD *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  id v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  ML3DAAPImportItem *v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25[2];
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v6 = v3;
  v7 = (_QWORD *)operator new();
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v22 = *(_QWORD *)var0;
  v24 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  -[ML3ImportOperation import](self, "import", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v25[1] = (uint64_t)v24;
  if (v24)
  {
    v13 = (unint64_t *)&v24->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  ML3DAAPArtistImportItem::ML3DAAPArtistImportItem((uint64_t)v7, v25, 7, v12);
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  *v7 = &off_1E5B4E300;

  *v6 = v7;
  v17 = (_QWORD *)operator new();
  *v17 = &off_1E5B519D0;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = v7;
  v6[1] = v17;

  if (v24)
  {
    v20 = (unint64_t *)&v24->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;
  std::string *v7;
  int v8;
  uint64_t v9;
  __shared_weak_count *v10;
  std::string __p;
  shared_ptr<ML3DAAPDeleteImportItem> result;

  v5 = v3;
  v6 = operator new();
  if (*((char *)a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  else
    __p = *(std::string *)a3;
  *(_WORD *)(v6 + 16) = 256;
  *(_BYTE *)(v6 + 18) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_DWORD *)(v6 + 56) = 1065353216;
  *(_QWORD *)(v6 + 64) = 0;
  *(_DWORD *)(v6 + 72) = 2;
  *(_QWORD *)v6 = off_1E5B4F858;
  *(_QWORD *)(v6 + 8) = 0;
  v7 = (std::string *)(v6 + 80);
  v8 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v7, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v6 + 96) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  *v5 = v6;
  v9 = operator new();
  *(_QWORD *)v9 = &off_1E5B51D88;
  *(_QWORD *)(v9 + 8) = 0;
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = v6;
  v5[1] = v9;
  if (v8 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  result.var1 = v10;
  result.var0 = (ML3DAAPDeleteImportItem *)v9;
  return result;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;
  std::string *v7;
  int v8;
  uint64_t v9;
  __shared_weak_count *v10;
  std::string __p;
  shared_ptr<ML3DAAPDeleteImportItem> result;

  v5 = v3;
  v6 = operator new();
  if (*((char *)a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  else
    __p = *(std::string *)a3;
  *(_WORD *)(v6 + 16) = 256;
  *(_BYTE *)(v6 + 18) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_DWORD *)(v6 + 56) = 1065353216;
  *(_QWORD *)(v6 + 64) = 0;
  *(_DWORD *)(v6 + 72) = 2;
  *(_QWORD *)v6 = off_1E5B4F668;
  *(_QWORD *)(v6 + 8) = 0;
  v7 = (std::string *)(v6 + 80);
  v8 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v7, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v6 + 96) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  *v5 = v6;
  v9 = operator new();
  *(_QWORD *)v9 = &off_1E5B51D50;
  *(_QWORD *)(v9 + 8) = 0;
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = v6;
  v5[1] = v9;
  if (v8 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  result.var1 = v10;
  result.var0 = (ML3DAAPDeleteImportItem *)v9;
  return result;
}

uint64_t __31__ML3MatchImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performMatchImportWithTransaction:", v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v7;
}

@end
