@implementation C2MultipeerNetworkConnection

- (C2MultipeerNetworkConnection)initWithParent:(id)a3 queue:(id)a4 connection:(id)a5 peerID:(id)a6 isClientConnection:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  C2MultipeerNetworkConnection *v14;
  C2MultipeerNetworkConnection *v15;
  NSMutableData *v16;
  NSMutableData *receiveLengthBuffer;
  NSMutableData *v18;
  NSMutableData *receiveMessageBuffer;
  objc_super v21;

  v7 = a7;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)C2MultipeerNetworkConnection;
  v14 = -[C2MultipeerConnection initWithParent:queue:peerID:isClientConnection:](&v21, sel_initWithParent_queue_peerID_isClientConnection_, a3, a4, a6, v7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a5);
    v15->_connectionState = 0;
    v16 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    receiveLengthBuffer = v15->_receiveLengthBuffer;
    v15->_receiveLengthBuffer = v16;

    v18 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    receiveMessageBuffer = v15->_receiveMessageBuffer;
    v15->_receiveMessageBuffer = v18;

  }
  return v15;
}

- (void)startConnection
{
  OS_nw_connection *connection;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)C2MultipeerNetworkConnection;
  -[C2MultipeerConnection startConnection](&v7, sel_startConnection);
  connection = self->_connection;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__C2MultipeerNetworkConnection_startConnection__block_invoke;
  v6[3] = &unk_1E98988C0;
  v6[4] = self;
  MEMORY[0x1D82696B4](connection, v6);
  v4 = self->_connection;
  -[C2MultipeerConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v4, v5);

  nw_connection_start((nw_connection_t)self->_connection);
}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = a2;
  switch(a2)
  {
    case 0:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_109);
      v5 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v6 = *(void **)(a1 + 32);
        v7 = v5;
        objc_msgSend(v6, "peerID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_invalid for peer %@";
        goto LABEL_14;
      }
      break;
    case 1:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_111);
      v10 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v11 = *(void **)(a1 + 32);
        v7 = v10;
        objc_msgSend(v11, "peerID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_waiting for peer %@";
        goto LABEL_14;
      }
      break;
    case 2:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_113);
      v12 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v13 = *(void **)(a1 + 32);
        v7 = v12;
        objc_msgSend(v13, "peerID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v8;
        v9 = "nw_connection_state_preparing for peer %@";
LABEL_14:
        _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v26, 0xCu);

      }
      break;
    case 3:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_115);
      v14 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v15 = *(void **)(a1 + 32);
        v16 = v14;
        objc_msgSend(v15, "peerID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v17;
        _os_log_impl(&dword_1D4DC3000, v16, OS_LOG_TYPE_INFO, "nw_connection_state_ready for peer %@", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "receiveNextMessage");
      break;
    case 4:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_117);
      v18 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v19 = *(void **)(a1 + 32);
        v20 = v18;
        objc_msgSend(v19, "peerID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1D4DC3000, v20, OS_LOG_TYPE_INFO, "nw_connection_state_failed for peer %@", (uint8_t *)&v26, 0xCu);

      }
      nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 32) + 64));
      break;
    case 5:
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_119);
      v22 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v23 = *(void **)(a1 + 32);
        v24 = v22;
        objc_msgSend(v23, "peerID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v25;
        _os_log_impl(&dword_1D4DC3000, v24, OS_LOG_TYPE_INFO, "nw_connection_state_cancelled for peer %@", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "stopConnection");
      break;
    default:
      return;
  }
}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_110()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_112()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_114()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_116()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __47__C2MultipeerNetworkConnection_startConnection__block_invoke_118()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (void)stopConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)C2MultipeerNetworkConnection;
  -[C2MultipeerConnection stopConnection](&v3, sel_stopConnection);
  nw_connection_cancel((nw_connection_t)self->_connection);
}

- (void)receiveNextMessage
{
  NSObject *v3;
  NSObject *connection;
  _QWORD completion[5];
  id v6;
  id location;

  -[C2MultipeerConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  location = 0;
  objc_initWeak(&location, self);
  connection = self->_connection;
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke;
  completion[3] = &unk_1E9898910;
  completion[4] = self;
  objc_copyWeak(&v6, &location);
  nw_connection_receive(connection, 1u, 0x2000000u, completion);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id WeakRetained;
  CFErrorRef v14;
  __CFError *v15;
  NSObject *v16;
  const char *identifier;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *, uint64_t, uint64_t, unint64_t);
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  __CFError *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11)
    v14 = nw_error_copy_cf_error(v11);
  else
    v14 = 0;
  v15 = v14;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_122);
  v16 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      identifier = nw_content_context_get_identifier(v10);
    else
      identifier = "(null)";
    v18 = CFSTR("no");
    *(_DWORD *)buf = 136315650;
    v26 = identifier;
    v27 = 2112;
    if (a4)
      v18 = CFSTR("yes");
    v28 = v18;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1D4DC3000, v16, OS_LOG_TYPE_DEFAULT, "received message %s, is complete: %@, with error %@", buf, 0x20u);
  }

  if (!v11)
  {
    if (v9)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_128;
      v22 = &unk_1E98988E8;
      v23 = *(_QWORD *)(a1 + 32);
      v24 = WeakRetained;
      dispatch_data_apply(v9, &v19);

    }
    objc_msgSend(WeakRetained, "receiveNextMessage", v19, v20, v21, v22, v23);
  }

}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

uint64_t __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_128(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_130);
  v8 = C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v34 = v9;
    v35 = 2048;
    v36 = a5;
    _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes", buf, 0x16u);
  }
  for (; a5; a5 -= v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "receiveLengthBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11 <= 7)
    {
      objc_msgSend(*(id *)(a1 + 40), "receiveLengthBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 8 - objc_msgSend(v12, "length");

      if (v13 >= a5)
        v14 = a5;
      else
        v14 = v13;
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_132);
      v15 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v34 = v16;
        v35 = 2048;
        v36 = v14;
        v37 = 2048;
        v38 = a5;
        _os_log_impl(&dword_1D4DC3000, v15, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes of %llu bytes for receive length buffer.", buf, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 40), "receiveLengthBuffer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendBytes:length:", a4, v14);

      a5 -= v14;
      if (!a5)
        break;
      a4 += v14;
    }
    objc_msgSend(*(id *)(a1 + 40), "receiveLengthBuffer");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = *(_QWORD *)objc_msgSend(v18, "bytes");

    objc_msgSend(*(id *)(a1 + 40), "receiveMessageBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19 - objc_msgSend(v20, "length");

    if (v21 >= a5)
      v21 = a5;
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_134);
    v22 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v34 = v23;
      v35 = 2048;
      v36 = v21;
      v37 = 2048;
      v38 = a5;
      _os_log_impl(&dword_1D4DC3000, v22, OS_LOG_TYPE_INFO, "[%@ receiveNextMessage] - consuming %llu bytes of %llu bytes for receive message buffer.", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "receiveMessageBuffer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendBytes:length:", a4, a5);

    objc_msgSend(*(id *)(a1 + 40), "receiveMessageBuffer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26 == v19)
    {
      v27 = *(void **)(a1 + 40);
      objc_msgSend(v27, "receiveMessageBuffer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleData:", v28);

      v29 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "setReceiveLengthBuffer:", v29);

      v30 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "setReceiveMessageBuffer:", v30);

    }
    a4 += v21;
  }

  return 1;
}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_2_129()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_131()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __50__C2MultipeerNetworkConnection_receiveNextMessage__block_invoke_133()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *identifier;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *alloc;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *connection;
  NSObject *v23;
  NSObject *v24;
  _QWORD completion[5];
  NSObject *v26;
  id v27;
  _BYTE buf[12];
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[C2MultipeerConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (self->_connectionState == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = nw_content_context_create((const char *)objc_msgSend(v10, "UTF8String"));

    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_142);
    v12 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v11)
        identifier = nw_content_context_get_identifier(v11);
      else
        identifier = "(null)";
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      v29 = 2080;
      v30 = identifier;
      v31 = 2048;
      v32 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - sending message %s with length %llu", buf, 0x20u);
    }

    *(_QWORD *)buf = 0;
    objc_msgSend(v6, "length");
    alloc = dispatch_data_create_alloc();
    v19 = objc_msgSend(v6, "length");
    **(_QWORD **)buf = v19;
    *(_QWORD *)buf += 8;
    v20 = *(void **)buf;
    v21 = objc_retainAutorelease(v6);
    memcpy(v20, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
    connection = self->_connection;
    v23 = *MEMORY[0x1E0CCECE8];
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_143;
    completion[3] = &unk_1E9898958;
    completion[4] = self;
    v26 = v11;
    v27 = v7;
    v24 = v11;
    nw_connection_send(connection, alloc, v23, 1, completion);

  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_137);
    v14 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1D4DC3000, v14, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - failed due to incorrect state", buf, 0xCu);
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("peer connection not ready");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), 300, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

void __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_141()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_143(_QWORD *a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *identifier;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v3 = nw_error_copy_cf_error(v3);
  v5 = v3;
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_144);
  v6 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v7 = a1[5];
    if (v7)
      identifier = nw_content_context_get_identifier(v7);
    else
      identifier = "(null)";
    v10 = 138412802;
    v11 = v8;
    v12 = 2080;
    v13 = identifier;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D4DC3000, v6, OS_LOG_TYPE_DEFAULT, "[%@ sendMessageWithData] - sending message %s completed with error %@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __70__C2MultipeerNetworkConnection_sendMessageWithData_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (NSMutableData)receiveLengthBuffer
{
  return self->_receiveLengthBuffer;
}

- (void)setReceiveLengthBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_receiveLengthBuffer, a3);
}

- (NSMutableData)receiveMessageBuffer
{
  return self->_receiveMessageBuffer;
}

- (void)setReceiveMessageBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_receiveMessageBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveMessageBuffer, 0);
  objc_storeStrong((id *)&self->_receiveLengthBuffer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
