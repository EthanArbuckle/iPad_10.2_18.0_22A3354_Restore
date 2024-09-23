@implementation NEAppProxyProviderContainer

- (NEAppProxyProviderContainer)initWithDelegate:(id)a3 providerClass:(Class)a4
{
  id v7;
  NEAppProxyProviderContainer *v8;
  Class Superclass;
  NSObject *v10;
  NEAppProxyProviderContainer *v11;
  NEAppProxyProvider *v12;
  NEAppProxyProvider *provider;
  objc_super v15;
  uint8_t buf[4];
  NEAppProxyProviderContainer *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEAppProxyProviderContainer;
  v8 = -[NEAppProxyProviderContainer init](&v15, sel_init);
  if (!v8)
    goto LABEL_7;
  Superclass = class_getSuperclass(a4);
  if (Superclass == (Class)objc_opt_class())
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    v12 = (NEAppProxyProvider *)objc_alloc_init(a4);
    provider = v8->_provider;
    v8->_provider = v12;

    -[NEProvider setdefaultPathObserver:](v8->_provider, "setdefaultPathObserver:", v8);
LABEL_7:
    v11 = v8;
    goto LABEL_8;
  }
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_INFO, "%@: failed to init, providerClass is not subclass of NEAppProxyProvider", buf, 0xCu);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  -[NEProvider observerHelperHandler:ofObject:change:context:](self->_provider, "observerHelperHandler:ofObject:change:context:", a3, a4, a5, a6);
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAppProxyProviderContainer provider](self, "provider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepWithCompletionHandler:", v4);

}

- (void)wake
{
  id v2;

  -[NEAppProxyProviderContainer provider](self, "provider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wake");

}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NEAppProxyProviderContainer *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Calling startProxyWithOptions with options %p", buf, 0x16u);
  }

  if (self)
    objc_setProperty_atomic_copy(self, v9, v7, 48);
  -[NEAppProxyProviderContainer provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E3CC45C8;
  v11[4] = self;
  objc_msgSend(v10, "startProxyWithOptions:completionHandler:", v6, v11);

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  NEAppProxyProviderContainer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: Calling stopProxyWithReason", buf, 0xCu);
  }

  -[NEAppProxyProviderContainer provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NEAppProxyProviderContainer_stop__block_invoke;
  v5[3] = &unk_1E3CC41F0;
  v5[4] = self;
  objc_msgSend(v4, "stopProxyWithReason:completionHandler:", 0, v5);

}

- (void)setDelegateInterface:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NEAppProxyProviderContainer *v7;
  __int16 v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Setting flow divert delegate interface to %u", (uint8_t *)&v6, 0x12u);
  }

  if (self)
  {
    self->_delegateInterfaceIndex = a3;
    if (self->_director)
      NEFlowDirectorSetDelegateInterface();
  }
}

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  const char *v8;
  dispatch_queue_t v9;
  SEL v10;
  id Property;
  id v12;
  _NEFlowDirector *v13;
  void *v14;
  id v15[10];
  id v16;
  id location;
  uint8_t buf[4];
  NEAppProxyProviderContainer *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2048;
    v21 = v4;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Setting initial flow divert control socket to %p", buf, 0x16u);
  }

  dup(objc_msgSend(v4, "fileDescriptor"));
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("NEFlow queue", v6);
  v9 = v7;
  if (self)
  {
    objc_setProperty_atomic(self, v8, v7, 32);

    Property = objc_getProperty(self, v10, 32, 1);
  }
  else
  {

    Property = 0;
  }
  v12 = Property;
  v13 = (_NEFlowDirector *)NEFlowDirectorCreate();
  if (self)
  {
    self->_director = v13;

    if (self->_director)
    {
      if (self->_delegateInterfaceIndex)
        NEFlowDirectorSetDelegateInterface();
      v14 = (void *)MEMORY[0x1E0C809B0];
      v15[6] = (id)MEMORY[0x1E0C809B0];
      v15[7] = (id)3221225472;
      v15[8] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke;
      v15[9] = &unk_1E3CC39A8;
      objc_copyWeak(&v16, &location);
      NEFlowDirectorSetOpenControlSocketCallback();
      v15[1] = v14;
      v15[2] = (id)3221225472;
      v15[3] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2;
      v15[4] = &unk_1E3CBF440;
      v15[5] = self;
      NEFlowDirectorSetMatchRulesCallback();
      objc_copyWeak(v15, &location);
      NEFlowDirectorSetNewFlowCallback();
      objc_destroyWeak(v15);
      objc_destroyWeak(&v16);
    }
  }
  else
  {

  }
  objc_destroyWeak(&location);

}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEAppProxyProviderContainer provider](self, "provider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleAppMessage:completionHandler:", v7, v6);

}

- (NEAppProxyProvider)provider
{
  return (NEAppProxyProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_flowQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke(uint64_t a1)
{
  const char *v1;
  id self;

  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
    objc_msgSend(objc_getProperty(self, v1, 24, 1), "container:didRequestFlowDivertControlSocketWithCompletionHandler:");

}

uint64_t __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = a4;
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Verifying app with signing identifier %@", (uint8_t *)&v9, 0x16u);
  }

  return NEFlowDirectorHandleMatchRulesResult();
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void (**v6)(id, uint64_t);
  uint64_t FlowType;
  uint64_t v8;
  __objc2_class **v9;
  id v10;
  SEL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id self;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a3;
  self = objc_loadWeakRetained(v4);
  v6 = (void (**)(id, uint64_t))v5;
  if (self)
  {
    FlowType = NEFlowGetFlowType();
    if (FlowType == 1)
    {
      v9 = off_1E3CBB6B8;
    }
    else
    {
      v8 = FlowType;
      if (FlowType != 2)
      {
        ne_log_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v17 = v8;
          _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "Unknown flow type %ld", buf, 0xCu);
        }
        goto LABEL_11;
      }
      v9 = off_1E3CBB6C0;
    }
    v10 = objc_alloc(*v9);
    v12 = objc_msgSend(v10, "initWithNEFlow:queue:", a2, objc_getProperty(self, v11, 32, 1));
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v17 = (uint64_t)self;
      v18 = 2112;
      v19 = v12;
      _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "%@: Calling handleNewFlow with %@", buf, 0x16u);
    }

    objc_msgSend(self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, objc_msgSend(v14, "handleNewFlow:", v12));

LABEL_11:
  }

}

void __58__NEAppProxyProviderContainer_flowDivertOpenControlSocket__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = dup(objc_msgSend(v3, "fileDescriptor"));
  else
    v5 = -1;
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Received new flow divert control socket %d", (uint8_t *)&v9, 0x12u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8 && *(_QWORD *)(v8 + 40))
    NEFlowDirectorHandleNewControlSocket();

}

void __35__NEAppProxyProviderContainer_stop__block_invoke(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  id Property;
  const char *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    if (v3[5])
    {
      NEFlowDirectorDestroy();
    }
    else if (objc_getProperty(v3, a2, 48, 1))
    {
      ne_log_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler", buf, 0xCu);
      }

      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 48, 1);
      (*((void (**)(id, _QWORD))Property + 2))(Property, 0);
      v9 = *(void **)(a1 + 32);
      if (v9)
        objc_setProperty_atomic_copy(v9, v8, 0, 48);
    }
  }
}

void __35__NEAppProxyProviderContainer_stop__block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  id Property;
  const char *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    *(_QWORD *)(v2 + 40) = 0;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (objc_getProperty(v4, a2, 48, 1))
      {
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *(_QWORD *)(a1 + 32);
          v11 = 138412290;
          v12 = v6;
          _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler", (uint8_t *)&v11, 0xCu);
        }

        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v7, 48, 1);
        (*((void (**)(id, _QWORD))Property + 2))(Property, 0);
        v10 = *(void **)(a1 + 32);
        if (v10)
          objc_setProperty_atomic_copy(v10, v9, 0, 48);
      }
    }
  }
}

void __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id Property;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (!v6)
    NEFlowDirectorStart();
  Property = *(id *)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, v3, 24, 1);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(Property, "container:didStartWithError:", v5, v6);

}

@end
