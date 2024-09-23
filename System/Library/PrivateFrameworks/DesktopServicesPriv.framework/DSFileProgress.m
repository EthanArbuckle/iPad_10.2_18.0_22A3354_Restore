@implementation DSFileProgress

- (void)startObserving:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t (***v7)();
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  DS_TKeyValueObserverGlue *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  TString v18;
  id v19;
  id v20;
  id from;
  id to;
  id v23;
  id location;
  id v25;
  id v26;
  _BYTE v27[40];
  id v28;
  id v29;
  NSObject *v30;
  uint64_t (**v31)();
  id v32[2];
  uint64_t (***v33)();
  _QWORD v34[2];
  id v35;
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  v5 = v4;
  v23 = v5;
  v33 = 0;
  v31 = &off_1E874EAA8;
  objc_moveWeak(v32, &to);
  v6 = v23;
  v23 = 0;
  v32[1] = v6;
  v33 = &v31;
  objc_destroyWeak(&to);
  AddProgressObserver(v5, (uint64_t *)&self->_observers, (uint64_t)&v31);
  v7 = v33;
  if (v33 == &v31)
  {
    v8 = 4;
    v7 = &v31;
  }
  else
  {
    if (!v33)
      goto LABEL_6;
    v8 = 5;
  }
  (*v7)[v8]();
LABEL_6:
  objc_initWeak(&from, self);
  v9 = v5;
  v19 = v9;
  objc_copyWeak(&v20, &from);
  v18.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v18, (TString *)CFSTR("fileURL"));
  v16 = v19;
  objc_copyWeak(&v17, &v20);
  v10 = v9;
  TKeyValueObserver::TKeyValueObserver((TKeyValueObserver *)v27);
  v25 = v16;
  objc_copyWeak(&v26, &v17);
  v11 = v10;
  v28 = v25;
  objc_copyWeak(&v29, &v26);
  v36 = 0;
  v12 = v28;
  v28 = 0;
  v34[0] = &off_1E874FF78;
  v34[1] = v12;
  objc_moveWeak(&v35, &v29);
  v36 = v34;
  objc_destroyWeak(&v29);

  v30 = v11;
  std::unordered_set<NSObject *>::unordered_set((uint64_t)&v31, (id *)&v30, 1);
  TKeyValueObserver::CreateObserver((uint64_t)v27, (uint64_t)v34, (uint64_t)&v31, (uint64_t)&v18);
  v13 = (DS_TKeyValueObserverGlue *)objc_claimAutoreleasedReturnValue();
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&v31);
  v14 = v36;
  if (v36 == v34)
  {
    v15 = 4;
    v14 = v34;
    goto LABEL_10;
  }
  if (v36)
  {
    v15 = 5;
LABEL_10:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }
  TKeyValueObserver::StartObservingPriv((TKeyValueObserver *)v27, v13, v11, &v18, 0);

  objc_destroyWeak(&v26);
  std::vector<TKeyValueObserver>::push_back[abi:ne180100]((uint64_t *)&self->_observers, (uint64_t)v27);
  TKeyValueObserver::~TKeyValueObserver((TKeyValueObserver *)v27);
  objc_destroyWeak(&v17);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v18.fString.fRef);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)stopObserving
{
  TKeyValueObserver *end;
  TKeyValueObserver *begin;

  end = self->_observers.__end_;
  begin = self->_observers.__begin_;
  while (end != begin)
    TKeyValueObserver::~TKeyValueObserver((TKeyValueObserver *)((char *)end - 40));
  self->_observers.__end_ = begin;
}

- (void)progressChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id from;
  __CFString *v25;
  TProgressMap *v26;
  __int128 v27;
  _QWORD block[4];
  id v29;
  TString v30;
  TProgressMap *v31;
  __int128 v32;
  id to;
  __CFString *v34;
  TProgressMap *v35;
  __int128 v36;
  id location;
  TString v38;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB30F8]);

    if (v7)
    {
      -[DSFileProgress progressNode](self, "progressNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "userInfo");
        v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        OperationTypeFromProgress(v9, &v38);

        objc_msgSend(v5, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0CB30C8];
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        static_objc_cast<NSString,objc_object * {__strong}>(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB30B8]);

        objc_msgSend(v5, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        static_objc_cast<NSString,objc_object * {__strong}>(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB30E0]);

        objc_msgSend(v5, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3070]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        static_objc_cast<NSString,objc_object * {__strong}>(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        objc_initWeak(&location, v8);
        objc_copyWeak(&to, &location);
        v34 = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable((TString *)&v34, (TString *)v38.fString.fRef);
        v35 = v5;
        LOBYTE(v36) = v14;
        BYTE1(v36) = v11;
        *((_QWORD *)&v36 + 1) = v22;
        TProgressMap::GetProgressDispatchQueue(v35);
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3321888768;
        block[2] = __34__DSFileProgress_progressChanged___block_invoke;
        block[3] = &__block_descriptor_72_ea8_32c47_ZTSKZ34__DSFileProgress_progressChanged__E3__3_e5_v8__0l;
        objc_copyWeak(&from, &to);
        v25 = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable((TString *)&v25, (TString *)v34);
        v26 = v35;
        v27 = v36;
        objc_copyWeak(&v29, &from);
        v30.fString.fRef = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable(&v30, (TString *)v25);
        v31 = v26;
        v32 = v27;
        dispatch_async(v23, block);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v25);
        objc_destroyWeak(&from);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
        objc_destroyWeak(&v29);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v34);
        objc_destroyWeak(&to);
        objc_destroyWeak(&location);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v38.fString.fRef);
      }

    }
  }

}

void __34__DSFileProgress_progressChanged___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  TString v5;
  id v6;
  __int128 v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3321888768;
  v3[2] = ___ZZ34__DSFileProgress_progressChanged__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
  v3[3] = &__block_descriptor_72_ea8_32c47_ZTSKZ34__DSFileProgress_progressChanged__E3__2_e5_v8__0l;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v5, *(TString **)(a1 + 40));
  v6 = *(id *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 56);
  v2 = (void *)MEMORY[0x1D17A5A30](v3);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v5.fString.fRef);
  objc_destroyWeak(&v4);
  ExceptionSafeBlock(v2);

}

- (uint64_t)progressChanged:(uint64_t)a1
{

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)(a1 + 8));
  objc_destroyWeak((id *)a1);
  return a1;
}

- (FINode)progressNode
{
  return (FINode *)objc_loadWeakRetained((id *)&self->_progressNode);
}

- (void)setProgressNode:(id)a3
{
  objc_storeWeak((id *)&self->_progressNode, a3);
}

- (void).cxx_destruct
{
  vector<TKeyValueObserver, std::allocator<TKeyValueObserver>> *p_observers;

  objc_destroyWeak((id *)&self->_progressNode);
  p_observers = &self->_observers;
  std::vector<TKeyValueObserver>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_observers);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (uint64_t)startObserving:
{
    return a1 + 8;
  else
    return 0;
}

- (void)startObserving:
{
}

- (id)startObserving:
{
  id result;

  *(_QWORD *)a2 = &off_1E874EAA8;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  result = *(id *)(a1 + 16);
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

@end
