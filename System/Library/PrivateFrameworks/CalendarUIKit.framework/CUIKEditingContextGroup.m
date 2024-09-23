@implementation CUIKEditingContextGroup

- (CUIKEditingContextGroup)initWithObjectGroup:(id)a3
{
  id v4;
  CUIKEditingContextGroup *v5;
  CUIKEditingContextGroup *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKEditingContextGroup;
  v5 = -[CUIKEditingContextGroup init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CUIKEditingContextGroup setObjectGroup:](v5, "setObjectGroup:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingContextGroup setAdditionalObjectGroups:](v6, "setAdditionalObjectGroups:", v7);

  }
  return v6;
}

- (void)addContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  -[CUIKEditingContextGroup openContexts](self, "openContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingContextGroup setOpenContexts:](self, "setOpenContexts:", v6);

  }
  objc_msgSend(v4, "setGroup:", self);
  objc_msgSend(v4, "_markAsOpen");
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContextGroup addContext:].cold.1();

  -[CUIKEditingContextGroup openContexts](self, "openContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)removeContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "_markAsClosed");
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingContextGroup removeContext:].cold.1();

  -[CUIKEditingContextGroup openContexts](self, "openContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (id)activeEditingContexts
{
  void *v2;
  void *v3;

  -[CUIKEditingContextGroup openContexts](self, "openContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __48__CUIKEditingContextGroup_activeEditingContexts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (id)activeEditingContextsExcludingContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CUIKEditingContextGroup openContexts](self, "openContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CUIKEditingContextGroup_activeEditingContextsExcludingContext___block_invoke;
  v9[3] = &unk_1E6EB6E60;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__CUIKEditingContextGroup_activeEditingContextsExcludingContext___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
    return 0;
  else
    return objc_msgSend(a2, "isActive");
}

- (void)specifySpanDecisionForGroup:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContextGroup setSpanDecisionAsNumber:](self, "setSpanDecisionAsNumber:", v4);

}

- (void)unspecifySpanDecisionForGroup
{
  -[CUIKEditingContextGroup setSpanDecisionAsNumber:](self, "setSpanDecisionAsNumber:", 0);
}

- (BOOL)spanDecisionForGroupIsSet
{
  void *v2;
  BOOL v3;

  -[CUIKEditingContextGroup spanDecisionAsNumber](self, "spanDecisionAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)spanDecisionForGroup
{
  void *v2;
  unint64_t v3;

  -[CUIKEditingContextGroup spanDecisionAsNumber](self, "spanDecisionAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)specifyEarlyCommitDecisionForGroup:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContextGroup setEarlyCommitDecisionAsNumber:](self, "setEarlyCommitDecisionAsNumber:", v4);

}

- (void)unspecifyEarlyCommitDecisionForGroup
{
  -[CUIKEditingContextGroup setEarlyCommitDecisionAsNumber:](self, "setEarlyCommitDecisionAsNumber:", 0);
}

- (BOOL)earlyCommitDecisionForGroupIsSet
{
  void *v2;
  BOOL v3;

  -[CUIKEditingContextGroup earlyCommitDecisionAsNumber](self, "earlyCommitDecisionAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)earlyCommitDecisionForGroup
{
  void *v2;
  unint64_t v3;

  -[CUIKEditingContextGroup earlyCommitDecisionAsNumber](self, "earlyCommitDecisionAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)objectsToCommit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[CUIKEditingContextGroup objectGroup](self, "objectGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CUIKEditingContextGroup additionalObjectGroups](self, "additionalObjectGroups", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "objects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)trackedObjects
{
  void *v2;
  void *v3;

  -[CUIKEditingContextGroup objectGroup](self, "objectGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)originalObjects
{
  void *v2;
  void *v3;

  -[CUIKEditingContextGroup objectGroup](self, "objectGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addAdditionalObjects:(id)a3
{
  CUIKObjectGroup *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[CUIKObjectGroup initWithObjects:]([CUIKObjectGroup alloc], "initWithObjects:", v6);
    -[CUIKEditingContextGroup additionalObjectGroups](self, "additionalObjectGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (id)newIdentifierForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CUIKEditingContextGroup objectGroup](self, "objectGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shiftedOccurrencePreviouslySpawnedByIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)oldObject:(id)a3 didUpdateTo:(id)a4
{
  id v6;
  id v7;
  void *v8;

  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    -[CUIKEditingContextGroup objectGroup](self, "objectGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "newObject:spawnedFromObject:", v6, v7);

  }
  return 0;
}

- (BOOL)isTestObserver
{
  return 0;
}

- (CUIKObjectGroup)objectGroup
{
  return (CUIKObjectGroup *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)openContexts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOpenContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)setEventStore:(id)a3
{
  objc_storeWeak((id *)&self->_eventStore, a3);
}

- (NSMutableArray)additionalObjectGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalObjectGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)spanDecisionAsNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSpanDecisionAsNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)earlyCommitDecisionAsNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEarlyCommitDecisionAsNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyCommitDecisionAsNumber, 0);
  objc_storeStrong((id *)&self->_spanDecisionAsNumber, 0);
  objc_storeStrong((id *)&self->_additionalObjectGroups, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_openContexts, 0);
  objc_storeStrong((id *)&self->_objectGroup, 0);
}

- (void)addContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Adding context %@ to group %@");
}

- (void)removeContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1B8A6A000, v0, v1, "Removing context %@ from group %@");
}

@end
