@implementation AVTDeviceResourceManager

- (AVTDeviceResourceManager)initWithLogger:(id)a3 lockProvider:(id)a4
{
  id v7;
  void (**v8)(id, const char *);
  AVTDeviceResourceManager *v9;
  AVTDeviceResourceManager *v10;
  uint64_t v11;
  OS_dispatch_queue *stateLock;
  uint64_t v13;
  NSMutableArray *consumers;
  objc_super v16;

  v7 = a3;
  v8 = (void (**)(id, const char *))a4;
  v16.receiver = self;
  v16.super_class = (Class)AVTDeviceResourceManager;
  v9 = -[AVTDeviceResourceManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    v8[2](v8, "com.apple.AvatarUI.AVTDeviceResourceManager.stateLock");
    v11 = objc_claimAutoreleasedReturnValue();
    stateLock = v10->_stateLock;
    v10->_stateLock = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    consumers = v10->_consumers;
    v10->_consumers = (NSMutableArray *)v13;

  }
  return v10;
}

- (void)performWorkWithConsumers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTDeviceResourceManager stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVTDeviceResourceManager_performWorkWithConsumers___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __53__AVTDeviceResourceManager_performWorkWithConsumers___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "consumers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)registerConsumer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AVTDeviceResourceManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AVTDeviceResourceManager_registerConsumer___block_invoke;
  v6[3] = &unk_1EA51FEF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AVTDeviceResourceManager performWorkWithConsumers:](self, "performWorkWithConsumers:", v6);

}

void __45__AVTDeviceResourceManager_registerConsumer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "setConsumerDelegate:", v4);
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)unregisterConsumer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVTDeviceResourceManager_unregisterConsumer___block_invoke;
  v6[3] = &unk_1EA51FF18;
  v7 = v4;
  v5 = v4;
  -[AVTDeviceResourceManager performWorkWithConsumers:](self, "performWorkWithConsumers:", v6);

}

void __47__AVTDeviceResourceManager_unregisterConsumer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setConsumerDelegate:", 0);
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)consumer:(id)a3 willConsumeRenderingResourceForEstimatedDuration:(double)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__17;
  v18 = __Block_byref_object_dispose__17;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke;
  v11[3] = &unk_1EA51FF68;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  -[AVTDeviceResourceManager performWorkWithConsumers:](self, "performWorkWithConsumers:", v11);
  v9 = (void *)v15[5];
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_3;
  v10[3] = &__block_descriptor_40_e44_v32__0___AVTDeviceResourceConsumer__8Q16_B24l;
  *(double *)&v10[4] = a4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(&v14, 8);
}

void __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_2;
  v9[3] = &unk_1EA51FF40;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 < objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectsAtIndexes:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

BOOL __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

uint64_t __86__AVTDeviceResourceManager_consumer_willConsumeRenderingResourceForEstimatedDuration___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "releaseRenderingResourceForEstimatedDuration:", *(double *)(a1 + 32));
}

- (NSMutableArray)consumers
{
  return self->_consumers;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end
