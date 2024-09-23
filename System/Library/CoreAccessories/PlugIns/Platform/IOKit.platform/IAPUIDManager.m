@implementation IAPUIDManager

- (IAPUIDManager)init
{
  IAPUIDManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IAPUIDManager;
  v2 = -[IAPUIDManager init](&v4, sel_init);
  if (v2 && init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_1);
  return v2;
}

void __21__IAPUIDManager_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.iap.iapuidmanager.queue", 0);
  v1 = (void *)__iapUIDQueue;
  __iapUIDQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)__iapUIDDictionary;
  __iapUIDDictionary = (uint64_t)v2;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)__iapUIDQueue;
  __iapUIDQueue = 0;

  v4 = (void *)__iapUIDDictionary;
  __iapUIDDictionary = 0;

  v5.receiver = self;
  v5.super_class = (Class)IAPUIDManager;
  -[IAPUIDManager dealloc](&v5, sel_dealloc);
}

+ (id)sharedIAPUIDManager
{
  if (sharedIAPUIDManager_onceToken != -1)
    dispatch_once(&sharedIAPUIDManager_onceToken, &__block_literal_global_4);
  return (id)sharedIAPUIDManager_sharedManagerInstance;
}

void __36__IAPUIDManager_sharedIAPUIDManager__block_invoke()
{
  IAPUIDManager *v0;
  void *v1;

  v0 = objc_alloc_init(IAPUIDManager);
  v1 = (void *)sharedIAPUIDManager_sharedManagerInstance;
  sharedIAPUIDManager_sharedManagerInstance = (uint64_t)v0;

}

- (unint64_t)iapUID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  unint64_t v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  v4 = __iapUIDQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__IAPUIDManager_iapUID___block_invoke;
  block[3] = &unk_24D70BBF8;
  v9 = v3;
  v5 = v3;
  dispatch_sync(v4, block);
  v6 = __iapUIDCounter;

  return v6;
}

void __24__IAPUIDManager_iapUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if ((unint64_t)(__iapUIDCounter + 1) > 1)
    v2 = __iapUIDCounter + 1;
  else
    v2 = 1;
  __iapUIDCounter = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__iapUIDDictionary, "setObject:forKey:", *(_QWORD *)(a1 + 32), v3);

}

- (BOOL)removeIAPUID:(unint64_t)a3
{
  char v3;
  _QWORD v5[6];
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
  v5[2] = __30__IAPUIDManager_removeIAPUID___block_invoke;
  v5[3] = &unk_24D70C430;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__IAPUIDManager_removeIAPUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__iapUIDDictionary, "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend((id)__iapUIDDictionary, "removeObjectForKey:", v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (BOOL)isIAPUIDPresent:(unint64_t)a3
{
  char v3;
  _QWORD v5[6];
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
  v5[2] = __33__IAPUIDManager_isIAPUIDPresent___block_invoke;
  v5[3] = &unk_24D70C430;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__IAPUIDManager_isIAPUIDPresent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__iapUIDDictionary, "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (id)objectForIAPUID:(unint64_t)a3
{
  id v3;
  _QWORD v5[6];
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
  v5[2] = __33__IAPUIDManager_objectForIAPUID___block_invoke;
  v5[3] = &unk_24D70C430;
  v5[4] = &v6;
  v5[5] = a3;
  dispatch_sync((dispatch_queue_t)__iapUIDQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__IAPUIDManager_objectForIAPUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__iapUIDDictionary, "objectForKey:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
