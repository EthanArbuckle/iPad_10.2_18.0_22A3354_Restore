@implementation CTConnectionPair

- (CTConnectionPair)initWithQueue:(id)a3 delegate:(id)a4 endpoint1:(id)a5 parameters1:(id)a6 endpoint2:(id)a7 parameter2:(id)a8
{
  id v15;
  id v16;
  id v17;
  CTConnectionPair *v18;
  OS_nw_connection *fConnection1;
  OS_nw_connection *fConnection2;
  CTConnectionPair *v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v15 = a4;
  v25 = a5;
  v24 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)CTConnectionPair;
  v18 = -[CTConnectionPair init](&v27, sel_init);
  if (!v18)
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EDD26520) & 1) == 0)
  {
    CTLogConnectionPair();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CTConnectionPair initWithQueue:delegate:endpoint1:parameters1:endpoint2:parameter2:].cold.1(v22);

    goto LABEL_7;
  }
  v18->fStarted = 0;
  objc_storeStrong((id *)&v18->fQueue, a3);
  objc_storeWeak((id *)&v18->fDelegate, v15);
  fConnection1 = v18->fConnection1;
  v18->fConnectionPairState = 0;
  v18->fConnection1 = 0;

  objc_storeStrong((id *)&v18->fEndpoint1, a5);
  objc_storeStrong((id *)&v18->fParameters1, a6);
  v18->fConnectionState1 = 0;
  fConnection2 = v18->fConnection2;
  v18->fConnection2 = 0;

  objc_storeStrong((id *)&v18->fEndpoint2, a7);
  objc_storeStrong((id *)&v18->fParameters2, a8);
  v18->fConnectionState2 = 0;
  v21 = v18;
LABEL_8:

  return v21;
}

- (void)receiveData:(int64_t)a3
{
  OS_dispatch_queue *v5;
  uint64_t v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11[2];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = self->fQueue;
  location = 0;
  objc_initWeak(&location, self);
  v6 = 72;
  if (!a3)
    v6 = 40;
  v7 = *(NSObject **)((char *)&self->super.isa + v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__CTConnectionPair_receiveData___block_invoke;
  v9[3] = &unk_1E1530E48;
  v11[1] = (id)a3;
  v8 = v5;
  v10 = v8;
  objc_copyWeak(v11, &location);
  nw_connection_receive_message(v7, v9);
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __32__CTConnectionPair_receiveData___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id to;
  NSObject *v20;
  uint64_t v21;
  id *v22;
  id *v23;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    CTLogConnectionPair();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __32__CTConnectionPair_receiveData___block_invoke_cold_2();
  }
  else if (v8)
  {
    v12 = v8;
    v13 = *(void **)(a1 + 32);
    objc_copyWeak(&to, (id *)(a1 + 40));
    v11 = v12;
    v14 = *(_QWORD *)(a1 + 48);
    v20 = v11;
    v21 = v14;
    v15 = v13;
    v16 = operator new();
    objc_moveWeak((id *)v16, &to);
    v17 = v20;
    v18 = v21;
    v20 = 0;
    *(_QWORD *)(v16 + 8) = v17;
    *(_QWORD *)(v16 + 16) = v18;
    v22 = 0;
    v23 = 0;
    dispatch_async_f(v15, (void *)v16, (dispatch_function_t)_ZZN8dispatch5asyncIZZ32__CTConnectionPair_receiveData__EUb_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_);
    _ZNSt3__110unique_ptrIZZ32__CTConnectionPair_receiveData__EUb_E3__0NS_14default_deleteIS1_EEED1B8nn180100Ev(&v22);
    _ZNSt3__110unique_ptrIZZ32__CTConnectionPair_receiveData__EUb_E3__0NS_14default_deleteIS1_EEED1B8nn180100Ev(&v23);

    objc_destroyWeak(&to);
  }
  else
  {
    CTLogConnectionPair();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __32__CTConnectionPair_receiveData___block_invoke_cold_1();
  }

}

- (void)updatePairState:(int64_t)a3
{
  OS_nw_connection *fConnection1;
  OS_nw_connection *fConnection2;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fConnectionPairState != a3)
  {
    self->fConnectionPairState = a3;
    if (a3 == 2)
    {
      nw_connection_cancel((nw_connection_t)self->fConnection1);
      nw_connection_cancel((nw_connection_t)self->fConnection2);
      fConnection1 = self->fConnection1;
      self->fConnection1 = 0;

      fConnection2 = self->fConnection2;
      self->fConnection2 = 0;

    }
    else if (a3 == 1)
    {
      -[CTConnectionPair receiveData:](self, "receiveData:", 0);
      -[CTConnectionPair receiveData:](self, "receiveData:", 1);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->fDelegate);
    objc_msgSend(WeakRetained, "connectionPairStateChanged:", a3);

  }
}

- (void)connectionStateChanged:(int)a3 connectionId:(int64_t)a4
{
  int *p_fConnectionState2;
  int fConnectionState2;
  int fConnectionState1;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (a4 == 1)
  {
    p_fConnectionState2 = &self->fConnectionState2;
    fConnectionState2 = self->fConnectionState2;
  }
  else
  {
    if (a4)
      goto LABEL_7;
    p_fConnectionState2 = &self->fConnectionState1;
    fConnectionState2 = self->fConnectionState1;
  }
  if (fConnectionState2 == a3)
    return;
  *p_fConnectionState2 = a3;
LABEL_7:
  fConnectionState1 = self->fConnectionState1;
  if ((fConnectionState1 & 0xFFFFFFFE) == 4 || (self->fConnectionState2 & 0xFFFFFFFE) == 4)
  {
    -[CTConnectionPair updatePairState:](self, "updatePairState:", 2);
    fConnectionState1 = self->fConnectionState1;
  }
  if (fConnectionState1 == 3 && self->fConnectionState2 == 3)
    -[CTConnectionPair updatePairState:](self, "updatePairState:", 1);
}

- (BOOL)start
{
  BOOL v3;
  OS_nw_connection *v4;
  OS_nw_connection *fConnection1;
  OS_nw_connection *v6;
  OS_nw_connection *fConnection2;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  _QWORD handler[4];
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (!self->fStarted)
  {
    v4 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->fEndpoint1, (nw_parameters_t)self->fParameters1);
    fConnection1 = self->fConnection1;
    self->fConnection1 = v4;

    if (self->fConnection1)
    {
      v6 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->fEndpoint2, (nw_parameters_t)self->fParameters2);
      fConnection2 = self->fConnection2;
      self->fConnection2 = v6;

      v8 = self->fConnection1;
      if (self->fConnection2)
      {
        nw_connection_set_queue(v8, (dispatch_queue_t)self->fQueue);
        nw_connection_set_queue((nw_connection_t)self->fConnection2, (dispatch_queue_t)self->fQueue);
        location = 0;
        objc_initWeak(&location, self);
        v9 = self->fConnection1;
        v10 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __25__CTConnectionPair_start__block_invoke;
        handler[3] = &unk_1E1530E70;
        objc_copyWeak(&v16, &location);
        nw_connection_set_state_changed_handler(v9, handler);
        v11 = self->fConnection2;
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __25__CTConnectionPair_start__block_invoke_54;
        v13[3] = &unk_1E1530E70;
        objc_copyWeak(&v14, &location);
        nw_connection_set_state_changed_handler(v11, v13);
        nw_connection_start((nw_connection_t)self->fConnection1);
        nw_connection_start((nw_connection_t)self->fConnection2);
        v3 = 1;
        self->fStarted = 1;
        objc_destroyWeak(&v14);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
        return v3;
      }
      self->fConnection1 = 0;

    }
    return 0;
  }
  return 1;
}

void __25__CTConnectionPair_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      CTLogConnectionPair();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __25__CTConnectionPair_start__block_invoke_cold_1();

    }
    else
    {
      objc_msgSend(WeakRetained, "connectionStateChanged:connectionId:", a2, 0);
    }
  }

}

void __25__CTConnectionPair_start__block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      CTLogConnectionPair();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __25__CTConnectionPair_start__block_invoke_54_cold_1();

    }
    else
    {
      objc_msgSend(WeakRetained, "connectionStateChanged:connectionId:", a2, 1);
    }
  }

}

- (BOOL)sendData:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *fConnection2;
  id v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fConnection1 && self->fConnection2 && self->fConnectionPairState == 1)
  {
    if (a4)
      fConnection2 = self->fConnection2;
    else
      fConnection2 = self->fConnection1;
    v11 = objc_retainAutorelease(v8);
    v12 = dispatch_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0, 0);
    nw_connection_send(fConnection2, v12, (nw_content_context_t)*MEMORY[0x1E0CCECE8], 1, v9);

    v13 = 1;
  }
  else
  {
    CTLogConnectionPair();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CTConnectionPair sendData:usingConnection:completion:].cold.1((uint64_t)self, v14);

    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  NSObject *fConnection1;
  NSObject *fConnection2;
  objc_super v5;

  fConnection1 = self->fConnection1;
  if (fConnection1)
    nw_connection_cancel(fConnection1);
  fConnection2 = self->fConnection2;
  if (fConnection2)
    nw_connection_cancel(fConnection2);
  v5.receiver = self;
  v5.super_class = (Class)CTConnectionPair;
  -[CTConnectionPair dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fParameters2, 0);
  objc_storeStrong((id *)&self->fEndpoint2, 0);
  objc_storeStrong((id *)&self->fConnection2, 0);
  objc_storeStrong((id *)&self->fParameters1, 0);
  objc_storeStrong((id *)&self->fEndpoint1, 0);
  objc_storeStrong((id *)&self->fConnection1, 0);
  objc_destroyWeak((id *)&self->fDelegate);
  objc_storeStrong((id *)&self->fQueue, 0);
}

- (void)initWithQueue:(os_log_t)log delegate:endpoint1:parameters1:endpoint2:parameter2:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "Delegate must conform to CTConnectionPairDelegate protocol", v1, 2u);
}

void __32__CTConnectionPair_receiveData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  v3 = 0;
  OUTLINED_FUNCTION_0_2(&dword_18425C000, v0, v1, "Message has no content over %s: %@", v2);
  OUTLINED_FUNCTION_1_1();
}

void __32__CTConnectionPair_receiveData___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  v3 = v0;
  OUTLINED_FUNCTION_0_2(&dword_18425C000, v1, (uint64_t)v1, "Hit error over Connection %s: %@", v2);
  OUTLINED_FUNCTION_1_1();
}

void __25__CTConnectionPair_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_18425C000, v0, v1, "Hit error over Connection %s: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_1();
}

void __25__CTConnectionPair_start__block_invoke_54_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_18425C000, v0, v1, "Hit error over Connection %s: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendData:(uint64_t)a1 usingConnection:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  unint64_t v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 > 2)
    v3 = "???";
  else
    v3 = off_1E1530E90[v2];
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_18425C000, a2, OS_LOG_TYPE_ERROR, "Pair is not ready to send, state: %s", (uint8_t *)&v4, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

@end
