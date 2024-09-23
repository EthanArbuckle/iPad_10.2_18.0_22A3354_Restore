@implementation _bmFMDatabasePool

+ (id)databasePoolWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return v5;
}

+ (id)databasePoolWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPath:", v6);
  return v7;
}

+ (id)databasePoolWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:flags:", v6, v4);

  return v7;
}

+ (id)databasePoolWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithPath:flags:", v8, v4);
  return v9;
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  _bmFMDatabasePool *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v9, v5, v8);

  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  id v8;
  id v9;
  _bmFMDatabasePool *v10;
  uint64_t v11;
  NSString *path;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *lockQueue;
  uint64_t v16;
  NSMutableArray *databaseInPool;
  uint64_t v18;
  NSMutableArray *databaseOutPool;
  uint64_t v20;
  NSString *vfsName;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_bmFMDatabasePool;
  v10 = -[_bmFMDatabasePool init](&v23, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v11;

    v13 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fmdb.%@"), v10));
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    lockQueue = v10->_lockQueue;
    v10->_lockQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    databaseInPool = v10->_databaseInPool;
    v10->_databaseInPool = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    databaseOutPool = v10->_databaseOutPool;
    v10->_databaseOutPool = (NSMutableArray *)v18;

    v10->_openFlags = a4;
    v20 = objc_msgSend(v9, "copy");
    vfsName = v10->_vfsName;
    v10->_vfsName = (NSString *)v20;

  }
  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4
{
  return -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, *(_QWORD *)&a4, 0);
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  void *v6;
  _bmFMDatabasePool *v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v6, v4, 0);

  return v7;
}

- (_bmFMDatabasePool)initWithPath:(id)a3
{
  return -[_bmFMDatabasePool initWithPath:flags:](self, "initWithPath:flags:", a3, 6);
}

- (_bmFMDatabasePool)initWithURL:(id)a3
{
  void *v4;
  _bmFMDatabasePool *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_bmFMDatabasePool initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabasePool)init
{
  return -[_bmFMDatabasePool initWithPath:](self, "initWithPath:", 0);
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  OS_dispatch_queue *lockQueue;
  objc_super v4;

  self->_delegate = 0;
  lockQueue = self->_lockQueue;
  if (lockQueue)
  {
    self->_lockQueue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)_bmFMDatabasePool;
  -[_bmFMDatabasePool dealloc](&v4, sel_dealloc);
}

- (void)executeLocked:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_lockQueue, a3);
}

- (void)pushDatabaseBackInPool:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44___bmFMDatabasePool_pushDatabaseBackInPool___block_invoke;
    v6[3] = &unk_1E6649FA8;
    v6[4] = self;
    v7 = v4;
    -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v6);

  }
}

- (id)db
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23___bmFMDatabasePool_db__block_invoke;
  v4[3] = &unk_1E664A0B0;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (unint64_t)countOfCheckedInDatabases
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___bmFMDatabasePool_countOfCheckedInDatabases__block_invoke;
  v4[3] = &unk_1E664A0B0;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfCheckedOutDatabases
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___bmFMDatabasePool_countOfCheckedOutDatabases__block_invoke;
  v4[3] = &unk_1E664A0B0;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfOpenDatabases
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41___bmFMDatabasePool_countOfOpenDatabases__block_invoke;
  v4[3] = &unk_1E664A0B0;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)releaseAllDatabases
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40___bmFMDatabasePool_releaseAllDatabases__block_invoke;
  v2[3] = &unk_1E6649F80;
  v2[4] = self;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v2);
}

- (void)inDatabase:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  -[_bmFMDatabasePool db](self, "db");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v5);
}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  char v9;

  v6 = (void (**)(id, void *, _BYTE *))a4;
  v9 = 0;
  -[_bmFMDatabasePool db](self, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case 2:
      objc_msgSend(v7, "beginImmediateTransaction");
      break;
    case 1:
      objc_msgSend(v7, "beginDeferredTransaction");
      break;
    case 0:
      objc_msgSend(v7, "beginTransaction");
      break;
  }
  v6[2](v6, v8, &v9);
  if (v9)
    objc_msgSend(v8, "rollback");
  else
    objc_msgSend(v8, "commit");
  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v8);

}

- (void)inTransaction:(id)a3
{
  -[_bmFMDatabasePool beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inDeferredTransaction:(id)a3
{
  -[_bmFMDatabasePool beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 1, a3);
}

- (void)inExclusiveTransaction:(id)a3
{
  -[_bmFMDatabasePool beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inImmediateTransaction:(id)a3
{
  -[_bmFMDatabasePool beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 2, a3);
}

- (id)inSavePoint:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  char v18;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = inSavePoint__savePointIdx_0++;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("savePoint%ld"), v6);
  v18 = 0;
  -[_bmFMDatabasePool db](self, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = objc_msgSend(v8, "startSavePointWithName:error:", v7, &v17);
  v10 = v17;
  if (v9)
  {
    v4[2](v4, v8, &v18);
    if (v18)
    {
      v16 = v10;
      objc_msgSend(v8, "rollbackToSavePointWithName:error:", v7, &v16);
      v11 = v16;

      v10 = v11;
    }
    v15 = v10;
    objc_msgSend(v8, "releaseSavePointWithName:error:", v7, &v15);
    v12 = v15;

    v10 = v12;
  }
  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v8);
  v13 = v10;

  return v13;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (unint64_t)maximumNumberOfDatabasesToCreate
{
  return self->_maximumNumberOfDatabasesToCreate;
}

- (void)setMaximumNumberOfDatabasesToCreate:(unint64_t)a3
{
  self->_maximumNumberOfDatabasesToCreate = a3;
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVfsName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfsName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_databaseOutPool, 0);
  objc_storeStrong((id *)&self->_databaseInPool, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end
