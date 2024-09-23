@implementation HAP2SerializedOperationQueue

- (void)addBlock:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HAP2SerializedOperationQueue addOperation:](self, "addOperation:", v4);

}

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2SerializedOperationQueue _swapLastOperation:](self, "_swapLastOperation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_msgSend(v6, "dependencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "count") + 1;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);
    if (objc_msgSend(v10, "count"))
    {
      do
      {
        objc_msgSend(v10, "popFirstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v11) & 1) != 0)
        {
          v12 = v7;
        }
        else
        {
          objc_msgSend(v9, "addObject:", v11);
          objc_msgSend(v11, "dependencies");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "count"))
            objc_msgSend(v10, "addObjectsFromArray:", v12);
        }

        v7 = v12;
      }
      while (objc_msgSend(v10, "count"));
    }
    else
    {
      v12 = v7;
    }
    objc_msgSend(v9, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v12;
  }
  else
  {
    location[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", location, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = MEMORY[0x1E0C809B0];
  if (v5 && (objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __45__HAP2SerializedOperationQueue_addOperation___block_invoke;
    v27[3] = &unk_1E894BA40;
    v28 = v5;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v27);

  }
  objc_initWeak(location, v6);
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __45__HAP2SerializedOperationQueue_addOperation___block_invoke_2;
  v25[3] = &unk_1E894E050;
  objc_copyWeak(&v26, location);
  v15 = (void *)MEMORY[0x1D17B7400](v25);
  objc_msgSend(v6, "completionBlock");
  v19 = v14;
  v20 = 3221225472;
  v21 = __45__HAP2SerializedOperationQueue_addOperation___block_invoke_3;
  v22 = &unk_1E894BA68;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v6, "setCompletionBlock:", &v19);
  -[HAP2SerializedOperationQueue queue](self, "queue", v19, v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperations:waitUntilFinished:", v13, 0);

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);

}

void __45__HAP2SerializedOperationQueue_addOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = WeakRetained;
    objc_msgSend(v2, "dependencies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __cleanUpOperationDependencies_block_invoke;
    v6[3] = &unk_1E894BA40;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

    WeakRetained = v5;
  }

}

- (NSOperationQueue)queue
{
  return self->_queue;
}

uint64_t __51__HAP2SerializedOperationQueue__swapLastOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lastOperation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setLastOperation:", *(_QWORD *)(a1 + 40));
}

- (NSOperation)lastOperation
{
  void *v3;

  -[HAP2SerializedOperationQueue lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOwner");

  return (NSOperation *)objc_loadWeakRetained((id *)&self->_lastOperation);
}

- (void)setLastOperation:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  -[HAP2SerializedOperationQueue lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOwner");

  objc_storeWeak((id *)&self->_lastOperation, obj);
}

- (id)_swapLastOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
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
  v15 = __Block_byref_object_copy__12268;
  v16 = __Block_byref_object_dispose__12269;
  v17 = 0;
  -[HAP2SerializedOperationQueue lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HAP2SerializedOperationQueue__swapLastOperation___block_invoke;
  v9[3] = &unk_1E894BD68;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (HAP2Lock)lock
{
  return self->_lock;
}

uint64_t __45__HAP2SerializedOperationQueue_addOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (HAP2SerializedOperationQueue)init
{
  objc_class *v3;
  void *v4;
  HAP2SerializedOperationQueue *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAP2SerializedOperationQueue initWithName:](self, "initWithName:", v4);

  return v5;
}

- (HAP2SerializedOperationQueue)initWithName:(id)a3
{
  id v4;
  void *v5;
  HAP2SerializedOperationQueue *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "commonOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAP2SerializedOperationQueue initWithName:operationQueue:](self, "initWithName:operationQueue:", v4, v5);

  return v6;
}

- (HAP2SerializedOperationQueue)initWithName:(id)a3 operationQueue:(id)a4
{
  id v7;
  id v8;
  HAP2SerializedOperationQueue *v9;
  HAP2SerializedOperationQueue *v10;
  uint64_t v11;
  HAP2Lock *lock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HAP2SerializedOperationQueue;
  v9 = -[HAP2SerializedOperationQueue init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    +[HAP2Lock lockWithName:](HAP2Lock, "lockWithName:", CFSTR("HAP2OperationQueue.lock"));
    v11 = objc_claimAutoreleasedReturnValue();
    lock = v10->_lock;
    v10->_lock = (HAP2Lock *)v11;

    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)addConcurrentOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAP2SerializedOperationQueue queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (void)addConcurrentBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAP2SerializedOperationQueue queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperationWithBlock:", v4);

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_lastOperation);
}

uint64_t __45__HAP2SerializedOperationQueue_addOperation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addDependency:", *(_QWORD *)(a1 + 32));
}

+ (NSOperationQueue)commonOperationQueue
{
  uint64_t v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (commonOperationQueue_onceToken != -1)
    dispatch_once(&commonOperationQueue_onceToken, block);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12268;
  v11 = __Block_byref_object_dispose__12269;
  v12 = 0;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke_3;
  v6[3] = &unk_1E894C458;
  v6[4] = &v7;
  v6[5] = a1;
  objc_msgSend((id)commonOperationQueue_lock, "performBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOperationQueue *)v4;
}

void __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.commonOperationQueueLock"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAP2Lock lockWithName:](HAP2Lock, "lockWithName:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)commonOperationQueue_lock;
  commonOperationQueue_lock = v3;

}

void __52__HAP2SerializedOperationQueue_commonOperationQueue__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained(&commonOperationQueue_weakQueue);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setQualityOfService:", 17);
    v8 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(*(Class *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.CoreHAP.%@.commonOperationQueue"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setName:", v10);

    objc_storeWeak(&commonOperationQueue_weakQueue, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

@end
