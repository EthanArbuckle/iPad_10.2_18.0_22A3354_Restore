@implementation DMCRFMBSnapshotSource

- (DMCRFMBSnapshotSource)initWithPersonaIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  DMCRFMBSnapshotSource *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  DMCRFMBRestoreDelegate *v13;
  DMCRFMBRestoreDelegate *restoreDelegate;
  uint64_t v15;
  MBManager *mobileBackup;
  NSObject *v17;
  uint8_t v19[16];
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DMCRFMBSnapshotSource;
  v9 = -[DMCRFMBSnapshotSource init](&v20, sel_init);
  if (v9)
  {
    v10 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_216358000, v10, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBSnapshotSource init begin", v19, 2u);
    }
    v11 = dispatch_queue_create("snapshot source", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_personaIdentifier, a3);
    v13 = -[DMCRFMBRestoreDelegate initWithDelegate:source:]([DMCRFMBRestoreDelegate alloc], "initWithDelegate:source:", v8, v9);
    restoreDelegate = v9->_restoreDelegate;
    v9->_restoreDelegate = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE66C40]), "initWithDelegate:eventQueue:personaIdentifier:", v9->_restoreDelegate, v9->_queue, v9->_personaIdentifier);
    mobileBackup = v9->_mobileBackup;
    v9->_mobileBackup = (MBManager *)v15;

  }
  v17 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_216358000, v17, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBSnapshotSource init end", v19, 2u);
  }

  return v9;
}

- (DMCRFSnapshotSourceDelegate)delegate
{
  void *v2;
  void *v3;

  -[DMCRFMBSnapshotSource restoreDelegate](self, "restoreDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DMCRFSnapshotSourceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCRFMBSnapshotSource restoreDelegate](self, "restoreDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion: begin", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[DMCRFMBSnapshotSource mobileBackup](self, "mobileBackup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__DMCRFMBSnapshotSource_fetchRestorableSnapshotsWithCompletion___block_invoke;
  v10[3] = &unk_24D52EE60;
  v12 = buf;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "fetchRestorableSnapshotsWithCompletion:", v10);

  v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion end", v9, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __64__DMCRFMBSnapshotSource_fetchRestorableSnapshotsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  DMCRFMBSnapshot *v17;
  DMCRFMBSnapshot *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion: completion", buf, 2u);
  }
  if (v5)
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
          v17 = [DMCRFMBSnapshot alloc];
          v18 = -[DMCRFMBSnapshot initWithSnapshot:](v17, "initWithSnapshot:", v16, (_QWORD)v21);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }

  }
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
  {
    v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
    (*(void (**)(uint64_t, void *, id))(v19 + 16))(v19, v20, v6);

  }
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: begin", buf, 2u);
  }
  objc_msgSend(v6, "wrappedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCRFMBSnapshotSource mobileBackup](self, "mobileBackup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__DMCRFMBSnapshotSource_fetchAppBundleIDsForSnapshot_completion___block_invoke;
  v13[3] = &unk_24D52EE88;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v10, "fetchAppBundleIDsForSnapshot:completion:", v9, v13);

  v12 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v12, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: end", buf, 2u);
  }

}

void __65__DMCRFMBSnapshotSource_fetchAppBundleIDsForSnapshot_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: completion", v9, 2u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (BOOL)startRestoreForSnapshot:(id)a3 excludingAppBundleIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v11, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: begin", buf, 2u);
  }
  objc_msgSend(v8, "wrappedValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setExcludedAppBundleIDs:", v10);

  -[DMCRFMBSnapshotSource mobileBackup](self, "mobileBackup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __90__DMCRFMBSnapshotSource_startRestoreForSnapshot_excludingAppBundleIdentifiers_completion___block_invoke;
  v18[3] = &unk_24D52ECF8;
  v15 = v9;
  v19 = v15;
  objc_msgSend(v14, "startRestoreForSnapshot:options:completion:", v12, v13, v18);

  v16 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v16, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: end", buf, 2u);
  }

  return 1;
}

void __90__DMCRFMBSnapshotSource_startRestoreForSnapshot_excludingAppBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: completion", v6, 2u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MBManager)mobileBackup
{
  return self->_mobileBackup;
}

- (void)setMobileBackup:(id)a3
{
  objc_storeStrong((id *)&self->_mobileBackup, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (DMCRFMBRestoreDelegate)restoreDelegate
{
  return self->_restoreDelegate;
}

- (void)setRestoreDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_restoreDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreDelegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mobileBackup, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

@end
