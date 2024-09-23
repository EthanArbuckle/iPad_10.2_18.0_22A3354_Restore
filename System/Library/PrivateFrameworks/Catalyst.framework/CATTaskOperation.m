@implementation CATTaskOperation

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATTaskOperation.m"), 31, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATTaskOperation)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskOperation.m"), 38, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (CATTaskOperation)initWithRequest:(id)a3
{
  id v5;
  CATTaskOperation *v6;
  CATTaskOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATTaskOperation;
  v6 = -[CATOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v5;
  char isKindOfClass;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (a4 && (isKindOfClass & 1) == 0)
  {
    CATErrorWithCodeAndUserInfo(2, &unk_24C1D8E90);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return isKindOfClass & 1;
}

+ (BOOL)isCancelable
{
  return 1;
}

- (void)main
{
  -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (BOOL)canSendNotificationWithName:(id)a3 userInfo:(id)a4
{
  void *v4;
  char v5;

  -[CATTaskOperation request](self, "request", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handlesNotifications");

  return v5;
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[CATTaskOperation canSendNotificationWithName:userInfo:](self, "canSendNotificationWithName:userInfo:", v6, v7))
  {
    -[CATTaskOperation notificationDelegate](self, "notificationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_5:

      goto LABEL_10;
    }
    v9 = -[CATTaskOperation canSendNotificationWithName:userInfo:](self, "canSendNotificationWithName:userInfo:", v6, v7);

    if (v9)
    {
      -[CATTaskOperation notificationDelegate](self, "notificationDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "taskOperation:didPostNotificationWithName:userInfo:", self, v6, v7);
      goto LABEL_5;
    }
  }
  else
  {
    if (_CATLogGeneral_onceToken_13 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_13, &__block_literal_global_19);
    v10 = _CATLogGeneral_logObj_13;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_13, OS_LOG_TYPE_ERROR))
      -[CATRemoteTaskOperation processNotificationWithName:userInfo:].cold.1((uint64_t)self, (uint64_t)v6, v10);
  }
LABEL_10:

}

- (void)processMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[CATTaskOperation request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "handlesNotifications");

    if (v8)
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__CATTaskOperation_processMessage___block_invoke;
      block[3] = &unk_24C1C5CE0;
      objc_copyWeak(&v12, &location);
      v11 = v6;
      v9 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {

    }
  }

}

void __35__CATTaskOperation_processMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, WeakRetained, v4);

  }
}

- (CATTaskRequest)request
{
  return self->_request;
}

- (CATTaskOperationNotificationDelegate)notificationDelegate
{
  return (CATTaskOperationNotificationDelegate *)objc_loadWeakRetained((id *)&self->_notificationDelegate);
}

- (void)setNotificationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_notificationDelegate, a3);
}

- (NSUUID)remoteUUID
{
  return self->_remoteUUID;
}

- (void)setRemoteUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUUID, 0);
  objc_destroyWeak((id *)&self->_notificationDelegate);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)cat_addAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id value;

  if (a3)
  {
    v4 = a3;
    objc_getAssociatedObject(self, "cat_assertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_opt_new();
    value = v7;

    objc_msgSend(value, "addObject:", v4);
    objc_setAssociatedObject(self, "cat_assertions", value, (void *)0x301);

  }
}

- (id)cat_assertions
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(self, "cat_assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

@end
