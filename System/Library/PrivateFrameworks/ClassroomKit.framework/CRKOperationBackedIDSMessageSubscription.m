@implementation CRKOperationBackedIDSMessageSubscription

- (void)dealloc
{
  objc_super v3;

  -[CRKOperationBackedIDSMessageSubscription cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKOperationBackedIDSMessageSubscription;
  -[CRKOperationBackedIDSMessageSubscription dealloc](&v3, sel_dealloc);
}

- (CRKOperationBackedIDSMessageSubscription)initWithListenOperation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  CRKOperationBackedIDSMessageSubscription *v9;
  CRKOperationBackedIDSMessageSubscription *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKOperationBackedIDSMessageSubscription;
  v9 = -[CRKOperationBackedIDSMessageSubscription init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenOperation, a3);
    v11 = MEMORY[0x219A226E8](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOperationBackedIDSMessageSubscription.m"), 41, CFSTR("Expected a hydrated notification user-info"));

    v7 = 0;
  }
  +[CRKIDSMessageNotificationInfo instanceWithDictionary:](CRKIDSMessageNotificationInfo, "instanceWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOperationBackedIDSMessageSubscription handler](self, "handler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "senderAppleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "senderAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *))v9)[2](v9, v10, v11, v12);

}

- (void)cancel
{
  void *v3;
  void *v4;

  -[CRKOperationBackedIDSMessageSubscription handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKOperationBackedIDSMessageSubscription listenOperation](self, "listenOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[CRKOperationBackedIDSMessageSubscription setHandler:](self, "setHandler:", 0);
  }
}

- (CATRemoteTaskOperation)listenOperation
{
  return self->_listenOperation;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_listenOperation, 0);
}

@end
