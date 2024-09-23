@implementation SKInvocationQueueProxy

- (SKInvocationQueueProxy)initWithProtocol:(id)a3
{
  id v5;
  SKInvocationQueueProxy *v6;
  SKInvocationQueueProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKInvocationQueueProxy;
  v6 = -[SKInvocationQueueProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_protocol, a3);

  return v7;
}

- (void)setInvocationTarget:(id)a3
{
  id v5;
  id *p_invocationTarget;
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
  p_invocationTarget = &self->_invocationTarget;
  if (self->_invocationTarget != v5)
  {
    objc_storeStrong(&self->_invocationTarget, a3);
    if (*p_invocationTarget)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = self->_invocationQueue;
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
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "invokeWithTarget:", *p_invocationTarget, (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

      -[NSMutableArray removeAllObjects](self->_invocationQueue, "removeAllObjects");
    }
  }

}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *invocationQueue;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_invocationTarget)
  {
    objc_msgSend(v4, "invokeWithTarget:");
  }
  else
  {
    if (!self->_invocationQueue)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      invocationQueue = self->_invocationQueue;
      self->_invocationQueue = v5;

      v4 = v7;
    }
    objc_msgSend(v4, "retainArguments");
    -[NSMutableArray addObject:](self->_invocationQueue, "addObject:", v7);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_method_description MethodDescription;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKInvocationQueueProxy;
  -[SKInvocationQueueProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
    if (MethodDescription.types)
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)invocationTarget
{
  return self->_invocationTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_invocationTarget, 0);
  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

@end
