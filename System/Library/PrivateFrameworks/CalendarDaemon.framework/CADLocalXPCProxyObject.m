@implementation CADLocalXPCProxyObject

- (CADLocalXPCProxyObject)initWithWrappedObject:(id)a3 queue:(id)a4 errorHandler:(id)a5 synchronous:(BOOL)a6 connection:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CADLocalXPCProxyObject *v17;
  CADLocalXPCProxyObject *v18;
  uint64_t v19;
  id errorHandler;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CADLocalXPCProxyObject;
  v17 = -[CADLocalXPCProxyObject init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_wrappedObject, a3);
    objc_storeStrong((id *)&v18->_queue, a4);
    v19 = MEMORY[0x1BCC9D8DC](v15);
    errorHandler = v18->_errorHandler;
    v18->_errorHandler = (id)v19;

    v18->_synchronous = a6;
    objc_storeWeak((id *)&v18->_connection, v16);
  }

  return v18;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CADLocalXPCProxyObject;
  -[CADLocalXPCProxyObject methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(self->_wrappedObject, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v5 = objc_msgSend(WeakRetained, "isValid");

  if ((v5 & 1) != 0)
  {
    if (self->_synchronous)
      -[CADLocalXPCProxyObject _forwardInvocationSynchronously:](self, "_forwardInvocationSynchronously:", v7);
    else
      -[CADLocalXPCProxyObject _forwardInvocationAsynchronously:](self, "_forwardInvocationAsynchronously:", v7);
  }
  else if (self->_errorHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_errorHandler + 2))();

  }
}

- (void)_forwardInvocationSynchronously:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  objc_msgSend(v4, "setTarget:", self->_wrappedObject);
  -[CADLocalXPCProxyObject _fixupArgumentsForInvocation:](self, "_fixupArgumentsForInvocation:", v4);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0D0C370], "replyBlockArgumentIndex:", v4);
  v6 = 0;
  v21 = 0;
  v7 = MEMORY[0x1E0C809B0];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", v4);
    _Block_signature(v9);
    v14 = v7;
    v15 = 3221225472;
    v16 = __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke;
    v17 = &unk_1E6A38468;
    v18 = v9;
    v20 = &v22;
    v6 = v8;
    v19 = v6;
    v21 = (id)__NSMakeSpecialForwardingCaptureBlock();
    objc_msgSend(v4, "setArgument:atIndex:", &v21, v5);

  }
  queue = self->_queue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke_2;
  block[3] = &unk_1E6A373A8;
  v11 = v4;
  v13 = v11;
  dispatch_sync(queue, block);
  if (v6)
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v23[5])
  {
    -[CADLocalXPCProxyObject _fixupArgumentsForInvocation:](self, "_fixupArgumentsForInvocation:");
    objc_msgSend((id)v23[5], "invoke");
  }

  _Block_object_dispose(&v22, 8);
}

void __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "retainArguments");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (void)_forwardInvocationAsynchronously:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  CADLocalXPCProxyObject *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "setTarget:", self->_wrappedObject);
  -[CADLocalXPCProxyObject _fixupArgumentsForInvocation:](self, "_fixupArgumentsForInvocation:", v4);
  v5 = objc_msgSend(MEMORY[0x1E0D0C370], "replyBlockArgumentIndex:", v4);
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", v4);
    _Block_signature(v8);
    v14 = v6;
    v15 = 3221225472;
    v16 = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke;
    v17 = &unk_1E6A376F0;
    v18 = v8;
    v19 = self;
    v9 = v8;
    v20 = (id)__NSMakeSpecialForwardingCaptureBlock();
    objc_msgSend(v4, "setArgument:atIndex:", &v20, v7);

  }
  objc_msgSend(v4, "retainArguments");
  queue = self->_queue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_4;
  v12[3] = &unk_1E6A373A8;
  v13 = v4;
  v11 = v4;
  dispatch_async(queue, v12);

}

void __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "setTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "retainArguments");
  if (_block_invoke_onceToken_0 != -1)
    dispatch_once(&_block_invoke_onceToken_0, &__block_literal_global_28);
  v4 = _block_invoke_asyncQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_3;
  v6[3] = &unk_1E6A37420;
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("XPCReplyQueue", v2);
  v1 = (void *)_block_invoke_asyncQueue;
  _block_invoke_asyncQueue = (uint64_t)v0;

}

uint64_t __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fixupArgumentsForInvocation:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "invoke");
}

uint64_t __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (void)_fixupArgumentsForInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "methodSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfArguments"))
  {
    v6 = 0;
    do
    {
      v7 = objc_retainAutorelease(v5);
      v8 = (const char *)objc_msgSend(v7, "getArgumentTypeAtIndex:", v6);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = objc_msgSend(&unk_1E6A50AE0, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(&unk_1E6A50AE0);
            if (!strcmp(v8, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12)), "UTF8String")))
            {
              v17 = 0;
              objc_msgSend(v4, "getArgument:atIndex:", &v17, v6);
              if (v17)
              {
                -[CADLocalXPCProxyObject _updatedArgumentValueForArgumentValue:](self, "_updatedArgumentValueForArgumentValue:");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v13;
                if (v13)
                {
                  v14 = CFRetain(v13);
                  CFAutorelease(v14);
                  objc_msgSend(v4, "setArgument:atIndex:", &v16, v6);

                }
              }
            }
            ++v12;
          }
          while (v10 != v12);
          v15 = objc_msgSend(&unk_1E6A50AE0, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          v10 = v15;
        }
        while (v15);
      }
      ++v6;
    }
    while (objc_msgSend(v7, "numberOfArguments", v16) != v6);
  }

}

- (id)_updatedArgumentValueForArgumentValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CADLocalXPCProxyObject _replacementArgumentValueForURLWrapper:](self, "_replacementArgumentValueForURLWrapper:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__9;
      v21 = __Block_byref_object_dispose__9;
      v22 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke;
      v14[3] = &unk_1E6A38490;
      v14[4] = self;
      v16 = &v17;
      v7 = v6;
      v15 = v7;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
      v5 = (id)v18[5];
      v8 = v15;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_9;
      }
      v9 = v4;
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__9;
      v21 = __Block_byref_object_dispose__9;
      v22 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke_2;
      v11[3] = &unk_1E6A384B8;
      v11[4] = self;
      v13 = &v17;
      v7 = v9;
      v12 = v7;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
      v5 = (id)v18[5];
      v8 = v12;
    }

    _Block_object_dispose(&v17, 8);
  }
LABEL_9:

  return v5;
}

void __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_updatedArgumentValueForArgumentValue:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
    if (!v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v10, a3);
    v5 = v10;
  }

}

void __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updatedArgumentValueForArgumentValue:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v10);
  }

}

- (id)_replacementArgumentValueForURLWrapper:(id)a3
{
  id v3;
  CADEmulatedSecurityScopedURLWrapper *v4;
  void *v5;
  CADEmulatedSecurityScopedURLWrapper *v6;

  v3 = a3;
  v4 = [CADEmulatedSecurityScopedURLWrapper alloc];
  objc_msgSend(v3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CADEmulatedSecurityScopedURLWrapper initWithOriginalURL:](v4, "initWithOriginalURL:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_wrappedObject, 0);
}

@end
