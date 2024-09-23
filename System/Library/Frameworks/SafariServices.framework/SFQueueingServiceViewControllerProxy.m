@implementation SFQueueingServiceViewControllerProxy

- (SFQueueingServiceViewControllerProxy)initWithProtocol:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *queuedInvocations;

  objc_storeStrong((id *)&self->_protocol, a3);
  v5 = a3;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  queuedInvocations = self->_queuedInvocations;
  self->_queuedInvocations = v6;

  return self;
}

- (void)setTarget:(id)a3
{
  id v5;
  id *p_target;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_target = &self->_target;
  if (self->_target != v5)
  {
    objc_storeStrong(&self->_target, a3);
    if (*p_target)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = self->_queuedInvocations;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "invokeWithTarget:", *p_target, (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

      -[NSMutableArray removeAllObjects](self->_queuedInvocations, "removeAllObjects");
    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v4;
  objc_method_description MethodDescription;
  void *v6;

  v4 = self->_protocol;
  MethodDescription = protocol_getMethodDescription(v4, a3, 1, 1);
  if (MethodDescription.types)
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  int v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "methodSignature");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (unsigned __int8 *)objc_msgSend(v4, "methodReturnType");
  do
  {
    if (!v5)
    {

      goto LABEL_8;
    }
    v6 = *v5++;
  }
  while (v6 != 118);

  if (self->_target)
  {
    objc_msgSend(v8, "invokeWithTarget:");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "serviceProxyWillQueueInvocation:", self);

    objc_msgSend(v8, "retainArguments");
    -[NSMutableArray addObject:](self->_queuedInvocations, "addObject:", v8);
  }
LABEL_8:

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)target
{
  return self->_target;
}

- (SFQueueingServiceViewControllerProxyDelegate)delegate
{
  return (SFQueueingServiceViewControllerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end
