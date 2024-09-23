@implementation PHServerResourceRequestRunner

- (PHServerResourceRequestRunner)initWithTaskIdentifier:(id)a3
{
  id v4;
  PHServerResourceRequestRunner *v5;
  uint64_t v6;
  NSString *taskIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHServerResourceRequestRunner;
  v5 = -[PHServerResourceRequestRunner init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PLProgressFollower invalidate](self->_dataStoreFollower, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHServerResourceRequestRunner;
  -[PHServerResourceRequestRunner dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state != 5)
    self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)_assetAndRelatedObjectsFromAssetObjectIDURL:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectIDForURIRepresentation:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v8, "persistentStoreCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistentStores");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_pl_map:", &__block_literal_global_9155);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PLImageManagerGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v7;
      v50 = 2114;
      v51 = v27;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Cannot cannot create asset object id from url: %{public}@, persistent store IDs: %{public}@", buf, 0x16u);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2938];
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Cannot cannot create asset object id from url: %@, persistent store IDs: %@"), v7, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v30);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  v11 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self = %@"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  v45[0] = CFSTR("modernResources");
  v45[1] = CFSTR("master");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v15);

  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
  v40 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v13, &v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v40;
  if (v16)
  {
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v18;
      v39 = a5;
      objc_msgSend(v18, "uuid");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(v19, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (v23)
        {
          a5 = v39;
          goto LABEL_18;
        }
      }
      PLImageManagerGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v10;
        _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "Asset has no uuid, object ID: %{public}@", buf, 0xCu);
      }

      v32 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset has no uuid, object ID: %@"), v10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v34;
      a5 = v39;
    }
    else
    {
      PLImageManagerGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v10;
        _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "Cannot find asset with object ID: %{public}@", buf, 0xCu);
      }

      v36 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find asset with object ID: %@"), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v30);
      v37 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v37;
    }
    goto LABEL_16;
  }
LABEL_17:
  v19 = 0;
LABEL_18:

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v19;
}

- (void)_safeReply:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_state = 5;
    os_unfair_lock_unlock(&self->_lock);
    v4[2]();
  }

}

- (void)_cancelWithReply:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSString *taskIdentifier;
  void *v7;
  NSObject *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    taskIdentifier = self->_taskIdentifier;
    v10 = 138543362;
    v11 = taskIdentifier;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancellation handler called", (uint8_t *)&v10, 0xCu);
  }

  -[PLProgressFollower sourceProgress](self->_dataStoreFollower, "sourceProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_state == 5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else if ((-[PLResourceDataStore canMarkAsynchronousLocalRenderAsOptionalForProgress:](self->_dataStore, "canMarkAsynchronousLocalRenderAsOptionalForProgress:", v7) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_taskIdentifier;
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "[RM]: %{public}@ cancellation for async local render translated into deprioritization for progress %{public}@", (uint8_t *)&v10, 0x16u);
    }

    -[PLResourceDataStore markAsynchronousLocalRenderAsOptionalForProgress:](self->_dataStore, "markAsynchronousLocalRenderAsOptionalForProgress:", v7);
  }
  else
  {
    self->_state = 5;
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v7, "cancel");
    v4[2](v4);
  }

}

- (void)_handleProgress:(id)a3
{
  NSProgress *progress;
  id v5;
  double v6;
  double v7;
  double v8;

  progress = self->_progress;
  v5 = a3;
  v6 = (double)-[NSProgress totalUnitCount](progress, "totalUnitCount");
  objc_msgSend(v5, "fractionCompleted");
  v8 = v7;

  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)(v8 * v6));
}

- (id)makeResourceAvailableWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  os_log_type_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSProgress *v26;
  NSProgress *progress;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSProgress *v35;
  void *v37;
  uint64_t v38;
  NSString *taskIdentifier;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  PHServerResourceRequestRunner *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint8_t buf[4];
  NSString *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v40 = a4;
  v41 = a5;
  v42 = a6;
  if (-[PHServerResourceRequestRunner state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHServerResourceRequestRunner.m"), 255, CFSTR("Cannot run a resource make available request twice"));

  }
  v12 = objc_msgSend(v11, "downloadIntent");
  v13 = objc_msgSend(v11, "downloadPriority");
  if ((unint64_t)(v12 - 1) > 0xB)
    v14 = 0;
  else
    v14 = qword_19944A688[v12 - 1];
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", v14, v13 == 1);
  objc_msgSend(v11, "resourceIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recipeID");
  v16 = PLShouldBoostLogLevelForResourceRecipeID();

  PLImageManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ 1;
  if (os_log_type_enabled(v17, (os_log_type_t)(v16 ^ 1)))
  {
    taskIdentifier = self->_taskIdentifier;
    if (objc_msgSend(v11, "isNetworkAccessAllowed"))
      v19 = CFSTR("Y");
    else
      v19 = CFSTR("N");
    if (objc_msgSend(v11, "wantsProgress", v19))
      v20 = CFSTR("Y");
    else
      v20 = CFSTR("N");
    if (objc_msgSend(v11, "isTransient"))
      v21 = CFSTR("Y");
    else
      v21 = CFSTR("N");
    objc_msgSend(v11, "assetObjectIDURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PLShortObjectIDFromURL();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resourceIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceIdentityShortDescription();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v55 = taskIdentifier;
    v56 = 2114;
    v57 = v38;
    v58 = 2114;
    v59 = v20;
    v60 = 2114;
    v61 = v21;
    v62 = 2114;
    v63 = v43;
    v64 = 2114;
    v65 = v23;
    v66 = 2114;
    v67 = v25;
    _os_log_impl(&dword_1991EC000, v17, v18, "[RM] %{public}@ Starting request to make resource available with network access: %{public}@, progress: %{public}@, transient: %{public}@, downloadOptions: %{public}@, asset: %{public}@, resource: %{public}@", buf, 0x48u);

  }
  -[PHServerResourceRequestRunner setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0D71B68], "discreteProgressWithTotalUnitCount:", 100);
  v26 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v26;

  objc_initWeak((id *)buf, self);
  v28 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke;
  v51[3] = &unk_1E35DE1A8;
  objc_copyWeak(&v53, (id *)buf);
  v29 = v42;
  v52 = v29;
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v51);
  v44[0] = v28;
  v44[1] = 3221225472;
  v44[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3;
  v44[3] = &unk_1E35D7870;
  v30 = v40;
  v45 = v30;
  v46 = self;
  v31 = v11;
  v47 = v31;
  v32 = v29;
  v50 = v32;
  v33 = v41;
  v48 = v33;
  v34 = v43;
  v49 = v34;
  objc_msgSend(v30, "performBlock:", v44);
  v35 = self->_progress;

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)buf);

  return v35;
}

- (void)makeResourceUnavailableWithRequest:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *taskIdentifier;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PHServerResourceRequestRunner *v19;
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[PHServerResourceRequestRunner state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHServerResourceRequestRunner.m"), 516, CFSTR("Cannot run a resource make available request twice"));

  }
  PLImageManagerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    taskIdentifier = self->_taskIdentifier;
    objc_msgSend(v7, "assetObjectIDURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceIdentityShortDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = taskIdentifier;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Starting request to make resource unavailable with asset: %{public}@, resource: %{public}@", buf, 0x20u);

  }
  -[PHServerResourceRequestRunner setState:](self, "setState:", 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke;
  v17[3] = &unk_1E35DFAF8;
  v18 = v8;
  v19 = self;
  v20 = v7;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v15, "performTransaction:", v17);

}

- (id)_applyCorrectionsToAssetObjectIDURL:(id)a3 resourceIdentity:(id)a4 errorCodes:(id)a5 clientBundleID:(id)a6 library:(id)a7 reply:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSString *taskIdentifier;
  uint64_t (*v23)(uint64_t, uint64_t);
  NSProgress *v24;
  NSProgress *progress;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSProgress *v34;
  void *v36;
  _QWORD v37[5];
  id v38;
  _BYTE *v39;
  _QWORD v40[4];
  id v41;
  PHServerResourceRequestRunner *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _BYTE *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id location;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (-[PHServerResourceRequestRunner state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHServerResourceRequestRunner.m"), 547, CFSTR("Cannot run a repair request twice"));

  }
  PLImageManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    taskIdentifier = self->_taskIdentifier;
    PLResourceIdentityShortDescription();
    v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = taskIdentifier;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    v54 = v23;
    LOWORD(v55) = 2114;
    *(_QWORD *)((char *)&v55 + 2) = v17;
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_INFO, "[RM] %{public}@ Starting request to repair resource with asset: %{public}@, resource: %{public}@, error codes: %{public}@", buf, 0x2Au);

  }
  -[PHServerResourceRequestRunner setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0D71B68], "discreteProgressWithTotalUnitCount:", 100);
  v24 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v24;

  objc_initWeak(&location, self);
  v26 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke;
  v49[3] = &unk_1E35DE1A8;
  objc_copyWeak(&v51, &location);
  v27 = v20;
  v50 = v27;
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v49);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__9052;
  *(_QWORD *)&v55 = __Block_byref_object_dispose__9053;
  *((_QWORD *)&v55 + 1) = 0;
  v40[0] = v26;
  v40[1] = 3221225472;
  v40[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3;
  v40[3] = &unk_1E35D7820;
  v28 = v19;
  v41 = v28;
  v42 = self;
  v29 = v15;
  v43 = v29;
  v48 = buf;
  v30 = v17;
  v44 = v30;
  v31 = v16;
  v45 = v31;
  v32 = v18;
  v46 = v32;
  v47 = v27;
  v37[0] = v26;
  v37[1] = 3221225472;
  v37[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3_83;
  v37[3] = &unk_1E35DB4F0;
  v37[4] = self;
  v33 = v47;
  v38 = v33;
  v39 = buf;
  objc_msgSend(v28, "performTransaction:completionHandler:withPriority:", v40, v37, 1);
  v34 = self->_progress;

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

  return v34;
}

- (id)applyResourceScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "assetObjectIDURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHServerResourceRequestRunner _applyCorrectionsToAssetObjectIDURL:resourceIdentity:errorCodes:clientBundleID:library:reply:](self, "_applyCorrectionsToAssetObjectIDURL:resourceIdentity:errorCodes:clientBundleID:library:reply:", v17, v18, v15, v14, v13, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)applyAssetScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "assetObjectIDURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHServerResourceRequestRunner _applyCorrectionsToAssetObjectIDURL:resourceIdentity:errorCodes:clientBundleID:library:reply:](self, "_applyCorrectionsToAssetObjectIDURL:resourceIdentity:errorCodes:clientBundleID:library:reply:", v16, 0, v15, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_resourceQualifiesForCacheMetricsCollection:(id)a3 isLivePhoto:(BOOL)a4
{
  BOOL result;
  uint64_t v5;

  result = 0;
  if (a3 && a4)
  {
    v5 = objc_msgSend(a3, "cplType");
    return v5 == 6 || v5 == 18;
  }
  return result;
}

- (void)_replyToVideoRequestWithURL:(id)a3 mediaItemMakerData:(id)a4 mutableInfo:(id)a5 internalInfo:(id)a6 error:(id)a7 pathForAdjustmentFileIfNeeded:(id)a8 reply:(id)a9
{
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  PHServerResourceRequestRunner *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v15 = (uint64_t)a3;
  v16 = (unint64_t)a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v15 | v16 && v20)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v40 = self;
      if (!v18)
        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23 = *MEMORY[0x1E0D73380];
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v23);

      v25 = *MEMORY[0x1E0D73388];
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v25);

      v27 = *MEMORY[0x1E0D73370];
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, v27);

      self = v40;
    }

  }
  if (v15)
  {
    objc_msgSend((id)v15, "scheme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("file"));

    if (v30)
    {
      objc_msgSend((id)v15, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PLGetSandboxExtensionToken();
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D732D0]), "initWithURL:sandboxExtensionToken:consume:", v15, v32, 0);

        v15 = v33;
      }

    }
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __147__PHServerResourceRequestRunner__replyToVideoRequestWithURL_mediaItemMakerData_mutableInfo_internalInfo_error_pathForAdjustmentFileIfNeeded_reply___block_invoke;
  v41[3] = &unk_1E35D7870;
  v42 = (id)v15;
  v43 = (id)v16;
  v44 = v17;
  v45 = v18;
  v46 = v19;
  v47 = v21;
  v34 = v19;
  v35 = v18;
  v36 = v17;
  v37 = (id)v16;
  v38 = (id)v15;
  v39 = v21;
  -[PHServerResourceRequestRunner _safeReply:](self, "_safeReply:", v41);

}

- (id)videoResourceChoiceForAsset:(id)a3 context:(id)a4 loadingMode:(int64_t *)a5 request:(id)a6 shouldReturnAdjustmentInfo:(BOOL *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSString *taskIdentifier;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  NSString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = objc_alloc(MEMORY[0x1E0D71BC0]);
  objc_msgSend(v16, "behaviorSpec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  v19 = (void *)objc_msgSend(v17, "initWithContext:assetInformation:options:size:", v15, v15, v18);

  v39 = 0;
  objc_msgSend(v19, "chooseResourceWithLoadingMode:needsAdjustmentData:error:", a5, a7, &v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v39;
  v22 = v21;
  if (v20)
  {
    v23 = v21;
    goto LABEL_12;
  }
  v36 = a8;
  v37 = v14;
  objc_msgSend(v21, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D72EE8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  if ((v26 & 1) == 0)
  {
    v23 = v22;
    v14 = v37;
LABEL_9:
    if (v36)
    {
      v23 = objc_retainAutorelease(v23);
      v20 = 0;
      *v36 = v23;
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_12;
  }
  PLImageManagerGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    taskIdentifier = self->_taskIdentifier;
    objc_msgSend(v37, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = taskIdentifier;
    v42 = 2112;
    v43 = v29;
    _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "%{public}@ video request found zero playable videos for asset: %@, retrying, returned video may not be playable", buf, 0x16u);

  }
  objc_msgSend(v16, "behaviorSpec");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");

  objc_msgSend(v31, "setRestrictToPlayableOnCurrentDevice:", 0);
  v32 = objc_alloc(MEMORY[0x1E0D71BC0]);
  objc_msgSend(v16, "size");
  v33 = (void *)objc_msgSend(v32, "initWithContext:assetInformation:options:size:", v15, v15, v31);
  v38 = v22;
  objc_msgSend(v33, "chooseResourceWithLoadingMode:needsAdjustmentData:error:", a5, a7, &v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v38;

  v23 = v34;
  v14 = v37;
  if (!v20)
    goto LABEL_9;
LABEL_12:

  return v20;
}

- (id)chooseVideoWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSProgress *v22;
  NSProgress *progress;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSProgress *v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  PHServerResourceRequestRunner *v37;
  id v38;
  id v39;
  id v40;
  os_signpost_id_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD aBlock[4];
  id v46;
  os_signpost_id_t v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a4;
  v12 = a5;
  v13 = a6;
  if (-[PHServerResourceRequestRunner state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHServerResourceRequestRunner.m"), 707, CFSTR("Cannot run a video request twice"));

  }
  PLImageManagerGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, v11);

  PLImageManagerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138543618;
    v49 = v11;
    v50 = 2114;
    v51 = v12;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "com.apple.photos.backend.chooseVideo", "Request %{public}@ for client %{public}@", buf, 0x16u);
  }

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke;
  aBlock[3] = &unk_1E35D7898;
  v47 = v15;
  v19 = v13;
  v46 = v19;
  v20 = _Block_copy(aBlock);
  objc_msgSend(v11, "behaviorSpec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHServerResourceRequestRunner setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v22 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v22;

  objc_initWeak((id *)buf, self);
  v42[0] = v18;
  v42[1] = 3221225472;
  v42[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_92;
  v42[3] = &unk_1E35DE1A8;
  objc_copyWeak(&v44, (id *)buf);
  v24 = v20;
  v43 = v24;
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v42);
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_3;
  v34[3] = &unk_1E35D78E8;
  v25 = v21;
  v35 = v25;
  v26 = v33;
  v36 = v26;
  v37 = self;
  v27 = v11;
  v38 = v27;
  v28 = v12;
  v39 = v28;
  v41 = v15;
  v29 = v24;
  v40 = v29;
  objc_msgSend(v26, "performBlock:", v34);
  v30 = self->_progress;

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

  return v30;
}

- (void)addClientSystemInformationToMutableStreamingHints:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHServerResourceRequestRunner.m"), 961, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mutableStreamingHints"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHServerResourceRequestRunner currentSystemSupportsProMotionDisplay](self, "currentSystemSupportsProMotionDisplay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D112C0]);

}

- (BOOL)currentSystemSupportsProMotionDisplay
{
  if (currentSystemSupportsProMotionDisplay_onceToken != -1)
    dispatch_once(&currentSystemSupportsProMotionDisplay_onceToken, &__block_literal_global_110);
  return currentSystemSupportsProMotionDisplay_currentSystemSupportsProMotionDisplay;
}

- (id)startDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 needsDownload:(BOOL)a7 shouldApplyTimeRange:(BOOL)a8 reply:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __CFString *v39;
  void *v40;
  os_signpost_id_t v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  void *v48;
  void *ptr;
  _QWORD v50[5];
  __CFString *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  os_signpost_id_t v57;
  BOOL v58;
  BOOL v59;
  char v60;
  char v61;
  _OWORD v62[3];
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v46 = a9;
  v16 = a5;
  objc_msgSend(v15, "asset");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "photoLibrary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("generation");
  if (v9)
    v18 = CFSTR("download");
  v19 = v18;
  ptr = v14;
  objc_msgSend(v14, "behaviorSpec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v20, "isNetworkAccessAllowed");
  if (v10)
  {
    objc_msgSend(v15, "asset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathForAdjustmentFile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v15, "dataStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "supportsTimeRange") & !v10;

  PLImageManagerGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v42 = os_signpost_id_make_with_pointer(v25, ptr);

  v26 = objc_alloc_init(MEMORY[0x1E0D71A78]);
  objc_msgSend(v26, "setTaskIdentifier:", self->_taskIdentifier);
  objc_msgSend(v26, "setNetworkAccessAllowed:", objc_msgSend(v20, "isNetworkAccessAllowed"));
  objc_msgSend(v26, "setWantsProgress:", objc_msgSend(ptr, "wantsProgress"));
  objc_msgSend(v26, "setClientBundleID:", v16);

  v27 = objc_msgSend(v20, "downloadIntent");
  v28 = objc_msgSend(v20, "downloadPriority");
  if ((unint64_t)(v27 - 1) > 0xB)
    v29 = 0;
  else
    v29 = qword_19944A688[v27 - 1];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", v29, v28 == 1);
  objc_msgSend(v26, "setDownloadOptions:", v30);

  if (v24)
  {
    if (v20)
    {
      objc_msgSend(v20, "timeRange");
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
      v63 = 0u;
    }
    objc_msgSend(v26, "downloadOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v63;
    v62[1] = v64;
    v62[2] = v65;
    objc_msgSend(v31, "setTimeRange:", v62);

  }
  v32 = -[PHServerResourceRequestRunner _resourceQualifiesForCacheMetricsCollection:isLivePhoto:](self, "_resourceQualifiesForCacheMetricsCollection:isLivePhoto:", v15, objc_msgSend(v48, "isPhotoIris"));
  objc_msgSend(v15, "dataStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke;
  v50[3] = &unk_1E35D7930;
  v50[4] = self;
  v51 = v19;
  v58 = v32;
  v59 = a8;
  v60 = v24;
  v52 = v44;
  v53 = v45;
  v54 = v15;
  v55 = v22;
  v56 = v46;
  v57 = v42;
  v61 = v43;
  v34 = v46;
  v35 = v22;
  v36 = v15;
  v37 = v45;
  v38 = v44;
  v39 = v19;
  objc_msgSend(v33, "requestLocalAvailabilityChange:forResource:options:completion:", 1, v36, v26, v50);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void)startWalrusTimeRangeDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 partialVideoURL:(id)a7 reply:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  os_signpost_id_t v60;
  _OWORD v61[3];
  _QWORD aBlock[4];
  id v63;
  os_signpost_id_t v64;
  uint8_t buf[16];

  v10 = a6;
  v13 = a3;
  v14 = a4;
  v49 = a5;
  v41 = a7;
  v15 = a8;
  PLImageManagerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_make_with_pointer(v16, v13);

  PLImageManagerGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload", ", buf, 2u);
  }

  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke;
  aBlock[3] = &unk_1E35D7898;
  v63 = v15;
  v64 = v17;
  v48 = v15;
  v21 = _Block_copy(aBlock);
  objc_msgSend(v14, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uuid");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v22;
  objc_msgSend(v22, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "managedObjectContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniformTypeIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v14, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pathForAdjustmentFile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v50 = v13;
  objc_msgSend(v13, "behaviorSpec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHServerResourceRequestRunner _avAssetProxyForOutOfBandHintsAboutAssetForResource:](self, "_avAssetProxyForOutOfBandHintsAboutAssetForResource:", v14);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHServerResourceRequestRunner mutableStreamingHintsForAVAssetProxy:](self, "mutableStreamingHintsForAVAssetProxy:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D112E0]);
  PLImageManagerGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v17, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload.streamingUrl", ", buf, 2u);
  }

  objc_msgSend(v14, "dataStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v27, "streamingVideoIntent");
  if (v27)
    objc_msgSend(v27, "timeRange");
  else
    memset(v61, 0, sizeof(v61));
  v51[0] = v20;
  v51[1] = 3221225472;
  v51[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_115;
  v51[3] = &unk_1E35D7980;
  v59 = v21;
  v60 = v17;
  v51[4] = self;
  v52 = v41;
  v53 = v27;
  v54 = v40;
  v55 = v38;
  v56 = v23;
  v57 = v14;
  v58 = v26;
  v37 = v26;
  v32 = v14;
  v36 = v23;
  v39 = v38;
  v33 = v40;
  v34 = v27;
  v45 = v41;
  v35 = v21;
  objc_msgSend(v30, "requestStreamingURLForResource:asset:intent:timeRange:streamingHints:inContext:clientBundleID:completion:", v32, v47, v31, v61, v42, v46, v49, v51);

}

- (id)mutableStreamingHintsForAVAssetProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHServerResourceRequestRunner addClientSystemInformationToMutableStreamingHints:](self, "addClientSystemInformationToMutableStreamingHints:", v5);
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v4, 0);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D112D8]);
      if (objc_msgSend(v6, "isSpatialMedia"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D112D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
      if (objc_msgSend(v6, "isHDR"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D112C8]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

      }
      objc_msgSend(v6, "hevcProfileInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D11300]);

        objc_msgSend(v11, "tier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D11308]);

        objc_msgSend(v11, "level");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D112E8]);

      }
      objc_msgSend(v6, "cameraMake");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v6, "cameraMake");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D112F0]);

      }
      objc_msgSend(v6, "cameraModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v6, "cameraModel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D112F8]);

      }
    }
    objc_msgSend(v6, "apacAudioTrackChannelCount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "apacAudioTrackChannelCount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D112A8]);

    }
    objc_msgSend(v6, "apacAudioTrackHoaChannelCount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v6, "apacAudioTrackHoaChannelCount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D112B8]);

      objc_msgSend(v6, "apacAudioTrackBedChannelCount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D112A0]);

    }
    objc_msgSend(v6, "apacAudioTrackCodecProfileLevelDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "apacAudioTrackCodecProfileLevelDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D112B0]);

    }
  }

  return v5;
}

- (id)_avAssetProxyForOutOfBandHintsAboutAssetForResource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasAdjustments") & 1) != 0)
    objc_msgSend(v3, "avAssetProxyForFullSizeAllowReadFromFile:", 1);
  else
    objc_msgSend(v3, "avAssetProxyForOriginalAllowReadFromFile:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_urlByAttachingOutOfBandHintsToVideoURL:(id)a3 assetProxy:(id)a4 signpostId:(unint64_t)a5 hintsBase64String:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  PLImageManagerGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, a5, "com.apple.photos.backend.chooseVideo.outOfBandHints", ", buf, 2u);
  }

  v13 = v9;
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v15 = v13;
    if (v10)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v10, 0);
      objc_msgSend(v16, "outOfBandHintsBase64String");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      objc_msgSend(MEMORY[0x1E0D75130], "urlByAttachingOutOfBandHintsBase64String:toVideoURL:", v18, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  PLImageManagerGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_END, a5, "com.apple.photos.backend.chooseVideo.outOfBandHints", ", v22, 2u);
  }

  return v15;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_dataStoreFollower, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  PLImageManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 40);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v19, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload", ", v20, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_115(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _OWORD v35[3];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  PLImageManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 104);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_END, v14, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload.streamingUrl", ", buf, 2u);
  }

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v36);
    v18 = v36;

    if ((v17 & 1) != 0)
    {
      v19 = *(void **)(a1 + 48);
      if (v19)
        objc_msgSend(v19, "timeRange");
      else
        memset(v35, 0, sizeof(v35));
      v22 = *(_QWORD *)(a1 + 56);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_118;
      v27[3] = &unk_1E35D7958;
      v23 = *(_QWORD *)(a1 + 40);
      v27[4] = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 104);
      v33 = *(id *)(a1 + 96);
      v28 = *(id *)(a1 + 40);
      v29 = *(id *)(a1 + 64);
      v30 = *(id *)(a1 + 72);
      v25 = *(id *)(a1 + 80);
      v26 = *(_QWORD *)(a1 + 104);
      v31 = v25;
      v34 = v26;
      v32 = *(id *)(a1 + 88);
      +[PHImageManager exportVideoFileForTimeRange:fromVideoMediaItemMakerData:forAssetUuid:toOutputFileURL:fingerPrint:signpostId:options:completion:](PHImageManager, "exportVideoFileForTimeRange:fromVideoMediaItemMakerData:forAssetUuid:toOutputFileURL:fingerPrint:signpostId:options:completion:", v35, v9, v22, v23, v10, v24, 0, v27);

    }
    else
    {
      PLImageManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543618;
        v38 = v21;
        v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ ADP time range video export failed, unable to create parent directories: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", 0, 0, 0, 0, v18, 0, *(_QWORD *)(a1 + 96));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", 0, 0, 0, 0, v11, 0, *(_QWORD *)(a1 + 96));
  }

}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_118(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D715D8], "markPurgeableForFileAtURL:withUrgency:outInode:", *(_QWORD *)(a1 + 40), 0, 0);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "[RM]: %{public}@ ADP time range video download complete with url: %@", buf, 0x16u);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("PHImageFileUTIKey"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v24 = __Block_byref_object_copy__9052;
    v25 = __Block_byref_object_dispose__9053;
    v26 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_119;
    v19 = &unk_1E35DEE50;
    v11 = *(_QWORD *)(a1 + 32);
    v22 = buf;
    v20 = v11;
    v12 = *(void **)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v12, "performBlockAndWait:", &v16);
    objc_msgSend(*(id *)(a1 + 32), "_urlByAttachingOutOfBandHintsToVideoURL:assetProxy:signpostId:hintsBase64String:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *(_QWORD *)(a1 + 88), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v13, 0, v6, v7, v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v16, v17, v18, v19, v20);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ ADP time range video export failed: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", 0, 0, 0, 0, v5, 0, *(_QWORD *)(a1 + 80));
  }

}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_119(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_avAssetProxyForOutOfBandHintsAboutAssetForResource:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  id v30;
  _BYTE *v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PLImageManagerGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v33 = v7;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video %{public}@ complete with url: %@", buf, 0x20u);
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("PHImageFileUTIKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("PHImageRequestResultEligibleForCacheMetricsLogging"));

    if (*(_BYTE *)(a1 + 96))
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"));
    if (*(_BYTE *)(a1 + 97))
    {
      if (*(_BYTE *)(a1 + 98))
        objc_msgSend(MEMORY[0x1E0D715D8], "markPurgeableForFileAtURL:withUrgency:outInode:", v7, 0, 0);
      else
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHApplyTimeRangeKey"));
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__9052;
    v34 = __Block_byref_object_dispose__9053;
    v35 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke_114;
    v28 = &unk_1E35DEE50;
    v22 = *(_QWORD *)(a1 + 32);
    v31 = buf;
    v29 = v22;
    v23 = *(void **)(a1 + 56);
    v30 = *(id *)(a1 + 64);
    objc_msgSend(v23, "performBlockAndWait:", &v25);
    objc_msgSend(*(id *)(a1 + 32), "_urlByAttachingOutOfBandHintsToVideoURL:assetProxy:signpostId:hintsBase64String:", v7, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *(_QWORD *)(a1 + 88), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v24, 0, v8, v9, v6, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v25, v26, v27, v28, v29);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v33 = v6;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ video %{public}@ failed with error: %@", buf, 0x20u);
    }

    objc_msgSend(v6, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D11268]))
      v18 = objc_msgSend(v6, "code") == 80 || objc_msgSend(v6, "code") == 81 || objc_msgSend(v6, "code") == 82;
    else
      v18 = 0;

    objc_msgSend(v6, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D74600]))
      v20 = objc_msgSend(v6, "code") == 6;
    else
      v20 = 0;

    if ((v18 || v20)
      && (objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsInCloudKey")), v20))
    {
      if (*(_BYTE *)(a1 + 99))
        PHStreamingDeniedError();
      else
        PHNetworkAccessAllowedRequiredError();
      v21 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (uint64_t)v6;
    }
    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", 0, 0, v8, v9, v21, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    v6 = (uint64_t (*)(uint64_t, uint64_t))v21;
  }

}

void __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke_114(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_avAssetProxyForOutOfBandHintsAboutAssetForResource:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __70__PHServerResourceRequestRunner_currentSystemSupportsProMotionDisplay__block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  currentSystemSupportsProMotionDisplay_currentSystemSupportsProMotionDisplay = objc_msgSend(v0, "BOOLValue");

}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  PLImageManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 40);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v19, "com.apple.photos.backend.chooseVideo", ", v20, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_92(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_2;
  v3[3] = &unk_1E35DF948;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_cancelWithReply:", v3);

}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  char v28;
  __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  __CFString *v35;
  int v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  _BOOL4 v60;
  uint64_t v61;
  int v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  int v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  const __CFString *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL8 v77;
  NSObject *v78;
  int v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  uint64_t v122;
  void *v123;
  void *v124;
  _BOOL8 v125;
  void *v126;
  void *v127;
  void *v128;
  unsigned int v129;
  int v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[5];
  NSObject *v143;
  id v144;
  uint64_t v145;
  _OWORD v146[3];
  _BYTE v147[56];
  NSObject *v148;
  _OWORD v149[3];
  NSObject *v150;
  char v151;
  uint64_t v152;
  id v153;
  id v154;
  uint64_t v155;
  void *v156;
  uint8_t buf[4];
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  const __CFString *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  uint64_t v166;
  __int16 v167;
  uint64_t v168;
  __int16 v169;
  const __CFString *v170;
  __int16 v171;
  const __CFString *v172;
  __int16 v173;
  const __CFString *v174;
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v130 = objc_msgSend(*(id *)(a1 + 32), "isNetworkAccessAllowed");
  v2 = objc_msgSend(*(id *)(a1 + 32), "isStreamingAllowed");
  if ((objc_msgSend(*(id *)(a1 + 40), "isWalrusEnabled") & 1) != 0)
    v132 = 1;
  else
    v132 = objc_msgSend(*(id *)(a1 + 32), "restrictToEncryptedStream");
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id *)(a1 + 56);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
    if (objc_msgSend(*(id *)(a1 + 56), "wantsProgress"))
      v6 = CFSTR("Y");
    else
      v6 = CFSTR("N");
    objc_msgSend(*v4, "assetObjectIDURL");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "size");
    v9 = v8;
    objc_msgSend(*v4, "size");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v130)
      v14 = CFSTR("Y");
    else
      v14 = CFSTR("N");
    *(_DWORD *)buf = 138545410;
    if (v2)
      v15 = CFSTR("Y");
    else
      v15 = CFSTR("N");
    v158 = v5;
    v159 = 2114;
    if (v132)
      v16 = CFSTR("Y");
    else
      v16 = CFSTR("N");
    v160 = (uint64_t)v6;
    v161 = 2114;
    v162 = v7;
    v163 = 2048;
    v164 = v9;
    v165 = 2048;
    v166 = v11;
    v167 = 2114;
    v168 = v12;
    v169 = 2114;
    v170 = v14;
    v171 = 2114;
    v172 = v15;
    v173 = 2114;
    v174 = v16;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Starting request for video with progress: %{public}@, asset: %{public}@, size (%f, %f), behavior: %{public}@, net-initial: %{public}@, stream-initial: %{public}@, ADP: %{public}@", buf, 0x5Cu);

  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "assetObjectIDURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0;
  objc_msgSend(v17, "_assetAndRelatedObjectsFromAssetObjectIDURL:inManagedObjectContext:error:", v18, v136, &v154);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v154;

  PLImageManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
      objc_msgSend(v19, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "hasAdjustments"))
        v25 = CFSTR("Y");
      else
        v25 = CFSTR("N");
      objc_msgSend(v19, "deferredProcessingNeeded");
      PLManagedAssetDeferredProcessingNeededDescription();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v158 = v23;
      v159 = 2114;
      v160 = (uint64_t)v24;
      v161 = 2114;
      v162 = v25;
      v163 = 2114;
      v164 = v26;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ video request found asset: %{public}@, hasAdjustments: %{public}@, deferredProcessingNeeded: %{public}@", buf, 0x2Au);

    }
    v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BD0]), "initWithManagedObjectContext:asset:", v136, v19);
    if (objc_msgSend(v19, "videoDeferredProcessingNeeded"))
    {
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
      v153 = 0;
      v28 = objc_msgSend(MEMORY[0x1E0D71A00], "bailOutOfVideoFinalizationForAsset:taskIdentifier:error:", v19, v27, &v153);
      v29 = (__CFString *)v153;
      if ((v28 & 1) == 0)
      {
        PLImageManagerGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          objc_msgSend(v19, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v158 = v31;
          v159 = 2114;
          v160 = (uint64_t)v32;
          v161 = 2112;
          v162 = v29;
          _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Failed to bail out of video finalization for asset with UUID: %{public}@ and error: %@", buf, 0x20u);

        }
      }
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
      *(_DWORD *)buf = 138543618;
      v158 = v33;
      v159 = 2112;
      v160 = (uint64_t)v20;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "setState:", 3);
    v135 = 0;
  }
  v152 = 0;
  v151 = 0;
  objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransport");
  objc_msgSend(v19, "savedAssetType");
  v34 = PLValidatedSavedAssetTypeApplies();
  v35 = 0;
  v36 = v2 ^ 1;
  if (objc_msgSend(*(id *)(a1 + 48), "state") == 3 || (v36 & 1) != 0 || ((v34 ^ 1) & 1) != 0 || ((v132 ^ 1) & 1) != 0)
  {
    v139 = 0;
    v39 = v20;
  }
  else
  {
    v37 = *(void **)(a1 + 48);
    v38 = *(_QWORD *)(a1 + 56);
    v150 = v20;
    objc_msgSend(v37, "videoResourceChoiceForAsset:context:loadingMode:request:shouldReturnAdjustmentInfo:error:", v19, v135, &v152, v38, &v151, &v150);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v150;

    if (v139)
    {
      objc_msgSend(v135, "backingResourceForVideoResource:");
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString fingerprint](v35, "fingerprint");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0D11398], "fingerprintSchemeForFingerprint:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41 && (objc_msgSend(v41, "allowsStreaming") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setStreamingAllowed:", 0);
          v43 = *(void **)(a1 + 32);
          v44 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
          v149[0] = *MEMORY[0x1E0CA2E40];
          v149[1] = v44;
          v149[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
          objc_msgSend(v43, "setTimeRange:", v149);
          if (v130 && (objc_msgSend(*(id *)(a1 + 32), "streamingIntentAllowsFallbackToDownload") & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessAllowed:", 0);
          PLImageManagerGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
            objc_msgSend(v19, "uuid");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "fingerprintSchemeDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v158 = v46;
            v159 = 2114;
            v160 = (uint64_t)v137;
            v161 = 2114;
            v162 = v35;
            v163 = 2112;
            v164 = v47;
            _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser overriding streaming with download for asset %{public}@ / resource %{public}@ because ADP+%@ are enabled", buf, 0x2Au);

          }
          v35 = 0;
          v139 = 0;
          v152 = 0;
          v151 = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      else
      {
        v42 = 0;
      }
      PLImageManagerGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
        PLVideoResourceDescription();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v158 = v49;
        v159 = 2114;
        v160 = (uint64_t)v50;
        _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser selected result: %{public}@", buf, 0x16u);

      }
      goto LABEL_54;
    }
    v35 = 0;
    v139 = 0;
  }
LABEL_55:
  if (objc_msgSend(*(id *)(a1 + 48), "state") != 1 || v139)
  {
    v138 = v39;
  }
  else
  {
    v51 = *(void **)(a1 + 48);
    v52 = *(_QWORD *)(a1 + 56);
    v148 = v39;
    objc_msgSend(v51, "videoResourceChoiceForAsset:context:loadingMode:request:shouldReturnAdjustmentInfo:error:", v19, v135, &v152, v52, &v151, &v148);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v148;

    if (v139)
    {
      objc_msgSend(v135, "backingResourceForVideoResource:");
      v53 = objc_claimAutoreleasedReturnValue();

      PLImageManagerGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
        PLVideoResourceDescription();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v158 = v55;
        v159 = 2114;
        v160 = (uint64_t)v56;
        _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser selected result: %{public}@", buf, 0x16u);

      }
      v35 = (__CFString *)v53;
    }
    else
    {
      v139 = 0;
    }
  }
  objc_msgSend(v19, "uuid");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(*(id *)(a1 + 32), "hasValidTimeRange");
  -[__CFString dataStore](v35, "dataStore");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "supportsTimeRange");
  v60 = v151 != 0;

  v61 = objc_msgSend(*(id *)(a1 + 48), "state");
  v129 = v57 & v36;
  v62 = v57 & v36 ^ 1;
  if (v61 != 1)
    v62 = 1;
  if (((v62 | v59 ^ 1 | v60) & 1) != 0
    || (-[__CFString fingerprint](v35, "fingerprint"),
        v63 = (void *)objc_claimAutoreleasedReturnValue(),
        v64 = v63 == 0,
        v63,
        v64))
  {
    v68 = 0;
    v133 = 0;
    v134 = 0;
    v69 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "pathManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString fingerprint](v35, "fingerprint");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = *(void **)(a1 + 32);
    if (v67)
      objc_msgSend(v67, "timeRange");
    else
      memset(v147, 0, 48);
    objc_msgSend(v65, "URLForPartialVideoWithResourceFingerprint:assetUUID:timeRange:", v66, v131, v147);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v133, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(*(id *)(a1 + 48), "setState:", 4);
      v68 = v133;
      objc_msgSend((id)*MEMORY[0x1E0CEC558], "identifier");
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v129 = 0;
      v69 = 0;
      v138 = 0;
      v133 = v68;
    }
    else
    {
      v68 = 0;
      v134 = 0;
      if (v152 == 2)
        v69 = v132;
      else
        v69 = 0;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "state") == 1)
  {
    v70 = v152;
    switch(v152)
    {
      case 0:
        objc_msgSend(*(id *)(a1 + 48), "setState:", 3);
        PLImageManagerGetLog();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          objc_msgSend(v19, "uuid");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v158 = v81;
          v159 = 2114;
          v160 = (uint64_t)v82;
          v161 = 2112;
          v162 = (const __CFString *)v138;
          _os_log_impl(&dword_1991EC000, v80, OS_LOG_TYPE_ERROR, "[RM] %{public}@: Video request unable to find video resource for asset with uuid: %{public}@, error: %@", buf, 0x20u);

        }
        PHErrorFromPLError(v138);
        v83 = objc_claimAutoreleasedReturnValue();
        v79 = 0;
        goto LABEL_109;
      case 1:
        objc_msgSend(*(id *)(a1 + 48), "setState:", 3);
        PLImageManagerGetLog();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          v85 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          *(_DWORD *)buf = 138543362;
          v158 = v85;
          _os_log_impl(&dword_1991EC000, v84, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ resource is in the cloud, but network access not allowed", buf, 0xCu);
        }

        if ((v130 & 1) != 0)
          PHStreamingDeniedError();
        else
          PHNetworkAccessAllowedRequiredError();
        v83 = objc_claimAutoreleasedReturnValue();
        v79 = 1;
LABEL_109:
        v78 = v138;
        v95 = v68;
        v96 = (uint64_t)v134;
        v138 = v83;
        break;
      case 2:
      case 4:
        PLImageManagerGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          v72 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          v73 = CFSTR("generation");
          if (v70 == 2)
            v73 = CFSTR("download");
          *(_DWORD *)buf = 138543874;
          v158 = v72;
          v159 = 2114;
          v160 = (uint64_t)v73;
          v161 = 1024;
          LODWORD(v162) = v69;
          _os_log_impl(&dword_1991EC000, v71, OS_LOG_TYPE_INFO, "[RM]: %{public}@ requesting video %{public}@, partial ADP download=%d", buf, 0x1Cu);
        }

        v74 = *(void **)(a1 + 48);
        v75 = *(_QWORD *)(a1 + 56);
        v76 = *(_QWORD *)(a1 + 64);
        v77 = v151 != 0;
        if (v69)
        {
          objc_msgSend(v74, "startWalrusTimeRangeDownloadForRequest:backingResource:clientBundleID:shouldReturnAdjustmentInfo:partialVideoURL:reply:", v75, v35, v76, v77, v133, *(_QWORD *)(a1 + 72));
          v78 = 0;
        }
        else
        {
          objc_msgSend(v74, "startDownloadForRequest:backingResource:clientBundleID:shouldReturnAdjustmentInfo:needsDownload:shouldApplyTimeRange:reply:", v75, v35, v76, v77, v70 == 2, v129, *(_QWORD *)(a1 + 72));
          v78 = objc_claimAutoreleasedReturnValue();
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
        v99 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(v99 + 40) == 1)
        {
          objc_initWeak((id *)buf, (id)v99);
          if (v78)
          {
            v100 = objc_alloc(MEMORY[0x1E0D71A18]);
            v140[0] = MEMORY[0x1E0C809B0];
            v140[1] = 3221225472;
            v140[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_103;
            v140[3] = &unk_1E35DE530;
            objc_copyWeak(&v141, (id *)buf);
            v101 = objc_msgSend(v100, "initWithSourceProgress:progressHandler:", v78, v140);
            v102 = *(_QWORD *)(a1 + 48);
            v103 = *(void **)(v102 + 24);
            *(_QWORD *)(v102 + 24) = v101;

            objc_destroyWeak(&v141);
          }
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40) = 2;
          -[__CFString dataStore](v35, "dataStore");
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = *(_QWORD *)(a1 + 48);
          v106 = *(void **)(v105 + 32);
          *(_QWORD *)(v105 + 32) = v104;

          objc_destroyWeak((id *)buf);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v99 + 16));
          -[NSObject cancel](v78, "cancel");
        }
        goto LABEL_114;
      case 3:
        PLImageManagerGetLog();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          v87 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          v88 = objc_msgSend(*(id *)(a1 + 32), "streamingVideoIntent");
          *(_DWORD *)buf = 138543618;
          v158 = v87;
          v159 = 2048;
          v160 = v88;
          _os_log_impl(&dword_1991EC000, v86, OS_LOG_TYPE_INFO, "[RM]: %{public}@ requesting video streaming url with intent %ld", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 48), "_avAssetProxyForOutOfBandHintsAboutAssetForResource:", v35);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "mutableStreamingHintsForAVAssetProxy:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90;
        if (v132)
          objc_msgSend(v90, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D112E0]);
        -[__CFString dataStore](v35, "dataStore");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(*(id *)(a1 + 32), "streamingVideoIntent");
        v94 = *(void **)(a1 + 32);
        if (v94)
          objc_msgSend(v94, "timeRange");
        else
          memset(v146, 0, sizeof(v146));
        v107 = *(_QWORD *)(a1 + 48);
        v108 = *(_QWORD *)(a1 + 64);
        v142[0] = MEMORY[0x1E0C809B0];
        v142[1] = 3221225472;
        v142[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_97;
        v142[3] = &unk_1E35D78C0;
        v142[4] = v107;
        v78 = v89;
        v110 = *(void **)(a1 + 72);
        v109 = *(_QWORD *)(a1 + 80);
        v143 = v78;
        v145 = v109;
        v144 = v110;
        objc_msgSend(v92, "requestStreamingURLForResource:asset:intent:timeRange:streamingHints:inContext:clientBundleID:completion:", v35, v19, v93, v146, v91, v136, v108, v142);

        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
        v111 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(v111 + 40) == 1)
        {
          *(_QWORD *)(v111 + 40) = 2;
          v111 = *(_QWORD *)(a1 + 48);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v111 + 16));

LABEL_114:
        v79 = 0;
        v95 = v68;
        v96 = (uint64_t)v134;
        break;
      case 5:
        objc_msgSend(*(id *)(a1 + 48), "setState:", 4);
        objc_msgSend(v139, "fileURLIfLocal");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v139, "uniformTypeIdentifier");
        v96 = objc_claimAutoreleasedReturnValue();

        PLImageManagerGetLog();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v97 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
          objc_msgSend(v95, "path");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v158 = v97;
          v159 = 2112;
          v160 = (uint64_t)v98;
          _os_log_impl(&dword_1991EC000, v78, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ returning locally available video at path: %@", buf, 0x16u);

        }
        v79 = 0;
        break;
      default:
        goto LABEL_78;
    }

    v68 = v95;
    v134 = (void *)v96;
  }
  else
  {
LABEL_78:
    v79 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "state") == 1)
  {
    PLImageManagerGetLog();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      v113 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
      *(_DWORD *)buf = 138543362;
      v158 = v113;
      _os_log_impl(&dword_1991EC000, v112, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request failed to complete", buf, 0xCu);
    }

    v114 = (void *)MEMORY[0x1E0CB35C8];
    v155 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video request failed to complete"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v115;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 4301, v116);
    v117 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "setState:", 3);
    v138 = v117;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "state") == 2)
  {
    v118 = v68;
  }
  else
  {
    v119 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v120 = v119;
    if (v79)
      objc_msgSend(v119, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsInCloudKey"));
    v121 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v121, "setObject:forKeyedSubscript:", v134, CFSTR("PHImageFileUTIKey"));
    if ((v79 & 1) == 0)
    {
      v122 = objc_msgSend(*(id *)(a1 + 48), "_resourceQualifiesForCacheMetricsCollection:isLivePhoto:", v35, objc_msgSend(v19, "isPhotoIris"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setObject:forKeyedSubscript:", v123, CFSTR("PHImageRequestResultEligibleForCacheMetricsLogging"));

      if ((_DWORD)v122)
      {
        v124 = (void *)MEMORY[0x1E0CB37E8];
        if (v35)
          v125 = (int)-[__CFString localAvailability](v35, "localAvailability") > 0;
        else
          v125 = 0;
        objc_msgSend(v124, "numberWithInt:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "setObject:forKeyedSubscript:", v126, CFSTR("PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"));

      }
      if (v129)
        objc_msgSend(v120, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHApplyTimeRangeKey"));
    }
    if (v151)
    {
      objc_msgSend(v19, "pathForAdjustmentFile");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v127 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "_avAssetProxyForOutOfBandHintsAboutAssetForResource:", v35);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_urlByAttachingOutOfBandHintsToVideoURL:assetProxy:signpostId:hintsBase64String:", v68, v128, *(_QWORD *)(a1 + 80), 0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v118, 0, v120, v121, v138, v127, *(_QWORD *)(a1 + 72));
  }

}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_97(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("PHImageResultExpirationKey"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("PHImageResultFingerPrintKey"));
  PLImageManagerGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138543618;
    v28 = v19;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ received streaming url: %@", buf, 0x16u);
  }

  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 56);
  v26 = 0;
  objc_msgSend(v20, "_urlByAttachingOutOfBandHintsToVideoURL:assetProxy:signpostId:hintsBase64String:", v11, v21, v22, &v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("PHImageResultAVAssetOutOfBandPresentationHintsKey"));
  objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v23, v16, v25, v17, v13, 0, *(_QWORD *)(a1 + 48));

}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_103(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleProgress:", v3);

}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, 0, 0, v2);

}

uint64_t __147__PHServerResourceRequestRunner__replyToVideoRequestWithURL_mediaItemMakerData_mutableInfo_internalInfo_error_pathForAdjustmentFileIfNeeded_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    v5 = *(_QWORD *)(a1 + 48);
  else
    v5 = 0;
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    v6 = *(_QWORD *)(a1 + 56);
  else
    v6 = 0;
  return (*(uint64_t (**)(uint64_t, BOOL, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3 != 0, v3, v4, v5, v6, *(_QWORD *)(a1 + 64));
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2;
  v3[3] = &unk_1E35DF948;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_cancelWithReply:", v3);

}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id obj;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "state") != 1)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "_assetAndRelatedObjectsFromAssetObjectIDURL:inManagedObjectContext:error:", v4, v2, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 3);
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setCompletedUnitCount:", 50);
  if (objc_msgSend(*(id *)(a1 + 40), "state") == 1 && (objc_msgSend(v6, "complete") & 1) == 0)
  {
    PLImageManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      objc_msgSend(v6, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "[RM]: %{public}@ Repair: ignoring correction request for incomplete asset: %{public}@ for error codes: %{public}@.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setState:", 4);
  }
  if (v6 && objc_msgSend(*(id *)(a1 + 40), "state") == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 64), "recipeID") == 65749)
    {
      objc_msgSend(MEMORY[0x1E0D71A80], "recipeFromID:", 65749);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_80;
      v22[3] = &unk_1E35D77F8;
      v22[4] = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 72);
      v23 = *(id *)(a1 + 80);
      objc_msgSend(v14, "generateAndStoreForAsset:networkAccessAllowed:clientBundleID:progress:completion:", v6, 0, v15, 0, v22);
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
      v16 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v16 + 40) == 1)
      {
        *(_QWORD *)(v16 + 40) = 2;
        v16 = *(_QWORD *)(a1 + 40);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 16));

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 64);
      if (v17
        && (objc_msgSend(v6, "fetchResourceWithIdentity:error:", v17, 0),
            (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = v18;
        v20 = objc_msgSend(v18, "repairResourceValidationErrors:managedObjectContext:", *(_QWORD *)(a1 + 56), v2);

      }
      else
      {
        v20 = objc_msgSend(v6, "repairAssetScopeValidationErrors:", *(_QWORD *)(a1 + 56));
      }
      if (v20)
        v21 = 4;
      else
        v21 = 3;
      objc_msgSend(*(id *)(a1 + 40), "setState:", v21);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setCompletedUnitCount:", 75);

}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3_83(uint64_t a1)
{
  BOOL v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  BOOL v9;

  if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCompletedUnitCount:", 100);
    v2 = objc_msgSend(*(id *)(a1 + 32), "state") == 4;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_4;
    v6[3] = &unk_1E35D7848;
    v3 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v9 = v2;
    v5 = *(_QWORD *)(a1 + 48);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "_safeReply:", v6);

  }
}

uint64_t __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_80(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2_81;
  v12[3] = &unk_1E35DF3B8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "_safeReply:", v12);

}

uint64_t __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2_81(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "count") != 0, *(_QWORD *)(a1 + 40));
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  objc_msgSend(a1[6], "assetObjectIDURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v3, "_assetAndRelatedObjectsFromAssetObjectIDURL:inManagedObjectContext:error:", v4, v2, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;

  if (!v5)
  {
    objc_msgSend(a1[5], "setState:", 3);
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *((_QWORD *)a1[5] + 6);
      *(_DWORD *)buf = 138543618;
      v24 = v8;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(a1[5], "state") == 1)
  {
    objc_msgSend(a1[6], "resourceIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
    objc_msgSend(v5, "fetchResourceWithIdentity:error:", v9, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    if (!v10)
    {
      objc_msgSend(a1[5], "setState:", 3);
      PLImageManagerGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *((_QWORD *)a1[5] + 6);
        objc_msgSend(a1[6], "resourceIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "recipeID");
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 1024;
        LODWORD(v26) = v15;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to fetch resource with recipe %u in database, request failed", buf, 0x12u);

      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }
  if (objc_msgSend(a1[5], "state") == 1)
  {
    objc_msgSend(v10, "dataStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke_76;
    v19[3] = &unk_1E35D77D0;
    v17 = a1[6];
    v19[4] = a1[5];
    v20 = v17;
    v18 = (id)objc_msgSend(v16, "requestLocalAvailabilityChange:forResource:options:completion:", 0xFFFFFFFFLL, v10, 0, v19);

  }
}

void __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke_76(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a4)
  {
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(*(id *)(a1 + 40), "resourceIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLResourceIdentityShortDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ failed to make resource unavailable: %{public}@, error: %@", (uint8_t *)&v11, 0x20u);

    }
  }

}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2;
  v3[3] = &unk_1E35DF948;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_cancelWithReply:", v3);

}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  _BOOL4 v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _BYTE *v118;
  uint64_t v119;
  int v120;
  int v121;
  BOOL v122;
  _QWORD v123[5];
  id v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  uint8_t v131[4];
  uint64_t v132;
  __int16 v133;
  uint64_t v134;
  _BYTE buf[24];
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  _QWORD v142[4];

  v142[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "assetObjectIDURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = 0;
  objc_msgSend(v3, "_assetAndRelatedObjectsFromAssetObjectIDURL:inManagedObjectContext:error:", v4, v103, &v130);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v130;

  objc_msgSend(*v2, "libraryID");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v104)
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 3);
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "resourceType") == 9)
    {
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "recipeID") == 327685;

      if (!v10)
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0;
      objc_msgSend(v104, "mediaMetadataForResourceVersion:mediaMetadataType:", objc_msgSend(v11, "version"), &v129);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v129;

      if (v12 && v8)
      {
        PLImageManagerGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ Found existing media metadata in database", buf, 0xCu);
        }

        v15 = *(void **)(a1 + 40);
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_51;
        v125[3] = &unk_1E35DF3B8;
        v128 = *(id *)(a1 + 72);
        v126 = v12;
        v127 = v8;
        objc_msgSend(v15, "_safeReply:", v125);

      }
    }

  }
LABEL_15:
  if (objc_msgSend(*(id *)(a1 + 40), "state") != 1)
  {
    v17 = 0;
    v102 = v5;
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v5;
  objc_msgSend(v104, "fetchResourceWithIdentity:error:", v16, &v124);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v124;

  if (v17)
    goto LABEL_22;
  objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "recipeID") == 65944;

  if (v19)
  {
    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ PLImageRecipeID_Pri_EditorColorSpace_DeferredProcessingFinalImage resource is no longer available, requesting original image", buf, 0xCu);
    }

    objc_msgSend(v104, "persistedOriginalImageResource");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "recipeID") == 131280;

  if (v35)
  {
    PLImageManagerGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ PLVideoRecipeID_VidCmp_Pri_DeferredProcessingFinalVideo resource is no longer available, requesting original video", buf, 0xCu);
    }

    objc_msgSend(v104, "persistedOriginalVideoComplementResource");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "recipeID");
  v59 = PLResourceRecipeIDIsValidForFullSizeRenderVirtualResource();

  if (v59)
  {
    v60 = objc_msgSend(v104, "adjustmentsState") == 0;
    PLImageManagerGetLog();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v60)
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v71 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "recipeID");
        PLResourceRecipeIDDescription();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "uuid");
        v74 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v71;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2114;
        v136 = v74;
        _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_ERROR, "[RM] %{public}@ request for %{public}@ but no matching persisted resource found and asset %{public}@ is unadjusted", buf, 0x20u);

      }
      v75 = (void *)MEMORY[0x1E0CB35C8];
      v141 = *MEMORY[0x1E0CB2938];
      v76 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v104, "uuid");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "recipeID");
      PLResourceRecipeIDDescription();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stringWithFormat:", CFSTR("Unadjusted asset %@ incompatible with resource recipeID %@"), v77, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = v80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, &v141, 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3307, v81);
      v82 = objc_claimAutoreleasedReturnValue();

      v102 = (id)v82;
    }
    else
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "recipeID");
        PLResourceRecipeIDDescription();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "uuid");
        v66 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v65;
        *(_WORD *)&buf[22] = 2114;
        v136 = v66;
        _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ installing full size render %{public}@ resource because a persisted resource was not found for adjusted asset: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "recipeID") == 65938;

      if (v68)
      {
        v69 = (void *)MEMORY[0x1E0D71A70];
        objc_msgSend(v104, "pathForFullsizeRenderImageFile");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "onDemand_installAdjustedFullSizeRenderResourceAtFilePath:forAsset:", v70, v104);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "recipeID") == 131272;

      if (v93)
      {
        objc_msgSend(MEMORY[0x1E0D71A70], "onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:", v104);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_37:
        v17 = (void *)v22;
        goto LABEL_38;
      }
      objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "recipeID") == 0x20000;

      if (v95)
      {
        v96 = (void *)MEMORY[0x1E0D71A70];
        objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "onDemand_installResourceWithResourceIdentity:forAsset:", v97, v104);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
        if (v17)
          goto LABEL_22;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setState:", 3);
  PLImageManagerGetLog();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    v84 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(*(id *)(a1 + 48), "resourceIdentity");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "recipeID");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v84;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v86;
    _os_log_impl(&dword_1991EC000, v83, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to fetch resource with recipe %u in database, request failed", buf, 0x12u);

  }
  if (!v102)
  {
    v87 = (void *)MEMORY[0x1E0CB35C8];
    v139 = *MEMORY[0x1E0CB2938];
    v88 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v104, "uuid");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "stringWithFormat:", CFSTR("Unable to find resource for asset: %@"), v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v91);
    v102 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = 0;
LABEL_22:
  if (objc_msgSend(*(id *)(a1 + 40), "state") == 1)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0D71A78]);
    objc_msgSend(v23, "setTaskIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
    objc_msgSend(v23, "setNetworkAccessAllowed:", objc_msgSend(*(id *)(a1 + 48), "isNetworkAccessAllowed"));
    objc_msgSend(v23, "setTransient:", objc_msgSend(*(id *)(a1 + 48), "isTransient"));
    objc_msgSend(v23, "setWantsProgress:", objc_msgSend(*(id *)(a1 + 48), "wantsProgress"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v136 = __Block_byref_object_copy__9052;
    v137 = __Block_byref_object_dispose__9053;
    v138 = 0;
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_58;
    v123[3] = &unk_1E35D7730;
    v123[4] = buf;
    objc_msgSend(v23, "setDataHandler:", v123);
    objc_msgSend(v23, "setClientBundleID:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v23, "setDownloadOptions:", *(_QWORD *)(a1 + 64));
    if (objc_msgSend(v17, "localAvailability") == -1)
    {
      objc_msgSend(v104, "deferredProcessingNeeded");
      if ((PLManagedAssetDeferredProcessingNeededRequiresImmediateProcessing() & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 48), "isNetworkAccessAllowed") & 1) == 0)
      {
        PLImageManagerGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
          *(_DWORD *)v131 = 138543362;
          v132 = v25;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_INFO, "[RM] %{public}@ Request for resource that is not locally available but network access is not allowed", v131, 0xCu);
        }

      }
    }
    v100 = objc_msgSend(v17, "version");
    v26 = objc_msgSend(v17, "cplType");
    v27 = objc_msgSend(v17, "orientation");
    objc_msgSend(v17, "uniformTypeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 == 5)
    {
      PLDataStoreForClassIDAndLibraryID();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "thumbnailManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "thumbnailJPEGPathForPhoto:", v104);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PLImageManagerGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v98 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
          objc_msgSend(v104, "uuid");
          v39 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v131 = 138543618;
          v132 = v98;
          v133 = 2114;
          v134 = v39;
          v99 = (void *)v39;
          _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to resolve thumbnail path for asset %{public}@", v131, 0x16u);

        }
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "isTransient") & 1) != 0)
    {
      v40 = 1;
    }
    else
    {
      objc_msgSend(v17, "dataStore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend((id)objc_opt_class(), "storeClassID") == 3;

    }
    objc_msgSend(v17, "dataStore");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_61;
    v110[3] = &unk_1E35D77A8;
    v122 = v40;
    v118 = buf;
    v43 = *(id *)(a1 + 32);
    v44 = *(_QWORD *)(a1 + 40);
    v111 = v43;
    v112 = v44;
    v45 = v17;
    v113 = v45;
    v119 = v26;
    v46 = v33;
    v114 = v46;
    v115 = v104;
    v120 = v100;
    v47 = v29;
    v116 = v47;
    v121 = v27;
    v117 = *(id *)(a1 + 72);
    objc_msgSend(v42, "requestLocalAvailabilityChange:forResource:options:completion:", 1, v45, v23, v110);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    v49 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v49 + 40) == 1)
    {
      objc_initWeak((id *)v131, (id)v49);
      objc_msgSend(v45, "dataStore");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = *(_QWORD *)(a1 + 40);
      v52 = *(void **)(v51 + 32);
      *(_QWORD *)(v51 + 32) = v50;

      if (v48)
      {
        v53 = objc_alloc(MEMORY[0x1E0D71A18]);
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_4;
        v108[3] = &unk_1E35DE530;
        objc_copyWeak(&v109, (id *)v131);
        v54 = objc_msgSend(v53, "initWithSourceProgress:progressHandler:", v48, v108);
        v55 = *(_QWORD *)(a1 + 40);
        v56 = *(void **)(v55 + 24);
        *(_QWORD *)(v55 + 24) = v54;

        objc_destroyWeak(&v109);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 2;
      objc_destroyWeak((id *)v131);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v49 + 16));
      objc_msgSend(v48, "cancel");
    }

    _Block_object_dispose(buf, 8);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "state") != 2)
  {
    v57 = *(void **)(a1 + 40);
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_5;
    v105[3] = &unk_1E35DF368;
    v107 = *(id *)(a1 + 72);
    v106 = v102;
    objc_msgSend(v57, "_safeReply:", v105);

  }
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_51(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v5 = CFSTR("PHMediaMetadataTypeKey");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, void *, _QWORD))(v3 + 16))(v3, 1, 0, v1, v4, 0);

}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_58(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_61(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  _QWORD v65[5];
  id v66;
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  void *v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  id v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v8 = *(_BYTE *)(a1 + 112);
    if (v8)
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0;
  }
  v83 = v8;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__9052;
  v78 = __Block_byref_object_dispose__9053;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__9052;
  v72 = __Block_byref_object_dispose__9053;
  v9 = v6;
  v73 = v9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if (!*((_BYTE *)v81 + 24))
  {
    objc_msgSend((id)v69[5], "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74600]))
    {
      v13 = objc_msgSend((id)v69[5], "code") == 7;

      if (v13)
      {
        objc_msgSend((id)v69[5], "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D74608]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v65[0] = v11;
          v65[1] = 3221225472;
          v65[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_63;
          v65[3] = &unk_1E35DFAF8;
          v16 = *(void **)(a1 + 32);
          v65[4] = *(_QWORD *)(a1 + 40);
          v7 = v15;
          v66 = v7;
          v67 = *(id *)(a1 + 48);
          objc_msgSend(v16, "performTransaction:", v65);
          *((_BYTE *)v81 + 24) = 1;
          v17 = (void *)v69[5];
          v69[5] = 0;

        }
        else
        {
          v7 = 0;
        }
      }
    }
    else
    {

    }
  }
  if (*((_BYTE *)v81 + 24))
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "length");
      *(_DWORD *)buf = 138543874;
      v87 = v19;
      v88 = 2114;
      v89 = v7;
      v90 = 2048;
      v91 = v20;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Resource made available. (fileURL: %{public}@ / transientData len: %lu", buf, 0x20u);
    }

    v21 = *(_QWORD *)(a1 + 96);
    if (v21 == 27 || v21 == 10)
    {
      objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "databaseContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = (void *)objc_msgSend(v29, "newShortLivedLibraryWithName:", objc_msgSend(v30, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 64), "objectID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v11;
      v56[1] = 3221225472;
      v56[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_68;
      v56[3] = &unk_1E35D7758;
      v25 = v31;
      v57 = v25;
      v33 = v32;
      v58 = v33;
      v60 = &v68;
      v61 = &v74;
      v64 = *(_DWORD *)(a1 + 104);
      v59 = v10;
      v62 = &v80;
      v63 = *(_QWORD *)(a1 + 96);
      objc_msgSend(v25, "performBlockAndWait:", v56);

    }
    else if (v21 == 5)
    {
      v22 = *(void **)(a1 + 56);
      if (v22)
      {
        v23 = v22;

        objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("PHImageFileUTIKey"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromExifOrientation());
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("PHImageFileOrientationKey"));
        v7 = v23;
      }
      else
      {
        *((_BYTE *)v81 + 24) = 0;
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v84 = *MEMORY[0x1E0CB2D50];
        v38 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 64), "objectID");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("Cannot determine thumbnail path for asset: %@"), v25);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v69[5];
        v69[5] = v41;

      }
    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), CFSTR("PHImageFileUTIKey"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromExifOrientation());
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("PHImageFileOrientationKey"));
    }
    goto LABEL_33;
  }
  objc_msgSend((id)v69[5], "domain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D11268]))
    v27 = objc_msgSend((id)v69[5], "code") == 80
       || objc_msgSend((id)v69[5], "code") == 81
       || objc_msgSend((id)v69[5], "code") == 82;
  else
    v27 = 0;

  objc_msgSend((id)v69[5], "domain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0D74600]))
    v35 = objc_msgSend((id)v69[5], "code") == 6;
  else
    v35 = 0;

  if (v27 || v35)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsInCloudKey"));
    if (v35)
    {
      PHNetworkAccessAllowedRequiredError();
      v36 = objc_claimAutoreleasedReturnValue();
      v25 = (id)v69[5];
      v69[5] = v36;
LABEL_33:

    }
  }
  v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (!v43)
    v43 = (void *)v75[5];
  v44 = v43;
  v45 = *(void **)(a1 + 40);
  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_71;
  v49[3] = &unk_1E35D7780;
  v46 = v10;
  v50 = v46;
  v53 = *(id *)(a1 + 80);
  v54 = &v80;
  v47 = v7;
  v51 = v47;
  v48 = v44;
  v52 = v48;
  v55 = &v68;
  objc_msgSend(v45, "_safeReply:", v49);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleProgress:", v3);

}

uint64_t __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_63(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "[RM] %@ Repairing inconsistent resource with fileURL: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71A10]), "initWithResourceType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v5, "keyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataStoreKeyData:", v7);

  objc_msgSend(v6, "setLocalAvailability:", 1);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_68(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (v5)
  {
    v6 = *(unsigned int *)(a1 + 88);
    v17 = 0;
    objc_msgSend(v5, "mediaMetadataForResourceVersion:mediaMetadataType:", v6, &v17);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v17;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, CFSTR("PHMediaMetadataTypeKey"));
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No media metadata present for CPL metadata download with cpl type %ld"), *(_QWORD *)(a1 + 80));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_71(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  dispatch_block_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3_72;
  v8[3] = &unk_1E35D7780;
  v9 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v12 = v3;
  v13 = v4;
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v11 = v5;
  v14 = v6;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(v2, v7);

}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3_72(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEBEADC]();
  objc_msgSend(*(id *)(a1 + 32), "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, 0, v2);

}

uint64_t __106__PHServerResourceRequestRunner__assetAndRelatedObjectsFromAssetObjectIDURL_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
