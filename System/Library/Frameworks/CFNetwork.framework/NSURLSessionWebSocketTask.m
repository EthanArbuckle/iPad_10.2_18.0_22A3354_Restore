@implementation NSURLSessionWebSocketTask

uint64_t __58____NSURLSessionWebSocketTask__onqueue_checkForCompletion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 32) + 152))(*(_QWORD *)(a1 + 32), 0);
}

void __70____NSURLSessionWebSocketTask__onqueue_didReceiveResponse_completion___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id Property;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 1016, 1);
    v4 = v2;
  }
  else
  {
    v4 = 0;
    Property = 0;
  }
  -[__NSURLSessionWebSocketTask _onqueue_enableWebSocketFraming:](v4, Property);
}

id __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  const char *v6;
  uint64_t v7;
  id v8;
  id Property;

  if (_ConnectionProtocolIdentifier::onceToken != -1)
    dispatch_once(&_ConnectionProtocolIdentifier::onceToken, &__block_literal_global_16326);
  if (nw_protocols_are_equal() && (v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), !*(_BYTE *)(v7 + 24)))
  {
    *(_BYTE *)(v7 + 24) = 1;
    *a4 = 3;
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v6, 1024, 1);
    v8 = Property;
  }
  else
  {
    v8 = 0;
    *a4 = 0;
  }
  return v8;
}

void __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  webSocketLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a3;
    _os_log_debug_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEBUG, "viable %d", buf, 8u);
  }

  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      webSocketLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling websocket task because connection is no longer viable", buf, 2u);
      }

      objc_msgSend(WeakRetained, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_13;
      block[3] = &unk_1E14FE118;
      v10 = WeakRetained;
      dispatch_async(v8, block);

    }
  }
}

void __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_13(uint64_t a1)
{
  -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](*(_QWORD **)(a1 + 32), -1005);
}

void __68____NSURLSessionWebSocketTask__onqueue_sendCloseCode_reason_cancel___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  webSocketLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ closed with code %ld", (uint8_t *)&v5, 0x16u);

  }
}

void __37____NSURLSessionWebSocketTask_cancel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2 && (v2[939] & 1) != 0)
    {
      objc_msgSend(v2, "setState:", 2);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __37____NSURLSessionWebSocketTask_cancel__block_invoke_7;
      aBlock[3] = &unk_1E14FE118;
      aBlock[4] = *(_QWORD *)(a1 + 32);
      v8 = _Block_copy(aBlock);
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
      v10 = _Block_copy(v8);
      objc_msgSend(v9, "addObject:", v10);

      -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
    }
    else
    {
      webSocketLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_debug_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Cancelling task immediately without sending a close frame", buf, 0xCu);

      }
      v4 = *(void **)(a1 + 32);
      if (v4)
        v4 = (void *)objc_msgSend(v4, "error:code:", *MEMORY[0x1E0CB32E8], -999);
      v6 = v4;
      v7 = *(void **)(a1 + 32);
      if (v7)
        objc_setProperty_atomic(v7, v5, v6, 1008);

      v13.receiver = *(id *)(a1 + 32);
      v13.super_class = (Class)__NSURLSessionWebSocketTask;
      objc_msgSendSuper2(&v13, sel__onqueue_cancel);
    }
  }
}

uint64_t __37____NSURLSessionWebSocketTask_cancel__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

void __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  id v15;
  uint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2 && (*(_BYTE *)(v2 + 939) & 1) != 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke_6;
      aBlock[3] = &unk_1E14FD950;
      v9 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      aBlock[4] = v2;
      v16 = v8;
      v15 = v9;
      v10 = _Block_copy(aBlock);
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
      v12 = _Block_copy(v10);
      objc_msgSend(v11, "addObject:", v12);

      -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
    }
    else
    {
      webSocketLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v13;
        _os_log_debug_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Cancelling task immediately without sending a close frame", buf, 0xCu);

      }
      v4 = *(void **)(a1 + 32);
      if (v4)
        v4 = (void *)objc_msgSend(v4, "error:code:", *MEMORY[0x1E0CB32E8], -999);
      v6 = v4;
      v7 = *(void **)(a1 + 32);
      if (v7)
        objc_setProperty_atomic(v7, v5, v6, 1008);

      v17.receiver = *(id *)(a1 + 32);
      v17.super_class = (Class)__NSURLSessionWebSocketTask;
      objc_msgSendSuper2(&v17, sel__onqueue_cancel);
    }
  }
}

void __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke_6(uint64_t a1)
{
  -[__NSURLSessionWebSocketTask _onqueue_sendCloseCode:reason:cancel:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), 1);
}

void __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke(uint64_t *a1)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  uint64_t v12;

  if (objc_msgSend((id)a1[4], "state") != 3)
  {
    v3 = (void *)a1[4];
    if (v3)
    {
      if (objc_getProperty(v3, v2, 1008, 1))
        return;
      v4 = a1[4];
    }
    else
    {
      v4 = 0;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2;
    aBlock[3] = &unk_1E14FD950;
    v6 = (void *)a1[5];
    v5 = a1[6];
    aBlock[4] = v4;
    v12 = v5;
    v11 = v6;
    v7 = _Block_copy(aBlock);
    v8 = *(void **)(a1[4] + 976);
    v9 = _Block_copy(v7);
    objc_msgSend(v8, "addObject:", v9);

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1[4]);
  }
}

void __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2(uint64_t a1)
{
  -[__NSURLSessionWebSocketTask _onqueue_sendCloseCode:reason:cancel:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40), 0);
}

void __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  id v5;
  uint64_t v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  if (v3 && (v5 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v5))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v3)
      Property = objc_getProperty(v3, v4, 1008, 1);
    else
      Property = 0;
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, Property);
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2;
    v14 = &unk_1E14FDF00;
    v15 = v3;
    v16 = *(id *)(a1 + 40);
    v8 = _Block_copy(&v11);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    v10 = _Block_copy(v8);
    objc_msgSend(v9, "addObject:", v10, v11, v12, v13, v14, v15);

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
  }
}

void __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2(uint64_t a1)
{
  _QWORD **v1;
  id v2;
  NSObject *v3;
  SEL v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *metadata;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD completion[5];
  uint64_t aBlock;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v1 = *(_QWORD ***)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v5 = objc_getProperty(v1, v4, 1008, 1);
    if (v5)
    {
      objc_msgSend(v1, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke;
      v18 = &unk_1E14FDF00;
      v20 = v2;
      v19 = v5;
      -[NSURLSession runDelegateBlock:]((uint64_t)v6, &aBlock);

    }
    else
    {
      v7 = MEMORY[0x1E0C809B0];
      aBlock = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_2;
      v18 = &unk_1E14FC8F0;
      v19 = v1;
      v20 = v2;
      v8 = _Block_copy(&aBlock);
      v9 = nw_content_context_create("websocketPing");
      metadata = nw_ws_create_metadata(nw_ws_opcode_ping);
      objc_msgSend(v1, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      nw_ws_metadata_set_pong_handler(metadata, v11, v8);

      nw_content_context_set_metadata_for_protocol(v9, metadata);
      v12 = (*(uint64_t (**)(_QWORD *))(*v1[111] + 424))(v1[111]);
      v13 = dispatch_data_create(v1 + 118, 4uLL, 0, 0);
      ++*((_DWORD *)v1 + 236);
      completion[0] = v7;
      completion[1] = 3221225472;
      completion[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_5;
      completion[3] = &unk_1E14FC918;
      completion[4] = v1;
      nw_connection_send(v12, v13, v9, 1, completion);

    }
  }

}

uint64_t __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  CFErrorRef v5;
  void *v6;
  __CFError *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];
  __CFError *v12;
  id v13;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = nw_error_copy_cf_error(v3);
  else
    v5 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_3;
  aBlock[3] = &unk_1E14FE070;
  v6 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v7 = v5;
  v12 = v7;
  v8 = _Block_copy(aBlock);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  v10 = _Block_copy(v8);
  objc_msgSend(v9, "addObject:", v10);

  -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_6;
  block[3] = &unk_1E14FE118;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  webSocketLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 944);
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_debug_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEBUG, "%@ Sent ping %d", (uint8_t *)&v5, 0x12u);

  }
}

void __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_3(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_4;
  v3[3] = &unk_1E14FDF00;
  v5 = a1[6];
  v4 = a1[5];
  -[NSURLSession runDelegateBlock:]((uint64_t)v2, v3);

}

uint64_t __60____NSURLSessionWebSocketTask__onqueue_pingWithPongHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[5];
  id v15;

  v3 = *(void **)(a1 + 32);
  if (v3
    && (v4 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v4))
  {
    objc_msgSend(v3, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E14FDF00;
    v6 = *(id *)(a1 + 40);
    v12 = v4;
    v13 = v6;
    v7 = v4;
    -[NSURLSession runDelegateBlock:]((uint64_t)v5, v11);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_2;
    aBlock[3] = &unk_1E14FDF00;
    aBlock[4] = v3;
    v15 = *(id *)(a1 + 40);
    v8 = _Block_copy(aBlock);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
    v10 = _Block_copy(v8);
    objc_msgSend(v9, "addObject:", v10);

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
  }
}

void __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  -[__NSURLSessionWebSocketTask _onqueue_receiveMessageWithCompletionHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  char v23;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E14FC940;
  v18 = v10;
  v19 = v11;
  v23 = a4;
  v13 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = v13;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  dispatch_async(v12, v17);

}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  nw_error_t *v5;
  NSObject *v6;
  CFErrorRef v7;
  uint64_t v8;
  void *v9;
  nw_ws_opcode_t opcode;
  void *v11;
  void *v12;
  NSURLSessionWebSocketMessage *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSURLSessionWebSocketMessage *v17;
  uint64_t v18;
  void **v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  nw_error_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSURLSessionWebSocketMessage *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD aBlock[5];
  NSURLSessionWebSocketMessage *v33;
  id v34;
  uint8_t buf[4];
  nw_error_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  if (!v2)
  {
    v5 = (nw_error_t *)(a1 + 40);
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = 0;
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  v3 = nw_protocol_copy_ws_definition();
  v4 = nw_content_context_copy_protocol_metadata(v2, v3);

  v5 = (nw_error_t *)(a1 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v4)
    {
LABEL_13:
      opcode = nw_ws_metadata_get_opcode(v4);
      goto LABEL_20;
    }
LABEL_14:
    if (*(_BYTE *)(a1 + 72))
    {
      v11 = *(void **)(a1 + 48);
      if (v11)
        v12 = (void *)objc_msgSend(v11, "error:code:", *MEMORY[0x1E0CB2FE0], 57);
      else
        v12 = 0;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1008), v12);
    }
    v4 = 0;
    goto LABEL_19;
  }
  if (v4 && *(_BYTE *)(a1 + 72))
    goto LABEL_13;
LABEL_8:
  webSocketLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v24 = *v5;
    *(_DWORD *)buf = 138412290;
    v36 = v24;
    _os_log_error_impl(&dword_183ECA000, v6, OS_LOG_TYPE_ERROR, "Read completed with an error %@", buf, 0xCu);
  }

  v7 = nw_error_copy_cf_error(*v5);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(v8 + 1008);
  *(_QWORD *)(v8 + 1008) = v7;

  if (v4)
    goto LABEL_13;
LABEL_19:
  opcode = nw_ws_opcode_invalid;
LABEL_20:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1008))
  {
    v13 = 0;
  }
  else
  {
    switch(opcode)
    {
      case nw_ws_opcode_text:
        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (*(_QWORD *)(a1 + 56))
          v15 = *(_QWORD *)(a1 + 56);
        else
          v15 = MEMORY[0x1E0C80D00];
        v16 = objc_msgSend(v14, "initWithData:encoding:", v15, 4);
        if (v16)
        {
          v13 = -[NSURLSessionWebSocketMessage initWithString:]([NSURLSessionWebSocketMessage alloc], "initWithString:", v16);
        }
        else
        {
          webSocketLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_183ECA000, v25, OS_LOG_TYPE_ERROR, "String data is not UTF-8 encoded", buf, 2u);
          }

          v26 = *(void **)(a1 + 48);
          if (v26)
            v27 = (void *)objc_msgSend(v26, "error:code:", *MEMORY[0x1E0CB32E8], -1016);
          else
            v27 = 0;
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1008), v27);
          v16 = 0;
LABEL_46:
          v13 = 0;
        }
LABEL_47:

        break;
      case nw_ws_opcode_binary:
        v17 = [NSURLSessionWebSocketMessage alloc];
        if (*(_QWORD *)(a1 + 56))
          v18 = *(_QWORD *)(a1 + 56);
        else
          v18 = MEMORY[0x1E0C80D00];
        v13 = -[NSURLSessionWebSocketMessage initWithData:](v17, "initWithData:", v18);
        break;
      case nw_ws_opcode_close:
        v19 = (void **)(a1 + 48);
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 960) = nw_ws_metadata_get_close_code(v4);
        if (*(_QWORD *)(a1 + 56))
          v20 = *(void **)(a1 + 56);
        else
          v20 = (void *)MEMORY[0x1E0C80D00];
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 968), v20);
        v21 = *v19;
        if (*v19)
          v21 = (void *)objc_msgSend(v21, "error:code:", *MEMORY[0x1E0CB2FE0], 57);
        v22 = v21;
        v13 = 0;
        v23 = *(_QWORD *)(a1 + 48);
        v16 = *(NSObject **)(v23 + 1008);
        *(_QWORD *)(v23 + 1008) = v22;
        goto LABEL_47;
      case nw_ws_opcode_ping:
      case nw_ws_opcode_pong:
        -[__NSURLSessionWebSocketTask _onqueue_receiveMessageWithCompletionHandler:]();
        goto LABEL_49;
      default:
        webSocketLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v36) = opcode;
          _os_log_fault_impl(&dword_183ECA000, v16, OS_LOG_TYPE_FAULT, "Read unkown opcode %d", buf, 8u);
        }
        goto LABEL_46;
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_20;
  aBlock[3] = &unk_1E14FE070;
  aBlock[4] = *(_QWORD *)(a1 + 48);
  v34 = *(id *)(a1 + 64);
  v28 = v13;
  v33 = v28;
  v29 = _Block_copy(aBlock);
  v30 = *(void **)(*(_QWORD *)(a1 + 48) + 1000);
  v31 = _Block_copy(v29);
  objc_msgSend(v30, "addObject:", v31);

  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 940) = 0;
  -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 48));

LABEL_49:
}

void __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_20(id *a1, const char *a2)
{
  id Property;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  Property = a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 1008, 1);
  v4 = Property;
  objc_msgSend(a1[4], "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2_21;
  v7[3] = &unk_1E14FE070;
  v10 = a1[6];
  v8 = a1[5];
  v6 = v4;
  v9 = v6;
  -[NSURLSession runDelegateBlock:]((uint64_t)v5, v7);

}

uint64_t __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2_21(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[5];
  id v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  if (v3
    && (v4 = objc_getProperty(v3, a2, 1008, 1), v3 = *(void **)(a1 + 32), v4))
  {
    objc_msgSend(v3, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3;
    v11[3] = &unk_1E14FDF00;
    v6 = *(id *)(a1 + 48);
    v12 = v4;
    v13 = v6;
    v7 = v4;
    -[NSURLSession runDelegateBlock:]((uint64_t)v5, v11);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E14FE070;
    aBlock[4] = v3;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v8 = _Block_copy(aBlock);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
    v10 = _Block_copy(v8);
    objc_msgSend(v9, "addObject:", v10);

    -[__NSURLSessionWebSocketTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
  }
}

void __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD **v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  SEL v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *metadata;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;

  v1 = *(_QWORD ***)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(v1, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v7 = objc_getProperty(v1, v6, 1008, 1);
    if (v7)
    {
      objc_msgSend(v1, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke;
      v19 = &unk_1E14FDF00;
      v21 = v4;
      v20 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, &v16);

      v9 = v21;
    }
    else
    {
      v9 = nw_content_context_create("websocketSend");
      if (objc_msgSend(v3, "type"))
      {
        metadata = nw_ws_create_metadata(nw_ws_opcode_text);
        objc_msgSend(v3, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
        objc_msgSend(v3, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_msgSend(v12, "_createDispatchData");
      v14 = metadata;

      nw_content_context_set_metadata_for_protocol(v9, metadata);
      v15 = (*(uint64_t (**)(_QWORD *))(*v1[111] + 424))(v1[111]);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_2;
      v19 = &unk_1E14FC8F0;
      v20 = v1;
      v21 = v4;
      nw_connection_send(v15, v13, v9, 1, &v16);

    }
  }

}

uint64_t __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_3;
  block[3] = &unk_1E14FE070;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  CFErrorRef v3;
  void *v4;
  __CFError *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];
  __CFError *v10;
  id v11;

  v2 = a1[4];
  if (v2)
  {
    v3 = nw_error_copy_cf_error(v2);
    objc_storeStrong((id *)(a1[5] + 1008), v3);
  }
  else
  {
    v3 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E14FE070;
  v4 = (void *)a1[6];
  aBlock[4] = a1[5];
  v11 = v4;
  v5 = v3;
  v10 = v5;
  v6 = _Block_copy(aBlock);
  v7 = *(void **)(a1[5] + 1000);
  v8 = _Block_copy(v6);
  objc_msgSend(v7, "addObject:", v8);

  -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1[5]);
}

void __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_4(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_5;
  v3[3] = &unk_1E14FDF00;
  v5 = a1[6];
  v4 = a1[5];
  -[NSURLSession runDelegateBlock:]((uint64_t)v2, v3);

}

uint64_t __70____NSURLSessionWebSocketTask__onqueue_sendMessage_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSInteger)maximumMessageSize
{
  return self->_maximumMessageSize;
}

- (void)setMaximumMessageSize:(NSInteger)maximumMessageSize
{
  self->_maximumMessageSize = maximumMessageSize;
}

- (NSURLSessionWebSocketCloseCode)closeCode
{
  return self->_closeCode;
}

- (NSData)closeReason
{
  return (NSData *)objc_getProperty(self, a2, 776, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeReason, 0);
}

@end
