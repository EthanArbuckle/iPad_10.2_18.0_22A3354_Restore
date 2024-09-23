@implementation ML3SubscriptionImportOperation

- (unint64_t)importSource
{
  return 8;
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
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ML3ImportOperation import](self, "import");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ML3ImportOperation import](self, "import");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playlistData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3SubscriptionImportOperation.mm"), 26, CFSTR("Attempted to start subscription import operation without DAAP payload data."));
  }

LABEL_5:
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  if (*((_BYTE *)v17 + 24) && (-[ML3SubscriptionImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__ML3SubscriptionImportOperation_main__block_invoke;
    v15[3] = &unk_1E5B65CC8;
    v15[4] = self;
    v15[5] = &v16;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v15);
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[ML3SubscriptionImportOperation isCancelled](self, "isCancelled");
    v12 = *((unsigned __int8 *)v17 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v21 = v11;
    v22 = 1024;
    v23 = v12;
    v24 = 2048;
    v25 = v13 - v9;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3SubscriptionImportOperation] Subscription import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v17 + 24))
    v14 = -[ML3SubscriptionImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v14 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v14);
  _Block_object_dispose(&v16, 8);
}

- (BOOL)_performDAAPImportWithTransaction:(id)a3
{
  void *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  os_log_type_t v11;
  __int16 v13;
  uint8_t buf[2];

  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ML3SubscriptionImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = -[ML3DAAPImportOperation performImportOfSourceType:usingConnection:](self, "performImportOfSourceType:usingConnection:", 6, v4);
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v8 = "[ML3SubscriptionImportOperation] successfully processed import data";
        v9 = (uint8_t *)&v13;
        v10 = v7;
        v11 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1AC149000, v10, v11, v8, v9, 2u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "[ML3SubscriptionImportOperation] failed to process import data";
      v9 = buf;
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v5 = 1;
LABEL_10:

  return v5;
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
  *v7 = &off_1E5B4E4D8;
  *v5 = v7;
  v12 = operator new();
  *(_QWORD *)v12 = &off_1E5B51A40;
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
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  _QWORD *v19;
  __shared_weak_count *v20;
  ML3DAAPImportItem *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[3];
  void *__p;
  void *v35;
  uint64_t v36;
  uint64_t v37[2];
  void **v38;
  shared_ptr<ML3DAAPImportItem> result;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = v5;
  v10 = (_QWORD *)operator new();
  v11 = *((_QWORD *)var0 + 1);
  v31 = *(_QWORD *)var0;
  v32 = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v28, *(const void **)var1, *((_QWORD *)var1 + 1), (uint64_t)(*((_QWORD *)var1 + 1) - *(_QWORD *)var1) >> 3);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)&v25, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
  v14 = (std::__shared_weak_count *)v32;
  v37[0] = v31;
  v37[1] = v32;
  if (v32)
  {
    v15 = (unint64_t *)(v32 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  __p = 0;
  v35 = 0;
  v36 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v28, (uint64_t)v29, (v29 - (_BYTE *)v28) >> 3);
  memset(v33, 0, sizeof(v33));
  std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v33, v25, v26, 0xCCCCCCCCCCCCCCCDLL * ((v26 - v25) >> 3));
  ML3DAAPContainerImportItem::ML3DAAPContainerImportItem((uint64_t)v10, v37, (uint64_t)&__p, v33);
  v38 = (void **)v33;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100](&v38);
  if (__p)
  {
    v35 = __p;
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
  *v10 = &off_1E5B504A8;
  *v9 = v10;
  v19 = (_QWORD *)operator new();
  *v19 = &off_1E5B520D0;
  v19[1] = 0;
  v19[2] = 0;
  v19[3] = v10;
  v9[1] = v19;
  __p = &v25;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v21 = (ML3DAAPImportItem *)v28;
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  v22 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v23 = (unint64_t *)(v32 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  result.var1 = v20;
  result.var0 = v21;
  return result;
}

uint64_t __38__ML3SubscriptionImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performDAAPImportWithTransaction:", v5);
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
