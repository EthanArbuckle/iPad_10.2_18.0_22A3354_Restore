@implementation BLTSettingsSendSerializer

- (BLTSettingsSendSerializer)init
{
  BLTSettingsSendSerializer *v2;
  BLTSendQueueSerializer *v3;
  BLTSendQueueSerializer *queueSerializer;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableArray *completionHandlers;
  uint64_t v11;
  NSMutableDictionary *ackHandlers;
  NSObject *v13;
  _QWORD block[4];
  BLTSettingsSendSerializer *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BLTSettingsSendSerializer;
  v2 = -[BLTSettingsSendSerializer init](&v17, sel_init);
  if (v2)
  {
    v3 = -[BLTSendQueueSerializer initWithUsesMessageIdentifiers:]([BLTSendQueueSerializer alloc], "initWithUsesMessageIdentifiers:", 1);
    queueSerializer = v2->_queueSerializer;
    v2->_queueSerializer = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("BLTSettingsSendSerializer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    ackHandlers = v2->_ackHandlers;
    v2->_ackHandlers = (NSMutableDictionary *)v11;

    v13 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__BLTSettingsSendSerializer_init__block_invoke;
    block[3] = &unk_24D761AD0;
    v16 = v2;
    dispatch_async(v13, block);

  }
  return v2;
}

void __33__BLTSettingsSendSerializer_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  BLTFileURLInPairingPathWait(CFSTR("settingsynctmpdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __33__BLTSettingsSendSerializer_init__block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);

    BLTFileURLInHomePath(CFSTR("settingsynctmpdata"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      blt_general_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __28__BLTBulletinSendQueue_init__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSendFileURL:", v2);

}

- (void)handleFileURL:(id)a3
{
  BLTSendQueueSerializer *queueSerializer;
  id v5;
  id v6;

  queueSerializer = self->_queueSerializer;
  v5 = a3;
  -[BLTSettingsSendSerializerPassthrough delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTSendQueueSerializer handleFileURL:protobufHandler:](queueSerializer, "handleFileURL:protobufHandler:", v5, v6);

}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *queue;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  __int16 v29;

  v14 = a4;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (a10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke;
    block[3] = &unk_24D762E08;
    block[4] = self;
    v25 = v16;
    v29 = v14;
    v26 = v18;
    v27 = v21;
    v28 = v20;
    dispatch_async(queue, block);

  }
  else
  {
    -[BLTSettingsSendSerializerPassthrough delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:", v16, v14, v17, v18, v19, v20, v21);

  }
}

void __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id *v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v7 = *(unsigned __int16 *)(a1 + 72);
  v23 = 0;
  objc_msgSend(v6, "add:type:messageIdentifier:", v5, v7, &v23);
  v8 = v23;
  blt_ids_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(id **)(a1 + 48);
    v3 = v10;
    if (!v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "redact");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@"), v1, v2);
      v3 = (id *)objc_claimAutoreleasedReturnValue();
    }
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    if (v13)
      v14 = "YES";
    else
      v14 = "NO";
    v25 = v3;
    v26 = 2112;
    v27 = v8;
    v28 = 2080;
    v29 = v14;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "Setting send stored protobuf %@ got message identifier: %@ with response completion: %s", buf, 0x20u);
    if (!v10)
    {

    }
  }

  if (*(_QWORD *)(a1 + 56) && v8)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke_24;
      v20[3] = &unk_24D762DE0;
      v9 = &v22;
      objc_copyWeak(&v22, (id *)buf);
      v21 = *(id *)(a1 + 56);
      v16 = (void *)objc_msgSend(v20, "copy");
      v3 = &v21;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v16, v8);
    if (v15)
    {

      objc_destroyWeak((id *)&v9->isa);
    }
    objc_destroyWeak((id *)buf);
  }
  v17 = *(void **)(a1 + 64);
  if (v17)
  {
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v19 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v18, "addObject:", v19);

  }
}

void __117__BLTSettingsSendSerializer_sendRequest_type_withTimeout_withDescription_onlyOneFor_didSend_andResponse_spoolToFile___block_invoke_24(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  __n128 v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v6 = WeakRetained;
  if (WeakRetained && WeakRetained[6])
  {
    v7 = WeakRetained[8] + 1;
    WeakRetained[8] = v7;
    v8 = WeakRetained[7];
    if (v8)
    {
      if (v7 >= v8)
        v7 = WeakRetained[7];
      v5.n128_f64[0] = (double)v7 / (double)v8;
    }
    else
    {
      v5.n128_u64[0] = 1.0;
    }
    (*(void (**)(__n128))(WeakRetained[6] + 16))(v5);
    v6 = WeakRetained;
  }

}

- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke;
  block[3] = &unk_24D762E58;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

void __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(v3, "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke_2;
  v17 = &unk_24D762E30;
  v4 = v2;
  v18 = v4;
  v19 = *(id *)(a1 + 48);
  v5 = MEMORY[0x219A0C15C](&v14);
  v6 = (void *)v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v7 = objc_msgSend(*(id *)(a1 + 56), "copy", v14, v15, v16, v17, v18);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

    v10 = *(_QWORD **)(a1 + 32);
    v11 = (void *)v10[3];
    objc_msgSend(v10, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendWithSender:timeout:responseHandlers:didSend:didQueue:", v12, *(_QWORD *)(a1 + 40), v3, v6, 0);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      (*(void (**)(double))(v13 + 16))(1.0);
  }

}

void __77__BLTSettingsSendSerializer_sendNowWithSent_withAcknowledgement_withTimeout___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acknowledgementBlock, 0);
  objc_storeStrong((id *)&self->_ackHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queueSerializer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__BLTSettingsSendSerializer_init__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "ERROR! Setting send queue file URL is nil!", a5, a6, a7, a8, 0);
}

@end
