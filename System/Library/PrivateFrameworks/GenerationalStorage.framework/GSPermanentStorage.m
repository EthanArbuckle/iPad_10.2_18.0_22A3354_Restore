@implementation GSPermanentStorage

- (GSDocumentIdentifier)documentID
{
  return self->_documentID;
}

+ (id)storagePrefixForFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = *(_QWORD *)&a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__GSPermanentStorage_storagePrefixForFileDescriptor_error___block_invoke;
  v11[3] = &unk_1E9771C28;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v8, "permanentStoragePrefixForHandle:reply:", v7, v11);
  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v8, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __59__GSPermanentStorage_storagePrefixForFileDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleObjResult:error:", a2, a3);
}

+ (id)storageIDForItemAtURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;

  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);
  if ((v6 & 0x80000000) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("unable to open \"%@\"), v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v14 = *__error();
    gs_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v14, v10);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v7 = v6;
    +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v7, 1);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__GSPermanentStorage_storageIDForItemAtURL_error___block_invoke;
    v17[3] = &unk_1E9771C50;
    v10 = v8;
    v18 = v10;
    objc_msgSend(v10, "permanentStorageIDForHandle:reply:", v9, v17);
    objc_msgSend(v10, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(v10, "error");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

void __50__GSPermanentStorage_storageIDForItemAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleObjResult:error:", 0, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleObjResult:error:", v4, 0);

  }
}

- (GSPermanentStorage)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  _NSMethodExceptionProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@: cannot use -init for initialization"), v5);

  return 0;
}

- (GSPermanentStorage)initWithFileDescriptor:(int)a3 documentID:(id)a4 forItemAtURL:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v11;
  id v12;
  GSPermanentStorage *v13;
  GSPermanentStorage *v14;
  objc_super v16;

  v9 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GSPermanentStorage;
  v13 = -[GSPermanentStorage init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_pubHandle = -1;
    v13->_privHandle = -1;
    objc_storeStrong((id *)&v13->_documentURL, a5);
    objc_storeStrong((id *)&v14->_documentID, a4);
    if (!-[GSPermanentStorage _refreshRemoteIDWithFileDescriptor:error:](v14, "_refreshRemoteIDWithFileDescriptor:error:", v9, a6))
    {

      v14 = 0;
    }
  }

  return v14;
}

- (NSData)pubExtension
{
  GSPermanentStorage *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pubExtension;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPubExtension:(id)a3
{
  id v5;
  GSPermanentStorage *v6;
  uint64_t v7;
  NSObject *v8;
  NSData *pubExtension;
  int v10;
  int *v11;
  char *v12;
  int v13;
  NSData *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((v6->_pubHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v6->_pubHandle = -1;
  }
  objc_storeStrong((id *)&v6->_pubExtension, a3);
  if (v6->_pubExtension)
  {
    -[NSData bytes](v6->_pubExtension, "bytes");
    v7 = sandbox_extension_consume();
    v6->_pubHandle = v7;
    if (v7 < 0)
    {
      gs_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        pubExtension = v6->_pubExtension;
        v10 = *__error();
        v11 = __error();
        v12 = strerror(*v11);
        v13 = 138412802;
        v14 = pubExtension;
        v15 = 1024;
        v16 = v10;
        v17 = 2080;
        v18 = v12;
        _os_log_error_impl(&dword_1D414C000, v8, (os_log_type_t)0x90u, "[ERROR] Failed consuming extension %@; error %d (%s)",
          (uint8_t *)&v13,
          0x1Cu);
      }

    }
  }
  objc_sync_exit(v6);

}

- (NSData)privExtension
{
  GSPermanentStorage *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_privExtension;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPrivExtension:(id)a3
{
  id v5;
  GSPermanentStorage *v6;
  uint64_t v7;
  NSObject *v8;
  NSData *privExtension;
  int v10;
  int *v11;
  char *v12;
  int v13;
  NSData *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((v6->_privHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v6->_privHandle = -1;
  }
  objc_storeStrong((id *)&v6->_privExtension, a3);
  if (v6->_privExtension)
  {
    -[NSData bytes](v6->_privExtension, "bytes");
    v7 = sandbox_extension_consume();
    v6->_privHandle = v7;
    if (v7 < 0)
    {
      gs_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        privExtension = v6->_privExtension;
        v10 = *__error();
        v11 = __error();
        v12 = strerror(*v11);
        v13 = 138412802;
        v14 = privExtension;
        v15 = 1024;
        v16 = v10;
        v17 = 2080;
        v18 = v12;
        _os_log_error_impl(&dword_1D414C000, v8, (os_log_type_t)0x90u, "[ERROR] Failed consuming extension %@; error %d (%s)",
          (uint8_t *)&v13,
          0x1Cu);
      }

    }
  }
  objc_sync_exit(v6);

}

- (BOOL)_refreshRemoteIDWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  GSDocumentIdentifier *documentID;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *, void *);
  void *v19;
  GSPermanentStorage *v20;
  id v21;

  v5 = *(_QWORD *)&a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 0);
  do
  {
    v9 = __ldaxr(&gPermanentStorageCurrentID);
    v10 = v9 + 1;
  }
  while (__stlxr(v9 + 1, &gPermanentStorageCurrentID));
  self->_remoteID = v10;
  documentID = self->_documentID;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __63__GSPermanentStorage__refreshRemoteIDWithFileDescriptor_error___block_invoke;
  v19 = &unk_1E9771C78;
  v20 = self;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v12, "permanentStorageOpenForHandle:withRemoteID:andDocumentID:reply:", v8, v10, documentID, &v16);
  objc_msgSend(v12, "result", v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v12, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
  {
    v14 = self->_remoteID != 0;
  }
  else
  {
    v14 = 0;
    self->_remoteID = 0;
  }

  return v14;
}

void __63__GSPermanentStorage__refreshRemoteIDWithFileDescriptor_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v9 = a4;
  v10 = a5;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(a2, "longLongValue");
    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "setPubExtension:");
    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "setPrivExtension:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "handleBoolResult:error:", a2 != 0, v10);

}

- (int64_t)remoteID
{
  int64_t result;
  GSPermanentStorage *v4;
  uint64_t v5;

  result = self->_remoteID;
  if (!result)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_remoteID)
    {
      v5 = open(-[NSURL fileSystemRepresentation](v4->_documentURL, "fileSystemRepresentation"), 33024);
      if ((v5 & 0x80000000) == 0)
      {
        -[GSPermanentStorage _refreshRemoteIDWithFileDescriptor:error:](v4, "_refreshRemoteIDWithFileDescriptor:error:", v5, 0);
        close(v5);
      }
    }
    objc_sync_exit(v4);

    return self->_remoteID;
  }
  return result;
}

- (void)_connectionWithDaemonWasLost
{
  self->_remoteID = 0;
}

- (void)_invalidate
{
  unint64_t remoteID;
  _QWORD block[5];

  -[GSPermanentStorage setPubExtension:](self, "setPubExtension:", 0);
  -[GSPermanentStorage setPrivExtension:](self, "setPrivExtension:", 0);
  remoteID = self->_remoteID;
  if (remoteID)
  {
    if (_invalidate_onceToken != -1)
      dispatch_once(&_invalidate_onceToken, &__block_literal_global_2);
    self->_remoteID = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__GSPermanentStorage__invalidate__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = remoteID;
    dispatch_async((dispatch_queue_t)_invalidate_invalidationQueue, block);
  }
}

void __33__GSPermanentStorage__invalidate__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.genstore.invalidation-queue", v2);
  v1 = (void *)_invalidate_invalidationQueue;
  _invalidate_invalidationQueue = (uint64_t)v0;

}

void __33__GSPermanentStorage__invalidate__block_invoke_2(uint64_t a1)
{
  id v2;

  GSDaemonProxy(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "permanentStorageClose:", *(_QWORD *)(a1 + 32));

}

- (void)finalize
{
  objc_super v3;

  -[GSPermanentStorage _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GSPermanentStorage;
  -[GSPermanentStorage finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[GSPermanentStorage _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GSPermanentStorage;
  -[GSPermanentStorage dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  GSPermanentStorage *v4;
  BOOL v5;

  v4 = (GSPermanentStorage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[GSDocumentIdentifier isEqual:](self->_documentID, "isEqual:", v4->_documentID);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[GSDocumentIdentifier hash](self->_documentID, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GSPermanentStorage %p { %@ url:%@ }>"), self, self->_documentID, self->_documentURL);
}

- (id)getAdditionDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *, void *);
  void *v17;
  GSPermanentStorage *v18;
  id v19;

  v6 = a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GSPermanentStorage remoteID](self, "remoteID");
  objc_msgSend(v6, "nameSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __50__GSPermanentStorage_getAdditionDictionary_error___block_invoke;
  v17 = &unk_1E9771CC0;
  v18 = self;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v11, "getAdditionInStorage:andNameSpace:named:completionHandler:", v8, v9, v10, &v14);

  objc_msgSend(v11, "result", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v11, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __50__GSPermanentStorage_getAdditionDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setPubExtension:", v9);
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setPrivExtension:", v10);
  objc_msgSend(*(id *)(a1 + 40), "handleObjResult:error:", v12, v11);

}

- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);
  v10 = -[GSPermanentStorage remoteID](self, "remoteID");
  objc_msgSend(v8, "nameSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __53__GSPermanentStorage_setAdditionOptions_value_error___block_invoke;
  v19 = &unk_1E9771CE8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v9, "setAdditionOptionsInStorage:nameSpace:additionName:value:reply:", v10, v11, v12, a4, &v16);

  objc_msgSend(v9, "result", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v9, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __53__GSPermanentStorage_setAdditionOptions_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleBoolResult:error:", a2, v5);

}

- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  v11 = -[GSPermanentStorage remoteID](self, "remoteID");
  objc_msgSend(v8, "nameSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __57__GSPermanentStorage_setAdditionDisplayName_value_error___block_invoke;
  v20 = &unk_1E9771CE8;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v10, "setAdditionDisplayNameInStorage:nameSpace:additionName:value:reply:", v11, v12, v13, v9, &v17);

  objc_msgSend(v10, "result", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v10, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __57__GSPermanentStorage_setAdditionDisplayName_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleBoolResult:error:", a2, v5);

}

- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v6 = a4;
  v8 = a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);
  v10 = -[GSPermanentStorage remoteID](self, "remoteID");
  objc_msgSend(v8, "nameSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __62__GSPermanentStorage_setAdditionConflictResolved_value_error___block_invoke;
  v19 = &unk_1E9771CE8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v9, "setAdditionConflictResolvedInStorage:nameSpace:additionName:value:reply:", v10, v11, v12, v6, &v16);

  objc_msgSend(v9, "result", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v9, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __62__GSPermanentStorage_setAdditionConflictResolved_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleBoolResult:error:", a2, v5);

}

- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  v11 = -[GSPermanentStorage remoteID](self, "remoteID");
  objc_msgSend(v8, "nameSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __55__GSPermanentStorage_setAdditionNameSpace_value_error___block_invoke;
  v19 = &unk_1E9771D10;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v10, "setAdditionNameSpaceInStorage:nameSpace:additionName:value:completionHandler:", v11, v12, v13, v9, &v16);

  objc_msgSend(v10, "result", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v10, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __55__GSPermanentStorage_setAdditionNameSpace_value_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleObjResult:error:", v6, v5);

}

- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[GSPermanentStorage remoteID](self, "remoteID");
    objc_msgSend(v8, "nameSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__GSPermanentStorage_mergeAdditionUserInfo_value_error___block_invoke;
    v19[3] = &unk_1E9771D38;
    v15 = v10;
    v20 = v15;
    objc_msgSend(v15, "mergeAdditionInfoValueInStorage:nameSpace:additionName:value:reply:", v12, v13, v14, v11, v19);

    objc_msgSend(v15, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(v15, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "BOOLValue");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __56__GSPermanentStorage_mergeAdditionUserInfo_value_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBoolResult:error:", a2, a3);
}

- (id)stagingURLforCreatingAdditionWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[GSStagingPrefix stagingPathforCreatingAdditionWithError:](self->_stagingPrefix, "stagingPathforCreatingAdditionWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)URLforReplacingItemWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, self->_documentURL, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cleanupStagingURL:(id)a3
{
  GSStagingPrefix *stagingPrefix;
  id v4;

  stagingPrefix = self->_stagingPrefix;
  objc_msgSend(a3, "path");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GSStagingPrefix cleanupStagingPath:](stagingPrefix, "cleanupStagingPath:", v4);

}

- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  GSStagingPrefix *stagingPrefix;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  std::__fs::filesystem::path *v37;
  char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = v10;
  v13 = v12;
  if (v8)
  {
    v14 = objc_retainAutorelease(v12);
    v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 0);
    if (v15 < 0)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Unable to open %@"), v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *__error();
      gs_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (!a6)
        goto LABEL_19;
      _GSErrorForErrno(v31, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v16 = v15;
    v17 = GSGetDocumentID(v15, 0);
    close(v16);
    if (self->_documentID->documentID == v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add a generation to the forward facing file by moving the forward facing file to be that new generation."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[GSPermanentStorage prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:].cold.2((uint64_t)v18, v19);

      if (!a6)
        goto LABEL_19;
      _GSErrorForStatus(104, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      *a6 = v20;
LABEL_19:

LABEL_32:
      v23 = 0;
      goto LABEL_39;
    }
  }
  stagingPrefix = self->_stagingPrefix;
  objc_msgSend(v13, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stagingPrefix) = -[GSStagingPrefix isStagedPath:](stagingPrefix, "isStagedPath:", v22);

  if ((stagingPrefix & 1) != 0)
  {
    v14 = objc_retainAutorelease(v13);
    v23 = 0;
    if (!GSArchiveTree((char *)objc_msgSend(v14, "fileSystemRepresentation"), 0, 0, a6))
      goto LABEL_39;
    goto LABEL_24;
  }
  -[GSPermanentStorage stagingURLforCreatingAdditionWithError:](self, "stagingURLforCreatingAdditionWithError:", a6);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v11, "objectForKey:", CFSTR("kGSAdditionName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(v13, "lastPathComponent");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v28;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kGSAdditionKeepFileID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v25, "URLByAppendingPathComponent:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation");
    v14 = objc_retainAutorelease(v36);
    if (!GSStageTree(v37, (std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation"), v8, v35, a6))
    {
      v43 = objc_retainAutorelease(v25);
      _RemoveTree((char *)objc_msgSend(v43, "fileSystemRepresentation"), 0, 0);

      goto LABEL_32;
    }

LABEL_24:
    v14 = objc_retainAutorelease(v14);
    v38 = (char *)objc_msgSend(v14, "fileSystemRepresentation");
    GSAdditionComputePOSIXName(v11, self->_documentURL, v14, a6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = v39;
      if (!GSSetOriginalPOSIXName(v38, v39, a6))
      {
        v23 = 0;
        v41 = v40;
        goto LABEL_38;
      }
      GSAdditionComputeDN(v11, self->_documentURL, v14, a6);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41 && GSSetOriginalDisplayName(v38, v41, a6))
      {
        GSAdditionValidateUInfo(v11, a6);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42 && GSSetInfoDictionary(v38, v42, a6))
          v23 = v14;
        else
          v23 = 0;

        goto LABEL_38;
      }
    }
    else
    {
      v41 = 0;
    }
    v23 = 0;
LABEL_38:

    goto LABEL_39;
  }
  v23 = 0;
  v14 = v13;
LABEL_39:

  return v23;
}

- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  void *v17;
  int64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  GSStagingPrefix *stagingPrefix;
  _QWORD v24[5];
  id v25;
  void (**v26)(id, _QWORD, void *);
  _QWORD v27[5];
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = objc_retainAutorelease(v8);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 256);
  if ((v12 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open %@"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *__error();
    gs_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    _GSErrorForErrno(v20, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v22);
    stagingPrefix = self->_stagingPrefix;
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GSStagingPrefix cleanupStagingPath:](stagingPrefix, "cleanupStagingPath:", v13);
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v12, 1);
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke;
    v27[3] = &unk_1E9771D60;
    v15 = v10;
    v29 = v15;
    v27[4] = self;
    v16 = v11;
    v28 = v16;
    GSDaemonProxy(v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[GSPermanentStorage remoteID](self, "remoteID");
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_2;
    v24[3] = &unk_1E9771D88;
    v24[4] = self;
    v26 = v15;
    v25 = v16;
    objc_msgSend(v17, "createAdditionInStorage:stagedFileDescriptor:creationInfo:completionHandler:", v18, v13, v9, v24);

  }
}

void __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  objc_msgSend(v2, "path");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupStagingPath:", v4);

}

void __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setPubExtension:", v9);
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setPrivExtension:", v10);
  if (v16)
    v12 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", *(_QWORD *)(a1 + 32), v16);
  else
    v12 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cleanupStagingPath:", v15);

}

- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v16 = 0;
      goto LABEL_11;
    }
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  GSRestoreAdditionInternal(self->_documentURL, v10, a6);
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v14 != 0;
  if (v14 && self->_documentURL != v14)
    -[GSPermanentStorage setDocumentURL:](self, "setDocumentURL:", v14);

LABEL_11:
  return v16;
}

- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  if (!-[NSURL checkResourceIsReachableAndReturnError:](self->_documentURL, "checkResourceIsReachableAndReturnError:", a6))goto LABEL_11;
  GSReplaceDocumentInternal(self->_documentURL, v10, a6);
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v14 != 0;
  if (v14 && self->_documentURL != v14)
    -[GSPermanentStorage setDocumentURL:](self, "setDocumentURL:", v14);

LABEL_12:
  return v16;
}

- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *, void *);
  void *v18;
  GSPermanentStorage *v19;
  id v20;

  v8 = a4;
  v9 = a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GSPermanentStorage remoteID](self, "remoteID");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __57__GSPermanentStorage_additionWithName_inNameSpace_error___block_invoke;
  v18 = &unk_1E9771CC0;
  v19 = self;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v12, "getAdditionInStorage:andNameSpace:named:completionHandler:", v11, v8, v9, &v15);

  objc_msgSend(v12, "result", v15, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v12, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __57__GSPermanentStorage_additionWithName_inNameSpace_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setPubExtension:", v9);
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setPrivExtension:", v10);
  if (v13)
  {
    v12 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", *(_QWORD *)(a1 + 32), v13);
    objc_msgSend(*(id *)(a1 + 40), "handleObjResult:error:", v12, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "handleObjResult:error:", 0, v11);
  }

}

- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *, void *);
  void *v18;
  GSPermanentStorage *v19;
  id v20;

  v8 = a4;
  v9 = a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GSPermanentStorage remoteID](self, "remoteID");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __59__GSPermanentStorage_additionsWithNames_inNameSpace_error___block_invoke;
  v18 = &unk_1E9771DB0;
  v19 = self;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v12, "getAdditionsInStorage:andNameSpace:named:completionHandler:", v11, v8, v9, &v15);

  objc_msgSend(v12, "result", v15, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v12, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __59__GSPermanentStorage_additionsWithNames_inNameSpace_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setPubExtension:", v10);
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "setPrivExtension:", v11);
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v21 = v11;
      v22 = v10;
      v17 = 0;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        v20 = v17;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v14);
          v17 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));

          objc_msgSend(v13, "addObject:", v17);
          ++v19;
          v20 = v17;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);

      v11 = v21;
      v10 = v22;
    }

    objc_msgSend(*(id *)(a1 + 40), "handleObjResult:error:", v13, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "handleObjResult:error:", 0, v12);
  }

}

- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6
{
  uint64_t v6;
  id v10;
  GSPermanentAdditionEnumerator *v11;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = -[GSPermanentAdditionEnumerator initWithStorage:nameSpace:withOptions:withoutOptions:ordering:]([GSPermanentAdditionEnumerator alloc], "initWithStorage:nameSpace:withOptions:withoutOptions:ordering:", self, v10, a4, a5, v6);

  return v11;
}

- (id)_calculateSpecForAdditionRemoval:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "nameSpace", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKey:", v12, v11);
        }
        objc_msgSend(v10, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_removalErrorDictionaryCreation:(id)a3 withAdditions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "nameSpace");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v14, "persistentIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v18, v19);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    v7 = v21;
  }

  return v8;
}

- (void)removeAdditions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[GSPermanentStorage _calculateSpecForAdditionRemoval:](self, "_calculateSpecForAdditionRemoval:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke;
    v16[3] = &unk_1E9771DD8;
    v10 = v7;
    v17 = v10;
    GSDaemonProxy(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GSPermanentStorage remoteID](self, "remoteID");
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke_2;
    v13[3] = &unk_1E9771E00;
    v15 = v10;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v11, "removeAdditionsInStorage:removalSpec:completionHandler:", v12, v8, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

uint64_t __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = a1[5];
  v4 = a1[6];
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v6, "_removalErrorDictionaryCreation:withAdditions:", a2, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);

}

- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  int64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      v13 = MEMORY[0x1E0C9AA60];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "setObject:forKey:", v13, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke;
  v22[3] = &unk_1E9771DD8;
  v16 = v7;
  v23 = v16;
  GSDaemonProxy(v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GSPermanentStorage remoteID](self, "remoteID");
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke_2;
  v20[3] = &unk_1E9771E28;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v17, "removeAdditionsInStorage:removalSpec:completionHandler:", v18, v8, v20);

}

uint64_t __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)transferToItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v16;

  v6 = objc_retainAutorelease(a3);
  v16 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);
  if (v16 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("opening %@ failed"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *__error();
    gs_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v13, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v8 = 0;
  }
  else
  {
    v7 = fsctl(-[NSURL fileSystemRepresentation](self->_documentURL, "fileSystemRepresentation"), 0x80046820uLL, &v16, 0);
    v8 = v7 == 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fsctl(%@, TRANSFER_DOCUMENT_ID, %@) failed"), self->_documentURL, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *__error();
      gs_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a4)
      {
        _GSErrorForErrno(v10, v9);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[GSPermanentStorage setDocumentURL:](self, "setDocumentURL:", v6);
    }
    close(v16);
  }

  return v8;
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (GSStagingPrefix)stagingPrefix
{
  return self->_stagingPrefix;
}

- (void)setStagingPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_stagingPrefix, a3);
}

- (NSCopying)persistentIdentifier
{
  return (NSCopying *)self->_documentID;
}

- (unint64_t)storageID
{
  return self->_storageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privExtension, 0);
  objc_storeStrong((id *)&self->_pubExtension, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_stagingPrefix, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
}

- (void)prepareAdditionCreationWithItemAtURL:(uint64_t)a1 byMoving:(NSObject *)a2 creationInfo:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 1024;
  v5 = 104;
  _os_log_debug_impl(&dword_1D414C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", (uint8_t *)&v2, 0x12u);
}

@end
