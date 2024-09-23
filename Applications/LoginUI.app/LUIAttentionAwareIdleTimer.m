@implementation LUIAttentionAwareIdleTimer

+ (BOOL)shouldSetupAttentionAwareIdleTimer
{
  uint64_t v2;
  id v3;
  char v4;
  _QWORD block[4];
  id v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AACC;
  block[3] = &unk_100068C58;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v2 = qword_100088E18;
  v3 = v7;
  if (v2 != -1)
    dispatch_once(&qword_100088E18, block);
  v4 = byte_100088E10;

  return v4;
}

+ (id)sharedInstance
{
  if (qword_100088E28 != -1)
    dispatch_once(&qword_100088E28, &stru_100069BB8);
  return (id)qword_100088E20;
}

- (LUIAttentionAwareIdleTimer)init
{
  LUIAttentionAwareIdleTimer *v2;
  AWAttentionAwarenessConfiguration *v3;
  AWAttentionAwarenessConfiguration *config;
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *client;
  dispatch_queue_t v7;
  OS_dispatch_queue *attentionAwarenessClientQueue;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LUIAttentionAwareIdleTimer;
  v2 = -[LUIAttentionAwareIdleTimer init](&v15, "init");
  if (v2)
  {
    v3 = objc_opt_new(AWAttentionAwarenessConfiguration);
    config = v2->_config;
    v2->_config = v3;

    -[AWAttentionAwarenessConfiguration setIdentifier:](v2->_config, "setIdentifier:", CFSTR("LUIAttentionAwareIdleTimerConfig"));
    -[AWAttentionAwarenessConfiguration setEventMask:](v2->_config, "setEventMask:", 3967);
    -[AWAttentionAwarenessConfiguration setAttentionLostTimeout:](v2->_config, "setAttentionLostTimeout:", 30.0);
    v5 = objc_opt_new(AWAttentionAwarenessClient);
    client = v2->_client;
    v2->_client = v5;

    -[AWAttentionAwarenessClient setConfiguration:shouldReset:](v2->_client, "setConfiguration:shouldReset:", v2->_config, 1);
    v7 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("LUIAttentionAwareIdleTimerQueue"), "UTF8String"), 0);
    attentionAwarenessClientQueue = v2->_attentionAwarenessClientQueue;
    v2->_attentionAwarenessClientQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer client](v2, "client"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer attentionAwarenessClientQueue](v2, "attentionAwarenessClientQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002AD60;
    v12[3] = &unk_100069BE0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "setEventHandlerWithQueue:block:", v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)start
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[8];
  id v14;

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer client](self, "client"));
    v14 = 0;
    v4 = objc_msgSend(v3, "resumeWithError:", &v14);
    v5 = v14;

    v6 = qword_100088F40;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attention aware timer started successfully", v13, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_ERROR))
    {
      sub_10003C738((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }

  }
}

- (void)pause
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[8];
  id v14;

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer client](self, "client"));
    v14 = 0;
    v4 = objc_msgSend(v3, "suspendWithError:", &v14);
    v5 = v14;

    v6 = qword_100088F40;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attention aware timer suspended successfully", v13, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_ERROR))
    {
      sub_10003C7A0((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }

  }
}

- (void)_attentionLost
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "idleTimerFired");

    if ((v6 & 1) != 0)
    {
      v7 = qword_100088F40;
      if (os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attention aware idle timer fired.", v9, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAttentionAwareIdleTimer delegate](self, "delegate"));
      objc_msgSend(v8, "idleTimerFired");

    }
  }
}

- (LUIAttentionAwareIdleTimerDelegate)delegate
{
  return (LUIAttentionAwareIdleTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AWAttentionAwarenessConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (AWAttentionAwarenessClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)attentionAwarenessClientQueue
{
  return self->_attentionAwarenessClientQueue;
}

- (void)setAttentionAwarenessClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
