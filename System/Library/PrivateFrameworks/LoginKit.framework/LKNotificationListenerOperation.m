@implementation LKNotificationListenerOperation

- (LKNotificationListenerOperation)initWithNotificationType:(unint64_t)a3 timeOutPeriod:(double)a4 completionBlock:(id)a5
{
  id v8;
  LKNotificationListenerOperation *v9;
  LKNotificationListenerOperation *v10;
  uint64_t v11;
  id notificationListenerCompletionBlock;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LKNotificationListenerOperation;
  v9 = -[LKNotificationListenerOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_notificationType = a3;
    v9->_timeOutPeriod = a4;
    v11 = MEMORY[0x2199FBC14](v8);
    notificationListenerCompletionBlock = v10->_notificationListenerCompletionBlock;
    v10->_notificationListenerCompletionBlock = (id)v11;

    v10->_notifyToken = -1;
  }

  return v10;
}

- (void)setOperationReady:(BOOL)a3
{
  if (self->_operationReady != a3)
  {
    -[LKNotificationListenerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ready"));
    self->_operationReady = a3;
    -[LKNotificationListenerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ready"));
  }
}

- (void)setOperationExecuting:(BOOL)a3
{
  if (self->_operationExecuting != a3)
  {
    -[LKNotificationListenerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("executing"));
    self->_operationExecuting = a3;
    -[LKNotificationListenerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("executing"));
  }
}

- (void)setOperationFinished:(BOOL)a3
{
  if (self->_operationFinished != a3)
  {
    -[LKNotificationListenerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
    self->_operationFinished = a3;
    -[LKNotificationListenerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
  }
}

- (void)setOperationCancelled:(BOOL)a3
{
  if (self->_operationCancelled != a3)
  {
    -[LKNotificationListenerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cancelled"));
    self->_operationCancelled = a3;
    -[LKNotificationListenerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cancelled"));
  }
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2167FC000, log, OS_LOG_TYPE_ERROR, "No listenerStartedBlock is set. This shouldn't happen", v1, 2u);
}

void __40__LKNotificationListenerOperation_start__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v4, "notificationListenerCompletionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationListenerCompletionBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

    }
    v4 = *(void **)(a1 + 32);
  }
  objc_msgSend(v4, "_endOperation");

}

void __40__LKNotificationListenerOperation_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "timeOutPeriod");
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "Notification hasn't posted in the given period (%f seconds). Timing out.", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_errorForNotificationType:", objc_msgSend(*(id *)(a1 + 32), "notificationType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

uint64_t __40__LKNotificationListenerOperation_start__block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2167FC000, v2, OS_LOG_TYPE_DEFAULT, "Notified with %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[LKNotificationListenerOperation isExecuting](self, "isExecuting")
    && -[LKNotificationListenerOperation notifyToken](self, "notifyToken") != -1)
  {
    v3 = (void *)LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[LKNotificationListenerOperation _notificationForNotificationType:](self, "_notificationForNotificationType:", -[LKNotificationListenerOperation notificationType](self, "notificationType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "Cancel listening the notification: %@", buf, 0xCu);

    }
    notify_cancel(-[LKNotificationListenerOperation notifyToken](self, "notifyToken"));
  }
  -[LKNotificationListenerOperation _endOperation](self, "_endOperation");
  v6.receiver = self;
  v6.super_class = (Class)LKNotificationListenerOperation;
  -[LKNotificationListenerOperation cancel](&v6, sel_cancel);
}

- (BOOL)isFinished
{
  return self->_operationFinished;
}

- (BOOL)isExecuting
{
  return self->_operationExecuting;
}

- (BOOL)isCancelled
{
  return self->_operationCancelled;
}

- (void)_endOperation
{
  -[LKNotificationListenerOperation setOperationFinished:](self, "setOperationFinished:", 1);
  -[LKNotificationListenerOperation setOperationExecuting:](self, "setOperationExecuting:", 0);
  -[LKNotificationListenerOperation setListenerStartedBlock:](self, "setListenerStartedBlock:", 0);
}

- (id)_errorForNotificationType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a3)
  {
    v5 = 26;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = 25;
LABEL_5:
    +[LKError errorWithCode:](LKError, "errorWithCode:", v5, v3, v4);
    self = (LKNotificationListenerOperation *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_notificationForNotificationType:(unint64_t)a3
{
  __CFString **v3;

  if (!a3)
  {
    v3 = LKReadyToLoginNotificationName;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = LKLoggedInNotificationName;
LABEL_5:
    self = *v3;
  }
  return self;
}

- (id)listenerStartedBlock
{
  return self->_listenerStartedBlock;
}

- (void)setListenerStartedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (double)timeOutPeriod
{
  return self->_timeOutPeriod;
}

- (void)setTimeOutPeriod:(double)a3
{
  self->_timeOutPeriod = a3;
}

- (id)notificationListenerCompletionBlock
{
  return self->_notificationListenerCompletionBlock;
}

- (void)setNotificationListenerCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (BOOL)operationFinished
{
  return self->_operationFinished;
}

- (BOOL)operationCancelled
{
  return self->_operationCancelled;
}

- (BOOL)operationReady
{
  return self->_operationReady;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationListenerCompletionBlock, 0);
  objc_storeStrong(&self->_listenerStartedBlock, 0);
}

@end
