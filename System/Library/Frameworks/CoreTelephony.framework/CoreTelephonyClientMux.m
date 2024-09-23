@implementation CoreTelephonyClientMux

- (CoreTelephonyClientMux)init
{
  MuxNotificationSink *v3;
  CoreTelephonyClientMux *v4;

  v3 = [MuxNotificationSink alloc];
  v4 = -[CoreTelephonyClientMux initWithSink:](self, "initWithSink:", v3);

  return v4;
}

- (id)sink:(dispatch_queue_s *) handleNotification:(std::unique_ptr<-[CoreTelephonyClientMux)sink:handleNotification:]::$_2>
{
  id *v2;

  v2 = a1;
  objc_msgSend(a1[1], "invokeWithTarget:", *a1);
  return std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v2);
}

- (void)sink:(id)a3 handleNotification:(id)a4
{
  id v6;
  void *v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t **v10;
  id WeakRetained;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  BOOL v15;
  NSInvocation *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD *v21;
  NSObject *v22;
  _BYTE *v23;
  id v24;
  uint8_t v25;
  _BYTE v26[7];
  id *v27;
  id *v28;

  v24 = a3;
  v6 = a4;
  objc_msgSend(*((id *)self + 8), "handleNotification:", v6);
  NSStringFromSelector((SEL)objc_msgSend(v6, "selector"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (uint64_t **)*((_QWORD *)self + 1);
  v8 = (uint64_t **)((char *)self + 8);
  v9 = (uint64_t *)v10;
  if (v10 != v8 + 1)
  {
    v23 = v26;
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)v9 + 6);
      if (WeakRetained)
      {
        v12 = (uint64_t *)v9[1];
        v13 = v9;
        if (v12)
        {
          do
          {
            v14 = v12;
            v12 = (uint64_t *)*v12;
          }
          while (v12);
        }
        else
        {
          do
          {
            v14 = (uint64_t *)v13[2];
            v15 = *v14 == (_QWORD)v13;
            v13 = v14;
          }
          while (!v15);
        }
        if ((objc_msgSend((id)v9[7], "containsObject:", v7, v23, v24) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "retainArguments");
          v18 = WeakRetained;
          v19 = v9[5];
          v20 = v17;
          v21 = (_QWORD *)operator new();
          *v21 = v18;
          v21[1] = v20;
          v27 = 0;
          v28 = 0;
          dispatch_async_f(v19, v21, (dispatch_function_t)dispatch::async<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>)::{lambda(void *)#1}::__invoke);

          std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v27);
          std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v28);
        }
      }
      else
      {
        v22 = CTLogClient();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[CoreTelephonyClientMux sink:handleNotification:].cold.1(&v25, v23, v22);
      }

      v9 = v14;
    }
    while (v14 != (uint64_t *)(v8 + 1));
  }

}

- (uint64_t)addDelegate:(dispatch_queue_s *) queue:(std::unique_ptr<-[CoreTelephonyClientMux)addDelegate:queue:]::$_0>
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  char *v10;
  Protocol *v11;
  Protocol **v12;
  unint64_t v13;
  Protocol *v14;
  id *v15;
  id *v16;
  Protocol *v17;
  BOOL *v18;
  objc_method_description *v19;
  objc_method_description *v20;
  BOOL v21;
  unint64_t v22;
  SEL *p_name;
  void *v24;
  _QWORD **v25;
  id *v26;
  id **v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  BOOL v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  id **v38;
  unint64_t v39;
  dispatch_object_t v40;
  NSObject *v41;
  id v42;
  id v43;
  void *v44;
  id *v45;
  dispatch_object_t v46;
  id v47;
  _QWORD *v48;
  id v50;
  Protocol *v51;
  void *v52;
  id *v53;
  uint64_t v54;
  dispatch_object_t object;
  id v56;
  id v57;
  id *v58;
  id *v59;
  _QWORD *v60;
  char *v61;
  char *v62;
  char *v63;
  unsigned int v64[2];
  unsigned int outCount[2];

  v54 = a1;
  v2 = *(NSObject **)(a1 + 16);
  if (v2)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v56 = 0;
  v57 = 0;
  v3 = *(id *)(a1 + 8);
  object = v2;
  objc_initWeak(&v56, v3);
  v4 = &unk_1EDD12A88;
  v5 = v3;
  v6 = (void *)objc_opt_new();
  v7 = &unk_1EDD0F580;
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v8 = operator new(8uLL);
  v58 = (id *)v8;
  v60 = v8 + 1;
  v9 = v7;
  *v8 = v9;
  v59 = (id *)(v8 + 1);
  v50 = v4;
  v10 = (char *)operator new(8uLL);
  v61 = v10;
  *(_QWORD *)v10 = v50;
  v62 = v10 + 8;
  v63 = v10 + 8;
  v11 = (Protocol *)v50;
  outCount[0] = 0;
  v12 = protocol_copyProtocolList(v11, outCount);
  if (v12 && outCount[0])
  {
    v13 = 0;
    do
    {
      v14 = v12[v13];
      *(_QWORD *)v64 = v14;
      v15 = v58;
      if (v58 != v59)
      {
        while (*v15 != v14)
        {
          if (++v15 == v59)
          {
            v15 = v59;
            break;
          }
        }
      }
      if (v15 == v59)
      {
        std::vector<Protocol * {__strong}>::push_back[abi:nn180100](&v61, (id *)v64);
        v14 = *(Protocol **)v64;
      }

      ++v13;
    }
    while (v13 < outCount[0]);
    free(v12);
  }
  v51 = v11;
  v52 = v9;

  v16 = (id *)v61;
  v53 = (id *)v62;
  if (v61 != v62)
  {
    do
    {
      v17 = (Protocol *)*v16;
      do
      {
        v64[0] = 0;
        v19 = protocol_copyMethodDescriptionList(v17, *v18, v18[1], v64);
        v20 = v19;
        if (v19)
          v21 = v64[0] == 0;
        else
          v21 = 1;
        if (!v21)
        {
          v22 = 0;
          p_name = &v19->name;
          do
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              NSStringFromSelector(*p_name);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v24);

            }
            ++v22;
            p_name += 2;
          }
          while (v22 < v64[0]);
          free(v20);
        }
        v18 += 2;
      }
      while (v18 != (BOOL *)&jpt_1842F4088);

      ++v16;
    }
    while (v16 != v53);
  }
  *(_QWORD *)outCount = &v61;
  std::vector<Protocol * {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)outCount);

  v61 = (char *)&v58;
  std::vector<Protocol * {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v61);

  v57 = v6;
  v25 = *(_QWORD ***)a1;
  v27 = (id **)(*(_QWORD *)a1 + 16);
  v26 = *v27;
  if (!*v27)
  {
    v29 = *(_QWORD *)a1 + 16;
    if (v25[1] == v27)
    {
      v34 = 0;
      v29 = *(_QWORD *)a1 + 16;
      v36 = (_QWORD *)v29;
      goto LABEL_60;
    }
    goto LABEL_44;
  }
  v28 = *(_QWORD *)(a1 + 8);
  v29 = *(_QWORD *)a1 + 16;
  v30 = *(_QWORD **)v29;
  do
  {
    v31 = v30[4];
    v32 = v31 >= v28;
    if (v31 >= v28)
      v33 = v30;
    else
      v33 = v30 + 1;
    if (v32)
      v29 = (uint64_t)v30;
    v30 = (_QWORD *)*v33;
  }
  while (*v33);
  if ((id **)v29 == v27 || v28 < *(_QWORD *)(v29 + 32))
  {
    v34 = *(_QWORD **)v29;
    if (v25[1] == (_QWORD *)v29)
    {
      v36 = (_QWORD *)v29;
      goto LABEL_60;
    }
    if (v34)
    {
      v35 = *(_QWORD **)v29;
      do
      {
        v36 = v35;
        v35 = (_QWORD *)v35[1];
      }
      while (v35);
      goto LABEL_47;
    }
LABEL_44:
    v36 = (_QWORD *)v29;
    do
    {
      v37 = v36;
      v36 = (_QWORD *)v36[2];
    }
    while ((_QWORD *)*v36 == v37);
    v34 = 0;
    v28 = *(_QWORD *)(a1 + 8);
LABEL_47:
    if (v36[4] >= v28)
    {
      if (v26)
      {
        do
        {
          while (1)
          {
            v38 = (id **)v26;
            v39 = (unint64_t)v26[4];
            if (v28 >= v39)
              break;
            v26 = *v38;
            if (!*v38)
            {
              v27 = v38;
              goto LABEL_69;
            }
          }
          if (v39 >= v28)
            goto LABEL_72;
          v26 = v38[1];
        }
        while (v26);
        v27 = v38 + 1;
      }
      else
      {
        v38 = (id **)(*(_QWORD *)a1 + 16);
      }
LABEL_69:
      v45 = (id *)operator new(0x40uLL);
      v46 = object;
      v45[4] = (id)v28;
      v45[5] = v46;
      object = 0;
      objc_moveWeak(v45 + 6, &v56);
      v47 = v57;
      v57 = 0;
      v45[7] = v47;
      *v45 = 0;
      v45[1] = 0;
      v45[2] = v38;
      *v27 = v45;
      v48 = (_QWORD *)*v25[1];
      if (v48)
      {
        v25[1] = v48;
        v45 = *v27;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v25[2], (uint64_t *)v45);
      v25[3] = (_QWORD *)((char *)v25[3] + 1);
      goto LABEL_72;
    }
LABEL_60:
    if (v34)
      v27 = (id **)(v36 + 1);
    else
      v27 = (id **)v29;
    if (*v27)
      goto LABEL_72;
    if (v34)
      v38 = (id **)v36;
    else
      v38 = (id **)v29;
    v28 = *(_QWORD *)(a1 + 8);
    goto LABEL_69;
  }
  v40 = object;
  object = 0;
  v41 = *(NSObject **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v40;
  if (v41)
    dispatch_release(v41);
  v42 = objc_loadWeakRetained(&v56);
  objc_storeWeak((id *)(v29 + 48), v42);

  v43 = v57;
  v57 = 0;
  v44 = *(void **)(v29 + 56);
  *(_QWORD *)(v29 + 56) = v43;

LABEL_72:
  objc_msgSend(*(id *)a1, "_computeNotificationSet_sync:", &__block_literal_global_951);

  objc_destroyWeak(&v56);
  if (object)
    dispatch_release(object);
  return std::unique_ptr<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>::~unique_ptr[abi:nn180100](&v54);
}

- (void)_computeNotificationSet_sync:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CoreTelephonyClientMux *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CoreTelephonyClientMux *v14;
  CoreTelephonyClientMux *v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  _BYTE buf[24];
  id v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*((_QWORD *)self + 3))
  {
    v20 = v4;
    v7 = (void *)objc_opt_new();
    v8 = (CoreTelephonyClientMux *)*((_QWORD *)self + 1);
    if (v8 != (CoreTelephonyClientMux *)((char *)self + 16))
    {
      do
      {
        *(_QWORD *)&buf[16] = 0;
        v27 = 0;
        v9 = *((_QWORD *)v8 + 5);
        *(_QWORD *)buf = *((_QWORD *)v8 + 4);
        *(_QWORD *)&buf[8] = v9;
        if (v9)
          dispatch_retain(v9);
        objc_copyWeak((id *)&buf[16], (id *)v8 + 6);
        v27 = *((id *)v8 + 7);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v27;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v11);
        }

        objc_destroyWeak((id *)&buf[16]);
        if (*(_QWORD *)&buf[8])
          dispatch_release(*(dispatch_object_t *)&buf[8]);
        v14 = (CoreTelephonyClientMux *)*((_QWORD *)v8 + 1);
        if (v14)
        {
          do
          {
            v15 = v14;
            v14 = *(CoreTelephonyClientMux **)v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            v15 = (CoreTelephonyClientMux *)*((_QWORD *)v8 + 2);
            v16 = *(_QWORD *)v15 == (_QWORD)v8;
            v8 = v15;
          }
          while (!v16);
        }
        v8 = v15;
      }
      while (v15 != (CoreTelephonyClientMux *)((char *)self + 16));
    }
    if (isFrameworkLoggingSupported())
    {
      v17 = CTLogClient();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v7, "count");
        v19 = *((_QWORD *)self + 3);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_18425C000, v17, OS_LOG_TYPE_INFO, "Found %lu implemented methods in %zu delegates", buf, 0x16u);
      }
    }
    -[CoreTelephonyClientMux _registerForNotifications_sync:shouldForce:completion:](self, "_registerForNotifications_sync:shouldForce:completion:", v7, v20, v6);

  }
  else
  {
    -[CoreTelephonyClientMux _registerForNotifications_sync:shouldForce:completion:](self, "_registerForNotifications_sync:shouldForce:completion:", 0, v4, v6);
  }

}

- (void)_registerForNotifications_sync:(id)a3 shouldForce:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (a4 || !objc_msgSend(*((id *)self + 4), "isEqualToSet:", v9))
  {
    -[CoreTelephonyClientMux proxyWithErrorHandler_sync:](self, "proxyWithErrorHandler_sync:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if (isFrameworkLoggingSupported())
    {
      v14 = CTLogClient();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_18425C000, v14, OS_LOG_TYPE_DEFAULT, "Sending selectors to server: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    objc_msgSend(v12, "registerForNotifications:completion:", v13, v10);
    objc_storeStrong((id *)self + 4, a3);

  }
  else if (isFrameworkLoggingSupported())
  {
    v11 = CTLogClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CoreTelephonyClientMux _registerForNotifications_sync:shouldForce:completion:].cold.1();
  }

}

- (void)_computeNotificationSet_sync:(id)a3
{
  -[CoreTelephonyClientMux _computeNotificationSet_sync:completion:](self, "_computeNotificationSet_sync:completion:", 0, a3);
}

- (void)addDelegate:(id)a3 queue:(queue)a4
{
  id v6;
  CoreTelephonyClientMux *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  CoreTelephonyClientMux *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = self;
  v8 = v6;
  v9 = *(NSObject **)a4.fObj.fObj;
  if (v9)
    dispatch_retain(v9);
  v10 = *((_QWORD *)v7 + 10);
  v11 = (_QWORD *)operator new();
  *v11 = v7;
  v11[1] = v8;
  v11[2] = v9;
  v13 = 0;
  v14 = 0;
  v12 = v7;
  dispatch_async_f(v10, v11, (dispatch_function_t)dispatch::async<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>::~unique_ptr[abi:nn180100](&v13);
  std::unique_ptr<-[CoreTelephonyClientMux addDelegate:queue:]::$_0>::~unique_ptr[abi:nn180100](&v14);

}

- (CoreTelephonyClientMux)initWithSink:(id)a3
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CoreTelephonyClientMux;
  v6 = -[CoreTelephonyClientMux init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.CoreTelephonyClientMux.xpc.%p"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v11 = dispatch_queue_create(v8, v10);
    v12 = *((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v11;
    if (v12)
      dispatch_release(v12);
    objc_storeStrong((id *)v6 + 12, a3);
    objc_msgSend(*((id *)v6 + 12), "setDelegate:", v6);
    v13 = objc_opt_new();
    v14 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v13;

    objc_msgSend(v6, "_initializeConnection_sync");
  }

  return (CoreTelephonyClientMux *)v6;
}

- (id)proxyWithErrorHandler_sync:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CoreTelephonyClientMux _setReconnectError_sync:](self, "_setReconnectError_sync:", 0);
  -[CoreTelephonyClientMux _ensureConnectionSetup_sync](self, "_ensureConnectionSetup_sync");
  objc_msgSend(*((id *)self + 9), "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_ensureConnectionSetup_sync:(BOOL)a3
{
  _BOOL4 v3;

  if (!*((_QWORD *)self + 9))
  {
    v3 = a3;
    -[CoreTelephonyClientMux _connect_sync](self, "_connect_sync");
    if (v3)
      -[CoreTelephonyClientMux _computeNotificationSetForced_sync](self, "_computeNotificationSetForced_sync");
  }
}

- (void)_setReconnectError_sync:(id)a3
{
  objc_storeStrong((id *)self + 13, a3);
}

- (void)_ensureConnectionSetup_sync
{
  -[CoreTelephonyClientMux _ensureConnectionSetup_sync:](self, "_ensureConnectionSetup_sync:", 1);
}

- (void)_initializeConnection_sync
{
  -[CoreTelephonyClientMux _ensureConnectionSetup_sync:](self, "_ensureConnectionSetup_sync:", 0);
}

- (void)_connect_sync
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_queue_get_label(*a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_18425C000, a2, v3, "New connection has been initialized with queue: %s", v4);
}

- (id)proxyWithQueue:(queue)a3 errorHandler:(id)a4
{
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  CoreTelephonyClientMux *v12;
  _QWORD block[5];

  v12 = self;
  v10 = 0;
  v11 = a4;
  v9[0] = &v12;
  v9[1] = &v10;
  v9[2] = a3.fObj.fObj;
  v9[3] = &v11;
  v6 = *((_QWORD *)self + 10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ54__CoreTelephonyClientMux_proxyWithQueue_errorHandler__E3__3EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v9;
  dispatch_sync(v6, block);
  v7 = v10;

  return v7;
}

- (id)synchronousProxyWithErrorHandler:(id)a3
{
  NSObject *v5;
  id v6;
  id v8[2];
  id v9;
  id v10;
  _QWORD block[5];

  v10 = 0;
  v8[0] = self;
  v8[1] = &v10;
  v9 = _Block_copy(a3);
  v5 = *((_QWORD *)self + 10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ59__CoreTelephonyClientMux_synchronousProxyWithErrorHandler__E3__4EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v8;
  dispatch_sync(v5, block);

  v6 = v10;
  return v6;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (id)removeDelegate:(dispatch_queue_s *)
{
  unint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t **v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  id *v12;

  v12 = (id *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = (uint64_t *)(*(_QWORD *)a1 + 16);
  v4 = (_QWORD *)*v3;
  if (!*v3)
    goto LABEL_19;
  v5 = (uint64_t **)(*(_QWORD *)a1 + 8);
  v6 = v3;
  do
  {
    v7 = v4[4];
    v8 = v7 >= v2;
    if (v7 >= v2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != v3 && v2 >= v6[4])
  {
  }
  else
  {
LABEL_19:
    if (v2)
    {
      v10 = CTLogClient();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        dispatch::async<-[CoreTelephonyClientMux removeDelegate:]::$_1>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>)::{lambda(void *)#1}::__invoke();
    }
  }
  objc_msgSend(*(id *)a1, "_computeNotificationSet_sync:", &__block_literal_global_954);
  return std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>::~unique_ptr[abi:nn180100](&v12);
}

- (void)removeDelegate:(id)a3
{
  CoreTelephonyClientMux *v5;
  NSObject *v6;
  _QWORD *v7;
  CoreTelephonyClientMux *v8;
  id *v9;
  id *v10;

  v5 = self;
  v6 = *((_QWORD *)self + 10);
  v7 = (_QWORD *)operator new();
  *v7 = v5;
  v7[1] = a3;
  v9 = 0;
  v10 = 0;
  v8 = v5;
  dispatch_async_f(v6, v7, (dispatch_function_t)dispatch::async<-[CoreTelephonyClientMux removeDelegate:]::$_1>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>::~unique_ptr[abi:nn180100](&v9);
  std::unique_ptr<-[CoreTelephonyClientMux removeDelegate:]::$_1>::~unique_ptr[abi:nn180100](&v10);

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_18425C000, v0, v1, "[XXX] Dealloc CoreTelephonyClientMux", v2);
  OUTLINED_FUNCTION_1_0();
}

- (id)cachedValueForSelector:(SEL)a3
{
  return (id)objc_msgSend(*((id *)self + 8), "valueForSelector:", a3);
}

- (void)cacheValue:(id)a3 forSelector:(SEL)a4
{
  objc_msgSend(*((id *)self + 8), "handleValue:forSelector:", a3, a4);
}

- (void).cxx_destruct
{
  NSObject *v3;

  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  v3 = *((_QWORD *)self + 10);
  if (v3)
    dispatch_release(v3);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  std::__tree<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::__map_value_compare<__CTAssertionType *,std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::less<__CTAssertionType *>,true>,std::allocator<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>>>::destroy((uint64_t)self + 40, *((_QWORD **)self + 6));
  objc_storeStrong((id *)self + 4, 0);
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 8), "handleDisconnection");
    objc_msgSend(v2, "_setReconnectError_sync:", 0);
    if (isFrameworkLoggingSupported())
    {
      v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18425C000, v3, OS_LOG_TYPE_DEFAULT, "Connection has been invalidated", v5, 2u);
      }
    }
    v4 = (void *)v2[9];
    v2[9] = 0;

  }
}

- (CoreTelephonyClientMux)initWithEndpoint:(id)a3 sink:(id)a4
{
  id v6;
  CoreTelephonyClientMux *v7;

  objc_storeStrong((id *)self + 11, a3);
  v6 = a4;
  v7 = -[CoreTelephonyClientMux initWithSink:](self, "initWithSink:", v6);

  return v7;
}

- (void)_computeNotificationSetForced_sync
{
  -[CoreTelephonyClientMux _computeNotificationSet_sync:completion:](self, "_computeNotificationSet_sync:completion:", 1, &__block_literal_global_6);
}

void __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    if (isFrameworkLoggingSupported())
    {
      v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke_cold_1();
    }
  }

}

- (void)_computeNotificationSetForced_sync:(id)a3
{
  -[CoreTelephonyClientMux _computeNotificationSet_sync:completion:](self, "_computeNotificationSet_sync:completion:", 1, a3);
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_408(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  _QWORD *v6;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 8), "handleDisconnection");
    if (v2[13])
    {
      v3 = CTLogClient();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18425C000, v3, OS_LOG_TYPE_DEFAULT, "Reconnection was already attempted", buf, 2u);
      }
    }
    else
    {
      v4 = CTLogClient();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18425C000, v4, OS_LOG_TYPE_DEFAULT, "Connection interrupted. Attempting to reestablish connection", buf, 2u);
      }
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __39__CoreTelephonyClientMux__connect_sync__block_invoke_409;
      v5[3] = &unk_1E1530F00;
      v6 = v2;
      objc_msgSend(v6, "_computeNotificationSetForced_sync:", v5);

    }
  }

}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_409(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setReconnectError_sync:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendConnectionInterruptedNotification_sync:", v3);
  if (v3)
  {
    v4 = CTLogClient();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__CoreTelephonyClientMux__connect_sync__block_invoke_409_cold_1();
  }
  else
  {
    v5 = CTLogClient();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18425C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully reestablished connection", v6, 2u);
    }
  }

}

- (void)_sendConnectionInterruptedNotification_sync:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  CoreTelephonyClientMux *v7;
  const void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  CoreTelephonyClientMux *v14;
  CoreTelephonyClientMux *v15;
  BOOL v16;
  uint8_t v17;
  _BYTE v18[7];
  id *v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CTLogClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *((_QWORD *)self + 7);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_18425C000, v5, OS_LOG_TYPE_DEFAULT, "_sendConnectionInterruptedNotification_sync, Map size = %lu", buf, 0xCu);
  }
  v7 = (CoreTelephonyClientMux *)*((_QWORD *)self + 5);
  if (v7 != (CoreTelephonyClientMux *)((char *)self + 48))
  {
    do
    {
      if (*((_QWORD *)v7 + 4) && (v8 = (const void *)*((_QWORD *)v7 + 6)) != 0 && *((_QWORD *)v7 + 5))
      {
        v9 = _Block_copy(v8);
        v10 = v4;
        v11 = *((_QWORD *)v7 + 5);
        v12 = (_QWORD *)operator new();
        *v12 = v9;
        v12[1] = v10;
        v19 = 0;
        *(_QWORD *)buf = 0;
        dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<-[CoreTelephonyClientMux _sendConnectionInterruptedNotification_sync:]::$_5>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientMux _sendConnectionInterruptedNotification_sync:]::$_5>)::{lambda(void *)#1}::__invoke);
        std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v19);
        std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100]((id **)buf);
      }
      else
      {
        v13 = CTLogClient();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CoreTelephonyClientMux _sendConnectionInterruptedNotification_sync:].cold.1(&v17, v18, v13);
      }
      v14 = (CoreTelephonyClientMux *)*((_QWORD *)v7 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(CoreTelephonyClientMux **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (CoreTelephonyClientMux *)*((_QWORD *)v7 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v7;
          v7 = v15;
        }
        while (!v16);
      }
      v7 = v15;
    }
    while (v15 != (CoreTelephonyClientMux *)((char *)self + 48));
  }

}

- (void)removeAssertionForInvalidationNotification:(__CTAssertionType *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7[2];
  _QWORD block[5];

  if (a3)
  {
    v7[0] = self;
    v7[1] = a3;
    v5 = *((_QWORD *)self + 10);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN8dispatch9sync_implIZ69__CoreTelephonyClientMux_removeAssertionForInvalidationNotification__E3__6EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v7;
    dispatch_sync(v5, block);

  }
  else if (isFrameworkLoggingSupported())
  {
    v6 = CTLogClient();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CoreTelephonyClientMux removeAssertionForInvalidationNotification:].cold.1();
  }
}

- (unint64_t)_getAssertionTypeId
{
  if (-[CoreTelephonyClientMux _getAssertionTypeId]::_predicate != -1)
    dispatch_once_f(&-[CoreTelephonyClientMux _getAssertionTypeId]::_predicate, 0, (dispatch_function_t)-[CoreTelephonyClientMux _getAssertionTypeId]::$_7::__invoke);
  return -[CoreTelephonyClientMux _getAssertionTypeId]::_CTAssertionConnectionTypeID;
}

- (__CTAssertionType)createCTAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 proxy:(id)a5
{
  id v8;
  uint64_t Instance;
  __CTAssertionType *v10;
  NSObject *v11;

  v8 = a5;
  -[CoreTelephonyClientMux _getAssertionTypeId](self, "_getAssertionTypeId");
  Instance = _CFRuntimeCreateInstance();
  v10 = (__CTAssertionType *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 32) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    objc_storeStrong((id *)(Instance + 16), a5);
    v10->var3 = a3;
    objc_storeWeak(&v10->var2, self);
  }
  else if (isFrameworkLoggingSupported())
  {
    v11 = CTLogClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CoreTelephonyClientMux createCTAssertionForConnectionType:allocator:proxy:].cold.1();
  }

  return v10;
}

- (void)registerBlockForInvalidationNotification:(__CTAssertionType *)a3 callbackQueue:(queue)a4 callback:(id)a5
{
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12[2];
  id v13;
  dispatch_object_t object;
  _QWORD block[5];

  if (a3 && a5)
  {
    v12[0] = self;
    v12[1] = a3;
    v9 = _Block_copy(a5);
    v10 = *(NSObject **)a4.fObj.fObj;
    v13 = v9;
    object = v10;
    if (v10)
      dispatch_retain(v10);
    v11 = *((_QWORD *)self + 10);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN8dispatch9sync_implIZ90__CoreTelephonyClientMux_registerBlockForInvalidationNotification_callbackQueue_callback__E3__8EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v12;
    dispatch_sync(v11, block);
    if (object)
      dispatch_release(object);

  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)*((_QWORD *)self + 9);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)self + 9, a3);
}

- (queue)xpcQueue
{
  NSObject **v2;
  NSObject *v3;

  v3 = *((_QWORD *)self + 10);
  *v2 = v3;
  if (v3)
    dispatch_retain(v3);
  return (queue)v3;
}

- (void)setXpcQueue:(queue)a3
{
  uint64_t v4;
  NSObject *v5;

  v4 = *(_QWORD *)a3.fObj.fObj;
  if (*(_QWORD *)a3.fObj.fObj)
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  v5 = *((_QWORD *)self + 10);
  *((_QWORD *)self + 10) = v4;
  if (v5)
    dispatch_release(v5);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)*((_QWORD *)self + 11);
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)self + 11, a3);
}

- (MuxNotificationSink)notificationSink
{
  return (MuxNotificationSink *)*((_QWORD *)self + 12);
}

- (void)setNotificationSink:(id)a3
{
  objc_storeStrong((id *)self + 12, a3);
}

- (NSError)reconnectError
{
  return (NSError *)*((_QWORD *)self + 13);
}

- (void)setReconnectError:(id)a3
{
  objc_storeStrong((id *)self + 13, a3);
}

- (uint64_t)_getAssertionTypeId
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  -[CoreTelephonyClientMux _getAssertionTypeId]::_CTAssertionConnectionTypeID = result;
  return result;
}

- (uint64_t)addDelegate:(uint64_t *)a1 queue:
{
  uint64_t v2;
  NSObject *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(NSObject **)(v2 + 16);
    if (v3)
      dispatch_release(v3);

    MEMORY[0x186DBA454](v2, 0xE0C4087BCC992);
  }
  return a1;
}

- (id)removeDelegate:(id *)a1
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x186DBA454](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (id)sink:(id *)a1 handleNotification:
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x186DBA454](v2, 0x80C40803F642BLL);
  }
  return a1;
}

- (id)_sendConnectionInterruptedNotification_sync:(dispatch_queue_s *)
{
  NSObject *v2;
  id *v4;
  uint8_t buf[16];

  v4 = a1;
  if (*a1)
  {
    v2 = CTLogClient();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18425C000, v2, OS_LOG_TYPE_DEFAULT, "_sendConnectionInterruptedNotification_sync invoke callback", buf, 2u);
    }
    (*((void (**)(void))*a1 + 2))();
  }
  return std::unique_ptr<-[CoreTelephonyClientMux sink:handleNotification:]::$_2>::~unique_ptr[abi:nn180100](&v4);
}

- (void)sink:(NSObject *)a3 handleNotification:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_7(&dword_18425C000, a3, (uint64_t)a3, "Invalid delegate when forwarding notification!", a1);
}

void __60__CoreTelephonyClientMux__computeNotificationSetForced_sync__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Updating selectors failed with: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_registerForNotifications_sync:shouldForce:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_18425C000, v0, v1, "Selector set remains unchanged", v2);
  OUTLINED_FUNCTION_1_0();
}

void __39__CoreTelephonyClientMux__connect_sync__block_invoke_409_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Failed to ping server after connection was interrupted: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_sendConnectionInterruptedNotification_sync:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "_sendConnectionInterruptedNotification_sync invalid callback", buf, 2u);
}

- (void)removeAssertionForInvalidationNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "invalid assertion in removeAssertionForInvalidationNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createCTAssertionForConnectionType:allocator:proxy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "CTAssertionTypeRef failed to create", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeDelegate:(dispatch_queue_s *)
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_18425C000, v0, OS_LOG_TYPE_FAULT, "Expected to find delegate to remove", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
