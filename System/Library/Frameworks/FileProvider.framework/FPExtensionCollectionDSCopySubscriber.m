@implementation FPExtensionCollectionDSCopySubscriber

- (FPExtensionCollectionDSCopySubscriber)init
{
  FPExtensionCollectionDSCopySubscriber *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dsCopySubscriberQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPExtensionCollectionDSCopySubscriber;
  v2 = -[FPExtensionCollectionDSCopySubscriber init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.progress-queue", v3);
    dsCopySubscriberQueue = v2->_dsCopySubscriberQueue;
    v2->_dsCopySubscriberQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __82__FPExtensionCollectionDSCopySubscriber_startMonitoringWithURL_publishingHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v3 + 8))
    {
      if (*(_BYTE *)(v3 + 25))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(v2, "startAccessingSecurityScopedResource");
        v4 = *(_QWORD *)(a1 + 40);
        if (*(_BYTE *)(v4 + 24))
        {
          objc_storeStrong((id *)(v4 + 16), *(id *)(a1 + 32));
          objc_msgSend(MEMORY[0x1E0CB38A8], "addSubscriberForFileURL:withPublishingHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 48));
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = *(_QWORD *)(a1 + 40);
          v7 = *(void **)(v6 + 8);
          *(_QWORD *)(v6 + 8) = v5;

        }
      }
    }
  }
}

void __55__FPExtensionCollectionDSCopySubscriber_stopMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(*(id *)(v2 + 16), "stopAccessingSecurityScopedResource");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
}

uint64_t __54__FPExtensionCollectionDSCopySubscriber_markObserving__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 25) = 1;
  return result;
}

- (void)stopMonitoring
{
  NSObject *dsCopySubscriberQueue;
  _QWORD block[5];

  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FPExtensionCollectionDSCopySubscriber_stopMonitoring__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(dsCopySubscriberQueue, block);
}

- (void)startMonitoringWithURL:(id)a3 publishingHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dsCopySubscriberQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  FPExtensionCollectionDSCopySubscriber *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__FPExtensionCollectionDSCopySubscriber_startMonitoringWithURL_publishingHandler___block_invoke;
  block[3] = &unk_1E4449B98;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dsCopySubscriberQueue, block);

}

- (void)markObserving
{
  NSObject *dsCopySubscriberQueue;
  _QWORD block[5];

  dsCopySubscriberQueue = self->_dsCopySubscriberQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FPExtensionCollectionDSCopySubscriber_markObserving__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(dsCopySubscriberQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsCopySubscriberQueue, 0);
  objc_storeStrong((id *)&self->_dsCopySubscriberURL, 0);
  objc_storeStrong(&self->_dsCopySubscriber, 0);
}

@end
