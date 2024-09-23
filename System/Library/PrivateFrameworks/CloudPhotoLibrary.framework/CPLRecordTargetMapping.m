@implementation CPLRecordTargetMapping

- (CPLRecordTargetMapping)init
{
  CPLRecordTargetMapping *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *targets;
  NSMutableDictionary *v5;
  NSMutableDictionary *targetsFromOtherScopedIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLRecordTargetMapping;
  v2 = -[CPLRecordTargetMapping init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    targets = v2->_targets;
    v2->_targets = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    targetsFromOtherScopedIdentifier = v2->_targetsFromOtherScopedIdentifier;
    v2->_targetsFromOtherScopedIdentifier = v5;

  }
  return v2;
}

- (void)_setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4 isUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableSet *updatedScopedIdentifiers;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  NSMutableSet *scopedIdentifiersWithUnknownTargets;
  NSMutableSet *v19;
  NSMutableSet *v20;
  _BOOL4 v21;
  id v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v22 = v9;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_targets, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isEqual:", v8) & 1) != 0)
    goto LABEL_23;
  if (v5)
  {
    updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
    if (updatedScopedIdentifiers)
      -[NSMutableSet addObject:](updatedScopedIdentifiers, "addObject:", v9);
  }
  objc_msgSend(v11, "otherScopedIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "otherScopedIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = v14 != 0;
  if (!v13 || !v14)
  {
    if (!v13)
      goto LABEL_12;
LABEL_11:
    -[NSMutableDictionary removeObjectForKey:](self->_targetsFromOtherScopedIdentifier, "removeObjectForKey:", v13);
    v16 = 1;
    goto LABEL_12;
  }
  if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
    goto LABEL_11;
  v16 = 0;
LABEL_12:
  v17 = objc_msgSend(v8, "targetState");
  scopedIdentifiersWithUnknownTargets = self->_scopedIdentifiersWithUnknownTargets;
  if (v17)
  {
    -[NSMutableSet removeObject:](scopedIdentifiersWithUnknownTargets, "removeObject:", v9);
  }
  else if (scopedIdentifiersWithUnknownTargets)
  {
    -[NSMutableSet addObject:](scopedIdentifiersWithUnknownTargets, "addObject:", v9);
  }
  else
  {
    v19 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v22, 1);
    v20 = self->_scopedIdentifiersWithUnknownTargets;
    self->_scopedIdentifiersWithUnknownTargets = v19;

    v9 = v22;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_targets, "setObject:forKeyedSubscript:", v8, v9);
  if (v15)
    v21 = v16;
  else
    v21 = 0;
  if (v21)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_targetsFromOtherScopedIdentifier, "setObject:forKeyedSubscript:", v8, v15);

LABEL_23:
}

- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  -[CPLRecordTargetMapping _setTarget:forRecordWithScopedIdentifier:isUpdate:](self, "_setTarget:forRecordWithScopedIdentifier:isUpdate:", a3, a4, 1);
}

- (void)addKnownTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  -[CPLRecordTargetMapping _setTarget:forRecordWithScopedIdentifier:isUpdate:](self, "_setTarget:forRecordWithScopedIdentifier:isUpdate:", a3, a4, 0);
}

- (id)targetForRecordWithScopedIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_targets, "objectForKeyedSubscript:", a3);
}

- (id)targetForRecordWithOtherScopedIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_targetsFromOtherScopedIdentifier, "objectForKeyedSubscript:", a3);
}

- (void)enumerateTargetsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableDictionary allKeys](self->_targets, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CPLRecordTargetMapping_enumerateTargetsWithBlock___block_invoke;
  v7[3] = &unk_1E60D8928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (BOOL)hasUnknownTargets
{
  return -[NSMutableSet count](self->_scopedIdentifiersWithUnknownTargets, "count") != 0;
}

- (void)enumerateUnknownTargetsWithBlock:(id)a3
{
  id v5;
  NSMutableSet *scopedIdentifiersWithUnknownTargets;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  scopedIdentifiersWithUnknownTargets = self->_scopedIdentifiersWithUnknownTargets;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CPLRecordTargetMapping_enumerateUnknownTargetsWithBlock___block_invoke;
  v8[3] = &unk_1E60D8950;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  -[NSMutableSet enumerateObjectsUsingBlock:](scopedIdentifiersWithUnknownTargets, "enumerateObjectsUsingBlock:", v8);

}

- (NSArray)allTargetScopedIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_targets, "allKeys");
}

- (NSArray)unknownTargetScopedIdentifiers
{
  return (NSArray *)-[NSMutableSet allObjects](self->_scopedIdentifiersWithUnknownTargets, "allObjects");
}

- (void)startTrackingUpdates
{
  NSMutableSet *v3;
  NSMutableSet *updatedScopedIdentifiers;

  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
  self->_updatedScopedIdentifiers = v3;

}

- (BOOL)hasUpdatedTargets
{
  return -[NSMutableSet count](self->_updatedScopedIdentifiers, "count") != 0;
}

- (void)enumerateUpdatedTargetsWithBlock:(id)a3
{
  NSMutableSet *updatedScopedIdentifiers;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v6 = a3;
  if (-[NSMutableSet count](self->_updatedScopedIdentifiers, "count"))
  {
    updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CPLRecordTargetMapping_enumerateUpdatedTargetsWithBlock___block_invoke;
    v7[3] = &unk_1E60D8950;
    v7[4] = self;
    v9 = a2;
    v8 = v6;
    -[NSMutableSet enumerateObjectsUsingBlock:](updatedScopedIdentifiers, "enumerateObjectsUsingBlock:", v7);

  }
}

- (NSSet)updatedTargetScopedIdentifiers
{
  return (NSSet *)self->_updatedScopedIdentifiers;
}

- (NSString)updatedTargetsDescription
{
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v16;
  void *v17;
  void *v18;
  SEL v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_updatedScopedIdentifiers, "count"))
  {
    v19 = a2;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_updatedScopedIdentifiers, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_updatedScopedIdentifiers;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_targets, "objectForKeyedSubscript:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            if (!_CPLSilentLogging)
            {
              __CPLGenericOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v25 = v10;
                _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Target for %@ should have been updated and thus present", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v19, self, v18, 252, CFSTR("Target for %@ should have been updated and thus present"), v10);

            abort();
          }
          v12 = (void *)v11;
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: %@"), v10, v11);
          objc_msgSend(v4, "addObject:", v13);

        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("no updates");
  }
  return (NSString *)v14;
}

- (NSString)targetDescriptions
{
  void *v3;
  NSMutableDictionary *targets;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  CPLRecordTargetMapping *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_targets, "count"));
  targets = self->_targets;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__CPLRecordTargetMapping_targetDescriptions__block_invoke;
  v11 = &unk_1E60D8978;
  v12 = v3;
  v13 = self;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](targets, "enumerateKeysAndObjectsUsingBlock:", &v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"), v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedIdentifiersWithUnknownTargets, 0);
  objc_storeStrong((id *)&self->_updatedScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetsFromOtherScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

void __44__CPLRecordTargetMapping_targetDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  int v10;
  const char *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = a2;
  v9 = [v6 alloc];
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", v8);
  v11 = "";
  if (v10)
    v11 = " (updated)";
  v12 = (id)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ = %@%s"), v8, v7, v11);

  objc_msgSend(v5, "addObject:", v12);
}

void __59__CPLRecordTargetMapping_enumerateUpdatedTargetsWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Target for %@ should have been updated and thus present", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    v8 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 235, CFSTR("Target for %@ should have been updated and thus present"), v10);

    abort();
  }
  v4 = (void *)v3;
  (*(void (**)(void))(a1[5] + 16))();

}

void __59__CPLRecordTargetMapping_enumerateUnknownTargetsWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Target for %@ should be present", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    v8 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 208, CFSTR("Target for %@ should be present"), v10);

    abort();
  }
  v4 = (void *)v3;
  (*(void (**)(void))(a1[5] + 16))();

}

void __52__CPLRecordTargetMapping_enumerateTargetsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
