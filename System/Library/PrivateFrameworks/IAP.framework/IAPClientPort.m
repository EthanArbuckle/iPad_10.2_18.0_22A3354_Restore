@implementation IAPClientPort

- (IAPClientPort)initWithUUID:(id)a3 queue:(id)a4 sendHandler:(id)a5
{
  IAPClientPort *v8;
  IAPClientPort *v9;
  __int128 v10;
  id v11;
  objc_super v13;
  char __str[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)IAPClientPort;
  v8 = -[IAPClientPort init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v10;
    v29 = v10;
    v26 = v10;
    v27 = v10;
    v24 = v10;
    v25 = v10;
    v22 = v10;
    v23 = v10;
    v20 = v10;
    v21 = v10;
    v18 = v10;
    v19 = v10;
    v16 = v10;
    v17 = v10;
    *(_OWORD *)__str = v10;
    v15 = v10;
    v8->_uuid = (NSString *)a3;
    v11 = a3;
    v9->_sendDataHandlerQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    v9->_sendDataHandler = _Block_copy(a5);
    snprintf(__str, 0x100uLL, "com.apple.IAPClientPort.%s.event_queue", (const char *)objc_msgSend(a3, "UTF8String"));
    v9->_clientPortEventQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, 0);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_sync((dispatch_queue_t)self->_clientPortEventQueue, &__block_literal_global_3);
  dispatch_release((dispatch_object_t)self->_clientPortEventQueue);
  dispatch_release((dispatch_object_t)self->_sendDataHandlerQueue);
  _Block_release(self->_sendDataHandler);

  v3.receiver = self;
  v3.super_class = (Class)IAPClientPort;
  -[IAPClientPort dealloc](&v3, sel_dealloc);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)sendDataHandlerQueue
{
  return self->_sendDataHandlerQueue;
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
  self->_sendDataHandler = a3;
}

- (OS_dispatch_queue)clientPortEventQueue
{
  return self->_clientPortEventQueue;
}

@end
