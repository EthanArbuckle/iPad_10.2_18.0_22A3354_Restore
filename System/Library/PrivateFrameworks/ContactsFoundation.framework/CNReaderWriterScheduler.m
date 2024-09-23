@implementation CNReaderWriterScheduler

uint64_t __57__CNReaderWriterScheduler_performSynchronousWriterBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateWriter:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeWriter:", *(_QWORD *)(a1 + 40));
}

- (void)removeWriter:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingWriters](v4, "pendingWriters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[CNReaderWriterScheduler activeWriters](v4, "activeWriters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  objc_sync_exit(v4);
}

- (void)activateWriter:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingWriters](v4, "pendingWriters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[CNReaderWriterScheduler activeWriters](v4, "activeWriters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(v4);
}

- (NSMutableArray)pendingWriters
{
  return self->_pendingWriters;
}

- (NSMutableArray)activeWriters
{
  return self->_activeWriters;
}

uint64_t __57__CNReaderWriterScheduler_performSynchronousReaderBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateReader:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeReader:", *(_QWORD *)(a1 + 40));
}

- (void)performSynchronousWriterBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReaderWriterScheduler addWriterWithIdentifier:](self, "addWriterWithIdentifier:", v5);
  -[CNReaderWriterScheduler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CNReaderWriterScheduler_performSynchronousWriterBlock___block_invoke;
  block[3] = &unk_1E29B9D10;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_barrier_sync(v6, block);

}

- (void)performSynchronousReaderBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReaderWriterScheduler addReaderWithIdentifier:](self, "addReaderWithIdentifier:", v5);
  -[CNReaderWriterScheduler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CNReaderWriterScheduler_performSynchronousReaderBlock___block_invoke;
  block[3] = &unk_1E29B9D10;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync(v6, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)addReaderWithIdentifier:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingReaders](v4, "pendingReaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)activateReader:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingReaders](v4, "pendingReaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[CNReaderWriterScheduler activeReaders](v4, "activeReaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(v4);
}

- (void)removeReader:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingReaders](v4, "pendingReaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[CNReaderWriterScheduler activeReaders](v4, "activeReaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  objc_sync_exit(v4);
}

- (NSMutableArray)pendingReaders
{
  return self->_pendingReaders;
}

- (NSMutableArray)activeReaders
{
  return self->_activeReaders;
}

- (void)addWriterWithIdentifier:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler pendingWriters](v4, "pendingWriters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (CNReaderWriterScheduler)init
{
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  CNReaderWriterScheduler *v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.contacts.schedulers.serial-reader-writer", v4);

  v6 = -[CNReaderWriterScheduler initWithQueue:](self, "initWithQueue:", v5);
  return v6;
}

- (CNReaderWriterScheduler)initWithQueue:(id)a3
{
  id v5;
  CNReaderWriterScheduler *v6;
  CNReaderWriterScheduler *v7;
  NSMutableArray *v8;
  NSMutableArray *activeReaders;
  NSMutableArray *v10;
  NSMutableArray *pendingReaders;
  NSMutableArray *v12;
  NSMutableArray *activeWriters;
  NSMutableArray *v14;
  NSMutableArray *pendingWriters;
  CNReaderWriterScheduler *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNReaderWriterScheduler;
  v6 = -[CNReaderWriterScheduler init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeReaders = v7->_activeReaders;
    v7->_activeReaders = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingReaders = v7->_pendingReaders;
    v7->_pendingReaders = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeWriters = v7->_activeWriters;
    v7->_activeWriters = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingWriters = v7->_pendingWriters;
    v7->_pendingWriters = v14;

    v16 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReaderWriterScheduler appendDescriptionToBuilder:](self, "appendDescriptionToBuilder:", v3);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)performReaderBlock:(id)a3
{
  id v4;
  CNCancelationToken *v5;
  void *v6;
  NSObject *v7;
  CNCancelationToken *v8;
  id v9;
  id v10;
  CNCancelationToken *v11;
  CNCancelationToken *v12;
  _QWORD v14[5];
  id v15;
  CNCancelationToken *v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(CNCancelationToken);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReaderWriterScheduler addReaderWithIdentifier:](self, "addReaderWithIdentifier:", v6);
  -[CNReaderWriterScheduler queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__CNReaderWriterScheduler_performReaderBlock___block_invoke;
  v14[3] = &unk_1E29B9CE8;
  v14[4] = self;
  v15 = v6;
  v17 = v4;
  v8 = v5;
  v16 = v8;
  v9 = v4;
  v10 = v6;
  dispatch_async(v7, v14);

  v11 = v16;
  v12 = v8;

  return v12;
}

uint64_t __46__CNReaderWriterScheduler_performReaderBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateReader:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeReader:", *(_QWORD *)(a1 + 40));
}

- (id)performWriterBlock:(id)a3
{
  id v4;
  CNCancelationToken *v5;
  void *v6;
  NSObject *v7;
  CNCancelationToken *v8;
  id v9;
  id v10;
  CNCancelationToken *v11;
  CNCancelationToken *v12;
  _QWORD v14[5];
  id v15;
  CNCancelationToken *v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(CNCancelationToken);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReaderWriterScheduler addWriterWithIdentifier:](self, "addWriterWithIdentifier:", v6);
  -[CNReaderWriterScheduler queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__CNReaderWriterScheduler_performWriterBlock___block_invoke;
  v14[3] = &unk_1E29B9CE8;
  v14[4] = self;
  v15 = v6;
  v17 = v4;
  v8 = v5;
  v16 = v8;
  v9 = v4;
  v10 = v6;
  dispatch_barrier_async(v7, v14);

  v11 = v16;
  v12 = v8;

  return v12;
}

uint64_t __46__CNReaderWriterScheduler_performWriterBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateWriter:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeWriter:", *(_QWORD *)(a1 + 40));
}

- (void)suspend
{
  NSObject *v2;
  CNReaderWriterScheduler *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_suspendedCount;
  -[CNReaderWriterScheduler queue](obj, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  objc_sync_exit(obj);
}

- (void)resume
{
  int64_t suspendedCount;
  NSObject *v3;
  id v4;
  CNReaderWriterScheduler *obj;

  obj = self;
  objc_sync_enter(obj);
  suspendedCount = obj->_suspendedCount;
  if (!suspendedCount)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("resuming a non-suspended scheduler"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  obj->_suspendedCount = suspendedCount - 1;
  -[CNReaderWriterScheduler queue](obj, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

  objc_sync_exit(obj);
}

- (void)appendDescriptionToBuilder:(id)a3
{
  CNReaderWriterScheduler *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v18 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNReaderWriterScheduler activeWriters](v4, "activeWriters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    v7 = (id)objc_msgSend(v18, "appendName:unsignedInteger:", CFSTR("active writers"), v6);
  -[CNReaderWriterScheduler pendingWriters](v4, "pendingWriters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    v10 = (id)objc_msgSend(v18, "appendName:unsignedInteger:", CFSTR("pending writers"), v9);
  -[CNReaderWriterScheduler activeReaders](v4, "activeReaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
    v13 = (id)objc_msgSend(v18, "appendName:unsignedInteger:", CFSTR("active readers"), v12);
  -[CNReaderWriterScheduler pendingReaders](v4, "pendingReaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
    v16 = (id)objc_msgSend(v18, "appendName:unsignedInteger:", CFSTR("pending readers"), v15);
  if (v4->_suspendedCount)
    v17 = (id)objc_msgSend(v18, "appendName:integerValue:", CFSTR("suspended"));
  objc_sync_exit(v4);

}

- (BOOL)isSuspended
{
  CNReaderWriterScheduler *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_suspendedCount != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  if (a3)
    -[CNReaderWriterScheduler suspend](self, "suspend");
  else
    -[CNReaderWriterScheduler resume](self, "resume");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWriters, 0);
  objc_storeStrong((id *)&self->_activeWriters, 0);
  objc_storeStrong((id *)&self->_pendingReaders, 0);
  objc_storeStrong((id *)&self->_activeReaders, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
