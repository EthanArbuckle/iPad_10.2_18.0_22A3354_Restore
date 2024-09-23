@implementation _EDThreadMigrationState

- (_EDThreadMigrationState)init
{
  _EDThreadMigrationState *v2;
  NSCountedSet *v3;
  NSCountedSet *objectIDsToMigrate;
  NSCountedSet *v5;
  NSCountedSet *recentlyMigratedObjectIDs;
  NSCountedSet *v7;
  NSCountedSet *recentlyDeletedObjectIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_EDThreadMigrationState;
  v2 = -[_EDThreadMigrationState init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    objectIDsToMigrate = v2->_objectIDsToMigrate;
    v2->_objectIDsToMigrate = v3;

    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    recentlyMigratedObjectIDs = v2->_recentlyMigratedObjectIDs;
    v2->_recentlyMigratedObjectIDs = v5;

    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    recentlyDeletedObjectIDs = v2->_recentlyDeletedObjectIDs;
    v2->_recentlyDeletedObjectIDs = v7;

    -[_EDThreadMigrationState setState:](v2, "setState:", 0);
  }
  return v2;
}

- (unint64_t)unmigratedCount
{
  return -[NSCountedSet count](self->_objectIDsToMigrate, "count");
}

- (BOOL)isEmpty
{
  return -[_EDThreadMigrationState unmigratedCount](self, "unmigratedCount") == 0;
}

- (BOOL)isFullyMigrated
{
  _BOOL4 v3;

  v3 = -[_EDThreadMigrationState isEmpty](self, "isEmpty");
  if (v3)
  {
    if (-[NSCountedSet count](self->_recentlyMigratedObjectIDs, "count"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = -[NSCountedSet count](self->_recentlyDeletedObjectIDs, "count") == 0;
  }
  return v3;
}

- (BOOL)isInProgress
{
  unint64_t v3;

  v3 = -[_EDThreadMigrationState state](self, "state");
  if (v3 != 1)
    LOBYTE(v3) = -[_EDThreadMigrationState state](self, "state") == 2;
  return v3;
}

- (void)reset
{
  -[_EDThreadMigrationState setState:](self, "setState:", 0);
  -[_EDThreadMigrationState _removeAllObjectIDs](self, "_removeAllObjectIDs");
  ++self->_generation;
}

- (void)fail
{
  -[_EDThreadMigrationState setState:](self, "setState:", 4);
  -[_EDThreadMigrationState _removeAllObjectIDs](self, "_removeAllObjectIDs");
}

- (void)cancel
{
  -[_EDThreadMigrationState setState:](self, "setState:", 5);
  -[_EDThreadMigrationState _removeAllObjectIDs](self, "_removeAllObjectIDs");
}

- (void)_removeAllObjectIDs
{
  -[NSCountedSet removeAllObjects](self->_objectIDsToMigrate, "removeAllObjects");
  -[NSCountedSet removeAllObjects](self->_recentlyMigratedObjectIDs, "removeAllObjects");
  -[NSCountedSet removeAllObjects](self->_recentlyDeletedObjectIDs, "removeAllObjects");
}

- (BOOL)isRecentlyMigrated:(id)a3
{
  return -[NSCountedSet containsObject:](self->_recentlyMigratedObjectIDs, "containsObject:", a3);
}

- (id)nextBatch
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSCountedSet count](self->_objectIDsToMigrate, "count"))
  {
    while ((unint64_t)objc_msgSend(v3, "count") <= 0x1F3
         && -[NSCountedSet count](self->_objectIDsToMigrate, "count"))
    {
      -[NSCountedSet anyObject](self->_objectIDsToMigrate, "anyObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);
      -[NSCountedSet removeObject:](self->_objectIDsToMigrate, "removeObject:", v4);
      -[NSCountedSet addObject:](self->_recentlyMigratedObjectIDs, "addObject:", v4);

    }
  }
  return v3;
}

- (void)addObjectIDs:(id)a3
{
  -[NSCountedSet addObjectsFromArray:](self->_objectIDsToMigrate, "addObjectsFromArray:", a3);
}

- (void)removeObjectIDs:(id)a3
{
  -[NSCountedSet ef_removeObjectsInArray:](self->_objectIDsToMigrate, "ef_removeObjectsInArray:", a3);
}

- (void)removeMigratedObjectIDs:(id)a3
{
  -[NSCountedSet ef_removeObjectsInArray:](self->_recentlyMigratedObjectIDs, "ef_removeObjectsInArray:", a3);
}

- (void)addDeletedObjectIDs:(id)a3
{
  -[NSCountedSet addObjectsFromArray:](self->_recentlyDeletedObjectIDs, "addObjectsFromArray:", a3);
}

- (void)removeDeletedObjectIDs:(id)a3
{
  -[NSCountedSet ef_removeObjectsInArray:](self->_recentlyDeletedObjectIDs, "ef_removeObjectsInArray:", a3);
}

- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7
{
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_logIdentifier_logAction_logCount___block_invoke;
  v8[3] = &unk_1E94A20C8;
  v8[4] = self;
  v8[5] = a4;
  return -[_EDThreadMigrationState _verifyIsMigratingGeneration:stateVerifier:logIdentifier:logAction:logCount:](self, "_verifyIsMigratingGeneration:stateVerifier:logIdentifier:logAction:logCount:", a3, v8, a5, a6, a7);
}

- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 orState:(unint64_t)a5 logIdentifier:(id)a6 logAction:(id)a7 logCount:(unint64_t)a8
{
  _QWORD v9[7];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_orState_logIdentifier_logAction_logCount___block_invoke;
  v9[3] = &unk_1E94A20F0;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  return -[_EDThreadMigrationState _verifyIsMigratingGeneration:stateVerifier:logIdentifier:logAction:logCount:](self, "_verifyIsMigratingGeneration:stateVerifier:logIdentifier:logAction:logCount:", a3, v9, a6, a7, a8);
}

- (BOOL)_verifyIsMigratingGeneration:(unint64_t)a3 stateVerifier:(id)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7
{
  uint64_t (**v12)(_QWORD);
  id v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  unint64_t v18;
  const __CFString *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = (uint64_t (**)(_QWORD))a4;
  v13 = a5;
  v14 = a6;
  if (-[_EDThreadMigrationState generation](self, "generation") != a3)
  {
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134219010;
      v21 = v13;
      v22 = 2048;
      v23 = a3;
      v24 = 2114;
      v25 = v14;
      v26 = 2048;
      v27 = a7;
      v28 = 2048;
      v29 = -[_EDThreadMigrationState generation](self, "generation");
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%p[%lu]: %{public}@ for %lu threads due to generation change (to %lu)", (uint8_t *)&v20, 0x34u);
    }
    goto LABEL_7;
  }
  if ((v12[2](v12) & 1) == 0)
  {
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = -[_EDThreadMigrationState state](self, "state");
      if (v18 - 1 > 4)
        v19 = CFSTR("Not Started");
      else
        v19 = off_1E94A2110[v18 - 1];
      v20 = 134219010;
      v21 = v13;
      v22 = 2048;
      v23 = a3;
      v24 = 2114;
      v25 = v14;
      v26 = 2048;
      v27 = a7;
      v28 = 2114;
      v29 = (unint64_t)v19;
      _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "%p[%lu]: %{public}@ for %lu threads due to wrong state: %{public}@", (uint8_t *)&v20, 0x34u);
    }
LABEL_7:

    v15 = 0;
    goto LABEL_8;
  }
  v15 = 1;
LABEL_8:

  return v15;
}

- (EFCancelable)migrationCancelable
{
  return self->_migrationCancelable;
}

- (void)setMigrationCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_migrationCancelable, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationCancelable, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_recentlyMigratedObjectIDs, 0);
  objc_storeStrong((id *)&self->_objectIDsToMigrate, 0);
}

@end
