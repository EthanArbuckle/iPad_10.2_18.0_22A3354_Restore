@implementation EMQuery

- (Class)targetClass
{
  return self->_targetClass;
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 targetClassOptions:(id)a7 label:(id)a8
{
  return -[EMQuery initWithTargetClass:predicate:sortDescriptors:limit:queryOptions:targetClassOptions:label:](self, "initWithTargetClass:predicate:sortDescriptors:limit:queryOptions:targetClassOptions:label:", a3, a4, a5, 0, a6, a7, a8);
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 queryOptions:(unint64_t)a7 targetClassOptions:(id)a8 label:(id)a9
{
  return -[EMQuery initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:](self, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 label:(id)a7
{
  return -[EMQuery initWithTargetClass:predicate:sortDescriptors:queryOptions:targetClassOptions:label:](self, "initWithTargetClass:predicate:sortDescriptors:queryOptions:targetClassOptions:label:", a3, a4, a5, a6, 0, a7);
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 suggestion:(id)a6 limit:(int64_t)a7 queryOptions:(unint64_t)a8 targetClassOptions:(id)a9 label:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  EMQuery *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  unint64_t v29;

  v16 = a6;
  v17 = a9;
  v18 = a10;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __112__EMQuery_initWithTargetClass_predicate_sortDescriptors_suggestion_limit_queryOptions_targetClassOptions_label___block_invoke;
  v24[3] = &unk_1E70F55B8;
  v28 = a7;
  v29 = a8;
  v25 = v16;
  v26 = v17;
  v27 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:builder:](self, "initWithTargetClass:predicate:sortDescriptors:builder:", a3, a4, a5, v24);

  return v22;
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[EMQuery initWithTargetClass:predicate:sortDescriptors:queryOptions:label:](self, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", a3, a4, a5, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  EMQuery *v4;
  BOOL v5;

  v4 = (EMQuery *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[EMQuery _isEqualToQuery:](self, "_isEqualToQuery:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToQuery:(id)a3
{
  id v4;
  objc_class *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v4 = a3;
  v5 = -[EMQuery targetClass](self, "targetClass");
  if (v5 != (objc_class *)objc_msgSend(v4, "targetClass"))
    goto LABEL_17;
  v6 = -[EMQuery queryOptions](self, "queryOptions");
  if (v6 != objc_msgSend(v4, "queryOptions"))
    goto LABEL_17;
  -[EMQuery predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    -[EMQuery sortDescriptors](self, "sortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {
      v13 = -[EMQuery limit](self, "limit");
      if (v13 == objc_msgSend(v4, "limit"))
      {
        -[EMQuery suggestion](self, "suggestion");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22 || (objc_msgSend(v4, "suggestion"), (v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[EMQuery suggestion](self, "suggestion");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "suggestion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v14, "isEqual:", v15);

          v16 = (void *)v22;
          v17 = v21;
          if (v22)
            goto LABEL_15;
        }
        else
        {
          v20 = 0;
          v17 = 1;
        }
        v16 = (void *)v20;
LABEL_15:

        if (v17)
        {
          -[EMQuery bundlePredicate](self, "bundlePredicate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundlePredicate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = EFObjectsAreEqual();
          goto LABEL_12;
        }
LABEL_17:
        v18 = 0;
        goto LABEL_18;
      }
    }

  }
  v18 = 0;
LABEL_12:

LABEL_18:
  return v18;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  NSStringFromClass(-[EMQuery targetClass](self, "targetClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_targetClass"));

  -[EMQuery predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_predicate"));

  -[EMQuery sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_sortDescriptors"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[EMQuery limit](self, "limit"), CFSTR("EFPropertyKey_limit"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[EMQuery queryOptions](self, "queryOptions"), CFSTR("EFPropertyKey_queryOptions"));
  -[EMQuery targetClassOptions](self, "targetClassOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_targetClassOptions"));

  -[EMQuery label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_label"));

  -[EMQuery suggestion](self, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_suggestion"));

  -[EMQuery bundlePredicate](self, "bundlePredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_bundlePredicate"));

}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)targetClassOptions
{
  return self->_targetClassOptions;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(-[EMQuery targetClass](self, "targetClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EMQuery predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EMQuery sortDescriptors](self, "sortDescriptors", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v9 = 33 * v4 + v6 + 1089;
  if (v8)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "hash");

        v9 = v13 + 33 * v9;
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v14 = -[EMQuery limit](self, "limit");
  v15 = -[EMQuery queryOptions](self, "queryOptions");
  -[EMQuery suggestion](self, "suggestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  -[EMQuery bundlePredicate](self, "bundlePredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  if (v14 < 0)
    v14 = -v14;

  return v19 + 33 * (33 * (33 * (v14 + 33 * v9) + v15) + v17);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePredicate, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_targetClassOptions, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_targetClass, 0);
}

- (EMQuery)initWithCoder:(id)a3
{
  NSString *v4;
  Class v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  id v17;
  EMQuery *v18;
  EMQuery *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  Class v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v20 = self;
  objc_msgSend(v22, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_targetClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);

  objc_msgSend(v22, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_predicate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_sortDescriptors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (+[EMQuery _isValidSortDescriptor:forTargetClass:](EMQuery, "_isValidSortDescriptor:forTargetClass:", v15, v5))
          {
            objc_msgSend(v15, "allowEvaluation");
            objc_msgSend(v10, "addObject:", v15);
          }
          else
          {
            +[EMQuery log](EMQuery, "log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v30 = v15;
              v31 = 2114;
              v32 = v5;
              _os_log_fault_impl(&dword_1B99BB000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is not a valid sort descriptor for target class %{public}@", buf, 0x16u);
            }

            __debugbreak();
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v12);
    }

  }
  else
  {
    v10 = 0;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __25__EMQuery_initWithCoder___block_invoke;
  v23[3] = &unk_1E70F55E0;
  v17 = v22;
  v24 = v17;
  v18 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:builder:](v20, "initWithTargetClass:predicate:sortDescriptors:builder:", v5, v21, v10, v23);

  return v18;
}

+ (BOOL)_isValidSortDescriptor:(id)a3 forTargetClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  objc_msgSend(v5, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSortDescriptorsLock);
    objc_msgSend((id)sValidSortDescriptorKeyPathsByClass, "objectForKey:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (void)addValidSortDescriptorKeyPaths:(id)a3 forTargetClass:(Class)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sSortDescriptorsLock);
  v5 = (void *)sValidSortDescriptorKeyPathsByClass;
  if (!sValidSortDescriptorKeyPathsByClass)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sValidSortDescriptorKeyPathsByClass;
    sValidSortDescriptorKeyPathsByClass = v6;

    v5 = (void *)sValidSortDescriptorKeyPathsByClass;
  }
  objc_msgSend(v5, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)sValidSortDescriptorKeyPathsByClass;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v9, "setObject:forKey:", v10, a4);

  }
  objc_msgSend((id)sValidSortDescriptorKeyPathsByClass, "objectForKey:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __14__EMQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1)
    dispatch_once(&log_onceToken_32, block);
  return (OS_os_log *)(id)log_log_32;
}

void __14__EMQuery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;

}

void __112__EMQuery_initWithTargetClass_predicate_sortDescriptors_suggestion_limit_queryOptions_targetClassOptions_label___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSuggestion:", a1[4]);
  objc_msgSend(v3, "setLimit:", a1[7]);
  objc_msgSend(v3, "setQueryOptions:", a1[8]);
  objc_msgSend(v3, "setTargetClassOptions:", a1[5]);
  objc_msgSend(v3, "setLabel:", a1[6]);

}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 builder:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, EMQuery *);
  EMQuery *v14;
  EMQuery *v15;
  uint64_t v16;
  NSPredicate *predicate;
  uint64_t v18;
  NSArray *sortDescriptors;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, EMQuery *))a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMQuery.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  if ((unint64_t)objc_msgSend(v12, "count") >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMQuery.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortDescriptors.count <= 2"));

    if (v13)
      goto LABEL_5;
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMQuery.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)EMQuery;
  v14 = -[EMQuery init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_targetClass, a3);
    v16 = objc_msgSend(v11, "copy");
    predicate = v15->_predicate;
    v15->_predicate = (NSPredicate *)v16;

    v18 = objc_msgSend(v12, "copy");
    sortDescriptors = v15->_sortDescriptors;
    v15->_sortDescriptors = (NSArray *)v18;

    v13[2](v13, v15);
  }

  return v15;
}

- (EMQuery)queryWithPredicate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EMQuery queryWithTargetClass:predicate:](self, "queryWithTargetClass:predicate:", -[EMQuery targetClass](self, "targetClass"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMQuery *)v5;
}

- (EMQuery)queryWithTargetClass:(Class)a3 predicate:(id)a4
{
  id v6;
  unint64_t v7;
  EMQuery *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  EMQuery *v14;

  v6 = a4;
  v7 = -[EMQuery queryOptions](self, "queryOptions");
  v8 = [EMQuery alloc];
  -[EMQuery sortDescriptors](self, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQuery suggestion](self, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EMQuery limit](self, "limit");
  -[EMQuery targetClassOptions](self, "targetClassOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQuery label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:](v8, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", a3, v6, v9, v10, v11, v7 & 0xFFFFFFFFFFFFFFFDLL, v12, v13);

  return v14;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;

  -[EMQuery predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[EMMessageListItemPredicates isValidPredicate:forClass:](EMMessageListItemPredicates, "isValidPredicate:forClass:", v3, -[EMQuery targetClass](self, "targetClass"));

  return v4;
}

void __25__EMQuery_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_suggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSuggestion:", v3);

  objc_msgSend(v15, "setLimit:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_limit")));
  objc_msgSend(v15, "setQueryOptions:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_queryOptions")));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_targetClassOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTargetClassOptions:", v12);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", v13);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_bundlePredicate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBundlePredicate:", v14);

}

- (NSString)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[EMQuery label](self, "label");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E70F6E90;
  NSStringFromClass(-[EMQuery targetClass](self, "targetClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQuery predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQuery sortDescriptors](self, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQuery suggestion](self, "suggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p> %@ \n\tresult class:%@ \n\tpredicate:%@ \n\tsort descriptors:%@ \n\tsuggestion:%@ \n\tqueryOptions:%lu\n\tlimit:%ld"), v3, self, v6, v15, v8, v10, v11, -[EMQuery queryOptions](self, "queryOptions"), -[EMQuery limit](self, "limit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)setTargetClass:(Class)a3
{
  objc_storeStrong((id *)&self->_targetClass, a3);
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setQueryOptions:(unint64_t)a3
{
  self->_queryOptions = a3;
}

- (void)setTargetClassOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSPredicate)bundlePredicate
{
  return self->_bundlePredicate;
}

- (void)setBundlePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePredicate, a3);
}

@end
