@implementation MSService

uint64_t __17__MSService_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_responseListener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)start
{
  __assert_rtn("-[MSService start]", "MSService.m", 94, "_connection == NULL && \"attempt to start connection multiple times.\");
}

void __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  char *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  const char *string;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  char *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v51 = 0xAAAAAAAAAAAAAAAALL;
  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_createMessageForService:arguments:index:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v51);
  if (objc_msgSend(*v2, "isCanceled"))
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = v51;
      v7 = *(void **)(v5 + 32);
      v8 = v3;
      v9 = (char *)MEMORY[0x20BD2ED64]();
      if (v9)
        v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, strlen(v9), 4, 1);

      *(_DWORD *)buf = 138413058;
      v53 = v5;
      v54 = 2048;
      v55 = v6;
      v56 = 2048;
      v57 = v7;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_20AC30000, v4, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> canceling enqueued message %@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 1501, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = v51;
      v14 = *(void **)(v12 + 32);
      v15 = v3;
      v16 = (char *)MEMORY[0x20BD2ED64]();
      if (v16)
        v16 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v16, strlen(v16), 4, 1);

      *(_DWORD *)buf = 138413058;
      v53 = v12;
      v54 = 2048;
      v55 = v13;
      v56 = 2048;
      v57 = v14;
      v58 = 2112;
      v59 = v16;
      _os_log_impl(&dword_20AC30000, v11, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> sending message %@", buf, 0x2Au);

    }
    v10 = 0;
  }
  v17 = 0;
  v18 = 0;
  while (!(v10 | v17))
  {
    v19 = (void *)MEMORY[0x20BD2EA04]();
    v20 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 32), v3);
    v21 = MEMORY[0x20BD2EDD0]();
    v22 = v21;
    if (v21 == MEMORY[0x24BDACFB8])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
      {
        MFLogGeneral();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v53 = v25;
          v54 = 2048;
          v55 = v51;
          _os_log_impl(&dword_20AC30000, v24, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : message was canceled", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 1501, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v23 = v20;
      }
      else
      {
        v28 = *(void **)(a1 + 32);
        v50 = v18;
        objc_msgSend(v28, "_handleMessageSendFailure:message:messageIndex:context:", v20, v3, v51, &v50);
        v10 = objc_claimAutoreleasedReturnValue();
        v29 = v50;

        if (v10)
        {
          MFLogGeneral();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v37 = *(_QWORD *)(a1 + 32);
            v38 = v51;
            v45 = *(void **)(v37 + 32);
            objc_msgSend((id)v10, "ef_publicDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v53 = v37;
            v54 = 2048;
            v55 = v38;
            v56 = 2048;
            v57 = v45;
            v58 = 2048;
            v59 = (char *)v3;
            v60 = 2114;
            v61 = v39;
            _os_log_error_impl(&dword_20AC30000, v30, OS_LOG_TYPE_ERROR, "#MailServices %@ (%lld) : <connection: %p> failed to send message <dictionary: %p> %{public}@", buf, 0x34u);

          }
        }
        v17 = 0;
        v23 = v20;
        v18 = v29;
      }
    }
    else
    {
      if (v21 != MEMORY[0x24BDACFA0])
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MSService.m"), 318, CFSTR("Unknown type (%p) returned in reply to message <dictionary: %p>"), v22, v3);
LABEL_17:
        v10 = 0;
        v17 = (unint64_t)v20;
        goto LABEL_31;
      }
      string = xpc_dictionary_get_string(v20, (const char *)objc_msgSend(CFSTR("errorDomain"), "UTF8String"));
      if (string)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v23, xpc_dictionary_get_int64(v20, (const char *)objc_msgSend(CFSTR("errorCode"), "UTF8String")), 0);
        v10 = objc_claimAutoreleasedReturnValue();
        MFLogGeneral();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v44 = v18;
          v34 = *(_QWORD *)(a1 + 32);
          v35 = v51;
          objc_msgSend((id)v10, "ef_publicDescription");
          v36 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v53 = v34;
          v54 = 2048;
          v55 = v35;
          v56 = 2048;
          v57 = v3;
          v58 = 2114;
          v59 = v36;
          _os_log_error_impl(&dword_20AC30000, v27, OS_LOG_TYPE_ERROR, "#MailServices %@ (%lld) : received error response for message <dictionary: %p>: %{public}@", buf, 0x2Au);

          v18 = v44;
        }

        v17 = 0;
      }
      else
      {
        MFLogGeneral();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v31 = *(_QWORD *)(a1 + 32);
        v32 = v51;
        v17 = v20;
        v33 = (char *)MEMORY[0x20BD2ED64]();
        if (v33)
          v33 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v33, strlen(v33), 4, 1);

        *(_DWORD *)buf = 138413058;
        v53 = v31;
        v54 = 2048;
        v55 = v32;
        v56 = 2048;
        v57 = v3;
        v58 = 2112;
        v59 = v33;
        _os_log_impl(&dword_20AC30000, v23, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : received reply for message <dictionary: %p>: %@", buf, 0x2Au);

        v10 = 0;
      }
    }
LABEL_31:

    objc_autoreleasePoolPop(v19);
  }
  v40 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke_38;
  block[3] = &unk_24C3858C0;
  v41 = *(id *)(a1 + 56);
  v48 = (id)v10;
  v49 = v41;
  v47 = (id)v17;
  v42 = (id)v10;
  v43 = (id)v17;
  dispatch_async(v40, block);

}

- (BOOL)isCanceled
{
  return self->_canceled > 0;
}

- (void)_callServicesMethod:(id)a3 arguments:(id)a4 replyHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *connectionQueue;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke;
  block[3] = &unk_24C3858E8;
  block[4] = self;
  v17 = v9;
  v19 = v11;
  v20 = a2;
  v18 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(connectionQueue, block);

}

- (MSService)init
{
  MSService *v2;
  id v3;
  const char *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *replyQueue;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *connectionQueue;
  NSObject *v10;
  MSService *v11;
  MSService *v12;
  _QWORD block[4];
  MSService *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSService;
  v2 = -[MSService init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.mailservices.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = dispatch_queue_create(v4, MEMORY[0x24BDAC9C0]);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".connection"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = v2->_connectionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __17__MSService_init__block_invoke;
    block[3] = &unk_24C3857F8;
    v11 = v2;
    v15 = v11;
    dispatch_sync(v10, block);
    v12 = v11;

  }
  return v2;
}

- (id)_createMessageForService:(id)a3 arguments:(id)a4 index:(int64_t *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  int64_t v11;
  xpc_object_t v12;
  const char *v13;
  id v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  do
  {
    v10 = __ldxr(&_createMessageForService_arguments_index____messageCount);
    v11 = v10 + 1;
  }
  while (__stxr(v10 + 1, &_createMessageForService_arguments_index____messageCount));
  v12 = xpc_dictionary_create(0, 0, 0);
  v13 = (const char *)objc_msgSend(CFSTR("service"), "UTF8String");
  v14 = objc_retainAutorelease(v8);
  xpc_dictionary_set_string(v12, v13, (const char *)objc_msgSend(v14, "UTF8String"));
  xpc_dictionary_set_int64(v12, (const char *)objc_msgSend(CFSTR("_index"), "UTF8String"), v11);
  if (v9)
  {
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v12, (const char *)objc_msgSend(CFSTR("arguments"), "UTF8String"), v15);

  }
  if (self->_responseListener)
    xpc_dictionary_set_connection(v12, (const char *)objc_msgSend(CFSTR("_anonymousConnection"), "UTF8String"), self->_responseListener);
  if (a5)
    *a5 = v11;

  return v12;
}

- (void)dealloc
{
  OS_xpc_object *connection;
  _xpc_connection_s *v4;
  OS_xpc_object *v5;
  OS_xpc_object *responseListener;
  _xpc_connection_s *v7;
  OS_xpc_object *v8;
  OS_xpc_object *responseHandler;
  _xpc_connection_s *v10;
  OS_xpc_object *v11;
  objc_super v12;

  connection = self->_connection;
  if (connection)
  {
    v4 = connection;
    xpc_connection_set_event_handler(v4, &__block_literal_global_0);
    xpc_connection_cancel(v4);

    v5 = self->_connection;
    self->_connection = 0;

  }
  responseListener = self->_responseListener;
  if (responseListener)
  {
    v7 = responseListener;
    xpc_connection_set_event_handler(v7, &__block_literal_global_0);
    xpc_connection_cancel(v7);

    v8 = self->_responseListener;
    self->_responseListener = 0;

  }
  responseHandler = self->_responseHandler;
  if (responseHandler)
  {
    v10 = responseHandler;
    xpc_connection_set_event_handler(v10, &__block_literal_global_0);
    xpc_connection_cancel(v10);

    v11 = self->_responseHandler;
    self->_responseHandler = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)MSService;
  -[MSService dealloc](&v12, sel_dealloc);
}

- (id)_createServiceOnQueue:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[MSService _createServiceOnQueue:]", "MSService.m", 84, "0 && \"subclass must implement\");
}

- (id)_connection
{
  return self->_connection;
}

void __18__MSService_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  const char *name;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MEMORY[0x20BD2EDD0]() != MEMORY[0x24BDACFB8])
    __assert_rtn("-[MSService start]_block_invoke", "MSService.m", 106, "type == XPC_TYPE_ERROR && \"unexpected message received on connection to server\");
  if (v3 == (id)MEMORY[0x24BDACF38])
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      v9 = 136315138;
      v10 = name;
      v5 = "#MailServices Mach service '%s' not found.";
      v6 = v4;
      v7 = 12;
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v3 == (id)MEMORY[0x24BDACF30])
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v5 = "#MailServices Connection interrupted";
      v6 = v4;
      v7 = 2;
LABEL_8:
      _os_log_impl(&dword_20AC30000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v9, v7);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)stop
{
  NSObject *v3;
  OS_xpc_object *connection;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  int v7;
  MSService *v8;
  __int16 v9;
  OS_xpc_object *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (self->_connection)
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      connection = self->_connection;
      v7 = 138412546;
      v8 = self;
      v9 = 2048;
      v10 = connection;
      _os_log_impl(&dword_20AC30000, v3, OS_LOG_TYPE_INFO, "#MailServices %@ stopping <connection: %p>", (uint8_t *)&v7, 0x16u);
    }

    v5 = self->_connection;
    xpc_connection_set_event_handler(v5, &__block_literal_global_0);
    xpc_connection_cancel(v5);

    v6 = self->_connection;
    self->_connection = 0;

  }
}

- (void)cancel
{
  int *p_canceled;
  NSObject *v5;
  OS_xpc_object *connection;
  OS_xpc_object *v7;
  NSObject *v8;
  OS_xpc_object *responseListener;
  OS_xpc_object *v10;
  NSObject *v11;
  OS_xpc_object *responseHandler;
  OS_xpc_object *v13;
  NSObject *connectionQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MSService *v17;
  __int16 v18;
  OS_xpc_object *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_canceled = &self->_canceled;
  do
  {
    if (__ldaxr((unsigned int *)p_canceled))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_canceled));
  if (self->_connection)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2048;
      v19 = connection;
      _os_log_impl(&dword_20AC30000, v5, OS_LOG_TYPE_INFO, "#MailServices %@ cancelling <connection: %p>", buf, 0x16u);
    }

    v7 = self->_connection;
    xpc_connection_set_event_handler(v7, &__block_literal_global_0);
    xpc_connection_cancel(v7);

  }
  if (self->_responseListener)
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      responseListener = self->_responseListener;
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2048;
      v19 = responseListener;
      _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_INFO, "#MailServices %@ stopping response listener <connection: %p>", buf, 0x16u);
    }

    v10 = self->_responseListener;
    xpc_connection_set_event_handler(v10, &__block_literal_global_0);
    xpc_connection_cancel(v10);

  }
  if (self->_responseHandler)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      responseHandler = self->_responseHandler;
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2048;
      v19 = responseHandler;
      _os_log_impl(&dword_20AC30000, v11, OS_LOG_TYPE_INFO, "#MailServices %@ stopping response handler <connection: %p>", buf, 0x16u);
    }

    v13 = self->_responseHandler;
    xpc_connection_set_event_handler(v13, &__block_literal_global_0);
    xpc_connection_cancel(v13);

  }
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__MSService_cancel__block_invoke;
  block[3] = &unk_24C3857F8;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __19__MSService_cancel__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (v3)
  {
    v2[5] = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  v4 = (void *)v2[6];
  if (v4)
  {
    v2[6] = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "stop");
}

- (void)setupResponseConnectionOnQueue:(id)a3
{
  NSObject *v5;
  xpc_connection_t v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  _QWORD v9[5];
  _xpc_connection_s *v10;
  NSObject *v11;
  SEL v12;

  v5 = a3;
  v6 = xpc_connection_create(0, v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__MSService_setupResponseConnectionOnQueue___block_invoke;
  v9[3] = &unk_24C385848;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  v8 = v5;
  v11 = v8;
  v12 = a2;
  xpc_connection_set_event_handler(v7, v9);
  objc_storeStrong((id *)&self->_responseListener, v6);
  xpc_connection_resume(self->_responseListener);

}

void __44__MSService_setupResponseConnectionOnQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;

  v10 = a2;
  v3 = MEMORY[0x20BD2EDD0]();
  v4 = v3;
  if (v3 == MEMORY[0x24BDACFB8])
  {
    objc_msgSend(*(id *)(a1 + 32), "responseConnection:handleError:", *(_QWORD *)(a1 + 40), v10);
  }
  else if (v3 == MEMORY[0x24BDACF88])
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerConnection:onQueue:", v10, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v10;
    v9 = (char *)MEMORY[0x20BD2ED64]();
    if (v9)
      v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, strlen(v9), 4, 1);

    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("MSService.m"), 184, CFSTR("unexpected result type (%p) on listener connection, event = %@"), v4, v9);
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }

}

- (void)_registerConnection:(id)a3 onQueue:(id)a4
{
  _xpc_connection_s *v8;
  NSObject *v9;
  OS_xpc_object **p_responseHandler;
  _xpc_connection_s *v11;
  void *v12;
  _QWORD handler[5];
  _xpc_connection_s *v14;
  SEL v15;

  v8 = (_xpc_connection_s *)a3;
  v9 = a4;
  p_responseHandler = &self->_responseHandler;
  if (self->_responseHandler)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSService.m"), 194, CFSTR("attempted to register multiple connections on anonymous listener"));

  }
  xpc_connection_set_target_queue(v8, v9);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __41__MSService__registerConnection_onQueue___block_invoke;
  handler[3] = &unk_24C385870;
  handler[4] = self;
  v11 = v8;
  v14 = v11;
  v15 = a2;
  xpc_connection_set_event_handler(v11, handler);
  objc_storeStrong((id *)p_responseHandler, a3);
  xpc_connection_resume(*p_responseHandler);

}

void __41__MSService__registerConnection_onQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;

  v10 = a2;
  v3 = MEMORY[0x20BD2EDD0]();
  v4 = v3;
  if (v3 == MEMORY[0x24BDACFB8])
  {
    objc_msgSend(*(id *)(a1 + 32), "responseConnection:handleError:", *(_QWORD *)(a1 + 40), v10);
  }
  else if (v3 == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(*(id *)(a1 + 32), "responseConnection:handleResponse:", *(_QWORD *)(a1 + 40), v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v10;
    v9 = (char *)MEMORY[0x20BD2ED64]();
    if (v9)
      v9 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, strlen(v9), 4, 1);

    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("MSService.m"), 205, CFSTR("unexpected result type (%p) on listener connection, event = %@"), v4, v9);
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }

}

- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6
{
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 2, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_callServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__MSService__callServicesMethod_arguments_callback___block_invoke;
  v10[3] = &unk_24C385898;
  v11 = v8;
  v9 = v8;
  -[MSService _callServicesMethod:arguments:replyHandler:](self, "_callServicesMethod:arguments:replyHandler:", a3, a4, v10);

}

void __52__MSService__callServicesMethod_arguments_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke_38(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);
  MFLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_20AC30000, v9, OS_LOG_TYPE_INFO, "#MailServices MailServices method %@ could not be simulated", (uint8_t *)&v10, 0xCu);
  }

}

@end
