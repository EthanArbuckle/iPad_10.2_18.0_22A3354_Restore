@implementation CAMBuffer

- (CAMBuffer)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMBuffer;
  v2 = -[CAMBuffer init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.execution-buffer", v3);
    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), CFSTR("bufferQueueIdentification"), CFSTR("bufferQueueIdentification"), 0);
    v6 = *((_QWORD *)v2 + 2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __17__CAMBuffer_init__block_invoke;
    block[3] = &unk_1EA328868;
    v7 = v2;
    v11 = v7;
    dispatch_sync(v6, block);
    v8 = v7;

  }
  return (CAMBuffer *)v2;
}

void __17__CAMBuffer_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v8;

}

- (void)dealloc
{
  NSObject *bufferQueue;
  OS_dispatch_queue *v4;
  objc_super v5;
  _QWORD block[5];

  bufferQueue = self->__bufferQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__CAMBuffer_dealloc__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(bufferQueue, block);
  v4 = self->__bufferQueue;
  self->__bufferQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)CAMBuffer;
  -[CAMBuffer dealloc](&v5, sel_dealloc);
}

void __20__CAMBuffer_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_bufferQueueObservances");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bufferQueueTeardownObservances:", v3);

}

- (BOOL)isEnabled
{
  BOOL v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[CAMBuffer _isBufferQueue](self, "_isBufferQueue"))
  {
    v3 = -[CAMBuffer isBufferQueueEnabled](self, "isBufferQueueEnabled");
    *((_BYTE *)v8 + 24) = v3;
  }
  else
  {
    -[CAMBuffer _bufferQueue](self, "_bufferQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__CAMBuffer_isEnabled__block_invoke;
    v6[3] = &unk_1EA32C0D8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v4, v6);

    v3 = *((_BYTE *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __22__CAMBuffer_isEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBufferQueueEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_bufferQueueFulfillObservancesWithChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMBuffer _bufferQueueObservances](self, "_bufferQueueObservances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "fulfillWithChange:", v4, (_QWORD)v16);
        v13 = objc_msgSend(v12, "isEnabled");
        v14 = objc_msgSend(v12, "isRemovedOnceEnabled");
        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[CAMBuffer _bufferQueueTeardownObservances:](self, "_bufferQueueTeardownObservances:", v6);
}

- (void)_bufferQueueEvaluateObservances
{
  id v3;

  -[CAMBuffer _bufferQueueObservances](self, "_bufferQueueObservances");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_56) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CAMBuffer setBufferQueueEnabled:](self, "setBufferQueueEnabled:", 1);
    -[CAMBuffer _emitBufferedValues](self, "_emitBufferedValues");
  }
  else
  {
    -[CAMBuffer setBufferQueueEnabled:](self, "setBufferQueueEnabled:", 0);
  }

}

uint64_t __44__CAMBuffer__bufferQueueEvaluateObservances__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (objc_msgSend(v5, "isFulfilled"))
  {
    if (objc_msgSend(v5, "isFulfilled"))
      v6 = objc_msgSend(v5, "isEnabled") ^ 1;
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  *a4 = v6;

  return v6;
}

- (void)_bufferQueueFulfillAndEvaluateWithChange:(id)a3
{
  -[CAMBuffer _bufferQueueFulfillObservancesWithChange:](self, "_bufferQueueFulfillObservancesWithChange:", a3);
  -[CAMBuffer _bufferQueueEvaluateObservances](self, "_bufferQueueEvaluateObservances");
}

- (void)reevaluate
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__CAMBuffer_reevaluate__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __23__CAMBuffer_reevaluate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bufferQueueFulfillAndEvaluateWithChange:", 0);
}

- (void)_bufferQueueSetupObservance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setupObservanceForBuffer:", self);
  -[CAMBuffer _bufferQueueObservances](self, "_bufferQueueObservances");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_bufferQueueTeardownObservance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "teardownObservanceForBuffer:", self);
  -[CAMBuffer _bufferQueueObservances](self, "_bufferQueueObservances");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_bufferQueueTeardownObservances:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_teardownObservanceForBuffer_, self);
  -[CAMBuffer _bufferQueueObservances](self, "_bufferQueueObservances");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v4);

}

- (void)disableWhile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CAMBuffer_disableWhile___block_invoke;
  block[3] = &unk_1EA329298;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __26__CAMBuffer_disableWhile___block_invoke(uint64_t a1)
{
  CAMBufferObservance *v2;

  v2 = -[CAMBufferObservance initWithPredicate:removedOnceEnabled:]([CAMBufferObservance alloc], "initWithPredicate:removedOnceEnabled:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueSetupObservance:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueFulfillAndEvaluateWithChange:", 0);

}

- (void)disableWhileKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  CAMBuffer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CAMBuffer_disableWhileKeyPath_ofObject_evaluates___block_invoke;
  block[3] = &unk_1EA32C718;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __52__CAMBuffer_disableWhileKeyPath_ofObject_evaluates___block_invoke(uint64_t a1)
{
  CAMBufferKeyValueObserverObservanceChange *v2;
  CAMBufferKeyValueObserverObservance *v3;

  v3 = -[CAMBufferKeyValueObserverObservance initWithKeyPath:ofObject:withPredicate:removedOnceEnabled:]([CAMBufferKeyValueObserverObservance alloc], "initWithKeyPath:ofObject:withPredicate:removedOnceEnabled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0);
  objc_msgSend(*(id *)(a1 + 48), "_bufferQueueSetupObservance:", v3);
  v2 = -[CAMBufferKeyValueObserverObservanceChange initWithKeyPath:ofObject:withChange:]([CAMBufferKeyValueObserverObservanceChange alloc], "initWithKeyPath:ofObject:withChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 48), "_bufferQueueFulfillAndEvaluateWithChange:", v2);

}

- (void)disableWhileNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  CAMBuffer *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CAMBuffer_disableWhileNotification_fromObject_usingNotificationCenter___block_invoke;
  block[3] = &unk_1EA3290F0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __73__CAMBuffer_disableWhileNotification_fromObject_usingNotificationCenter___block_invoke(uint64_t a1)
{
  CAMBufferNotificationObservance *v2;

  v2 = -[CAMBufferNotificationObservance initWithNotification:object:center:removeOnceEnabled:]([CAMBufferNotificationObservance alloc], "initWithNotification:object:center:removeOnceEnabled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 56), "_bufferQueueSetupObservance:", v2);
  objc_msgSend(*(id *)(a1 + 56), "_bufferQueueEvaluateObservances");

}

- (void)disableUntil:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CAMBuffer_disableUntil___block_invoke;
  block[3] = &unk_1EA329298;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __26__CAMBuffer_disableUntil___block_invoke(uint64_t a1)
{
  CAMBufferObservance *v2;

  v2 = -[CAMBufferObservance initWithPredicate:removedOnceEnabled:]([CAMBufferObservance alloc], "initWithPredicate:removedOnceEnabled:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueSetupObservance:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueFulfillAndEvaluateWithChange:", 0);

}

- (void)disableUntilKeyPath:(id)a3 ofObject:(id)a4 evaluates:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  CAMBuffer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CAMBuffer_disableUntilKeyPath_ofObject_evaluates___block_invoke;
  block[3] = &unk_1EA32C718;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __52__CAMBuffer_disableUntilKeyPath_ofObject_evaluates___block_invoke(uint64_t a1)
{
  CAMBufferKeyValueObserverObservanceChange *v2;
  CAMBufferKeyValueObserverObservance *v3;

  v3 = -[CAMBufferKeyValueObserverObservance initWithKeyPath:ofObject:withPredicate:removedOnceEnabled:]([CAMBufferKeyValueObserverObservance alloc], "initWithKeyPath:ofObject:withPredicate:removedOnceEnabled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
  objc_msgSend(*(id *)(a1 + 48), "_bufferQueueSetupObservance:", v3);
  v2 = -[CAMBufferKeyValueObserverObservanceChange initWithKeyPath:ofObject:withChange:]([CAMBufferKeyValueObserverObservanceChange alloc], "initWithKeyPath:ofObject:withChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 48), "_bufferQueueFulfillAndEvaluateWithChange:", v2);

}

- (void)disableUntilNotification:(id)a3 fromObject:(id)a4 usingNotificationCenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  CAMBuffer *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CAMBuffer_disableUntilNotification_fromObject_usingNotificationCenter___block_invoke;
  block[3] = &unk_1EA3290F0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __73__CAMBuffer_disableUntilNotification_fromObject_usingNotificationCenter___block_invoke(uint64_t a1)
{
  CAMBufferNotificationObservance *v2;

  v2 = -[CAMBufferNotificationObservance initWithNotification:object:center:removeOnceEnabled:]([CAMBufferNotificationObservance alloc], "initWithNotification:object:center:removeOnceEnabled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(a1 + 56), "_bufferQueueSetupObservance:", v2);
  objc_msgSend(*(id *)(a1 + 56), "_bufferQueueEvaluateObservances");

}

- (void)_emitBufferedValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  int v14;
  void (**v15)(_QWORD, _QWORD);
  id obj;
  CAMBuffer *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CAMBuffer _bufferQueueBufferedValues](self, "_bufferQueueBufferedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBuffer _bufferQueueObservers](self, "_bufferQueueObservers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v30;
    v17 = self;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v18)
        objc_enumerationMutation(obj);
      v5 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v4);
      if (!-[CAMBuffer isBufferQueueEnabled](self, "isBufferQueueEnabled"))
        break;
      v22 = v4;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = v20;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v26;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
            v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v12 = _Block_copy(v11);
            objc_getAssociatedObject(v12, (const void *)_shouldEmitValuesOnMainQueueKey);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "BOOLValue");

            if (v14)
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __32__CAMBuffer__emitBufferedValues__block_invoke;
              block[3] = &unk_1EA329298;
              v15 = v11;
              block[4] = v5;
              v24 = v15;
              dispatch_async(MEMORY[0x1E0C80D38], block);

            }
            else
            {
              v11[2](v11, v5);
            }

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v8);
      }

      self = v17;
      -[CAMBuffer setBufferQueueCurrentValue:](v17, "setBufferQueueCurrentValue:", v5);
      objc_msgSend(v21, "addObject:", v5);
      v4 = v22 + 1;
      if (v22 + 1 == v19)
      {
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v19)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(obj, "removeObjectsInArray:", v21);
}

uint64_t __32__CAMBuffer__emitBufferedValues__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)push:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__CAMBuffer_push___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __18__CAMBuffer_push___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "isBufferQueueEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_emitBufferedValues");

}

- (void)replaceWith:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CAMBuffer_replaceWith___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __25__CAMBuffer_replaceWith___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "isBufferQueueEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_emitBufferedValues");

}

- (BOOL)_isBufferQueue
{
  return dispatch_get_specific(CFSTR("bufferQueueIdentification")) == CFSTR("bufferQueueIdentification");
}

- (id)currentValue
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  v13 = __Block_byref_object_dispose__29;
  v14 = 0;
  if (-[CAMBuffer _isBufferQueue](self, "_isBufferQueue"))
  {
    -[CAMBuffer bufferQueueCurrentValue](self, "bufferQueueCurrentValue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v10[5];
    v10[5] = v3;

  }
  else
  {
    -[CAMBuffer _bufferQueue](self, "_bufferQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __25__CAMBuffer_currentValue__block_invoke;
    v8[3] = &unk_1EA32C0D8;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __25__CAMBuffer_currentValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "bufferQueueCurrentValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isBufferEmpty
{
  CAMBuffer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CAMBuffer_isBufferEmpty__block_invoke;
  v5[3] = &unk_1EA32C0D8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __26__CAMBuffer_isBufferEmpty__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") == 0;

}

- (id)firstBufferedValue
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__CAMBuffer_firstBufferedValue__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__CAMBuffer_firstBufferedValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)lastBufferedValue
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__CAMBuffer_lastBufferedValue__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__CAMBuffer_lastBufferedValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)bufferedValues
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__CAMBuffer_bufferedValues__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __27__CAMBuffer_bufferedValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueBufferedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_addObserver:(id)a3 onMainQueue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "copy");
  v11 = _Block_copy(v10);
  v12 = (const void *)_shouldEmitValuesOnMainQueueKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v11, v12, v13, (void *)1);

  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CAMBuffer__addObserver_onMainQueue___block_invoke;
  block[3] = &unk_1EA32E058;
  block[4] = self;
  v22 = v10;
  v15 = v9;
  v21 = v15;
  v16 = v10;
  dispatch_sync(v14, block);

  v17 = v21;
  v18 = v15;

  return v18;
}

void __38__CAMBuffer__addObserver_onMainQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueObservers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

}

- (id)addObserver:(id)a3
{
  return -[CAMBuffer _addObserver:onMainQueue:](self, "_addObserver:onMainQueue:", a3, 0);
}

- (id)addMainQueueObserver:(id)a3
{
  return -[CAMBuffer _addObserver:onMainQueue:](self, "_addObserver:onMainQueue:", a3, 1);
}

- (void)removeObserverForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CAMBuffer_removeObserverForKey___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __34__CAMBuffer_removeObserverForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_bufferQueueObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  CAMBuffer *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CAMBuffer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1EA3290F0;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_sync(v12, block);

}

void __60__CAMBuffer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  CAMBufferKeyValueObserverObservanceChange *v2;

  v2 = -[CAMBufferKeyValueObserverObservanceChange initWithKeyPath:ofObject:withChange:]([CAMBufferKeyValueObserverObservanceChange alloc], "initWithKeyPath:ofObject:withChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_bufferQueueFulfillAndEvaluateWithChange:", v2);

}

- (void)handleObservedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  CAMBuffer *v9;

  v4 = a3;
  -[CAMBuffer _bufferQueue](self, "_bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CAMBuffer_handleObservedNotification___block_invoke;
  block[3] = &unk_1EA328A40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __40__CAMBuffer_handleObservedNotification___block_invoke(uint64_t a1)
{
  CAMBufferNotificationObservanceChange *v2;
  void *v3;
  void *v4;
  CAMBufferNotificationObservanceChange *v5;

  v2 = [CAMBufferNotificationObservanceChange alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMBufferNotificationObservanceChange initWithNotification:object:](v2, "initWithNotification:object:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "_bufferQueueFulfillAndEvaluateWithChange:", v5);
}

+ (id)keyPathsForValuesAffectingEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("bufferQueueEnabled"));
}

+ (id)keyPathsForValuesAffectingCurrentValue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("bufferQueueCurrentValue"));
}

- (OS_dispatch_queue)_bufferQueue
{
  return self->__bufferQueue;
}

- (BOOL)isBufferQueueEnabled
{
  return self->_bufferQueueEnabled;
}

- (void)setBufferQueueEnabled:(BOOL)a3
{
  self->_bufferQueueEnabled = a3;
}

- (NSCopying)bufferQueueCurrentValue
{
  return self->_bufferQueueCurrentValue;
}

- (void)setBufferQueueCurrentValue:(id)a3
{
  objc_storeStrong((id *)&self->_bufferQueueCurrentValue, a3);
}

- (NSMutableArray)_bufferQueueBufferedValues
{
  return self->__bufferQueueBufferedValues;
}

- (NSMutableDictionary)_bufferQueueObservers
{
  return self->__bufferQueueObservers;
}

- (NSMutableArray)_bufferQueueObservances
{
  return self->__bufferQueueObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bufferQueueObservances, 0);
  objc_storeStrong((id *)&self->__bufferQueueObservers, 0);
  objc_storeStrong((id *)&self->__bufferQueueBufferedValues, 0);
  objc_storeStrong((id *)&self->_bufferQueueCurrentValue, 0);
  objc_storeStrong((id *)&self->__bufferQueue, 0);
}

@end
