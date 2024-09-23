@implementation CKSMSComposeQueuingRemoteViewControllerProxy

- (CKSMSComposeQueuingRemoteViewControllerProxy)init
{
  CKSMSComposeQueuingRemoteViewControllerProxy *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  v2 = -[CKSMSComposeQueuingRemoteViewControllerProxy init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSMSComposeQueuingRemoteViewControllerProxy setQueuedInvocations:](v2, "setQueuedInvocations:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CKSMSComposeQueuingRemoteViewControllerProxy setServiceViewControllerProxy:](self, "setServiceViewControllerProxy:", 0);
  -[CKSMSComposeQueuingRemoteViewControllerProxy setQueuedInvocations:](self, "setQueuedInvocations:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  -[CKSMSComposeQueuingRemoteViewControllerProxy dealloc](&v3, sel_dealloc);
}

- (void)setServiceViewControllerProxy:(id)a3
{
  CKSMSCompose *v5;
  CKSMSCompose **p_serviceViewControllerProxy;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (CKSMSCompose *)a3;
  p_serviceViewControllerProxy = &self->_serviceViewControllerProxy;
  if (self->_serviceViewControllerProxy != v5)
  {
    objc_storeStrong((id *)&self->_serviceViewControllerProxy, a3);
    if (*p_serviceViewControllerProxy)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[CKSMSComposeQueuingRemoteViewControllerProxy queuedInvocations](self, "queuedInvocations", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "invokeWithTarget:", *p_serviceViewControllerProxy);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      -[CKSMSComposeQueuingRemoteViewControllerProxy queuedInvocations](self, "queuedInvocations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAllObjects");

    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  objc_method_description MethodDescription;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  -[CKSMSComposeQueuingRemoteViewControllerProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = &unk_1EE1C1838;
    MethodDescription = protocol_getMethodDescription((Protocol *)v5, a3, 1, 1);
    if (MethodDescription.types)
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)forwardInvocation:(id)a3
{
  CKSMSCompose *serviceViewControllerProxy;
  id v5;
  id v6;

  serviceViewControllerProxy = self->_serviceViewControllerProxy;
  v5 = a3;
  v6 = v5;
  if (serviceViewControllerProxy)
  {
    objc_msgSend(v5, "invokeWithTarget:", serviceViewControllerProxy);
  }
  else
  {
    objc_msgSend(v5, "retainArguments");
    -[NSMutableArray addObject:](self->_queuedInvocations, "addObject:", v6);
  }

}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_queuedInvocations, a3);
}

- (CKSMSCompose)serviceViewControllerProxy
{
  return self->_serviceViewControllerProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end
