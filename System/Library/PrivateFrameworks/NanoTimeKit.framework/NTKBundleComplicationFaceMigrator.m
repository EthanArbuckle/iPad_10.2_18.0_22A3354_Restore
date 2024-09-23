@implementation NTKBundleComplicationFaceMigrator

- (NTKBundleComplicationFaceMigrator)initWithMigrationProvider:(id)a3
{
  id v5;
  NTKBundleComplicationFaceMigrator *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKBundleComplicationFaceMigrator;
  v6 = -[NTKBundleComplicationFaceMigrator init](&v10, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationFaceMigrator", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_migrationProvider, a3);
  }

  return v6;
}

- (NTKBundleComplicationFaceMigrator)init
{
  void *v3;
  NTKBundleComplicationFaceMigrator *v4;

  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKBundleComplicationFaceMigrator initWithMigrationProvider:](self, "initWithMigrationProvider:", v3);

  return v4;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKBundleComplicationFaceMigrator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, block);
  return (id)sharedInstance_instance;
}

void __51__NTKBundleComplicationFaceMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (void)migrateFace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  __int128 *v19;
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  NTKBundleComplicationFaceMigrator *v23;
  id v24;
  __int128 *p_buf;
  _QWORD *v26;
  _QWORD v27[3];
  char v28;
  __int128 buf;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Migrating face %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x2810000000;
  v31 = &unk_1B75A3F6B;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke;
  v21[3] = &unk_1E6BD1628;
  v11 = v8;
  v22 = v11;
  v23 = self;
  v12 = v6;
  v24 = v12;
  p_buf = &buf;
  v26 = v27;
  -[NTKBundleComplicationFaceMigrator _enumerateMigratableComplicationsOnFace:withBlock:](self, "_enumerateMigratableComplicationsOnFace:withBlock:", v12, v21);
  queue = self->_queue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_3;
  block[3] = &unk_1E6BCDF88;
  v19 = &buf;
  v20 = v27;
  v17 = v12;
  v18 = v7;
  v14 = v7;
  v15 = v12;
  dispatch_group_notify(v11, queue, block);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&buf, 8);

}

void __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  dispatch_group_enter(v5);
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_2;
  v10[3] = &unk_1E6BD1600;
  v12 = *(_OWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "_migrateFace:slot:complication:completion:", v8, v7, v6, v10);

}

void __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_2(uint64_t a1, int a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__NTKBundleComplicationFaceMigrator_migrateFace_completion___block_invoke_3(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v6 = 138412546;
    v7 = v4;
    v8 = 1024;
    v9 = v2;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Finished migrating face %@, madeChanges=%d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)migrateFaces:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_group_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  dispatch_group_t v19;
  NTKBundleComplicationFaceMigrator *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2048;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Starting face batch migration %@ with %lu faces", buf, 0x16u);

  }
  v11 = dispatch_group_create();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke;
  v18[3] = &unk_1E6BD1678;
  v19 = v11;
  v20 = self;
  v21 = v8;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_8;
  v16[3] = &unk_1E6BCDF60;
  v17 = v7;
  v15 = v7;
  dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v16);

}

void __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_2;
  v6[3] = &unk_1E6BD1650;
  v7 = v3;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "migrateFace:completion:", v5, v6);

}

void __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Finished face %@ in batch %@", (uint8_t *)&v5, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __61__NTKBundleComplicationFaceMigrator_migrateFaces_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enumerateMigratableComplicationsOnFace:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NTKBundleComplicationFaceMigrator *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__NTKBundleComplicationFaceMigrator__enumerateMigratableComplicationsOnFace_withBlock___block_invoke;
  v10[3] = &unk_1E6BD16A0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "enumerateComplicationSlotsWithBlock:", v10);

}

void __87__NTKBundleComplicationFaceMigrator__enumerateMigratableComplicationsOnFace_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "complication");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_shouldAttemptToMigrateComplicationType:", objc_msgSend(v3, "complicationType")))(*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)_shouldAttemptToMigrateComplicationType:(unint64_t)a3
{
  return (a3 > 0x38) | (0xFFFFFF7FFFFFFEuLL >> a3) & 1;
}

- (void)_migrateFace:(id)a3 slot:(id)a4 complication:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NTKBundleComplicationMigrationProvider *migrationProvider;
  void *v29;
  NSObject *v30;
  NTKBundleComplicationFaceMigrator *v31;
  void *v32;
  _QWORD v33[4];
  void *v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(id, uint64_t, _QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(v10, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsWidgetMigration");

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v10, "rankedComplicationFamiliesForSlot:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "complicationType");
    objc_msgSend(v10, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:forDevice:](NTKWidgetComplicationMigrationDefines, "hasMigratedComplicationType:forDevice:", v17, v18);

    if (v19)
    {
      v31 = self;
      v32 = v16;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = v16;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v40;
        while (2)
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v40 != v23)
              objc_enumerationMutation(v20);
            +[NTKWidgetComplicationMigrationDefines migrateComplication:forFamily:](NTKWidgetComplicationMigrationDefines, "migrateComplication:forFamily:", v12, objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v24), "integerValue"));
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v29 = (void *)v25;
              objc_msgSend(v10, "setComplication:forSlot:", v25, v11);
              _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                v44 = v10;
                v45 = 2112;
                v46 = v11;
                v47 = 2112;
                v48 = v12;
                v49 = 2112;
                v50 = v29;
                _os_log_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Performed defined migration on face %@ slot %@ of %@ to %@", buf, 0x2Au);
              }

              v13[2](v13, 1, 0);
              v16 = v32;
              goto LABEL_17;
            }
            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v22)
            continue;
          break;
        }
      }

      self = v31;
      v16 = v32;
    }
    objc_msgSend(v10, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBundleComplicationMigrationFallbackRequest requestWithComplication:families:device:](NTKBundleComplicationMigrationFallbackRequest, "requestWithComplication:families:device:", v12, v16, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    migrationProvider = self->_migrationProvider;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke;
    v33[3] = &unk_1E6BD16F0;
    v34 = v27;
    v38 = v13;
    v35 = v10;
    v36 = v11;
    v37 = v12;
    v20 = v27;
    -[NTKBundleComplicationMigrationProvider serviceRequest:completion:](migrationProvider, "serviceRequest:completion:", v20, v33);

    v29 = v34;
LABEL_17:

  }
  else
  {
    v13[2](v13, 0, 0);
  }

}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2;
  block[3] = &unk_1E6BD16C8;
  v10 = v5;
  v11 = v6;
  v12 = a1[4];
  v16 = a1[8];
  v13 = a1[5];
  v14 = a1[6];
  v15 = a1[7];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setComplication:forSlot:", v2, *(_QWORD *)(a1 + 64));
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 64);
      v6 = *(_QWORD *)(a1 + 72);
      v8 = 138413058;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationFaceMigrator: Performed remote migration on face %@ slot %@ of %@ to %@", (uint8_t *)&v8, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 40), v7);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__NTKBundleComplicationFaceMigrator__migrateFace_slot_complication_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationFaceMigrator: Request %@ completed with error %@", (uint8_t *)&v5, 0x16u);
}

@end
