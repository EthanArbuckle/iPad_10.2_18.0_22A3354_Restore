@implementation _HKCBCentralManagerLoader

- (_HKCBCentralManagerLoader)init
{
  _HKCBCentralManagerLoader *v2;
  _HKCBCentralManagerLoader *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  CBCentralManager *centralManager;
  NSMutableArray *v8;
  NSMutableArray *pendingHandlers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_HKCBCentralManagerLoader;
  v2 = -[_HKCBCentralManagerLoader init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    HKCreateSerialDispatchQueue(v2, CFSTR("queue"));
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97728]), "initWithDelegate:queue:", v3, v3->_queue);
    centralManager = v3->_centralManager;
    v3->_centralManager = (CBCentralManager *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingHandlers = v3->_pendingHandlers;
    v3->_pendingHandlers = v8;

  }
  return v3;
}

- (void)getCentralManagerWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___HKCBCentralManagerLoader_getCentralManagerWithCompletion___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *pendingHandlers;
  NSObject *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  _HKCBCentralManagerLoader *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 5)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogServices;
    if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      pendingHandlers = self->_pendingHandlers;
      v7 = v5;
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2048;
      v21 = -[NSMutableArray count](pendingHandlers, "count");
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "%@ CBCentralManager did become available, %lu pending handlers", buf, 0x16u);

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_pendingHandlers;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_pendingHandlers, "removeAllObjects", (_QWORD)v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end
