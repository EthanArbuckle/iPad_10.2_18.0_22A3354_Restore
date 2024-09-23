@implementation _bmFMDatabaseQueue

+ (id)databaseQueueWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return v5;
}

+ (id)databaseQueueWithURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "databaseQueueWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:flags:", v6, v4);

  return v7;
}

+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "databaseQueueWithPath:flags:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class();
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  _bmFMDatabaseQueue *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v9, v5, v8);

  return v10;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _bmFMDatabaseQueue *v19;
  objc_super v21;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_bmFMDatabaseQueue;
  v11 = -[_bmFMDatabaseQueue init](&v21, sel_init);
  if (v11)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "databaseClass"), "databaseWithPath:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v12;

    if (!objc_msgSend(*((id *)v11 + 2), "openWithFlags:vfs:", v6, v10))
    {
      NSLog(CFSTR("Could not create database queue for path %@"), v9);
      v19 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)v11 + 4, a3);
    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fmdb.%@"), v11));
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    v16 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v15;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 1), &kDispatchQueueSpecificKey, v11, 0);
    *((_DWORD *)v11 + 6) = v6;
    v17 = objc_msgSend(v10, "copy");
    v18 = (void *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = v17;

  }
  v19 = (_bmFMDatabaseQueue *)v11;
LABEL_6:

  return v19;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, *(_QWORD *)&a4, 0);
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  void *v6;
  _bmFMDatabaseQueue *v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v6, v4, 0);

  return v7;
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3
{
  void *v4;
  _bmFMDatabaseQueue *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, 6, 0);
}

- (_bmFMDatabaseQueue)init
{
  return -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", 0);
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)_bmFMDatabaseQueue;
  -[_bmFMDatabaseQueue dealloc](&v4, sel_dealloc);
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27___bmFMDatabaseQueue_close__block_invoke;
  block[3] = &unk_1E6649F80;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)interrupt
{
  id v2;

  -[_bmFMDatabaseQueue database](self, "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interrupt");

}

- (id)database
{
  _bmFMDatabase *db;
  _bmFMDatabase *v4;
  _bmFMDatabase *v5;
  _bmFMDatabase *v6;
  _bmFMDatabase *v7;

  if (-[_bmFMDatabase isOpen](self->_db, "isOpen"))
    goto LABEL_5;
  db = self->_db;
  if (!db)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "databaseClass"), "databaseWithPath:", self->_path);
    v4 = (_bmFMDatabase *)objc_claimAutoreleasedReturnValue();
    v5 = self->_db;
    self->_db = v4;

    db = self->_db;
  }
  if (-[_bmFMDatabase openWithFlags:vfs:](db, "openWithFlags:vfs:", self->_openFlags, self->_vfsName))
  {
LABEL_5:
    v6 = self->_db;
  }
  else
  {
    NSLog(CFSTR("_bmFMDatabaseQueue could not reopen database for path %@"), self->_path);
    v7 = self->_db;
    self->_db = 0;

    v6 = 0;
  }
  return v6;
}

- (void)inDatabase:(id)a3
{
  id v4;
  _bmFMDatabaseQueue *v5;
  NSObject *queue;
  id v7;
  _bmFMDatabaseQueue *v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  dispatch_get_specific(&kDispatchQueueSpecificKey);
  v5 = (_bmFMDatabaseQueue *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    -[_bmFMDatabaseQueue inDatabase:].cold.1();
  queue = self->_queue;
  block[1] = 3221225472;
  block[2] = __33___bmFMDatabaseQueue_inDatabase___block_invoke;
  block[3] = &unk_1E664A0E0;
  block[4] = self;
  v10 = v4;
  v8 = v5;
  block[0] = MEMORY[0x1E0C809B0];
  v7 = v4;
  dispatch_sync(queue, block);

}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___bmFMDatabaseQueue_beginTransaction_withBlock___block_invoke;
  block[3] = &unk_1E664A108;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)inTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inDeferredTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 1, a3);
}

- (void)inExclusiveTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inImmediateTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 2, a3);
}

- (id)inSavePoint:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___bmFMDatabaseQueue_inSavePoint___block_invoke;
  block[3] = &unk_1E664A130;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, a4, 0, 0, a5);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v12;
  NSObject *queue;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  int *v19;
  int *v20;
  id *v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___bmFMDatabaseQueue_checkpoint_name_logFrameCount_checkpointCount_error___block_invoke;
  block[3] = &unk_1E664A158;
  v22 = a3;
  block[4] = self;
  v17 = v12;
  v18 = &v23;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v14 = v12;
  dispatch_sync(queue, block);
  LOBYTE(a6) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVfsName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfsName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)inDatabase:.cold.1()
{
  __assert_rtn("-[_bmFMDatabaseQueue inDatabase:]", "FMDatabaseQueue.m", 185, "currentSyncQueue != self && \"inDatabase: was called reentrantly on the same queue, which would lead to a deadlock\");
}

@end
