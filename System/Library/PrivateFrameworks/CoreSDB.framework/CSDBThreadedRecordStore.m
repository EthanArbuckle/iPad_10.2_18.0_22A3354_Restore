@implementation CSDBThreadedRecordStore

- (BOOL)ownsCurrentThreadOtherwiseAssert:(BOOL)a3
{
  return MEMORY[0x24BEDD108](self->_thread, sel_isCurrentThreadOtherwiseAssert_, a3);
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  _QWORD v8[6];

  if (a3)
  {
    v4 = a4;
    v6 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_20AA59194;
    v8[3] = &unk_24C35A250;
    v8[4] = self;
    v8[5] = v6;
    objc_msgSend_performBlock_waitUntilDone_(self->_thread, v7, (uint64_t)v8, v4);
  }
}

- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11 exclusiveOwnership:(BOOL)a12
{
  NSObject *recordStoreQueue;
  _QWORD block[11];
  int v14;
  unsigned int v15;
  BOOL v16;
  BOOL v17;

  recordStoreQueue = self->_recordStoreQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20AA58CF4;
  block[3] = &unk_24C35A228;
  block[4] = self;
  block[5] = a4;
  v14 = a9;
  v15 = a10;
  block[8] = a6;
  block[9] = a7;
  block[10] = a8;
  v16 = a3;
  block[6] = a11;
  block[7] = a5;
  v17 = a12;
  dispatch_sync(recordStoreQueue, block);
}

- (void)setupDatabaseWithAllowLocalMigration:(BOOL)a3 pathBlock:(id)a4 setupStoreHandler:(void *)a5 connectionInitializer:(void *)a6 versionChecker:(void *)a7 migrationHandler:(void *)a8 schemaVersion:(int)a9 dataProtectionClass:(unsigned int)a10 registerBlock:(id)a11
{
  char v11;

  v11 = 1;
  objc_msgSend_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_exclusiveOwnership_(self, a2, a3, a4, a5, a6, a7, a8, __PAIR64__(a10, a9), a11, v11);
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v6;
  const char *v7;
  _QWORD v8[6];

  if (a3)
  {
    v6 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_20AA6698C;
    v8[3] = &unk_24C35A250;
    v8[4] = self;
    v8[5] = v6;
    objc_msgSend_performBlock_afterDelay_(self->_thread, v7, (uint64_t)v8, a4);
  }
}

- (CSDBThreadedRecordStore)initWithIdentifier:(__CFString *)a3 qosClass:(unsigned __int16)a4 lookAsideConfig:(CSDBLookAsideBufferConfig)a5
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  _CSDBThreadObject *v15;
  const char *v16;
  objc_super v18;

  v5 = *((_DWORD *)&a5 + 2);
  v6 = *(_QWORD *)&a5.lookAsideSlotSize;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDBThreadedRecordStore;
  v10 = -[CSDBThreadedRecordStore init](&v18, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("com.apple.CSDBThreadedRecordStore.recordStoreQueue.%@"), a3);
    v14 = (const char *)objc_msgSend_UTF8String(v11, v12, v13);
    *((_QWORD *)v10 + 2) = dispatch_queue_create(v14, 0);
    *((_QWORD *)v10 + 3) = a3;
    v15 = [_CSDBThreadObject alloc];
    *((_QWORD *)v10 + 4) = objc_msgSend_initWithIdentifier_qosClass_(v15, v16, *((_QWORD *)v10 + 3), v7);
    *((_QWORD *)v10 + 5) = v6;
    *((_DWORD *)v10 + 12) = v5;
  }
  return (CSDBThreadedRecordStore *)v10;
}

- (void)dealloc
{
  uint64_t v2;
  NSObject *recordStoreQueue;
  objc_super v5;

  recordStoreQueue = self->_recordStoreQueue;
  if (recordStoreQueue)
    dispatch_release(recordStoreQueue);
  objc_msgSend__teardownDatabaseOnQueue(self, a2, v2);

  v5.receiver = self;
  v5.super_class = (Class)CSDBThreadedRecordStore;
  -[CSDBThreadedRecordStore dealloc](&v5, sel_dealloc);
}

- (void)_teardownDatabaseOnQueue
{
  CSDBRecordStore *recordStore;

  recordStore = self->_recordStore;
  if (recordStore)
  {
    CSDBRecordStoreDestroy(recordStore);
    self->_recordStore = 0;
  }
}

- (void)teardownDatabase
{
  NSObject *recordStoreQueue;
  _QWORD block[5];

  recordStoreQueue = self->_recordStoreQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20AA6696C;
  block[3] = &unk_24C35A130;
  block[4] = self;
  dispatch_sync(recordStoreQueue, block);
}

- (void)registerClass:(id *)a3
{
  if (self->_wantsRegister)
    CSDBRecordStoreRegisterClass((uint64_t)self->_recordStore, (void *)a3);
}

@end
