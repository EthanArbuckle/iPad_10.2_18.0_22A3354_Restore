@implementation ML3HomeSharingImportOperation

- (unint64_t)importSource
{
  return 3;
}

- (void)main
{
  double v3;
  double v4;
  NSObject *v5;
  int v6;
  int v7;
  double v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__ML3HomeSharingImportOperation_main__block_invoke;
  v10[3] = &unk_1E5B65CC8;
  v10[4] = self;
  v10[5] = &v11;
  -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v10);
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[ML3HomeSharingImportOperation isCancelled](self, "isCancelled");
    v7 = *((unsigned __int8 *)v12 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 2048;
    v20 = v8 - v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "[MLHomeSharingImportOperation] HomeSharing import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v12 + 24))
    v9 = -[ML3HomeSharingImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v9 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v9);
  _Block_object_dispose(&v11, 8);
}

- (BOOL)_performHomeSharingImportWithTransaction:(id)a3
{
  void *v4;
  double v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v14;
  uint8_t buf[2];

  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ML3HomeSharingImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v6 = -[ML3DAAPImportOperation performImportOfSourceType:usingConnection:](self, "performImportOfSourceType:usingConnection:", 0, v4);
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        v9 = "successfully processed import data";
        v10 = (uint8_t *)&v14;
        v11 = v8;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1AC149000, v11, v12, v9, v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "failed to process import data";
      v10 = buf;
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v6 = 1;
LABEL_10:
  LODWORD(v5) = 1.0;
  -[ML3ImportOperation setProgress:](self, "setProgress:", v5, v14);

  return v6;
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
  *v7 = &off_1E5B4F488;
  *v5 = v7;
  v12 = operator new();
  *(_QWORD *)v12 = &off_1E5B51CE0;
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
  _QWORD *v5;
  __shared_weak_count *var1;
  Element *var0;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  ML3DAAPImportItem *v27;
  __shared_weak_count *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];
  void *__p;
  void *v39;
  uint64_t v40;
  uint64_t v41[2];
  void **v42;
  shared_ptr<ML3DAAPImportItem> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = v5;
  v11 = (_QWORD *)operator new();
  v12 = *((_QWORD *)var0 + 1);
  v35 = *(_QWORD *)var0;
  v36 = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v32 = 0;
  v33 = 0;
  v34 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v32, *(const void **)var1, *((_QWORD *)var1 + 1), (uint64_t)(*((_QWORD *)var1 + 1) - *(_QWORD *)var1) >> 3);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)&v29, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
  -[ML3ImportOperation import](self, "import");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "homeSharingBasePlaylistID");
  v17 = (std::__shared_weak_count *)v36;
  v41[0] = v35;
  v41[1] = v36;
  if (v36)
  {
    v18 = (unint64_t *)(v36 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  __p = 0;
  v39 = 0;
  v40 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v32, (uint64_t)v33, (v33 - (_BYTE *)v32) >> 3);
  memset(v37, 0, sizeof(v37));
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v37, v29, v30, 0xCCCCCCCCCCCCCCCDLL * ((v30 - v29) >> 3));
  ML3DAAPContainerImportItem::ML3DAAPContainerImportItem((uint64_t)v11, v41, (uint64_t)&__p, v37);
  v42 = (void **)v37;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100](&v42);
  if (__p)
  {
    v39 = __p;
    operator delete(__p);
  }
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  *v11 = &off_1E5B50050;
  v11[36] = v16;
  *v10 = v11;
  v22 = (_QWORD *)operator new();
  *v22 = &off_1E5B51F80;
  v22[1] = 0;
  v22[2] = 0;
  v22[3] = v11;
  v10[1] = v22;

  __p = &v29;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }
  v23 = (std::__shared_weak_count *)v36;
  if (v36)
  {
    v24 = (unint64_t *)(v36 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = *v10;
  v27 = (ML3DAAPImportItem *)(*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v10 + 32))(*v10, 184549377);
  *(_QWORD *)(v26 + 8) = v27;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

uint64_t __37__ML3HomeSharingImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performHomeSharingImportWithTransaction:", v5);
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
