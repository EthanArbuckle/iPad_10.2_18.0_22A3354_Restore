@implementation HDHFDataStore

- (id)_writeaheadLogURLForHFDAtURL:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "URLByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("hfd-wal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_moveFileOnlyIfDestinationEmptyFromURL:(void *)a3 toURL:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v21;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "fileExistsAtPath:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v21 = 0;
      v15 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v7, v11, &v21);
      v16 = v21;
      v17 = v16;
      if ((v15 & 1) != 0 || (objc_msgSend(v16, "hk_isCocoaNoSuchFileError") & 1) != 0)
      {
        v14 = 1;
      }
      else
      {
        v18 = v17;
        v19 = v18;
        if (v18)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v18);
          else
            _HKLogDroppedError();
        }

        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)_deleteFileAtURL:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v13);
    v8 = v13;

    if ((v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v10 = v8;
      v11 = v10;
      if (v10)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unique_ptr<health::DataStore,)dataStoreAtURL:(id)a3 filesystem:(const void *)a4 allowCheckpoint:(BOOL)a5 error:(id *)a6
{
  _QWORD *v6;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  health::TransactionalFile *v14;
  unique_ptr<health::DataStore, std::default_delete<health::DataStore>> v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  const void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  health::TransactionalFile *(*v25)(uint64_t);
  uint64_t v26;
  health::TransactionalFile *v27;

  v10 = v6;
  v11 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3812000000;
  v24 = __Block_byref_object_copy__103;
  v25 = __Block_byref_object_dispose__103;
  v26 = 0;
  v27 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HDHFDataStore_HFDMigrationSupport__dataStoreAtURL_filesystem_allowCheckpoint_error___block_invoke;
  v16[3] = &unk_1E6CFA5B0;
  v20 = a5;
  v18 = &v21;
  v12 = v11;
  v17 = v12;
  v19 = a4;
  hfd_catchExceptionsAsErrors(v16, (uint64_t)a6, 0);
  v13 = v22[6];
  v22[6] = 0;
  *v10 = v13;

  _Block_object_dispose(&v21, 8);
  v14 = v27;
  v27 = 0;
  if (v14)
  {
    health::TransactionalFile::~TransactionalFile(v14);
    MEMORY[0x1BCCAC494]();
  }

  return v15;
}

BOOL __86__HDHFDataStore_HFDMigrationSupport__dataStoreAtURL_filesystem_allowCheckpoint_error___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  char *v3;
  _QWORD *v4;
  health::TransactionalFile *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[2];
  void *__p[2];
  char v14;

  v2 = *(_BYTE *)(a1 + 56) == 0;
  v3 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v4 = *(_QWORD **)(a1 + 48);
  v5 = (health::TransactionalFile *)operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, v3);
  v6 = (std::__shared_weak_count *)v4[1];
  v12[0] = *v4;
  v12[1] = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  health::DataStore::DataStore((uint64_t)v5, (__int128 *)__p, v12, 2 * v2);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (v14 < 0)
    operator delete(__p[0]);
  std::unique_ptr<health::DataStore>::reset[abi:ne180100]((health::TransactionalFile **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v5);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) != 0;
}

- (BOOL)moveHFDAsideWithoutOverwritingFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((-[HDHFDataStore _moveFileOnlyIfDestinationEmptyFromURL:toURL:error:](self, v8, v9, a5) & 1) != 0)
  {
    -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HDHFDataStore _moveFileOnlyIfDestinationEmptyFromURL:toURL:error:](self, v11, v10, a5);
    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v17 = *a5;
        v18 = 138543362;
        v19 = v17;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Failed to move production HFD WAL aside (%{public}@)", (uint8_t *)&v18, 0xCu);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v16 = *a5;
      v18 = 138543362;
      v19 = v16;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to move production HFD aside (%{public}@)", (uint8_t *)&v18, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)deleteHFDAt:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[HDHFDataStore _deleteFileAtURL:error:](self, v6, a4) & 1) != 0)
  {
    -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HDHFDataStore _deleteFileAtURL:error:](self, v7, a4);
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v13 = *a4;
        v14 = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v13;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Failed to delete HFD WAL at '%{public}@' (%{public}@)", (uint8_t *)&v14, 0x16u);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v12 = *a4;
      v14 = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v12;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to delete HFD at '%{public}@' (%{public}@)", (uint8_t *)&v14, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (HDHFDataStore)initWithPath:(id)a3
{
  HDHFDataStore *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v8 = 0;
  v9 = 0;
  v3 = -[HDHFDataStore initWithPath:fileSystem:](self, "initWithPath:fileSystem:", a3, &v8);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return v3;
}

- (HDHFDataStore)initWithPath:(id)a3 fileSystem:(shared_ptr<health::VirtualFilesystem>)a4
{
  VirtualFilesystem *ptr;
  id v7;
  HDHFDataStore *v8;
  HDHFDataStore *v9;
  HDHFDataStore *v10;
  uint64_t v11;
  VirtualFilesystem *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  OS_dispatch_queue *openQueue;
  __int128 v24;
  objc_super v25;

  ptr = a4.__ptr_;
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDHFDataStore;
  v8 = -[HDHFDataStore init](&v25, sel_init);
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileSystemPath, a3);
    v12 = *(VirtualFilesystem **)ptr;
    v11 = *((_QWORD *)ptr + 1);
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    cntrl = (std::__shared_weak_count *)v10->_fileSystem.__cntrl_;
    v10->_fileSystem.__ptr_ = v12;
    v10->_fileSystem.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v10->_lock._os_unfair_lock_opaque = 0;
    v24 = 0uLL;
    std::shared_ptr<health::VirtualFile>::operator=[abi:ne180100]((uint64_t)&v9->_highFrequencyDataStore, &v24);
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    openQueue = v10->_openQueue;
    v10->_openQueue = (OS_dispatch_queue *)v21;

  }
  return v10;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v5;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHFDataStore.mm"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("atomic_load(&_invalidated)"));

  }
  v6.receiver = self;
  v6.super_class = (Class)HDHFDataStore;
  -[HDHFDataStore dealloc](&v6, sel_dealloc);
}

- (BOOL)isOpen
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_hasOpenStore);
  return v2 & 1;
}

- (id)_walPathForHFDAtPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("hfd-wal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  unsigned __int8 v14;
  const char *v15;
  void *v16;

  if (self->_highFrequencyDataStore.__ptr_)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = atomic_load((unsigned __int8 *)&self->_invalidated);
    if ((v7 & 1) != 0)
      v8 = "INVALIDATED";
    else
      v8 = "";
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %s OPEN>"), v5, self, self->_fileSystemPath, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = atomic_load((unsigned __int8 *)&self->_hasOpenStore);
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13;
    v14 = atomic_load((unsigned __int8 *)&self->_invalidated);
    if ((v14 & 1) != 0)
      v15 = "INVALIDATED";
    else
      v15 = "";
    if ((v10 & 1) != 0)
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p %@ %s PENDING DISCARD>"), v13, self, self->_fileSystemPath, v15);
    else
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%p %@ %s closed>"), v13, self, self->_fileSystemPath, v15);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v9;

  return v16;
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSNumber *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  NSNumber *v31;
  NSNumber *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSNumber *v38;
  NSNumber *v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v37 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v37, "setDateStyle:", 2);
  objc_msgSend(v37, "setTimeStyle:", 0);
  -[HDHFDataStore fileSystemPath](self, "fileSystemPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHFDataStore fileManager](self, "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v36 = v4;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v43;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
    v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "hk_isCocoaNoSuchFileError"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v39 = 0;
  }
  -[HDHFDataStore _walPathForHFDAtPath:]((uint64_t)self, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v7;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v9, &v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v42;

  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "hk_isCocoaNoSuchFileError"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  sizeStringForNumber(v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v37, "stringFromDate:", v8);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("<unknown>");
  }
  sizeStringForNumber(v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\nHFD size: %@ (created %@; WAL size %@; rebuild state %ld)"),
    v13,
    v14,
    v15,
    -[HDHFDataStore rebuildState](self, "rebuildState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  if (-[HDHFDataStore rebuildState](self, "rebuildState") >= 2
    && -[HDHFDataStore rebuildState](self, "rebuildState") < 6)
  {
    objc_msgSend(v35, "stringByAppendingPathComponent:", CFSTR("healthdb_archive.hfd"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHFDataStore _walPathForHFDAtPath:]((uint64_t)self, v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v11;
    objc_msgSend(v36, "attributesOfItemAtPath:error:", v18, &v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v41;

    if (v19)
    {
      v21 = v33;
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
      v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v33;
      if (objc_msgSend(v20, "hk_isCocoaNoSuchFileError"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
        v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }
    }
    if ((objc_msgSend(v36, "fileExistsAtPath:", v21) & 1) == 0)
    {
      objc_msgSend(v35, "stringByAppendingPathComponent:", CFSTR("healthdb_archive.hfd.tgz"));
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v22;
    }
    v40 = v20;
    objc_msgSend(v36, "attributesOfItemAtPath:error:", v21, &v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    v11 = v40;

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
      v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v11, "hk_isCocoaNoSuchFileError"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    v31 = v23;
    sizeStringForNumber(v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v37, "stringFromDate:", v24);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = CFSTR("<unknown>");
    }
    sizeStringForNumber(v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("\nHFD archive size: %@ (created %@; WAL size %@)"), v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    objc_msgSend(v16, "stringByAppendingString:", v29);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v16;
  }

  return v17;
}

- (void)flushForInvalidation:(BOOL)a3
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  HDHFDataStore *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x4012000000;
  v11 = __Block_byref_object_copy__155;
  v12 = __Block_byref_object_dispose__155;
  v14 = 0;
  v15 = 0;
  v13 = &unk_1B805FAAD;
  HKWithUnfairLock();
  if (v9[6])
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Closing store", buf, 0xCu);
    }
    atomic_store(0, (unsigned __int8 *)&self->_hasOpenStore);
    _HDHFDataStoreWillCloseStore(self);
    health::TransactionalFile::invalidate((health::TransactionalFile *)v9[6]);
  }
  _Block_object_dispose(&v8, 8);
  v5 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void __38__HDHFDataStore_flushForInvalidation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(v7) = 138543362;
    *(_QWORD *)((char *)&v7 + 4) = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarding store and preparing for flush.", (uint8_t *)&v7, 0xCu);
  }
  std::shared_ptr<health::DataStore>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v7 = 0uLL;
  std::shared_ptr<health::VirtualFile>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 32, &v7);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

- (BOOL)discardStoreWithError:(id *)a3
{
  BOOL v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__239;
  v16 = __Block_byref_object_dispose__240;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  HKWithUnfairLock();
  if (*((_BYTE *)v9 + 24))
  {
    v4 = 1;
  }
  else
  {
    v5 = (id)v13[5];
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

    v4 = *((_BYTE *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v4;
}

void __39__HDHFDataStore_discardStoreWithError___block_invoke(_QWORD *a1)
{
  HDHFDataStore *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id obj;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (HDHFDataStore *)a1[4];
  if (v2->_highFrequencyDataStore.__ptr_)
  {
    _HDHFDataStoreWillCloseStore(v2);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    std::shared_ptr<health::VirtualFile>::operator=[abi:ne180100](a1[4] + 32, (__int128 *)buf);
    v3 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v4 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    atomic_store(0, (unsigned __int8 *)(a1[4] + 49));
    v2 = (HDHFDataStore *)a1[4];
  }
  -[HDHFDataStore fileManager](v2, "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[4] + 88);
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) != 0 || (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 88), "stringByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("hfd-wal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1[5] + 8);
    v18 = *(id *)(v12 + 40);
    v13 = objc_msgSend(v6, "removeItemAtPath:error:", v11, &v18);
    objc_storeStrong((id *)(v12 + 40), v18);
    if ((v13 & 1) != 0
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "hk_isCocoaNoSuchFileError") & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v17;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Unable to delete HFD writeahead log (%{public}@)", buf, 0xCu);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Unable to delete HFD (%{public}@)", buf, 0xCu);
    }
  }

}

- (BOOL)_createNewStore:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  id v12;

  -[HDHFDataStore flushForInvalidation:](self, "flushForInvalidation:", 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_fileSystemPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = -[HDHFDataStore deleteHFDAt:error:](self, "deleteHFDAt:error:", v5, &v12);
  v7 = v12;

  if (v6 || objc_msgSend(v7, "hk_isCocoaNoSuchFileError"))
  {
    -[HDHFDataStore setRebuildState:]((uint64_t)self, 100);
    v8 = 1;
  }
  else
  {
    v9 = v7;
    v10 = v9;
    if (v9)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v8 = 0;
  }

  return v8;
}

- (void)setRebuildState:(uint64_t)a1
{
  NSObject *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = a1;
      v8 = 2048;
      v9 = a2;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated rebuild state: %ld", (uint8_t *)&v6, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "HFDataStore:setInteger:forKey:", a1, a2, CFSTR("HKHFDRebuildStage"));

  }
}

void __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke(uint64_t a1)
{
  double Current;
  id *v3;
  uint64_t v4;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  CFAbsoluteTime v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  CFAbsoluteTime v16;
  _QWORD v17[6];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(id **)(a1 + 32);
  v18 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke_2;
  v17[3] = &unk_1E6CF43D0;
  v4 = *(_QWORD *)(a1 + 48);
  v17[4] = v3;
  v17[5] = v4;
  v5 = -[HDHFDataStore _convertExceptionsToError:inBlock:](v3, &v18, v17);
  v6 = v18;
  if (v5)
  {
    _HKInitializeLogging();
    v7 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 64);
      v10 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      v23 = 2048;
      v24 = v10 - Current;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished constructing data store (%ld) in %0.3lfs", buf, 0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 64);
      v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      v20 = v14;
      v21 = 2048;
      v22 = v15;
      v23 = 2048;
      v24 = v16 - Current;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to construct data store (%ld) in %0.3lfs", buf, 0x20u);
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v6;
    v7 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke_2(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v14[2];
  void *__p[2];
  char v16;

  v2 = (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "UTF8String");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = operator new(0x388uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1E6D02348;
  std::string::basic_string[abi:ne180100]<0>(__p, v2);
  v5 = *(std::__shared_weak_count **)(v3 + 16);
  v14[0] = *(_QWORD *)(v3 + 8);
  v14[1] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  health::DataStore::DataStore((uint64_t)(v4 + 3), (__int128 *)__p, v14, 0);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v16 < 0)
    operator delete(__p[0]);
  __p[0] = v4 + 3;
  __p[1] = v4;
  std::shared_ptr<health::VirtualFile>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, (__int128 *)__p);
  v10 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v11 = (unint64_t *)((char *)__p[1] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return 1;
}

- (uint64_t)_convertExceptionsToError:(void *)a3 inBlock:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  id v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_20;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __51__HDHFDataStore__convertExceptionsToError_inBlock___block_invoke;
  v31[3] = &unk_1E6D02148;
  v32 = v5;
  v30 = 0;
  v7 = hfd_catchExceptionsAsErrors(v31, (uint64_t)&v30, 0);
  v8 = v30;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    v10 = v8;
    v11 = v10;
    if (v10)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    objc_msgSend(v11, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v11))
      goto LABEL_16;
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("HKDatabaseFailureTypeKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v27, "intValue");
    objc_msgSend(v29, "objectForKey:", CFSTR("HKDatabaseSuberrorKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v28 = objc_msgSend(v13, "intValue");
    else
      v28 = 0;
    objc_msgSend(v29, "objectForKey:", CFSTR("HKDatabaseRecommendsPromptingUserKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v15, "BOOLValue");

    v16 = objc_msgSend(a1, "rebuildState");
    objc_opt_self();
    if ((unint64_t)v12 <= 0xB)
    {
      if (((1 << v12) & 0xBC4) != 0)
      {
LABEL_15:
        v17 = objc_msgSend(a1, "rebuildState");
        WeakRetained = objc_loadWeakRetained(a1 + 10);
        objc_msgSend(WeakRetained, "HFDataStore:detectedCorruptionOfType:code:error:shouldPromptUser:initialRebuildState:updatedRebuildState:", a1, v12, v28, v11, v26, v16, v17);

LABEL_16:
        v19 = v11;
        objc_opt_self();
        objc_msgSend(v19, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HKDatabaseErrorIsOutOfSpaceKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
        {
          v23 = objc_loadWeakRetained(a1 + 10);
          objc_msgSend(v23, "HFDataStoreDetectedOutOfSpace:", a1);

        }
        goto LABEL_19;
      }
      if (((1 << v12) & 0x3A) != 0)
      {
LABEL_14:
        -[HDHFDataStore _requestHFDRebuild](a1);
        goto LABEL_15;
      }
      if (v12 == 10)
      {
        if (v28 != 27 && v28 != 22)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    if (v12 != 100)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v34 = v12;
        v35 = 1024;
        v36 = v28;
        _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Unexpected failure type when considering rebuild request: %ld (%d)", buf, 0x12u);
      }
    }
    goto LABEL_15;
  }
LABEL_19:

LABEL_20:
  return v7;
}

void __50__HDHFDataStore__highFrequencyDataStoreWithError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  id v9;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  HDHFDataStore *v16;
  char active;
  int64_t openAttempt;
  os_log_t *v19;
  NSObject *v20;
  id WeakRetained;
  int v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  std::__shared_weak_count *v28;
  dispatch_semaphore_t v29;
  NSObject *openQueue;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  NSObject **v40;
  NSObject *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  id v56;
  uint8_t v57[4];
  HDHFDataStore *v58;
  __int16 v59;
  int64_t v60;
  __int16 v61;
  uint64_t v62;
  __int128 block;
  void *v64;
  void *v65;
  uint64_t (*v66)(uint64_t);
  NSObject *v67;
  _BYTE *v68;
  uint64_t *v69;
  int64_t v70;
  _BYTE buf[24];
  __n128 (*v72)(__n128 *, __n128 *);
  uint64_t (*v73)(uint64_t);
  void *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v48 = 0;
  if (!v2)
    goto LABEL_11;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
  v3 = atomic_load((unsigned __int8 *)(v2 + 48));
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v48, 100, CFSTR("HFD invalidated"));
    goto LABEL_11;
  }
  v5 = (uint64_t *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 32);
  if (v4)
    goto LABEL_6;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
  if (!*v5)
  {
    v14 = (id)v2;
    v15 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&block = MEMORY[0x1E0C809B0];
    *((_QWORD *)&block + 1) = 3221225472;
    v64 = ___ZL27_HDHFDataStoreWillOpenStoreP13HDHFDataStore_block_invoke;
    v65 = &unk_1E6D02218;
    v66 = (uint64_t (*)(uint64_t))v14;
    *(_QWORD *)buf = v15;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZL27_HDHFDataStoreWillOpenStoreP13HDHFDataStore_block_invoke_344;
    v72 = (__n128 (*)(__n128 *, __n128 *))&unk_1E6D021D0;
    v73 = v66;
    v16 = v66;
    active = _WithActiveHFDataStores(&block, buf);

    if ((active & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v48, 103, CFSTR("%@: Reached timeout waiting for existing data store to close the HFD."), v16);
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v16;
        _os_log_fault_impl(&dword_1B7802000, v27, OS_LOG_TYPE_FAULT, "%@: Reached timeout waiting for existing data store to close the HFD.", (uint8_t *)&block, 0xCu);
      }
      goto LABEL_11;
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
    openAttempt = v16->_openAttempt;
    v16->_openAttempt = openAttempt + 1;
    _HKInitializeLogging();
    v19 = (os_log_t *)MEMORY[0x1E0CB52B0];
    v20 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = openAttempt;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening store (%ld)", buf, 0x16u);
    }
    v56 = 0;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
    WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate);
    v22 = objc_msgSend(WeakRetained, "allowHFDMigration:", v16);

    if (v22)
    {
      do
        v23 = -[HDHFDataStore _lock_rebuildOneStep:]((uint64_t)v16, &v56);
      while (v23 == 3);
      v24 = v56;
      if (v23)
      {
        _HKInitializeLogging();
        v25 = *v19;
        if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v24;
          _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to migrate HFD during open: %{public}@", buf, 0x16u);
        }
        v26 = v24;
        v24 = v26;
        if (v26)
          v48 = objc_retainAutorelease(v26);

        goto LABEL_36;
      }
    }
    else
    {
      v24 = v56;
    }
    if (-[HDHFDataStore rebuildState](v16, "rebuildState") == 100)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v48, 1104, CFSTR("Attempt to access the HFD after migration to SQLite and deletion of the HFD"));
LABEL_36:

      v28 = 0;
      goto LABEL_37;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4012000000;
    v72 = __Block_byref_object_copy__155;
    v73 = __Block_byref_object_dispose__155;
    v75 = 0;
    v76 = 0;
    v74 = &unk_1B805FAAD;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__239;
    v54 = __Block_byref_object_dispose__240;
    v55 = 0;
    v29 = dispatch_semaphore_create(0);
    openQueue = v16->_openQueue;
    *(_QWORD *)&block = v15;
    *((_QWORD *)&block + 1) = 3221225472;
    v64 = __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke;
    v65 = &unk_1E6D020C0;
    v66 = (uint64_t (*)(uint64_t))v16;
    v68 = buf;
    v69 = &v50;
    v70 = openAttempt;
    v31 = v29;
    v67 = v31;
    dispatch_async(openQueue, &block);
    v32 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v31, v32))
    {
      _HKInitializeLogging();
      v33 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v57 = 138543362;
        v58 = v16;
        _os_log_fault_impl(&dword_1B7802000, v33, OS_LOG_TYPE_FAULT, "%{public}@: Timed out attempting to open the HFD, despite tracking saying we should be successful.", v57, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v48, 1103, CFSTR("Timed out attempting to open the HFD."));
    }
    else
    {
      v40 = (NSObject **)MEMORY[0x1E0CB52B0];
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 48))
      {
        _HKInitializeLogging();
        v41 = *v40;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v57 = 138543618;
          v58 = v16;
          v59 = 2048;
          v60 = openAttempt;
          _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished opening store (%ld)", v57, 0x16u);
        }
        v34 = *(_QWORD *)(*(_QWORD *)&buf[8] + 48);
        v28 = *(std::__shared_weak_count **)(*(_QWORD *)&buf[8] + 56);
        if (v28)
        {
          p_shared_owners = (unint64_t *)&v28->__shared_owners_;
          do
            v43 = __ldxr(p_shared_owners);
          while (__stxr(v43 + 1, p_shared_owners));
        }
LABEL_44:

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(buf, 8);
        v35 = v76;
        if (v76)
        {
          v36 = (unint64_t *)&v76->__shared_owners_;
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }

        if (v34)
        {
          std::shared_ptr<health::DataStore>::operator=[abi:ne180100]((_QWORD *)(v2 + 32), v34, (uint64_t)v28);
          atomic_store(1u, (unsigned __int8 *)&v16->_hasOpenStore);
          v49 = 1;
          if (!v28)
            goto LABEL_5;
LABEL_51:
          v38 = (unint64_t *)&v28->__shared_owners_;
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
            std::__shared_weak_count::__release_weak(v28);
          }
          if ((v49 & 1) != 0)
            goto LABEL_5;
LABEL_11:
          block = 0uLL;
          goto LABEL_12;
        }
LABEL_37:
        _HDHFDataStoreWillCloseStore(v16);
        v49 = 0;
        if (!v28)
          goto LABEL_11;
        goto LABEL_51;
      }
      _HKInitializeLogging();
      v44 = *v40;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v47 = v51[5];
        *(_DWORD *)v57 = 138543874;
        v58 = v16;
        v59 = 2048;
        v60 = openAttempt;
        v61 = 2114;
        v62 = v47;
        _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed opening store (%ld): %{public}@", v57, 0x20u);
      }
      v45 = (id)v51[5];
      v46 = v45;
      if (v45)
        v48 = objc_retainAutorelease(v45);

    }
    v34 = 0;
    v28 = 0;
    goto LABEL_44;
  }
LABEL_5:
  v4 = *v5;
LABEL_6:
  v6 = *(_QWORD *)(v2 + 40);
  *(_QWORD *)&block = v4;
  *((_QWORD *)&block + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
LABEL_12:
  v9 = v48;
  v10 = v48;
  std::shared_ptr<health::VirtualFile>::operator=[abi:ne180100](*(_QWORD *)(a1[5] + 8) + 48, &block);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
  if (*((_QWORD *)&block + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48))
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);

}

+ (uint64_t)_errorIndicatesCorruption:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HKDatabaseErrorIndicatesCorruptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)accessStoreWithError:(id *)a3 block:(id)a4
{
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  id v21;
  unint64_t *v22;
  unint64_t v23;
  char v24;
  id v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  id v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD *);
  void *v45;
  HDHFDataStore *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  __n128 (*v58)(__n128 *, __n128 *);
  uint64_t (*v59)(uint64_t);
  void *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHFDataStore.mm"), 548, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  if (-[HDHFDataStore rebuildState](self, "rebuildState") == 100)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 1104, CFSTR("Attempt to access the HFD after migration to SQLite and deletion of the HFD"));
    v8 = 0;
    goto LABEL_47;
  }
  v9 = MEMORY[0x1E0C809B0];
  if (self)
  {
    v55 = 0;
    v56 = &v55;
    v57 = 0x4012000000;
    v58 = __Block_byref_object_copy__155;
    v59 = __Block_byref_object_dispose__155;
    v61 = 0;
    v62 = 0;
    v60 = &unk_1B805FAAD;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__239;
    v53 = __Block_byref_object_dispose__240;
    v54 = 0;
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __50__HDHFDataStore__highFrequencyDataStoreWithError___block_invoke;
    v45 = &unk_1E6D020E8;
    v46 = self;
    v47 = &v55;
    v48 = &v49;
    HKWithUnfairLock();
    v10 = v56;
    v11 = v56[6];
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      v13 = (id)v50[5];
      v12 = v13;
      if (v13)
        v14 = objc_retainAutorelease(v13);

      v10 = v56;
      v11 = v56[6];
    }
    v15 = (std::__shared_weak_count *)v10[7];
    v40 = v11;
    v41 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    v18 = v62;
    if (v62)
    {
      v19 = (unint64_t *)&v62->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    v12 = 0;
    v40 = 0;
    v41 = 0;
  }
  v21 = v12;
  if (-[HDHFDataStore rebuildState](self, "rebuildState") == 100)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 1104, CFSTR("Attempt to access the HFD after migration to SQLite and deletion of the HFD"));
  }
  else
  {
    if (v40)
    {
      v39 = v21;
      v35[0] = v9;
      v35[1] = 3321888768;
      v35[2] = __44__HDHFDataStore_accessStoreWithError_block___block_invoke;
      v35[3] = &unk_1E6D02110;
      v36 = v7;
      v37 = v40;
      v38 = v41;
      if (v41)
      {
        v22 = (unint64_t *)&v41->__shared_owners_;
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      v24 = -[HDHFDataStore _convertExceptionsToError:inBlock:]((id *)&self->super.isa, &v39, v35);
      v25 = v39;

      v26 = v38;
      if (v38)
      {
        v27 = (unint64_t *)&v38->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      if ((v24 & 1) != 0)
      {
        v8 = 1;
        v21 = v25;
        goto LABEL_41;
      }
      v21 = v25;
    }
    if (-[HDHFDataStore _requiresRebuildForState:]((_BOOL8)self, -[HDHFDataStore rebuildState](self, "rebuildState")))
      -[HDHFDataStore flushForInvalidation:](self, "flushForInvalidation:", 0);
    v29 = v21;
    v21 = v29;
    if (v29)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

  }
  v8 = 0;
LABEL_41:
  v30 = v41;
  if (v41)
  {
    v31 = (unint64_t *)&v41->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

LABEL_47:
  return v8;
}

uint64_t __44__HDHFDataStore_accessStoreWithError_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (BOOL)_requiresRebuildForState:(_BOOL8)result
{
  NSObject *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 <= 0x14 && ((1 << a2) & 0x1FFC7F) != 0)
      return 1;
    if (a2 == 100)
      return 0;
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB52B0];
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT);
    if (result)
    {
      v4 = 134217984;
      v5 = a2;
      _os_log_fault_impl(&dword_1B7802000, v3, OS_LOG_TYPE_FAULT, "Unexpected HFD rebuild state: %ld", (uint8_t *)&v4, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t __51__HDHFDataStore__convertExceptionsToError_inBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestHFDRebuild
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  if (a1 && !objc_msgSend(a1, "rebuildState"))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "Requesting rebuild of the HFD", v4, 2u);
    }
    -[HDHFDataStore setRebuildState:]((uint64_t)a1, 1);
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(WeakRetained, "didMigrateHFDataStore:fromState:toState:success:error:", a1, 0, 1, 1, 0);

  }
}

- (id)directoryURL
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 88));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLByDeletingLastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int64_t)rebuildWithTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  -[HDHFDataStore flushForInvalidation:](self, "flushForInvalidation:", 0);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__239;
  v13 = __Block_byref_object_dispose__240;
  v14 = 0;
  HKWithUnfairLock();
  v5 = (id)v10[5];
  v6 = v5;
  if (v5)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = v16[3];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __46__HDHFDataStore_rebuildWithTransaction_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = -[HDHFDataStore _lock_rebuildOneStep:](v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (uint64_t)_lock_rebuildOneStep:(uint64_t)a1
{
  const os_unfair_lock *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  id WeakRetained;
  NSObject *v19;
  unint64_t v20;
  os_log_t *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  char v34;
  id v35;
  void *v36;
  NSObject *v37;
  health::TransactionalFile *v38;
  NSObject *v39;
  NSObject *v40;
  double Current;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id *v53;
  id v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  NSObject *v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  char v79;
  NSObject *v80;
  NSObject *v81;
  char v82;
  id v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  id v87;
  NSObject *v88;
  const char *v89;
  id v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  id v94;
  void *v95;
  id v96;
  NSObject *v97;
  id v98;
  id v99;
  NSObject *v100;
  id v101;
  _BOOL4 v102;
  health::TransactionalFile *v103;
  health::TransactionalFile *v104;
  health::TransactionalFile *v105;
  double v106;
  unint64_t v107;
  id v108;
  NSObject *v109;
  NSObject *v110;
  id v111;
  id v112;
  void *v113;
  health::TransactionalFile *v115;
  id v116;
  id v117;
  HDFileArchiver *v118;
  uint64_t v119;
  _BOOL4 v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  health::TransactionalFile *v133;
  id v134;
  health::TransactionalFile *v135;
  id v136;
  health::TransactionalFile *v137;
  id v138;
  id v139;
  id *v140;
  _BYTE v141[12];
  __int128 v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void *v144;
  health::TransactionalFile **v145;
  id **v146;
  health::TransactionalFile **v147;
  id *v148;
  _BYTE buf[24];
  double v150;
  id **v151;
  health::TransactionalFile **v152;
  health::TransactionalFile **v153;
  id *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (const os_unfair_lock *)(a1 + 24);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
  os_unfair_lock_assert_owner(v4);
  if (!objc_msgSend((id)a1, "rebuildState"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 88));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C99998];
    v7 = *MEMORY[0x1E0C99900];
    *(_QWORD *)&v142 = *MEMORY[0x1E0C99998];
    *((_QWORD *)&v142 + 1) = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v142, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v141 = 0;
    objc_msgSend(v5, "resourceValuesForKeys:error:", v8, v141);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(id *)v141;

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "longLongValue");

      if (v12 >= 0x140000000)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        v16 = v15 / (double)v12;
        if (v16 <= 0.5)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2048;
            v150 = (1.0 - v16) * 100.0;
            _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: HFD is large (%lld bytes) and %02.2lf%% sparse; requesting rebuild.",
              buf,
              0x20u);
          }
          -[HDHFDataStore setRebuildState:](a1, 1);
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          objc_msgSend(WeakRetained, "didMigrateHFDataStore:fromState:toState:success:error:", a1, 0, 1, 1, 0);

        }
      }
    }
    else if ((objc_msgSend(v10, "hk_isCocoaNoSuchFileError") & 1) == 0)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get HFD sizes when checking for sparseness during open: %{public}@", buf, 0x16u);
      }
    }

  }
  v20 = objc_msgSend((id)a1, "rebuildState");
  if (!-[HDHFDataStore _requiresRebuildForState:](a1, v20))
    return 0;
  _HKInitializeLogging();
  v21 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v22 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Rebuild required with current state %ld.", buf, 0x16u);
  }
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, CFSTR("HFD Rebuild"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0;
  os_unfair_lock_assert_owner(v4);
  v24 = CFSTR("healthdb_archive_sqlite_migration.hfd");
  v25 = 100;
  v26 = 20;
  v27 = 10;
  switch(v20)
  {
    case 0uLL:
    case 6uLL:
      goto LABEL_43;
    case 1uLL:
      v24 = CFSTR("healthdb_archive.hfd");
      v25 = 2;
      goto LABEL_40;
    case 2uLL:
      v26 = 3;
      goto LABEL_42;
    case 3uLL:
      os_unfair_lock_assert_owner(v4);
      if ((-[HDHFDataStore _lock_deleteCompressedArchive:]((os_unfair_lock *)a1, &v129) & 1) == 0)
        goto LABEL_47;
      v27 = 4;
      goto LABEL_43;
    case 4uLL:
      v140 = (id *)a1;
      Current = CFAbsoluteTimeGetCurrent();
      os_unfair_lock_assert_owner(v4);
      v42 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v42, "activeTransactionForCurrentThreadForHFDataStore:forWriting:", a1, 0);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v127)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v129, 121, CFSTR("No active transaction when attempting HFD restore."));
        v34 = 0;
        goto LABEL_155;
      }
      -[HDHFDataStore directoryURL](a1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "URLByAppendingPathComponent:", CFSTR("healthdb_archive.hfd"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDHFDataStore directoryURL]((uint64_t)v140);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByAppendingPathComponent:", CFSTR("healthdb_archive.hfd.tgz"));
      v121 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v140, "fileManager");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x1E0CB3940];
      v125 = objc_retainAutorelease(v121);
      objc_msgSend(v45, "stringWithUTF8String:", objc_msgSend(v125, "fileSystemRepresentation"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v126, "fileExistsAtPath:", v46);

      if (!v47)
      {
        v120 = 0;
        goto LABEL_88;
      }
      v139 = 0;
      v48 = objc_msgSend(v126, "removeItemAtURL:error:", v124, &v139);
      v49 = v139;
      v50 = v49;
      if ((v48 & 1) != 0 || (objc_msgSend(v49, "hk_isCocoaNoSuchFileError") & 1) != 0)
      {
        v122 = v50;
        v118 = objc_alloc_init(HDFileArchiver);
        -[HDHFDataStore directoryURL]((uint64_t)v140);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = 0;
        v120 = -[HDFileArchiver decompressArchiveAt:to:error:](v118, "decompressArchiveAt:to:error:", v125, v51, &v138);
        v52 = v138;

        if (!v120)
        {
          v53 = v140;
          v54 = v52;
          v55 = v54;
          if (v53
            && (objc_msgSend(v54, "domain"),
                v56 = (void *)objc_claimAutoreleasedReturnValue(),
                v57 = objc_msgSend(v56, "isEqual:", *MEMORY[0x1E0CB2FE0]),
                v56,
                (v57 & 1) != 0))
          {
            if (objc_msgSend(v55, "code") == 1
              || objc_msgSend(v55, "code") == 28
              || objc_msgSend(v55, "code") == 11
              || objc_msgSend(v55, "code") == 23)
            {

LABEL_60:
              _HKInitializeLogging();
              v58 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v55;
                _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "Failed to decompress archived HFD: %{public}@", buf, 0xCu);
              }
              v59 = v55;
              v60 = v59;
              if (v59)
                v129 = objc_retainAutorelease(v59);

              v34 = 0;
              v61 = v122;
              goto LABEL_154;
            }
            v102 = objc_msgSend(v55, "code") == 13;

            if (v102)
              goto LABEL_60;
          }
          else
          {

          }
          _HKInitializeLogging();
          v71 = *v21;
          if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v55;
            _os_log_error_impl(&dword_1B7802000, v71, OS_LOG_TYPE_ERROR, "Suppressing decompression error %{public}@", buf, 0xCu);
          }
          v72 = objc_loadWeakRetained(v140 + 10);
          objc_msgSend(v72, "didMigrateHFDataStore:fromState:toState:success:error:", v140, 4, 4, 0, v55);

        }
LABEL_88:
        v136 = 0;
        objc_msgSend(v140, "dataStoreAtURL:filesystem:allowCheckpoint:error:", v124, v140 + 1, 0, &v136);
        v73 = v136;
        v123 = v73;
        if (!v137)
        {
          v85 = v73;
          if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v73))
          {
            _HKInitializeLogging();
            v86 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v140;
              _os_log_impl(&dword_1B7802000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@: Archived HFD is too corrupt to open; marking rebuild as complete and continuing with existin"
                "g production HFD.",
                buf,
                0xCu);
            }
            v87 = objc_loadWeakRetained(v140 + 10);
            objc_msgSend(v87, "HFDataStoreDidPerformRebuild:didDecompressArchivedHFD:didOpenArchivedHFD:didOpenMovedAsideHFD:recoveryAnalytics:duration:", v140, 0, 0, 0, MEMORY[0x1E0C9AA70], CFAbsoluteTimeGetCurrent() - Current);

            v61 = v123;
            -[HDHFDataStore setRebuildState:]((uint64_t)v140, 6);
            v34 = 1;
            goto LABEL_152;
          }
          v90 = v85;
          if (v90)
          {
            v74 = objc_retainAutorelease(v90);
            v34 = 0;
            v129 = v74;
          }
          else
          {
            v74 = 0;
            v34 = 0;
          }
LABEL_151:

          v61 = v123;
LABEL_152:
          v105 = v137;
          v137 = 0;
          if (v105)
          {
            health::TransactionalFile::~TransactionalFile(v105);
            MEMORY[0x1BCCAC494]();
          }
          goto LABEL_154;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v140[11]);
        v74 = (id)objc_claimAutoreleasedReturnValue();
        -[HDHFDataStore directoryURL]((uint64_t)v140);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "URLByAppendingPathComponent:", CFSTR("healthdb_archive_temporary.hfd"));
        v119 = objc_claimAutoreleasedReturnValue();

        v76 = (void *)v119;
        if ((objc_msgSend(v140, "moveHFDAsideWithoutOverwritingFrom:to:error:", v74, v119, &v129) & 1) != 0)
        {
          if ((objc_msgSend(v140, "deleteHFDAt:error:", v74, &v129) & 1) != 0)
          {
            v134 = 0;
            objc_msgSend(v140, "dataStoreAtURL:filesystem:allowCheckpoint:error:", v119, v140 + 1, 0, &v134);
            v77 = v134;
            if (!v135)
            {
              if ((+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v77) & 1) == 0)
              {
                _HKInitializeLogging();
                v93 = *v21;
                if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v140;
                  _os_log_error_impl(&dword_1B7802000, v93, OS_LOG_TYPE_ERROR, "%{public}@: Unable to open moved-aside HFD.", buf, 0xCu);
                }
                v94 = v77;
                v95 = v94;
                if (v94)
                  v129 = objc_retainAutorelease(v94);

                v34 = 0;
                goto LABEL_147;
              }
              _HKInitializeLogging();
              v91 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v140;
                _os_log_impl(&dword_1B7802000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@: Moved-aside HFD is too corrupt to open; marking rebuild as complete and continuing with ex"
                  "isitng production HFD.",
                  buf,
                  0xCu);
              }
            }
            objc_msgSend(v140, "dataStoreAtURL:filesystem:allowCheckpoint:error:", v74, v140 + 1, 1, &v129);
            if (!v133)
            {
              _HKInitializeLogging();
              v92 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v140;
                _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open new production HFD.", buf, 0xCu);
              }
              v34 = 0;
              goto LABEL_145;
            }
            v116 = v77;
            v132 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v78 = MEMORY[0x1E0C809B0];
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3321888768;
            *(_QWORD *)&buf[16] = __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke;
            v150 = COERCE_DOUBLE(&__block_descriptor_64_ea8_32c58_ZTSKZ45__HDHFDataStore__lock_restoreHFDFromArchive__E3__0_e9_B16__0__8l);
            v151 = &v140;
            v152 = &v133;
            v153 = &v137;
            v154 = &v132;
            v131 = 0;
            v79 = hfd_catchExceptionsAsErrors(buf, (uint64_t)&v131, 0);
            v117 = v131;
            if ((v79 & 1) == 0)
            {
              if (!+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v117))
              {
                _HKInitializeLogging();
                v97 = *v21;
                if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v142) = 138543362;
                  *(_QWORD *)((char *)&v142 + 4) = v117;
                  _os_log_error_impl(&dword_1B7802000, v97, OS_LOG_TYPE_ERROR, "Failed to migrate contents of archived HFD to new copy (%{public}@)", (uint8_t *)&v142, 0xCu);
                }
                v98 = v117;
                if (v98)
                {
                  v99 = objc_retainAutorelease(v98);
                  v129 = v99;
                }
                else
                {
                  v99 = 0;
                }
                goto LABEL_143;
              }
              _HKInitializeLogging();
              v80 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v142) = 0;
                _os_log_error_impl(&dword_1B7802000, v80, OS_LOG_TYPE_ERROR, "Archival HFD corrupted beyond recovery; silently continuing",
                  (uint8_t *)&v142,
                  2u);
              }
            }
            if (!v135)
            {
              v115 = 0;
              goto LABEL_128;
            }
            _HKInitializeLogging();
            v81 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v142) = 138543362;
              *(_QWORD *)((char *)&v142 + 4) = v140;
              _os_log_impl(&dword_1B7802000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning migration from moved-aside HFD.", (uint8_t *)&v142, 0xCu);
            }
            *(_QWORD *)&v142 = v78;
            *((_QWORD *)&v142 + 1) = 3321888768;
            v143 = __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke_265;
            v144 = &__block_descriptor_64_ea8_32c58_ZTSKZ45__HDHFDataStore__lock_restoreHFDFromArchive__E3__1_e9_B16__0__8l;
            v145 = &v133;
            v146 = &v140;
            v147 = &v135;
            v148 = &v132;
            v130 = 0;
            v82 = hfd_catchExceptionsAsErrors(&v142, (uint64_t)&v130, 0);
            v83 = v130;
            if ((v82 & 1) != 0)
            {
LABEL_104:

              v115 = v135;
LABEL_128:
              v96 = objc_loadWeakRetained(v140 + 10);
              objc_msgSend(v96, "HFDataStoreDidPerformRebuild:didDecompressArchivedHFD:didOpenArchivedHFD:didOpenMovedAsideHFD:recoveryAnalytics:duration:", v140, v120, 1, v115 != 0, v132, CFAbsoluteTimeGetCurrent() - Current);

              -[HDHFDataStore setRebuildState:]((uint64_t)v140, 5);
              v34 = 1;
LABEL_144:

              v77 = v116;
LABEL_145:
              v103 = v133;
              v133 = 0;
              if (v103)
              {
                health::TransactionalFile::~TransactionalFile(v103);
                MEMORY[0x1BCCAC494]();
              }
LABEL_147:
              v104 = v135;
              v135 = 0;
              if (v104)
              {
                health::TransactionalFile::~TransactionalFile(v104);
                MEMORY[0x1BCCAC494]();
              }

              v76 = (void *)v119;
              goto LABEL_150;
            }
            if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v83))
            {
              _HKInitializeLogging();
              v84 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v141 = 0;
                _os_log_error_impl(&dword_1B7802000, v84, OS_LOG_TYPE_ERROR, "Recovered production DB corrupted; silently continuing",
                  v141,
                  2u);
              }
              goto LABEL_104;
            }
            _HKInitializeLogging();
            v100 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v141 = 138543362;
              *(_QWORD *)&v141[4] = v83;
              _os_log_error_impl(&dword_1B7802000, v100, OS_LOG_TYPE_ERROR, "Failed to migrate contents of moved-aside production HFD to new copy (%{public}@)", v141, 0xCu);
            }
            v101 = v83;
            v99 = v101;
            if (v101)
              v129 = objc_retainAutorelease(v101);

LABEL_143:
            v34 = 0;
            goto LABEL_144;
          }
          _HKInitializeLogging();
          v88 = *v21;
          if (!os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
          {
LABEL_114:
            v34 = 0;
LABEL_150:

            goto LABEL_151;
          }
          *(_WORD *)buf = 0;
          v89 = "Failed to delete stale HFD at production location.";
        }
        else
        {
          _HKInitializeLogging();
          v88 = *v21;
          if (!os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
            goto LABEL_114;
          *(_WORD *)buf = 0;
          v89 = "Failed to move aside production HFD in preparation for rebuild.";
        }
        _os_log_error_impl(&dword_1B7802000, v88, OS_LOG_TYPE_ERROR, v89, buf, 2u);
        goto LABEL_114;
      }
      _HKInitializeLogging();
      v68 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v50;
        _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, "Failed to clear target location before decompressing archived HFD: %{public}@", buf, 0xCu);
      }
      v69 = v50;
      if (v69)
      {
        v70 = v69;
        v129 = objc_retainAutorelease(v69);
        v69 = v70;
      }
      v61 = v69;

      v34 = 0;
LABEL_154:

LABEL_155:
      goto LABEL_156;
    case 5uLL:
      os_unfair_lock_assert_owner(v4);
      -[HDHFDataStore directoryURL](a1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "URLByAppendingPathComponent:", CFSTR("healthdb_archive_temporary.hfd"));
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend((id)a1, "deleteHFDAt:error:", v29, &v129) & 1) != 0)
      {
        -[HDHFDataStore directoryURL](a1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "URLByAppendingPathComponent:", CFSTR("healthdb_archive.hfd"));
        v128 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend((id)a1, "deleteHFDAt:error:", v128, &v129) & 1) != 0)
        {
          *(_QWORD *)buf = 0;
          v34 = -[HDHFDataStore _lock_deleteCompressedArchive:]((os_unfair_lock *)a1, buf);
          v64 = *(id *)buf;
          v65 = v64;
          if ((v34 & 1) != 0)
          {
            -[HDHFDataStore setRebuildState:](a1, 6);
          }
          else
          {
            v66 = v64;
            v67 = v66;
            if (v66)
              v129 = objc_retainAutorelease(v66);

          }
        }
        else
        {
          v34 = 0;
        }

      }
      else
      {
        v34 = 0;
      }
      goto LABEL_33;
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_37;
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      os_unfair_lock_assert_owner(v4);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 88));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v141 = 0;
      objc_msgSend((id)a1, "dataStoreAtURL:filesystem:allowCheckpoint:error:", v28, a1 + 8, 0, v141);
      v29 = *(id *)v141;

      if ((_QWORD)v142)
      {
        v30 = objc_loadWeakRetained((id *)(a1 + 80));
        v31 = objc_msgSend(v30, "migrateDataForHFDataStore:toSQLiteFrom:error:", a1, (_QWORD)v142, &v129);

        if (v31)
        {
          -[HDHFDataStore setRebuildState:](a1, 19);
LABEL_25:
          v34 = 1;
          goto LABEL_31;
        }
      }
      else
      {
        if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v29))
        {
          _HKInitializeLogging();
          v33 = *v21;
          if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v29;
            _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_INFO, "%{public}@: Corrupted HFD detected (%{public}@; silently progressing migration to SQLite",
              buf,
              0x16u);
          }
          -[HDHFDataStore setRebuildState:](a1, 19);
          goto LABEL_25;
        }
        v35 = v29;
        v36 = v35;
        if (v35)
          v129 = objc_retainAutorelease(v35);

        _HKInitializeLogging();
        v37 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v36;
          _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open production HFD - %{public}@.", buf, 0x16u);
        }
      }
      v34 = 0;
LABEL_31:
      v38 = (health::TransactionalFile *)v142;
      *(_QWORD *)&v142 = 0;
      if (v38)
      {
        health::TransactionalFile::~TransactionalFile(v38);
        MEMORY[0x1BCCAC494]();
      }
LABEL_33:

LABEL_156:
      v106 = COERCE_DOUBLE(v129);
      objc_msgSend(v23, "invalidate");
      v107 = objc_msgSend((id)a1, "rebuildState");
      if ((v34 & 1) == 0)
      {
        _HKInitializeLogging();
        v110 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2114;
          v150 = v106;
          _os_log_error_impl(&dword_1B7802000, v110, OS_LOG_TYPE_ERROR, "%{public}@: HFD rebuild at state %ld failed: %{public}@", buf, 0x20u);
        }
        v111 = objc_loadWeakRetained((id *)(a1 + 80));
        objc_msgSend(v111, "didMigrateHFDataStore:fromState:toState:success:error:", a1, v20, v107, 0, *(_QWORD *)&v106);

        v112 = *(id *)&v106;
        v113 = v112;
        if (v112)
        {
          if (a2)
            *a2 = objc_retainAutorelease(v112);
          else
            _HKLogDroppedError();
        }

        goto LABEL_171;
      }
      v108 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v108, "didMigrateHFDataStore:fromState:toState:success:error:", a1, v20, v107, 1, 0);

      if (v107 == v20)
      {
        _HKInitializeLogging();
        v109 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v20;
          _os_log_fault_impl(&dword_1B7802000, v109, OS_LOG_TYPE_FAULT, "%{public}@: HFD rebuild at state %ld reported success but failed to update result state.", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 100, CFSTR("HFD rebuild at state %ld reported success but failed to update result state."), v20);
LABEL_171:
        v32 = 1;
        goto LABEL_172;
      }
      if (-[HDHFDataStore _requiresRebuildForState:](a1, v107))
        v32 = 3;
      else
        v32 = 0;
LABEL_172:

      break;
    case 0x13uLL:
LABEL_42:
      os_unfair_lock_assert_owner(v4);
      v27 = v26;
LABEL_43:
      -[HDHFDataStore setRebuildState:](a1, v27);
      goto LABEL_44;
    case 0x14uLL:
LABEL_40:
      v34 = -[HDHFDataStore _lock_archiveHFDTo:nextState:error:](a1, v24, v25, &v129);
      goto LABEL_156;
    default:
      if (v20 == 100)
      {
        _HKInitializeLogging();
        v39 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1B7802000, v39, OS_LOG_TYPE_FAULT, "Rebuild requested while HFD is at terminal state HDHFDataStoreRebuildStateHFDArchivedPostSQLiteMigration", buf, 2u);
        }
LABEL_44:
        v34 = 1;
      }
      else
      {
LABEL_37:
        _HKInitializeLogging();
        v40 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v20;
          _os_log_fault_impl(&dword_1B7802000, v40, OS_LOG_TYPE_FAULT, "Unexpected HFD rebuild state: %ld", buf, 0xCu);
        }
LABEL_47:
        v34 = 0;
      }
      goto LABEL_156;
  }
  return v32;
}

- (int64_t)rebuildState
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "HFDataStore:integerForKey:", self, CFSTR("HKHFDRebuildStage"));

  return v4;
}

- (void)requestHFDToSQLiteMigration
{
  -[HDHFDataStore flushForInvalidation:](self, "flushForInvalidation:", 0);
  -[HDHFDataStore setRebuildState:]((uint64_t)self, 10);
}

- (uint64_t)_lock_archiveHFDTo:(uint64_t)a3 nextState:(_QWORD *)a4 error:
{
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v9 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Moving aside HFD", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHFDataStore directoryURL](a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v13 = objc_msgSend((id)a1, "moveHFDAsideWithoutOverwritingFrom:to:error:", v10, v12, &v20);
  v14 = v20;
  if ((_DWORD)v13)
  {
    _HKInitializeLogging();
    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "HFD archive successful", buf, 2u);
    }
    -[HDHFDataStore setRebuildState:](a1, a3);
  }
  else
  {
    _HKInitializeLogging();
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to archive the current HFD - %{public}@", buf, 0xCu);
    }
    v17 = v14;
    v18 = v17;
    if (v17)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

  }
  return v13;
}

- (uint64_t)_lock_deleteCompressedArchive:(os_unfair_lock *)a1
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  os_unfair_lock *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(a1 + 6);
  -[HDHFDataStore directoryURL]((uint64_t)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("healthdb_archive.hfd.tgz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[os_unfair_lock fileManager](a1, "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v14);
  v8 = v14;

  if ((v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = a1;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete compressed archive - %{public}@", buf, 0x16u);
    }
    v11 = v8;
    v12 = v11;
    if (v11)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v9 = 0;
  }

  return v9;
}

uint64_t __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;
  int8x16_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v12 = **(_QWORD **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Beginning migration from archived HFD.", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v13 = *(int8x16_t *)(a1 + 40);
  v6 = *(_QWORD *)v13.i64[0];
  v7 = (int8x16_t *)operator new(0x30uLL);
  v7->i64[0] = (uint64_t)&off_1E6D02248;
  v7->i64[1] = v4;
  v7[1] = vextq_s8(v13, v13, 8uLL);
  v7[2].i64[0] = v5;
  v7[2].i64[1] = (uint64_t)&v14;
  v17 = (uint8_t *)v7;
  v8 = health::DataStore::performWriteTransactionWithLambda(v6, (uint64_t)buf);
  v9 = v17;
  if (v17 == buf)
  {
    v10 = 4;
    v9 = buf;
    goto LABEL_7;
  }
  if (v17)
  {
    v10 = 5;
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
  }
  return v8;
}

uint64_t __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke_265(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v3 = *(uint64_t **)(a1 + 32);
  v4 = *v3;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (char *)operator new(0x30uLL);
  *(_QWORD *)v6 = &off_1E6D022C8;
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(a1 + 40);
  *((_QWORD *)v6 + 3) = v3;
  *((_QWORD *)v6 + 4) = v5;
  *((_QWORD *)v6 + 5) = &v11;
  v13 = v6;
  v7 = health::DataStore::performWriteTransactionWithLambda(v4, (uint64_t)v12);
  v8 = v13;
  if (v13 == v12)
  {
    v9 = 4;
    v8 = v12;
    goto LABEL_5;
  }
  if (v13)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(_QWORD *))(*v8 + 8 * v9))(v8);
  }
  return v7;
}

- (int64_t)deleteSQLiteMigrationArchive:(id *)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__239;
  v12 = __Block_byref_object_dispose__240;
  v13 = 0;
  HKWithUnfairLock();
  v4 = (id)v9[5];
  v5 = v4;
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  v6 = *((_BYTE *)v15 + 24) == 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __46__HDHFDataStore_deleteSQLiteMigrationArchive___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  -[HDHFDataStore directoryURL]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("healthdb_archive_sqlite_migration.hfd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "deleteHFDAt:error:", v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (_BYTE)v2;

}

- (id)fileManager
{
  return objc_alloc_init(MEMORY[0x1E0CB3620]);
}

- (void)unitTest_resetRebuildState
{
  -[HDHFDataStore setRebuildState:]((uint64_t)self, 0);
}

- (void)unitTest_requestRebuild
{
  -[HDHFDataStore setRebuildState:]((uint64_t)self, 0);
  -[HDHFDataStore _requestHFDRebuild]((id *)&self->super.isa);
}

- (void)unitTest_requestMigrationToSQLite
{
  -[HDHFDataStore setRebuildState:]((uint64_t)self, 10);
}

- (HDHFDataStoreDelegate)delegate
{
  return (HDHFDataStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)fileSystemPath
{
  return self->_fileSystemPath;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSystemPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_openQueue, 0);
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)&self->_highFrequencyDataStore);
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)&self->_fileSystem);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
