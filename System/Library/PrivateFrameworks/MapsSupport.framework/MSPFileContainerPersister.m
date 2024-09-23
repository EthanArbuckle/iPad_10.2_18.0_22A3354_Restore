@implementation MSPFileContainerPersister

- (MSPFileContainerPersister)init
{
  MSPFileContainerPersister *result;

  result = (MSPFileContainerPersister *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MSPFileContainerPersister)initWithPersistenceFileAtURL:(id)a3
{
  id v4;
  MSPFileContainerPersister *v5;
  uint64_t v6;
  NSURL *persistenceFileURL;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *ioQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSPFileContainerPersister;
  v5 = -[MSPFileContainerPersister init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    persistenceFileURL = v5->_persistenceFileURL;
    v5->_persistenceFileURL = (NSURL *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.Maps.MSPContainerPersister.io", v8);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (id)newStateSnapshot
{
  NSObject *v3;
  NSURL *persistenceFileURL;
  void *v5;
  NSObject *v6;
  NSURL *v7;
  void *v8;
  int v10;
  NSURL *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    persistenceFileURL = self->_persistenceFileURL;
    v10 = 138412290;
    v11 = persistenceFileURL;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "Reading persisted data from %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", self->_persistenceFileURL, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_persistenceFileURL;
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "Read persisted data from %@", (uint8_t *)&v10, 0xCu);
  }

  -[MSPFileContainerPersister stateSnapshotFromData:](self, "stateSnapshotFromData:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchStateSnapshotWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[MSPFileContainerPersister ioQueue](self, "ioQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(WeakRetained, "newStateSnapshot");
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke_29;
    v8[3] = &unk_1E6653330;
    v6 = *(id *)(a1 + 32);
    v9 = v4;
    v10 = v6;
    v7 = v4;
    dispatch_async(v5, v8);

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[MSPFileContainerPersister fetchStateSnapshotWithCompletion:]_block_invoke";
      v13 = 1024;
      v14 = 93;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[MSPFileContainerPersister ioQueue](self, "ioQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke;
  v19[3] = &unk_1E6654C20;
  objc_copyWeak(&v24, &location);
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_31;
    v16[3] = &unk_1E6654BF8;
    objc_copyWeak(&v20, v2);
    v17 = a1[4];
    v18 = a1[5];
    v19 = a1[6];
    v15 = 0;
    objc_msgSend(WeakRetained, "commitByCreatingStateSnapshotAndDataWithCreationHandler:error:", v16, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    dispatch_get_global_queue(-32768, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_33;
    v11[3] = &unk_1E6654840;
    v8 = a1[7];
    v13 = v6;
    v14 = v8;
    v12 = v5;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, v11);

    objc_destroyWeak(&v20);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[MSPFileContainerPersister commitEditWithNewContents:edits:appliedToOldContents:completion:]_block_invoke";
      v23 = 1024;
      v24 = 105;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = objc_msgSend(WeakRetained, "getSnapshot:data:forNewContents:edits:appliedToOldContents:error:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a4);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[MSPFileContainerPersister commitEditWithNewContents:edits:appliedToOldContents:completion:]_block_invoke";
      v15 = 1024;
      v16 = 109;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v13, 0x12u);
    }

    v10 = 0;
  }

  return v10;
}

uint64_t __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[MSPFileContainerPersister ioQueue](self, "ioQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke;
  block[3] = &unk_1E66534E0;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_34;
    v16[3] = &unk_1E6654C48;
    objc_copyWeak(&v19, v2);
    v17 = a1[4];
    v18 = a1[5];
    v15 = 0;
    objc_msgSend(WeakRetained, "commitByCreatingStateSnapshotAndDataWithCreationHandler:error:", v16, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    dispatch_get_global_queue(-32768, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_35;
    block[3] = &unk_1E6654840;
    v8 = a1[6];
    v13 = v6;
    v14 = v8;
    v12 = v5;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v19);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[MSPFileContainerPersister commitByMergingWithStateSnapshot:mergeOptions:completion:]_block_invoke";
      v22 = 1024;
      v23 = 123;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)objc_msgSend(WeakRetained, "newStateSnapshot");
    v11 = objc_msgSend(v9, "getSnapshot:data:mergingCurrentState:withState:mergeOptions:error:", a2, a3, v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a4);

  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[MSPFileContainerPersister commitByMergingWithStateSnapshot:mergeOptions:completion:]_block_invoke";
      v16 = 1024;
      v17 = 127;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v14, 0x12u);
    }

    v11 = 0;
  }

  return v11;
}

uint64_t __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)commitByCreatingStateSnapshotAndDataWithCreationHandler:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, id *, id *, id *);
  NSObject *v7;
  NSURL *persistenceFileURL;
  void *v9;
  void *v10;
  int v11;
  id v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSURL *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  NSURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, id *, id *, id *))a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    persistenceFileURL = self->_persistenceFileURL;
    *(_DWORD *)buf = 138412290;
    v25 = persistenceFileURL;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEBUG, "Writing persisted data to %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByDeletingLastPathComponent](self->_persistenceFileURL, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4);

  v12 = 0;
  if (v11)
  {
    v22 = 0;
    v23 = 0;
    v13 = v6[2](v6, &v23, &v22, a4);
    v14 = v23;
    v15 = v22;
    v16 = v15;
    if (v13)
      v17 = objc_msgSend(v15, "writeToURL:options:error:", self->_persistenceFileURL, 536870913, a4);
    else
      v17 = 0;
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = self->_persistenceFileURL;
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEBUG, "Wrote persisted data to %@", buf, 0xCu);
    }

    if (v17)
      v20 = v14;
    else
      v20 = 0;
    v12 = v20;

  }
  return v12;
}

- (void)eraseWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[MSPFileContainerPersister ioQueue](self, "ioQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "persistenceFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v19);
    v6 = v19;

    if (v5)
    {
      dispatch_get_global_queue(-32768, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_37;
      block[3] = &unk_1E6653508;
      v8 = &v18;
      v18 = *(id *)(a1 + 32);
      dispatch_async(v7, block);
LABEL_15:

      goto LABEL_16;
    }
    -[NSObject domain](v6, "domain");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqual:](v9, "isEqual:", *MEMORY[0x1E0CB2FE0]) && -[NSObject code](v6, "code") == 2)
    {
      v10 = v9;
      v9 = v6;
      v6 = 0;
    }
    else
    {
      -[NSObject domain](v6, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB28A8]))
      {
        v11 = -[NSObject code](v6, "code");

        if (v11 != 4)
        {
LABEL_14:
          dispatch_get_global_queue(-32768, 0);
          v13 = objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_2;
          v14[3] = &unk_1E6653330;
          v8 = &v16;
          v16 = *(id *)(a1 + 32);
          v6 = v6;
          v15 = v6;
          dispatch_async(v13, v14);

          v7 = v15;
          goto LABEL_15;
        }
        v12 = 0;
LABEL_13:

        v6 = v12;
        goto LABEL_14;
      }
    }
    v12 = v6;

    v6 = v9;
    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[MSPFileContainerPersister eraseWithCompletion:]_block_invoke";
    v22 = 1024;
    v23 = 167;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
  }
LABEL_16:

}

uint64_t __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 forNewContents:(id)a5 edits:(id)a6 appliedToOldContents:(id)a7 error:(id *)a8
{
  -[MSPFileContainerPersister doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7);
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 mergingCurrentState:(id)a5 withState:(id)a6 mergeOptions:(id)a7 error:(id *)a8
{
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 6, 0, a6, a7);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)stateSnapshotFromData:(id)a3
{
  -[MSPFileContainerPersister doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSURL)persistenceFileURL
{
  return self->_persistenceFileURL;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ioQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_persistenceFileURL, 0);
}

@end
