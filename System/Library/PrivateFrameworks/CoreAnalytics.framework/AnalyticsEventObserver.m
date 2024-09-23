@implementation AnalyticsEventObserver

- (BOOL)startObservingEventList:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id *v13;
  id v14;
  id *v15;
  id v16;
  id v17;
  CoreAnalytics::Client *v18;
  uint64_t *v19;
  uint64_t v20;
  id **v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  xpc_object_t v25;
  id v26;
  id v27;
  void *exception;
  _QWORD v30[5];
  id v31;
  void *__p[2];
  char v33;
  xpc_object_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id *v39;
  const char *v40;
  id *v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CASPIEnter();
  v38 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v38);
  v37 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::array::create(&v37);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i));
        applesauce::xpc::object::object((applesauce::xpc::object *)&v39, (const char *)objc_msgSend(v12, "UTF8String"));
        v13 = v39;
        v14 = v37;
        xpc_array_append_value(v14, v13);

        v15 = v39;
        v39 = 0;

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    }
    while (v9);
  }

  applesauce::xpc::object::object((applesauce::xpc::object *)&v35, &v37);
  v39 = &v38;
  v40 = "events";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v39, &v35, &v36);
  v16 = v36;
  v36 = 0;

  v17 = v35;
  v35 = 0;

  v19 = CoreAnalytics::Client::get(v18);
  if (v7)
  {
    v20 = MEMORY[0x1A85A74AC](v7);
    v39 = (id *)&off_1E4DEBA28;
    v40 = (const char *)v20;
    v41 = (id *)&v39;
    CoreAnalytics::Client::registerErrorHandler((NSObject **)v19, (uint64_t)&v39);
    v21 = (id **)v41;
    if (v41 == (id *)&v39)
    {
      v22 = 4;
      v21 = &v39;
    }
    else
    {
      if (!v41)
        goto LABEL_14;
      v22 = 5;
    }
    ((void (*)(void))(*v21)[v22])();
  }
LABEL_14:
  v34 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(__p, "create-event-observer");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v31, &v38);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v19, (uint64_t)__p, &v31, &v34);
  v23 = v31;
  v31 = 0;

  if (v33 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v34) == MEMORY[0x1E0C812F8])
  {
    v39 = &v34;
    v40 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v39))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "create-event-observer failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  -[AnalyticsEventObserver queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__AnalyticsEventObserver_startObservingEventList_withErrorHandler___block_invoke;
  v30[3] = &unk_1E4DEBD98;
  v30[4] = self;
  dispatch_barrier_async(v24, v30);

  v25 = v34;
  v34 = 0;

  v26 = v37;
  v37 = 0;

  v27 = v38;
  v38 = 0;

  return 1;
}

void __39__AnalyticsEventObserver_stopObserving__block_invoke(uint64_t a1)
{
}

- (BOOL)stopObserving
{
  NSObject *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  -[AnalyticsEventObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AnalyticsEventObserver_stopObserving__block_invoke;
  v5[3] = &unk_1E4DEBD98;
  v5[4] = self;
  dispatch_barrier_async(v3, v5);

  return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AnalyticsEventObserver)init
{
  AnalyticsEventObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsEventObserver;
  v2 = -[AnalyticsEventObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.CoreAnalytics.EventObserver", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[AnalyticsEventObserver setDelegate:](v2, "setDelegate:", 0);
    -[AnalyticsEventObserver setDelegateQueue:](v2, "setDelegateQueue:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AnalyticsEventObserver;
  -[AnalyticsEventObserver dealloc](&v3, sel_dealloc);
}

- (void)setEventObserverDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CASPIEnter();
  -[AnalyticsEventObserver queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke;
  v11[3] = &unk_1E4DEBD70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, v11);

}

uint64_t __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

- (BOOL)startObservingEventList:(id)a3
{
  return -[AnalyticsEventObserver startObservingEventList:withErrorHandler:](self, "startObservingEventList:withErrorHandler:", a3, 0);
}

void __67__AnalyticsEventObserver_startObservingEventList_withErrorHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  CoreAnalytics::Client *v13;
  uint64_t *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *p_shared_weak_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "delegateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)operator new(0x38uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = &off_1E4DEBAE0;
  v6 = *(void **)(a1 + 32);
  v7 = v4;
  *((_QWORD *)v5 + 3) = &off_1E4DEB810;
  v8 = v3;
  objc_initWeak((id *)v5 + 4, v6);
  objc_initWeak((id *)v5 + 5, v8);

  *((_QWORD *)v5 + 6) = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(std::__shared_weak_count **)(v9 + 16);
  *(_QWORD *)(v9 + 8) = v5 + 24;
  *(_QWORD *)(v9 + 16) = v5;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  v14 = CoreAnalytics::Client::get(v13);
  v15 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(v15 + 8);
  v16 = *(std::__shared_weak_count **)(v15 + 16);
  v20 = v17;
  v21 = v16;
  if (v16)
  {
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v19 = __ldxr(p_shared_weak_owners);
    while (__stxr(v19 + 1, p_shared_weak_owners));
  }
  CoreAnalytics::Client::registerEventObserver((NSObject **)v14, (uint64_t)&v20);
  if (v21)
    std::__shared_weak_count::__release_weak(v21);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (AnalyticsEventObserverDelegate)delegate
{
  return (AnalyticsEventObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->observer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (uint64_t)startObservingEventList:withErrorHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)startObservingEventList:withErrorHandler:
{
}

- (_QWORD)startObservingEventList:withErrorHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E4DEBA28;
  v2[1] = MEMORY[0x1A85A74AC](*(_QWORD *)(a1 + 8));
  return v2;
}

@end
