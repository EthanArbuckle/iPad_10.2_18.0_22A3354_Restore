@implementation AnalyticsConfigurationObserver

- (AnalyticsConfigurationObserver)init
{
  AnalyticsConfigurationObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsConfigurationObserver;
  v2 = -[AnalyticsConfigurationObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.CoreAnalytics.ConfigurationObserver", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[AnalyticsConfigurationObserver setDelegate:](v2, "setDelegate:", 0);
    -[AnalyticsConfigurationObserver setDelegateQueue:](v2, "setDelegateQueue:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AnalyticsConfigurationObserver;
  -[AnalyticsConfigurationObserver dealloc](&v3, sel_dealloc);
}

- (void)setConfigurationObserverDelegate:(id)a3 queue:(id)a4
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
  -[AnalyticsConfigurationObserver queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke;
  v11[3] = &unk_1E4DEBD70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, v11);

}

uint64_t __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

- (BOOL)startObservingConfigurationType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CASPIEnter();
  -[AnalyticsConfigurationObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke;
  block[3] = &unk_1E4DEBE90;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, block);

  return 1;
}

void __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke(uint64_t a1)
{
  char *v2;
  void *v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  std::string *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  CoreAnalytics::Client *v17;
  uint64_t *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  unint64_t *p_shared_weak_owners;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  void *__p[2];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)operator new(0x50uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = &off_1E4DEBB18;
  std::string::basic_string[abi:ne180100]<0>(__p, v2);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  *((_QWORD *)v5 + 3) = off_1E4DEB838;
  v12 = (std::string *)(v5 + 32);
  if (SHIBYTE(v27) < 0)
  {
    std::string::__init_copy_ctor_external(v12, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)v5 + 6) = v27;
  }
  objc_initWeak((id *)v5 + 7, v9);
  objc_initWeak((id *)v5 + 8, v10);
  *((_QWORD *)v5 + 9) = v11;

  if (SHIBYTE(v27) < 0)
    operator delete(__p[0]);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(std::__shared_weak_count **)(v13 + 16);
  *(_QWORD *)(v13 + 8) = v5 + 24;
  *(_QWORD *)(v13 + 16) = v5;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  v18 = CoreAnalytics::Client::get(v17);
  v19 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(v19 + 8);
  v20 = *(std::__shared_weak_count **)(v19 + 16);
  v24 = v21;
  v25 = v20;
  if (v20)
  {
    p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
    do
      v23 = __ldxr(p_shared_weak_owners);
    while (__stxr(v23 + 1, p_shared_weak_owners));
  }
  CoreAnalytics::Client::registerConfigurationObserver((NSObject **)v18, (uint64_t)&v24);
  if (v25)
    std::__shared_weak_count::__release_weak(v25);
}

- (BOOL)stopObservingConfigurationType:(id)a3
{
  NSObject *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  -[AnalyticsConfigurationObserver queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke;
  v6[3] = &unk_1E4DEBD98;
  v6[4] = self;
  dispatch_barrier_async(v4, v6);

  return 1;
}

void __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (AnalyticsConfigurationObserverDelegate)delegate
{
  return (AnalyticsConfigurationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
