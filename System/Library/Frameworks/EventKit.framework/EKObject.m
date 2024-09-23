@implementation EKObject

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__validationContext, 0);
  objc_storeStrong((id *)&self->__cachedValues, 0);
  objc_storeStrong((id *)&self->_additionalMeltedObjects, 0);
  objc_storeStrong((id *)&self->_additionalFrozenProperties, 0);
  objc_storeStrong((id *)&self->_cachedMeltedObjects, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_persistentObject, 0);
  objc_storeStrong((id *)&self->__cachedMeltedObjects, 0);
}

- (id)cachedValueForKey:(id)a3 populateBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__18;
  v25 = __Block_byref_object_dispose__18;
  v26 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke;
  v18[3] = &unk_1E4785298;
  v20 = &v21;
  v18[4] = self;
  v9 = v6;
  v19 = v9;
  -[EKObject _performWithLock:](self, "_performWithLock:", v18);
  v10 = (void *)v22[5];
  if (v7 && !v10)
  {
    v7[2](v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v22[5];
    v22[5] = v11;

    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke_2;
    v15[3] = &unk_1E47850C8;
    v15[4] = self;
    v16 = v9;
    v17 = &v21;
    -[EKObject _performWithLock:](self, "_performWithLock:", v15);

    v10 = (void *)v22[5];
  }
  v13 = v10;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  EKObject *v4;
  EKObject *v5;
  EKObject *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (EKObject *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[EKObject persistentObject](self, "persistentObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject persistentObject](v6, "persistentObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (EKObjectID)objectID
{
  void *v2;
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKObjectID *)v3;
}

- (id)meltedAndCachedSingleRelationObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](self, "frozenOrMeltedCachedSingleRelationObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject eventStore](self, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meltedObjectInStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !v7 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKObject(Shared) meltedAndCachedSingleRelationObjectForKey:].cold.1();
  if (objc_msgSend(v5, "isFrozen"))
    -[EKObject setCachedMeltedObject:forSingleValueKey:](self, "setCachedMeltedObject:forSingleValueKey:", v7, v4);

  return v7;
}

- (EKEventStore)eventStore
{
  void *v2;
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEventStore *)v3;
}

- (EKPersistentObject)persistentObject
{
  return self->_persistentObject;
}

- (id)frozenOrMeltedCachedSingleRelationObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[EKObject cachedMeltedObjectForSingleValueKey:](self, "cachedMeltedObjectForSingleValueKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)cachedMeltedObjectForSingleValueKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__EKObject_Shared__cachedMeltedObjectForSingleValueKey___block_invoke;
  v8[3] = &unk_1E4785298;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[EKObject _performWithLock:](self, "_performWithLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_performWithLock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(-[EKObject _lock](self, "_lock"));
  v4[2](v4);

  os_unfair_lock_unlock(-[EKObject _lock](self, "_lock"));
}

- (os_unfair_lock_s)_lock
{
  unsigned int v2;

  v2 = self;
  if (GetSharedLockForIndex_onceToken != -1)
    dispatch_once(&GetSharedLockForIndex_onceToken, &__block_literal_global_257);
  return (os_unfair_lock_s *)&GetSharedLockForIndex_sharedLocks
       + ((((v2 >> 4) ^ (v2 >> 7)) ^ (v2 >> 10)) & 7);
}

void __56__EKObject_Shared__cachedMeltedObjectForSingleValueKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)_cachedMeltedObjects
{
  return self->__cachedMeltedObjects;
}

- (id)singleChangedValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  if (-[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", v4, 1))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKObject(Shared) singleChangedValueForKey:].cold.1();
    v5 = 0;
  }
  else
  {
    -[EKObject changeSet](self, "changeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKObject changeSet](self, "changeSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject backingObject](self, "backingObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForSingleValueKey:basedOn:and:", v4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      }
      else
      {
        -[EKObject backingObject](self, "backingObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKey:", v4);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v13 = objc_opt_class();
    if (v13 == objc_opt_class())
      v5 = 0;
    else
      v5 = v10;

  }
  return v5;
}

- (EKChangeSet)changeSet
{
  return self->_changeSet;
}

- (EKPersistentObject)backingObject
{
  return self->_persistentObject;
}

- (NSDictionary)additionalFrozenProperties
{
  return self->_additionalFrozenProperties;
}

- (BOOL)_isPropertyUnavailable:(id)a3 convertToFullObjectIfUnavailable:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  v6 = a3;
  if (a4)
    goto LABEL_4;
  -[EKObject changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasUnsavedChangeForKey:", v6);

  if ((v8 & 1) != 0
    || (-[EKObject additionalFrozenProperties](self, "additionalFrozenProperties"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v6),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
LABEL_4:
    v11 = 0;
  }
  else
  {
    -[EKObject backingObject](self, "backingObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isPropertyUnavailable:", v6);

  }
  return v11;
}

- (BOOL)isFrozen
{
  return 0;
}

- (id)meltedObjectInStore:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  EKObject *v9;
  void *v11;

  v5 = a3;
  -[EKObject eventStore](self, "eventStore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6 && (id)v6 != v5)
  {
    if (-[EKObject hasChanges](self, "hasChanges"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKObject.m"), 354, CFSTR("Cannot copy an object with changes from one event store to another"));

    }
    -[EKObject frozenObjectInStore:](self, "frozenObjectInStore:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (EKObject *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentObject:objectForCopy:", v8, self);

  }
  else
  {
    v9 = self;
  }

  return v9;
}

void __56__EKObject_Shared__cachedMeltedObjectsForMultiValueKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43__EKObject_Shared__clearCachedValueForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)_cachedValues
{
  return self->__cachedValues;
}

void __60__EKObject_Shared__setCachedMeltedObject_forSingleValueKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_cachedMeltedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);
  else
    objc_msgSend(v3, "removeObjectForKey:", v4);

}

- (void)setCachedMeltedObject:(id)a3 forSingleValueKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  EKObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EKObject_Shared__setCachedMeltedObject_forSingleValueKey___block_invoke;
  v10[3] = &unk_1E4785400;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[EKObject _performWithLock:](self, "_performWithLock:", v10);

}

void __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v7)
  {
    v4 = v7;
    v5 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v4;
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
  }

}

void __60__EKObject_Shared__setCachedMeltedObjects_forMultiValueKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_cachedMeltedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);
  else
    objc_msgSend(v3, "removeObjectForKey:", v4);

}

- (void)clearCachedValueForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__clearCachedValueForKey___block_invoke;
  v6[3] = &unk_1E47853B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EKObject _performWithLock:](self, "_performWithLock:", v6);

}

- (BOOL)_isNew
{
  void *v2;
  char v3;

  -[EKObject changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNew");

  return v3;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  return -[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", a3, 0);
}

- (EKObject)initWithPersistentObject:(id)a3
{
  id v5;
  EKObject *v6;
  void *v7;
  char v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKObject;
  v6 = -[EKObject init](&v10, sel_init);
  if (v6)
  {
    EKLogInitIfNeeded();
    -[EKObject _sharedInit](v6, "_sharedInit");
    objc_storeStrong((id *)&v6->_persistentObject, a3);
    if (-[EKPersistentObject isNew](v6->_persistentObject, "isNew"))
    {
      -[EKObject eventStore](v6, "eventStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isObjectInserted:", v6->_persistentObject);

      if ((v8 & 1) == 0)
        -[EKObject markAsNewShallow](v6, "markAsNewShallow");
    }
  }

  return v6;
}

- (void)_sharedInit
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new();
  -[EKObject set_cachedMeltedObjects:](self, "set_cachedMeltedObjects:", v3);

  v4 = (id)objc_opt_new();
  -[EKObject set_cachedValues:](self, "set_cachedValues:", v4);

}

- (void)set_cachedMeltedObjects:(id)a3
{
  objc_storeStrong((id *)&self->__cachedMeltedObjects, a3);
}

- (void)set_cachedValues:(id)a3
{
  objc_storeStrong((id *)&self->__cachedValues, a3);
}

- (id)cachedMeltedObjectsForMultiValueKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__EKObject_Shared__cachedMeltedObjectsForMultiValueKey___block_invoke;
  v8[3] = &unk_1E4785298;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[EKObject _performWithLock:](self, "_performWithLock:", v8);
  if (v12[5])
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)committedValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      -[EKObject eventStore](self, "eventStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "meltedObjectInStore:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v4);

      if (v11)
      {
        v12 = v5;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v18);
              -[EKObject eventStore](self, "eventStore", (_QWORD)v23);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "meltedObjectInStore:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "addObject:", v21);
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v16);
        }

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v5;
}

- (id)_previousValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v8 = 0;
  }
  else if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[EKObject backingObject](self, "backingObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)meltedAndCachedMultiRelationObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v25 = v4;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
            -[EKObject eventStore](self, "eventStore");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "meltedObjectInStore:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v8, "addObject:", v16);
            }
            else
            {
              v17 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                v18 = v17;
                -[EKObject eventStore](self, "eventStore");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v20 = CFSTR("not nil");
                if (!v19)
                  v20 = CFSTR("nil");
                v31 = v25;
                v32 = 2112;
                v33 = v20;
                _os_log_error_impl(&dword_1A2318000, v18, OS_LOG_TYPE_ERROR, "Failed to get melted object for frozen object related by key %@. Event store is %@", buf, 0x16u);

              }
            }

            ++v13;
          }
          while (v11 != v13);
          v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          v11 = v21;
        }
        while (v21);
      }

      v4 = v25;
      -[EKObject setCachedMeltedObjects:forMultiValueKey:](self, "setCachedMeltedObjects:forMultiValueKey:", v8, v25);
      v22 = (void *)objc_msgSend(v8, "copy");

      v7 = v24;
    }
    else
    {
      v22 = 0;
    }
    v6 = v22;

  }
  return v6;
}

- (void)setCachedMeltedObjects:(id)a3 forMultiValueKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  EKObject *v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EKObject_Shared__setCachedMeltedObjects_forMultiValueKey___block_invoke;
  v10[3] = &unk_1E4785400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[EKObject _performWithLock:](self, "_performWithLock:", v10);

}

- (id)multiChangedObjectValuesForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  if (-[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", v4, 1))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKObject(Shared) singleChangedValueForKey:].cold.1();
    v5 = 0;
  }
  else
  {
    -[EKObject changeSet](self, "changeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKObject changeSet](self, "changeSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject backingObject](self, "backingObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valuesForMultiValueKey:basedOn:and:", v4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      }
      else
      {
        -[EKObject backingObject](self, "backingObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKey:", v4);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v13 = objc_opt_class();
    if (v13 == objc_opt_class())
      v5 = 0;
    else
      v5 = v10;

  }
  return v5;
}

- (CADGenerationStampedObjectID)CADObjectID
{
  void *v2;
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CADGenerationStampedObjectID *)v3;
}

- (EKObject)init
{
  id v3;
  EKObject *v4;

  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "frozenClass"));
  v4 = -[EKObject initWithPersistentObject:](self, "initWithPersistentObject:", v3);

  return v4;
}

- (void)setBackingObject:(id)a3
{
  objc_storeStrong((id *)&self->_persistentObject, a3);
}

- (NSString)uniqueIdentifier
{
  void *v3;
  void *v4;

  -[objc_class propertyKeyForUniqueIdentifier](-[EKObject frozenClass](self, "frozenClass"), "propertyKeyForUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasNeverBeenCommitted
{
  void *v2;
  char v3;

  -[EKObject backingObject](self, "backingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNew");

  return v3;
}

- (BOOL)isDifferentFromCommitted
{
  void *v3;
  void *v4;
  BOOL v5;

  -[EKObject committedCopy](self, "committedCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diffWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "result") != 0;

  return v5;
}

- (id)frozenObject
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject frozenObjectInStore:](self, "frozenObjectInStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)frozenObjectInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKObject persistentObject](self, "persistentObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frozenObjectInStore:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCompletelyEqual:(id)a3
{
  -[EKObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  return -[EKObject isEqual:comparingKeys:compareImmutableKeys:ignoringProperties:](self, "isEqual:comparingKeys:compareImmutableKeys:ignoringProperties:", a3, 0, 0, a4);
}

- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4 compareImmutableKeys:(BOOL)a5 ignoringProperties:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  LOBYTE(v6) = objc_msgSend((id)objc_opt_class(), "_object:equalsObject:forKeys:compareImmutableKeys:ignoringProperties:", self, v12, v11, v6, v10);

  return v6;
}

+ (BOOL)_object:(id)a3 equalsObject:(id)a4 forKeys:(id)a5 compareImmutableKeys:(BOOL)a6 ignoringProperties:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  _QWORD v25[3];

  v8 = a6;
  v25[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  if (v12 == v13)
  {
    v20 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v15, "count"))
  {
    v17 = objc_msgSend(v12, "hash");
    if (v17 != objc_msgSend(v13, "hash"))
      goto LABEL_9;
  }
  v18 = objc_msgSend(a1, "meltedClass");
  v19 = objc_msgSend(a1, "frozenClass");
  v20 = 0;
  if (v12 && v13)
  {
    v21 = v19;
    v25[0] = v12;
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(a1, "_objects:haveSameMeltedClass:frozenClass:", v22, v18, v21);

    if (v23)
    {
      v20 = objc_msgSend(a1, "_compareKnownKeys:forObject:againstObject:compareImmutableKeys:propertiesToIgnore:", v14, v12, v13, v8, v16);
      goto LABEL_10;
    }
LABEL_9:
    v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7
{
  return objc_msgSend(a1, "_compareKnownKeys:forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:", a3, a4, a5, 1, a6, a7);
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6 compareImmutableKeys:(BOOL)a7 propertiesToIgnore:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v15 == v16)
  {
    v18 = 1;
  }
  else if (v10
         && !objc_msgSend(a1, "_compareIdentityKeysForObject:againstObject:propertiesToIgnore:", v15, v16, v17))
  {
    v18 = 0;
  }
  else
  {
    v18 = objc_msgSend(a1, "_compareNonIdentityKeys:forObject:againstObject:compareImmutableKeys:propertiesToIgnore:", v14, v15, v16, v9, v17);
  }

  return v18;
}

+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  id v38;
  id v39;
  void *v40;

  v11 = a3;
  v39 = a4;
  v38 = a5;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownRelationshipMultiValueKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownRelationshipSingleValueKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownSingleValueKeysForComparison");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownImmutableKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v21;
  if (v11)
  {
    v25 = v15;
    objc_msgSend(v15, "intersectSet:", v11);
    objc_msgSend(v18, "intersectSet:", v11);
    objc_msgSend(v21, "intersectSet:", v11);
    objc_msgSend(v24, "intersectSet:", v11);
  }
  else
  {
    v25 = v15;
    if (!a6)
    {

      v24 = 0;
    }
  }
  objc_msgSend(v18, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  v27 = v39;
  v29 = objc_msgSend(a1, "_compareSingleValueRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v26, v39, v38, v12);

  if (!v29
    || (objc_msgSend(v25, "allObjects"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(a1, "_compareMultiValueRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v30, v39, v38, v12), v30, !v31))
  {
    v35 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v40, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v32, v39, v38, v12);

  if (!v33)
  {
    v35 = 0;
LABEL_14:
    v28 = v38;
    v27 = v39;
    goto LABEL_11;
  }
  if (!v24)
  {
    v35 = 1;
    goto LABEL_14;
  }
  objc_msgSend(v24, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  v27 = v39;
  v35 = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v34, v39, v38, v12);

LABEL_11:
  return v35;
}

+ (BOOL)_compareIdentityKeysForObject:(id)a3 againstObject:(id)a4 propertiesToIgnore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "knownIdentityKeysForComparison");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v11, v10, v9, v8);

  return (char)a1;
}

+ (BOOL)_compareSingleValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(a1, "_compareSingleValueRelationshipKey:forObject:againstObject:propertiesToIgnore:ignoreIdentityKeys:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v12, v13, 0, (_QWORD)v21))
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareMultiValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(a1, "_compareMutliValueRelationshipKey:forObject:againstObject:propertiesToIgnore:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v12, v13, (_QWORD)v21))
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareMutliValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "isPropertyUnavailable:", v10)
    && (objc_msgSend(v12, "isPropertyUnavailable:", v10) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v15 = v11;
    v16 = v12;
    v17 = objc_msgSend(v15, "isPartialObject");
    if (v17 != objc_msgSend(v16, "isPartialObject"))
    {
      objc_msgSend(a1, "_createNonPartialObjectFromObject:ifPropertyIsUnavailable:", v15, v10);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_createNonPartialObjectFromObject:ifPropertyIsUnavailable:", v16, v10);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v19;
      v15 = (id)v18;
    }
    objc_msgSend(v15, "valueForKey:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "count");
    if (v22 == objc_msgSend(v21, "count"))
    {
      v45 = v11;
      v46 = v21;
      v42 = v15;
      v43 = v16;
      v44 = v12;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v41 = v20;
      v24 = v20;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v52 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v29, "uniqueIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v26);
      }

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v31 = v46;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v32)
      {
        v33 = v32;
        v40 = v10;
        v34 = *(_QWORD *)v48;
        while (2)
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v48 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            objc_msgSend(v36, "uniqueIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v36) = objc_msgSend(a1, "_compareRelationshipObject1:againstRelationshipObject2:propertiesToIgnore:", v38, v36, v13);

            if (!(_DWORD)v36)
            {
              v14 = 0;
              goto LABEL_27;
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v33)
            continue;
          break;
        }
        v14 = 1;
LABEL_27:
        v10 = v40;
      }
      else
      {
        v14 = 1;
      }

      v12 = v44;
      v11 = v45;
      v15 = v42;
      v16 = v43;
      v20 = v41;
      v21 = v46;
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  char v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((v7 == 0) != (v8 == 0))
    goto LABEL_5;
  v10 = 1;
  if (v7 && v8)
  {
    v11 = (void *)objc_msgSend((id)objc_opt_class(), "meltedClass");
    if (v11 != (void *)objc_msgSend((id)objc_opt_class(), "meltedClass"))
    {
LABEL_5:
      v10 = 0;
      goto LABEL_6;
    }
    if (objc_msgSend(v11, "isWeakRelationship"))
      v13 = objc_msgSend(v11, "_compareIdentityKeysForObject:againstObject:propertiesToIgnore:", v7, v8, v9);
    else
      v13 = objc_msgSend(v7, "isEqual:ignoringProperties:", v8, v9);
    v10 = v13;
  }
LABEL_6:

  return v10;
}

+ (BOOL)_objects:(id)a3 haveSameMeltedClass:(Class)a4 frozenClass:(Class)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "meltedClass", (_QWORD)v13);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(a1, "frozenClass");
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

+ (Class)frozenClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4
{
  return 0;
}

- (BOOL)canBeConvertedToFullObject
{
  return 0;
}

- (id)preFrozenRelationshipObjects
{
  return 0;
}

- (Class)frozenClass
{
  void *v2;
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)isPartialObject
{
  return 0;
}

+ (id)propertiesUnavailableForPartialObjects
{
  return 0;
}

- (CADGenerationStampedObjectID)rebasedFrom
{
  return (CADGenerationStampedObjectID *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B838]);
}

- (void)rebase
{
  id v3;

  -[EKObject eventStore](self, "eventStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject rebaseToEventStore:](self, "rebaseToEventStore:", v3);

}

- (void)rebaseToEventStore:(id)a3
{
  -[EKObject rebaseSkippingRelationProperties:toEventStore:](self, "rebaseSkippingRelationProperties:toEventStore:", 0, a3);
}

- (void)rebaseSkippingRelationProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKObject eventStore](self, "eventStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject rebaseSkippingRelationProperties:toEventStore:](self, "rebaseSkippingRelationProperties:toEventStore:", v4, v5);

}

- (void)rebaseSkippingRelationProperties:(id)a3 toEventStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  id v61;
  _BYTE v62[128];
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  -[EKObject persistentObject](self, "persistentObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKObject persistentObject](self, "persistentObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v10, "_setEventStore:", v7);
  -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __58__EKObject_rebaseSkippingRelationProperties_toEventStore___block_invoke;
  v60[3] = &unk_1E4784F98;
  v60[4] = self;
  v42 = v10;
  v61 = v42;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v60);

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v57;
    v44 = v6;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v57 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
        {
          -[EKObject valueForKey:](self, "valueForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18
            && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v18, v17))
          {
            objc_msgSend(v18, "rebaseToEventStore:", v7);
            -[EKObject changeSet](self, "changeSet");
            v19 = v12;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "frozenObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "forceChangeValue:forKey:", v21, v17);

            v12 = v19;
            v6 = v44;
          }

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v14);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v53;
    v45 = *(_QWORD *)v53;
    do
    {
      v25 = 0;
      v46 = v23;
      do
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v25);
        if (objc_msgSend(v6, "containsObject:", v26))
        {
          -[EKObject changeSet](self, "changeSet");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "multiValueRemovals");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v26);
        }
        else
        {
          -[EKObject valueForKey:](self, "valueForKey:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKObject changeSet](self, "changeSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "rollbackChangesForKeys:", v31);

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v28 = v29;
          v32 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          if (v32)
          {
            v33 = v32;
            v34 = v6;
            v35 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v49 != v35)
                  objc_enumerationMutation(v28);
                v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                if (v37
                  && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v37, v26))
                {
                  objc_msgSend(v37, "rebaseToEventStore:", v7);
                  objc_msgSend(v37, "frozenObject");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EKObject addMultiChangedObjectValue:forKey:](self, "addMultiChangedObjectValue:forKey:", v38, v26);

                }
              }
              v33 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
            }
            while (v33);
            v27 = v28;
            v6 = v34;
            v24 = v45;
            v23 = v46;
          }
          else
          {
            v27 = v28;
          }
        }

        ++v25;
      }
      while (v25 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v23);
  }

  objc_msgSend(v42, "objectID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordObjectRebaseWithOldObjectID:newObjectID:", v43, v39);
  -[EKObject persistentObject](self, "persistentObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "CADObjectID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setValue:forKey:", v41, *MEMORY[0x1E0D0B838]);

  -[EKObject setPersistentObject:](self, "setPersistentObject:", v42);
}

void __58__EKObject_rebaseSkippingRelationProperties_toEventStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v13))
  {

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v13);

    if ((v8 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "keysToIgnoreForApplyingChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v13);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "changeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasUnsavedChangeForKey:", v13);

        if ((v12 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v13);
      }
    }
  }

}

- (int)rowID
{
  void *v2;
  int v3;

  -[EKObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rowID");

  return v3;
}

- (BOOL)existsInStore
{
  void *v2;
  char v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isNew") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "existsInStore");

  return v3;
}

+ (id)objectsIDsExistingInStoreFromObjects:(id)a3 eventStore:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "persistentObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isNew");

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v14, "CADObjectID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && (objc_msgSend(v17, "isTemporary") & 1) == 0)
            objc_msgSend(v8, "addObject:", v18);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CADOperationProxySync");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__EKObject_objectsIDsExistingInStoreFromObjects_eventStore___block_invoke;
    v22[3] = &unk_1E4784FC0;
    v23 = v8;
    v24 = v7;
    objc_msgSend(v20, "CADObjectsExist:reply:", v23, v22);

  }
  return v7;
}

void __60__EKObject_objectsIDsExistingInStoreFromObjects_eventStore___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error checking whether objects %@ exist: %@"), v3, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)hasEverBeenCommitted
{
  return !-[EKPersistentObject isNew](self->_persistentObject, "isNew");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = -[EKObject _copyWithoutChangesInZone:](self, "_copyWithoutChangesInZone:", a3);
  if (-[EKObject hasUnsavedChanges](self, "hasUnsavedChanges"))
    objc_msgSend(v4, "addChangesFromObject:copyingBackingObjects:", self, 0);
  return v4;
}

- (id)shallowCopyWithoutChanges
{
  return -[EKObject _copyWithoutChangesInZone:](self, "_copyWithoutChangesInZone:", 0);
}

- (id)_copyWithoutChangesInZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EKObject persistentObject](self, "persistentObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPersistentObject:objectForCopy:", v5, self);

  -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalFrozenProperties:", v7);

  return v6;
}

- (id)duplicate
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject duplicateToEventStore:](self, "duplicateToEventStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)duplicateToEventStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[EKObject copy](self, "copy");
  objc_msgSend(v5, "rebaseToEventStore:", v4);

  objc_msgSend(v5, "markAsNew");
  return v5;
}

- (id)committedCopy
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "defaultPropertyKeysToSkipForRecursiveSnapshotCopies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject _recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:](self, "_recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:", &__block_literal_global_5, 0, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __25__EKObject_committedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a2, "persistentObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedPropertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)snapshotCopy
{
  return -[EKObject snapshotCopyWithPropertyKeysToCopy:](self, "snapshotCopyWithPropertyKeysToCopy:", 0);
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultPropertyKeysToSkipForRecursiveSnapshotCopies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject snapshotCopyWithPropertyKeysToCopy:propertyKeysToSkip:](self, "snapshotCopyWithPropertyKeysToCopy:propertyKeysToSkip:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4
{
  return -[EKObject _recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:](self, "_recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:", &__block_literal_global_18, a3, a4, 1);
}

id __66__EKObject_snapshotCopyWithPropertyKeysToCopy_propertyKeysToSkip___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "valueForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)previouslySavedCopy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__EKObject_previouslySavedCopy__block_invoke;
  v6[3] = &unk_1E4785008;
  v6[4] = self;
  objc_msgSend((id)objc_opt_class(), "defaultPropertyKeysToSkipForRecursiveSnapshotCopies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject _recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:](self, "_recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:", v6, 0, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __31__EKObject_previouslySavedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "_previousValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
    v18 = v19;
    goto LABEL_38;
  }
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedMeltedObjectForSingleValueKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) != 0)
    {
LABEL_6:
      v18 = v9;

      goto LABEL_38;
    }
    objc_msgSend(*(id *)(a1 + 32), "additionalMeltedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
    {
      v9 = v14;
      goto LABEL_6;
    }

    goto LABEL_36;
  }
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v5);

  if (!v21)
  {
LABEL_36:
    v19 = v6;
    goto LABEL_37;
  }
  v49 = v6;
  v22 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v22, "count"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v5;
  objc_msgSend(*(id *)(a1 + 32), "cachedMeltedObjectsForMultiValueKey:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v60 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v28, "persistentObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v22, "containsObject:", v29);

        if (v30)
        {
          objc_msgSend(v18, "addObject:", v28);
          objc_msgSend(v28, "persistentObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObject:", v31);

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v25);
  }
  objc_msgSend(*(id *)(a1 + 32), "additionalMeltedObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v50);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v56 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v39, "persistentObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v22, "containsObject:", v40);

        if (v41)
        {
          objc_msgSend(v18, "addObject:", v39);
          objc_msgSend(v39, "persistentObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObject:", v42);

        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v36);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v43 = v22;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(v18, "addObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v45);
  }

  v6 = v49;
  v5 = v50;
LABEL_38:

  return v18;
}

+ (id)_array:(id)a3 intersectedWithSet:(id)a4 minusSet:(id)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = (unint64_t)a4;
  v9 = (unint64_t)a5;
  if (v8 | v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "intersectSet:", v8);
    if (v9)
      objc_msgSend(v12, "minusSet:", v9);
    objc_msgSend(v12, "allObjects");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)_recursiveSnapshotCopyWithPropertyAccessor:(id)a3 propertyKeysToCopy:(id)a4 propertyKeysToSkip:(id)a5 recurseOnWeakRelations:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  void *v81;
  void *context;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id obj;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  _BOOL4 v98;
  void (**v99)(id, EKObject *, _QWORD);
  EKObject *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  uint64_t v123;
  _BYTE v124[128];
  uint64_t v125;

  v98 = a6;
  v125 = *MEMORY[0x1E0C80C00];
  v99 = (void (**)(id, EKObject *, _QWORD))a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x1A85847F4]();
  v11 = objc_alloc((Class)objc_opt_class());
  -[EKObject persistentObject](self, "persistentObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v11, "initWithPersistentObject:objectForCopy:", v12, self);

  v93 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysForComparison");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_array:intersectedWithSet:minusSet:", v13, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_array:intersectedWithSet:minusSet:", v14, v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = v10;
  v95 = v9;
  objc_msgSend((id)objc_opt_class(), "_array:intersectedWithSet:minusSet:", v15, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v16, "count");
  v20 = objc_msgSend(v17, "count") + v19;
  v21 = objc_msgSend(v18, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v20 + v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v16);
  v91 = v17;
  objc_msgSend(v22, "addObjectsFromArray:", v17);
  v80 = v18;
  objc_msgSend(v22, "addObjectsFromArray:", v18);
  v100 = self;
  -[EKObject persistentObject](self, "persistentObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v22;
  objc_msgSend(v23, "loadPropertiesIfNeeded:", v22);

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v16;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
  if (v24)
  {
    v25 = v24;
    v96 = *(id *)v114;
    do
    {
      v26 = 0;
      v27 = v25;
      do
      {
        if (*(id *)v114 != v96)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v26);
        v29 = (void *)MEMORY[0x1A85847F4]();
        v99[2](v99, v100, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = objc_opt_class();
          if (v31 == objc_opt_class())
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setObject:forKey:", v36, v28);
LABEL_19:

            v25 = v27;
            goto LABEL_20;
          }
          -[EKObject eventStore](v100, "eventStore");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "frozenObjectInStore:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setObject:forKey:", v33, v28);

          v34 = objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v30, v28) ^ 1;
          if ((v34 & 1) != 0 || v98)
          {
            -[EKObject eventStore](v100, "eventStore");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "meltedObjectInStore:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "defaultPropertyKeysToSkipForRecursiveSnapshotCopies");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = v95;
              v39 = v94;

              v37 = v39;
            }
            else
            {
              v38 = 0;
            }
            objc_msgSend(v36, "_recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:", v99, v38, v37, v34 & v98);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              objc_msgSend(v85, "setCachedMeltedObject:forSingleValueKey:", v40, v28);
            }
            else
            {
              v41 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                v42 = v41;
                v43 = objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v121 = v30;
                v122 = 2114;
                v123 = v43;
                _os_log_error_impl(&dword_1A2318000, v42, OS_LOG_TYPE_ERROR, "Failed to create committed relationship for relation %@ (%{public}@)", buf, 0x16u);

              }
            }

            goto LABEL_19;
          }
        }
LABEL_20:

        objc_autoreleasePoolPop(v29);
        ++v26;
      }
      while (v25 != v26);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
    }
    while (v25);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v86 = v91;
  v44 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v110;
    v83 = *(_QWORD *)v110;
    do
    {
      v47 = 0;
      v84 = v45;
      do
      {
        if (*(_QWORD *)v110 != v46)
          objc_enumerationMutation(v86);
        v48 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v47);
        v49 = (void *)MEMORY[0x1A85847F4]();
        v99[2](v99, v100, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = objc_opt_class();
          if (v51 == objc_opt_class())
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setObject:forKey:", v68, v48);
          }
          else
          {
            v90 = v49;
            v92 = v47;
            objc_msgSend(v50, "valueForKey:", CFSTR("frozenObject"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v48;
            objc_msgSend(v93, "setObject:forKey:", v52, v48);

            v53 = (void *)objc_opt_new();
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v89 = v50;
            v97 = v50;
            v54 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v106;
              do
              {
                v57 = 0;
                do
                {
                  if (*(_QWORD *)v106 != v56)
                    objc_enumerationMutation(v97);
                  v58 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v57);
                  -[EKObject eventStore](v100, "eventStore");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "meltedObjectInStore:", v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend((id)objc_opt_class(), "defaultPropertyKeysToSkipForRecursiveSnapshotCopies");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v62 = v95;
                    v63 = v94;

                    v61 = v63;
                  }
                  else
                  {
                    v62 = 0;
                  }
                  objc_msgSend(v60, "_recursiveSnapshotCopyWithPropertyAccessor:propertyKeysToCopy:propertyKeysToSkip:recurseOnWeakRelations:", v99, v62, v61, v98);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v64)
                  {
                    objc_msgSend(v53, "addObject:", v64);
                  }
                  else
                  {
                    v65 = (void *)EKLogHandle;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      v66 = v65;
                      v67 = objc_opt_class();
                      *(_DWORD *)buf = 138412546;
                      v121 = 0;
                      v122 = 2114;
                      v123 = v67;
                      _os_log_error_impl(&dword_1A2318000, v66, OS_LOG_TYPE_ERROR, "Failed to create committed relationship for relation %@ (%{public}@)", buf, 0x16u);

                    }
                  }

                  ++v57;
                }
                while (v55 != v57);
                v55 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
              }
              while (v55);
            }

            v68 = v53;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v53);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setCachedMeltedObjects:forMultiValueKey:", v69, v88);

            v46 = v83;
            v45 = v84;
            v49 = v90;
            v47 = v92;
            v50 = v89;
          }

        }
        objc_autoreleasePoolPop(v49);
        ++v47;
      }
      while (v47 != v45);
      v45 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
    }
    while (v45);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v70 = v80;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v72; ++i)
      {
        if (*(_QWORD *)v102 != v73)
          objc_enumerationMutation(v70);
        v75 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        v76 = (void *)MEMORY[0x1A85847F4]();
        v99[2](v99, v100, v75);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
          objc_msgSend(v93, "setObject:forKey:", v77, v75);

        objc_autoreleasePoolPop(v76);
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
    }
    while (v72);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v93);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setAdditionalFrozenProperties:", v78);

  objc_msgSend(v85, "_resetInternalStateWithForce:", 0);
  objc_autoreleasePoolPop(context);

  return v85;
}

- (BOOL)_reset
{
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  return -[EKObject _resetCommon](self, "_resetCommon");
}

- (BOOL)refresh
{
  return -[EKObject refreshAndNotify:](self, "refreshAndNotify:", 1);
}

- (BOOL)refreshAndNotify:(BOOL)a3
{
  void *v4;
  int v5;

  if (-[EKObject isNew](self, "isNew", a3))
    return 0;
  -[EKObject persistentObject](self, "persistentObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "existsInStore");

  return v5 && -[EKObject _refreshCommon](self, "_refreshCommon");
}

- (void)markAsNew
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v8))
        {
          -[EKObject valueForKey:](self, "valueForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v9, v8))
          {
            objc_msgSend(v9, "existingMeltedObject");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "markAsNew");

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v15))
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          -[EKObject valueForKey:](self, "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * k);
                if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v21, v15))
                {
                  objc_msgSend(v21, "existingMeltedObject");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "markAsNew");

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            }
            while (v18);
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  -[EKObject markAsNewShallow](self, "markAsNewShallow");
}

- (void)markAsNewShallow
{
  void *v3;
  id v4;

  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsNew:", 1);

  -[EKObject changeSet](self, "changeSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSaved:", 0);

}

- (void)markAsUndeleted
{
  -[EKObject rebase](self, "rebase");
  -[EKObject _markAsUndeletedCommon](self, "_markAsUndeletedCommon");
}

- (void)markAsCommitted
{
  -[EKObject _markAsCommittedCommon](self, "_markAsCommittedCommon");
  -[EKObject _performBlockOnOwnedCachedRelatedObjects:](self, "_performBlockOnOwnedCachedRelatedObjects:", &__block_literal_global_23);
}

uint64_t __27__EKObject_markAsCommitted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markAsCommitted");
}

- (void)_performBlockOnOwnedCachedRelatedObjects:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[EKObject cachedMeltedObjectForSingleValueKey:](self, "cachedMeltedObjectForSingleValueKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v11, v10))
        {
          v4[2](v4, v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v12)
  {
    v13 = v12;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v25;
          do
          {
            for (k = 0; k != v18; ++k)
            {
              if (*(_QWORD *)v25 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * k);
              if (v21
                && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v21, v15))
              {
                v4[2](v4, v21);
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          }
          while (v18);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v13);
  }

}

- (void)updatePersistentValueForKeyIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:"))
    -[EKObject _updatePersistentValueForKey:](self, "_updatePersistentValueForKey:", v4);

}

- (void)_updatePersistentValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject _propertyValueForKey:](self, "_propertyValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v8 = v5;
    -[EKObject persistentObject](self, "persistentObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistentObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, v4);

    objc_msgSend(v8, "updatePersistentObject");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v4);

    if (v12)
    {
      v13 = v5;
      -[EKObject persistentObject](self, "persistentObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKey:", CFSTR("persistentObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, v4);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v22;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "updatePersistentObject", (_QWORD)v21);
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v18);
      }

    }
    else
    {
      -[EKObject persistentObject](self, "persistentObject");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKey:", v5, v4);
    }

  }
}

- (id)_propertyValueForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
      -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", v4);
    else
      -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {

    v10 = 0;
  }

  return v10;
}

- (void)insertPersistentObjectIfNeeded
{
  void *v2;
  id v3;

  -[EKObject persistentObject](self, "persistentObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isNew") && (objc_msgSend(v3, "_isPendingInsert") & 1) == 0)
  {
    objc_msgSend(v3, "eventStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_insertObject:", v3);

  }
}

- (void)updatePersistentObject
{
  -[EKObject updatePersistentObjectSkippingProperties:](self, "updatePersistentObjectSkippingProperties:", 0);
}

- (void)updatePersistentObjectSkippingProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject changeSet](self, "changeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
          -[EKObject _updatePersistentValueForKey:](self, "_updatePersistentValueForKey:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }

  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsObject:", v18) & 1) == 0
          && (objc_msgSend(v7, "containsObject:", v18) & 1) == 0
          && -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v18))
        {
          -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "updatePersistentObject");

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v15);
  }
  v31 = v13;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    v32 = v20;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
        if ((objc_msgSend(v4, "containsObject:", v25, v31) & 1) == 0
          && (objc_msgSend(v7, "containsObject:", v25) & 1) == 0
          && -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v25))
        {
          -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v34;
            do
            {
              for (m = 0; m != v28; ++m)
              {
                if (*(_QWORD *)v34 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "updatePersistentObject");
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
            }
            while (v28);
          }

          v20 = v32;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v22);
  }

}

- (void)deletePersistentObject
{
  void *v2;
  id v3;

  -[EKObject persistentObject](self, "persistentObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deleteObject:", v3);

}

- (void)addCoCommitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EKObject persistentObject](self, "persistentObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCoCommitObject:", v5);
}

- (void)setPersistentObject:(id)a3
{
  objc_storeStrong((id *)&self->_persistentObject, a3);
}

- (void)setChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_changeSet, a3);
}

- (NSDictionary)cachedMeltedObjects
{
  return self->_cachedMeltedObjects;
}

- (void)setCachedMeltedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMeltedObjects, a3);
}

- (void)setAdditionalFrozenProperties:(id)a3
{
  objc_storeStrong((id *)&self->_additionalFrozenProperties, a3);
}

- (NSDictionary)additionalMeltedObjects
{
  return self->_additionalMeltedObjects;
}

- (void)setAdditionalMeltedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_additionalMeltedObjects, a3);
}

- (EKObjectValidationContext)_validationContext
{
  return self->__validationContext;
}

- (void)set_validationContext:(id)a3
{
  objc_storeStrong((id *)&self->__validationContext, a3);
}

- (id)_basicSummaryWithDepth:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[EKDiff _indentStringAtDepth:](EKDiff, "_indentStringAtDepth:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ <0x%x>"), v4, objc_opt_class(), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  objc_msgSend((id)objc_opt_class(), "knownSummaryKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownIdentityKeysForComparison");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[EKObject valueForKey:](self, "valueForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[EKObject valueForKey:](self, "valueForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR(", %@:%@"), v15, v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v5;
}

- (id)_summaryWithDepth:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject _basicSummaryWithDepth:](self, "_basicSummaryWithDepth:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  -[EKObject _addSummaryWithDepth:toMutableString:indentFirstLine:](self, "_addSummaryWithDepth:toMutableString:indentFirstLine:", 0, v5, 0);
  return v5;
}

- (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 indentFirstLine:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysForComparison");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDiff _addSummaryWithDepth:toMutableString:forSingleValueKeys:firstObject:secondObject:](EKDiff, "_addSummaryWithDepth:toMutableString:forSingleValueKeys:firstObject:secondObject:", a3, v7, v8, self, 0);

  objc_msgSend((id)objc_opt_class(), "knownDerivedAndSingleValueRelationshipKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[EKDiff _addSummaryWithDepth:toMutableString:forRelationshipSingleValueKeys:firstObject:secondObject:](EKDiff, "_addSummaryWithDepth:toMutableString:forRelationshipSingleValueKeys:firstObject:secondObject:", a3, v7, v10, self, 0);
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDiff _addSummaryWithDepth:toMutableString:forRelationshipMultiValueKeys:firstObject:secondObject:](EKDiff, "_addSummaryWithDepth:toMutableString:forRelationshipMultiValueKeys:firstObject:secondObject:", a3, v7, v9, self, 0);

}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  return 0;
}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  return 0;
}

+ (unint64_t)_numberOfSharedLocksForUnitTesting
{
  return 8;
}

- (id)cachedValueForKey:(id)a3
{
  return -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", a3, 0);
}

- (void)setCachedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__EKObject_Shared__setCachedValue_forKey___block_invoke;
  v10[3] = &unk_1E4785400;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[EKObject _performWithLock:](self, "_performWithLock:", v10);

}

void __42__EKObject_Shared__setCachedValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)clearCachedValuesForKeys:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  EKObject *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__EKObject_Shared__clearCachedValuesForKeys___block_invoke;
  v6[3] = &unk_1E47853B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[EKObject _performWithLock:](self, "_performWithLock:", v6);

}

void __45__EKObject_Shared__clearCachedValuesForKeys___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "_cachedValues", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)cachedValueForKey:(id)a3 expectingCachedValue:(id)a4 forMasterKey:(id)a5 relatedKeys:(id)a6 populateBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  v17 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke;
  v32[3] = &unk_1E4787298;
  v32[4] = self;
  v18 = v14;
  v33 = v18;
  v19 = v13;
  v34 = v19;
  v36 = &v37;
  v20 = v12;
  v35 = v20;
  -[EKObject _performWithLock:](self, "_performWithLock:", v32);
  v21 = (void *)v38[5];
  if (v16 && !v21)
  {
    v16[2](v16);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v38[5];
    v38[5] = v22;

    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke_2;
    v26[3] = &unk_1E47872C0;
    v26[4] = self;
    v27 = v18;
    v28 = v19;
    v29 = v15;
    v30 = v20;
    v31 = &v37;
    -[EKObject _performWithLock:](self, "_performWithLock:", v26);

    v21 = (void *)v38[5];
  }
  v24 = v21;

  _Block_object_dispose(&v37, 8);
  return v24;
}

void __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 48);
  if (!(v3 | v8) || objc_msgSend((id)v3, "isEqual:", v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 48);
  if (v4 | v3 && (objc_msgSend((id)v4, "isEqual:", v3) & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = *(id *)(a1 + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 32), "_cachedValues", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObjectForKey:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_cachedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_cachedValues", (_QWORD)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(a1 + 64));

}

+ (BOOL)isWeakRelationship
{
  return 0;
}

+ (BOOL)isDerivedRelationship
{
  return 0;
}

+ (id)knownRelationshipSingleValueKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)knownDerivedAndSingleValueRelationshipKeys
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownDerivedRelationshipKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)knownRelationshipMultiValueKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldLoadRelationshipForValidation:(id)a3
{
  return 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_3 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_3, &__block_literal_global_59);
  return (id)knownRelationshipWeakKeys_keys_3;
}

void __45__EKObject_Shared__knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B830];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys_3;
  knownRelationshipWeakKeys_keys_3 = v0;

}

+ (id)knownDerivedRelationshipKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)knownImmutableKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)knownIdentityKeysForComparison
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)specialComparisonBlocks
{
  return 0;
}

+ (id)knownSingleValueKeysForComparison
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)knownSingleValueKeysToSkipForUIComparison
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (BOOL)isMeltedAndNotWeakRelationshipObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "isFrozen") & 1) == 0)
  {
    objc_msgSend(v6, "existingMeltedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "isWeakRelationObject:forKey:", v9, v7);

    v8 = v10 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isWeakRelationObject:(id)a3 forKey:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a4;
  if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "isWeakRelationship") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "knownRelationshipWeakKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v5);

  }
  return v6;
}

- (BOOL)validate:(id *)a3
{
  EKObjectValidationContext *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id *v48;
  EKObjectValidationContext *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[EKObject _validationContext](self, "_validationContext");
  v5 = (EKObjectValidationContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[EKObjectValidationContext initWithRootObject:]([EKObjectValidationContext alloc], "initWithRootObject:", self);
    -[EKObject set_validationContext:](self, "set_validationContext:", v5);
  }
  -[EKObjectValidationContext setDepth:](v5, "setDepth:", -[EKObjectValidationContext depth](v5, "depth") + 1);
  if (-[EKObjectValidationContext depth](v5, "depth") >= 0x33)
  {
    -[EKObjectValidationContext setReachedMaxDepth:](v5, "setReachedMaxDepth:", 1);
    -[EKObjectValidationContext rootObject](v5, "rootObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKObject(Shared) validate:].cold.1(v7, v6);
      if (!a3)
        goto LABEL_7;
    }
    else if (!a3)
    {
LABEL_7:
      -[EKObject _validationContext](self, "_validationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "faultIfNeededForObject:", self);

      -[EKObject set_validationContext:](self, "set_validationContext:", 0);
      v9 = 0;
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v48 = a3;
  v49 = v5;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeysForValidation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  v50 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v62 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v17) & 1) != 0
          || -[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", v17)
          && !-[EKObject shouldLoadRelationshipForValidation:](self, "shouldLoadRelationshipForValidation:", v17))
        {
          v18 = 0;
        }
        else
        {
          -[EKObject valueForKey:](self, "valueForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18
            && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v18, v17))
          {
            v60 = v14;
            v19 = objc_msgSend(v18, "validateWithOwner:error:", self, &v60);
            v6 = v60;

            if ((v19 & 1) == 0)
            {
              v20 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                v39 = v20;
                v40 = objc_opt_class();
                -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v68 = v40;
                v69 = 2114;
                v70 = v41;
                v71 = 2114;
                v72 = v17;
                v73 = 2112;
                v74 = v6;
                _os_log_error_impl(&dword_1A2318000, v39, OS_LOG_TYPE_ERROR, "Object of type %{public}@ (uniqueIdentifier = %{public}@) failed validation while validating relation %{public}@ with error [%@].", buf, 0x2Au);

              }
              -[EKObject _validationContext](self, "_validationContext");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "faultIfNeededForObject:", self);

              -[EKObject set_validationContext:](self, "set_validationContext:", 0);
              v10 = v50;
              if (v48 && v6)
                *v48 = objc_retainAutorelease(v6);

              v9 = 0;
              v5 = v49;
              goto LABEL_63;
            }
            v14 = v6;
            v10 = v50;
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeysForValidation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v57;
    v47 = v22;
    v45 = *(_QWORD *)v57;
    do
    {
      v26 = 0;
      v46 = v24;
      do
      {
        if (*(_QWORD *)v57 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v26);
        if ((objc_msgSend(v10, "containsObject:", v27) & 1) == 0
          && (!-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", v27)
           || -[EKObject shouldLoadRelationshipForValidation:](self, "shouldLoadRelationshipForValidation:", v27)))
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          -[EKObject valueForKey:](self, "valueForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v53;
            while (2)
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v53 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                if (v33
                  && objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v33, v27))
                {
                  v51 = v14;
                  v34 = v14;
                  v35 = objc_msgSend(v33, "validateWithOwner:error:", self, &v51);
                  v6 = v51;

                  if ((v35 & 1) == 0)
                  {
                    v36 = (void *)EKLogHandle;
                    v10 = v50;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      v42 = v36;
                      v43 = objc_opt_class();
                      -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544130;
                      v68 = v43;
                      v69 = 2114;
                      v70 = v44;
                      v71 = 2114;
                      v72 = v27;
                      v73 = 2112;
                      v74 = v6;
                      _os_log_error_impl(&dword_1A2318000, v42, OS_LOG_TYPE_ERROR, "Object of type %{public}@ (uniqueIdentifier = %{public}@) failed validation while validating relation %{public}@ with error [%@].", buf, 0x2Au);

                    }
                    -[EKObject _validationContext](self, "_validationContext");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "faultIfNeededForObject:", self);

                    -[EKObject set_validationContext:](self, "set_validationContext:", 0);
                    v5 = v49;
                    if (v48 && v6)
                      *v48 = objc_retainAutorelease(v6);

                    v9 = 0;
                    goto LABEL_63;
                  }
                  v14 = v6;
                  v10 = v50;
                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
              if (v30)
                continue;
              break;
            }
          }

          v24 = v46;
          v22 = v47;
          v25 = v45;
        }
        ++v26;
      }
      while (v26 != v24);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v24);
  }

  if (v48 && v14)
    *v48 = objc_retainAutorelease(v14);
  v5 = v49;
  -[EKObjectValidationContext setDepth:](v49, "setDepth:", -[EKObjectValidationContext depth](v49, "depth") - 1);
  -[EKObject set_validationContext:](self, "set_validationContext:", 0);
  v9 = 1;
  v6 = v14;
LABEL_63:

LABEL_64:
  return v9;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "_validationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject set_validationContext:](self, "set_validationContext:", v6);

  return -[EKObject validate:](self, "validate:", a4);
}

- (void)_initChangeSetIfNone
{
  void *v3;
  EKChangeSet *v4;

  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(EKChangeSet);
    -[EKObject setChangeSet:](self, "setChangeSet:", v4);

  }
}

- (void)_markAsNotNewCommon
{
  id v2;

  -[EKObject changeSet](self, "changeSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsNew:", 0);

}

- (void)_markAsDeletedCommon
{
  id v3;

  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  -[EKObject changeSet](self, "changeSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsDeleted:", 1);

}

- (void)_markAsUndeletedCommon
{
  void *v3;
  id v4;

  -[EKObject markAsNew](self, "markAsNew");
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsDeleted:", 0);

  -[EKObject changeSet](self, "changeSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsUndeleted:", 1);

}

- (void)_markAsSavedCommon
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[EKObject frozenObject](self, "frozenObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject changeSet](self, "changeSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "markChangesAsSaved");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v8))
        {
          -[EKObject valueForKey:](self, "valueForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v9, v8))
          {
            objc_msgSend(v9, "existingMeltedObject");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "markAsSaved");

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v5);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v15))
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[EKObject valueForKey:](self, "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v27;
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v27 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
                if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v21, v15))
                {
                  objc_msgSend(v21, "existingMeltedObject");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "markAsSaved");

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            }
            while (v18);
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v12);
  }

  -[EKObject _resetWithFrozenObject:](self, "_resetWithFrozenObject:", v24);
  -[EKObject setChangeSet:](self, "setChangeSet:", v23);

}

- (void)_markAsCommittedCommon
{
  void *v3;
  id v4;

  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsNew:", 0);

  -[EKObject changeSet](self, "changeSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsModified:", 0);

}

- (BOOL)isDeleted
{
  void *v2;
  char v3;

  -[EKObject changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeleted");

  return v3;
}

- (BOOL)isUndeleted
{
  void *v2;
  char v3;

  -[EKObject changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndeleted");

  return v3;
}

- (BOOL)isSaved
{
  void *v3;
  BOOL v4;
  void *v5;

  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isSaved") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[EKObject backingObject](self, "backingObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_hasChanges
{
  void *v3;
  unint64_t v4;
  void *v5;
  char v6;

  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    v4 = -[EKObject _cachedMeltedObjectsCount](self, "_cachedMeltedObjectsCount");
    if (!v4)
      return v4;
  }
  -[EKObject changeSet](self, "changeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChanges");

  LOBYTE(v4) = (v6 & 1) != 0
            || -[EKObject _hasChangeHelperInKeys:ignoreKeys:checkUnsaved:](self, "_hasChangeHelperInKeys:ignoreKeys:checkUnsaved:", 0, 0, 0);
  return v4;
}

- (BOOL)hasUnsavedChanges
{
  return -[EKObject hasUnsavedChangesIgnoreKeys:](self, "hasUnsavedChangesIgnoreKeys:", 0);
}

- (BOOL)hasUnsavedChangesInKeys:(id)a3
{
  return -[EKObject _hasUnsavedChangesInKeys:ignoreKeys:](self, "_hasUnsavedChangesInKeys:ignoreKeys:", a3, 0);
}

- (BOOL)hasUnsavedChangesIgnoreKeys:(id)a3
{
  return -[EKObject _hasUnsavedChangesInKeys:ignoreKeys:](self, "_hasUnsavedChangesInKeys:ignoreKeys:", 0, a3);
}

- (BOOL)_hasUnsavedChangesInKeys:(id)a3 ignoreKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;

  v6 = a3;
  v7 = a4;
  -[EKObject changeSet](self, "changeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else if (!-[EKObject _cachedMeltedObjectsCount](self, "_cachedMeltedObjectsCount"))
  {
    v19 = 0;
    goto LABEL_17;
  }
  if (v7)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[EKObject changeSet](self, "changeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasUnsavedChanges");

  if (!v13)
    goto LABEL_15;
  v14 = (void *)MEMORY[0x1E0C99E20];
  -[EKObject changeSet](self, "changeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "changedKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "minusSet:", v10);
  if (v11)
    objc_msgSend(v17, "intersectSet:", v11);
  v18 = objc_msgSend(v17, "count");

  if (v18)
    v19 = 1;
  else
LABEL_15:
    v19 = -[EKObject _hasChangeHelperInKeys:ignoreKeys:checkUnsaved:](self, "_hasChangeHelperInKeys:ignoreKeys:checkUnsaved:", v11, v10, 1);

LABEL_17:
  return v19;
}

- (BOOL)_hasChangeHelperInKeys:(id)a3 ignoreKeys:(id)a4 checkUnsaved:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  char v14;
  char v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  EKObject *v24;
  BOOL v25;

  v8 = a3;
  v9 = a4;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __67__EKObject_Shared___hasChangeHelperInKeys_ignoreKeys_checkUnsaved___block_invoke;
  v21 = &unk_1E47872E8;
  v25 = a5;
  v22 = v9;
  v23 = v8;
  v24 = self;
  v10 = v8;
  v11 = v9;
  v12 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](&v18);
  -[EKObject _singleRelationshipKeysToCheckForChanges](self, "_singleRelationshipKeysToCheckForChanges", v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v13);

  if ((v14 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    -[EKObject _multiRelationshipKeysToCheckForChanges](self, "_multiRelationshipKeysToCheckForChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v16);

  }
  return v15;
}

uint64_t __67__EKObject_Shared___hasChangeHelperInKeys_ignoreKeys_checkUnsaved___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((!*(_BYTE *)(a1 + 56)
           || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) == 0&& ((v9 = *(void **)(a1 + 40)) == 0 || (objc_msgSend(v9, "containsObject:", v8) & 1) != 0)|| !*(_BYTE *)(a1 + 56))&& (objc_msgSend(*(id *)(a1 + 48), "_hasChangesForKey:checkUnsaved:", v8, *(unsigned __int8 *)(a1 + 56), (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_16;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)_singleRelationshipKeysToCheckForChanges
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "knownDerivedRelationshipKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v7);

  return v4;
}

- (id)_multiRelationshipKeysToCheckForChanges
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_hasChangesForKey:(id)a3
{
  return -[EKObject _hasChangesForKey:checkUnsaved:](self, "_hasChangesForKey:checkUnsaved:", a3, 1);
}

- (BOOL)_hasChangesForKey:(id)a3 checkUnsaved:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  BOOL v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v4
    || (-[EKObject changeSet](self, "changeSet"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasUnsavedChangeForKey:", v6),
        v7,
        (v8 & 1) == 0))
  {
    if (-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", v6))
    {
      LOBYTE(v9) = 0;
      goto LABEL_22;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__EKObject_Shared___hasChangesForKey_checkUnsaved___block_invoke;
    v23[3] = &__block_descriptor_33_e30_B16__0___EKFrozenMeltedPair__8l;
    v24 = v4;
    v10 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v23);
    -[EKObject _singleRelationshipKeysToCheckForChanges](self, "_singleRelationshipKeysToCheckForChanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v6);

    if (v12)
    {
      -[EKObject cachedMeltedObjectForSingleValueKey:](self, "cachedMeltedObjectForSingleValueKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = ((uint64_t (**)(_QWORD, void *))v10)[2](v10, v13);
    }
    else
    {
      -[EKObject _multiRelationshipKeysToCheckForChanges](self, "_multiRelationshipKeysToCheckForChanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v6);

      if (!v15)
      {
        LOBYTE(v9) = 0;
LABEL_21:

        goto LABEL_22;
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v6, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v9)
      {
        v16 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            if ((v10[2](v10, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)) & 1) != 0)
            {
              LOBYTE(v9) = 1;
              goto LABEL_20;
            }
          }
          v9 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          if (v9)
            continue;
          break;
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v9) = 1;
LABEL_22:

  return v9;
}

uint64_t __51__EKObject_Shared___hasChangesForKey_checkUnsaved___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isFrozen") & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 32))
      v6 = objc_msgSend(v4, "hasUnsavedChanges");
    else
      v6 = objc_msgSend(v4, "hasChanges");
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isOnlyChangedKey:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EKObject _areOnlyChangedKeys:](self, "_areOnlyChangedKeys:", v4);

  return (char)self;
}

- (BOOL)_areOnlyChangedKeys:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKObject changeSet](self, "changeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasUnsavedChanges");

  if (v6)
  {
    -[EKObject changeSet](self, "changeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changedKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "count") && !objc_msgSend(v8, "isSubsetOfSet:", v4))
  {
    v20 = 0;
    goto LABEL_28;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EKObject _singleRelationshipKeysToCheckForChanges](self, "_singleRelationshipKeysToCheckForChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
      if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v14))
      {
        if (!objc_msgSend(v4, "containsObject:", v14))
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[EKObject _multiRelationshipKeysToCheckForChanges](self, "_multiRelationshipKeysToCheckForChanges", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (!v15)
    {
      v20 = 1;
      goto LABEL_26;
    }
    v16 = v15;
    v17 = *(_QWORD *)v23;
LABEL_17:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v9);
      v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
      if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v19))
      {
        if (!objc_msgSend(v4, "containsObject:", v19))
          break;
      }
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        v20 = 1;
        if (v16)
          goto LABEL_17;
        goto LABEL_26;
      }
    }
  }
  v20 = 0;
LABEL_26:

LABEL_28:
  return v20;
}

- (void)addChangesFromObject:(id)a3
{
  -[EKObject addChangesFromObject:copyingBackingObjects:](self, "addChangesFromObject:copyingBackingObjects:", a3, 1);
}

- (void)addChangesFromObject:(id)a3 copyingBackingObjects:(BOOL)a4
{
  -[EKObject _addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:](self, "_addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:", a3, 0, 0, a4);
}

- (void)_addChangesFromObject:(id)a3 passingTest:(id)a4 ignoreRelations:(id)a5 copyingBackingObjects:(BOOL)a6
{
  _BOOL8 v6;
  EKObject *v10;
  id v11;
  void *v12;
  EKChangeSet *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  char v25;
  void *v26;
  void (**v27)(_QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *context;
  void *v39;
  EKChangeSet *v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  EKObject *v45;
  EKObject *v46;
  uint64_t j;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  EKObject *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  EKObject *v71;
  EKObject *v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v6 = a6;
  v77 = *MEMORY[0x1E0C80C00];
  v10 = (EKObject *)a3;
  v11 = a4;
  v43 = a5;
  v45 = self;
  v46 = v10;
  if (v10 != self)
  {
    context = (void *)MEMORY[0x1A85847F4]();
    -[EKObject changeSet](v10, "changeSet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[EKChangeSet initWithChangeSet:]([EKChangeSet alloc], "initWithChangeSet:", v39);
    v12 = v40;
    if (v11)
    {
      v13 = [EKChangeSet alloc];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke;
      v70[3] = &unk_1E4787330;
      v73 = v11;
      v71 = v10;
      v72 = self;
      v14 = -[EKChangeSet initWithChangeSet:filter:](v13, "initWithChangeSet:filter:", v40, v70);

      v12 = (void *)v14;
    }
    v37 = v12;
    -[EKObject _addChanges:copyingBackingObjects:](self, "_addChanges:copyingBackingObjects:");
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v67 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          if (!-[EKObject isPropertyUnavailable:](v10, "isPropertyUnavailable:", v19)
            && (objc_msgSend(v43, "containsObject:", v19) & 1) == 0)
          {
            -[EKObject valueForKey:](v10, "valueForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v20, v19))
            {
              -[EKObject meltedAndCachedSingleRelationObjectForKey:](v45, "meltedAndCachedSingleRelationObjectForKey:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "existingMeltedObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "_addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:", v22, v11, 0, v6);

            }
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v16);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v63 != v42)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          if (!-[EKObject isPropertyUnavailable:](v46, "isPropertyUnavailable:", v23))
          {
            objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v24, "containsObject:", v23) & 1) == 0)
            {
              v25 = objc_msgSend(v43, "containsObject:", v23);

              if ((v25 & 1) != 0)
                continue;
              -[EKObject valueForKey:](v45, "valueForKey:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = 0;
              v57 = &v56;
              v58 = 0x3032000000;
              v59 = __Block_byref_object_copy__18;
              v60 = __Block_byref_object_dispose__18;
              v61 = 0;
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke_2;
              v52[3] = &unk_1E4785298;
              v55 = &v56;
              v53 = v46;
              v54 = v23;
              v27 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v52);
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              v24 = v26;
              v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v74, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v49;
                do
                {
                  for (k = 0; k != v28; ++k)
                  {
                    if (*(_QWORD *)v49 != v29)
                      objc_enumerationMutation(v24);
                    v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                    objc_msgSend(v31, "changeSet");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "hasChanges");

                    if (v33)
                    {
                      v27[2](v27);
                      v34 = (void *)v57[5];
                      objc_msgSend(v31, "uniqueIdentifier");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "objectForKeyedSubscript:", v35);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v36)
                        objc_msgSend(v31, "_addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:", v36, v11, 0, v6);

                    }
                  }
                  v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v74, 16);
                }
                while (v28);
              }

              _Block_object_dispose(&v56, 8);
            }

          }
        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
      }
      while (v44);
    }

    objc_autoreleasePoolPop(context);
  }

}

uint64_t __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a2, a3, a1[4], a1[5]);
}

void __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)_addChangesFromObject:(id)a3 ignoringDifferencesFrom:(id)a4 changesToSkip:(id)a5 copyingBackingObjects:(BOOL)a6
{
  EKObject *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  EKChangeSet *v14;
  uint64_t v15;
  id v16;
  EKChangeSet *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  EKObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t m;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t n;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t ii;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *context;
  id v98;
  _BOOL4 v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  EKObject *v105;
  void *v106;
  uint64_t v107;
  id v108;
  EKObject *v109;
  id v110;
  EKChangeSet *v111;
  uint64_t v112;
  id v113;
  id obj;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[5];
  EKChangeSet *v145;
  id v146;
  _QWORD v147[4];
  id v148;
  id v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v99 = a6;
  v157 = *MEMORY[0x1E0C80C00];
  v9 = (EKObject *)a3;
  v10 = a4;
  v11 = a5;
  if (v9 != self)
  {
    context = (void *)MEMORY[0x1A85847F4]();
    v106 = v10;
    objc_msgSend(v10, "diffWithObject:compareUIVisiblePropertiesOnly:", self, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject changeSet](v9, "changeSet");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = [EKChangeSet alloc];
    v15 = MEMORY[0x1E0C809B0];
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_2;
    v147[3] = &unk_1E4787378;
    v98 = v11;
    v108 = v11;
    v148 = v108;
    v16 = v12;
    v149 = v16;
    v96 = (void *)v13;
    v17 = -[EKChangeSet initWithChangeSet:filter:](v14, "initWithChangeSet:filter:", v13, v147);
    -[EKChangeSet multiValueAdditions](v17, "multiValueAdditions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v15;
    v144[1] = 3221225472;
    v144[2] = __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_3;
    v144[3] = &unk_1E47873A0;
    v144[4] = self;
    v111 = v17;
    v145 = v111;
    v146 = &__block_literal_global_41;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v144);

    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v109 = self;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
    v104 = v16;
    v105 = v9;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v141;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v141 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * i);
          if (!-[EKObject isPropertyUnavailable:](v9, "isPropertyUnavailable:", v24))
          {
            objc_msgSend(v16, "relationshipSingleValueModifies");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](v9, "frozenOrMeltedCachedSingleRelationObjectForKey:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "frozenOrMeltedCachedSingleRelationObjectForKey:", v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v27, v24))
              {
                -[EKObject meltedAndCachedSingleRelationObjectForKey:](v109, "meltedAndCachedSingleRelationObjectForKey:", v24);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "semanticIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "semanticIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v30, "isEqualToString:", v31);

                if (v32)
                {
                  objc_msgSend(v27, "existingMeltedObject");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v33)
                  {
                    objc_msgSend(v28, "existingMeltedObject");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "_addChangesFromObject:ignoringDifferencesFrom:changesToSkip:copyingBackingObjects:", v33, v34, 0, v99);

                  }
                }

                v16 = v104;
                v9 = v105;
              }

            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
      }
      while (v21);
    }

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v35 = v109;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
    v10 = v106;
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v137;
      v101 = *(_QWORD *)v137;
      v102 = v36;
      do
      {
        v40 = 0;
        v103 = v38;
        do
        {
          if (*(_QWORD *)v137 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v40);
          if (!-[EKObject isPropertyUnavailable:](v9, "isPropertyUnavailable:", v41))
          {
            objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "containsObject:", v41) & 1) != 0)
              goto LABEL_76;
            v43 = objc_msgSend(v108, "containsObject:", v41);
            v44 = v42;
            v45 = v43;

            if ((v45 & 1) == 0)
            {
              v107 = v40;
              v115 = (void *)objc_opt_new();
              v46 = (void *)objc_opt_new();
              v47 = (void *)objc_opt_new();
              v112 = v41;
              -[EKObject frozenOrMeltedCachedMultiRelationObjectsForKey:](v9, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v41);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = 0u;
              v133 = 0u;
              v134 = 0u;
              v135 = 0u;
              obj = v48;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
              if (!v49)
                goto LABEL_38;
              v50 = v49;
              v51 = *(_QWORD *)v133;
              while (1)
              {
                for (j = 0; j != v50; ++j)
                {
                  if (*(_QWORD *)v133 != v51)
                    objc_enumerationMutation(obj);
                  v53 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
                  -[EKObject eventStore](v35, "eventStore");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "meltedObjectInStore:", v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(v53, "isNew") & 1) == 0)
                  {
                    objc_msgSend(v55, "committedCopy");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "semanticIdentifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v56)
                      goto LABEL_36;
LABEL_35:
                    objc_msgSend(v115, "setObject:forKeyedSubscript:", v55, v56);
                    goto LABEL_36;
                  }
                  objc_msgSend(v55, "semanticIdentifier");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v56)
                    goto LABEL_35;
LABEL_36:

                }
                v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
                if (!v50)
                {
LABEL_38:
                  objc_msgSend(v10, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v112);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v128 = 0u;
                  v129 = 0u;
                  v130 = 0u;
                  v131 = 0u;
                  v113 = v58;
                  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
                  if (v59)
                  {
                    v60 = v59;
                    v61 = *(_QWORD *)v129;
                    do
                    {
                      for (k = 0; k != v60; ++k)
                      {
                        if (*(_QWORD *)v129 != v61)
                          objc_enumerationMutation(v113);
                        v63 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
                        objc_msgSend(v63, "semanticIdentifier");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "setObject:forKeyedSubscript:", v63, v64);

                      }
                      v60 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
                    }
                    while (v60);
                  }
                  v65 = v112;
                  -[EKObject frozenOrMeltedCachedMultiRelationObjectsForKey:](v35, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v112);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v124 = 0u;
                  v125 = 0u;
                  v126 = 0u;
                  v127 = 0u;
                  v67 = v66;
                  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
                  v110 = v67;
                  if (v68)
                  {
                    v69 = v68;
                    v70 = *(_QWORD *)v125;
                    v71 = v115;
                    while (2)
                    {
                      for (m = 0; m != v69; ++m)
                      {
                        if (*(_QWORD *)v125 != v70)
                          objc_enumerationMutation(v110);
                        objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * m), "semanticIdentifier");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v71, "objectForKeyedSubscript:", v73);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v74 && objc_msgSend(v74, "hasChanges"))
                        {

                          v65 = v112;
                          -[EKObject meltedAndCachedMultiRelationObjectsForKey:](v35, "meltedAndCachedMultiRelationObjectsForKey:", v112);
                          v67 = (id)objc_claimAutoreleasedReturnValue();
                          v120 = 0u;
                          v121 = 0u;
                          v122 = 0u;
                          v123 = 0u;
                          v75 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v120, v151, 16);
                          if (v75)
                          {
                            v76 = v75;
                            v100 = v47;
                            v77 = v67;
                            v78 = *(_QWORD *)v121;
                            do
                            {
                              for (n = 0; n != v76; ++n)
                              {
                                if (*(_QWORD *)v121 != v78)
                                  objc_enumerationMutation(v77);
                                v80 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * n);
                                objc_msgSend(v80, "semanticIdentifier");
                                v81 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v115, "objectForKeyedSubscript:", v81);
                                v82 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v46, "objectForKeyedSubscript:", v81);
                                v83 = (void *)objc_claimAutoreleasedReturnValue();
                                v84 = v83;
                                if (v82)
                                {
                                  objc_msgSend(v83, "existingMeltedObject");
                                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v80, "_addChangesFromObject:ignoringDifferencesFrom:changesToSkip:copyingBackingObjects:", v82, v85, 0, 1);

                                }
                              }
                              v76 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v120, v151, 16);
                            }
                            while (v76);
                            v10 = v106;
                            v35 = v109;
                            v65 = v112;
                            v67 = v77;
                            v47 = v100;
                          }
                          goto LABEL_65;
                        }

                        v71 = v115;
                      }
                      v69 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
                      if (v69)
                        continue;
                      break;
                    }
                    v67 = v110;
                    v65 = v112;
                  }
LABEL_65:

                  -[EKObject frozenOrMeltedCachedMultiRelationObjectsForKey:](v35, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v65);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();

                  v118 = 0u;
                  v119 = 0u;
                  v116 = 0u;
                  v117 = 0u;
                  v87 = v86;
                  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v116, v150, 16);
                  if (v88)
                  {
                    v89 = v88;
                    v90 = *(_QWORD *)v117;
                    do
                    {
                      for (ii = 0; ii != v89; ++ii)
                      {
                        if (*(_QWORD *)v117 != v90)
                          objc_enumerationMutation(v87);
                        v92 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * ii);
                        objc_msgSend(v92, "semanticIdentifier");
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        v94 = objc_msgSend(v47, "containsObject:", v93);

                        if (v94)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v92);
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          -[EKChangeSet removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:](v111, "removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:", v95, v112, 0, 0, &__block_literal_global_41);
                        }
                        else
                        {
                          objc_msgSend(v92, "semanticIdentifier");
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v47, "addObject:", v95);
                        }

                      }
                      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v116, v150, 16);
                    }
                    while (v89);
                  }

                  v16 = v104;
                  v9 = v105;
                  v35 = v109;
                  v39 = v101;
                  v36 = v102;
                  v38 = v103;
                  v40 = v107;
                  v42 = v115;
LABEL_76:

                  break;
                }
              }
            }
          }
          ++v40;
        }
        while (v40 != v38);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
      }
      while (v38);
    }

    -[EKObject _addChanges:copyingBackingObjects:objectIdentifierBlock:](v35, "_addChanges:copyingBackingObjects:objectIdentifierBlock:", v111, v99, &__block_literal_global_41);
    objc_autoreleasePoolPop(context);
    v11 = v98;
  }

}

uint64_t __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "semanticIdentifier");
}

uint64_t __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7 && (objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "differentSingleValueKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v5) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "differentRelationshipSingleValueKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "containsObject:", v5) ^ 1;

    }
  }

  return v8;
}

void __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v24 = a1;
  v25 = v5;
  objc_msgSend(*(id *)(a1 + 32), "frozenOrMeltedCachedMultiRelationObjectsForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "semanticIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v21, "semanticIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v9, "containsObject:", v22);

        if (v23)
          objc_msgSend(v8, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(v24 + 40), "removeFromChanges:forMultiValueKey:basedOn:and:objectIdentifierBlock:", v8, v25, 0, 0, *(_QWORD *)(v24 + 48));

}

+ (void)addChangesFromObject:(id)a3 toObject:(id)a4 exceptWhereObjectIsDifferentFrom:(id)a5 skippingChanges:(id)a6
{
  objc_msgSend(a4, "_addChangesFromObject:ignoringDifferencesFrom:changesToSkip:copyingBackingObjects:", a3, a5, a6, 1);
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 except:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __58__EKObject_Shared__addChangesFromObject_toObjects_except___block_invoke;
    v15 = &unk_1E47873C8;
    v16 = v8;
    v17 = v10;
    v11 = (void *)MEMORY[0x1A85849D4](&v12);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "_addChangesFromObject:toObjects:passingTest:copyingBackingObjects:", v8, v9, v11, 1, v12, v13, v14, v15);

}

uint64_t __58__EKObject_Shared__addChangesFromObject_toObjects_except___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)(a1 + 32) == a4)
    return objc_msgSend(*(id *)(a1 + 40), "containsObject:", a2) ^ 1;
  else
    return 1;
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 keep:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56__EKObject_Shared__addChangesFromObject_toObjects_keep___block_invoke;
    v15 = &unk_1E47873C8;
    v16 = v8;
    v17 = v10;
    v11 = (void *)MEMORY[0x1A85849D4](&v12);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "_addChangesFromObject:toObjects:passingTest:copyingBackingObjects:", v8, v9, v11, 1, v12, v13, v14, v15);

}

uint64_t __56__EKObject_Shared__addChangesFromObject_toObjects_keep___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)(a1 + 32) == a4)
    return objc_msgSend(*(id *)(a1 + 40), "containsObject:", a2);
  else
    return 1;
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5
{
  objc_msgSend(a1, "_addChangesFromObject:toObjects:passingTest:copyingBackingObjects:", a3, a4, a5, 1);
}

+ (void)_addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5 copyingBackingObjects:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  id v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v39 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  v38 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v8, "cachedMeltedObjectForSingleValueKey:", v15, v37);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16 || (objc_msgSend(v16, "isNew") & 1) != 0 || (objc_msgSend(v17, "hasChanges") & 1) == 0)
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v12);
  }
  v40 = v9;

  objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v41 = v8;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        if ((objc_msgSend(v18, "containsObject:", v23, v37) & 1) == 0)
        {
          v24 = v18;
          objc_msgSend(v41, "cachedMeltedObjectsForMultiValueKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v26 = v25;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v48;
            while (2)
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v48 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
                if ((objc_msgSend(v31, "isNew") & 1) == 0 && (objc_msgSend(v31, "hasChanges") & 1) != 0)
                {

                  goto LABEL_29;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
              if (v28)
                continue;
              break;
            }
          }

          objc_msgSend(v40, "addObject:", v23);
LABEL_29:

          v18 = v24;
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v20);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v37;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "_addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:", v41, v38, v40, v39, v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v34);
  }

}

- (void)addChanges:(id)a3
{
  -[EKObject _addChanges:copyingBackingObjects:](self, "_addChanges:copyingBackingObjects:", a3, 1);
}

- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4
{
  -[EKObject _addChanges:copyingBackingObjects:objectIdentifierBlock:](self, "_addChanges:copyingBackingObjects:objectIdentifierBlock:", a3, a4, 0);
}

- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4 objectIdentifierBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  if (v5)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke;
    v17[3] = &unk_1E47873F0;
    v18 = v12;
    v13 = v12;
    v14 = (void *)MEMORY[0x1A85849D4](v17);

  }
  else
  {
    v14 = &__block_literal_global_45;
  }
  -[EKObject changeSet](self, "changeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addChanges:shouldCopyKeyCallback:objectIdentifierBlock:", v9, v14, v8);

  -[EKObject changeSet](self, "changeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject updateAfterApplyingChanges:objectIdentifierBlock:](self, "updateAfterApplyingChanges:objectIdentifierBlock:", v16, v8);

}

uint64_t __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke_2()
{
  return 0;
}

+ (id)keysToIgnoreForApplyingChanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)applyChanges:(id)a3
{
  EKChangeSet *v4;
  void *v5;
  EKChangeSet *v6;
  id v7;

  v7 = a3;
  v4 = [EKChangeSet alloc];
  objc_msgSend((id)objc_opt_class(), "keysToIgnoreForApplyingChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKChangeSet initWithChangeSet:changesToSkip:](v4, "initWithChangeSet:changesToSkip:", v7, v5);
  -[EKObject setChangeSet:](self, "setChangeSet:", v6);

  -[EKObject updateAfterApplyingChanges:objectIdentifierBlock:](self, "updateAfterApplyingChanges:objectIdentifierBlock:", v7, 0);
}

- (void)setSingleChangedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  if (!-[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", v7, 1))
  {
    -[EKObject changeSet](self, "changeSet");
    v9 = objc_claimAutoreleasedReturnValue();
    -[EKObject backingObject](self, "backingObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject changeSingleValue:forKey:basedOn:and:](v9, "changeSingleValue:forKey:basedOn:and:", v6, v7, v11, v10);
    goto LABEL_5;
  }
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    -[EKObject backingObject](self, "backingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_error_impl(&dword_1A2318000, v9, OS_LOG_TYPE_ERROR, "Unable to set single changed value %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:

  }
}

- (void)addMultiChangedObjectValue:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject addMultiChangedObjectValues:forKey:](self, "addMultiChangedObjectValues:forKey:", v8, v7);

}

- (void)addMultiChangedObjectValues:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  if (!-[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", v7, 1))
  {
    -[EKObject changeSet](self, "changeSet");
    v9 = objc_claimAutoreleasedReturnValue();
    -[EKObject backingObject](self, "backingObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addToChanges:forMultiValueKey:basedOn:and:](v9, "addToChanges:forMultiValueKey:basedOn:and:", v6, v7, v11, v10);
    goto LABEL_5;
  }
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    -[EKObject backingObject](self, "backingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_error_impl(&dword_1A2318000, v9, OS_LOG_TYPE_ERROR, "Unable to add multi changed object values %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:

  }
}

- (void)removeMultiChangedObjectValue:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject removeMultiChangedObjectValues:forKey:](self, "removeMultiChangedObjectValues:forKey:", v8, v7);

}

- (void)removeMultiChangedObjectValues:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKObject _initChangeSetIfNone](self, "_initChangeSetIfNone");
  if (!-[EKObject _isPropertyUnavailable:convertToFullObjectIfUnavailable:](self, "_isPropertyUnavailable:convertToFullObjectIfUnavailable:", v7, 1))
  {
    -[EKObject changeSet](self, "changeSet");
    v9 = objc_claimAutoreleasedReturnValue();
    -[EKObject backingObject](self, "backingObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeFromChanges:forMultiValueKey:basedOn:and:](v9, "removeFromChanges:forMultiValueKey:basedOn:and:", v6, v7, v11, v10);
    goto LABEL_5;
  }
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    -[EKObject backingObject](self, "backingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_error_impl(&dword_1A2318000, v9, OS_LOG_TYPE_ERROR, "Unable to remove multi changed object values %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:

  }
}

- (void)replaceMultiChangedObjectValuesWithObjectValues:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject removeMultiChangedObjectValues:forKey:](self, "removeMultiChangedObjectValues:forKey:", v7, v6);

  -[EKObject addMultiChangedObjectValues:forKey:](self, "addMultiChangedObjectValues:forKey:", v8, v6);
}

- (id)changedKeys
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeleted");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)MEMORY[0x1E0C99E20];
  -[EKObject changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v15))
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v21))
          objc_msgSend(v9, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

  return v9;
}

- (void)_rollbackCommon
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rollbackChanges");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v9))
        {
          -[EKObject valueForKey:](self, "valueForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v10, v9))
          {
            objc_msgSend(v10, "existingMeltedObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "rollback");

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", v16))
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          -[EKObject valueForKey:](self, "valueForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v26;
            do
            {
              for (k = 0; k != v19; ++k)
              {
                if (*(_QWORD *)v26 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * k);
                if (objc_msgSend((id)objc_opt_class(), "isMeltedAndNotWeakRelationshipObject:forKey:", v22, v16))
                {
                  objc_msgSend(v22, "existingMeltedObject");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "rollback");

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            }
            while (v19);
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v13);
  }

  -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](self, "_resetAfterUpdatingChangeSetOrBackingObject");
}

- (BOOL)_resetIfBackingObjectIsOfClass:(Class)a3 fetchResetFrozenObjectBlock:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  v5 = (void (**)(id, void *))a4;
  -[EKObject backingObject](self, "backingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[2](v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = v7 != 0;
    if (v7)
      v10 = v7 == (_QWORD)v6;
    else
      v10 = 1;
    if (!v10)
      -[EKObject _resetWithFrozenObject:](self, "_resetWithFrozenObject:", v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_resetCommon
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  _BOOL4 v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v22 = -[EKObject isDeleted](self, "isDeleted");
  -[EKObject setChangeSet:](self, "setChangeSet:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](self, "frozenOrMeltedCachedSingleRelationObjectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v9, v8) & 1) == 0)
          objc_msgSend(v9, "reset");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[EKObject frozenOrMeltedCachedMultiRelationObjectsForKey:](self, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v25;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * k);
              if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v20, v14) & 1) == 0)
                objc_msgSend(v20, "reset");
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          }
          while (v17);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v11);
  }

  -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](self, "_resetAfterUpdatingChangeSetOrBackingObject");
  if (v22)
    -[EKObject markAsDeleted](self, "markAsDeleted");
  return 1;
}

- (BOOL)_refreshable
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EKObject persistentObject](self, "persistentObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNew");

  if ((v4 & 1) != 0)
    return 0;
  -[EKObject persistentObject](self, "persistentObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_isPendingUpdate") & 1) != 0 || (objc_msgSend(v6, "_isPendingDelete") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[EKObject eventStore](self, "eventStore", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsPendingCommit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) != 0)
          {
            v5 = 0;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v5 = 1;
LABEL_16:

  }
  return v5;
}

- (BOOL)_refreshCommon
{
  EKObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t n;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  void *v53;
  void *v54;
  EKObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  id obj;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  EKObject *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v2 = self;
  v107 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v98 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
        -[EKObject cachedMeltedObjectForSingleValueKey:](v2, "cachedMeltedObjectForSingleValueKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v10, v9) & 1) == 0)
          {
            objc_msgSend(v10, "changeSet");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v10, "changeSet");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(v12, "copy");
              objc_msgSend(v70, "setObject:forKeyedSubscript:", v13, v9);

            }
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
    }
    while (v6);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v75 = v2;
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
  if (v65)
  {
    v63 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != (id)v65; j = (char *)j + 1)
      {
        if (*(_QWORD *)v94 != v63)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j);
        -[EKObject cachedMeltedObjectsForMultiValueKey:](v2, "cachedMeltedObjectsForMultiValueKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "multiValueAdditions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v68 = j;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v66 = v16;
          v19 = v16;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v90;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v90 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
                if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v24, v15) & 1) == 0)
                {
                  objc_msgSend(v24, "changeSet");
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v26 = (void *)v25;
                    objc_msgSend(v24, "uniqueIdentifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v27)
                    {
                      objc_msgSend(v24, "changeSet");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = (void *)objc_msgSend(v28, "copy");
                      objc_msgSend(v24, "uniqueIdentifier");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "setObject:forKeyedSubscript:", v29, v30);

                      v2 = v75;
                    }
                  }
                }
                objc_msgSend(v24, "backingObject");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v18, "containsObject:", v31);

                if (v32)
                  objc_msgSend(v73, "addObject:", v24);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
            }
            while (v21);
          }

          if (objc_msgSend(v71, "count"))
            objc_msgSend(v70, "setObject:forKeyedSubscript:", v71, v15);
          v16 = v66;
          j = v68;
          if (objc_msgSend(v73, "count"))
            objc_msgSend(v61, "setObject:forKey:", v73, v15);

        }
      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
    }
    while (v65);
  }

  v33 = -[EKObject _reset](v2, "_reset");
  v34 = v33;
  if (v33)
  {
    v67 = v33;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __34__EKObject_Shared___refreshCommon__block_invoke;
    v88[3] = &unk_1E4787458;
    v88[4] = v2;
    objc_msgSend(v61, "enumerateKeysAndObjectsUsingBlock:", v88);
    -[EKObject updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:](v2, "updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:", v64, 1, 0);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v85;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v85 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * m);
          objc_msgSend(v70, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            -[EKObject valueForKey:](v2, "valueForKey:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKObject eventStore](v2, "eventStore");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "meltedObjectInStore:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "setChangeSet:", v41);
            -[EKObject setValue:forKey:](v2, "setValue:forKey:", v44, v40);

          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
      }
      while (v37);
    }

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
    v69 = (id)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    if (v74)
    {
      v72 = *(_QWORD *)v81;
      do
      {
        for (n = 0; n != v74; ++n)
        {
          if (*(_QWORD *)v81 != v72)
            objc_enumerationMutation(v69);
          v46 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * n);
          objc_msgSend(v70, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v47, "count"))
          {
            -[EKObject valueForKey:](v2, "valueForKey:", v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v77;
              do
              {
                for (ii = 0; ii != v50; ++ii)
                {
                  if (*(_QWORD *)v77 != v51)
                    objc_enumerationMutation(v48);
                  v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * ii);
                  objc_msgSend(v53, "uniqueIdentifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v54)
                  {
                    objc_msgSend(v53, "uniqueIdentifier");
                    v55 = v2;
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "objectForKeyedSubscript:", v56);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();

                    -[EKObject eventStore](v55, "eventStore");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "meltedObjectInStore:", v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v57)
                      objc_msgSend(v59, "setChangeSet:", v57);

                    v2 = v75;
                  }
                }
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
              }
              while (v50);
            }

          }
        }
        v74 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
      }
      while (v74);
    }

    -[EKObject setChangeSet:](v2, "setChangeSet:", v64);
    v34 = v67;
  }

  return v34;
}

void __34__EKObject_Shared___refreshCommon__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "_addCachedMeltedObject:forMultiValueKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_resetWithFrozenObject:(id)a3
{
  id v4;

  v4 = a3;
  -[EKObject setBackingObject:](self, "setBackingObject:", v4);
  -[EKObject setAdditionalFrozenProperties:](self, "setAdditionalFrozenProperties:", 0);
  -[EKObject _applyDefinedAfterFirstSaveFrom:](self, "_applyDefinedAfterFirstSaveFrom:", v4);

  -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](self, "_resetAfterUpdatingChangeSetOrBackingObject");
}

- (void)_applyKnownImmutableValuesFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend((id)objc_opt_class(), "knownImmutableKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v6)
      goto LABEL_14;
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[EKObject additionalFrozenProperties](self, "additionalFrozenProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;

        }
        else
        {
          objc_msgSend(v4, "valueForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            goto LABEL_12;
        }
        v14 = objc_opt_class();
        if (v14 != objc_opt_class())
          -[EKObject setValue:forKey:](self, "setValue:forKey:", v13, v10);
LABEL_12:

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v7)
      {
LABEL_14:

        break;
      }
    }
  }

}

void __39__EKObject_Shared__cachedMeltedObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__EKObject_Shared__setCachedMeltedObjects___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "set_cachedMeltedObjects:", v2);

}

- (unint64_t)_cachedMeltedObjectsCount
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
  v4[2] = __45__EKObject_Shared___cachedMeltedObjectsCount__block_invoke;
  v4[3] = &unk_1E4785190;
  v4[4] = self;
  v4[5] = &v5;
  -[EKObject _performWithLock:](self, "_performWithLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__EKObject_Shared___cachedMeltedObjectsCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)_updateCachedMeltedObjectSetForMultiValueKey:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__EKObject_Shared___updateCachedMeltedObjectSetForMultiValueKey_usingBlock___block_invoke;
  v14[3] = &unk_1E4785298;
  v16 = &v17;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  -[EKObject _performWithLock:](self, "_performWithLock:", v14);
  v10 = v18[5];
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18[5];
    v18[5] = v11;

    v10 = v18[5];
  }
  v7[2](v7, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject setCachedMeltedObjects:forMultiValueKey:](self, "setCachedMeltedObjects:forMultiValueKey:", v13, v9);

  _Block_object_dispose(&v17, 8);
}

void __76__EKObject_Shared___updateCachedMeltedObjectSetForMultiValueKey_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[EKObject eventStore](self, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "meltedObjectInStore:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frozenObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject _addCachedMeltedObject:forMultiValueKey:](self, "_addCachedMeltedObject:forMultiValueKey:", v10, v6);
  -[EKObject addMultiChangedObjectValue:forKey:](self, "addMultiChangedObjectValue:forKey:", v9, v6);

}

- (void)_addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__EKObject_Shared___addCachedMeltedObject_forMultiValueKey___block_invoke;
    v8[3] = &unk_1E4787480;
    v9 = v6;
    -[EKObject _updateCachedMeltedObjectSetForMultiValueKey:usingBlock:](self, "_updateCachedMeltedObjectSetForMultiValueKey:usingBlock:", a4, v8);

  }
}

uint64_t __60__EKObject_Shared___addCachedMeltedObject_forMultiValueKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setByAddingObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[EKObject _removeCachedMeltedObject:forMultiValueKey:](self, "_removeCachedMeltedObject:forMultiValueKey:", v7, v6);
  objc_msgSend(v7, "frozenObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[EKObject removeMultiChangedObjectValue:forKey:](self, "removeMultiChangedObjectValue:forKey:", v8, v6);
}

- (void)_removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__EKObject_Shared___removeCachedMeltedObject_forMultiValueKey___block_invoke;
    v8[3] = &unk_1E47874A8;
    v9 = v6;
    -[EKObject _updateCachedMeltedObjectSetForMultiValueKey:usingBlock:](self, "_updateCachedMeltedObjectSetForMultiValueKey:usingBlock:", a4, v8);

  }
}

id __63__EKObject_Shared___removeCachedMeltedObject_forMultiValueKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)frozenOrMeltedCachedMultiRelationObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)updateMeltedAndCachedSingleRelationObject:(id)a3 forKey:(id)a4 frozenClass:(Class)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  -[EKObject eventStore](self, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meltedObjectInStore:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frozenObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !v10 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKObject(Shared) meltedAndCachedSingleRelationObjectForKey:].cold.1();
  -[EKObject setCachedMeltedObject:forSingleValueKey:](self, "setCachedMeltedObject:forSingleValueKey:", v10, v7);
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v11, v7);

}

- (void)updateMeltedAndCachedMultiRelationObjects:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  EKObject *v39;
  id v40;
  id v41;
  NSObject *log;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[EKObject eventStore](self, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1E0C99000uLL;
  v11 = v8;
  if (v9)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v17, "eventStore");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v17, "eventStore");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9 != v20)
            {
              v39 = self;
              v40 = v8;
              v41 = v7;
              v21 = v12;

              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count"));
              v12 = (id)objc_claimAutoreleasedReturnValue();
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v22 = v21;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v48 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                    objc_msgSend(v27, "meltedObjectInStore:", v9);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v28)
                    {
                      objc_msgSend(v12, "addObject:", v28);
                    }
                    else
                    {
                      v29 = (void *)EKLogHandle;
                      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                      {
                        log = v29;
                        v30 = objc_opt_class();
                        objc_msgSend(v27, "objectID");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v57 = v27;
                        v58 = 2114;
                        v59 = v30;
                        v60 = 2114;
                        v61 = v31;
                        _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Failed to copy %@ (class = %{public}@, objectID = %{public}@) to my event store.", buf, 0x20u);

                      }
                    }

                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
                }
                while (v24);
              }

              v11 = (void *)objc_msgSend(v12, "copy");
              v8 = v40;
              v7 = v41;
              self = v39;
              goto LABEL_24;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v14)
          continue;
        break;
      }
      v11 = v12;
LABEL_24:
      v10 = 0x1E0C99000;
    }
    else
    {
      v11 = v12;
    }

  }
  -[EKObject setCachedMeltedObjects:forMultiValueKey:](self, "setCachedMeltedObjects:forMultiValueKey:", v8, v7);
  objc_msgSend(*(id *)(v10 + 3616), "setWithCapacity:", objc_msgSend(v11, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v33 = v11;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "frozenObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v35);
  }

  -[EKObject replaceMultiChangedObjectValuesWithObjectValues:forKey:](self, "replaceMultiChangedObjectValuesWithObjectValues:forKey:", v32, v7);
}

- (unint64_t)meltedAndCachedMultiRelationCountForKey:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  EKObject *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__EKObject_Shared__meltedAndCachedMultiRelationCountForKey___block_invoke;
  v12 = &unk_1E47874D0;
  v13 = self;
  v5 = v4;
  v14 = v5;
  v15 = &v21;
  v16 = &v17;
  -[EKObject _performWithLock:](self, "_performWithLock:", &v9);
  if (*((_BYTE *)v22 + 24))
  {
    v6 = v18[3];
  }
  else
  {
    -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v5, v9, v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count");

  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __60__EKObject_Shared__meltedAndCachedMultiRelationCountForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "count");
    v3 = v4;
  }

}

- (void)updateAfterApplyingChanges:(id)a3 objectIdentifierBlock:(id)a4
{
  -[EKObject updateMeltedCacheForChangeSet:objectIdentifierBlock:](self, "updateMeltedCacheForChangeSet:objectIdentifierBlock:", a3, a4);
  -[EKObject _resetInternalStateWithForce:](self, "_resetInternalStateWithForce:", 0);
}

- (void)updateMeltedCacheForChangeSet:(id)a3 objectIdentifierBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  EKObject *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "changedSingleValueKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72__EKObject_Shared__updateMeltedCacheForChangeSet_objectIdentifierBlock___block_invoke;
  v13 = &unk_1E47853B0;
  v14 = v8;
  v15 = self;
  v9 = v8;
  -[EKObject _performWithLock:](self, "_performWithLock:", &v10);
  -[EKObject updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:](self, "updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:", v7, 0, v6, v10, v11, v12, v13);

}

void __72__EKObject_Shared__updateMeltedCacheForChangeSet_objectIdentifierBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "_cachedMeltedObjects", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)updateMultiValueCacheForChangeSet:(id)a3 preservingExistingAdds:(BOOL)a4 objectIdentifierBlock:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v50;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v68 = 0u;
  v69 = 0u;
  if (v7)
    v8 = v7;
  else
    v8 = &__block_literal_global_55;
  v70 = 0uLL;
  v71 = 0uLL;
  objc_msgSend(v6, "changedMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v69;
    v42 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v69 != v41)
          objc_enumerationMutation(obj);
        v46 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v9);
        v11 = -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", v10);
        -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_2;
        v65[3] = &unk_1E4787518;
        v15 = v8;
        v67 = v15;
        v53 = v13;
        v66 = v53;
        v45 = v12;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v65);
        -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v14;
        v62[1] = 3221225472;
        v62[2] = __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_3;
        v62[3] = &unk_1E4787540;
        v18 = v15;
        v64 = v18;
        v47 = v17;
        v63 = v47;
        v44 = v16;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v62);
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v52 = v10;
        objc_msgSend(v6, "unsavedMultiValueRemovedObjectsForKey:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v59 != v22)
                objc_enumerationMutation(v19);
              (*((void (**)(id, _QWORD))v8 + 2))(v18, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(v53, "objectForKeyedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                  -[EKObject _removeCachedMeltedObject:forMultiValueKey:](self, "_removeCachedMeltedObject:forMultiValueKey:", v25, v52);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
          }
          while (v21);
        }

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v6, "unsavedMultiValueAddedObjectsForKey:", v52);
        v50 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v54, v76, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v55;
          do
          {
            v29 = 0;
            v48 = v27;
            do
            {
              if (*(_QWORD *)v55 != v28)
                objc_enumerationMutation(v50);
              v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v29);
              (*((void (**)(id, void *))v8 + 2))(v18, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                objc_msgSend(v53, "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32 && !a4)
                  -[EKObject _removeCachedMeltedObject:forMultiValueKey:](self, "_removeCachedMeltedObject:forMultiValueKey:", v32, v52);
                if (v32)
                  v33 = a4;
                else
                  v33 = 0;
                if (!v33)
                {
                  v34 = v18;
                  v35 = v28;
                  objc_msgSend(v47, "objectForKeyedSubscript:", v31);
                  v36 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v36)
                  {
                    v37 = EKLogHandle;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v73 = v31;
                      v74 = 2114;
                      v75 = v52;
                      _os_log_error_impl(&dword_1A2318000, v37, OS_LOG_TYPE_ERROR, "Missing corresponding added object with semantic identifier %@ for relation key %{public}@.", buf, 0x16u);
                    }
                    v36 = v30;
                  }
                  -[EKObject eventStore](self, "eventStore");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "meltedObjectInStore:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  -[EKObject _addCachedMeltedObject:forMultiValueKey:](self, "_addCachedMeltedObject:forMultiValueKey:", v39, v52);
                  v28 = v35;
                  v18 = v34;
                  v27 = v48;
                }

              }
              ++v29;
            }
            while (v27 != v29);
            v27 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v54, v76, 16);
          }
          while (v27);
        }

        v9 = v46 + 1;
        v6 = v42;
      }
      while (v46 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v43);
  }

}

uint64_t __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

}

void __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

}

- (void)_resetAfterUpdatingChangeSetOrBackingObjectWithForce:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[EKObject _resetMeltedCache](self, "_resetMeltedCache");
  -[EKObject _resetInternalStateWithForce:](self, "_resetInternalStateWithForce:", v3);
}

- (void)_resetAfterUpdatingChangeSetOrBackingObject
{
  -[EKObject _resetMeltedCache](self, "_resetMeltedCache");
  -[EKObject _resetInternalStateWithForce:](self, "_resetInternalStateWithForce:", 0);
}

- (void)_resetMeltedCache
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  EKObject *v57;
  id obj;
  id obja;
  int v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  v57 = self;
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v81 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1A85847F4]();
        -[EKObject cachedMeltedObjectForSingleValueKey:](self, "cachedMeltedObjectForSingleValueKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[EKObject backingObject](self, "backingObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "valueForKey:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "backingObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if ((void *)v12 == v11)
          {

          }
          else
          {
            v13 = (void *)v12;
            objc_msgSend(v9, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uniqueIdentifier");
            v15 = v4;
            v16 = v5;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v14, "isEqualToString:", v17);

            v5 = v16;
            v4 = v15;

            self = v57;
            if (!v60)
            {
              -[EKObject setCachedMeltedObject:forSingleValueKey:](v57, "setCachedMeltedObject:forSingleValueKey:", 0, v7);
LABEL_12:

              goto LABEL_13;
            }
          }
          objc_msgSend(v9, "_resetWithFrozenObject:", v11);
          goto LABEL_12;
        }
LABEL_13:

        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v4);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v77;
    v21 = 0x1E0C99000uLL;
    v22 = MEMORY[0x1E0C809B0];
    v52 = *(_QWORD *)v77;
    do
    {
      v23 = 0;
      v53 = v19;
      do
      {
        if (*(_QWORD *)v77 != v20)
          objc_enumerationMutation(v54);
        v24 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v23);
        v25 = (void *)MEMORY[0x1A85847F4]();
        -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v21 + 3592), "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v22;
        v74[1] = 3221225472;
        v74[2] = __37__EKObject_Shared___resetMeltedCache__block_invoke;
        v74[3] = &unk_1E4787568;
        obja = v27;
        v75 = obja;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v74);
        if (v26)
        {
          if (objc_msgSend(v26, "count"))
          {
            v55 = v25;
            v56 = v23;
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v26);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            -[EKObject backingObject](self, "backingObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "valueForKey:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = v29;
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
            v32 = v26;
            v33 = obja;
            if (v31)
            {
              v34 = v31;
              v35 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v71 != v35)
                    objc_enumerationMutation(v30);
                  v37 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                  objc_msgSend(v37, "uniqueIdentifier", v52);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "objectForKeyedSubscript:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v39)
                  {
                    objc_msgSend(v39, "_resetWithFrozenObject:", v37);
                    objc_msgSend(v61, "removeObject:", v39);
                  }
                  else
                  {
                    -[EKObject eventStore](v57, "eventStore");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "meltedObjectInStore:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    v33 = obja;
                    -[EKObject _addCachedMeltedObject:forMultiValueKey:](v57, "_addCachedMeltedObject:forMultiValueKey:", v41, v24);

                  }
                }
                v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
              }
              while (v34);
            }

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v42 = v61;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
            self = v57;
            v19 = v53;
            v25 = v55;
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v67;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v67 != v45)
                    objc_enumerationMutation(v42);
                  -[EKObject _removeCachedMeltedObject:forMultiValueKey:](v57, "_removeCachedMeltedObject:forMultiValueKey:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k), v24, v52);
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
              }
              while (v44);
            }

            v20 = v52;
            v21 = 0x1E0C99000;
            v22 = MEMORY[0x1E0C809B0];
            v26 = v32;
            v23 = v56;
          }
          else
          {
            -[EKObject emptyMeltedCacheForKey:](self, "emptyMeltedCacheForKey:", v24);
          }
        }

        objc_autoreleasePoolPop(v25);
        ++v23;
      }
      while (v23 != v19);
      v19 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    }
    while (v19);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownDerivedRelationshipKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v63 != v50)
          objc_enumerationMutation(v47);
        -[EKObject setCachedMeltedObject:forSingleValueKey:](self, "setCachedMeltedObject:forSingleValueKey:", 0, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m), v52);
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    }
    while (v49);
  }

}

void __37__EKObject_Shared___resetMeltedCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v6);

  }
  else
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __37__EKObject_Shared___resetMeltedCache__block_invoke_cold_1((uint64_t)v3, v7);
  }

}

- (void)emptyMeltedCache
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__EKObject_Shared__emptyMeltedCache__block_invoke;
  v2[3] = &unk_1E4785078;
  v2[4] = self;
  -[EKObject _performWithLock:](self, "_performWithLock:", v2);
}

void __36__EKObject_Shared__emptyMeltedCache__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)emptyMeltedCacheForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__emptyMeltedCacheForKey___block_invoke;
  v6[3] = &unk_1E47853B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EKObject _performWithLock:](self, "_performWithLock:", v6);

}

void __43__EKObject_Shared__emptyMeltedCacheForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)emptyMeltedCacheForKeys:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__EKObject_Shared__emptyMeltedCacheForKeys___block_invoke;
  v6[3] = &unk_1E47853B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EKObject _performWithLock:](self, "_performWithLock:", v6);

}

void __44__EKObject_Shared__emptyMeltedCacheForKeys___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));

}

- (id)copyMeltedObjectCache
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
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__EKObject_Shared__copyMeltedObjectCache__block_invoke;
  v4[3] = &unk_1E4785190;
  v4[4] = self;
  v4[5] = &v5;
  -[EKObject _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__EKObject_Shared__copyMeltedObjectCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)augmentMeltedObjectCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKObject *v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  id obj;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  EKObject *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v57 = self;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v79 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](v57, "frozenOrMeltedCachedSingleRelationObjectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "frozenObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frozenObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v14)
            -[EKObject setCachedMeltedObject:forSingleValueKey:](v57, "setCachedMeltedObject:forSingleValueKey:", v11, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v7);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v15 = v57;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v75 != v52)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v56 = j;
          v54 = v17;
          -[EKObject frozenOrMeltedCachedMultiRelationObjectsForKey:](v15, "frozenOrMeltedCachedMultiRelationObjectsForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v21 = v19;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v71;
            do
            {
              for (k = 0; k != v23; ++k)
              {
                if (*(_QWORD *)v71 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
                objc_msgSend(v26, "objectID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v27);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
            }
            while (v23);
          }

          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v21, "count"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v55 = v18;
          v29 = v18;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v67;
            do
            {
              for (m = 0; m != v31; ++m)
              {
                if (*(_QWORD *)v67 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
                objc_msgSend(v34, "objectID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (v36)
                {
                  objc_msgSend(v28, "addObject:", v34);
                  objc_msgSend(v20, "removeObjectForKey:", v35);
                }

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
            }
            while (v31);
          }

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v37 = v20;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
          v15 = v57;
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v63;
            do
            {
              for (n = 0; n != v39; ++n)
              {
                if (*(_QWORD *)v63 != v40)
                  objc_enumerationMutation(v37);
                objc_msgSend(v37, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * n));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[EKObject eventStore](v57, "eventStore");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "meltedObjectInStore:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "addObject:", v44);
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
            }
            while (v39);
          }

          -[EKObject setCachedMeltedObjects:forMultiValueKey:](v57, "setCachedMeltedObjects:forMultiValueKey:", v28, v54);
          v4 = v51;
          v18 = v55;
          j = v56;
        }

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v53);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownDerivedRelationshipKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(v45);
        -[EKObject setCachedMeltedObject:forSingleValueKey:](v15, "setCachedMeltedObject:forSingleValueKey:", 0, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * ii));
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
    }
    while (v47);
  }

}

- (id)diffWithObject:(id)a3
{
  return -[EKObject diffWithObject:compareUIVisiblePropertiesOnly:](self, "diffWithObject:compareUIVisiblePropertiesOnly:", a3, 0);
}

- (id)diffWithObject:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  return +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:](EKDiff, "diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:", self, a3, a4);
}

- (id)inverseObjectWithObject:(id)a3 diff:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  EKObject *v21;
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  -[EKObject snapshotCopy](self, "snapshotCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diffWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  objc_msgSend((id)objc_opt_class(), "_changeSetForDiff:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyChanges:", v10);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__18;
  v28 = __Block_byref_object_dispose__18;
  v29 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke;
  v23[3] = &unk_1E4785190;
  v23[4] = self;
  v23[5] = &v24;
  -[EKObject _performWithLock:](self, "_performWithLock:", v23);
  if (objc_msgSend((id)v25[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v25[5], "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25[5];
    v17 = v11;
    v18 = 3221225472;
    v19 = __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke_2;
    v20 = &unk_1E4784F98;
    v21 = self;
    v14 = v12;
    v22 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v17);
    v15 = (void *)objc_msgSend(v14, "copy", v17, v18, v19, v20, v21);
    objc_msgSend(v7, "setAdditionalMeltedObjects:", v15);

  }
  _Block_object_dispose(&v24, 8);

  return v7;
}

void __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v6, v5) & 1) == 0)
    {
      objc_msgSend(v6, "snapshotCopy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);

    }
  }
  else
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "snapshotCopy", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    v18 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v5);

  }
}

+ (id)duplicatedPersistentObjectForObject:(id)a3 alreadyCopiedObjects:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "duplicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updatePersistentObject");
    objc_msgSend(v9, "backingObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
  return v8;
}

+ (id)_changeSetForDiff:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  objc_msgSend(a3, "changeSetForDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "singleValueChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke;
  v27[3] = &unk_1E4787590;
  v30 = a1;
  v9 = v7;
  v28 = v9;
  v10 = v4;
  v29 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);
  objc_msgSend(v10, "multiValueAdditions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_63;
  v23[3] = &unk_1E47875E0;
  v26 = a1;
  v24 = v9;
  v13 = v10;
  v25 = v13;
  v14 = v9;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v23);
  objc_msgSend(v13, "multiValueRemovals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_64;
  v21[3] = &unk_1E4787630;
  v17 = v13;
  v22 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
  v18 = v22;
  v19 = v17;

  return v19;
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {

  }
  else
  {
    v8 = (void *)v7;
    objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v6;
        objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v5);

        if ((v13 & 1) != 0)
          objc_msgSend(v11, "backingObject");
        else
          objc_msgSend(*(id *)(a1 + 48), "duplicatedPersistentObjectForObject:alreadyCopiedObjects:", v11, *(_QWORD *)(a1 + 32));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v6;
        objc_msgSend((id)objc_opt_class(), "knownRelationshipWeakKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v5);

        if ((v17 & 1) != 0)
          v14 = v15;
        else
          v14 = (id)objc_msgSend(v15, "copy");
LABEL_15:
        v19 = v14;

        objc_msgSend(*(id *)(a1 + 40), "forceChangeValue:forKey:", v19, v5);
        goto LABEL_16;
      }
      v18 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __38__EKObject_Shared___changeSetForDiff___block_invoke_cold_1(v18);
    }
  }
LABEL_16:

}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v7 = (id)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_2;
  v8[3] = &unk_1E47875B8;
  v12 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = *(id *)(a1 + 40);
  v6 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "duplicatedPersistentObjectForObject:alreadyCopiedObjects:", v3, *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 48), "replaceMultiChangeAddedObject:withObject:forKey:", v3, v4, *(_QWORD *)(a1 + 40));

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "copy");
    goto LABEL_5;
  }
  v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __38__EKObject_Shared___changeSetForDiff___block_invoke_2_cold_1(v6);
LABEL_8:

}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v10 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v10, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_2_65;
  v11[3] = &unk_1E4787608;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 32), "multiValueRemovals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_65(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "backingObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    goto LABEL_5;
  }
  v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __38__EKObject_Shared___changeSetForDiff___block_invoke_2_65_cold_1(v6);
LABEL_8:

}

+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5
{
  return objc_msgSend(a1, "_compareAllKnownKeysExceptKeys:forObject:againstObject:compareIdentityKeys:", a3, a4, a5, 1);
}

+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6
{
  uint64_t v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0C99E20];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "knownRelationshipMultiValueKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "knownRelationshipSingleValueKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  objc_msgSend(a1, "knownSingleValueKeysForComparison");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v17);

  objc_msgSend(a1, "knownImmutableKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v18);

  objc_msgSend(v15, "minusSet:", v13);
  LOBYTE(v6) = objc_msgSend(a1, "_compareKnownKeys:forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:", v15, v12, v11, v6, 0, 0);

  return v6;
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5
{
  return objc_msgSend(a1, "_compareKnownKeys:forObject:againstObject:compareImmutableKeys:propertiesToIgnore:", a3, a4, a5, 0, 0);
}

+ (BOOL)_compareMultiValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "isPropertyUnavailable:", v9)
    && (objc_msgSend(v11, "isPropertyUnavailable:", v9) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v10, "valueForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "count");
    if (v16 == objc_msgSend(v15, "count"))
    {
      v36 = v10;
      v37 = v15;
      v35 = v11;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v34 = v14;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v44 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v23, "uniqueIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v24);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v20);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v25 = v37;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v40;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v40 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_msgSend(v30, "uniqueIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v30) = objc_msgSend(a1, "_compareRelationshipObject1:againstRelationshipObject2:propertiesToIgnore:relationshipObjectKey:", v32, v30, v12, v9);

            if (!(_DWORD)v30)
            {
              v13 = 0;
              goto LABEL_25;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v27)
            continue;
          break;
        }
      }
      v13 = 1;
LABEL_25:

      v11 = v35;
      v10 = v36;
      v14 = v34;
      v15 = v37;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  return objc_msgSend(a1, "_compareNonIdentityKeys:forObject:againstObject:compareImmutableKeys:propertiesToIgnore:", a3, a4, a5, 0, a6);
}

+ (BOOL)_compareNonRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10 == v11)
  {
    v14 = 1;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__EKObject_Shared___compareNonRelationshipKeys_forObject_againstObject_propertiesToIgnore___block_invoke;
    v16[3] = &unk_1E4787658;
    v17 = v12;
    v18 = v10;
    v19 = v11;
    v20 = a1;
    v14 = objc_msgSend(a3, "indexOfObjectPassingTest:", v16) == 0x7FFFFFFFFFFFFFFFLL;

  }
  return v14;
}

uint64_t __91__EKObject_Shared___compareNonRelationshipKeys_forObject_againstObject_propertiesToIgnore___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a2;
  if ((objc_msgSend(a1[4], "containsObject:", v6) & 1) != 0
    || objc_msgSend(a1[5], "isPropertyUnavailable:", v6)
    && (objc_msgSend(a1[6], "isPropertyUnavailable:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "valueForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "valueForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1[7], "canonicalizedEqualityTestValue1:value2:key:object1:object2:", v8, v9, v6, a1[5], a1[6]);
    if ((v10 & 1) == 0)
      *a4 = 1;
    v7 = v10 ^ 1u;

  }
  return v7;
}

+ (BOOL)_compareSingleValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6 ignoreIdentityKeys:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (objc_msgSend(v13, "isPropertyUnavailable:", v12)
    && (objc_msgSend(v14, "isPropertyUnavailable:", v12) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(v13, "valueForKey:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "knownIdentityKeysForComparison");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setByAddingObjectsFromArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysToSkipForUIComparison");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setByAddingObjectsFromArray:", v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = objc_msgSend(a1, "_compareRelationshipObject1:againstRelationshipObject2:propertiesToIgnore:relationshipObjectKey:", v17, v18, v15, v12);

  }
  return v16;
}

+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5 relationshipObjectKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v16;
  int v17;
  char v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((v9 == 0) != (v10 == 0))
    goto LABEL_5;
  v13 = 1;
  if (v9 && v10)
  {
    v14 = (void *)objc_msgSend((id)objc_opt_class(), "meltedClass");
    if (v14 != (void *)objc_msgSend((id)objc_opt_class(), "meltedClass"))
    {
LABEL_5:
      v13 = 0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v14, "isWeakRelationship") & 1) != 0
      || (objc_msgSend(v14, "knownRelationshipWeakKeys"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "containsObject:", v12),
          v16,
          v17))
    {
      v18 = objc_msgSend(v14, "_compareIdentityKeysForObject:againstObject:propertiesToIgnore:", v9, v10, v11);
    }
    else
    {
      v18 = objc_msgSend(v9, "isEqual:ignoringProperties:", v10, v11);
    }
    v13 = v18;
  }
LABEL_6:

  return v13;
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return 1;
}

- (id)privacyDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uniqueIdentifier=[%@]>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_convertBackingObjectsWithPath:(id)a3 updateBackingObjects:(BOOL)a4 allChangedBackingObjects:(id)a5 eventStore:(id)a6 updatedBackingObjectProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  BOOL v68;
  char v69;
  _QWORD v70[5];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[6];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__18;
  v82 = __Block_byref_object_dispose__18;
  v83 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke;
  v77[3] = &unk_1E4785190;
  v77[4] = self;
  v77[5] = &v78;
  -[EKObject _performWithLock:](self, "_performWithLock:", v77);
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__18;
  v75 = __Block_byref_object_dispose__18;
  v76 = 0;
  v70[0] = v15;
  v70[1] = 3221225472;
  v70[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_2;
  v70[3] = &unk_1E4787680;
  v70[4] = &v71;
  v16 = (void *)MEMORY[0x1A85849D4](v70);
  v63[0] = v15;
  v63[1] = 3221225472;
  v63[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_3;
  v63[3] = &unk_1E47876A8;
  v68 = a4;
  v44 = v12;
  v64 = v44;
  v45 = v13;
  v65 = v45;
  v46 = v14;
  v66 = v46;
  v69 = 1;
  v47 = v16;
  v67 = v47;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85849D4](v63);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)v79[5];
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend((id)v79[5], "objectForKeyedSubscript:", v18);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v52, v18) & 1) != 0)
            goto LABEL_43;
          v19 = v52;
          -[EKObject backingObjectOfChildObject:withRelationshipKey:](self, "backingObjectOfChildObject:withRelationshipKey:", v19, v18);
          v53 = (id)objc_claimAutoreleasedReturnValue();
          if (v54
            && (-[EKObject changeSet](self, "changeSet"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "hasUnsavedChangeForKey:", v18),
                v20,
                (v21 & 1) == 0))
          {
            -[EKObject backingObject](self, "backingObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "remObjectID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v54, "addObject:", v37);
              v22 = v54;
            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 0;
          }
          ((void (**)(_QWORD, id, id, id))v17)[2](v17, v53, v19, v22);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKObject changeSet](self, "changeSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForSingleValueKey:basedOn:", v18, 0);
          v40 = (id)objc_claimAutoreleasedReturnValue();

          if (v38 && v40)
          {
            -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v38, v18);
          }
          else if (v40 != v53)
          {
            -[EKObject changeSet](self, "changeSet");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "forceChangeValue:forKey:", v53, v18);

            (*((void (**)(id, id, id))v47 + 2))(v47, v53, v53);
          }
          if (v22)
            objc_msgSend(v54, "removeLastObject");

        }
        else
        {
          v23 = v52;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v53 = v23;
          v24 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v55, v84, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v56 != v25)
                  objc_enumerationMutation(v53);
                v27 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
                -[EKObject backingObjectOfChildObject:withRelationshipKey:](self, "backingObjectOfChildObject:withRelationshipKey:", v27, v18);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54
                  && (-[EKObject changeSet](self, "changeSet"),
                      v29 = (void *)objc_claimAutoreleasedReturnValue(),
                      v30 = objc_msgSend(v29, "isUniqueAddedObject:forKey:", v27, v18),
                      v29,
                      (v30 & 1) == 0))
                {
                  -[EKObject backingObject](self, "backingObject");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "remObjectID");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    objc_msgSend(v54, "addObject:", v33);
                    v31 = v54;
                  }
                  else
                  {
                    v31 = 0;
                  }

                }
                else
                {
                  v31 = 0;
                }
                ((void (**)(_QWORD, void *, uint64_t, id))v17)[2](v17, v28, v27, v31);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  -[EKObject changeSet](self, "changeSet");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "replaceMultiChangeAddedObject:withObject:forKey:", v28, v34, v18);

                }
                if (v31)
                  objc_msgSend(v54, "removeLastObject");

              }
              v24 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v55, v84, 16);
            }
            while (v24);
          }
        }

LABEL_43:
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v85, 16);
    }
    while (v50);
  }

  v42 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v78, 8);
  return v42;
}

void __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v11, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v10);

}

id __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "_convertBackingObjectsWithPath:updateBackingObjects:allChangedBackingObjects:eventStore:updatedBackingObjectProvider:", v9, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (*(_BYTE *)(a1 + 65) == (objc_opt_isKindOfClass() & 1))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v7, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "existingUpdatedObject:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count") || (objc_msgSend(v8, "hasUnsavedChanges") & 1) != 0 || v13)
      {
        if (!v13)
          v13 = v7;
        objc_msgSend(v8, "changeSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updatedFrozenObjectWithChanges:updatedChildren:", v14, v10);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v8, "changeSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "markChangesAsSaved");

          objc_msgSend(v8, "setBackingObject:", v15);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          if (v9 && *(_QWORD *)(a1 + 32))
          {
            objc_msgSend(v15, "setPath:", v9);
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
          }
        }
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "alternateUniverseClass")), "initWithAlternateUniverseObject:inEventStore:withUpdatedChildObjects:", v7, *(_QWORD *)(a1 + 40), v10);
    v15 = v17;
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v17, "uncommittedChanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changeSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addChanges:", v19);

      objc_msgSend(v8, "changeSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "markChangesAsSaved");

    }
    objc_msgSend(v8, "setBackingObject:", v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

  return v15;
}

- (id)backingObjectOfChildObject:(id)a3 withRelationshipKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "backingObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[EKObject changeSet](self, "changeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "singleValueChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject changeSet](self, "changeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unsavedMultiValueAddedObjectsForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v13;
      v8 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v14);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v17, "uniqueIdentifier", (_QWORD)v21);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v11);

            if (v19)
            {
              v8 = v17;
              goto LABEL_13;
            }
          }
          v8 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

  return v8;
}

- (id)prepareReminderKitObjectForSaveWithUpdatedBackingObjectProvider:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EKObject eventStore](self, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject _convertBackingObjectsWithPath:updateBackingObjects:allChangedBackingObjects:eventStore:updatedBackingObjectProvider:](self, "_convertBackingObjectsWithPath:updateBackingObjects:allChangedBackingObjects:eventStore:updatedBackingObjectProvider:", v7, 1, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKObject changeSet](self, "changeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasUnsavedChanges") & 1) != 0)
  {

LABEL_4:
    -[EKObject backingObject](self, "backingObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject changeSet](self, "changeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatedFrozenObjectWithChanges:updatedChildren:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKObject setBackingObject:](self, "setBackingObject:", v14);
    -[EKObject changeSet](self, "changeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markChangesAsSaved");

    objc_msgSend(v6, "addObject:", v14);
    goto LABEL_5;
  }
  v11 = objc_msgSend(v9, "count");

  if (v11)
    goto LABEL_4;
LABEL_5:

  return v6;
}

- (id)cachedMeltedChildIdentifierToParentMap
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EKObject _cachedMeltedChildIdentifierToParentMap:](self, "_cachedMeltedChildIdentifierToParentMap:", v3);
  return v3;
}

- (void)_cachedMeltedChildIdentifierToParentMap:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  v42 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __60__EKObject_Shared___cachedMeltedChildIdentifierToParentMap___block_invoke;
  v36[3] = &unk_1E4785190;
  v36[4] = self;
  v36[5] = &v37;
  -[EKObject _performWithLock:](self, "_performWithLock:", v36);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)v38[5];
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend((id)v38[5], "objectForKeyedSubscript:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v6 = v23;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v51, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v7; ++j)
              {
                if (*(_QWORD *)v29 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v10, v5) & 1) == 0)
                {
                  objc_msgSend(v10, "uniqueIdentifier");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v11)
                  {
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", self, v11);
                  }
                  else
                  {
                    v12 = (id)EKLogHandle;
                    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
                    {
                      v27 = (id)objc_opt_class();
                      v24 = objc_opt_class();
                      objc_msgSend(v10, "frozenObject");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "REMObject");
                      v13 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544130;
                      v44 = v27;
                      v45 = 2114;
                      v46 = v5;
                      v47 = 2114;
                      v48 = v24;
                      v49 = 2112;
                      v50 = v13;
                      v25 = (void *)v13;
                      _os_log_fault_impl(&dword_1A2318000, v12, OS_LOG_TYPE_FAULT, "Got a nil unique identifier for object of type %{public}@ for relation key %{public}@ on object of type %{public}@. Backing object of bad object = %@", buf, 0x2Au);

                    }
                  }
                  objc_msgSend(v10, "_cachedMeltedChildIdentifierToParentMap:", v4);

                }
              }
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v51, 16);
            }
            while (v7);
          }
        }
        else
        {
          if ((objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v23, v5) & 1) != 0)
            goto LABEL_30;
          objc_msgSend(v23, "uniqueIdentifier");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", self, v6);
          }
          else
          {
            v14 = (id)EKLogHandle;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              v15 = (id)objc_opt_class();
              v16 = objc_opt_class();
              objc_msgSend(v23, "frozenObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "REMObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v44 = v15;
              v45 = 2114;
              v46 = v5;
              v47 = 2114;
              v48 = v16;
              v49 = 2112;
              v50 = (uint64_t)v18;
              _os_log_fault_impl(&dword_1A2318000, v14, OS_LOG_TYPE_FAULT, "Got a nil unique identifier for object of type %{public}@ for relation key %{public}@ on object of type %{public}@. Backing object of bad object = %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v23, "_cachedMeltedChildIdentifierToParentMap:", v4);
        }

LABEL_30:
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v21);
  }

  _Block_object_dispose(&v37, 8);
}

void __60__EKObject_Shared___cachedMeltedChildIdentifierToParentMap___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachedMeltedObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__EKObject_Shared___resetMeltedCache__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3978];
  v3 = a2;
  objc_msgSend(v2, "callStackSymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "All EKObjects need to have a unique identifier but %@ does not. %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_9_0(a1);
  v2 = (id)OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v3, v4, "Unexpected object type %{public}@ in change set for change to single value key %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0(a1);
  v2 = (void *)OUTLINED_FUNCTION_19();
  v3 = OUTLINED_FUNCTION_3_5(v2);
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Unexpected object type %{public}@ in change set for multi value add for key %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_65_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0(a1);
  v2 = (void *)OUTLINED_FUNCTION_19();
  v3 = OUTLINED_FUNCTION_3_5(v2);
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Unexpected object type %{public}@ in change set for multi value delete for key %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

@end
