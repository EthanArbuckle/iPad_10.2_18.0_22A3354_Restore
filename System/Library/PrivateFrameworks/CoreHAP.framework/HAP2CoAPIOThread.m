@implementation HAP2CoAPIOThread

- (HAP2CoAPIOThread)initWithQualityOfService:(int64_t)a3 delegate:(id)a4
{
  id v6;
  HAP2CoAPIOThread *v7;
  HAP2CoAPIOThread *v8;
  uint64_t v9;
  HAP2Lock *lock;
  uint64_t v11;
  NSMutableArray *consumerInfo;
  uint64_t v13;
  NSMutableArray *queue;
  uint64_t v15;
  NSMutableArray *messageQueue;
  uint64_t v17;
  NSMutableArray *completedQueue;
  uint64_t v19;
  NSMutableArray *zombieSessions;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableSet *pendingMessages;
  NSObject *v26;
  unint64_t pendingMessagesThreshold;
  int v28;
  void *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  HAP2CoAPIOThread *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  objc_super v43;
  uint8_t v44[4];
  int v45;
  uint8_t buf[4];
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HAP2CoAPIOThread;
  v7 = -[HAP2CoAPIOThread init](&v43, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    +[HAP2Lock lockWithName:](HAP2Lock, "lockWithName:", CFSTR("HAP2CoAPIOThread.lock"));
    v9 = objc_claimAutoreleasedReturnValue();
    lock = v8->_lock;
    v8->_lock = (HAP2Lock *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    consumerInfo = v8->_consumerInfo;
    v8->_consumerInfo = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    messageQueue = v8->_messageQueue;
    v8->_messageQueue = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    completedQueue = v8->_completedQueue;
    v8->_completedQueue = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    zombieSessions = v8->_zombieSessions;
    v8->_zombieSessions = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferenceForKey:", CFSTR("COAPDefaultFlowControlMessageCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "numberValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_pendingMessagesThreshold = objc_msgSend(v23, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v8->_pendingMessagesThreshold);
    v24 = objc_claimAutoreleasedReturnValue();
    pendingMessages = v8->_pendingMessages;
    v8->_pendingMessages = (NSMutableSet *)v24;

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v26 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      pendingMessagesThreshold = v8->_pendingMessagesThreshold;
      *(_DWORD *)buf = 134217984;
      v47 = pendingMessagesThreshold;
      _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_INFO, "Using a sliding window count of %lu", buf, 0xCu);
    }
    v28 = pipe((int *)buf);
    *(_DWORD *)&v8->super._bytes[44] = *(_DWORD *)buf;
    v8->_wakeupPipeRead = v47;
    if (v28)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v29 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v30 = v29;
      v31 = *__error();
      *(_DWORD *)v44 = 67109120;
      v45 = v31;
      v32 = "Error opening pipe with code %d";
LABEL_23:
      _os_log_error_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, v32, v44, 8u);

LABEL_24:
      *(_DWORD *)&v8->super._bytes[44] = -1;
      v8->_wakeupPipeRead = -1;

      v37 = 0;
      goto LABEL_25;
    }
    if (!fd_set_flag(*(_DWORD *)&v8->super._bytes[44]))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v38 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v30 = v38;
      v39 = *__error();
      *(_DWORD *)v44 = 67109120;
      v45 = v39;
      v32 = "Error setting O_NONBLOCK | O_CLOEXEC flag on read pipe  %d";
      goto LABEL_23;
    }
    if (!fd_set_flag(v8->_wakeupPipeRead))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v40 = (void *)hap2Log_coap;
      if (!os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v30 = v40;
      v41 = *__error();
      *(_DWORD *)v44 = 67109120;
      v45 = v41;
      v32 = "Error setting O_NONBLOCK | O_CLOEXEC flag on write pipe  %d";
      goto LABEL_23;
    }
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("com.apple.CoreHAP.%@"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2CoAPIOThread setName:](v8, "setName:", v36);

    -[HAP2CoAPIOThread setQualityOfService:](v8, "setQualityOfService:", a3);
  }
  v37 = v8;
LABEL_25:

  return v37;
}

- (HAP2CoAPIOThread)init
{
  return -[HAP2CoAPIOThread initWithQualityOfService:delegate:](self, "initWithQualityOfService:delegate:", 17, 0);
}

- (void)dealloc
{
  int v3;
  int wakeupPipeRead;
  objc_super v5;

  v3 = *(_DWORD *)&self->super._bytes[44];
  if (v3 != -1)
    close(v3);
  wakeupPipeRead = self->_wakeupPipeRead;
  if (wakeupPipeRead != -1)
    close(wakeupPipeRead);
  v5.receiver = self;
  v5.super_class = (Class)HAP2CoAPIOThread;
  -[HAP2CoAPIOThread dealloc](&v5, sel_dealloc);
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2CoAPIOThread;
  -[HAP2CoAPIOThread cancel](&v3, sel_cancel);
  -[HAP2CoAPIOThread _wakeUpThread](self, "_wakeUpThread");
}

- (void)main
{
  void *v3;
  NSObject *v4;
  void *v5;
  coap_context_t *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x1D17B7244](-[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread"));
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "Coap IO thread started", buf, 2u);
  }
  -[HAP2CoAPIOThread delegate]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStart");

  log_handler = (uint64_t)coapLogHandler;
  coap_set_log_level(7);
  coap_startup();
  v6 = -[HAP2CoAPIOThread _createContext](self, "_createContext");
  do
  {
    if ((-[HAP2CoAPIOThread isCancelled](self, "isCancelled") & 1) != 0)
      break;
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = -[HAP2CoAPIOThread _processQueueWithContext:](self, "_processQueueWithContext:", v6);
    objc_autoreleasePoolPop(v7);
  }
  while (v8);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v9 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_debug_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "Coap IO thread exited main run loop", v13, 2u);
  }
  -[HAP2CoAPIOThread _processQueueWithContext:](self, "_processQueueWithContext:", 0);
  if (v6)
    -[HAP2CoAPIOThread _cleanupWithContext:](self, "_cleanupWithContext:", v6);
  -[HAP2CoAPIOThread delegate]((id *)&self->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didStop");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v11 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "Coap IO thread stopped", v12, 2u);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)registerConsumer:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Register"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)1, 0, v10, 0.0);
  -[HAP2CoAPIOThread _enqueue:](self, "_enqueue:", v9);

  __HMFActivityScopeLeave();
}

- (void)unregisterConsumer:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Unregister"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)2, 0, v10, 0.0);
  -[HAP2CoAPIOThread _enqueue:](self, "_enqueue:", v9);

  __HMFActivityScopeLeave();
}

- (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  HAP2CoAPIOThreadQueueEntry *v16;
  uint64_t v17;
  id *v18;
  void *v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ Session Block"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v15);
  v16 = [HAP2CoAPIOThreadQueueEntry alloc];
  if (v6)
    v17 = 8;
  else
    v17 = 4;
  v18 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)&v16->super.isa, v10, (void *)v17, v11, v19, a5);
  -[HAP2CoAPIOThread _enqueue:](self, "_enqueue:", v18);

  __HMFActivityScopeLeave();
}

- (void)queueSessionCompletionForConsumer:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Session Block Complete"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  v9 = -[HAP2CoAPIOThreadQueueEntry initWithConsumer:operationType:sessionBlock:timeout:activity:]((id *)[HAP2CoAPIOThreadQueueEntry alloc], v4, (void *)0x10, 0, v10, 0.0);
  -[HAP2CoAPIOThread _enqueue:](self, "_enqueue:", v9);

  __HMFActivityScopeLeave();
}

- (void)_wakeUpThread
{
  int v3;
  void *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v3 = self ? self->_wakeupPipeRead : 0;
    if (write(v3, "a", 1uLL) != -1)
      break;
    if (*__error() != 4)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v4 = (void *)hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        v6 = *__error();
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "Error attempting to wake up thread %d", (uint8_t *)v7, 8u);

      }
      return;
    }
  }
}

- (void)_enqueue:(id)a3
{
  id v4;
  HAP2Lock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  HAP2CoAPIOThread *v9;

  v4 = a3;
  if (self)
    lock = self->_lock;
  else
    lock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__HAP2CoAPIOThread__enqueue___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[HAP2Lock performBlock:](lock, "performBlock:", v7);
  -[HAP2CoAPIOThread _wakeUpThread](self, "_wakeUpThread");

}

- (coap_context_t)_createContext
{
  coap_context_t *v3;
  coap_context_t *v4;
  int v5;
  int v6;
  int v7;
  size_t *v8;
  _OWORD *v9;
  _OWORD *v10;
  const void *v11;
  size_t v12;
  size_t *v13;
  size_t *v14;
  size_t *v15;
  size_t v16;
  unsigned __int8 *v17;
  uint64_t resource_from_uri_path;
  uint64_t v19;
  char *v20;
  UT_hash_table *var0;
  coap_resource_t *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t var2;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  unsigned __int8 *v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  int32x2_t **v51;
  coap_resource_t *var1;
  UT_hash_table *v53;
  uint64_t v54;
  UT_hash_table *v55;
  coap_resource_t *v56;
  UT_hash_table *v57;
  _OWORD *v58;
  uint64_t v59;
  uint64_t v60;
  int32x2_t ***v61;
  unsigned int v62;
  int32x2_t **v63;
  _DWORD *v64;
  _DWORD *v65;
  int32x2_t *v66;
  unsigned __int32 v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  _QWORD *v71;
  int v72;
  uint64_t i;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unsigned int v78;
  uint64_t v79;
  int32x2_t *v80;
  int32x2_t v81;
  int32x2_t v82;
  unsigned int v83;
  uint8_t v85[16];
  uint8_t buf[16];

  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  coap_startup();
  v3 = (coap_context_t *)malloc_type_malloc(0xE0uLL, 0x9D9A23A2uLL);
  if (!v3)
  {
    if ((maxlog & 0x80000000) == 0)
      coap_log_impl(0, "coap_init: malloc: failed\n");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v23 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "Coap IO thread failed to create context", buf, 2u);
    }
    return 0;
  }
  v4 = v3;
  *(_OWORD *)&v3->var15 = 0u;
  *(_OWORD *)&v3->var17 = 0u;
  *(_OWORD *)&v3->var23 = 0u;
  *(_OWORD *)&v3->var27 = 0u;
  *(_OWORD *)&v3->var19 = 0u;
  *(_OWORD *)&v3->var21 = 0u;
  *(_OWORD *)&v3->var11 = 0u;
  *(_OWORD *)&v3->var13 = 0u;
  *(_OWORD *)&v3->var7 = 0u;
  *(_OWORD *)&v3->var9 = 0u;
  *(_OWORD *)&v3->var3 = 0u;
  *(_OWORD *)&v3->var5 = 0u;
  v3->var27 = 30;
  v3->var13 = coap_network_send;
  v3->var14 = coap_network_read;
  v3->var15 = coap_get_session_client_psk;
  v3->var16 = coap_get_context_server_psk;
  v3->var17 = coap_get_context_server_hint;
  v5 = coap_make_str_const_ofs;
  v6 = coap_make_str_const_ofs + 1;
  *(_OWORD *)v3->var0 = 0u;
  *(_OWORD *)&v3->var1 = 0u;
  if (v6 == 2)
    v7 = 0;
  else
    v7 = v5 + 1;
  coap_make_str_const_ofs = v7;
  v8 = (size_t *)((char *)&coap_make_str_const_var + 16 * v7);
  *v8 = 0;
  v8[1] = (size_t)"";
  v9 = malloc_type_malloc(0xA0uLL, 0x9D9A23A2uLL);
  if (!v9)
  {
    if (maxlog >= 7)
      coap_log_impl(7, "coap_resource_init: no memory left\n");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v24 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v85 = 0;
      _os_log_error_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "Coap IO thread failed to create request resource", v85, 2u);
    }
    coap_free_context((uint64_t)v4);
    return 0;
  }
  v10 = v9;
  v9[8] = 0u;
  v9[9] = 0u;
  v9[6] = 0u;
  v9[7] = 0u;
  v9[4] = 0u;
  v9[5] = 0u;
  v9[2] = 0u;
  v9[3] = 0u;
  *v9 = 0u;
  v9[1] = 0u;
  v11 = (const void *)v8[1];
  v12 = *v8;
  v13 = coap_new_string(v12);
  if (v13)
  {
    v14 = v13;
    memcpy((void *)v13[1], v11, v12);
    *v14 = v12;
    *((_QWORD *)v10 + 17) = v14;
  }
  *((_DWORD *)v10 + 36) = 0;
  v4->var28 = self;
  v4->var14 = coapNetworkRead;
  v4->var8 = coapResponseHandler;
  v4->var9 = coapNackHandler;
  v4->var11 = coapPongHandler;
  v4->var12 = coapEventHandler;
  *((_QWORD *)v10 + 3) = coapRequestHandler;
  if ((*(_BYTE *)v10 & 0x10) != 0)
  {
    var2 = (uint64_t)v4->var2;
    if (var2)
      coap_free_resource(var2);
    v4->var2 = (coap_resource_t *)v10;
    return v4;
  }
  v15 = (size_t *)*((_QWORD *)v10 + 17);
  v16 = *v15;
  v17 = (unsigned __int8 *)v15[1];
  resource_from_uri_path = coap_get_resource_from_uri_path((uint64_t)v4, *v15, v17);
  if (resource_from_uri_path)
  {
    v19 = resource_from_uri_path;
    if (maxlog >= 4)
      coap_log_impl(4, "coap_add_resource: Duplicate uri_path '%*.*s', old resource deleted\n", v16, v16, (const char *)v17);
    if ((*(_BYTE *)v19 & 0x10) != 0 && v4->var2 == (coap_resource_t *)v19)
    {
      coap_free_resource(v19);
      v4->var2 = 0;
      goto LABEL_48;
    }
    v20 = *(char **)(v19 + 72);
    if (!v20 && !*(_QWORD *)(v19 + 80))
    {
      free(*(void **)v4->var1->var6.var0);
      free(v4->var1->var6.var0);
      v4->var1 = 0;
LABEL_47:
      coap_free_resource(v19);
LABEL_48:
      v15 = (size_t *)*((_QWORD *)v10 + 17);
      v16 = *v15;
      goto LABEL_49;
    }
    var0 = v4->var1->var6.var0;
    if (v19 + 64 == *((_QWORD *)var0 + 3))
      *((_QWORD *)var0 + 3) = &v20[*((_QWORD *)var0 + 4)];
    v22 = *(coap_resource_t **)(v19 + 80);
    if (v20)
    {
      *(_QWORD *)&v20[*((_QWORD *)var0 + 4) + 16] = v22;
      v22 = *(coap_resource_t **)(v19 + 80);
      if (!v22)
        goto LABEL_40;
    }
    else
    {
      v4->var1 = v22;
      var0 = v22->var6.var0;
    }
    *(void **)((char *)v22->var5 + *((_QWORD *)var0 + 4)) = v20;
LABEL_40:
    v26 = *(_QWORD *)var0 + 16 * ((*((_DWORD *)var0 + 2) - 1) & *(_DWORD *)(v19 + 116));
    --*(_DWORD *)(v26 + 8);
    if (*(_QWORD *)v26 == v19 + 64)
      *(_QWORD *)v26 = *(_QWORD *)(v19 + 96);
    v27 = *(_QWORD *)(v19 + 88);
    if (v27)
      *(_QWORD *)(v27 + 32) = *(_QWORD *)(v19 + 96);
    v28 = *(_QWORD *)(v19 + 96);
    if (v28)
      *(_QWORD *)(v28 + 24) = v27;
    --*((_DWORD *)var0 + 4);
    goto LABEL_47;
  }
LABEL_49:
  v29 = -17973521;
  v30 = -1640531527;
  if (v16 < 0xC)
  {
    v33 = -1640531527;
    v32 = v16;
    v31 = (unsigned __int8 *)v15[1];
  }
  else
  {
    v31 = (unsigned __int8 *)v15[1];
    v32 = v16;
    v33 = -1640531527;
    do
    {
      v34 = *((_DWORD *)v31 + 1) + v30;
      v35 = *((_DWORD *)v31 + 2) + v29;
      v36 = (*(_DWORD *)v31 + v33 - (v34 + v35)) ^ (v35 >> 13);
      v37 = (v34 - v35 - v36) ^ (v36 << 8);
      v38 = (v35 - v36 - v37) ^ (v37 >> 13);
      v39 = (v36 - v37 - v38) ^ (v38 >> 12);
      v40 = (v37 - v38 - v39) ^ (v39 << 16);
      v41 = (v38 - v39 - v40) ^ (v40 >> 5);
      v33 = (v39 - v40 - v41) ^ (v41 >> 3);
      v30 = (v40 - v41 - v33) ^ (v33 << 10);
      v29 = (v41 - v33 - v30) ^ (v30 >> 15);
      v31 += 12;
      v32 -= 12;
    }
    while (v32 > 0xB);
  }
  v42 = v29 + v16;
  switch(v32)
  {
    case 1u:
      goto LABEL_65;
    case 2u:
      goto LABEL_64;
    case 3u:
      goto LABEL_63;
    case 4u:
      goto LABEL_62;
    case 5u:
      goto LABEL_61;
    case 6u:
      goto LABEL_60;
    case 7u:
      goto LABEL_59;
    case 8u:
      goto LABEL_58;
    case 9u:
      goto LABEL_57;
    case 0xAu:
      goto LABEL_56;
    case 0xBu:
      v42 += v31[10] << 24;
LABEL_56:
      v42 += v31[9] << 16;
LABEL_57:
      v42 += v31[8] << 8;
LABEL_58:
      v30 += v31[7] << 24;
LABEL_59:
      v30 += v31[6] << 16;
LABEL_60:
      v30 += v31[5] << 8;
LABEL_61:
      v30 += v31[4];
LABEL_62:
      v33 += v31[3] << 24;
LABEL_63:
      v33 += v31[2] << 16;
LABEL_64:
      v33 += v31[1] << 8;
LABEL_65:
      v33 += *v31;
      break;
    default:
      break;
  }
  v43 = (v33 - v42 - v30) ^ (v42 >> 13);
  v44 = (v30 - v42 - v43) ^ (v43 << 8);
  v45 = (v42 - v43 - v44) ^ (v44 >> 13);
  v46 = (v43 - v44 - v45) ^ (v45 >> 12);
  v47 = (v44 - v45 - v46) ^ (v46 << 16);
  v48 = (v45 - v46 - v47) ^ (v47 >> 5);
  v49 = (v46 - v47 - v48) ^ (v48 >> 3);
  v50 = (v48 - v49 - ((v47 - v48 - v49) ^ (v49 << 10))) ^ (((v47 - v48 - v49) ^ (v49 << 10)) >> 15);
  v51 = (int32x2_t **)(v10 + 4);
  *((_QWORD *)v10 + 13) = v15[1];
  *((_DWORD *)v10 + 28) = v16;
  *((_DWORD *)v10 + 29) = v50;
  var1 = v4->var1;
  if (var1)
  {
    *((_QWORD *)v10 + 8) = var1->var6.var0;
    v53 = var1->var6.var0;
    v54 = *((_QWORD *)v53 + 3);
    *((_QWORD *)v10 + 9) = v54 - *((_QWORD *)v53 + 4);
    *((_QWORD *)v10 + 10) = 0;
    *(_QWORD *)(v54 + 16) = v10;
    *((_QWORD *)v53 + 3) = v51;
  }
  else
  {
    *((_QWORD *)v10 + 9) = 0;
    *((_QWORD *)v10 + 10) = 0;
    v4->var1 = (coap_resource_t *)v10;
    v55 = (UT_hash_table *)malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
    v4->var1->var6.var0 = v55;
    if (!v55)
      goto LABEL_95;
    *((_OWORD *)v55 + 2) = 0u;
    *((_OWORD *)v55 + 3) = 0u;
    *(_OWORD *)v55 = 0u;
    *((_OWORD *)v55 + 1) = 0u;
    v56 = v4->var1;
    v57 = v56->var6.var0;
    *((_QWORD *)v57 + 1) = 0x500000020;
    *((_QWORD *)v57 + 3) = &v56->var6;
    *((_QWORD *)v57 + 4) = 64;
    v58 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
    *(_QWORD *)v4->var1->var6.var0 = v58;
    if (!v58)
      goto LABEL_95;
    v58[30] = 0u;
    v58[31] = 0u;
    v58[28] = 0u;
    v58[29] = 0u;
    v58[26] = 0u;
    v58[27] = 0u;
    v58[24] = 0u;
    v58[25] = 0u;
    v58[22] = 0u;
    v58[23] = 0u;
    v58[20] = 0u;
    v58[21] = 0u;
    v58[18] = 0u;
    v58[19] = 0u;
    v58[16] = 0u;
    v58[17] = 0u;
    v58[14] = 0u;
    v58[15] = 0u;
    v58[12] = 0u;
    v58[13] = 0u;
    v58[10] = 0u;
    v58[11] = 0u;
    v58[8] = 0u;
    v58[9] = 0u;
    v58[6] = 0u;
    v58[7] = 0u;
    v58[4] = 0u;
    v58[5] = 0u;
    v58[2] = 0u;
    v58[3] = 0u;
    *v58 = 0u;
    v58[1] = 0u;
    v53 = v4->var1->var6.var0;
    *((_DWORD *)v53 + 14) = -1609490463;
  }
  ++*((_DWORD *)v53 + 4);
  v59 = (*((_DWORD *)v53 + 2) - 1) & v50;
  v60 = *(_QWORD *)v53;
  v61 = (int32x2_t ***)(v60 + 16 * v59);
  v62 = *((_DWORD *)v61 + 2) + 1;
  *((_DWORD *)v61 + 2) = v62;
  v63 = *v61;
  *((_QWORD *)v10 + 11) = 0;
  *((_QWORD *)v10 + 12) = v63;
  if (v63)
    v63[3] = (int32x2_t *)v51;
  *v61 = v51;
  if (v62 >= 10 * *(_DWORD *)(v60 + 16 * v59 + 12) + 10 && !(*v51)[6].i32[1])
  {
    v64 = malloc_type_malloc(32 * (*v51)[1].u32[0], 0x1020040EDED9539uLL);
    if (v64)
    {
      v65 = v64;
      bzero(v64, 32 * (*v51)[1].u32[0]);
      v66 = *v51;
      v67 = (*v51)[2].u32[0];
      v68 = (*v51)[1].u32[0];
      v69 = 2 * v68 - 1;
      if ((v69 & v67) != 0)
        v70 = (v67 >> ((*v51)[1].i32[1] + 1)) + 1;
      else
        v70 = v67 >> ((*v51)[1].i32[1] + 1);
      v66[5].i32[0] = v70;
      v66[5].i32[1] = 0;
      v71 = (_QWORD *)*v66;
      if ((_DWORD)v68)
      {
        v72 = 0;
        for (i = 0; i != v68; ++i)
        {
          v74 = v71[2 * i];
          if (v74)
          {
            do
            {
              v75 = *(_QWORD *)(v74 + 32);
              v76 = *(_DWORD *)(v74 + 52) & v69;
              v77 = (char *)&v65[4 * v76];
              v78 = *((_DWORD *)v77 + 2) + 1;
              *((_DWORD *)v77 + 2) = v78;
              if (v78 > v70)
              {
                v66[5].i32[1] = ++v72;
                v65[4 * v76 + 3] = v78 / v70;
              }
              v79 = *(_QWORD *)v77;
              *(_QWORD *)(v74 + 24) = 0;
              *(_QWORD *)(v74 + 32) = v79;
              if (v79)
                *(_QWORD *)(v79 + 24) = v74;
              *(_QWORD *)v77 = v74;
              v74 = v75;
            }
            while (v75);
          }
        }
      }
      free(v71);
      v80 = *v51;
      v81 = (*v51)[1];
      v82.i32[0] = vadd_s32(v81, v81).u32[0];
      v82.i32[1] = vadd_s32(v81, (int32x2_t)0x100000001).i32[1];
      v80[1] = v82;
      *v80 = (int32x2_t)v65;
      if (v80[5].i32[1] <= (unsigned __int32)v80[2].i32[0] >> 1)
      {
        v80[6].i32[0] = 0;
      }
      else
      {
        v83 = v80[6].i32[0] + 1;
        v80[6].i32[0] = v83;
        if (v83 >= 2)
          v80[6].i32[1] = 1;
      }
      return v4;
    }
LABEL_95:
    exit(-1);
  }
  return v4;
}

- (BOOL)_processQueueWithContext:(coap_context_t *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  char *v14;
  char *v15;
  char v16;
  void (*v17)(uint64_t, char *);
  uint64_t *v18;
  unsigned __int8 *v19;
  char v20;
  unint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  BOOL v26;
  char v27;
  char v28;
  char v29;
  char v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  unsigned __int8 *v42;
  uint32_t *p_cb;
  unsigned __int8 *v44;
  unsigned int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __int16 v53;
  __int16 v54;
  unsigned __int8 v55;
  unint64_t v56;
  unsigned __int8 *v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  _QWORD *v68;
  unsigned int v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  size_t v75;
  const void *v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  int v81;
  _QWORD *v82;
  BOOL v83;
  uint32_t *v84;
  size_t v85;
  uint64_t v86;
  void *v87;
  unsigned __int8 *v88;
  void (*v89)(uint64_t, _QWORD);
  unint64_t v90;
  unint64_t v91;
  NSObject *v92;
  int v93;
  int **v94;
  unint64_t v95;
  int *v96;
  unint64_t v97;
  int v98;
  int v99;
  int v100;
  int v101;
  uint32_t *v102;
  timeval *v103;
  int v104;
  int *v105;
  _OWORD *v106;
  uint64_t v107;
  __int16 v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  __int16 v114;
  uint64_t v115;
  ssize_t v116;
  unint64_t v117;
  _QWORD *v118;
  __int128 v119;
  uint64_t v120;
  __int16 v121;
  int v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int v126;
  int *v127;
  unsigned int v128;
  int v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  uint64_t v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  int v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  unint64_t v158;
  double v159;
  int *v160;
  uint64_t v161;
  unsigned int v162;
  int v163;
  int v164;
  int v165;
  char *v166;
  int v167;
  unsigned int v168;
  uint64_t v169;
  unsigned int v170;
  int v171;
  int v172;
  unsigned int v173;
  unsigned int v174;
  int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  unsigned int v188;
  int32x2_t **v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  _OWORD *v193;
  uint64_t v194;
  _QWORD *v195;
  _OWORD *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  uint64_t v201;
  _DWORD *v202;
  _DWORD *v203;
  int32x2_t *v204;
  unsigned __int32 v205;
  uint64_t v206;
  unsigned int v207;
  unsigned int v208;
  _QWORD *v209;
  int v210;
  uint64_t j;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char *v215;
  unsigned int v216;
  uint64_t v217;
  int32x2_t *v218;
  int32x2_t v219;
  int32x2_t v220;
  unsigned int v221;
  char *session;
  char *v223;
  char *v224;
  int v225;
  int *v226;
  char *v227;
  int *v229;
  char *v230;
  unsigned int v231;
  uint64_t v232;
  unsigned int v233;
  int v234;
  int v235;
  unsigned int v236;
  unsigned int v237;
  int v238;
  unsigned int v239;
  unsigned int v240;
  int v241;
  unsigned int v242;
  unsigned int v243;
  unsigned int v244;
  unsigned int v245;
  unsigned int v246;
  int v247;
  unsigned int v248;
  unsigned int v249;
  int v250;
  unsigned int v251;
  int32x2_t **v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  int *v256;
  char *v257;
  _OWORD *v258;
  uint64_t v259;
  _QWORD *v260;
  _OWORD *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  unsigned int v265;
  uint64_t v266;
  _DWORD *v267;
  _DWORD *v268;
  int32x2_t *v269;
  unsigned __int32 v270;
  uint64_t v271;
  unsigned int v272;
  unsigned int v273;
  _QWORD *v274;
  int v275;
  uint64_t i;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  char *v280;
  unsigned int v281;
  uint64_t v282;
  int32x2_t *v283;
  int32x2_t v284;
  int32x2_t v285;
  unsigned int v286;
  int v287;
  uint64_t v288;
  uint64_t v289;
  __int16 v290;
  unsigned __int8 *v291;
  unsigned __int8 *v292;
  __int16 v293;
  int *v295;
  char *v296;
  char *v297;
  int v298;
  unsigned __int8 *v299;
  int v300;
  int *v301;
  char *v302;
  int *v303;
  char *v304;
  int v305;
  NSObject *v306;
  int log_level;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t *v312;
  int v313;
  unint64_t v314;
  void *v315;
  uint64_t v316;
  unsigned int v317;
  uint64_t v318;
  uint64_t v319;
  unsigned int v320;
  uint64_t v321;
  void *v322;
  _QWORD v323[7];
  _QWORD v324[5];
  id v325;
  _QWORD v326[6];
  uint64_t v327;
  uint64_t *v328;
  uint64_t v329;
  uint64_t (*v330)(uint64_t, uint64_t);
  void (*v331)(uint64_t);
  id v332;
  unint64_t v333;
  uint64_t v334;
  fd_set v335;
  fd_set v336;
  fd_set v337;
  socklen_t v338;
  _OWORD v339[256];
  int __errnum[4];
  __int128 v341;
  _BYTE v342[32];
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  uint64_t v371;

  v3 = (void *)MEMORY[0x1E0C80A78](self, a2, a3);
  v5 = v4;
  v6 = v3;
  v371 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v3, "_assertIsCurrentThread");
  v327 = 0;
  v328 = &v327;
  v329 = 0x3032000000;
  v330 = __Block_byref_object_copy__18826;
  v331 = __Block_byref_object_dispose__18827;
  v332 = 0;
  if (v6)
    v7 = (void *)*((_QWORD *)v6 + 13);
  else
    v7 = 0;
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  v326[0] = MEMORY[0x1E0C809B0];
  v326[1] = 3221225472;
  v326[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke;
  v326[3] = &unk_1E894DEE8;
  v326[4] = v6;
  v326[5] = &v327;
  objc_msgSend(v8, "performBlock:", v326);

  v324[0] = 0;
  v324[1] = v324;
  v324[2] = 0x3032000000;
  v324[3] = __Block_byref_object_copy__18826;
  v324[4] = __Block_byref_object_dispose__18827;
  v325 = 0;
  v10 = (void *)v328[5];
  v323[0] = v9;
  v323[1] = 3221225472;
  v323[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_54;
  v323[3] = &unk_1E894CD60;
  v323[4] = v6;
  v323[5] = v324;
  v323[6] = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v323);
  if (v5)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ CoAP Run"), v13);
    v315 = (void *)objc_claimAutoreleasedReturnValue();

    v322 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v315);
    if (v6)
      v317 = *((_DWORD *)v6 + 15);
    else
      v317 = 0;
    memset(&v337, 0, sizeof(v337));
    memset(v339, 0, 512);
    v333 = 0;
    v334 = 0;
    memset(__errnum, 0, sizeof(__errnum));
    gettimeofday((timeval *)__errnum, 0);
    v313 = __errnum[2];
    v318 = *(_QWORD *)__errnum;
    v321 = v5;
    v316 = coap_clock_offset;
    v14 = *(char **)(v5 + 16);
    if (v14)
    {
      while (1)
      {
        v15 = v14;
        v14 = (char *)*((_QWORD *)v14 + 10);
        v16 = *v15;
        if ((*v15 & 4) != 0 && (*v15 & 3) != 0)
        {
          v16 &= ~2u;
          *v15 = v16;
          v17 = (void (*)(uint64_t, char *))*((_QWORD *)v15 + 1);
          if (!v17)
            __assert_rtn("coap_notify_observers", "resource.c", 751, "h");
          v18 = (uint64_t *)*((_QWORD *)v15 + 16);
          if (v18)
            break;
        }
LABEL_39:
        *v15 = v16 & 0xFE;
        if (!v14)
          goto LABEL_40;
      }
      memset(__errnum, 0, sizeof(__errnum));
      while (1)
      {
        if ((*v15 & 1) != 0 || (v18[2] & 0x40) != 0)
        {
          v19 = (unsigned __int8 *)v18[1];
          if (!v19[226])
          {
            v20 = *((_BYTE *)v18 + 16);
LABEL_19:
            *((_BYTE *)v18 + 16) = v20 & 0xBF;
            v21 = coap_session_max_pdu_size(v19);
            v22 = coap_pdu_init(0, 0, 0, v21);
            if (v22)
            {
              v23 = (uint64_t)v22;
              if (coap_add_token((uint64_t)v22, v18[4], v18 + 5))
              {
                *(_QWORD *)__errnum = v18[4];
                *(_QWORD *)&__errnum[2] = v18 + 5;
                v24 = v18[1];
                v25 = *(_WORD *)(v24 + 224) + 1;
                *(_WORD *)(v24 + 224) = v25;
                *(_WORD *)(v23 + 6) = v25;
                *((_WORD *)v18 + 9) = v25;
                v26 = (v15[144] & 2) == 0 && ((_BYTE)v18[2] & 0xFu) < 5;
                v5 = v321;
                *(_BYTE *)v23 = v26;
                v17(v321, v15);
                v27 = *((_BYTE *)v18 + 16);
                v28 = v27 + 1;
                v29 = v27 & 0xF0;
                if (*(_BYTE *)v23)
                  v30 = v29 & 0xF0 | v28 & 0xF;
                else
                  v30 = v29;
                *((_BYTE *)v18 + 16) = v30;
                if (coap_send((unsigned __int8 *)v18[1], v23) == -1)
                {
                  if (maxlog >= 7)
                    coap_log_impl(7, "coap_check_notify: sending failed, resource stays partially dirty\n");
                  *((_BYTE *)v18 + 16) |= 0x40u;
                  *v15 |= 2u;
                }
              }
              else
              {
                *((_BYTE *)v18 + 16) |= 0x40u;
                *v15 |= 2u;
                v5 = v321;
                if (maxlog >= 7)
                  coap_log_impl(7, "coap_check_notify: cannot add token, resource stays partially dirty\n");
                coap_delete_pdu((_QWORD *)v23);
              }
            }
            else
            {
              *((_BYTE *)v18 + 16) |= 0x40u;
              *v15 |= 2u;
              if (maxlog >= 7)
                coap_log_impl(7, "coap_check_notify: pdu init failed, resource stays partially dirty\n");
            }
            goto LABEL_37;
          }
          if ((v15[144] & 2) == 0)
          {
            v20 = *((_BYTE *)v18 + 16);
            if ((v20 & 0xFu) <= 4)
              goto LABEL_19;
          }
        }
LABEL_37:
        v18 = (uint64_t *)*v18;
        if (!v18)
        {
          v16 = *v15;
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    v31 = 1000 * (v318 - v316) + ((unint64_t)((double)v313 * 1.024 + 512.0) >> 10);
    v32 = *(_DWORD *)(v5 + 192);
    if (v32)
      v33 = 1000 * v32;
    else
      v33 = 300000;
    v34 = *(uint64_t **)(v5 + 56);
    if (!v34)
    {
      v35 = 0;
      v36 = 0;
      goto LABEL_67;
    }
    v35 = 0;
    v36 = 0;
    do
    {
      if ((*((_WORD *)v34 + 14) & 0x70) != 0 && v35 <= 0x1FF)
        *((_QWORD *)v339 + v35++) = v34 + 3;
      v37 = v34[10];
      while (v37)
      {
        v38 = v37;
        v37 = *(_QWORD *)(v37 + 64);
        if (*(_BYTE *)(v38 + 1) != 2 || *(_DWORD *)(v38 + 4) || *(_QWORD *)(v38 + 232))
          goto LABEL_53;
        v39 = *(_QWORD *)(v38 + 272) + v33;
        v67 = v39 > v31;
        v40 = v39 - v31;
        if (v67 && *(_BYTE *)(v38 + 2))
        {
          if (v36 - 1 >= v40)
            v36 = v40;
LABEL_53:
          if ((*(_WORD *)(v38 + 180) & 0x30) != 0 && v35 <= 0x1FF)
            *((_QWORD *)v339 + v35++) = v38 + 176;
        }
        else
        {
          coap_session_free((_DWORD *)v38);
        }
      }
      v34 = (uint64_t *)*v34;
    }
    while (v34);
LABEL_67:
    v42 = *(unsigned __int8 **)(v5 + 64);
    v319 = v36;
    if (v42)
    {
      p_cb = (_DWORD *)(&OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse + 64);
      while (1)
      {
        while (1)
        {
          v44 = v42;
          v42 = (unsigned __int8 *)*((_QWORD *)v42 + 8);
          if (v44[1] != 1)
            goto LABEL_98;
          if (v44[2] == 4)
          {
            v45 = *(_DWORD *)(v5 + 204);
            if (v45)
              break;
          }
LABEL_77:
          if (*v44 - 3 <= 1 && v44[2] == 3)
          {
            v49 = *(_DWORD *)(v5 + 208);
            if (v49)
            {
              v50 = *((_QWORD *)v44 + 38);
              if (v50)
              {
                v51 = v50 + 1000 * v49;
                if (v51 <= v31)
                  goto LABEL_104;
              }
              else
              {
                *((_QWORD *)v44 + 38) = v31;
                v51 = v31 + 1000 * v49;
              }
              v60 = v51 - v31;
              v61 = v319;
              if (v319 - 1 >= v60)
                v61 = v60;
              v319 = v61;
            }
          }
LABEL_98:
          if ((*((_WORD *)v44 + 90) & 0xB0) != 0 && v35 <= 0x1FF)
            *((_QWORD *)v339 + v35++) = v44 + 176;
          if (!v42)
            goto LABEL_107;
        }
        v46 = *((_QWORD *)v44 + 34) + 1000 * v45;
        v67 = v46 > v31;
        v47 = v46 - v31;
        if (v67)
        {
          v48 = v319;
          if (v319 - 1 >= v47)
            v48 = v47;
          v319 = v48;
          goto LABEL_77;
        }
        v52 = *((_QWORD *)v44 + 36);
        if (v52 && *((_QWORD *)v44 + 37) < v52)
          goto LABEL_104;
        if (*v44 - 1 > 1)
        {
          v55 = -30;
          v54 = 0;
          v56 = 1;
        }
        else
        {
          v53 = *((_WORD *)v44 + 112) + 1;
          *((_WORD *)v44 + 112) = v53;
          v54 = v53;
          v55 = 0;
          v56 = 0;
        }
        v57 = coap_pdu_init(0, v55, v54, v56);
        if (v57)
        {
          v58 = coap_send(v44, (uint64_t)v57);
          *((_DWORD *)v44 + 57) = v58;
          if (v58 != -1)
          {
            *((_QWORD *)v44 + 34) = v31;
            *((_QWORD *)v44 + 36) = v31;
            v59 = v319;
            if (v319 - 1 >= 1000 * (unint64_t)*(unsigned int *)(v5 + 204))
              v59 = 1000 * *(unsigned int *)(v5 + 204);
            v319 = v59;
            if (v44[1] != 1)
              goto LABEL_98;
            goto LABEL_77;
          }
        }
        else
        {
          *((_DWORD *)v44 + 57) = -1;
        }
LABEL_104:
        ++*((_DWORD *)v44 + 1);
        coap_session_disconnected(v44, 1);
        coap_session_release((uint64_t)v44);
        if (!v42)
          goto LABEL_107;
      }
    }
    p_cb = &OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse.cb;
LABEL_107:
    v62 = (uint64_t *)(v5 + 48);
    v63 = *(_QWORD *)(v5 + 48);
    v314 = v31;
    v64 = v319;
    if (v63)
    {
      v312 = (uint64_t *)(v5 + 48);
      while (1)
      {
        v65 = *(_QWORD *)(v5 + 40);
        v66 = *(_QWORD *)(v63 + 8);
        v67 = v31 < v65 || v66 > v31 - v65;
        if (v67)
          break;
        v68 = *(_QWORD **)v63;
        *v62 = *(_QWORD *)v63;
        if (v68)
          v68[1] += v66;
        *(_QWORD *)v63 = 0;
        v69 = *(unsigned __int8 *)(v63 + 16);
        v70 = *(_QWORD *)(v63 + 24);
        if (*(_DWORD *)(v70 + 352) <= v69)
        {
          if (*((__int16 *)p_cb + 1696) >= 7)
          {
            coap_session_str(*(_QWORD *)(v63 + 24));
            coap_log_impl(7, "** %s: tid=%d: give up after %d attempts\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(v63 + 32), *(unsigned __int8 *)(v63 + 16));
            v70 = *(_QWORD *)(v63 + 24);
          }
          v73 = *(_QWORD *)(v63 + 40);
          if (*(unsigned __int8 *)(v73 + 1) >= 0x40u)
          {
            v74 = *(_QWORD *)(v5 + 16);
            if (v74)
            {
              v75 = *(unsigned __int8 *)(v73 + 4);
              v76 = *(const void **)(v73 + 40);
              do
              {
                v77 = v74;
                v74 = *(_QWORD *)(v74 + 80);
                v78 = *(_QWORD **)(v77 + 128);
                if (v78)
                {
                  v79 = *(_QWORD **)(v77 + 128);
                  while (1)
                  {
                    v80 = v79;
                    v79 = (_QWORD *)*v79;
                    if (v80[1] == v70 && v80[4] == v75 && !memcmp(v76, v80 + 5, v75))
                      break;
                    if (!v79)
                      goto LABEL_129;
                  }
                  v81 = *((unsigned __int8 *)v80 + 16);
                  if ((~v81 & 0x30) != 0)
                  {
                    *((_BYTE *)v80 + 16) = (v81 + 16) & 0x30 | v81 & 0xCF;
                  }
                  else
                  {
                    if (v78 == v80)
                    {
                      *(_QWORD *)(v77 + 128) = *v78;
                      v84 = &OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse.cb;
                    }
                    else
                    {
                      do
                      {
                        v82 = v78;
                        v78 = (_QWORD *)*v78;
                        if (v78)
                          v83 = v78 == v80;
                        else
                          v83 = 1;
                      }
                      while (!v83);
                      v84 = (_DWORD *)(&OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse + 64);
                      if (v78)
                        *v82 = v79;
                    }
                    *((_BYTE *)v80 + 16) &= 0xCFu;
                    v85 = v75;
                    v86 = v70;
                    if (*((__int16 *)v84 + 1696) >= 7)
                    {
                      if (coap_print_addr(v70 + 104, (char *)__errnum, 0x36uLL) && maxlog >= 7)
                        coap_log_impl(7, "** removed observer %s\n", (const char *)__errnum);
                      v86 = v80[1];
                      v85 = v80[4];
                    }
                    coap_cancel_all_messages(v321, v86, v80 + 5, v85);
                    coap_session_release(v80[1]);
                    v87 = (void *)v80[6];
                    if (v87)
                      free(v87);
                    free(v80);
                  }
                }
LABEL_129:
                ;
              }
              while (v74);
              v70 = *(_QWORD *)(v63 + 24);
              v64 = v319;
              v5 = v321;
              p_cb = (_DWORD *)(&OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse + 64);
              v31 = v314;
              v62 = v312;
            }
          }
          if (*(_BYTE *)(v70 + 226))
          {
            --*(_BYTE *)(v70 + 226);
            if (*(_BYTE *)(v70 + 2) == 4)
              coap_session_connected((unsigned __int8 *)v70);
          }
          if (!**(_BYTE **)(v63 + 40))
          {
            v89 = *(void (**)(uint64_t, _QWORD))(v5 + 80);
            if (v89)
              v89(v5, *(_QWORD *)(v63 + 24));
          }
          coap_delete_node((_QWORD **)v63);
        }
        else
        {
          *(_BYTE *)(v63 + 16) = v69 + 1;
          memset(__errnum, 0, sizeof(__errnum));
          gettimeofday((timeval *)__errnum, 0);
          v71 = 1000 * (*(_QWORD *)__errnum - coap_clock_offset)
              + ((unint64_t)((double)__errnum[2] * 1.024 + 512.0) >> 10);
          if (*v62)
          {
            v72 = v71 - *(_QWORD *)(v5 + 40) + (*(_DWORD *)(v63 + 20) << *(_BYTE *)(v63 + 16));
          }
          else
          {
            v72 = (*(_DWORD *)(v63 + 20) << *(_BYTE *)(v63 + 16));
            *(_QWORD *)(v5 + 40) = v71;
          }
          *(_QWORD *)(v63 + 8) = v72;
          coap_insert_node(v62, (_QWORD *)v63);
          if (*((__int16 *)p_cb + 1696) >= 7)
          {
            coap_session_str(*(_QWORD *)(v63 + 24));
            coap_log_impl(7, "** %s: tid=%d: retransmission #%d\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(v63 + 32), *(unsigned __int8 *)(v63 + 16));
          }
          v88 = *(unsigned __int8 **)(v63 + 24);
          if (v88[226])
            --v88[226];
          coap_send_pdu(v88, *(_BYTE **)(v63 + 40), v63);
        }
        v63 = *v62;
        if (!*v62)
          goto LABEL_167;
      }
      v90 = v65 - v31 + v66;
      if (v64 - 1 >= v90)
        v64 = v90;
    }
LABEL_167:
    v91 = (1000 * v64 + 999) / 0x3E8;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v92 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      __errnum[0] = 67109376;
      __errnum[1] = v91;
      LOWORD(__errnum[2]) = 1024;
      *(int *)((char *)&__errnum[2] + 2) = 0;
      _os_log_debug_impl(&dword_1CCE01000, v92, OS_LOG_TYPE_DEBUG, "Coap_write timeout %u, requested time %u", (uint8_t *)__errnum, 0xEu);
    }
    v320 = v91;
    memset(&v337, 0, sizeof(v337));
    memset(&v336, 0, sizeof(v336));
    memset(&v335, 0, sizeof(v335));
    v93 = 0;
    if (v35)
    {
      v94 = (int **)v339;
      v95 = v35;
      do
      {
        v96 = *v94;
        v97 = **v94;
        if ((int)v97 >= v93)
          v93 = v97 + 1;
        if ((v96[1] & 0x10) != 0 && __darwin_check_fd_set_overflow(**v94, &v337, 0))
          *(__int32_t *)((char *)v337.fds_bits + ((v97 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v97;
        if ((v96[1] & 0x20) != 0)
        {
          v98 = *v96;
          if (__darwin_check_fd_set_overflow(*v96, &v336, 0))
            *(__int32_t *)((char *)v336.fds_bits + (((unint64_t)v98 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v98;
        }
        if ((v96[1] & 0x40) != 0)
        {
          v99 = *v96;
          if (__darwin_check_fd_set_overflow(*v96, &v337, 0))
            *(__int32_t *)((char *)v337.fds_bits + (((unint64_t)v99 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v99;
        }
        if ((v96[1] & 0x80) != 0)
        {
          v100 = *v96;
          if (__darwin_check_fd_set_overflow(*v96, &v336, 0))
            *(__int32_t *)((char *)v336.fds_bits + (((unint64_t)v100 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v100;
          v101 = *v96;
          if (__darwin_check_fd_set_overflow(*v96, &v335, 0))
            *(__int32_t *)((char *)v335.fds_bits + (((unint64_t)v101 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v101;
        }
        ++v94;
        --v95;
      }
      while (v95);
    }
    if (v320)
    {
      LODWORD(v334) = 1000 * (v320 % 0x3E8);
      v333 = v320 / 0x3E8uLL;
    }
    v102 = &OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse.cb;
    if ((v317 & 0x80000000) == 0)
    {
      if (__darwin_check_fd_set_overflow(v317, &v337, 0))
        v337.fds_bits[v317 >> 5] |= 1 << v317;
      if (v93 <= (int)v317)
        v93 = v317 + 1;
    }
    if (v320)
      v103 = (timeval *)&v333;
    else
      v103 = 0;
    while (1)
    {
      v104 = select(v93, &v337, &v336, &v335, v103);
      if (v104 != -1)
        break;
      if (*__error() != 4)
      {
LABEL_202:
        if ((int)coap_get_log_level() >= 3)
        {
          v105 = __error();
          strerror(*v105);
          coap_log_impl(3, "%s");
        }
        goto LABEL_446;
      }
    }
    if (v104 >= 1 && v35)
    {
      v106 = v339;
      while (1)
      {
        v107 = *(_QWORD *)v106;
        v108 = *(_WORD *)(*(_QWORD *)v106 + 4);
        if ((v108 & 0x10) == 0)
          goto LABEL_211;
        v109 = *(_DWORD *)v107;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v107, &v337, 0))
          break;
        v108 = *(_WORD *)(v107 + 4);
        if ((v108 & 0x40) == 0)
          goto LABEL_212;
LABEL_220:
        v112 = *(_DWORD *)v107;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v107, &v337, 0))
        {
          v108 = *(_WORD *)(v107 + 4);
          if (((*(unsigned int *)((char *)v337.fds_bits + (((unint64_t)v112 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v112) & 1) == 0)
          {
LABEL_212:
            if ((v108 & 0x20) == 0)
              goto LABEL_213;
            goto LABEL_225;
          }
          v108 |= 0x400u;
          *(_WORD *)(v107 + 4) = v108;
          if ((v108 & 0x20) == 0)
            goto LABEL_213;
        }
        else
        {
          v108 = *(_WORD *)(v107 + 4);
          if ((v108 & 0x20) == 0)
            goto LABEL_213;
        }
LABEL_225:
        v113 = *(_DWORD *)v107;
        if (__darwin_check_fd_set_overflow(*(_DWORD *)v107, &v336, 0))
        {
          v108 = *(_WORD *)(v107 + 4);
          if (((*(unsigned int *)((char *)v336.fds_bits + (((unint64_t)v113 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v113) & 1) == 0)
          {
LABEL_213:
            if ((v108 & 0x80) != 0)
              goto LABEL_214;
            goto LABEL_230;
          }
          v114 = v108 | 0x200;
          *(_WORD *)(v107 + 4) = v114;
          if ((v114 & 0x80) != 0)
            goto LABEL_214;
        }
        else if ((*(_WORD *)(v107 + 4) & 0x80) != 0)
        {
LABEL_214:
          v110 = *(_DWORD *)v107;
          if (__darwin_check_fd_set_overflow(*(_DWORD *)v107, &v336, 0)
            && ((*(unsigned int *)((char *)v336.fds_bits + (((unint64_t)v110 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v110) & 1) != 0
            || (v111 = *(_DWORD *)v107, __darwin_check_fd_set_overflow(*(_DWORD *)v107, &v335, 0))
            && ((*(unsigned int *)((char *)v335.fds_bits + (((unint64_t)v111 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v111) & 1) != 0)
          {
            *(_WORD *)(v107 + 4) |= 0x800u;
          }
        }
LABEL_230:
        v106 = (_OWORD *)((char *)v106 + 8);
        if (!--v35)
          goto LABEL_231;
      }
      v108 = *(_WORD *)(v107 + 4);
      if (((*(unsigned int *)((char *)v337.fds_bits + (((unint64_t)v109 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v109) & 1) != 0)
      {
        v108 |= 0x100u;
        *(_WORD *)(v107 + 4) = v108;
      }
LABEL_211:
      if ((v108 & 0x40) == 0)
        goto LABEL_212;
      goto LABEL_220;
    }
LABEL_231:
    v115 = v321;
    if ((v317 & 0x80000000) == 0
      && __darwin_check_fd_set_overflow(v317, &v337, 0)
      && ((v337.fds_bits[v317 >> 5] >> v317) & 1) != 0)
    {
      do
      {
        while (1)
        {
          v116 = read(v317, __errnum, 0x20uLL);
          if (v116 != -1)
            break;
          if (*__error() == 35 || *__error() == 35)
            goto LABEL_241;
          if (*__error() != 4)
            goto LABEL_202;
        }
      }
      while (v116);
      log_level = coap_get_log_level();
      if (log_level >= 3)
        coap_log_impl(3, "Pipe closed unexpectedly");
LABEL_446:
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v306 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__errnum[0]) = 0;
        _os_log_error_impl(&dword_1CCE01000, v306, OS_LOG_TYPE_ERROR, "Failed to run coap_run_once", (uint8_t *)__errnum, 2u);
      }
      v41 = 0;
      goto LABEL_452;
    }
LABEL_241:
    memset(__errnum, 0, sizeof(__errnum));
    gettimeofday((timeval *)__errnum, 0);
    v117 = 1000 * (*(_QWORD *)__errnum - coap_clock_offset)
         + ((unint64_t)((double)__errnum[2] * 1.024 + 512.0) >> 10);
    v118 = *(_QWORD **)(v321 + 56);
    if (v118)
    {
      v119 = 0uLL;
      while (1)
      {
        v120 = (uint64_t)v118;
        v118 = (_QWORD *)*v118;
        v121 = *(_WORD *)(v120 + 28);
        if ((v121 & 0x100) != 0)
          break;
LABEL_354:
        if ((v121 & 0x400) != 0)
        {
          session = coap_make_session(*(unsigned __int8 *)(v120 + 16), 2, (unsigned int *)(v120 + 48), 0, 0, 0, v115, v120);
          v119 = 0uLL;
          if (session)
          {
            v223 = session;
            v224 = session + 104;
            __errnum[0] = 1;
            *(_WORD *)(v120 + 28) &= ~0x400u;
            v225 = accept(*(_DWORD *)(v120 + 24), (sockaddr *)(session + 108), (socklen_t *)session + 26);
            *((_DWORD *)v223 + 44) = v225;
            if (v225 == -1)
            {
              if (*((__int16 *)v102 + 1696) >= 4)
              {
                v256 = __error();
                v257 = strerror(*v256);
                coap_log_impl(4, "coap_socket_accept_tcp: accept: %s\n", v257);
              }
              coap_session_free(v223);
            }
            else
            {
              if (getsockname(v225, (sockaddr *)(v223 + 140), (socklen_t *)v223 + 34) < 0
                && *((__int16 *)v102 + 1696) >= 4)
              {
                v226 = __error();
                v227 = strerror(*v226);
                coap_log_impl(4, "coap_socket_accept_tcp: getsockname: %s\n", v227);
              }
              if (ioctl(*((_DWORD *)v223 + 44), 0x8004667EuLL, __errnum) == -1 && *((__int16 *)v102 + 1696) >= 4)
              {
                v229 = __error();
                v230 = strerror(*v229);
                coap_log_impl(4, "coap_socket_accept_tcp: ioctl FIONBIO: %s\n", v230);
              }
              v231 = 64;
              *((_WORD *)v223 + 90) |= 0x15u;
              *((_QWORD *)v223 + 23) = v223;
              v232 = 104;
              v233 = -1640531527;
              v234 = -1640531527;
              v235 = -17973521;
              do
              {
                v236 = *(_DWORD *)&v223[v232 + 4] + v233;
                v237 = *(_DWORD *)&v223[v232 + 8] + v235;
                v238 = (*(_DWORD *)&v223[v232] + v234 - (v236 + v237)) ^ (v237 >> 13);
                v239 = (v236 - v237 - v238) ^ (v238 << 8);
                v240 = (v237 - v238 - v239) ^ (v239 >> 13);
                v241 = (v238 - v239 - v240) ^ (v240 >> 12);
                v242 = (v239 - v240 - v241) ^ (v241 << 16);
                v243 = (v240 - v241 - v242) ^ (v242 >> 5);
                v234 = (v241 - v242 - v243) ^ (v243 >> 3);
                v233 = (v242 - v243 - v234) ^ (v234 << 10);
                v235 = (v243 - v234 - v233) ^ (v233 >> 15);
                v231 -= 12;
                v232 += 12;
              }
              while (v231 > 0xB);
              v244 = (v234
                    + (v223[167] << 24)
                    + (v223[166] << 16)
                    + (v223[165] << 8)
                    + v223[164]
                    + -64
                    - v235
                    - v233) ^ ((v235 + 64) >> 13);
              v245 = (v233 + -64 - v235 - v244) ^ (v244 << 8);
              v246 = (v235 + 64 - v244 - v245) ^ (v245 >> 13);
              v247 = (v244 - v245 - v246) ^ (v246 >> 12);
              v248 = (v245 - v246 - v247) ^ (v247 << 16);
              v249 = (v246 - v247 - v248) ^ (v248 >> 5);
              v250 = (v247 - v248 - v249) ^ (v249 >> 3);
              v251 = (v249 - v250 - ((v248 - v249 - v250) ^ (v250 << 10))) ^ (((v248 - v249 - v250) ^ (v250 << 10)) >> 15);
              v252 = (int32x2_t **)(v223 + 48);
              *((_QWORD *)v223 + 11) = v224;
              *((_DWORD *)v223 + 24) = 64;
              *((_DWORD *)v223 + 25) = v251;
              v253 = *(_QWORD *)(v120 + 80);
              v119 = 0uLL;
              if (v253)
              {
                *((_QWORD *)v223 + 6) = *(_QWORD *)(v253 + 48);
                *((_QWORD *)v223 + 8) = 0;
                v254 = *(uint64_t **)(v253 + 48);
                v255 = v254[3];
                *((_QWORD *)v223 + 7) = v255 - v254[4];
                *(_QWORD *)(v255 + 16) = v223;
                v254[3] = (uint64_t)v252;
              }
              else
              {
                *((_QWORD *)v223 + 7) = 0;
                *((_QWORD *)v223 + 8) = 0;
                *(_QWORD *)(v120 + 80) = v223;
                v258 = malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
                *(_QWORD *)(*(_QWORD *)(v120 + 80) + 48) = v258;
                if (!v258)
                  goto LABEL_459;
                v258[2] = 0u;
                v258[3] = 0u;
                *v258 = 0u;
                v258[1] = 0u;
                v259 = *(_QWORD *)(v120 + 80);
                v260 = *(_QWORD **)(v259 + 48);
                v260[1] = 0x500000020;
                v260[3] = v259 + 48;
                v260[4] = 48;
                v261 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
                **(_QWORD **)(*(_QWORD *)(v120 + 80) + 48) = v261;
                if (!v261)
                  goto LABEL_459;
                v119 = 0uLL;
                v261[30] = 0u;
                v261[31] = 0u;
                v261[28] = 0u;
                v261[29] = 0u;
                v261[26] = 0u;
                v261[27] = 0u;
                v261[24] = 0u;
                v261[25] = 0u;
                v261[22] = 0u;
                v261[23] = 0u;
                v261[20] = 0u;
                v261[21] = 0u;
                v261[18] = 0u;
                v261[19] = 0u;
                v261[16] = 0u;
                v261[17] = 0u;
                v261[14] = 0u;
                v261[15] = 0u;
                v261[12] = 0u;
                v261[13] = 0u;
                v261[10] = 0u;
                v261[11] = 0u;
                v261[8] = 0u;
                v261[9] = 0u;
                v261[6] = 0u;
                v261[7] = 0u;
                v261[4] = 0u;
                v261[5] = 0u;
                v261[2] = 0u;
                v261[3] = 0u;
                *v261 = 0u;
                v261[1] = 0u;
                v254 = *(uint64_t **)(*(_QWORD *)(v120 + 80) + 48);
                *((_DWORD *)v254 + 14) = -1609490463;
              }
              ++*((_DWORD *)v254 + 4);
              v262 = (*((_DWORD *)v254 + 2) - 1) & v251;
              v263 = *v254;
              v264 = *v254 + 16 * v262;
              v265 = *(_DWORD *)(v264 + 8) + 1;
              *(_DWORD *)(v264 + 8) = v265;
              v266 = *(_QWORD *)v264;
              *((_QWORD *)v223 + 9) = 0;
              *((_QWORD *)v223 + 10) = v266;
              if (v266)
                *(_QWORD *)(v266 + 24) = v252;
              *(_QWORD *)v264 = v252;
              if (v265 >= 10 * *(_DWORD *)(v263 + 16 * v262 + 12) + 10 && !(*v252)[6].i32[1])
              {
                v267 = malloc_type_malloc(32 * (*v252)[1].u32[0], 0x1020040EDED9539uLL);
                if (!v267)
                  goto LABEL_459;
                v268 = v267;
                bzero(v267, 32 * (*v252)[1].u32[0]);
                v269 = *v252;
                v270 = (*v252)[2].u32[0];
                v271 = (*v252)[1].u32[0];
                v272 = 2 * v271 - 1;
                if ((v272 & v270) != 0)
                  v273 = (v270 >> ((*v252)[1].i32[1] + 1)) + 1;
                else
                  v273 = v270 >> ((*v252)[1].i32[1] + 1);
                v269[5].i32[0] = v273;
                v269[5].i32[1] = 0;
                v274 = (_QWORD *)*v269;
                if ((_DWORD)v271)
                {
                  v275 = 0;
                  for (i = 0; i != v271; ++i)
                  {
                    v277 = v274[2 * i];
                    if (v277)
                    {
                      do
                      {
                        v278 = *(_QWORD *)(v277 + 32);
                        v279 = *(_DWORD *)(v277 + 52) & v272;
                        v280 = (char *)&v268[4 * v279];
                        v281 = *((_DWORD *)v280 + 2) + 1;
                        *((_DWORD *)v280 + 2) = v281;
                        if (v281 > v273)
                        {
                          v269[5].i32[1] = ++v275;
                          v268[4 * v279 + 3] = v281 / v273;
                        }
                        *(_QWORD *)(v277 + 24) = 0;
                        v282 = *(_QWORD *)v280;
                        *(_QWORD *)(v277 + 32) = *(_QWORD *)v280;
                        if (v282)
                          *(_QWORD *)(v282 + 24) = v277;
                        *(_QWORD *)v280 = v277;
                        v277 = v278;
                      }
                      while (v278);
                    }
                  }
                }
                free(v274);
                v283 = *v252;
                v284 = (*v252)[1];
                v285.i32[0] = vadd_s32(v284, v284).u32[0];
                v285.i32[1] = vadd_s32(v284, (int32x2_t)0x100000001).i32[1];
                v283[1] = v285;
                *v283 = (int32x2_t)v268;
                if (v283[5].i32[1] <= (unsigned __int32)v283[2].i32[0] >> 1)
                {
                  v283[6].i32[0] = 0;
                  v119 = 0uLL;
                }
                else
                {
                  v286 = v283[6].i32[0] + 1;
                  v283[6].i32[0] = v286;
                  v119 = 0uLL;
                  if (v286 >= 2)
                    v283[6].i32[1] = 1;
                }
              }
              if (*((__int16 *)v102 + 1696) >= 7)
              {
                coap_session_str((uint64_t)v223);
                coap_log_impl(7, "***%s: new incoming session\n", (const char *)&coap_session_str_szSession);
                v119 = 0uLL;
              }
              v287 = *v223;
              v115 = v321;
              if ((v287 - 3) <= 1)
              {
                coap_handle_event(*((_QWORD *)v223 + 26), 4097, (uint64_t)v223);
                v119 = 0uLL;
                v287 = *v223;
              }
              if (v287 != 4)
              {
                if (v287 == 3)
                {
                  coap_session_send_csm((unsigned __int8 *)v223);
                  v119 = 0uLL;
                }
                *((_QWORD *)v223 + 34) = v117;
                goto LABEL_406;
              }
              *((_QWORD *)v223 + 27) = 0;
              ++*((_DWORD *)v223 + 1);
              coap_session_release((uint64_t)v223);
            }
            v119 = 0uLL;
          }
        }
LABEL_406:
        v288 = *(_QWORD *)(v120 + 80);
        if (v288)
        {
          do
          {
            v289 = *(_QWORD *)(v288 + 64);
            v290 = *(_WORD *)(v288 + 180);
            if ((v290 & 0x100) != 0)
            {
              ++*(_DWORD *)(v288 + 4);
              coap_read_session();
              coap_session_release(v288);
              v119 = 0uLL;
              v290 = *(_WORD *)(v288 + 180);
            }
            if ((v290 & 0x200) != 0)
            {
              ++*(_DWORD *)(v288 + 4);
              coap_write_session(v288, v117);
              coap_session_release(v288);
              v119 = 0uLL;
            }
            v288 = v289;
          }
          while (v289);
        }
        v102 = &OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse.cb;
        if (!v118)
          goto LABEL_413;
      }
      if (*(unsigned __int8 *)(v120 + 16) - 3 <= 0xFFFFFFFD)
        __assert_rtn("coap_read_endpoint", "net.c", 1348, "COAP_PROTO_NOT_RELIABLE(endpoint->proto)");
      if ((v121 & 2) == 0)
        __assert_rtn("coap_read_endpoint", "net.c", 1349, "endpoint->sock.flags & COAP_SOCKET_BOUND");
      v370 = v119;
      v369 = v119;
      v368 = v119;
      v367 = v119;
      v366 = v119;
      v365 = v119;
      v364 = v119;
      v363 = v119;
      v362 = v119;
      v361 = v119;
      v360 = v119;
      v359 = v119;
      v358 = v119;
      v357 = v119;
      v356 = v119;
      v355 = v119;
      v354 = v119;
      v353 = v119;
      v352 = v119;
      v351 = v119;
      v350 = v119;
      v349 = v119;
      v348 = v119;
      v347 = v119;
      v346 = v119;
      v345 = v119;
      v344 = v119;
      v343 = v119;
      v341 = v119;
      *(_OWORD *)__errnum = v119;
      *(_OWORD *)v342 = v119;
      *(_OWORD *)&v342[16] = v119;
      v122 = *(_DWORD *)(v120 + 48);
      __errnum[0] = 28;
      *(_DWORD *)v342 = v122;
      v123 = *(unsigned __int8 *)(v120 + 53);
      if (v123 == 2)
      {
        *(_OWORD *)&v342[4] = *(_OWORD *)(v120 + 52);
      }
      else if (v123 == 30)
      {
        v342[5] = 30;
        *(_OWORD *)&v342[12] = *(_OWORD *)(v120 + 60);
        *(_WORD *)&v342[6] = *(_WORD *)(v120 + 54);
        *(_DWORD *)&v342[28] = *(_DWORD *)(v120 + 76);
      }
      else
      {
        __memcpy_chk();
      }
      v124 = (*(uint64_t (**)(uint64_t, int *))(v115 + 120))(v120 + 24, __errnum);
      if (v124 < 0)
      {
        v119 = 0uLL;
        if (maxlog >= 4)
        {
          if (coap_print_addr(v120 + 48, (char *)&coap_endpoint_str_szEndpoint, 0x80uLL))
            v160 = (int *)((char *)&coap_endpoint_str_szEndpoint + strlen((const char *)&coap_endpoint_str_szEndpoint));
          else
            v160 = &coap_endpoint_str_szEndpoint;
          if ((char *)v160 + 6 < (char *)&log_handler)
          {
            v164 = *(unsigned __int8 *)(v120 + 16);
            if (v164 == 2)
            {
              *((_WORD *)v160 + 2) = 83;
              v165 = 1280590880;
            }
            else if (v164 == 1)
            {
              *((_BYTE *)v160 + 4) = 0;
              v165 = 1346655520;
            }
            else
            {
              *((_WORD *)v160 + 2) = 69;
              v165 = 1313820192;
            }
            *v160 = v165;
          }
          coap_log_impl(4, "*  %s: read failed\n", v159);
          goto LABEL_352;
        }
        goto LABEL_353;
      }
      v125 = v124;
      v119 = 0uLL;
      if (!v124)
        goto LABEL_353;
      v126 = 64;
      v127 = __errnum;
      v128 = -1640531527;
      v129 = -1640531527;
      v130 = -17973521;
      do
      {
        v131 = v127[1] + v128;
        v132 = v127[2] + v130;
        v133 = (*v127 + v129 - (v131 + v132)) ^ (v132 >> 13);
        v134 = (v131 - v132 - v133) ^ (v133 << 8);
        v135 = (v132 - v133 - v134) ^ (v134 >> 13);
        v136 = (v133 - v134 - v135) ^ (v135 >> 12);
        v137 = (v134 - v135 - v136) ^ (v136 << 16);
        v138 = (v135 - v136 - v137) ^ (v137 >> 5);
        v129 = (v136 - v137 - v138) ^ (v138 >> 3);
        v128 = (v137 - v138 - v129) ^ (v129 << 10);
        v130 = (v138 - v129 - v128) ^ (v128 >> 15);
        v127 += 3;
        v126 -= 12;
      }
      while (v126 > 0xB);
      v139 = *(_QWORD *)(v120 + 80);
      if (!v139)
      {
        v161 = *(_QWORD *)(v120 + 8);
        goto LABEL_293;
      }
      v140 = (v129 + (v342[31] << 24) + (v342[30] << 16) + (v342[29] << 8) + v342[28] + -64 - v130 - v128) ^ ((v130 + 64) >> 13);
      v141 = (v128 + -64 - v130 - v140) ^ (v140 << 8);
      v142 = (v130 + 64 - v140 - v141) ^ (v141 >> 13);
      v143 = (v140 - v141 - v142) ^ (v142 >> 12);
      v144 = (v141 - v142 - v143) ^ (v143 << 16);
      v145 = (v142 - v143 - v144) ^ (v144 >> 5);
      v146 = (v143 - v144 - v145) ^ (v145 >> 3);
      v147 = (v145 - v146 - ((v144 - v145 - v146) ^ (v146 << 10))) ^ (((v144 - v145 - v146) ^ (v146 << 10)) >> 15);
      v148 = *(_QWORD *)(v139 + 48);
      v149 = *(_QWORD *)(*(_QWORD *)v148 + 16 * ((*(_DWORD *)(v148 + 8) - 1) & v147));
      if (v149)
      {
        v150 = -*(_QWORD *)(v148 + 32);
        while (1)
        {
          v151 = v149 + v150;
          if (*(_DWORD *)(v149 + v150 + 100) == v147 && *(_DWORD *)(v151 + 96) == 64)
          {
            v152 = memcmp(*(const void **)(v151 + 88), __errnum, 0x40uLL);
            v119 = 0uLL;
            if (!v152)
              break;
          }
          v149 = *(_QWORD *)(v151 + 80);
          if (!v149)
            goto LABEL_262;
        }
        *(_QWORD *)(v151 + 272) = v117;
        v115 = v321;
        v102 = (_DWORD *)(&OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse + 64);
        goto LABEL_348;
      }
LABEL_262:
      v153 = 0;
      v154 = 0;
      v155 = 0;
      v156 = 0;
      v102 = &OBJC_PROTOCOL___HAP2EncodedCharacteristicResponse.cb;
      do
      {
        if (!*(_DWORD *)(v139 + 4) && !*(_QWORD *)(v139 + 232))
        {
          v157 = *(unsigned __int8 *)(v139 + 1);
          if (v157 == 3)
            goto LABEL_273;
          if (v157 == 2)
          {
            if (!v154 || *(_QWORD *)(v139 + 272) < *(_QWORD *)(v154 + 272))
              v154 = v139;
            ++v156;
            if (*(_BYTE *)(v139 + 2) == 2)
            {
LABEL_273:
              ++v155;
              v158 = *(_QWORD *)(v139 + 272);
              if (v158 + 30000 < v117 && (!v153 || v158 < *(_QWORD *)(v153 + 272)))
                v153 = v139;
            }
          }
        }
        v139 = *(_QWORD *)(v139 + 64);
      }
      while (v139);
      if (*(_DWORD *)(*(_QWORD *)(v120 + 8) + 196) - 1 >= v156)
      {
        if (!v153)
          goto LABEL_286;
        if (maxlog >= 4)
        {
          coap_session_str(v153);
          coap_log_impl(4, "***%s: Incomplete session timed out\n", (const char *)&coap_session_str_szSession);
        }
        v154 = v153;
      }
      coap_session_free((_DWORD *)v154);
      v119 = 0uLL;
LABEL_286:
      v161 = *(_QWORD *)(v120 + 8);
      v162 = *(_DWORD *)(v161 + 200);
      if (!v162)
        v162 = 100;
      v67 = v155 > v162;
      v115 = v321;
      if (v67)
      {
        if (maxlog >= 7)
        {
          coap_log_impl(7, "Oustanding sessions in COAP_SESSION_STATE_HANDSHAKE too large.  New request ignored\n", *(double *)&v119, v309, v310, v311);
LABEL_352:
          v119 = 0uLL;
        }
LABEL_353:
        v121 = *(_WORD *)(v120 + 28);
        goto LABEL_354;
      }
LABEL_293:
      v163 = *(unsigned __int8 *)(v120 + 16);
      if (v163 == 2)
      {
        if (*((_QWORD *)&v343 + 1) <= 0xDuLL)
        {
          if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_dtls_hello: ContentType %d Short Packet (%zu < %d) dropped\n", *(double *)&v119);
            goto LABEL_352;
          }
          goto LABEL_353;
        }
        if (v344 == 21)
          goto LABEL_353;
        if (v344 != 22 || BYTE13(v344) != 1)
        {
          if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_dtls_hello: ContentType %d Handshake %d dropped\n", *(double *)&v119);
            goto LABEL_352;
          }
          goto LABEL_353;
        }
        v163 = 2;
      }
      v166 = coap_make_session(v163, 2, 0, (unsigned int *)v342, (unsigned int *)__errnum, v343, v161, v120);
      v119 = 0uLL;
      if (v166)
      {
        v151 = (uint64_t)v166;
        *((_QWORD *)v166 + 34) = v117;
        v167 = *(unsigned __int8 *)(v120 + 16);
        if (v167 == 2)
        {
          v166[1] = 3;
        }
        else if (v167 == 1)
        {
          v166[2] = 4;
        }
        v168 = 64;
        v169 = 104;
        v170 = -1640531527;
        v171 = -1640531527;
        v172 = -17973521;
        do
        {
          v173 = *(_DWORD *)&v166[v169 + 4] + v170;
          v174 = *(_DWORD *)&v166[v169 + 8] + v172;
          v175 = (*(_DWORD *)&v166[v169] + v171 - (v173 + v174)) ^ (v174 >> 13);
          v176 = (v173 - v174 - v175) ^ (v175 << 8);
          v177 = (v174 - v175 - v176) ^ (v176 >> 13);
          v178 = (v175 - v176 - v177) ^ (v177 >> 12);
          v179 = (v176 - v177 - v178) ^ (v178 << 16);
          v180 = (v177 - v178 - v179) ^ (v179 >> 5);
          v171 = (v178 - v179 - v180) ^ (v180 >> 3);
          v170 = (v179 - v180 - v171) ^ (v171 << 10);
          v172 = (v180 - v171 - v170) ^ (v170 >> 15);
          v168 -= 12;
          v169 += 12;
        }
        while (v168 > 0xB);
        v181 = (v171
              + (v166[167] << 24)
              + (v166[166] << 16)
              + (v166[165] << 8)
              + v166[164]
              + -64
              - v172
              - v170) ^ ((v172 + 64) >> 13);
        v182 = (v170 + -64 - v172 - v181) ^ (v181 << 8);
        v183 = (v172 + 64 - v181 - v182) ^ (v182 >> 13);
        v184 = (v181 - v182 - v183) ^ (v183 >> 12);
        v185 = (v182 - v183 - v184) ^ (v184 << 16);
        v186 = (v183 - v184 - v185) ^ (v185 >> 5);
        v187 = (v184 - v185 - v186) ^ (v186 >> 3);
        v188 = (v186 - v187 - ((v185 - v186 - v187) ^ (v187 << 10))) ^ (((v185 - v186 - v187) ^ (v187 << 10)) >> 15);
        v189 = (int32x2_t **)(v166 + 48);
        *((_QWORD *)v166 + 11) = v166 + 104;
        *((_DWORD *)v166 + 24) = 64;
        *((_DWORD *)v166 + 25) = v188;
        v190 = *(_QWORD *)(v120 + 80);
        if (v190)
        {
          *((_QWORD *)v166 + 6) = *(_QWORD *)(v190 + 48);
          *((_QWORD *)v166 + 8) = 0;
          v191 = *(uint64_t **)(v190 + 48);
          v192 = v191[3];
          *((_QWORD *)v166 + 7) = v192 - v191[4];
          *(_QWORD *)(v192 + 16) = v166;
          v191[3] = (uint64_t)v189;
        }
        else
        {
          *((_QWORD *)v166 + 7) = 0;
          *((_QWORD *)v166 + 8) = 0;
          *(_QWORD *)(v120 + 80) = v166;
          v193 = malloc_type_malloc(0x40uLL, 0x10200405F856B24uLL);
          *(_QWORD *)(*(_QWORD *)(v120 + 80) + 48) = v193;
          if (!v193)
            goto LABEL_459;
          v193[2] = 0u;
          v193[3] = 0u;
          *v193 = 0u;
          v193[1] = 0u;
          v194 = *(_QWORD *)(v120 + 80);
          v195 = *(_QWORD **)(v194 + 48);
          v195[1] = 0x500000020;
          v195[3] = v194 + 48;
          v195[4] = 48;
          v196 = malloc_type_malloc(0x200uLL, 0x1020040EDED9539uLL);
          **(_QWORD **)(*(_QWORD *)(v120 + 80) + 48) = v196;
          if (!v196)
LABEL_459:
            exit(-1);
          v196[30] = 0u;
          v196[31] = 0u;
          v196[28] = 0u;
          v196[29] = 0u;
          v196[26] = 0u;
          v196[27] = 0u;
          v196[24] = 0u;
          v196[25] = 0u;
          v196[22] = 0u;
          v196[23] = 0u;
          v196[20] = 0u;
          v196[21] = 0u;
          v196[18] = 0u;
          v196[19] = 0u;
          v196[16] = 0u;
          v196[17] = 0u;
          v196[14] = 0u;
          v196[15] = 0u;
          v196[12] = 0u;
          v196[13] = 0u;
          v196[10] = 0u;
          v196[11] = 0u;
          v196[8] = 0u;
          v196[9] = 0u;
          v196[6] = 0u;
          v196[7] = 0u;
          v196[4] = 0u;
          v196[5] = 0u;
          v196[2] = 0u;
          v196[3] = 0u;
          *v196 = 0u;
          v196[1] = 0u;
          v191 = *(uint64_t **)(*(_QWORD *)(v120 + 80) + 48);
          *((_DWORD *)v191 + 14) = -1609490463;
        }
        ++*((_DWORD *)v191 + 4);
        v197 = (*((_DWORD *)v191 + 2) - 1) & v188;
        v198 = *v191;
        v199 = *v191 + 16 * v197;
        v200 = *(_DWORD *)(v199 + 8) + 1;
        *(_DWORD *)(v199 + 8) = v200;
        v201 = *(_QWORD *)v199;
        *(_QWORD *)(v151 + 72) = 0;
        *(_QWORD *)(v151 + 80) = v201;
        if (v201)
          *(_QWORD *)(v201 + 24) = v189;
        *(_QWORD *)v199 = v189;
        if (v200 >= 10 * *(_DWORD *)(v198 + 16 * v197 + 12) + 10 && !(*v189)[6].i32[1])
        {
          v202 = malloc_type_malloc(32 * (*v189)[1].u32[0], 0x1020040EDED9539uLL);
          if (!v202)
            goto LABEL_459;
          v203 = v202;
          bzero(v202, 32 * (*v189)[1].u32[0]);
          v204 = *v189;
          v205 = (*v189)[2].u32[0];
          v206 = (*v189)[1].u32[0];
          v207 = 2 * v206 - 1;
          if ((v207 & v205) != 0)
            v208 = (v205 >> ((*v189)[1].i32[1] + 1)) + 1;
          else
            v208 = v205 >> ((*v189)[1].i32[1] + 1);
          v204[5].i32[0] = v208;
          v204[5].i32[1] = 0;
          v209 = (_QWORD *)*v204;
          if ((_DWORD)v206)
          {
            v210 = 0;
            for (j = 0; j != v206; ++j)
            {
              v212 = v209[2 * j];
              if (v212)
              {
                do
                {
                  v213 = *(_QWORD *)(v212 + 32);
                  v214 = *(_DWORD *)(v212 + 52) & v207;
                  v215 = (char *)&v203[4 * v214];
                  v216 = *((_DWORD *)v215 + 2) + 1;
                  *((_DWORD *)v215 + 2) = v216;
                  if (v216 > v208)
                  {
                    v204[5].i32[1] = ++v210;
                    v203[4 * v214 + 3] = v216 / v208;
                  }
                  *(_QWORD *)(v212 + 24) = 0;
                  v217 = *(_QWORD *)v215;
                  *(_QWORD *)(v212 + 32) = *(_QWORD *)v215;
                  if (v217)
                    *(_QWORD *)(v217 + 24) = v212;
                  *(_QWORD *)v215 = v212;
                  v212 = v213;
                }
                while (v213);
              }
            }
          }
          free(v209);
          v218 = *v189;
          v219 = (*v189)[1];
          v220.i32[0] = vadd_s32(v219, v219).u32[0];
          v220.i32[1] = vadd_s32(v219, (int32x2_t)0x100000001).i32[1];
          v218[1] = v220;
          *v218 = (int32x2_t)v203;
          if (v218[5].i32[1] <= (unsigned __int32)v218[2].i32[0] >> 1)
          {
            v218[6].i32[0] = 0;
          }
          else
          {
            v221 = v218[6].i32[0] + 1;
            v218[6].i32[0] = v221;
            if (v221 >= 2)
              v218[6].i32[1] = 1;
          }
        }
        if (maxlog < 7)
        {
          v115 = v321;
LABEL_351:
          coap_handle_dgram_for_proto(v115, (unsigned __int8 *)v151, (uint64_t)__errnum);
          goto LABEL_352;
        }
        coap_session_str(v151);
        coap_log_impl(7, "***%s: new incoming session\n", (const char *)&coap_session_str_szSession);
        v115 = v321;
LABEL_348:
        if (*((__int16 *)v102 + 1696) >= 7)
        {
          coap_session_str(v151);
          coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v125);
        }
        goto LABEL_351;
      }
      goto LABEL_353;
    }
LABEL_413:
    v291 = *(unsigned __int8 **)(v115 + 64);
    if (!v291)
    {
LABEL_445:
      if (((unint64_t)((((125 * (v117 - v314)) & 0x1FFFFFFFFFFFFFFFLL)
                                            * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4) == -1)
        goto LABEL_446;
      v41 = 1;
LABEL_452:
      __HMFActivityScopeLeave();

      goto LABEL_453;
    }
    while (1)
    {
      v292 = (unsigned __int8 *)*((_QWORD *)v291 + 8);
      v293 = *((_WORD *)v291 + 90);
      if ((v293 & 0x800) == 0)
      {
        if ((*((_WORD *)v291 + 90) & 0x100) != 0)
          goto LABEL_433;
        goto LABEL_416;
      }
      ++*((_DWORD *)v291 + 1);
      __errnum[0] = 0;
      v338 = 4;
      *((_WORD *)v291 + 90) = v293 & 0xF77F;
      if (getsockopt(*((_DWORD *)v291 + 44), 0xFFFF, 4103, __errnum, &v338) == -1 && maxlog >= 4)
      {
        v295 = __error();
        v296 = strerror(*v295);
        coap_log_impl(4, "coap_socket_finish_connect_tcp: getsockopt: %s\n", v296);
      }
      if (__errnum[0])
        break;
      if (getsockname(*((_DWORD *)v291 + 44), (sockaddr *)(v291 + 140), (socklen_t *)v291 + 34) == -1 && maxlog >= 4)
      {
        v301 = __error();
        v302 = strerror(*v301);
        coap_log_impl(4, "coap_socket_connect_tcp: getsockname: %s\n", v302);
      }
      if (getpeername(*((_DWORD *)v291 + 44), (sockaddr *)(v291 + 108), (socklen_t *)v291 + 26) == -1 && maxlog >= 4)
      {
        v303 = __error();
        v304 = strerror(*v303);
        coap_log_impl(4, "coap_socket_connect_tcp: getpeername: %s\n", v304);
      }
      *((_QWORD *)v291 + 34) = v117;
      coap_handle_event(*((_QWORD *)v291 + 26), 4097, (uint64_t)v291);
      v305 = *v291;
      if (v305 == 4)
      {
        v291[2] = 2;
        *((_QWORD *)v291 + 27) = 0;
        coap_handle_event(*((_QWORD *)v291 + 26), 512, (uint64_t)v291);
        v299 = v291;
        v300 = 3;
LABEL_431:
        coap_session_disconnected(v299, v300);
        goto LABEL_432;
      }
      if (v305 == 3)
        coap_session_send_csm(v291);
LABEL_432:
      coap_session_release((uint64_t)v291);
      v293 = *((_WORD *)v291 + 90);
      if ((v293 & 0x100) != 0)
      {
LABEL_433:
        ++*((_DWORD *)v291 + 1);
        coap_read_session();
        coap_session_release((uint64_t)v291);
        if ((*((_WORD *)v291 + 90) & 0x200) == 0)
          goto LABEL_418;
LABEL_417:
        ++*((_DWORD *)v291 + 1);
        coap_write_session((uint64_t)v291, v117);
        coap_session_release((uint64_t)v291);
        goto LABEL_418;
      }
LABEL_416:
      if ((v293 & 0x200) != 0)
        goto LABEL_417;
LABEL_418:
      v291 = v292;
      if (!v292)
        goto LABEL_445;
    }
    if (maxlog >= 4)
    {
      v297 = strerror(__errnum[0]);
      coap_log_impl(4, "coap_socket_finish_connect_tcp: connect failed: %s\n", v297);
    }
    v298 = *((_DWORD *)v291 + 44);
    if (v298 != -1)
    {
      *((_QWORD *)v291 + 23) = 0;
      *((_QWORD *)v291 + 24) = 0;
      close(v298);
      *((_DWORD *)v291 + 44) = -1;
    }
    *((_WORD *)v291 + 90) = 0;
    coap_handle_event(*((_QWORD *)v291 + 26), 4099, (uint64_t)v291);
    v299 = v291;
    v300 = 1;
    goto LABEL_431;
  }
  v41 = 0;
LABEL_453:
  _Block_object_dispose(v324, 8);
  __HMFActivityScopeLeave();

  _Block_object_dispose(&v327, 8);
  return v41;
}

- (void)_cleanupWithContext:(coap_context_t *)a3
{
  HAP2Lock *lock;
  HAP2Lock *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HAP2Lock *v10;
  HAP2Lock *v11;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18826;
  v24 = __Block_byref_object_dispose__18827;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18826;
  v18 = __Block_byref_object_dispose__18827;
  v19 = 0;
  if (self)
    lock = self->_lock;
  else
    lock = 0;
  v6 = lock;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke;
  v13[3] = &unk_1E894DEE8;
  v13[4] = self;
  v13[5] = &v20;
  -[HAP2Lock performBlock:](v6, "performBlock:", v13);

  objc_msgSend((id)v21[5], "enumerateObjectsUsingBlock:", &__block_literal_global_18846);
  -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_58);

  -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  if (self)
    v10 = self->_lock;
  else
    v10 = 0;
  v11 = v10;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_4;
  v12[3] = &unk_1E894DEE8;
  v12[4] = self;
  v12[5] = &v14;
  -[HAP2Lock performBlock:](v11, "performBlock:", v12);

  objc_msgSend((id)v15[5], "enumerateObjectsUsingBlock:", &__block_literal_global_59);
  coap_free_context((uint64_t)a3);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)_processQueueEntry:(id)a3 context:(coap_context_t *)a4
{
  id *v6;
  id v7;
  id v8;
  BOOL v9;
  HAP2Lock *lock;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  HAP2CoAPIOThread *v17;
  id *v18;

  v6 = (id *)a3;
  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  if (!v6)
  {
    v7 = 0;
    v11 = 0;
    goto LABEL_12;
  }
  v7 = v6[1];
  v8 = v6[2];
  if (v8 == (id)8)
  {
    if (self)
      lock = self->_lock;
    else
      lock = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __47__HAP2CoAPIOThread__processQueueEntry_context___block_invoke;
    v16 = &unk_1E894E0F8;
    v17 = self;
    v18 = v6;
    -[HAP2Lock performBlock:](lock, "performBlock:", &v13);

LABEL_11:
    v11 = v6[3];
LABEL_12:
    v9 = -[HAP2CoAPIOThread _processSessionBlock:consumer:context:](self, "_processSessionBlock:consumer:context:", v11, v7, a4, v13, v14, v15, v16, v17);
    goto LABEL_13;
  }
  if (v8 == (id)2)
  {
    -[HAP2CoAPIOThread _unregisterConsumer:](self, "_unregisterConsumer:", v7);
    goto LABEL_7;
  }
  if (v8 != (id)1)
    goto LABEL_11;
  -[HAP2CoAPIOThread _registerConsumer:context:](self, "_registerConsumer:context:", v7, a4);
LABEL_7:
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)_registerConsumer:(id)a3 context:(coap_context_t *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  HAP2CoAPIOConsumerInfo *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ Register (IO Thread)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v10);
  v11 = -[HAP2CoAPIOConsumerInfo initWithConsumer:]([HAP2CoAPIOConsumerInfo alloc], "initWithConsumer:", v6);
  -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didRegister");
  if (a4)
  {
    -[HAP2CoAPIOConsumerInfo setSession:](v11, "setSession:", objc_msgSend(v6, "shouldOpenSessionWithContext:", a4));
    if (-[HAP2CoAPIOConsumerInfo session](v11, "session"))
    {
      v13 = -[HAP2CoAPIOConsumerInfo session](v11, "session");
      if (!v13)
        __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
      *(_QWORD *)(v13 + 344) = v6;
    }
  }
  objc_msgSend(v14, "invalidate");

  __HMFActivityScopeLeave();
}

- (void)_unregisterConsumer:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HAP2CoAPIOThread *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;

  v4 = a3;
  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Unregister (IO Thread)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18826;
  v20 = __Block_byref_object_dispose__18827;
  v21 = 0;
  -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__HAP2CoAPIOThread__unregisterConsumer___block_invoke;
  v12[3] = &unk_1E894CE48;
  v10 = v4;
  v14 = self;
  v15 = &v16;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  if (v17[5])
  {
    -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsAtIndexes:", v17[5]);

  }
  objc_msgSend(v22, "invalidate");

  _Block_object_dispose(&v16, 8);
  __HMFActivityScopeLeave();

}

- (BOOL)_processSessionBlock:(id)a3 consumer:(id)a4 context:(coap_context_t *)a5
{
  void (**v8)(id, coap_context_t *, _QWORD);
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v8 = (void (**)(id, coap_context_t *, _QWORD))a3;
  v9 = a4;
  -[HAP2CoAPIOThread _assertIsCurrentThread](self, "_assertIsCurrentThread");
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ Session Block (IO Thread)"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v13);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[HAP2CoAPIOThread consumerInfo]((id *)&self->super.super.isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__HAP2CoAPIOThread__processSessionBlock_consumer_context___block_invoke;
  v17[3] = &unk_1E894CE70;
  v15 = v9;
  v18 = v15;
  v19 = &v20;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  v8[2](v8, a5, v21[3]);
  objc_msgSend(v24, "invalidate");
  LOBYTE(a5) = v21[3] != 0;

  _Block_object_dispose(&v20, 8);
  __HMFActivityScopeLeave();

  return (char)a5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zombieSessions, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_consumerInfo, 0);
  objc_storeStrong((id *)&self->_completedQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)consumerInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_assertIsCurrentThread");
    a1 = (id *)v1[12];
  }
  return a1;
}

void __58__HAP2CoAPIOThread__processSessionBlock_consumer_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "session");
    *a4 = 1;
  }

}

void __40__HAP2CoAPIOThread__unregisterConsumer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HAP2CoAPIOThreadSessionQueueEntry *v11;
  uint64_t v12;
  void *v13;
  HAP2CoAPIOThreadSessionQueueEntry *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "consumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (objc_msgSend(v17, "session"))
    {
      v10 = objc_msgSend(v17, "session");
      if (!v10)
        __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
      *(_QWORD *)(v10 + 344) = 0;
      v11 = [HAP2CoAPIOThreadSessionQueueEntry alloc];
      v12 = objc_msgSend(v17, "session");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HAP2CoAPIOThreadSessionQueueEntry initWithSession:startTime:](v11, "initWithSession:startTime:", v12, v13);

      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
        v16 = *(void **)(v15 + 128);
      else
        v16 = 0;
      objc_msgSend(v16, "addObject:", v14);
      objc_msgSend(v17, "setSession:", 0);
      objc_msgSend(*(id *)(a1 + 32), "didCloseSession");

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "didUnregister");
  }

}

uint64_t __47__HAP2CoAPIOThread__processQueueEntry_context___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[15];
  return objc_msgSend(v1, "addObject:", *(_QWORD *)(a1 + 40));
}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

  }
}

uint64_t __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 128);
  else
    v3 = 0;
  result = objc_msgSend(v3, "count");
  if (result)
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
      v5 = (_QWORD *)v5[16];
    v6 = v5;
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 128);
    else
      v11 = 0;
    return objc_msgSend(v11, "removeAllObjects");
  }
  return result;
}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "distantFuture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reapSession:", v4);

}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "consumer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "session"))
  {
    v3 = objc_msgSend(v4, "session");
    if (!v3)
      __assert_rtn("coap_session_set_app_data", "coap_session.c", 86, "session");
    *(_QWORD *)(v3 + 344) = 0;
    coap_session_release(objc_msgSend(v4, "session"));
    objc_msgSend(v4, "setSession:", 0);
  }
  if (v2)
    objc_msgSend(v2, "didCloseSession");

}

void __40__HAP2CoAPIOThread__cleanupWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = *((_QWORD *)v2 + 3);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
      v3 = v5;
    }
  }

}

- (id)queue
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[13], "assertOwner");
    a1 = (id *)v1[9];
  }
  return a1;
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke(uint64_t a1)
{
  id **v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id *v7;
  id *v8;
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[5];
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = (id **)(a1 + 32);
  -[HAP2CoAPIOThread completedQueue](*(id **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_2;
  v54[3] = &unk_1E894CD10;
  v54[4] = *v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v54);

  -[HAP2CoAPIOThread completedQueue](*v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__18826;
  v52 = __Block_byref_object_dispose__18827;
  v53 = 0;
  v7 = *v2;
  if (*v2)
    v7 = (id *)v7[16];
  v8 = v7;
  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_3;
  v45[3] = &unk_1E894CD38;
  v9 = v6;
  v46 = v9;
  v47 = &v48;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v45);

  v10 = v49;
  if (v49[5])
  {
    v11 = *(_QWORD **)(a1 + 32);
    if (v11)
      v11 = (_QWORD *)v11[16];
    v12 = v11;
    objc_msgSend(v12, "removeObjectsAtIndexes:", v10[5]);

  }
  v13 = (void *)MEMORY[0x1E0C99DE8];
  -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  -[HAP2CoAPIOThread queue](*(id **)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  v19 = *(_QWORD **)(a1 + 32);
  if (v19)
    v19 = (_QWORD *)v19[10];
  v20 = v19;
  if (!objc_msgSend(v20, "count"))
    goto LABEL_25;
  v21 = *(_QWORD **)(a1 + 32);
  if (v21)
    v21 = (_QWORD *)v21[15];
  v22 = v21;
  v23 = objc_msgSend(v22, "count");
  v24 = *(_QWORD *)(a1 + 32);
  if (!v24)
  {

LABEL_25:
    goto LABEL_26;
  }
  v25 = v23 < *(_QWORD *)(v24 + 136);

  if (v25)
  {
    v26 = *(_QWORD **)(a1 + 32);
    if (v26)
      v26 = (_QWORD *)v26[10];
    v27 = v26;
    objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *(_QWORD **)(a1 + 32);
    if (v29)
    {
      v30 = v29[17];
      v29 = (_QWORD *)v29[15];
    }
    else
    {
      v30 = 0;
    }
    v31 = v29;
    v32 = objc_msgSend(v31, "count");

    v33 = objc_msgSend(v28, "count");
    if (v30 - v32 >= v33)
      v34 = v33;
    else
      v34 = v30 - v32;
    objc_msgSend(v28, "subarrayWithRange:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v35);
    v36 = *(_QWORD **)(a1 + 32);
    if (v36)
      v36 = (_QWORD *)v36[10];
    v37 = v36;
    objc_msgSend(v37, "removeObjectsInArray:", v35);

    goto LABEL_34;
  }
LABEL_26:
  v38 = *(_QWORD **)(a1 + 32);
  if (v38)
    v38 = (_QWORD *)v38[15];
  v39 = v38;
  v40 = objc_msgSend(v39, "count");
  v41 = *(_QWORD *)(a1 + 32);
  if (v41)
    v41 = *(_QWORD *)(v41 + 136);
  v42 = v40 == v41;

  if (v42)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v43 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
    {
      v44 = *(_QWORD *)(a1 + 32);
      if (v44)
        v44 = *(_QWORD *)(v44 + 136);
      *(_DWORD *)buf = 134217984;
      v56 = v44;
      _os_log_debug_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_DEBUG, "Coap IO all %lu sliding window slots in use", buf, 0xCu);
    }
  }
LABEL_34:

  _Block_object_dispose(&v48, 8);
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_54(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "end");
  if (v6)
    v3 = (void *)v6[5];
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "begin");
  if ((objc_msgSend(*(id *)(a1 + 32), "_processQueueEntry:context:", v6, *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "end");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

- (id)completedQueue
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[13], "assertOwner");
    a1 = (id *)v1[11];
  }
  return a1;
}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a2)
    v3 = *(_QWORD *)(a2 + 8);
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(consumer = %@)"), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 120);
  else
    v6 = 0;
  v10 = (id)v4;
  objc_msgSend(v6, "filteredSetUsingPredicate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 120);
  else
    v9 = 0;
  objc_msgSend(v9, "minusSet:", v7);

}

void __45__HAP2CoAPIOThread__processQueueWithContext___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (objc_msgSend(a2, "reapSession:", *(_QWORD *)(a1 + 32)))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "addIndex:", a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
  else
  {
    *a4 = 1;
  }
}

void __29__HAP2CoAPIOThread__enqueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_5;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 != 8)
  {
    if (v3 == 16)
    {
      -[HAP2CoAPIOThread completedQueue](*(id **)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = v4;
      objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

      return;
    }
LABEL_5:
    -[HAP2CoAPIOThread queue](*(id **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(void **)(v5 + 80);
  else
    v6 = 0;
  objc_msgSend(v6, "addObject:");
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
  return WeakRetained;
}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8989608, CFSTR("COAPDefaultFlowControlMessageCount"));
}

@end
