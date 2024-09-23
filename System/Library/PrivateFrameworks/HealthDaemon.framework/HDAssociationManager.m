@implementation HDAssociationManager

- (HDAssociationManager)initWithProfile:(id)a3
{
  id v4;
  HDAssociationManager *v5;
  HDAssociationManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *observersByDataType;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDAssociationManager;
  v5 = -[HDAssociationManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByDataType = v6->_observersByDataType;
    v6->_observersByDataType = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)addObserver:(id)a3 forDataType:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersForDataType:createIfNil:]((uint64_t)self, v7, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v8);
  os_unfair_lock_unlock(p_lock);

}

- (id)_lock_observersForDataType:(int)a3 createIfNil:
{
  const os_unfair_lock *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 16);
    v6 = a2;
    os_unfair_lock_assert_owner(v5);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend(v6, "code");

    objc_msgSend(v7, "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAssociationManager _lock_observersForKey:createIfNil:](a1, v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)removeObserver:(id)a3 forDataType:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersForDataType:createIfNil:]((uint64_t)self, v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v8);
  os_unfair_lock_unlock(p_lock);

}

- (void)addObserverForAllTypes:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersAllTypesCreateIfNil:]((const os_unfair_lock *)self, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_observersAllTypesCreateIfNil:(const os_unfair_lock *)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAssociationManager _lock_observersForKey:createIfNil:]((uint64_t)a1, v4, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)removeObserverForAllTypes:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersAllTypesCreateIfNil:]((const os_unfair_lock *)self, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)associateObjectUUIDs:(id)a3 objectUUID:(id)a4 error:(id *)a5
{
  HDProfile **p_profile;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v12;

  v12 = 0;
  p_profile = &self->_profile;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v9, v8, 0, 0, &v12, WeakRetained, a5);

  return (char)a5;
}

- (BOOL)associateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v12, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v16;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "Associating sample with object UUID:%{public}@ and sub Object UUID:%{public}@ ", buf, 0x16u);

  }
  -[HDAssociationManager _uuidsForObjects:object:subObject:error:]((uint64_t)self, v11, v12, v13, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v23 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDReferenceForAssociatableObject(v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v22 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v18, v19, a5, v20, &v28, WeakRetained, a7);
  v23 = v28;

  if (!v22)
  {
LABEL_11:
    v25 = 0;
    goto LABEL_12;
  }
  if (!v23)
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during association", buf, 2u);
    }
    v23 = &unk_1E6DFE4E0;
  }
  -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v11, v12, v13, a5, v23);
  v25 = 1;
LABEL_12:

  return v25;
}

- (id)_uuidsForObjects:(void *)a3 object:(void *)a4 subObject:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v23 = sel__uuidsForObjects_object_subObject_error_;
      v15 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (!objc_msgSend(v9, "acceptsAssociationWithObject:", v17, v23)
            || v10 && (objc_msgSend(v10, "acceptsAssociationWithObject:", v17) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), v23, CFSTR("Sample does not support relating"));
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              if (a5)
                *a5 = objc_retainAutorelease(v20);
              else
                _HKLogDroppedError();
            }

            v19 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v17, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
          continue;
        break;
      }
    }

    v19 = v11;
LABEL_18:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_notifyAssociationObjectsUpdatedWithAssociatedObjects:(void *)a3 withObject:(void *)a4 destinationSubObject:(uint64_t)a5 type:(void *)a6 anchor:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!a1)
    goto LABEL_19;
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EF224FE8) & 1) != 0)
  {
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v13;
          v18 = "Attempted to retrieve destinationSubObject: %{public}@ from Object that does not support subObjects";
          goto LABEL_15;
        }
        goto LABEL_19;
      }
      objc_msgSend(v13, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subObjectFromUUID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v13;
          v18 = "Failed to retrieve destinationSubObject: %{public}@";
LABEL_15:
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v16 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "appSubscriptionManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sampleType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAnchor:forDataCode:type:", v14, objc_msgSend(v21, "code"), 1);

      v22 = *(NSObject **)(a1 + 32);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __122__HDAssociationManager__notifyAssociationObjectsUpdatedWithAssociatedObjects_withObject_destinationSubObject_type_anchor___block_invoke;
      v25[3] = &unk_1E6D010C8;
      v25[4] = a1;
      v26 = v12;
      v27 = v16;
      v30 = a5;
      v28 = v11;
      v29 = v14;
      v23 = v16;
      dispatch_async(v22, v25);

    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v12;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Unable to determine sample type for object: %{public}@", buf, 0xCu);
      }

    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  v17 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    v18 = "Parent Object %{public}@ is not an HKAssociatableObject";
    goto LABEL_15;
  }
LABEL_19:

}

- (BOOL)disassociateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v12, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v16;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "Disassociating sample with UUID %{public}@", buf, 0xCu);

  }
  -[HDAssociationManager _uuidsForObjects:object:subObject:error:]((uint64_t)self, v11, v12, v13, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v22 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HDReferenceForAssociatableObject(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v21 = +[HDAssociationEntity disassociateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "disassociateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v17, v18, a5, v19, &v27, WeakRetained, a7);
  v22 = v27;

  if (!v21)
  {
LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  if (!v22)
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during disassociation", buf, 2u);
    }
    v22 = &unk_1E6DFE4E0;
  }
  -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v11, v12, v13, a5, v22);
  v24 = 1;
LABEL_12:

  return v24;
}

- (BOOL)insertCodableTypedObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  objc_class *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id WeakRetained;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  BOOL v51;
  __int128 v53;
  id *location;
  id obj;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  uint8_t v79[128];
  _BYTE v80[12];
  __int128 buf;
  uint64_t (*v82)(uint64_t, uint64_t);
  void *v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v62 = a4;
  v61 = a5;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__147;
  v73 = __Block_byref_object_dispose__147;
  v74 = 0;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  if (v9)
  {
    location = (id *)&self->_profile;
    v60 = *(_QWORD *)v66;
    *(_QWORD *)&v10 = 138543362;
    v53 = v10;
LABEL_3:
    v59 = v9;
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v60)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v11);
      v63 = v61;
      v64 = v62;
      if ((HKWithAutoreleasePool() & 1) == 0)
      {

        v51 = 0;
        goto LABEL_46;
      }
      if (!v70[5])
      {
        _HKInitializeLogging();
        v13 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during association", (uint8_t *)&buf, 2u);
        }
        v14 = (void *)v70[5];
        v70[5] = (uint64_t)&unk_1E6DFE4E0;

      }
      if (objc_msgSend(v12, "type", v53) != 1)
        goto LABEL_42;
      objc_msgSend(v12, "objectUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "decodedAssociationUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "decodedSubObjectUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)v70[5];
      v19 = v16;
      v20 = v17;
      v58 = v18;
      if (self)
        break;
LABEL_41:

LABEL_42:
      if (v59 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_44;
      }
    }
    v21 = (objc_class *)MEMORY[0x1E0C99E20];
    v22 = v15;
    v23 = objc_alloc_init(v21);
    v77 = 0;
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __118__HDAssociationManager__notifyAssociationSamplesUpdatedWithUUIDs_withSampleUUID_destinationSubObjectUUID_type_anchor___block_invoke;
    v75[3] = &unk_1E6D010A0;
    v24 = v23;
    v76 = v24;
    LOBYTE(v21) = objc_msgSend(v22, "hk_enumerateUUIDsWithError:block:", &v77, v75);

    v57 = v77;
    if ((v21 & 1) == 0)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(_QWORD *)((char *)&buf + 4) = v57;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Failed to enumerate associated UUIDs objects for association enumeration: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_40;
    }
    v25 = v24;
    WeakRetained = objc_loadWeakRetained(location);
    +[HDDataEntity entityEnumeratorWithProfile:](HDQuantitySampleSeriesEntity, "entityEnumeratorWithProfile:", WeakRetained);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    HDDataEntityPredicateForDataUUIDs(v25);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setPredicate:", v28);
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = 0;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v82 = __55__HDAssociationManager__quantitySamplesForUUIDs_error___block_invoke;
    v83 = &unk_1E6CF89B8;
    v30 = v29;
    v84 = v30;
    LOBYTE(v28) = objc_msgSend(v27, "enumerateWithError:handler:", &v78, &buf);
    v31 = v78;
    if ((v28 & 1) != 0)
    {
      v32 = v30;
      v33 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v35 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v80 = v53;
        *(_QWORD *)&v80[4] = v31;
        _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Failed to fetch objects for association enumeration: %{public}@", v80, 0xCu);
      }
      v36 = v31;
      v33 = v36;
      if (v36)
        v37 = objc_retainAutorelease(v36);

      v32 = 0;
    }

    v38 = v33;
    if (!v32)
    {
      _HKInitializeLogging();
      v46 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(_QWORD *)((char *)&buf + 4) = v38;
        _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "Failed to retrieve samples with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_39;
    }
    v39 = objc_loadWeakRetained(location);
    *(_QWORD *)v80 = v38;
    +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDWorkoutEntity, "objectWithUUID:encodingOptions:profile:error:", v19, 0, v39, v80);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(id *)v80;

    if (!v40)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(_QWORD *)((char *)&buf + 4) = v41;
        _os_log_error_impl(&dword_1B7802000, v47, OS_LOG_TYPE_ERROR, "Failed to retrieve parent sample with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v20)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        _HKInitializeLogging();
        v48 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          v49 = v48;
          objc_msgSend(v20, "UUIDString");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = v53;
          *(_QWORD *)((char *)&buf + 4) = v50;
          _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "Attempted to retrieve destinationSubObject: %{public}@ from Object that does not support subObjects", (uint8_t *)&buf, 0xCu);

        }
        goto LABEL_38;
      }
      objc_msgSend(v40, "subObjectFromUUID:", v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
        _HKInitializeLogging();
        v43 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          v44 = v43;
          objc_msgSend(v20, "UUIDString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = v53;
          *(_QWORD *)((char *)&buf + 4) = v45;
          _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "Failed to retrieve destinationSubObject: %{public}@", (uint8_t *)&buf, 0xCu);

        }
        goto LABEL_38;
      }
    }
    else
    {
      v42 = 0;
    }
    -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v32, v40, v42, 1, v58);

LABEL_38:
    v38 = v41;
LABEL_39:

LABEL_40:
    goto LABEL_41;
  }
LABEL_44:
  v51 = 1;
LABEL_46:

  _Block_object_dispose(&v69, 8);
  return v51;
}

BOOL __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v20;
  int8x16_t v21;
  void *v22;
  id obj;
  _QWORD v24[4];
  int8x16_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__147;
  v31 = __Block_byref_object_dispose__147;
  objc_msgSend(*(id *)(a1 + 32), "syncIdentityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacySyncIdentity");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke_2;
  v24[3] = &unk_1E6CF0008;
  v26 = &v27;
  v21 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v21.i64[0];
  v25 = vextq_s8(v21, v21, 8uLL);
  v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, a2, v24);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "decodedAssociationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(*(id *)(a1 + 40), "type");
    objc_msgSend(*(id *)(a1 + 40), "decodedSubObjectUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDReferenceForUnknownAssociatableObjectWithUUID(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v12 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(v11, "syncProvenance");
    objc_msgSend((id)v28[5], "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "persistentID");
    objc_msgSend(*(id *)(a1 + 40), "decodedCreationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:provenance:syncIdentity:creationDate:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:provenance:syncIdentity:creationDate:error:", v22, v8, v20, v10, &obj, v13, v14, v16, v17, a2);
    objc_storeStrong((id *)(v12 + 40), obj);

  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v18;
}

uint64_t __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasSyncIdentity"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v10 = 1;
      objc_msgSend(v9, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v7, 1, v5, &v18);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v12;
      if (!v12)
      {
LABEL_15:

        v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v8;
      if (!v12)
        goto LABEL_15;
      if (!a3)
        goto LABEL_8;
    }
    v12 = objc_retainAutorelease(v12);
    *a3 = v12;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_17:

  return v10;
}

- (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObject:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v11 = a6;
  v12 = a3;
  HDReferenceForAssociatableObject(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:](HDAssociationEntity, "objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:", v12, v13, v8, v11, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __118__HDAssociationManager__notifyAssociationSamplesUpdatedWithUUIDs_withSampleUUID_destinationSubObjectUUID_type_anchor___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __122__HDAssociationManager__notifyAssociationObjectsUpdatedWithAssociatedObjects_withObject_destinationSubObject_type_anchor___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  if (v1)
  {
    v37 = v7;
    os_unfair_lock_lock(v1 + 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAssociationManager _lock_observersForKey:createIfNil:]((uint64_t)v1, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    os_unfair_lock_unlock(v1 + 4);
    v35 = v12;
    objc_msgSend(v12, "setRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "mutableCopy");

    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v38 = v6;
    objc_msgSend(v6, "sampleType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAssociationManager _observersForDataType:]((uint64_t)v1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v16;
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v17);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "sampleType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDAssociationManager _observersForDataType:]((uint64_t)v1, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "allObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectsFromArray:", v25);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v20);
    }

    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      objc_msgSend(v38, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "Notifying observers of association updates for sample with UUID %{public}@", buf, 0xCu);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v14;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
    v7 = v37;
    v6 = v38;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "associationsUpdatedForObject:subObject:type:objects:anchor:", v38, v37, v5, v18, v9);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
      }
      while (v31);
    }

    v8 = v36;
  }

}

- (id)_observersForDataType:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (os_unfair_lock_s *)(a1 + 16);
  v4 = a2;
  os_unfair_lock_lock(v3);
  -[HDAssociationManager _lock_observersForDataType:createIfNil:](a1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_unlock(v3);
  return v6;
}

uint64_t __55__HDAssociationManager__quantitySamplesForUUIDs_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)_lock_observersForKey:(int)a3 createIfNil:
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = a3 == 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observersByDataType, 0);
}

@end
