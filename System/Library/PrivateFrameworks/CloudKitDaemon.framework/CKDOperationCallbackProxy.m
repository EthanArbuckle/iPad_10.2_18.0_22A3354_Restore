@implementation CKDOperationCallbackProxy

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  CKDOperationCallbackProxy *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  CKDOperationCallbackProxy *v38;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6);
  objc_msgSend_endpoint(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = self;
    objc_sync_enter(v12);
    v15 = objc_msgSend_state(v12, v13, v14);
    if (v15)
    {
      if (v15 == 1)
      {
        voucher_copy_without_importance();
        voucher_adopt();
        objc_msgSend_connection(v12, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x1E0C809B0];
        v34 = 3221225472;
        v35 = sub_1BEB969CC;
        v36 = &unk_1E782EB38;
        v29 = v4;
        v37 = v29;
        v38 = v12;
        objc_msgSend_remoteObjectProxyWithErrorHandler_(v28, v30, (uint64_t)&v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_forwardInvocation_(v31, v32, (uint64_t)v29, v33, v34, v35, v36);

        goto LABEL_10;
      }
      if (v15 != 2)
      {
LABEL_10:
        objc_sync_exit(v12);
        goto LABEL_11;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1000, CFSTR("Not forwarding invocation, proxy has been invalidated"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protocol(v12, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v21, (uint64_t)v17, v20);
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1000, CFSTR("Not forwarding invocation, proxy has not been activated"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protocol(v12, v23, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v25, (uint64_t)v17, v20);
    }

    goto LABEL_10;
  }
  objc_msgSend_protocol(self, v10, v11);
  v12 = (CKDOperationCallbackProxy *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v22, 0, v12);
LABEL_11:

}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  objc_method_description MethodDescription;
  const char *v7;
  void *v8;
  objc_super v10;

  objc_msgSend_protocol(self, a2, (uint64_t)a3);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (!MethodDescription.name
    || (objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v7, (uint64_t)MethodDescription.types),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)CKDOperationCallbackProxy;
    -[CKDOperationCallbackProxy methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (CKDOperationCallbackProxy)init
{
  return (CKDOperationCallbackProxy *)objc_msgSend_initWithEndpoint_(self, a2, 0);
}

- (CKDOperationCallbackProxy)initWithEndpoint:(id)a3
{
  id v5;
  CKDOperationCallbackProxy *v6;
  CKDOperationCallbackProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDOperationCallbackProxy;
  v6 = -[CKDOperationCallbackProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDOperationCallbackProxy;
  -[CKDOperationCallbackProxy dealloc](&v4, sel_dealloc);
}

- (Protocol)protocol
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_endpoint(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_endpoint(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interface(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protocol(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &unk_1EF5B1380;
  }
  return (Protocol *)v13;
}

- (void)activate
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  CKDOperationCallbackProxy *obj;

  objc_msgSend_endpoint(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!objc_msgSend_state(obj, v5, v6))
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3B38]);
      objc_msgSend_endpoint(obj, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endpoint(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend_initWithListenerEndpoint_(v7, v14, (uint64_t)v13);
      objc_msgSend_setConnection_(obj, v16, (uint64_t)v15);

      objc_msgSend_endpoint(obj, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interface(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_connection(obj, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRemoteObjectInterface_(v25, v26, (uint64_t)v22);

      objc_msgSend_connection(obj, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_activate(v29, v30, v31);

      objc_msgSend_setState_(obj, v32, 1);
    }
    objc_sync_exit(obj);

  }
}

- (void)invalidate
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  CKDOperationCallbackProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_state(obj, v2, v3) == 1)
  {
    objc_msgSend_connection(obj, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v6, v7, v8);

    objc_msgSend_setConnection_(obj, v9, 0);
    objc_msgSend_setState_(obj, v10, 2);
  }
  objc_sync_exit(obj);

}

- (void)addBarrierBlock:(id)a3
{
  CKDOperationCallbackProxy *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void (**v12)(void);

  v12 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  v7 = objc_msgSend_state(v4, v5, v6);
  switch(v7)
  {
    case 0:
      goto LABEL_4;
    case 1:
      objc_msgSend_connection(v4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addBarrierBlock_(v10, v11, (uint64_t)v12);

      break;
    case 2:
LABEL_4:
      v12[2]();
      break;
  }
  objc_sync_exit(v4);

}

- (CKOperationCallbackProxyEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
