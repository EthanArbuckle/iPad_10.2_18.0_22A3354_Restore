@implementation HDProfileManager

- (id)profileForIdentifier:(id)a3
{
  os_unfair_lock_s *p_profilesLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_profilesLock = &self->_profilesLock;
    v5 = a3;
    os_unfair_lock_lock(p_profilesLock);
    -[NSMutableDictionary objectForKey:](self->_profiles, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_profilesLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (HDProfileManager)initWithDaemon:(id)a3
{
  id v4;
  HDProfileManager *v5;
  HDProfileManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *profiles;
  id v9;
  void *v10;
  uint64_t v11;
  HDProfileManagerObserver *observers;
  HDProfileManager *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDProfileManager;
  v5 = -[HDProfileManager init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    profiles = v6->_profiles;
    v6->_profiles = v7;

    v9 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithName:loggingCategory:", CFSTR("HDProfileManagerObservers"), v10);
    observers = v6->_observers;
    v6->_observers = (HDProfileManagerObserver *)v11;

    v6->_profilesLock._os_unfair_lock_opaque = 0;
    v14 = v6;
    HKDispatchAsyncOnGlobalConcurrentQueue();

  }
  return v6;
}

void __35__HDProfileManager_initWithDaemon___block_invoke(uint64_t a1)
{
  -[HDProfileManager _loadSecondaryProfiles](*(_QWORD *)(a1 + 32));
}

- (void)_loadSecondaryProfiles
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  os_unfair_lock_s *lock;
  uint64_t v50;
  id *location;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _QWORD v70[5];

  v70[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    lock = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    v56 = (void *)a1;
    location = (id *)(a1 + 8);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "healthDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "addObject:", CFSTR("Profiles"));
    v48 = v5;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v8 = *MEMORY[0x1E0C999D0];
    v53 = *MEMORY[0x1E0C99A90];
    v70[0] = *MEMORY[0x1E0C99A90];
    v70[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v7;
    v47 = (void *)v6;
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v9, 7, &__block_literal_global_213_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (!v11)
      goto LABEL_33;
    v12 = v11;
    v13 = *(_QWORD *)v60;
    v52 = *(_QWORD *)v60;
    v50 = v8;
    while (1)
    {
      v14 = 0;
      v54 = v12;
      do
      {
        if (*(_QWORD *)v60 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v14);
        v58 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v58, v8, 0);
        v16 = v58;
        if (objc_msgSend(v16, "BOOLValue"))
        {
          v57 = 0;
          objc_msgSend(v15, "getResourceValue:forKey:error:", &v57, v53, 0);
          v17 = v57;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__profileIdentifierForDirectoryName_error_, v56, CFSTR("HDProfileManager.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryName != nil"));

          }
          objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("$"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("directoryName"), objc_opt_class(), sel__profileIdentifierForDirectoryName_error_, CFSTR("Directory name separates into too many components (%ld)"), objc_msgSend(v18, "count"));
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v26;
            if (v26)
              v27 = objc_retainAutorelease(v26);

            v24 = 0;
            v23 = v25;
            goto LABEL_24;
          }
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          if ((objc_msgSend(MEMORY[0x1E0CB6A10], "isValidSecondaryProfileType:", v20) & 1) != 0)
          {
            v21 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v21, "initWithUUIDString:", v22);

            if (v23)
            {
              objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v23, v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 0;
LABEL_24:

              v37 = v25;
              if (v24)
              {
                v38 = objc_alloc(MEMORY[0x1E0CB3940]);
                v39 = objc_retainAutorelease(v15);
                v40 = objc_msgSend(v38, "initWithUTF8String:", objc_msgSend(v39, "fileSystemRepresentation"));
                v41 = objc_loadWeakRetained(location);
                v42 = (void *)objc_msgSend(v56, "newProfileWithIdentifier:daemon:directoryPath:", v24, v41, v40);

                -[HDProfileManager _lock_addProfile:dispatchChangeNotification:]((uint64_t)v56, v42, 0);
                _HKInitializeLogging();
                HKLogInfrastructure();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v64 = v42;
                  v65 = 2112;
                  v66 = v24;
                  v67 = 2112;
                  v68 = v39;
                  _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, "Loaded profile from disk: %@ for identifier: %@ in directory: %@", buf, 0x20u);
                }

                v44 = v42;
                HKDispatchAsyncOnGlobalConcurrentQueue();

                v8 = v50;
              }
              else
              {
                _HKInitializeLogging();
                HKLogInfrastructure();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v64 = v17;
                  v65 = 2114;
                  v66 = v37;
                  _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "Non UUID directory found in profiles directory: %@ error: %{public}@", buf, 0x16u);
                }
              }

              v12 = v54;
              v13 = v52;
              goto LABEL_31;
            }
            v32 = (void *)MEMORY[0x1E0CB35C8];
            v33 = objc_opt_class();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("directoryName"), v33, sel__profileIdentifierForDirectoryName_error_, CFSTR("Directory name contains invalid profile identifier: %@"), v34);
            v35 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v35;
            if (v35)
              v36 = objc_retainAutorelease(v35);

            v23 = 0;
          }
          else
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v29 = objc_opt_class();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("directoryName"), v29, sel__profileIdentifierForDirectoryName_error_, CFSTR("Directory name contains invalid profile type (%@)"), v23);
            v30 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v30;
            if (v30)
              v31 = objc_retainAutorelease(v30);

          }
          v24 = 0;
          goto LABEL_24;
        }
LABEL_31:

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (!v12)
      {
LABEL_33:

        os_unfair_lock_unlock(lock);
        objc_msgSend(v56, "dispatchProfileListDidChange");

        return;
      }
    }
  }
}

- (BOOL)profileExistsForIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[HDProfileManager profileForIdentifier:](self, "profileForIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)addProfile:(id)a3
{
  os_unfair_lock_s *p_profilesLock;
  id v5;

  p_profilesLock = &self->_profilesLock;
  v5 = a3;
  os_unfair_lock_lock(p_profilesLock);
  -[HDProfileManager _lock_addProfile:dispatchChangeNotification:]((uint64_t)self, v5, 1);

  os_unfair_lock_unlock(p_profilesLock);
}

- (void)_lock_addProfile:(int)a3 dispatchChangeNotification:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    v6 = *(void **)(a1 + 16);
    objc_msgSend(v5, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
    {
      if (v8)
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          NSStringFromSelector(sel__lock_addProfile_dispatchChangeNotification_);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "profileIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138413314;
          v15 = a1;
          v16 = 2112;
          v17 = v12;
          v18 = 2112;
          v19 = v8;
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v5;
          _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "%@: %@ Overriding existing profile %@ for identifier %@ with new profile %@", (uint8_t *)&v14, 0x34u);

        }
        objc_msgSend(v8, "invalidateAndWaitWithReason:", CFSTR("Replacing profile."));
      }
      v10 = *(void **)(a1 + 16);
      objc_msgSend(v5, "profileIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v5, v11);

      objc_msgSend(v5, "notifyProfileInitializedObservers");
      if (a3)
        objc_msgSend((id)a1, "dispatchProfileListDidChange");
    }

  }
}

- (id)createProfileOfType:(int64_t)a3 displayName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HDProfileManager _createProfileOfType:UUID:name:lastName:error:]((uint64_t)self, a3, v10, v9, 0, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("displayName"), objc_opt_class(), a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v11 = 0;
  }

  return v11;
}

- (id)_createProfileOfType:(void *)a3 UUID:(void *)a4 name:(void *)a5 lastName:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v42;
  void *v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
    goto LABEL_6;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  if (!*(_QWORD *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 119, CFSTR("Unable to create profiles after invalidation."));
LABEL_6:
    v14 = 0;
    goto LABEL_27;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  v49 = v13;
  v44 = a2;
  if (a2 == 1)
    objc_msgSend(MEMORY[0x1E0CB6A10], "primaryProfile");
  else
    objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v11, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__createProfileOfType_UUID_name_lastName_error_, a1, CFSTR("HDProfileManager.m"), 319, CFSTR("Profile identifier is nil."));

  }
  v45 = a6;
  v48 = v12;
  v16 = v15;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "healthDirectoryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", CFSTR("Profiles"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v16;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__directoryNameForProfileIdentifier_, a1, CFSTR("HDProfileManager.m"), 421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_msgSend(v20, "type");
  objc_msgSend(v20, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%ld$%@"), v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v25, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v54 = 0;
  v28 = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v54);
  v29 = v54;
  if ((v28 & 1) != 0)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB3940]);
    v31 = objc_retainAutorelease(v26);
    v32 = (void *)objc_msgSend(v30, "initWithUTF8String:", objc_msgSend(v31, "fileSystemRepresentation"));
    v33 = objc_loadWeakRetained((id *)(a1 + 8));
    v34 = (void *)objc_msgSend((id)a1, "newProfileWithIdentifier:daemon:directoryPath:", v20, v33, v32);

    if (v34)
    {
      v46 = v32;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      -[HDProfileManager _lock_addProfile:dispatchChangeNotification:](a1, v34, 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HDProfileManager__createProfileOfType_UUID_name_lastName_error___block_invoke;
      aBlock[3] = &unk_1E6CE7FB8;
      v35 = v34;
      v51 = v35;
      v52 = v48;
      v53 = v49;
      v36 = _Block_copy(aBlock);
      objc_msgSend(v35, "executeBlockAfterProfileReady:", v36);
      _HKInitializeLogging();
      HKLogInfrastructure();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v35;
        v57 = 2112;
        v58 = v20;
        v59 = 2112;
        v60 = v31;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "Created new profile: %@ for identifier: %@ in directory: %@", buf, 0x20u);
      }

      objc_msgSend(v35, "profileIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v51;
      v12 = v48;
      v32 = v46;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("profileType"), objc_opt_class(), sel__createProfileOfType_UUID_name_lastName_error_, CFSTR("Invalid profile type %ld"), v44);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v38 = v40;
      v12 = v48;
      if (v40)
      {
        if (v45)
          *v45 = objc_retainAutorelease(v40);
        else
          _HKLogDroppedError();
      }

      v14 = 0;
    }

    v11 = v47;
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v26;
      v57 = 2114;
      v58 = v29;
      _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "Unable to create directory (%@) for profile. Error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", v45, 102, CFSTR("Unable to create profile database directory"), v29);
    v14 = 0;
    v11 = v47;
    v12 = v48;
  }

  v13 = v49;
LABEL_27:

  return v14;
}

- (id)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v12)
  {
    v14 = objc_msgSend(v11, "type");
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDProfileManager _createProfileOfType:UUID:name:lastName:error:]((uint64_t)self, v14, v15, v12, v13, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDProfileManager profileForIdentifier:](self, "profileForIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17;
      v19 = v18;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Unable to fetch profile %@ after creation."), v11);
    v18 = 0;
LABEL_10:
    v19 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("firstName"), objc_opt_class(), a2);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v20;
  if (!v20)
  {
    v16 = 0;
    goto LABEL_10;
  }
  if (a6)
  {
    v18 = objc_retainAutorelease(v20);
    v19 = 0;
    *a6 = v18;
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }
  v16 = v18;
LABEL_12:

  return v19;
}

- (BOOL)deleteProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self)
  {
LABEL_28:

    return 0;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("profileIdentifier"), objc_opt_class(), sel__deleteProfile_error_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v20 = v19;
    if (v20)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    goto LABEL_28;
  }
  -[HDProfileManager profileForIdentifier:](self, "profileForIdentifier:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("profileType"), objc_opt_class(), sel__deleteProfile_error_, CFSTR("No profile for identifier %@."), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v9 = (void *)v8;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Deleting profile '%@'", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_profilesLock);
  -[NSMutableDictionary removeObjectForKey:](self->_profiles, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_profilesLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "invalidateAllServersForProfile:", v9);

  _HKInitializeLogging();
  HKLogInfrastructure();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Invalidated existing servers for deleted profile '%@'", buf, 0xCu);
  }

  objc_msgSend(v9, "invalidateAndWaitWithReason:", CFSTR("Profile deletion"));
  _HKInitializeLogging();
  HKLogInfrastructure();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Invalidated deleted profile '%@'", buf, 0xCu);
  }

  objc_msgSend(v9, "directoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v25 = 0;
  v16 = objc_msgSend(v15, "removeItemAtURL:error:", v14, &v25);
  v17 = v25;
  if ((v16 & 1) != 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "Finished deleting profile '%@'", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v15, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogInfrastructure();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "Files remaining in %{public}@: %{public}@", buf, 0x16u);
    }

    _HKInitializeLogging();
    HKLogInfrastructure();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2114;
      v29 = v17;
      _os_log_fault_impl(&dword_1B7802000, v23, OS_LOG_TYPE_FAULT, "Failed to delete profile %{public}@: %{public}@", buf, 0x16u);
    }

    _HKInitializeLogging();
    HKLogInfrastructure();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to delete profile %@'", buf, 0xCu);
    }
  }

  if (v16)
  {
    -[HDProfileManager dispatchProfileListDidChange](self, "dispatchProfileListDidChange");
    return 1;
  }
  return 0;
}

- (BOOL)deleteAllProfilesOfType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  HDProfileManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HDProfileManager allProfileIdentifiers](self, "allProfileIdentifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == a3
          && !-[HDProfileManager deleteProfile:error:](self, "deleteProfile:error:", v12, a4))
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v12, "type");
            *(_DWORD *)buf = 138543874;
            v24 = self;
            v25 = 2114;
            v26 = v17;
            v27 = 2048;
            v28 = v18;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, " %{public}@: Failed to delete profile with identifier %{public}@ of type %ld", buf, 0x20u);

          }
          v13 = 0;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_14:

  return v13;
}

- (id)allProfileIdentifiers
{
  os_unfair_lock_s *p_profilesLock;
  void *v4;
  void *v5;

  p_profilesLock = &self->_profilesLock;
  os_unfair_lock_lock(&self->_profilesLock);
  -[NSMutableDictionary allKeys](self->_profiles, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_profilesLock);
  return v5;
}

- (id)profileAssociatedWithNRDeviceUUID:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  SEL v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  HDProfileManager *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[HDProfileManager allProfileIdentifiers](self, "allProfileIdentifiers");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = v6;
    v20 = a2;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[HDProfileManager profileForIdentifier:](self, "profileForIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if (objc_msgSend(v11, "profileType") == 3)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v20, self, CFSTR("HDProfileManager.m"), 164, CFSTR("Profile %@ is of type Tinker but is not an instance of type HDTinkerProfile (#t0)"), v12);

            }
            v12 = v12;
            v22 = 0;
            objc_msgSend(v12, "pairedNRDeviceUUIDWithError:", &v22);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v22;
            if (v13)
            {
              if ((objc_msgSend(v13, "isEqual:", v21) & 1) != 0)
              {
                v18 = v10;

                goto LABEL_21;
              }
            }
            else
            {
              _HKInitializeLogging();
              v16 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v28 = self;
                v29 = 2114;
                v30 = v10;
                v31 = 2114;
                v32 = v14;
                _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error fetching deviceUUID for profile: %{public}@ error: %{public}@", buf, 0x20u);
              }
            }

          }
        }
        else
        {
          _HKInitializeLogging();
          v15 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v28 = self;
            v29 = 2114;
            v30 = v10;
            _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Profile is nil for profileIdentifier: %{public}@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }
  v18 = 0;
LABEL_21:

  return v18;
}

- (id)profileIdentifierForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HDProfileManager allProfileIdentifiers](self, "allProfileIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HDProfileManager_profileIdentifierForUUID___block_invoke;
  v9[3] = &unk_1E6CEB220;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__HDProfileManager_profileIdentifierForUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)invalidateAndWaitWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *profiles;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  HDProfileManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@)", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_profilesLock);
  -[NSMutableDictionary allValues](self->_profiles, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  profiles = self->_profiles;
  self->_profiles = 0;

  os_unfair_lock_unlock(&self->_profilesLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "invalidateAndWaitWithReason:", v4, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addProfileManagerObserver:(id)a3
{
  -[HDProfileManager addProfileManagerObserver:queue:](self, "addProfileManagerObserver:queue:", a3, 0);
}

- (void)addProfileManagerObserver:(id)a3 queue:(id)a4
{
  -[HDProfileManagerObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeProfileManagerObserver:(id)a3
{
  -[HDProfileManagerObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)dispatchProfileListDidChange
{
  -[HDProfileManagerObserver notifyObservers:](self->_observers, "notifyObservers:", &__block_literal_global_169);
}

uint64_t __48__HDProfileManager_dispatchProfileListDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileListDidChange");
}

uint64_t __42__HDProfileManager__loadSecondaryProfiles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "code") != 260)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Error while enumerating profiles directory. URL: %@ Error: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  return 1;
}

uint64_t __42__HDProfileManager__loadSecondaryProfiles__block_invoke_215(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awakeFromDisk");
}

void __66__HDProfileManager__createProfileOfType_UUID_name_lastName_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v9 = 0;
  v5 = objc_msgSend(v2, "setDisplayFirstName:lastName:error:", v3, v4, &v9);
  v6 = v9;
  if ((v5 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Error setting display name %{public}@, error: %{public}@", buf, 0x16u);
    }

  }
}

- (id)newProfileWithIdentifier:(id)a3 daemon:(id)a4 directoryPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  HDPrimaryProfile *v11;
  HDProfile *v12;
  id v13;
  id v14;
  __objc2_class *v15;
  HDPrimaryProfile *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "type");
  switch(v10)
  {
    case 1:
      v11 = -[HDPrimaryProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:]([HDPrimaryProfile alloc], "initWithDirectoryPath:medicalIDDirectoryPath:daemon:", v9, v9, v8);
      goto LABEL_10;
    case 2:
      v12 = [HDProfile alloc];
      v13 = v9;
      v14 = 0;
      goto LABEL_9;
    case 3:
      v15 = HDTinkerProfile;
      goto LABEL_8;
    case 4:
      v15 = HDDevicelessProfile;
LABEL_8:
      v12 = (HDProfile *)[v15 alloc];
      v13 = v9;
      v14 = v9;
LABEL_9:
      v11 = -[HDProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:](v12, "initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:", v13, v14, v8, v7);
      goto LABEL_10;
    default:
      if (v10 == 100)
      {
        v11 = -[HDPrimaryProfile _initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:]([HDPrimaryProfile alloc], "_initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:", v9, v9, v8, v7);
LABEL_10:
        v16 = v11;
      }
      else
      {
        v16 = 0;
      }

      return v16;
  }
}

- (void)unitTest_reloadSecondaryProfiles
{
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __52__HDProfileManager_unitTest_reloadSecondaryProfiles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v11) != 1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "invalidateAndWaitWithReason:", CFSTR("Reloading"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  -[HDProfileManager _loadSecondaryProfiles](*(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
