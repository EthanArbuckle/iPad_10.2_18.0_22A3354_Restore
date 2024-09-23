@implementation FINodeObserver

void __49__FINodeObserver_observerForFINode_withObserver___block_invoke(uint64_t a1, unint64_t a2)
{
  PullEventsFromQueue(a2);
}

+ (id)propertyName:(unsigned int)a3
{
  id v3;
  id v5;

  TCFURLInfo::PropertyToString(a3, (TString *)&v5);
  v3 = v5;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v5);
  return v3;
}

- (void)startObserving:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FINodeObserver *v10;
  void *v11;
  int parentUbiquityCount;
  _FINullObserver *v13;
  uint64_t v14;
  FINodeObserver *parentObserver;
  int v16;
  FINodeObserver *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  LogObj(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[FINode debugDescription](self->_observedNode, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ShortDescription(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v22 = 1024;
    v23 = v3;
    _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_DEFAULT, "[%@] startObserving %{public}@: '%{public}@' (0x%x)", (uint8_t *)&v16, 0x26u);

  }
  objc_cast<FIDSNode,FINode * {__strong}>(self->_observedNode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "startObserving:with:", v3, self->_notifier);
    if ((v3 & 0x10) != 0 && !-[FINode isFolder](self->_observedNode, "isFolder"))
    {
      v10 = self;
      objc_sync_enter(v10);
      -[FINode fileParent](self->_observedNode, "fileParent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 || v10->_parentObserver)
      {
        parentUbiquityCount = v10->_parentUbiquityCount;
        v10->_parentUbiquityCount = parentUbiquityCount + 1;
        if (!parentUbiquityCount)
        {
          v13 = objc_alloc_init(_FINullObserver);
          +[FINodeObserver observerForFINode:withObserver:](FINodeObserver, "observerForFINode:withObserver:", v11, v13);
          v14 = objc_claimAutoreleasedReturnValue();
          parentObserver = v10->_parentObserver;
          v10->_parentObserver = (FINodeObserver *)v14;

          -[FINodeObserver startObserving:](v10->_parentObserver, "startObserving:", 18);
        }
      }

      objc_sync_exit(v10);
    }
  }

}

+ (id)observerForFINode:(id)a3 withObserver:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  FINodeObserver *v9;
  uint64_t v10;
  id to;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  if ((v8 & 1) == 0
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __49__FINodeObserver_observerForFINode_withObserver___block_invoke;
    v19[3] = &__block_descriptor_33_ea8_32c62_ZTSKZ49__FINodeObserver_observerForFINode_withObserver__E3__1_e27_v16__0__OpaqueEventQueue__8l;
    +[FINodeObserver observerForFINode:withObserver:]::sNodeEventQueue = NodeNewEventQueueWithTickleBlock(v19);
  }
  objc_initWeak(&location, v6);
  objc_initWeak(&from, v7);
  v9 = objc_alloc_init(FINodeObserver);
  objc_storeStrong((id *)&v9->_observedNode, a3);
  v10 = +[FINodeObserver observerForFINode:withObserver:]::sNodeEventQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __49__FINodeObserver_observerForFINode_withObserver___block_invoke_26;
  v14[3] = &__block_descriptor_48_ea8_32c62_ZTSKZ49__FINodeObserver_observerForFINode_withObserver__E3__2_e21_v16__0__FINodeEvent_8l;
  objc_copyWeak(&to, &from);
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v15, &to);
  objc_copyWeak(&v16, &v13);
  v9->_notifier = (OpaqueEventNotifier *)NodeNewChangeHandlerOnQueue(v10, v14, MEMORY[0x1E0C80D38]);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&to);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

void __49__FINodeObserver_observerForFINode_withObserver___block_invoke_26(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_cast<FIDSNode,FINode * {__strong}>(WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v5;
  if (v4 && v5)
    objc_msgSend(v4, "dispatchEvent:forObserver:", v7, v5);

}

+ (id)observerForProxy:(id)a3 subjectNode:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  FINodeObserver *v8;
  uint64_t v9;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];

  v5 = a3;
  v6 = a4;
  if ((v7 & 1) == 0
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3321888768;
    v15[2] = __47__FINodeObserver_observerForProxy_subjectNode___block_invoke;
    v15[3] = &__block_descriptor_33_ea8_32c60_ZTSKZ47__FINodeObserver_observerForProxy_subjectNode__E3__3_e27_v16__0__OpaqueEventQueue__8l;
    +[FINodeObserver observerForProxy:subjectNode:]::sNodeEventQueue = NodeNewEventQueueWithTickleBlock(v15);
  }
  objc_initWeak(&location, v5);
  v8 = objc_alloc_init(FINodeObserver);
  objc_storeStrong((id *)&v8->_observedNode, a4);
  v9 = +[FINodeObserver observerForProxy:subjectNode:]::sNodeEventQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __47__FINodeObserver_observerForProxy_subjectNode___block_invoke_30;
  v12[3] = &__block_descriptor_40_ea8_32c60_ZTSKZ47__FINodeObserver_observerForProxy_subjectNode__E3__4_e21_v16__0__FINodeEvent_8l;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v13, &v11);
  v8->_notifier = (OpaqueEventNotifier *)NodeNewChangeHandlerOnQueue(v9, v12, MEMORY[0x1E0C80D38]);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __47__FINodeObserver_observerForProxy_subjectNode___block_invoke(uint64_t a1, unint64_t a2)
{
  PullEventsFromQueue(a2);
}

void __47__FINodeObserver_observerForProxy_subjectNode___block_invoke_30(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "dispatchNodeEvent:", v3);

}

- (void)stopObserving:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FINodeObserver *v10;
  FINodeObserver *parentObserver;
  int v12;
  FINodeObserver *v13;
  int v14;
  FINodeObserver *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  LogObj(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[FINode debugDescription](self->_observedNode, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ShortDescription(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    v20 = 1024;
    v21 = v3;
    _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_DEFAULT, "[%@] stopObserving %{public}@: '%{public}@' (0x%x)", (uint8_t *)&v14, 0x26u);

  }
  objc_cast<FIDSNode,FINode * {__strong}>(self->_observedNode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "stopObserving:with:", v3, self->_notifier);
    if ((v3 & 0x10) != 0)
    {
      v10 = self;
      objc_sync_enter(v10);
      parentObserver = v10->_parentObserver;
      if (parentObserver)
      {
        v12 = v10->_parentUbiquityCount - 1;
        v10->_parentUbiquityCount = v12;
        if (!v12)
        {
          -[FINodeObserver stopObserving:](parentObserver, "stopObserving:", 18);
          v13 = v10->_parentObserver;
          v10->_parentObserver = 0;

        }
      }
      objc_sync_exit(v10);

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  NodeDisposeNotifier((uint64_t)self->_notifier);
  v3.receiver = self;
  v3.super_class = (Class)FINodeObserver;
  -[FINodeObserver dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  TString *v3;
  __CFString *fRef;
  const __CFAllocator *v5;
  __CFString *MutableCopy;
  TString *v7;
  __CFString *v8;
  CFMutableStringRef v9;
  id v10;
  TString v12;
  TString v13;
  objc_super v14;
  TString v15;
  TString v16;
  id v17;

  v14.receiver = self;
  v14.super_class = (Class)FINodeObserver;
  -[FINodeObserver debugDescription](&v14, sel_debugDescription);
  v3 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  v15.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v15, v3);

  TString::TString(&v13, " ", 1uLL);
  fRef = v15.fString.fRef;
  v16.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, fRef);
  CFRelease(&stru_1E8752DF8);
  v16.fString.fRef = MutableCopy;
  TString::Append(&v16, &v13);
  -[FINode debugDescription](self->_observedNode, "debugDescription");
  v7 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  v12.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v12, v7);

  v8 = v16.fString.fRef;
  v17 = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v9 = CFStringCreateMutableCopy(v5, 0, v8);
  CFRelease(&stru_1E8752DF8);
  v17 = v9;
  TString::Append((TString *)&v17, &v12);
  v10 = v17;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v17);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v12.fString.fRef);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v13.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentObserver, 0);
  objc_storeStrong((id *)&self->_observedNode, 0);
}

@end
