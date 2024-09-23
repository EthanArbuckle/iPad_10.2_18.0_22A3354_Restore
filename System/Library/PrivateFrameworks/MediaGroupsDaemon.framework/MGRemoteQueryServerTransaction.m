@implementation MGRemoteQueryServerTransaction

- (MGRemoteQueryServerTransaction)initWithConnection:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  MGRemoteQueryServerTransaction *v12;
  MGRemoteQueryServerTransaction *v13;
  NSError *error;
  MGRemoteQueryServerHandlerProtocol *handler;
  id v16;
  uint64_t v17;
  OS_os_transaction *transaction;
  NSObject *v19;
  _QWORD block[4];
  MGRemoteQueryServerTransaction *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MGRemoteQueryServerTransaction;
  v12 = -[MGRemoteQueryServerTransaction init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_dispatchQueue, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    error = v13->_error;
    v13->_state = 0;
    v13->_error = 0;

    handler = v13->_handler;
    v13->_handler = 0;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.MediaGroups.RemoteQuery.Server-Transaction-%llu"), nw_connection_get_id());
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v16, "UTF8String");
    v17 = os_transaction_create();
    transaction = v13->_transaction;
    v13->_transaction = (OS_os_transaction *)v17;

    -[MGRemoteQueryServerTransaction dispatchQueue](v13, "dispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__MGRemoteQueryServerTransaction_initWithConnection_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v22 = v13;
    dispatch_async(v19, block);

  }
  return v13;
}

uint64_t __76__MGRemoteQueryServerTransaction_initWithConnection_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryServerTransaction _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerTransaction;
  -[MGRemoteQueryServerTransaction dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MGRemoteQueryServerTransaction state](self, "state");
  -[MGRemoteQueryServerTransaction connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerTransaction handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _state = %lu, _connection = %@, _handler = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  MGRemoteQueryServerTransaction *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[MGRemoteQueryServerTransaction state](self, "state");
  MGLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 >= a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218496;
      v13 = self;
      v14 = 2048;
      v15 = a3;
      v16 = 2048;
      v17 = -[MGRemoteQueryServerTransaction state](self, "state");
      v9 = "%p transaction invalid state change to %lu from %lu";
      v10 = v8;
      v11 = 32;
LABEL_16:
      _os_log_error_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    }
LABEL_7:

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218496;
      v13 = self;
      v14 = 2048;
      v15 = a3;
      v16 = 2048;
      v17 = -[MGRemoteQueryServerTransaction state](self, "state");
      _os_log_debug_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEBUG, "%p transaction advancing to state %lu from %lu", (uint8_t *)&v12, 0x20u);
    }

    -[MGRemoteQueryServerTransaction setState:](self, "setState:", a3);
    switch(a3)
    {
      case 1uLL:
        -[MGRemoteQueryServerTransaction _prepareConnection](self, "_prepareConnection");
        break;
      case 2uLL:
        -[MGRemoteQueryServerTransaction _requestRead](self, "_requestRead");
        break;
      case 3uLL:
        -[MGRemoteQueryServerTransaction _responseStart](self, "_responseStart");
        break;
      case 4uLL:
        -[MGRemoteQueryServerTransaction _invalidate](self, "_invalidate");
        break;
      case 5uLL:
        -[MGRemoteQueryServerTransaction _invalidated](self, "_invalidated");
        break;
      default:
        MGLogForCategory(5);
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v12 = 134218240;
        v13 = self;
        v14 = 2048;
        v15 = a3;
        v9 = "%p transaction unexpected state change %lu";
        v10 = v8;
        v11 = 22;
        goto LABEL_16;
    }
  }
}

- (void)_prepareConnection
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD handler[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id location;
  uint8_t buf[4];
  MGRemoteQueryServerTransaction *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  -[MGRemoteQueryServerTransaction connection](self, "connection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v12[5];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v4, v5);

  v6 = v12[5];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __52__MGRemoteQueryServerTransaction__prepareConnection__block_invoke;
  handler[3] = &unk_24E0AA520;
  objc_copyWeak(&v10, &location);
  handler[4] = &v11;
  nw_connection_set_state_changed_handler(v6, handler);
  MGLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = v12[5];
    *(_DWORD *)buf = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEBUG, "%p transaction accepting connection %@", buf, 0x16u);
  }

  nw_connection_start((nw_connection_t)v12[5]);
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);

  objc_destroyWeak(&location);
}

void __52__MGRemoteQueryServerTransaction__prepareConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  switch(a2)
  {
    case 5:
      objc_msgSend(WeakRetained, "_updateState:", 5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

      break;
    case 4:
      if (v10)
      {
        objc_msgSend(WeakRetained, "_handleNWError:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 57, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_handleError:", v9);

      }
      break;
    case 3:
      objc_msgSend(WeakRetained, "_updateState:", 2);
      break;
  }

}

- (void)_handleError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  MGRemoteQueryServerTransaction *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MGRemoteQueryServerTransaction state](self, "state") <= 3)
  {
    MGLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p transaction failed, error %@", (uint8_t *)&v7, 0x16u);
    }

    -[MGRemoteQueryServerTransaction setError:](self, "setError:", v4);
    -[MGRemoteQueryServerTransaction _updateState:](self, "_updateState:", 4);
  }

}

- (void)_handleNWError:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  CFErrorRef v6;

  v4 = a3;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = nw_error_copy_cf_error(v4);
  -[MGRemoteQueryServerTransaction _handleError:](self, "_handleError:", v6);

}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  OS_nw_connection *connection;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  MGRemoteQueryServerTransaction *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[MGRemoteQueryServerTransaction state](self, "state") <= 4)
  {
    MGLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[MGRemoteQueryServerTransaction error](self, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p transaction invalidating, error %@", buf, 0x16u);

    }
    -[MGRemoteQueryServerTransaction setHandler:](self, "setHandler:", 0);
    -[MGRemoteQueryServerTransaction connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = 0;

    -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServerTransaction error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__MGRemoteQueryServerTransaction__invalidate__block_invoke;
      v9[3] = &unk_24E0AAC70;
      v11 = v8 != 0;
      v10 = v5;
      dispatch_async(v7, v9);

    }
  }
}

void __45__MGRemoteQueryServerTransaction__invalidate__block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(NSObject **)(a1 + 32);
  if (v1)
    nw_connection_force_cancel(v2);
  else
    nw_connection_cancel(v2);
}

- (void)_invalidated
{
  NSObject *v3;

  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerTransaction _delegateNotifyInvalidated](self, "_delegateNotifyInvalidated");
  -[MGRemoteQueryServerTransaction setTransaction:](self, "setTransaction:", 0);
}

- (void)_requestRead
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  _BYTE location[12];
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[MGRemoteQueryServerTransaction state](self, "state") == 2)
  {
    objc_initWeak((id *)location, self);
    -[MGRemoteQueryServerTransaction connection](self, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__MGRemoteQueryServerTransaction__requestRead__block_invoke;
    v6[3] = &unk_24E0AAC98;
    objc_copyWeak(&v7, (id *)location);
    v6[4] = self;
    nw_connection_receive(v4, 1u, 0x100000u, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)location);
  }
  else
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134218240;
      *(_QWORD *)&location[4] = self;
      v9 = 2048;
      v10 = -[MGRemoteQueryServerTransaction state](self, "state");
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p transaction not reading in state %lu", location, 0x16u);
    }

  }
}

void __46__MGRemoteQueryServerTransaction__requestRead__block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") != 2)
    {
      MGLogForCategory(5);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v24 = v13;
        v25 = 2048;
        v26 = objc_msgSend(v13, "state");
        _os_log_error_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_ERROR, "%p transaction discarding read result in state %lu", buf, 0x16u);
      }
      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 32), "_delegateNotifyActivityOccurred");
    if (v9 && dispatch_data_get_size(v9))
    {
      MGLogForCategory(5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v13;
        _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p transaction received body payload", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 40, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_handleError:", v15);
      goto LABEL_24;
    }
    if ((a4 & 1) == 0)
    {
      MGLogForCategory(5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v13;
        _os_log_impl(&dword_21CBD2000, v19, OS_LOG_TYPE_DEFAULT, "%p transaction read incomplete, repeating", buf, 0xCu);
      }

      objc_msgSend(v13, "dispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__MGRemoteQueryServerTransaction__requestRead__block_invoke_10;
      block[3] = &unk_24E0AA4F8;
      block[4] = v13;
      dispatch_async(v15, block);
      goto LABEL_24;
    }
    if (v10)
    {
      v16 = nw_protocol_copy_http_definition();
      v15 = nw_content_context_copy_protocol_metadata(v10, v16);

      if (v15)
      {
        v17 = nw_http_metadata_copy_request();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v13, "_requestProcess:", v17);
          if (v11)
            objc_msgSend(v13, "_handleNWError:", v11);
LABEL_23:

LABEL_24:
          goto LABEL_25;
        }
      }
    }
    else
    {
      v15 = 0;
    }
    MGLogForCategory(5);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v13;
      _os_log_error_impl(&dword_21CBD2000, v20, OS_LOG_TYPE_ERROR, "%p transaction received malformed data", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 100, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_handleError:", v21);

    v18 = 0;
    goto LABEL_23;
  }
LABEL_25:

}

uint64_t __46__MGRemoteQueryServerTransaction__requestRead__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestRead");
}

- (void)_requestProcess:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];

  -[MGRemoteQueryServerTransaction _requestParse:](self, "_requestParse:", a3);
  if (-[MGRemoteQueryServerTransaction _requestValidate](self, "_requestValidate"))
  {
    -[MGRemoteQueryServerTransaction request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rq_timeout");

    -[MGRemoteQueryServerTransaction _delegateNotifyTimeoutInterval:](self, "_delegateNotifyTimeoutInterval:", v5);
    -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__MGRemoteQueryServerTransaction__requestProcess___block_invoke;
    block[3] = &unk_24E0AA4F8;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 94, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServerTransaction _handleError:](self, "_handleError:", v7);

  }
}

uint64_t __50__MGRemoteQueryServerTransaction__requestProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:", 3);
}

- (void)_requestParse:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v13 = a3;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = nw_http_request_copy_url();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    free(v6);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v14 = v10;
  nw_http_request_access_method();
  v11 = (void *)nw_http_request_copy_header_fields();
  v12 = v14;
  nw_http_fields_enumerate();
  -[MGRemoteQueryServerTransaction setRequest:](self, "setRequest:", v12);

}

void __48__MGRemoteQueryServerTransaction__requestParse___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHTTPMethod:", v3);

}

uint64_t __48__MGRemoteQueryServerTransaction__requestParse___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 4);
  objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", v9, v8);

  return 1;
}

- (BOOL)_requestValidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  char v12;
  int v14;
  MGRemoteQueryServerTransaction *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerTransaction request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDE12F8]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v5 && v6 && !objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  v9 = objc_msgSend(v4, "rq_protocolVersion") == 1 && v8;
  -[MGRemoteQueryServerTransaction _handlerForRequest:](self, "_handlerForRequest:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_14;
  -[MGRemoteQueryServerTransaction setHandler:](self, "setHandler:", v10);
  MGLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218242;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    _os_log_debug_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_DEBUG, "%p transaction using handler %@", (uint8_t *)&v14, 0x16u);
  }

  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v10, "validateRequest");
    else
      v12 = 1;
  }
  else
  {
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (void)_responseStart
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *well_known;
  NSObject *metadata_for_response;
  NSObject *v16;
  NSObject *v17;
  _QWORD completion[5];
  id v19;
  uint8_t buf[4];
  MGRemoteQueryServerTransaction *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[MGRemoteQueryServerTransaction state](self, "state") == 3)
  {
    -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[MGRemoteQueryServerTransaction request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v10, "rq_protocolVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x220788248]();
      objc_msgSend(CFSTR("no-store, no-transform"), "UTF8String");
      nw_http_fields_append();
      objc_msgSend(CFSTR("x-apple-mediagroups-version"), "UTF8String");
      v5 = objc_retainAutorelease(v11);
      -[NSObject UTF8String](v5, "UTF8String");
      nw_http_fields_append();
      -[MGRemoteQueryServerTransaction handler](self, "handler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prepareResponse:", v12);

      well_known = (void *)nw_http_response_create_well_known();
      nw_http_response_set_header_fields();
      metadata_for_response = nw_http_create_metadata_for_response();
      v16 = nw_content_context_create("response");
      nw_content_context_set_metadata_for_protocol(v16, metadata_for_response);
      -[MGRemoteQueryServerTransaction setResponseContext:](self, "setResponseContext:", v16);
      objc_initWeak((id *)buf, self);
      -[MGRemoteQueryServerTransaction connection](self, "connection");
      v17 = objc_claimAutoreleasedReturnValue();
      completion[0] = MEMORY[0x24BDAC760];
      completion[1] = 3221225472;
      completion[2] = __48__MGRemoteQueryServerTransaction__responseStart__block_invoke;
      completion[3] = &unk_24E0AAD10;
      objc_copyWeak(&v19, (id *)buf);
      completion[4] = self;
      nw_connection_send(v17, MEMORY[0x24BDAC990], v16, 0, completion);

      -[MGRemoteQueryServerTransaction _responseObtainPayloadFromHandler](self, "_responseObtainPayloadFromHandler");
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);

      goto LABEL_9;
    }
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v21 = self;
      v6 = "%p transaction already started response";
      v7 = v5;
      v8 = 12;
LABEL_7:
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
    }
  }
  else
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v21 = self;
      v22 = 2048;
      v23 = -[MGRemoteQueryServerTransaction state](self, "state");
      v6 = "%p transaction not starting response in state %lu";
      v7 = v5;
      v8 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:

}

void __48__MGRemoteQueryServerTransaction__responseStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_delegateNotifyActivityOccurred");
      if (v3)
        objc_msgSend(v5, "_handleNWError:", v3);
    }
    else
    {
      MGLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 134218240;
        v8 = v5;
        v9 = 2048;
        v10 = objc_msgSend(v5, "state");
        _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send result in state %lu", (uint8_t *)&v7, 0x16u);
      }

    }
  }

}

- (void)_responseAppend:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _QWORD v13[5];
  id v14;
  _BYTE location[12];
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MGRemoteQueryServerTransaction state](self, "state") != 3)
  {
    MGLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)location = 134218240;
    *(_QWORD *)&location[4] = self;
    v16 = 2048;
    v17 = -[MGRemoteQueryServerTransaction state](self, "state");
    v10 = "%p transaction not appending response in state %lu";
    v11 = v7;
    v12 = 22;
LABEL_9:
    _os_log_error_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_ERROR, v10, location, v12);
    goto LABEL_7;
  }
  -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    MGLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)location = 134217984;
    *(_QWORD *)&location[4] = self;
    v10 = "%p transaction has not started response";
    v11 = v7;
    v12 = 12;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v4, "_createDispatchData");
  objc_initWeak((id *)location, self);
  -[MGRemoteQueryServerTransaction connection](self, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__MGRemoteQueryServerTransaction__responseAppend___block_invoke;
  v13[3] = &unk_24E0AAD10;
  objc_copyWeak(&v14, (id *)location);
  v13[4] = self;
  nw_connection_send(v8, v7, v9, 0, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_7:

}

void __50__MGRemoteQueryServerTransaction__responseAppend___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_delegateNotifyActivityOccurred");
      if (v3)
        objc_msgSend(v5, "_handleNWError:", v3);
      else
        objc_msgSend(*(id *)(a1 + 32), "_responseObtainPayloadFromHandler");
    }
    else
    {
      MGLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 134218240;
        v8 = v5;
        v9 = 2048;
        v10 = objc_msgSend(v5, "state");
        _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send append result in state %lu", (uint8_t *)&v7, 0x16u);
      }

    }
  }

}

- (void)_responseEnd
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _BYTE location[12];
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[MGRemoteQueryServerTransaction state](self, "state") == 3)
  {
    -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
      v5 = objc_claimAutoreleasedReturnValue();
      nw_content_context_set_is_final(v5, 1);

      objc_initWeak((id *)location, self);
      -[MGRemoteQueryServerTransaction connection](self, "connection");
      v6 = objc_claimAutoreleasedReturnValue();
      -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
      v7 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __46__MGRemoteQueryServerTransaction__responseEnd__block_invoke;
      v9[3] = &unk_24E0AAD10;
      objc_copyWeak(&v10, (id *)location);
      v9[4] = self;
      nw_connection_send(v6, MEMORY[0x24BDAC990], v7, 1, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)location);
      return;
    }
    MGLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134217984;
      *(_QWORD *)&location[4] = self;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p transaction not ending response when it has not started response", location, 0xCu);
    }
  }
  else
  {
    MGLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134218240;
      *(_QWORD *)&location[4] = self;
      v12 = 2048;
      v13 = -[MGRemoteQueryServerTransaction state](self, "state");
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p transaction not ending response in state %lu", location, 0x16u);
    }
  }

}

void __46__MGRemoteQueryServerTransaction__responseEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_delegateNotifyActivityOccurred");
      if (v3)
        objc_msgSend(v5, "_handleNWError:", v3);
      else
        objc_msgSend(*(id *)(a1 + 32), "_invalidate");
    }
    else
    {
      MGLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 134218240;
        v8 = v5;
        v9 = 2048;
        v10 = objc_msgSend(v5, "state");
        _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send end result in state %lu", (uint8_t *)&v7, 0x16u);
      }

    }
  }

}

- (void)_responseObtainPayloadFromHandler
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id location;
  _BYTE buf[24];
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[MGRemoteQueryServerTransaction state](self, "state") == 3)
  {
    -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_initWeak(&location, self);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v13 = __Block_byref_object_copy__22;
      v14 = __Block_byref_object_dispose__23;
      v5 = MEMORY[0x24BDAC760];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke;
      v9[3] = &unk_24E0AAD38;
      objc_copyWeak(&v10, &location);
      v15 = (id)MEMORY[0x220788584](v9);
      -[MGRemoteQueryServerTransaction handler](self, "handler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_3;
      v8[3] = &unk_24E0AAD60;
      v8[4] = buf;
      objc_msgSend(v6, "provideResponseData:", v8);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      return;
    }
    MGLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p transaction not requesting payload without having started response", buf, 0xCu);
    }
  }
  else
  {
    MGLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = -[MGRemoteQueryServerTransaction state](self, "state");
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p transaction not requesting payload in state %lu", buf, 0x16u);
    }
  }

}

void __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_2;
    block[3] = &unk_24E0AA778;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_responseHandlePayloadFromHandler:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

- (void)_responseHandlePayloadFromHandler:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  MGRemoteQueryServerTransaction *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[MGRemoteQueryServerTransaction state](self, "state") != 3)
  {
    MGLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    v14 = 134218240;
    v15 = self;
    v16 = 2048;
    v17 = -[MGRemoteQueryServerTransaction state](self, "state");
    v11 = "%p transaction not accepting payload in state %lu";
    v12 = v10;
    v13 = 22;
LABEL_14:
    _os_log_error_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, v13);
    goto LABEL_8;
  }
  -[MGRemoteQueryServerTransaction responseContext](self, "responseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    MGLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v14 = 134217984;
    v15 = self;
    v11 = "%p transaction not accepting payload without having started response";
    v12 = v10;
    v13 = 12;
    goto LABEL_14;
  }
  if (v7)
  {
    -[MGRemoteQueryServerTransaction _handleError:](self, "_handleError:", v7);
  }
  else if (v6)
  {
    -[MGRemoteQueryServerTransaction _responseAppend:](self, "_responseAppend:", v6);
  }
  else
  {
    -[MGRemoteQueryServerTransaction _responseEnd](self, "_responseEnd");
  }
LABEL_9:

}

- (void)_delegateNotifyTimeoutInterval:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;

  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryServerTransaction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "transaction:receivedTimeoutInterval:", self, a3);
    v6 = v7;
  }

}

- (void)_delegateNotifyActivityOccurred
{
  NSObject *v3;
  void *v4;
  id v5;

  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerTransaction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "transactionActivityOccurred:", self);
    v4 = v5;
  }

}

- (void)_delegateNotifyInvalidated
{
  NSObject *v3;
  void *v4;
  id v5;

  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerTransaction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "transactionInvalidated:", self);
    v4 = v5;
  }

}

- (id)_handlerForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServerTransaction dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (qword_25531B948 != -1)
    dispatch_once(&qword_25531B948, &__block_literal_global_3);
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)_MergedGlobals_0;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "urlPath", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          objc_msgSend(v11, "handlerForRequest:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

void __53__MGRemoteQueryServerTransaction__handlerForRequest___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = v2;

}

- (MGRemoteQueryServerTransactionDelegate)delegate
{
  return (MGRemoteQueryServerTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (OS_nw_content_context)responseContext
{
  return self->_responseContext;
}

- (void)setResponseContext:(id)a3
{
  objc_storeStrong((id *)&self->_responseContext, a3);
}

- (MGRemoteQueryServerHandlerProtocol)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
