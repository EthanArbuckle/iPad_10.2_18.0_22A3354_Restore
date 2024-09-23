@implementation HAP2CoAPIO

+ (HAP2Lock)lock
{
  if (lock_onceToken != -1)
    dispatch_once(&lock_onceToken, &__block_literal_global_16043);
  return (HAP2Lock *)(id)lock_lock;
}

+ (NSMutableArray)consumers
{
  void *v2;

  objc_msgSend(a1, "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertOwner");

  return (NSMutableArray *)(id)_consumers;
}

+ (void)setConsumers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOwner");

  v6 = (void *)_consumers;
  _consumers = (uint64_t)v4;

}

+ (HAP2CoAPIOThread)thread
{
  void *v2;

  objc_msgSend(a1, "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertOwner");

  return (HAP2CoAPIOThread *)(id)_thread;
}

+ (void)setThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOwner");

  v6 = (void *)_thread;
  _thread = (uint64_t)v4;

}

+ (BOOL)isRunning
{
  id v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(a1, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__HAP2CoAPIO_isRunning__block_invoke;
  v5[3] = &unk_1E894C458;
  v5[4] = &v6;
  v5[5] = v2;
  objc_msgSend(v3, "performBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

+ (void)registerConsumer:(id)a3
{
  id v4;
  HAP2CoAPIOConsumerWeakHolder *v5;
  void *v6;
  id v7;
  HAP2CoAPIOConsumerWeakHolder *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HAP2CoAPIOConsumerWeakHolder *v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = -[HAP2CoAPIOConsumerWeakHolder initWithConsumer:]([HAP2CoAPIOConsumerWeakHolder alloc], "initWithConsumer:", v4);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16034;
  v24 = __Block_byref_object_dispose__16035;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(a1, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__HAP2CoAPIO_registerConsumer___block_invoke;
  v10[3] = &unk_1E894C4A8;
  v15 = a1;
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v12 = v8;
  v13 = &v20;
  v14 = &v16;
  objc_msgSend(v6, "performBlock:", v10);

  v9 = (void *)v21[5];
  if (v9)
  {
    objc_msgSend(v9, "registerConsumer:", v7);
    if (*((_BYTE *)v17 + 24))
      objc_msgSend((id)v21[5], "start");
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

+ (void)unregisterConsumer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16034;
  v26 = __Block_byref_object_dispose__16035;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__HAP2CoAPIO_unregisterConsumer___block_invoke;
  v8[3] = &unk_1E894C4F8;
  v13 = a1;
  v6 = v4;
  v9 = v6;
  v10 = &v18;
  v11 = &v22;
  v12 = &v14;
  objc_msgSend(v5, "performBlock:", v8);

  v7 = (void *)v23[5];
  if (v7)
  {
    if (*((_BYTE *)v19 + 24))
      objc_msgSend(v7, "unregisterConsumer:", v6);
    if (*((_BYTE *)v15 + 24))
      objc_msgSend((id)v23[5], "cancel");
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

+ (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16034;
  v23 = __Block_byref_object_dispose__16035;
  v24 = 0;
  objc_msgSend(a1, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke;
  v15[3] = &unk_1E894C548;
  v18 = a1;
  v13 = v10;
  v16 = v13;
  v17 = &v19;
  objc_msgSend(v12, "performBlock:", v15);

  v14 = (void *)v20[5];
  if (v14)
    objc_msgSend(v14, "queueSessionBlockForConsumer:sessionBlock:withTimeout:requiresCompletion:", v13, v11, v6, a5);

  _Block_object_dispose(&v19, 8);
}

+ (void)queueSessionCompletionForConsumer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16034;
  v16 = __Block_byref_object_dispose__16035;
  v17 = 0;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke;
  v8[3] = &unk_1E894C548;
  v11 = a1;
  v6 = v4;
  v9 = v6;
  v10 = &v12;
  objc_msgSend(v5, "performBlock:", v8);

  v7 = (void *)v13[5];
  if (v7)
    objc_msgSend(v7, "queueSessionCompletionForConsumer:", v6);

  _Block_object_dispose(&v12, 8);
}

+ (BOOL)setCoapAddressFromString:(id)a3 port:(unsigned __int16)a4 coapAddress:(coap_address_t *)a5
{
  unsigned int v6;
  const char *v7;
  const char *v8;
  __int16 v9;
  _BYTE v11[28];
  uint64_t v12;

  v6 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v7)
  {
    v8 = v7;
    memset(&v11[4], 0, 24);
    *(_WORD *)v11 = 7708;
    v9 = __rev16(v6);
    *(_WORD *)&v11[2] = v9;
    if (inet_pton(30, v7, &v11[8]) == 1)
    {
      if (a5)
      {
        a5->size = v11[0];
        a5->addr.sa = *(sockaddr *)v11;
        *(in6_addr *)((char *)&a5->addr.sin6.sin6_addr + 4) = *(in6_addr *)&v11[12];
        LOBYTE(v7) = 1;
        return (char)v7;
      }
    }
    else
    {
      *(_WORD *)v11 = 528;
      *(_WORD *)&v11[2] = v9;
      *(_DWORD *)&v11[4] = 0;
      *(_QWORD *)&v11[8] = 0;
      LOBYTE(v7) = inet_pton(2, v8, &v11[4]) == 1;
      if (!(_BYTE)v7)
        return (char)v7;
      if (a5)
      {
        a5->addr.sin6.sin6_scope_id = 0;
        *(_QWORD *)&a5->addr.sin6.sin6_addr.__u6_addr32[2] = 0;
        a5->size = v11[0];
        a5->addr.sa = *(sockaddr *)v11;
        return (char)v7;
      }
    }
    __assert_rtn("coap_address_init", "address.c", 72, "addr");
  }
  return (char)v7;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

void __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 48), "consumers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke_2;
  v3[3] = &unk_1E894C520;
  v4 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 32))
  {
    v10 = v6;
    objc_msgSend(*(id *)(a1 + 48), "thread");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    *a4 = 1;
  }

}

void __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 48), "consumers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke_2;
  v3[3] = &unk_1E894C520;
  v4 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 32))
  {
    v10 = v6;
    objc_msgSend(*(id *)(a1 + 48), "thread");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    *a4 = 1;
  }

}

void __33__HAP2CoAPIO_unregisterConsumer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16034;
  v19 = __Block_byref_object_dispose__16035;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 64), "consumers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__HAP2CoAPIO_unregisterConsumer___block_invoke_2;
  v11[3] = &unk_1E894C4D0;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v13 = v4;
  v14 = &v15;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v11);

  if (v16[5])
  {
    objc_msgSend(*(id *)(a1 + 64), "thread");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 64), "consumers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsAtIndexes:", v16[5]);

    objc_msgSend(*(id *)(a1 + 64), "consumers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 64), "setConsumers:", 0);
      objc_msgSend(*(id *)(a1 + 64), "setThread:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __33__HAP2CoAPIO_unregisterConsumer___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "consumer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 != a1[4])
  {
    if (!v5)
      goto LABEL_6;
LABEL_5:
    if (v5 != a1[4])
      goto LABEL_10;
    goto LABEL_6;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (v5)
    goto LABEL_5;
LABEL_6:
  v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v11 = v6;
  if (v7)
  {
    objc_msgSend(v7, "addIndex:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v6 = v11;
LABEL_10:

}

void __31__HAP2CoAPIO_registerConsumer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  objc_msgSend(*(id *)(a1 + 64), "consumers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(*(id *)(a1 + 64), "consumers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __31__HAP2CoAPIO_registerConsumer___block_invoke_2;
    v14[3] = &unk_1E894C480;
    v15 = *(id *)(a1 + 32);
    v16 = &v17;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v14);

    if (*((_BYTE *)v18 + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v4 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "Registering the same consumer twice", v13, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "consumers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 64), "thread");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setConsumers:", v5);

    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 64), "setThread:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __31__HAP2CoAPIO_registerConsumer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __23__HAP2CoAPIO_isRunning__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "thread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2 != 0;

}

void __18__HAP2CoAPIO_lock__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[HAP2Lock lockWithName:](HAP2Lock, "lockWithName:", CFSTR("HAP2CoAPIOThread.lock"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lock_lock;
  lock_lock = v0;

}

- (HAP2CoAPIO)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
