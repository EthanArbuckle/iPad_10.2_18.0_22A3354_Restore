@implementation SYSyncEngine

- (SYSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SYSyncEngine *v8;
  SYSyncEngine *v9;
  NSObject *v10;
  os_activity_t v11;
  OS_os_activity *transportActivity;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *queue;
  objc_class *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *v20;
  SYSyncEngine *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SYSyncEngine;
  v8 = -[SYSyncEngine init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_msgSend(v6, "serviceActivity");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _os_activity_create(&dword_211704000, "Transport", v10, OS_ACTIVITY_FLAG_DEFAULT);

    transportActivity = v9->_transportActivity;
    v9->_transportActivity = (OS_os_activity *)v11;

    if (v7)
    {
      v13 = (OS_dispatch_queue *)v7;
      queue = v9->_queue;
      v9->_queue = v13;
    }
    else
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      queue = (OS_dispatch_queue *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = (const char *)-[OS_dispatch_queue UTF8String](queue, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(21, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create_with_target_V2(v16, v17, v18);
      v20 = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v19;

    }
    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v9->_queue);
    v21 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SYSyncEngine;
  -[SYSyncEngine dealloc](&v2, sel_dealloc);
}

- (SYSyncEngineResponder)responder
{
  return (SYSyncEngineResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (void)beginSession
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

}

- (void)endSession
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (BOOL)isInSession
{
  return 0;
}

- (BOOL)buffersSessions
{
  return 0;
}

- (BOOL)buffersHandshake
{
  return 0;
}

- (BOOL)targetIsNearby
{
  return 0;
}

- (BOOL)targetConnected
{
  return 0;
}

- (id)cancelMessagesReturningFailures:(id)a3
{
  return a3;
}

- (OS_os_activity)transportActivity
{
  return self->_transportActivity;
}

- (SYService)service
{
  return (SYService *)objc_loadWeakRetained((id *)&self->_service);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_transportActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_responder);
}

- (BOOL)resume:(id *)a3
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  return 0;
}

- (void)suspend
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  return 0;
}

- (PBCodable)stateForLogging
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  return 0;
}

@end
