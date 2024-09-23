@implementation CTStewieDataClient

- (CTStewieDataClient)initWithServices:(int64_t)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_qos_class_t qos_class;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  void *v22;
  CTStewieState *v23;
  void *v24;
  CTStewieStateMonitor *v25;
  void *v26;
  CTStewieDataClient *v27;
  objc_super v29;

  v8 = a4;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CTStewieDataClient;
  v10 = -[CTStewieDataClient init](&v29, sel_init);
  if (!v10)
    goto LABEL_19;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EDD30278) & 1) == 0)
  {
    CTLogStewieDataClient();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.5();
    goto LABEL_18;
  }
  if (!v9)
  {
    CTLogStewieDataClient();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.1();
    goto LABEL_18;
  }
  if (!a3)
  {
    CTLogStewieDataClient();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.2();
    goto LABEL_18;
  }
  if (*((_QWORD *)v10 + 3) >= 0x10000uLL)
  {
    CTLogStewieDataClient();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.3((uint64_t)v10 + 24, v11, v12, v13, v14, v15, v16, v17);
LABEL_18:

LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  *((_BYTE *)v10 + 8) = 0;
  qos_class = dispatch_queue_get_qos_class(v9, 0);
  dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create("CTStewieDataClient", v19);
  v21 = (void *)*((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 2) = v20;

  *((_QWORD *)v10 + 3) = a3;
  *((_QWORD *)v10 + 4) = 0;
  objc_storeWeak((id *)v10 + 5, v8);
  objc_storeStrong((id *)v10 + 6, a5);
  v22 = (void *)*((_QWORD *)v10 + 7);
  *((_QWORD *)v10 + 7) = 0;

  *((_QWORD *)v10 + 8) = 0;
  v23 = objc_alloc_init(CTStewieState);
  v24 = (void *)*((_QWORD *)v10 + 9);
  *((_QWORD *)v10 + 9) = v23;

  v25 = -[CTStewieStateMonitor initWithDelegate:queue:]([CTStewieStateMonitor alloc], "initWithDelegate:queue:", v10, *((_QWORD *)v10 + 2));
  v26 = (void *)*((_QWORD *)v10 + 10);
  *((_QWORD *)v10 + 10) = v25;

  if (!*((_QWORD *)v10 + 10))
  {
    CTLogStewieDataClient();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient initWithServices:delegate:delegateQueue:].cold.4();
    goto LABEL_18;
  }
  v27 = (CTStewieDataClient *)v10;
LABEL_20:

  return v27;
}

- (BOOL)start
{
  NSObject *v2;
  _QWORD v4[2];
  BOOL v5;
  CTStewieDataClient *v6;
  _QWORD block[5];

  v6 = self;
  v5 = 0;
  v2 = *((_QWORD *)self + 2);
  v4[0] = &v6;
  v4[1] = &v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_sync(v2, block);
  return v5;
}

- (id)getState
{
  return (id)objc_msgSend(*((id *)self + 10), "getState");
}

- (void)dispatchOnDelegateQueue:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id to;
  id v10;
  id location;
  id *v12;
  id *v13;

  v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)*((_QWORD *)self + 6);
  objc_copyWeak(&to, &location);
  v10 = _Block_copy(v4);
  v6 = v5;
  v7 = operator new();
  objc_moveWeak((id *)v7, &to);
  v8 = v10;
  v10 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  v12 = 0;
  v13 = 0;
  dispatch_async_f(v6, (void *)v7, (dispatch_function_t)dispatch::async<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>(NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>::~unique_ptr[abi:nn180100](&v12);
  std::unique_ptr<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>::~unique_ptr[abi:nn180100](&v13);

  objc_destroyWeak(&to);
  objc_destroyWeak(&location);

}

- (void)sendMessageInternal:(id)a3 usingConnection:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  CTStewieTransportMessage *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _OWORD *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  CTStewieTransportMessage *v35;
  uint8_t *v36;
  uint8_t buf[8];
  char v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((_QWORD *)self + 4) && *((_QWORD *)self + 7) && *((_QWORD *)self + 8) == 1)
  {
    v10 = objc_alloc_init(CTStewieTransportMessage);
    -[CTStewieTransportMessage setData:](v10, "setData:", v8);
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v33;
    if (v12 || !v11)
    {
      CTLogStewieDataClient();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CTStewieDataClient sendMessageInternal:usingConnection:completion:].cold.3((uint64_t)v12, v18, v19, v20, v21, v22, v23, v24);

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_60;
      v31[3] = &unk_1E1531C18;
      v32 = v9;
      -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v31);
      v14 = v32;
    }
    else if ((unint64_t)objc_msgSend(v11, "length") <= 0x1000)
    {
      -[CTStewieTransportMessage msgId](v10, "msgId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = _Block_copy(v9);
      v14 = objc_retainAutorelease(v25);
      std::string::basic_string[abi:nn180100]<0>(buf, (char *)objc_msgSend(v14, "UTF8String"));
      v36 = buf;
      v27 = std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)self + 11, (void **)buf, (uint64_t)&std::piecewise_construct, (_OWORD **)&v36);
      v28 = (void *)*((_QWORD *)v27 + 7);
      *((_QWORD *)v27 + 7) = v26;
      if (v38 < 0)
        operator delete(*(void **)buf);

      objc_msgSend(*((id *)self + 7), "sendData:usingConnection:completion:", v11, a4, *MEMORY[0x1E0CCECE0]);
    }
    else
    {
      CTLogStewieDataClient();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CTStewieDataClient sendMessageInternal:usingConnection:completion:].cold.2(buf, objc_msgSend(v11, "length"), v13);

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_61;
      v29[3] = &unk_1E1531C18;
      v30 = v9;
      -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v29);
      v14 = v30;
    }

  }
  else
  {
    CTLogStewieDataClient();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *((_QWORD *)self + 4);
      v17 = CTConnectionPairStateAsString(*((_QWORD *)self + 8));
      -[CTStewieDataClient sendMessageInternal:usingConnection:completion:].cold.1((uint64_t)v17, (uint64_t)buf, v16);
    }

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke;
    v34[3] = &unk_1E1531C18;
    v35 = (CTStewieTransportMessage *)v9;
    -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v34);
    v10 = v35;
  }

}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  CTStewieMessageAck *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_60(uint64_t a1)
{
  uint64_t v1;
  CTStewieMessageAck *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __69__CTStewieDataClient_sendMessageInternal_usingConnection_completion___block_invoke_61(uint64_t a1)
{
  uint64_t v1;
  CTStewieMessageAck *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (BOOL)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  BOOL v11;
  _BOOL8 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  id v27;
  id location;
  id v29;
  id *v30;
  id *v31;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EDD1CC78) & 1) == 0)
  {
    CTLogStewieDataClient();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient sendMessage:completion:].cold.3();
    goto LABEL_19;
  }
  if (!v7)
  {
    CTLogStewieDataClient();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient sendMessage:completion:].cold.1();
LABEL_19:
    v11 = 0;
    goto LABEL_24;
  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  if (v9)
    v10 = 1;
  else
    v10 = v8 == 0;
  v11 = !v10;
  if (v10)
  {
    CTLogStewieDataClient();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient sendMessage:completion:].cold.2((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);

  }
  else
  {
    v12 = (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()) & 1) != 0
       || (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()) & 1) != 0
       || objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());
    location = 0;
    objc_initWeak(&location, self);
    v13 = (void *)*((_QWORD *)self + 2);
    objc_copyWeak(&v25, &location);
    *(_QWORD *)&v26 = v8;
    *((_QWORD *)&v26 + 1) = v12;
    v27 = _Block_copy(v7);
    v14 = v13;
    v15 = operator new();
    objc_moveWeak((id *)v15, &v25);
    *(_OWORD *)(v15 + 8) = v26;
    v16 = v27;
    *(_QWORD *)&v26 = 0;
    v27 = 0;
    *(_QWORD *)(v15 + 24) = v16;
    v30 = 0;
    v31 = 0;
    dispatch_async_f(v14, (void *)v15, (dispatch_function_t)dispatch::async<-[CTStewieDataClient sendMessage:completion:]::$_2>(NSObject  {objcproto17OS_dispatch_queue}*,std::unique_ptr<-[CTStewieDataClient sendMessage:completion:]::$_2>)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[CTStewieDataClient sendMessage:completion:]::$_2>::~unique_ptr[abi:nn180100](&v30);
    std::unique_ptr<-[CTStewieDataClient sendMessage:completion:]::$_2>::~unique_ptr[abi:nn180100](&v31);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

LABEL_24:
  return v11;
}

- (void)invokeSendCompletionForMsgId:(id)a3 ack:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void **v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  void *__p[2];
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (v8)
  {
    v11 = objc_retainAutorelease(v8);
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
    v12 = std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::find<std::string>((uint64_t)self + 88, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    if ((void **)((char *)self + 96) == v12)
    {
      CTLogStewieDataClient();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:].cold.1((uint64_t)v11, v13, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v13 = _Block_copy(v12[7]);
      std::__tree<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::__map_value_compare<__CTAssertionType *,std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>,std::less<__CTAssertionType *>,true>,std::allocator<std::__value_type<__CTAssertionType *,std::pair<dispatch::queue,void({block_pointer} {__strong})(NSError *)>>>>::__remove_node_pointer((uint64_t **)self + 11, (uint64_t *)v12);
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,0>((uint64_t)(v12 + 4));
      operator delete(v12);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3321888768;
      v21[2] = __64__CTStewieDataClient_invokeSendCompletionForMsgId_ack_metadata___block_invoke;
      v21[3] = &unk_1E152D2A0;
      v24 = _Block_copy(v13);
      v22 = v9;
      v23 = v10;
      -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v21);

      v14 = v24;
      v24 = 0;

    }
  }

}

uint64_t __64__CTStewieDataClient_invokeSendCompletionForMsgId_ack_metadata___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)failAllPendingMessages
{
  __int128 *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  __int128 *v9;
  __int128 *v10;
  BOOL v11;
  _QWORD v12[4];
  id v13;
  void *__p[2];
  void *aBlock[2];

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  v3 = (__int128 *)*((_QWORD *)self + 11);
  v4 = (char *)self + 96;
  if (v3 != (__int128 *)((char *)self + 96))
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      *(_OWORD *)__p = 0u;
      *(_OWORD *)aBlock = 0u;
      std::pair<std::string const,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>::pair[abi:nn180100]((std::string *)__p, v3 + 2);
      v6 = _Block_copy(aBlock[1]);
      v12[0] = v5;
      v12[1] = 3321888768;
      v12[2] = __44__CTStewieDataClient_failAllPendingMessages__block_invoke;
      v12[3] = &__block_descriptor_40_ea8_32c88_ZTSN8dispatch5blockIU8__strongU13block_pointerFvP18CTStewieMessageAckP12NSDictionaryEEE_e38_v16__0___CTStewieDataClientDelegate__8l;
      v13 = _Block_copy(v6);
      -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v12);
      v7 = v13;
      v13 = 0;

      v8 = aBlock[1];
      aBlock[1] = 0;

      if (SHIBYTE(aBlock[0]) < 0)
        operator delete(__p[0]);
      v9 = (__int128 *)*((_QWORD *)v3 + 1);
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = *(__int128 **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (__int128 *)*((_QWORD *)v3 + 2);
          v11 = *(_QWORD *)v10 == (_QWORD)v3;
          v3 = v10;
        }
        while (!v11);
      }
      v3 = v10;
    }
    while (v10 != (__int128 *)v4);
  }
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::destroy((uint64_t)self + 88, *((_QWORD **)self + 12));
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = v4;
}

void __44__CTStewieDataClient_failAllPendingMessages__block_invoke(uint64_t a1)
{
  CTStewieMessageAck *v2;

  v2 = objc_alloc_init(CTStewieMessageAck);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)updateConnectedServices:(int64_t)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((_QWORD *)self + 4) != a3)
  {
    v5 = MEMORY[0x1E0C809B0];
    *((_QWORD *)self + 4) = a3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __46__CTStewieDataClient_updateConnectedServices___block_invoke;
    v6[3] = &__block_descriptor_40_e38_v16__0___CTStewieDataClientDelegate__8l;
    v6[4] = a3;
    -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);
    if (!*((_QWORD *)self + 4))
      -[CTStewieDataClient failAllPendingMessages](self, "failAllPendingMessages");
  }
}

void __46__CTStewieDataClient_updateConnectedServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "connectedServicesChanged:", *(_QWORD *)(a1 + 32));

}

- (void)createConnectionPairIfRequired
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Unable to create connection pair", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _QWORD input_handler[4];
  NSObject *v6;

  v2 = a2;
  input_handler[0] = MEMORY[0x1E0C809B0];
  input_handler[1] = 3221225472;
  input_handler[2] = __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_2;
  input_handler[3] = &unk_1E1531CA8;
  v3 = v2;
  v6 = v3;
  nw_framer_set_input_handler(v3, input_handler);
  nw_framer_set_output_handler(v3, &__block_literal_global_88);

  return 2;
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  _QWORD parse[4];
  id v6;

  parse[0] = MEMORY[0x1E0C809B0];
  parse[1] = 3221225472;
  parse[2] = __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3;
  parse[3] = &unk_1E1531C80;
  v6 = *(id *)(a1 + 32);
  if (nw_framer_parse_input(a2, 3uLL, 3uLL, 0, parse))
    v3 = 0;
  else
    v3 = 3;

  return v3;
}

uint64_t __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t result;
  int v5;
  NSObject *v6;
  NSObject *v7;

  result = 0;
  if (a2 && a3 >= 3)
  {
    v5 = memcmp(&kCTStewieMagicPacket, a2, a3);
    CTLogConnectionPair();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_2();

      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 50);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_1();

      nw_framer_pass_through_input(*(nw_framer_t *)(a1 + 32));
      nw_framer_pass_through_output(*(nw_framer_t *)(a1 + 32));
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
    }
    return 3;
  }
  return result;
}

- (void)discardConnectionPairIfRequired
{
  void *v3;
  _QWORD *v4;
  void *v5;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  v5 = (void *)*((_QWORD *)self + 7);
  v4 = (_QWORD *)((char *)self + 56);
  v3 = v5;
  if (v5)
  {
    *v4 = 0;
    v4[1] = 0;

  }
}

- (void)reEvaluate
{
  uint64_t v3;
  uint64_t v4;
  CTStewieDataClient *v5;
  uint64_t v6;
  uint64_t v7;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  v3 = *((_QWORD *)self + 3);
  v4 = objc_msgSend(*((id *)self + 9), "dataPathAssertedServices") & v3;
  if (!v4 || *((_QWORD *)self + 8) == 2)
  {
    -[CTStewieDataClient discardConnectionPairIfRequired](self, "discardConnectionPairIfRequired");
    v5 = self;
    v6 = 0;
LABEL_4:
    -[CTStewieDataClient updateConnectedServices:](v5, "updateConnectedServices:", v6);
    return;
  }
  v7 = objc_msgSend(*((id *)self + 9), "activeServices");
  if (*((_QWORD *)self + 7) && *((_QWORD *)self + 8) == 1)
  {
    v6 = v7 & v4;
    v5 = self;
    goto LABEL_4;
  }
  -[CTStewieDataClient createConnectionPairIfRequired](self, "createConnectionPairIfRequired");
}

- (void)stateChanged:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if ((objc_msgSend(*((id *)self + 9), "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)self + 9, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__CTStewieDataClient_stateChanged___block_invoke;
    v6[3] = &unk_1E1531D10;
    v7 = v5;
    -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);
    -[CTStewieDataClient reEvaluate](self, "reEvaluate");

  }
}

void __35__CTStewieDataClient_stateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "stateChanged:", *(_QWORD *)(a1 + 32));

}

- (void)connectionPairStateChanged:(int64_t)a3
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (*((_QWORD *)self + 7))
  {
    if (*((_QWORD *)self + 8) != a3)
    {
      *((_QWORD *)self + 8) = a3;
      -[CTStewieDataClient reEvaluate](self, "reEvaluate");
    }
  }
}

- (void)receivedData:(id)a3 fromConnectionId:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  CTStewieMessageAck *v26;
  void *v27;
  void *v28;
  void *v29;
  CTStewieMessageAck *v30;
  const char *v31;
  NSObject *v32;
  void *v33;
  CTStewieMessageAck *v34;
  void *v35;
  void *v36;
  void *v37;
  CTStewieMessageAck *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  CTStewieMessageAck *v50;
  void *v51;
  void *v52;
  void *v53;
  CTStewieMessageAck *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  NSObject *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  const __CFString *v75;
  _BYTE location[12];
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  const char *v80;
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 2));
  if (v6 && *((_QWORD *)self + 7))
  {
    v71 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v71);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v71;
    v9 = v8;
    if (!v7 || v8)
    {
      CTLogStewieDataClient();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "length");
        v22 = CTConnectionPairConnectionIDAsString(a4);
        -[CTStewieDataClient receivedData:fromConnectionId:].cold.1((uint64_t)v22, (uint64_t)location, v21);
      }
    }
    else
    {
      objc_msgSend(v7, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (objc_msgSend(v7, "data"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "length") == 0,
            v11,
            v10,
            v12))
      {
        CTLogStewieDataClient();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "msgId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = CTConnectionPairConnectionIDAsString(a4);
          -[CTStewieDataClient receivedData:fromConnectionId:].cold.2(v24, (uint64_t)v25, (uint64_t)location, v23);
        }

        objc_msgSend(v7, "msgId");
        v16 = objc_claimAutoreleasedReturnValue();
        v26 = [CTStewieMessageAck alloc];
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v81 = *MEMORY[0x1E0CB2D50];
        v82[0] = CFSTR("Transport error: raise a bug");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[CTStewieMessageAck initWithError:](v26, "initWithError:", v29);
        -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:](self, "invokeSendCompletionForMsgId:ack:metadata:", v16, v30, 0);

        v9 = 0;
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB3710];
        +[CTStewieTransportMessage allowedSetOfClasses](CTStewieTransportMessage, "allowedSetOfClasses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v14, v15, &v70);
        v16 = objc_claimAutoreleasedReturnValue();
        v9 = v70;

        if (!v16 || v9)
        {
          CTLogStewieDataClient();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "msgId");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "data");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "length");
            v58 = CTConnectionPairConnectionIDAsString(a4);
            *(_DWORD *)location = 138412802;
            *(_QWORD *)&location[4] = v55;
            v77 = 2048;
            v78 = v57;
            v79 = 2080;
            v80 = v58;
            _os_log_error_impl(&dword_18425C000, v32, OS_LOG_TYPE_ERROR, "Message: %@ has garbage data of length: %lu, connection: %s", location, 0x20u);

          }
          objc_msgSend(v7, "msgId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = [CTStewieMessageAck alloc];
          v35 = (void *)MEMORY[0x1E0CB35C8];
          v74 = *MEMORY[0x1E0CB2D50];
          v75 = CFSTR("Transport error: raise a bug");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[CTStewieMessageAck initWithError:](v34, "initWithError:", v37);
          -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:](self, "invokeSendCompletionForMsgId:ack:metadata:", v33, v38, 0);

        }
        else if (-[NSObject isMemberOfClass:](v16, "isMemberOfClass:", objc_opt_class()))
        {
          objc_msgSend(v7, "msgId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "valueForKey:", CFSTR("clientMetadata"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:](self, "invokeSendCompletionForMsgId:ack:metadata:", v17, v16, v19);

        }
        else if (-[NSObject conformsToProtocol:](v16, "conformsToProtocol:", &unk_1EDD1CEA0))
        {
          *(_QWORD *)location = 0;
          objc_initWeak((id *)location, self);
          objc_msgSend(v7, "msgId");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "metadata");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForKey:", CFSTR("clientMetadata"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "metadata");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)objc_msgSend(v40, "mutableCopy");

          objc_msgSend(v60, "removeObjectForKey:", CFSTR("clientMetadata"));
          v41 = *((id *)self + 2);
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke;
          v63[3] = &unk_1E1531D60;
          v42 = v16;
          v64 = v42;
          v43 = v61;
          v65 = v43;
          v59 = v41;
          v66 = v59;
          v44 = v60;
          v67 = v44;
          objc_copyWeak(&v69, (id *)location);
          v45 = v62;
          v68 = v45;
          -[CTStewieDataClient dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v63);

          objc_destroyWeak(&v69);
          objc_destroyWeak((id *)location);
          v16 = v42;
        }
        else
        {
          CTLogStewieDataClient();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "msgId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)objc_opt_class();
            -[CTStewieDataClient receivedData:fromConnectionId:].cold.3(v47, v48, (uint64_t)location, v46);
          }

          objc_msgSend(v7, "msgId");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = [CTStewieMessageAck alloc];
          v51 = (void *)MEMORY[0x1E0CB35C8];
          v72 = *MEMORY[0x1E0CB2D50];
          v73 = CFSTR("Transport error: raise a bug");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[CTStewieMessageAck initWithError:](v50, "initWithError:", v53);
          -[CTStewieDataClient invokeSendCompletionForMsgId:ack:metadata:](self, "invokeSendCompletionForMsgId:ack:metadata:", v49, v54, 0);

        }
      }
    }

  }
  else
  {
    CTLogStewieDataClient();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v6)
        v20 = objc_msgSend(v6, "length");
      else
        v20 = 0;
      v31 = CTConnectionPairConnectionIDAsString(a4);
      -[CTStewieDataClient receivedData:fromConnectionId:].cold.4((uint64_t)v31, (uint64_t)location, v20);
    }
  }

}

void __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke_2;
  v7[3] = &unk_1E1531D38;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v6 = a2;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v6, "messageReceived:withMetadata:completionBlock:", v4, v5, v7);

  objc_destroyWeak(&v11);
}

void __52__CTStewieDataClient_receivedData_fromConnectionId___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  id v6;
  id to;
  id v8;
  id v9;
  id *v10;
  id *v11;

  v2 = *(void **)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = operator new();
  objc_moveWeak((id *)v4, &to);
  v5 = v8;
  v6 = v9;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(v4 + 8) = v5;
  *(_QWORD *)(v4 + 16) = v6;
  v11 = 0;
  dispatch_async_f(v3, (void *)v4, (dispatch_function_t)_ZZN8dispatch5asyncIZZZ52__CTStewieDataClient_receivedData_fromConnectionId__EUb_EUb0_E3__3EEvPU28objcproto17OS_dispatch_queue8NSObjectNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_);
  _ZNSt3__110unique_ptrIZZZ52__CTStewieDataClient_receivedData_fromConnectionId__EUb_EUb0_E3__3NS_14default_deleteIS1_EEED1B8nn180100Ev(&v10);
  _ZNSt3__110unique_ptrIZZZ52__CTStewieDataClient_receivedData_fromConnectionId__EUb_EUb0_E3__3NS_14default_deleteIS1_EEED1B8nn180100Ev(&v11);

  objc_destroyWeak(&to);
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer} {__strong})(CTStewieMessageAck *,NSDictionary *)>>>>::destroy((uint64_t)self + 88, *((_QWORD **)self + 12));
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_destroyWeak((id *)self + 5);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = (char *)self + 96;
  return self;
}

- (id)dispatchOnDelegateQueue:(id *)a1
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x186DBA454](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (id)dispatchOnDelegateQueue:(NSObject  *){objcproto17OS_dispatch_queue}
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  id *v7;

  v7 = (id *)a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)a1);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = objc_loadWeakRetained(WeakRetained + 5);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
  return std::unique_ptr<-[CTStewieDataClient dispatchOnDelegateQueue:]::$_1>::~unique_ptr[abi:nn180100](&v7);
}

- (id)sendMessage:(id *)a1 completion:
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x186DBA454](v2, 0x10C0C4019CFF88ELL);
  }
  return a1;
}

- (id)sendMessage:(NSObject  *){objcproto17OS_dispatch_queue} completion:(std::unique_ptr<-[CTStewieDataClient)sendMessage:completion:]::$_2>
{
  id WeakRetained;
  void *v3;
  id *v5;

  v5 = (id *)a1;
  WeakRetained = objc_loadWeakRetained((id *)a1);
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "sendMessageInternal:usingConnection:completion:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));

  return std::unique_ptr<-[CTStewieDataClient sendMessage:completion:]::$_2>::~unique_ptr[abi:nn180100](&v5);
}

- (void)initWithServices:delegate:delegateQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Must provide queue for initializing CTStewieDataClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithServices:delegate:delegateQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Client didn't request any service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithServices:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18425C000, a2, a3, "Requested services are invalid: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithServices:delegate:delegateQueue:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Unable to create monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithServices:delegate:delegateQueue:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Delegate must conform to CTStewieDataClientDelegate protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMessageInternal:(uint64_t)a1 usingConnection:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4_3(&dword_18425C000, "Failing send, service: %ld, pair state: %s", v3, v4);
}

- (void)sendMessageInternal:(uint8_t *)buf usingConnection:(uint64_t)a2 completion:(os_log_t)log .cold.2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "Data size exceeds configured channel limit: %lu", buf, 0xCu);
}

- (void)sendMessageInternal:(uint64_t)a3 usingConnection:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18425C000, a2, a3, "Error during transport message creation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendMessage:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "CTStewieSendMessageCompletion block missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMessage:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18425C000, a2, a3, "Unable to prepare CTStewieMessageOutgoing for send: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendMessage:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Message must conform to CTStewieMessageOutgoing protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)invokeSendCompletionForMsgId:(uint64_t)a3 ack:(uint64_t)a4 metadata:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18425C000, a2, a3, "No completion handler for msgId: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18425C000, v0, OS_LOG_TYPE_DEBUG, "Magic packet matches, making it passthrough!", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __52__CTStewieDataClient_createConnectionPairIfRequired__block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Magic packet does not match!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4_3(&dword_18425C000, "Failed to decode incoming data of length: %lu, on connection: %s", v3, v4);
}

- (void)receivedData:(uint64_t)a3 fromConnectionId:(NSObject *)a4 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_3(&dword_18425C000, "Message: %@ has no data, connection: %s", (uint8_t *)a3, a4);

}

- (void)receivedData:(uint64_t)a3 fromConnectionId:(NSObject *)a4 .cold.3(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  id v7;

  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  v7 = a2;
  _os_log_error_impl(&dword_18425C000, a4, OS_LOG_TYPE_ERROR, "Message: %@ has unknown type: %@", (uint8_t *)a3, 0x16u);

}

- (void)receivedData:(uint64_t)a3 fromConnectionId:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4_3(&dword_18425C000, "Dropping incoming data of length: %lu, on connection: %s", v3, v4);
}

@end
