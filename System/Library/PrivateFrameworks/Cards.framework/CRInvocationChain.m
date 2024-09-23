@implementation CRInvocationChain

- (CRInvocationChain)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRInvocationChain;
  v2 = -[CRInvocationChain init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cards.CRInvocationChain.chainedObjectsAccessQueue", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 1), (const void *)_CRInvocationChainRecursiveKey, *((void **)v2 + 1), 0);
  }
  return (CRInvocationChain *)v2;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__CRInvocationChain_forwardInvocation___block_invoke;
  v6[3] = &unk_24DDD9198;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v6);

}

uint64_t __39__CRInvocationChain_forwardInvocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forwardInvocation:", *(_QWORD *)(a1 + 40));
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__CRInvocationChain_respondsToSelector___block_invoke;
  v5[3] = &unk_24DDD91C0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__CRInvocationChain_respondsToSelector___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_respondsToSelector:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__CRInvocationChain_methodSignatureForSelector___block_invoke;
  v5[3] = &unk_24DDD91C0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__CRInvocationChain_methodSignatureForSelector___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_methodSignatureForSelector:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addChainedObject:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__CRInvocationChain_addChainedObject___block_invoke;
  v6[3] = &unk_24DDD9198;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v6);

}

uint64_t __38__CRInvocationChain_addChainedObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addChainedObject:", *(_QWORD *)(a1 + 40));
}

- (void)enumerateChainedObjectsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CRInvocationChain_enumerateChainedObjectsUsingBlock___block_invoke;
  v6[3] = &unk_24DDD91E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v6);

}

uint64_t __55__CRInvocationChain_enumerateChainedObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateChainedObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isEligibleForSelector:(SEL)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CRInvocationChain_isEligibleForSelector___block_invoke;
  v5[3] = &unk_24DDD91C0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[CRInvocationChain _accessChainedObjectsSafely:](self, "_accessChainedObjectsSafely:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__CRInvocationChain_isEligibleForSelector___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isEligibleForSelector:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_accessChainedObjectsSafely:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *specific;
  NSObject *chainedObjectsAccessQueue;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    specific = dispatch_get_specific((const void *)_CRInvocationChainRecursiveKey);
    chainedObjectsAccessQueue = self->_chainedObjectsAccessQueue;
    if (specific == chainedObjectsAccessQueue)
    {
      v4[2](v4);
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x3032000000;
      v14 = __Block_byref_object_copy_;
      v15 = __Block_byref_object_dispose_;
      v16 = 0;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke;
      v8[3] = &unk_24DDD9210;
      v9 = v4;
      v10 = &v11;
      dispatch_sync(chainedObjectsAccessQueue, v8);
      v7 = (void *)v12[5];
      if (v7)
        objc_exception_throw(objc_retainAutorelease(v7));

      _Block_object_dispose(&v11, 8);
    }
  }

}

uint64_t __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSPointerArray)_chainedObjects
{
  NSPointerArray *chainedObjects;
  NSPointerArray *v4;
  NSPointerArray *v5;

  chainedObjects = self->_chainedObjects;
  if (!chainedObjects)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v4 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_chainedObjects;
    self->_chainedObjects = v4;

    chainedObjects = self->_chainedObjects;
  }
  -[NSPointerArray addPointer:](chainedObjects, "addPointer:", 0);
  -[NSPointerArray compact](self->_chainedObjects, "compact");
  return self->_chainedObjects;
}

- (void)_forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRInvocationChain _chainedObjects](self, "_chainedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = CRLogContextCards;
  if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_DEBUG))
    -[CRInvocationChain _forwardInvocation:].cold.2(v6, (uint64_t)v5, v7);
  v19 = v6;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[CRInvocationChain delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "invocationChain:shouldForwardInvocation:toTarget:", self, v4, v13);

        if ((objc_opt_respondsToSelector() & 1) != 0 && v15)
        {
          v18 = CRLogContextCards;
          v17 = (void *)v19;
          if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v19;
            v27 = 2112;
            v28 = v13;
            _os_log_impl(&dword_21AC64000, v18, OS_LOG_TYPE_INFO, "Invoking invocation %@ with target: %@", buf, 0x16u);
          }
          objc_msgSend(v4, "invokeWithTarget:", v13);

          goto LABEL_18;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = CRLogContextCards;
  v17 = (void *)v19;
  if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
    -[CRInvocationChain _forwardInvocation:].cold.1(v19, v16);
  v20.receiver = self;
  v20.super_class = (Class)CRInvocationChain;
  -[CRInvocationChain forwardInvocation:](&v20, sel_forwardInvocation_, v4);
LABEL_18:

}

- (BOOL)_respondsToSelector:(SEL)a3
{
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)CRInvocationChain;
  v5 = -[CRInvocationChain respondsToSelector:](&v16, sel_respondsToSelector_);
  if (-[CRInvocationChain _isEligibleForSelector:](self, "_isEligibleForSelector:", a3))
  {
    -[CRInvocationChain _chainedObjects](self, "_chainedObjects");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v5 = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (id)_methodSignatureForSelector:(SEL)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CRInvocationChain _chainedObjects](self, "_chainedObjects");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "methodSignatureForSelector:", a3);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)CRInvocationChain;
  -[CRInvocationChain methodSignatureForSelector:](&v13, sel_methodSignatureForSelector_, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

- (void)_addChainedObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRInvocationChain _chainedObjects](self, "_chainedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPointer:", v4);

}

- (void)_enumerateChainedObjectsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    -[CRInvocationChain _chainedObjects](self, "_chainedObjects");
    v14 = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (BOOL)_isEligibleForSelector:(SEL)a3
{
  void *v3;
  BOOL v4;

  -[CRInvocationChain _chainedObjects](self, "_chainedObjects", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (CRInvocationChainDelegate)delegate
{
  return (CRInvocationChainDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_setChainedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_chainedObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chainedObjects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chainedObjectsAccessQueue, 0);
}

void __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = objc_begin_catch(a1);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_end_catch();
}

- (void)_forwardInvocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21AC64000, a2, OS_LOG_TYPE_ERROR, "No members of the chain were eligble for invocation %@", (uint8_t *)&v2, 0xCu);
}

- (void)_forwardInvocation:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_21AC64000, log, OS_LOG_TYPE_DEBUG, "Forwarding invocation %@ to candidates: %@", (uint8_t *)&v3, 0x16u);
}

@end
