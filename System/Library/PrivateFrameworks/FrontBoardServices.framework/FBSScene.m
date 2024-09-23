@implementation FBSScene

- (id)_createTransitionContext
{
  void *v2;
  void *v3;

  -[FBSSceneDefinition specification](self->_definition, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "transitionContextClass"), "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBSSceneSettings)settings
{
  os_unfair_lock_s *p_lock;
  FBSSceneSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_settings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

- (void)updater:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  FBSSceneSettings *v15;
  id WeakRetained;
  FBSSceneSettings *v17;
  FBSSceneSettings *lock_settings;
  void *v19;
  BKSAnimationFenceHandle *v20;
  BKSAnimationFenceHandle *calloutQueue_animationFence;
  FBSSceneClientAgent *v22;
  uint64_t v23;
  FBSSceneClientAgent *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  FBSSceneClientAgent *v33;
  id v34;
  id v35;
  FBSSceneSettings *v36;
  FBSSceneSettings *v37;
  BKSAnimationFenceHandle *v38;
  FBSSceneSettings *v39;
  FBSSceneSettings *v40;
  id v41;
  _QWORD v42[5];
  FBSSceneSettings *v43;
  FBSSceneSettings *v44;
  id v45;
  id v46;
  FBSSceneClientAgent *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  FBSSceneClientAgent *v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = (uint64_t)a4;
  v12 = (uint64_t)a5;
  v13 = a6;
  v14 = a7;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  os_unfair_lock_lock(&self->_lock);
  v15 = self->_lock_settings;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  if (v11 || !v12)
  {
    if (!v11 || v12)
    {
      if (!(v11 | v12))
      {
        v12 = 0;
        goto LABEL_12;
      }
    }
    else if ((BSEqualObjects() & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      +[FBSSceneSettingsDiff diffFromSettings:toSettings:](FBSSceneSettingsDiff, "diffFromSettings:toSettings:", self->_lock_settings, v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend((id)v12, "settingsByApplyingToMutableCopyOfSettings:", self->_lock_settings);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (FBSSceneSettings *)objc_msgSend((id)v11, "copy");
  lock_settings = self->_lock_settings;
  self->_lock_settings = v17;

LABEL_12:
  v40 = self->_lock_settings;
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v13, "animationFence");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (BKSAnimationFenceHandle *)objc_msgSend(v19, "copy");
  calloutQueue_animationFence = self->_calloutQueue_animationFence;
  self->_calloutQueue_animationFence = v20;

  v22 = self->_callOutQueue_agent;
  v23 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
  v50[3] = &unk_1E38EB450;
  v50[4] = self;
  v24 = v22;
  v51 = v24;
  v25 = WeakRetained;
  v52 = v25;
  v53 = v14;
  v41 = v14;
  objc_msgSend(off_1E38E9DE0, "sentinelWithSignalCount:signalHandler:", 2, v50);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
  {
    FBLogSceneClient();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[FBSScene loggingIdentifier](self, "loggingIdentifier");
      v39 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fbs_singleLineDescriptionOfBSActions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v29;
      v56 = 2114;
      v57 = v30;
      _os_log_impl(&dword_19A6D4000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) in scene-update: %{public}@", buf, 0x16u);

      v23 = MEMORY[0x1E0C809B0];
      v15 = v39;
    }

  }
  v42[0] = v23;
  v42[1] = 3221225472;
  v42[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_159;
  v42[3] = &unk_1E38EB4C8;
  v42[4] = self;
  v43 = v15;
  v44 = v40;
  v45 = (id)v12;
  v46 = v13;
  v47 = v24;
  v48 = v26;
  v49 = v25;
  v31 = v25;
  v32 = v26;
  v33 = v24;
  v34 = v13;
  v35 = (id)v12;
  v36 = v40;
  v37 = v15;
  -[FBSScene _callOutQueue_coalesceClientSettingsUpdates:](self, "_callOutQueue_coalesceClientSettingsUpdates:", v42);
  objc_msgSend(v32, "signal");
  -[BKSAnimationFenceHandle invalidate](self->_calloutQueue_animationFence, "invalidate");
  v38 = self->_calloutQueue_animationFence;
  self->_calloutQueue_animationFence = 0;

}

- (id)_observers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[FBSScene _lock_allComponents](self, "_lock_allComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  if (-[NSMutableArray count](self->_lock_sceneObservers, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_lock_sceneObservers);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (id)_lock_allComponents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](self->_lock_components, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    NSAllMapTableValues(self->_lock_components);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (void)updateClientSettingsWithTransitionBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__FBSScene_updateClientSettingsWithTransitionBlock___block_invoke;
    v6[3] = &unk_1E38EB390;
    v6[4] = self;
    v7 = v4;
    -[FBSScene _updateClientSettings:](self, "_updateClientSettings:", v6);

  }
}

- (FBSSceneClientSettings)clientSettings
{
  os_unfair_lock_s *p_lock;
  FBSSceneClientSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_clientSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __42__FBSScene_updateClientSettingsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __24__FBSScene_attachLayer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addLayer:", *(_QWORD *)(a1 + 32));
}

- (void)_callOutQueue_updateExtensionsFromSettings:(id)a3 toSettings:(id)a4 withDiff:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  FBSComponentScene *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  id v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  FBSSceneObserver *v39;
  void *v40;
  void *v41;
  NSMapTable *lock_components;
  NSMapTable *v43;
  NSMapTable *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  os_unfair_lock_s *p_lock;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSMapTable *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  os_unfair_lock_t lock;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  os_unfair_lock_s *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  FBSScene *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
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
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_callout_coalesceUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extensions should only be updated while coalescing"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:].cold.1();
    objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DCAFCLL);
  }
  if (self->_callOutQueue_mutationLocked)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_callOutQueue_mutationLocked == NO"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:].cold.2();
    objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DCB60);
  }
  v71 = v9;
  v72 = v8;
  v70 = v10;
  if (v8 && !-[FBSSettingsDiff _containsKey:]((uint64_t)v10, CFSTR("FBSSceneExtensions")))
  {
    v75 = 0;
    v15 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v8, "_allSceneExtensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_allSceneExtensions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v112 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          if ((objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
          {
            FBSRealizeSceneExtension(v18);
            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v15, "addObject:", v18);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    if (v20)
    {
      v21 = v20;
      v75 = 0;
      v22 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v108 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
          if ((objc_msgSend(v12, "containsObject:", v24) & 1) == 0)
          {
            v25 = v75;
            if (!v75)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v75 = v25;
            objc_msgSend(v25, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
      }
      while (v21);
    }
    else
    {
      v75 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v15;
  v85 = self;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
  if (v78)
  {
    v76 = *(id *)v104;
    lock = &self->_lock;
    do
    {
      v26 = 0;
      do
      {
        if (*(id *)v104 != v76)
          objc_enumerationMutation(obj);
        v82 = v26;
        v27 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v26);
        FBLogSceneClient();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          -[FBSScene loggingIdentifier](self, "loggingIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v120 = v51;
          v121 = 2112;
          v122 = v27;
          _os_log_debug_impl(&dword_19A6D4000, v28, OS_LOG_TYPE_DEBUG, "[%@] Adding extension: \"%@\", buf, 0x16u);

        }
        v29 = -[FBSComponentScene initWithScene:extension:]([FBSComponentScene alloc], "initWithScene:extension:", self, v27);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v80 = v27;
        objc_msgSend(v27, "clientComponents");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v100;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v100 != v33)
                objc_enumerationMutation(v30);
              v35 = objc_alloc(*(Class *)(*((_QWORD *)&v99 + 1) + 8 * k));
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v36 = objc_msgSend(v35, "initWithScene:", v29);
              else
                v36 = objc_msgSend(v35, "init");
              v37 = (void *)v36;
              if (v36)
              {
                FBLogSceneClient();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  -[FBSScene loggingIdentifier](self, "loggingIdentifier");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", v37);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v120 = v40;
                  v121 = 2112;
                  v122 = v41;
                  _os_log_debug_impl(&dword_19A6D4000, v38, OS_LOG_TYPE_DEBUG, "[%@] Instantiated component: \"%@\", buf, 0x16u);

                  self = v85;
                }

                v39 = -[FBSSceneObserver initWithComponent:]([FBSSceneObserver alloc], "initWithComponent:", v37);
                objc_msgSend(v86, "addObject:", v39);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
          }
          while (v32);
        }

        if (objc_msgSend(v86, "count"))
        {
          os_unfair_lock_lock(lock);
          lock_components = self->_lock_components;
          if (!lock_components)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v43 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
            v44 = self->_lock_components;
            self->_lock_components = v43;

            lock_components = self->_lock_components;
          }
          -[NSMapTable setObject:forKey:](lock_components, "setObject:forKey:", v86, v80);
          os_unfair_lock_unlock(lock);
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v45 = v86;
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v96;
            do
            {
              for (m = 0; m != v47; ++m)
              {
                if (*(_QWORD *)v96 != v48)
                  objc_enumerationMutation(v45);
                objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * m), "component");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v50, "setScene:", v29);

              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
            }
            while (v47);
          }

        }
        v26 = v82 + 1;
      }
      while (v82 + 1 != v78);
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
    }
    while (v78);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v77 = v75;
  v83 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
  if (v83)
  {
    v81 = *(_QWORD *)v92;
    p_lock = &self->_lock;
    v79 = &self->_lock;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v92 != v81)
          objc_enumerationMutation(v77);
        v54 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v53);
        FBLogSceneClient();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          -[FBSScene loggingIdentifier](self, "loggingIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v120 = v67;
          v121 = 2112;
          v122 = v54;
          _os_log_debug_impl(&dword_19A6D4000, v55, OS_LOG_TYPE_DEBUG, "[%@] Removing extension: \"%@\", buf, 0x16u);

          self = v85;
        }
        v84 = v53;

        os_unfair_lock_lock(p_lock);
        -[NSMapTable objectForKey:](self->_lock_components, "objectForKey:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable removeObjectForKey:](self->_lock_components, "removeObjectForKey:", v54);
        if (!-[NSMapTable count](self->_lock_components, "count"))
        {
          v57 = self->_lock_components;
          self->_lock_components = 0;

        }
        os_unfair_lock_unlock(p_lock);
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v58 = v56;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v88;
          do
          {
            for (n = 0; n != v60; ++n)
            {
              if (*(_QWORD *)v88 != v61)
                objc_enumerationMutation(v58);
              objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * n), "component");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "invalidate");
              FBLogSceneClient();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                -[FBSScene loggingIdentifier](v85, "loggingIdentifier");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", v63);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v120 = v65;
                v121 = 2112;
                v122 = v66;
                _os_log_debug_impl(&dword_19A6D4000, v64, OS_LOG_TYPE_DEBUG, "[%@] Invalidated component: \"%@\", buf, 0x16u);

              }
            }
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
          }
          while (v60);
        }

        v53 = v84 + 1;
        self = v85;
        p_lock = v79;
      }
      while (v84 + 1 != v83);
      v83 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
    }
    while (v83);
  }

}

uint64_t __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_applySafeValuesFromUntrustedSettings:", *(_QWORD *)(a1 + 32));
}

- (FBSSceneSpecification)specification
{
  return -[FBSSceneDefinition specification](self->_definition, "specification");
}

- (id)componentForExtension:(Class)a3 ofClass:(Class)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_components, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  os_unfair_lock_unlock(p_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v10);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "component", (_QWORD)v19);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (a4)
        v16 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  BOOL v7;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(v5, "isProxy"))
  {
    objc_msgSend(v5, "forwardingTargetForSelector:", a2);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)FBSScene;
  v7 = -[FBSScene isEqual:](&v9, sel_isEqual_, v5);

  return v7;
}

- (void)updateClientSettingsWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__FBSScene_updateClientSettingsWithBlock___block_invoke;
    v6[3] = &unk_1E38EB368;
    v7 = v4;
    -[FBSScene _updateClientSettings:](self, "_updateClientSettings:", v6);

  }
}

- (NSString)identifier
{
  return -[FBSSceneIdentity identifier](self->_identity, "identifier");
}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isComplete"))
  {
    if (objc_msgSend(v3, "isFailed"))
    {
      FBLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_cold_1(a1, v4);

    }
    v5 = *(_QWORD *)(a1 + 56);
    if (objc_msgSend(v3, "isFailed"))
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
    else
    {
      v6 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

uint64_t __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (FBSSceneDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);
  return (FBSSceneDelegate *)WeakRetained;
}

- (void)detachLayer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__FBSScene_detachLayer___block_invoke;
  v6[3] = &unk_1E38EB340;
  v7 = v4;
  v5 = v4;
  -[FBSScene updateClientSettings:](self, "updateClientSettings:", v6);

}

- (void)attachLayer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__FBSScene_attachLayer___block_invoke;
  v6[3] = &unk_1E38EB340;
  v7 = v4;
  v5 = v4;
  -[FBSScene updateClientSettings:](self, "updateClientSettings:", v6);

}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)updateClientSettings:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[FBSScene clientSettings](self, "clientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_progenitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v9 != v8)
  {
    FBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBSScene updateClientSettings:withTransitionContext:].cold.1(self, v12);

    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke;
    v19[3] = &unk_1E38EB318;
    v20 = v6;
    v6 = (id)objc_msgSend(v8, "copy:", v19);

  }
  if (v7 && !-[FBSSettings _isEmpty](v7, v10))
  {
    -[FBSScene _sendUpdate:](self, "_sendUpdate:", self->_callout_sceneUpdate);
    -[FBSScene _beginUpdate](self, "_beginUpdate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "copy");
    v16 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v15;

    objc_storeStrong((id *)v14 + 5, a4);
    -[FBSScene _updateClientSettings:](self, "_updateClientSettings:", 0);
  }
  else
  {
    +[FBSSceneClientSettingsDiff diffFromSettings:toSettings:](FBSSceneClientSettingsDiff, "diffFromSettings:toSettings:", v8, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke_2;
      v17[3] = &unk_1E38EB340;
      v14 = v13;
      v18 = v14;
      -[FBSScene _updateClientSettings:](self, "_updateClientSettings:", v17);

    }
  }

}

- (void)updateClientSettings:(void *)a1 withTransitionContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] updated client settings were not derived from the scene's previous client settings", (uint8_t *)&v4, 0xCu);

}

- (void)sendActions:(id)a3
{
  -[FBSScene sendActions:toExtension:](self, "sendActions:toExtension:", a3, 0);
}

uint64_t __24__FBSScene_detachLayer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeLayer:", *(_QWORD *)(a1 + 32));
}

void __36__FBSScene_sendActions_toExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assertOnQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__FBSScene_sendActions_toExtension___block_invoke_2;
    v5[3] = &unk_1E38EB3B8;
    v6 = v3;
    objc_msgSend(v4, "performAsync:", v5);

  }
}

- (void)sendActions:(id)a3 toExtension:(Class)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  FBSSceneEvent *v15;
  FBSSceneClientAgent *callOutQueue_agent;
  FBSScene *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  FBSScene *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  objc_class *v29;
  FBSScene *v30;
  uint64_t v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  FBSScene *v44;
  __int16 v45;
  FBSScene *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (!self->_everActivated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send actions until activated"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene sendActions:toExtension:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6FB32CLL);
  }
  objc_opt_class();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only actions of type BSAction can be sent : tried to send %@"), v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSScene sendActions:toExtension:].cold.3();
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6FB220);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[FBSScene updater](self, "updater");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (self->_callout_coalesceUpdates && self->_callout_sceneUpdate)
        -[FBSScene _sendUpdate:](self, "_sendUpdate:");
      if (self->_hasAgent)
      {
        -[FBSScene _createTransitionContext](self, "_createTransitionContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setActions:", v8);
        v15 = objc_alloc_init(FBSSceneEvent);
        -[FBSSceneEvent setTransitionContext:](v15, "setTransitionContext:", v14);
        -[FBSSceneEvent setSource:](v15, "setSource:", 2);
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        callOutQueue_agent = self->_callOutQueue_agent;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __36__FBSScene_sendActions_toExtension___block_invoke;
        v32[3] = &unk_1E38EB3E0;
        v32[4] = self;
        v32[5] = &v33;
        -[FBSSceneClientAgent scene:reviewEvent:withCompletion:](callOutQueue_agent, "scene:reviewEvent:withCompletion:", self, v15, v32);
        if (!*((_BYTE *)v34 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v15, self->_callOutQueue_agent);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = MEMORY[0x1E0C81028];
          v27 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (FBSScene *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v42 = v28;
            v43 = 2114;
            v44 = v30;
            v45 = 2048;
            v46 = self;
            v47 = 2114;
            v48 = CFSTR("FBSScene.m");
            v49 = 1024;
            v50 = 225;
            v51 = 2114;
            v52 = v25;
            _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          v31 = _bs_set_crash_log_message();
          _realizeSettingsExtension_cold_3(v31);
        }
        _Block_object_dispose(&v33, 8);

      }
      objc_msgSend(v8, "fbs_singleLineDescriptionOfBSActions");
      v17 = (FBSScene *)objc_claimAutoreleasedReturnValue();
      FBLogSceneClient();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (v19)
        {
          -[FBSScene identity](self, "identity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(a4);
          v21 = (FBSScene *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v20;
          v43 = 2114;
          v44 = v21;
          v45 = 2114;
          v46 = v17;
          _os_log_impl(&dword_19A6D4000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to \"%{public}@\": %{public}@", buf, 0x20u);

        }
      }
      else if (v19)
      {
        -[FBSScene identity](self, "identity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        v43 = 2114;
        v44 = v17;
        _os_log_impl(&dword_19A6D4000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s): %{public}@", buf, 0x16u);

      }
      objc_msgSend(v13, "scene:didReceiveActions:forExtension:", self, v8, a4);

    }
  }

}

- (FBSScene)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSScene *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSScene *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBSScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSScene.m");
    v17 = 1024;
    v18 = 72;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSScene *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSSceneHostHandle)hostHandle
{
  os_unfair_lock_s *p_lock;
  FBSSceneHostHandle *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_hostHandle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (FBSWorkspaceService)workspaceService
{
  void *v3;
  FBSWorkspaceService *v4;
  void *v5;
  id v6;

  -[FBSScene updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [FBSWorkspaceService alloc];
    -[FBSSceneIdentity internalWorkspaceIdentifier](self->_identity, "internalWorkspaceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FBSWorkspaceService _initWithTarget:identifier:](v4, "_initWithTarget:identifier:", v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return (FBSWorkspaceService *)v6;
}

uint64_t __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableSettings:", a2);
}

void __52__FBSScene_updateClientSettingsWithTransitionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 40), v2);
    v2 = v3;
  }

}

void __36__FBSScene_sendActions_toExtension___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)attachContext:(id)a3
{
  id v4;

  +[FBSCAContextSceneLayer layerWithCAContext:](FBSCAContextSceneLayer, "layerWithCAContext:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSScene attachSceneContext:](self, "attachSceneContext:", v4);

}

- (void)detachContext:(id)a3
{
  id v4;

  +[FBSCAContextSceneLayer layerWithCAContext:](FBSCAContextSceneLayer, "layerWithCAContext:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSScene detachSceneContext:](self, "detachSceneContext:", v4);

}

- (id)snapshotRequest
{
  FBSSceneSnapshotRequest *v3;
  void *v4;
  FBSSceneSnapshotRequest *v5;
  void *v6;

  v3 = [FBSSceneSnapshotRequest alloc];
  -[FBSScene settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBSSceneSnapshotRequest initWithSettings:](v3, "initWithSettings:", v4);

  -[FBSScene identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSnapshotRequest setSceneID:](v5, "setSceneID:", v6);

  -[FBSSceneSnapshotRequest setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (BOOL)performSnapshotWithContext:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FBSScene snapshotRequest](self, "snapshotRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "performSnapshotWithContext:", v4);

  return v6;
}

- (BOOL)invalidateSnapshotWithContext:(id)a3
{
  void *v4;

  +[FBSSceneSnapshotRequestHandle handleForRequestType:context:](FBSSceneSnapshotRequestHandle, "handleForRequestType:context:", 2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performRequestForScene:", self);

  return 1;
}

- (void)addObserver:(id)a3
{
  -[FBSScene addObserver:withConfiguration:](self, "addObserver:withConfiguration:", a3, 0);
}

- (void)addObserver:(id)a3 withConfiguration:(id)a4
{
  void (**v6)(id, FBSSceneObserver *);
  FBSSceneObserver *v7;
  NSMutableArray *lock_sceneObservers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, FBSSceneObserver *))a4;
  if (v12)
  {
    v7 = -[FBSSceneObserver initWithObserver:]([FBSSceneObserver alloc], "initWithObserver:", v12);
    if (v6)
      v6[2](v6, v7);
    os_unfair_lock_lock(&self->_lock);
    lock_sceneObservers = self->_lock_sceneObservers;
    if (!lock_sceneObservers)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_lock_sceneObservers;
      self->_lock_sceneObservers = v9;

      lock_sceneObservers = self->_lock_sceneObservers;
    }
    -[NSMutableArray addObject:](lock_sceneObservers, "addObject:", v7);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene addObserver:withConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSMutableArray *lock_sceneObservers;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)-[NSMutableArray copy](self->_lock_sceneObservers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "observer");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = v12 == a3;
        else
          v14 = 1;
        if (v14)
        {
          -[NSMutableArray removeObject:](self->_lock_sceneObservers, "removeObject:", v11);
          objc_msgSend(v11, "invalidate");
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (!-[NSMutableArray count](self->_lock_sceneObservers, "count"))
  {
    lock_sceneObservers = self->_lock_sceneObservers;
    self->_lock_sceneObservers = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)display
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSScene settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fbsDisplay
{
  void *v2;
  void *v3;

  -[FBSScene settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)layers
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSScene clientSettings](self, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_beginUpdate
{
  FBSSceneUpdate *v3;
  FBSSceneUpdate *callout_sceneUpdate;
  id *v5;
  uint64_t v6;
  id v7;
  id result;
  void *v9;

  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (self->_callout_sceneUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot begin a new update while one is ongoing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _beginUpdate].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v3 = (FBSSceneUpdate *)objc_opt_new();
    callout_sceneUpdate = self->_callout_sceneUpdate;
    self->_callout_sceneUpdate = v3;

    v5 = v3;
    -[FBSScene clientSettings](self, "clientSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5[1];
    v5[1] = (id)v6;

    objc_storeStrong(v5 + 3, v5[1]);
    return v5;
  }
  return result;
}

- (void)_updateClientSettings:(id)a3
{
  void (**v4)(id, FBSMutableSettings *, FBSSceneTransitionContext *);
  FBSSceneUpdate *v5;
  uint64_t v6;
  FBSMutableSettings *mutableSettings;
  FBSSceneTransitionContext *context;
  uint64_t v9;
  FBSSceneTransitionContext *v10;
  FBSSceneClientSettings *v11;
  FBSSceneClientSettings *lock_clientSettings;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, FBSMutableSettings *, FBSSceneTransitionContext *))a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (self->_callOutQueue_mutationLocked)
  {
    self->_callOutQueue_mutationLocked = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mutation locked"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _updateClientSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7058E4);
  }
  v5 = self->_callout_sceneUpdate;
  if (!v5)
  {
    -[FBSScene _beginUpdate](self, "_beginUpdate");
    v5 = (FBSSceneUpdate *)objc_claimAutoreleasedReturnValue();
  }
  if (v4)
  {
    if (!v5->_mutableSettings)
    {
      v6 = -[FBSSettings mutableCopy](v5->_settings, "mutableCopy");
      mutableSettings = v5->_mutableSettings;
      v5->_mutableSettings = (FBSMutableSettings *)v6;

    }
    context = v5->_context;
    if (!context)
    {
      -[FBSScene _createTransitionContext](self, "_createTransitionContext");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v5->_context;
      v5->_context = (FBSSceneTransitionContext *)v9;

      context = v5->_context;
    }
    v4[2](v4, v5->_mutableSettings, context);
    if (!-[FBSSettings isEqual:](v5->_settings, "isEqual:", v5->_mutableSettings))
    {
      os_unfair_lock_lock(&self->_lock);
      v11 = (FBSSceneClientSettings *)-[FBSMutableSettings _copyClearingProgenitor:](v5->_mutableSettings, "_copyClearingProgenitor:", 0);
      lock_clientSettings = self->_lock_clientSettings;
      self->_lock_clientSettings = v11;

      objc_storeStrong((id *)&v5->_settings, v11);
      os_unfair_lock_unlock(&self->_lock);
    }
    -[FBSSceneTransitionContext animationSettings](v5->_context, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "duration");
      if (BSFloatIsZero())
      {
        if ((objc_msgSend(v14, "isSpringAnimation") & 1) == 0)
        {
          FBLogSceneClient();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[FBSScene loggingIdentifier](self, "loggingIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543362;
            v21 = v16;
            _os_log_impl(&dword_19A6D4000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client settings update contains non-nil but zero-duration animation settings (rdar://125278944)", (uint8_t *)&v20, 0xCu);

          }
        }
      }
    }

  }
  if (!self->_callout_coalesceUpdates
    || (-[FBSSceneDefinition specification](self->_definition, "specification"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "_isSignificantTransitionContext:", v5->_context),
        v17,
        v18))
  {
    -[FBSScene _sendUpdate:](self, "_sendUpdate:", v5);
  }

}

- (void)_sendUpdate:(id)a3
{
  FBSSceneUpdate *v4;
  id *p_isa;
  FBSSceneClientSettings *v6;
  id v7;
  FBSSceneUpdater *lock_updater;
  FBSSceneUpdater *v9;
  FBSSceneClientSettings *v10;
  FBSSceneClientSettings *lock_clientSettings;
  FBSSceneClientSettings *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  FBSSceneEvent *v23;
  FBSSceneClientAgent *callOutQueue_agent;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  FBSSceneUpdate *callout_sceneUpdate;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  FBSSceneClientSettings *v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  FBSScene *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = (FBSSceneUpdate *)a3;
  if (self->_callout_sceneUpdate != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid scene update"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _sendUpdate:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A705D8CLL);
  }
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
    v6 = (FBSSceneClientSettings *)p_isa[1];
    v39 = (FBSSceneClientSettings *)p_isa[3];
    v7 = p_isa[5];
    os_unfair_lock_lock(&self->_lock);
    if (self->_everActivated)
      lock_updater = self->_lock_updater;
    else
      lock_updater = 0;
    v9 = lock_updater;
    if (v39 != v6)
    {
      v10 = -[FBSSettings _copyClearingProgenitor:](v6, "_copyClearingProgenitor:", 0);
      lock_clientSettings = self->_lock_clientSettings;
      self->_lock_clientSettings = v10;

      v12 = v10;
      objc_storeStrong(p_isa + 1, v10);
      v6 = v12;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      +[FBSSceneClientSettingsDiff diffFromSettings:toSettings:](FBSSceneClientSettingsDiff, "diffFromSettings:toSettings:", v39, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        || (-[FBSSceneDefinition specification](self->_definition, "specification"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "_isSignificantTransitionContext:", v7),
            v14,
            v15))
      {
        self->_callOutQueue_mutationLocked = 1;
        objc_storeStrong(p_isa + 4, v13);
        if (!v7)
        {
          -[FBSScene _createTransitionContext](self, "_createTransitionContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = p_isa[5];
          p_isa[5] = v16;

          v7 = v16;
        }
        if (self->_calloutQueue_animationFence && objc_msgSend(v13, "containsProperty:", sel_layers))
        {
          v18 = (void *)-[BKSAnimationFenceHandle copy](self->_calloutQueue_animationFence, "copy");
          objc_msgSend(v7, "setAnimationFence:", v18);

        }
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        -[FBSScene _observers](self, "_observers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v46 != v21)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "scene:didUpdateClientSettings:", self, p_isa);
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
          }
          while (v20);
        }

        if (self->_hasAgent)
        {
          v23 = objc_alloc_init(FBSSceneEvent);
          -[FBSSceneEvent setClientSettingsDiff:](v23, "setClientSettingsDiff:", v13);
          -[FBSSceneEvent setTransitionContext:](v23, "setTransitionContext:", v7);
          -[FBSSceneEvent setSource:](v23, "setSource:", 2);
          v41 = 0;
          v42 = &v41;
          v43 = 0x2020000000;
          v44 = 0;
          callOutQueue_agent = self->_callOutQueue_agent;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __24__FBSScene__sendUpdate___block_invoke;
          v40[3] = &unk_1E38EB3E0;
          v40[4] = self;
          v40[5] = &v41;
          -[FBSSceneClientAgent scene:reviewEvent:withCompletion:](callOutQueue_agent, "scene:reviewEvent:withCompletion:", self, v23, v40);
          if (!*((_BYTE *)v42 + 24))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v23, self->_callOutQueue_agent);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = MEMORY[0x1E0C81028];
            v33 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v34 = (id)objc_claimAutoreleasedReturnValue();
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v50 = v34;
              v51 = 2114;
              v52 = v36;
              v53 = 2048;
              v54 = self;
              v55 = 2114;
              v56 = CFSTR("FBSScene.m");
              v57 = 1024;
              v58 = 487;
              v59 = 2114;
              v60 = v31;
              _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
            v37 = _bs_set_crash_log_message();
            _realizeSettingsExtension_cold_3(v37);
          }
          _Block_object_dispose(&v41, 8);

        }
        self->_callOutQueue_mutationLocked = 0;
        objc_msgSend(v7, "actions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count"))
        {
          objc_msgSend(v25, "fbs_singleLineDescriptionOfBSActions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          FBLogSceneClient();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            -[FBSScene identity](self, "identity");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v28;
            v51 = 2114;
            v52 = v26;
            _os_log_impl(&dword_19A6D4000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) in update: %{public}@", buf, 0x16u);

          }
        }
        -[FBSSceneUpdater scene:didUpdateClientSettings:withDiff:transitionContext:](v9, "scene:didUpdateClientSettings:withDiff:transitionContext:", self, v6, v13, v7);

      }
    }
    callout_sceneUpdate = self->_callout_sceneUpdate;
    self->_callout_sceneUpdate = 0;

  }
}

void __24__FBSScene__sendUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assertOnQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__FBSScene__sendUpdate___block_invoke_2;
    v5[3] = &unk_1E38EB3B8;
    v6 = v3;
    objc_msgSend(v4, "performAsync:", v5);

  }
}

void __24__FBSScene__sendUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)loggingIdentifier
{
  return -[FBSSceneIdentity description](self->_identity, "description");
}

+ (id)pseudoSceneWithIdentifier:(id)a3 specification:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  FBSScene *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSScene pseudoSceneWithIdentifier:specification:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706174);
  }
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("specification"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSScene pseudoSceneWithIdentifier:specification:].cold.2();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PseudoScene:%@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [FBSScene alloc];
  +[FBSPseudoSceneUpdater sharedInstance](FBSPseudoSceneUpdater, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneIdentityToken pseudoTokenWithIdentifier:](FBSSceneIdentityToken, "pseudoTokenWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneParameters parametersForSpecification:](FBSSceneParameters, "parametersForSpecification:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneHostHandle localHandle](FBSSceneHostHandle, "localHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:](v9, "_initWithUpdater:identityToken:identity:parameters:hostHandle:", v10, v11, v12, v13, v14);

  return v15;
}

- (void)updateSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, void *);

  v10 = (void (**)(id, void *, void *))a3;
  -[FBSScene updater](self, "updater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSPseudoSceneUpdater sharedInstance](FBSPseudoSceneUpdater, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[FBSScene settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    -[FBSScene _createTransitionContext](self, "_createTransitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v7, v8);
    -[FBSScene updater:didUpdateSettings:withDiff:transitionContext:completion:](self, "updater:didUpdateSettings:withDiff:transitionContext:completion:", v4, v7, 0, v8, &__block_literal_global_1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("it is not appropriate to call -updateSettings: on this scene"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene updateSettings:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidate
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BSAuditToken)hostAuditToken
{
  void *v2;
  void *v3;

  -[FBSScene hostHandle](self, "hostHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAuditToken *)v3;
}

- (FBSSceneUpdater)updater
{
  os_unfair_lock_s *p_lock;
  FBSSceneUpdater *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_updater;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_initWithUpdater:(id)a3 identityToken:(id)a4 identity:(id)a5 parameters:(id)a6 hostHandle:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  FBSScene *v30;
  FBSScene *v31;
  uint64_t v32;
  FBSSceneIdentityToken *identityToken;
  uint64_t v34;
  FBSSceneIdentity *identity;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  FBSSceneDefinition *definition;
  objc_class *v44;
  objc_class *v45;
  FBSSceneClientAgent *v46;
  FBSSceneClientAgent *callOutQueue_agent;
  NSMutableArray *v48;
  NSMutableArray *callOutQueue_agentSessions;
  NSObject *v50;
  FBSSceneIdentity *v51;
  FBSSceneClientAgent *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  FBSSceneSettings *lock_settings;
  void *v59;
  uint64_t v60;
  FBSSceneClientSettings *lock_clientSettings;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id obj;
  void *v75;
  void *v76;
  void *v77;
  objc_super v78;
  uint8_t buf[4];
  FBSSceneIdentity *v80;
  __int16 v81;
  FBSSceneClientAgent *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v13;
  v18 = v16;
  v19 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("updater"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706974);
  }
  v20 = v19;
  obj = a3;
  objc_msgSend(v13, "callOutQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  NSClassFromString(CFSTR("FBSSerialQueue"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.2();
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7069D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSerialQueueClass]"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.2();
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706A3CLL);
  }
  v76 = v22;

  v23 = v14;
  NSClassFromString(CFSTR("FBSSceneIdentityToken"));
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.3();
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706AA0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityTokenClass]"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.3();
    objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706B04);
  }
  v75 = v20;

  v24 = v15;
  NSClassFromString(CFSTR("FBSSceneIdentity"));
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.4();
    objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706B68);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.4();
    objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706BCCLL);
  }
  v77 = v18;

  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = BSEqualObjects();

  if ((v27 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects([identity identifier], [identityToken identifier])"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.9();
    objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706C30);
  }
  v28 = v77;
  objc_msgSend(v77, "specification");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.5();
    objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706C94);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.5();
    objc_msgSend(objc_retainAutorelease(v72), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A706CF8);
  }

  v78.receiver = self;
  v78.super_class = (Class)FBSScene;
  v30 = -[FBSScene init](&v78, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_callOutQueue, v21);
    v73 = v23;
    v32 = objc_msgSend(v23, "copy");
    identityToken = v31->_identityToken;
    v31->_identityToken = (FBSSceneIdentityToken *)v32;

    v34 = objc_msgSend(v24, "copy");
    identity = v31->_identity;
    v31->_identity = (FBSSceneIdentity *)v34;

    +[FBSSceneDefinition definition](FBSMutableSceneDefinition, "definition");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setIdentity:", v31->_identity);
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v37 = a7;
    v38 = v17;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "identity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSSceneClientIdentity identityForProcessIdentity:](FBSSceneClientIdentity, "identityForProcessIdentity:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setClientIdentity:", v41);

    v17 = v38;
    objc_msgSend(v36, "setSpecification:", v29);
    v42 = objc_msgSend(v36, "copy");
    definition = v31->_definition;
    v31->_definition = (FBSSceneDefinition *)v42;

    if (objc_msgSend(v38, "canHaveAgent"))
    {
      v44 = (objc_class *)objc_msgSend(v29, "clientAgentClass");
      if (v44)
      {
        v45 = v44;
        if (-[objc_class conformsToProtocol:](v44, "conformsToProtocol:", &unk_1EE3BB408))
        {
          v31->_hasAgent = 1;
          v46 = (FBSSceneClientAgent *)objc_alloc_init(v45);
          callOutQueue_agent = v31->_callOutQueue_agent;
          v31->_callOutQueue_agent = v46;

          v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          callOutQueue_agentSessions = v31->_callOutQueue_agentSessions;
          v31->_callOutQueue_agentSessions = v48;

          FBLogCommon();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v51 = v31->_identity;
            v52 = v31->_callOutQueue_agent;
            *(_DWORD *)buf = 138543618;
            v80 = v51;
            v81 = 2114;
            v82 = v52;
            _os_log_impl(&dword_19A6D4000, v50, OS_LOG_TYPE_INFO, "[FBSScene] [%{public}@] Created client agent: %{public}@", buf, 0x16u);
          }

          if (!v31->_callOutQueue_agent)
          {
            v53 = (void *)MEMORY[0x1E0CB3940];
            NSStringFromClass(v45);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringWithFormat:", CFSTR("agent class %@ failed to allocate"), v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.6();
            objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A706818);
          }
        }
        else
        {
          FBLogCommon();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.7((uint64_t *)&v31->_identity, v45, v56);

        }
      }
    }
    v31->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v31->_lock_updater, obj);
    v28 = v77;
    objc_msgSend(v77, "settings");
    v57 = objc_claimAutoreleasedReturnValue();
    lock_settings = v31->_lock_settings;
    v31->_lock_settings = (FBSSceneSettings *)v57;

    objc_msgSend(v77, "clientSettings");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "_copyClearingProgenitor:", 0);
    lock_clientSettings = v31->_lock_clientSettings;
    v31->_lock_clientSettings = (FBSSceneClientSettings *)v60;

    objc_storeStrong((id *)&v31->_lock_hostHandle, v37);
    v23 = v73;
  }

  return v31;
}

- (void)_configureParameters:(id)a3
{
  void *v4;
  void *v5;
  FBSSceneSettings *v6;
  FBSSceneSettings *lock_settings;
  void *v8;
  FBSSceneClientSettings *v9;
  FBSSceneClientSettings *lock_clientSettings;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (self->_everActivated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot update parameters after activation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _configureParameters:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    -[FBSScene parameters](self, "parameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v4);
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (FBSSceneSettings *)objc_msgSend(v5, "copy");
    lock_settings = self->_lock_settings;
    self->_lock_settings = v6;

    objc_msgSend(v4, "clientSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (FBSSceneClientSettings *)objc_msgSend(v8, "_copyClearingProgenitor:", 0);
    lock_clientSettings = self->_lock_clientSettings;
    self->_lock_clientSettings = v9;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_callOutQueue_invalidate
{
  void *v3;
  FBSSceneUpdater *lock_updater;
  NSMutableArray *lock_sceneObservers;
  NSMapTable *lock_components;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *callOutQueue_agentSessions;
  id callOutQueue_agentMessageHandler;
  FBSSceneClientAgent *callOutQueue_agent;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[FBSScene _observers](self, "_observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lock_delegate, 0);
  lock_updater = self->_lock_updater;
  self->_lock_updater = 0;

  lock_sceneObservers = self->_lock_sceneObservers;
  self->_lock_sceneObservers = 0;

  lock_components = self->_lock_components;
  self->_lock_components = 0;

  os_unfair_lock_unlock(&self->_lock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11++), "invalidate");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_callOutQueue_agentSessions;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16++), "invalidate", (_QWORD)v20);
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  callOutQueue_agentSessions = self->_callOutQueue_agentSessions;
  self->_callOutQueue_agentSessions = 0;

  callOutQueue_agentMessageHandler = self->_callOutQueue_agentMessageHandler;
  self->_callOutQueue_agentMessageHandler = 0;

  callOutQueue_agent = self->_callOutQueue_agent;
  self->_callOutQueue_agent = 0;

}

- (void)_callOutQueue_didUpdateHostHandle:(id)a3
{
  id v5;
  void *v6;
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
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_hostHandle, a3);
  os_unfair_lock_unlock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBSScene _observers](self, "_observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "scene:didUpdateHostHandle:", self, v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)_callOutQueue
{
  return self->_callOutQueue;
}

- (void)_callOutQueue_didCreateWithTransitionContext:(id)a3 alternativeCreationCallout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  self->_everActivated = 1;
  -[FBSScene settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneSettingsDiff diffFromSettings:toSettings:](FBSSceneSettingsDiff, "diffFromSettings:toSettings:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    FBLogSceneClient();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[FBSScene loggingIdentifier](self, "loggingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fbs_singleLineDescriptionOfBSActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) in scene-create: %{public}@", buf, 0x16u);

    }
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke;
  v22[3] = &unk_1E38EB428;
  v22[4] = self;
  v23 = v12;
  v24 = v8;
  v25 = v11;
  v26 = v10;
  v27 = v9;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v8;
  v21 = v12;
  -[FBSScene _callOutQueue_coalesceClientSettingsUpdates:](self, "_callOutQueue_coalesceClientSettingsUpdates:", v22);

}

void __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  FBSSceneEvent *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    v3 = objc_alloc_init(FBSSceneEvent);
    -[FBSSceneEvent setSettingsDiff:](v3, "setSettingsDiff:", *(_QWORD *)(a1 + 40));
    -[FBSSceneEvent setTransitionContext:](v3, "setTransitionContext:", *(_QWORD *)(a1 + 48));
    -[FBSSceneEvent setSource:](v3, "setSource:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_configureWithScene:");
    objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:", 0, *(_QWORD *)(a1 + 56), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke_2;
    v18[3] = &unk_1E38EB3B8;
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v5, "scene:didInitializeWithEvent:completion:", v4, v3, v18);

  }
  else
  {
    objc_msgSend(v2, "_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:", 0, *(_QWORD *)(a1 + 56), 0);
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "_lock_allComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (id *)objc_opt_new();
    objc_storeStrong(v8 + 1, *(id *)(a1 + 56));
    objc_storeStrong(v8 + 4, *(id *)(a1 + 40));
    objc_storeStrong(v8 + 5, *(id *)(a1 + 48));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "scene:didUpdateSettings:", *(_QWORD *)(a1 + 32), v8, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v11);
    }

  }
}

uint64_t __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_callOutQueue_willDestroyWithTransitionContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  FBSSceneEvent *v13;
  FBSSceneClientAgent *callOutQueue_agent;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (!v6)
  {
    -[FBSScene _createTransitionContext](self, "_createTransitionContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[FBSScene _observers](self, "_observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sceneWillInvalidate:", self);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  if (self->_callOutQueue_agent)
  {
    v13 = objc_alloc_init(FBSSceneEvent);
    -[FBSSceneEvent setTransitionContext:](v13, "setTransitionContext:", v6);
    -[FBSSceneEvent setSource:](v13, "setSource:", 1);
    callOutQueue_agent = self->_callOutQueue_agent;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__FBSScene__callOutQueue_willDestroyWithTransitionContext_completion___block_invoke;
    v17[3] = &unk_1E38EB3B8;
    v18 = v7;
    -[FBSSceneClientAgent scene:willInvalidateWithEvent:completion:](callOutQueue_agent, "scene:willInvalidateWithEvent:completion:", self, v13, v17);

    v15 = self->_callOutQueue_agent != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __70__FBSScene__callOutQueue_willDestroyWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_callOutQueue_coalesceClientSettingsUpdates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (self->_callout_coalesceUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_callout_coalesceUpdates"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene _callOutQueue_coalesceClientSettingsUpdates:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_callout_coalesceUpdates = 1;
    v6 = v4;
    (*((void (**)(void))v4 + 2))();
    self->_callout_coalesceUpdates = 0;
    -[FBSScene _sendUpdate:](self, "_sendUpdate:", self->_callout_sceneUpdate);

  }
}

- (NSString)description
{
  return (NSString *)-[FBSScene descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identity, 0);
  -[FBSScene updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", v5 != 0, CFSTR("valid"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSScene descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSScene *v11;

  v4 = a3;
  -[FBSScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__FBSScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  os_unfair_lock_unlock(&self->_lock);
  v7 = v6;

  return v7;
}

void __50__FBSScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("settings"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("clientSettings"), 1);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "hostProcess");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("hostProcess"));

}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_159(uint64_t a1)
{
  uint64_t v2;
  FBSSceneEvent *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 115))
  {
    objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 112))
  {
    v3 = objc_alloc_init(FBSSceneEvent);
    -[FBSSceneEvent setSettingsDiff:](v3, "setSettingsDiff:", *(_QWORD *)(a1 + 56));
    -[FBSSceneEvent setTransitionContext:](v3, "setTransitionContext:", *(_QWORD *)(a1 + 64));
    -[FBSSceneEvent setSource:](v3, "setSource:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2;
    v22[3] = &unk_1E38EB478;
    v5 = *(void **)(a1 + 72);
    v23 = *(id *)(a1 + 80);
    objc_msgSend(v5, "scene:handleEvent:withCompletion:", v4, v3, v22);

  }
  else
  {
    v6 = *(void **)(a1 + 88);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 64);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_3;
      v20[3] = &unk_1E38EB4A0;
      v21 = *(id *)(a1 + 80);
      objc_msgSend(v6, "scene:didUpdateWithDiff:transitionContext:completion:", v2, v7, v8, v20);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "signal");
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = (id *)objc_opt_new();
    objc_storeStrong(v10 + 1, *(id *)(a1 + 48));
    objc_storeStrong(v10 + 3, *(id *)(a1 + 40));
    objc_storeStrong(v10 + 4, *(id *)(a1 + 56));
    objc_storeStrong(v10 + 5, *(id *)(a1 + 64));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "scene:didUpdateSettings:", *(_QWORD *)(a1 + 32), v10, (_QWORD)v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

uint64_t __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)updater:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  FBSSceneEvent *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id WeakRetained;
  void *v53;
  objc_class *v54;
  id v55;
  FBSScene *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (a5 && !-[FBSScene conformsToExtension:](self, "conformsToExtension:", a5))
  {
    FBLogSceneClient();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FBSScene updater:didReceiveActions:forExtension:].cold.1(self, a5, v17);
  }
  else
  {
    objc_msgSend(v7, "bs_map:", &__block_literal_global_162);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = objc_claimAutoreleasedReturnValue();

    FBLogSceneClient();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    v54 = a5;
    v51 = v10;
    if (a5)
    {
      if (v12)
      {
        -[FBSScene loggingIdentifier](self, "loggingIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v69 = v13;
        v70 = 2114;
        v71 = (uint64_t)v14;
        v72 = 2114;
        v73 = v10;
        _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) for \"%{public}@\": %{public}@", buf, 0x20u);

        a5 = v54;
      }

      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[NSMapTable objectForKey:](self->_lock_components, "objectForKey:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = 0;
      v53 = 0;
    }
    else
    {
      if (v12)
      {
        -[FBSScene loggingIdentifier](self, "loggingIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v18;
        v70 = 2114;
        v71 = v10;
        _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s): %{public}@", buf, 0x16u);

      }
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
      v53 = (void *)-[NSMutableArray copy](self->_lock_sceneObservers, "copy");
      -[FBSScene _lock_allComponents](self, "_lock_allComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);
    v50 = v7;
    v19 = (void *)objc_msgSend(v7, "mutableCopy");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v16;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    v56 = self;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v63 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          if (a5)
            objc_msgSend(v24, "scene:handlePrivateActions:", self, v19);
          else
            objc_msgSend(v24, "scene:handleActions:", self, v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "count"))
          {
            FBLogCommon();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              -[FBSScene loggingIdentifier](self, "loggingIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "component");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "bs_reduce:block:", &stru_1E38EF720, &__block_literal_global_169);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v69 = v27;
              v70 = 2114;
              v71 = (uint64_t)v29;
              v72 = 2112;
              v73 = (uint64_t)v30;
              _os_log_impl(&dword_19A6D4000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Component %{public}@ handled action(s): %@", buf, 0x20u);

              self = v56;
              a5 = v54;
            }

            objc_msgSend(v19, "minusSet:", v25);
            if (!objc_msgSend(v19, "count"))
            {

              goto LABEL_28;
            }
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_28:

    if (objc_msgSend(v19, "count"))
    {
      if (a5)
      {
        FBLogSceneClient();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          -[FBSScene loggingIdentifier](self, "loggingIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(a5);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bs_map:", &__block_literal_global_173);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v69 = v46;
          v70 = 2114;
          v71 = (uint64_t)v47;
          v72 = 2114;
          v73 = (uint64_t)v48;
          _os_log_error_impl(&dword_19A6D4000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Extension \"%{public}@\" did not handle actions: %{public}@", buf, 0x20u);

        }
      }
      v32 = objc_msgSend(v19, "copy");

      v49 = (void *)v32;
      if (self->_hasAgent)
      {
        -[FBSScene _createTransitionContext](self, "_createTransitionContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setActions:", v32);
        v34 = objc_alloc_init(FBSSceneEvent);
        -[FBSSceneEvent setTransitionContext:](v34, "setTransitionContext:", v33);
        -[FBSSceneEvent setSource:](v34, "setSource:", 1);
        -[FBSSceneClientAgent scene:handleEvent:withCompletion:](self->_callOutQueue_agent, "scene:handleEvent:withCompletion:", self, v34, 0);

      }
      else
      {
        objc_msgSend(WeakRetained, "scene:didReceiveActions:", self, v32);
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v55 = v53;
      v35 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v59;
        while (2)
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v59 != v37)
              objc_enumerationMutation(v55);
            v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            objc_msgSend(v39, "scene:handleActions:", self, v19);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "count"))
            {
              FBLogCommon();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                -[FBSScene loggingIdentifier](self, "loggingIdentifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "observer");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "bs_reduce:block:", &stru_1E38EF720, &__block_literal_global_175);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v69 = v42;
                v70 = 2114;
                v71 = (uint64_t)v44;
                v72 = 2112;
                v73 = (uint64_t)v45;
                _os_log_impl(&dword_19A6D4000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observer %{public}@ handled action(s): %@", buf, 0x20u);

                self = v56;
              }

              objc_msgSend(v19, "minusSet:", v40);
              if (!objc_msgSend(v19, "count"))
              {

                goto LABEL_50;
              }
            }

          }
          v36 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v36)
            continue;
          break;
        }
      }
LABEL_50:

      v7 = v49;
    }
    else
    {
      v7 = v50;
    }

    v17 = v51;
  }

}

NSString *__51__FBSScene_updater_didReceiveActions_forExtension___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

id __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_167(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a2;
  objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(", %@"), v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

uint64_t __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_172(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", a2);
}

id __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_174(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a2;
  objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(", %@"), v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (void)updater:(id)a3 didReceiveMessage:(id)a4 withResponse:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (self->_hasAgent && (v9 = MEMORY[0x19AECA324](self->_callOutQueue_agentMessageHandler)) != 0)
  {
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
    if (v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__FBSScene_updater_didReceiveMessage_withResponse___block_invoke;
      v11[3] = &unk_1E38EB5B0;
      v11[4] = self;
      v12 = v8;
      ((void (**)(_QWORD, id, _QWORD *))v10)[2](v10, v7, v11);

    }
    else
    {
      (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v7, 0);
    }

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __51__FBSScene_updater_didReceiveMessage_withResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "assertOnQueue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (id)parameters
{
  FBSMutableSceneParameters *v3;
  void *v4;
  FBSMutableSceneParameters *v5;

  v3 = [FBSMutableSceneParameters alloc];
  -[FBSScene specification](self, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBSSceneParameters initWithSpecification:](v3, "initWithSpecification:", v4);

  os_unfair_lock_lock(&self->_lock);
  -[FBSMutableSceneParameters setSettings:](v5, "setSettings:", self->_lock_settings);
  -[FBSSceneParameters setClientSettings:](v5, "setClientSettings:", self->_lock_clientSettings);
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (id)counterpartAgent
{
  return 0;
}

- (id)hostProcess
{
  void *v2;
  void *v3;

  -[FBSScene updater](self, "updater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clientProcess
{
  return +[FBSProcess currentProcess](FBSProcess, "currentProcess");
}

- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4
{
  FBSSerialQueue *callOutQueue;
  id v7;
  id v8;
  FBSSceneActivitySession *v9;

  callOutQueue = self->_callOutQueue;
  v7 = a4;
  v8 = a3;
  -[FBSSerialQueue assertOnQueue](callOutQueue, "assertOnQueue");
  v9 = -[FBSSceneActivitySession initWithName:scene:executionPolicy:]([FBSSceneActivitySession alloc], "initWithName:scene:executionPolicy:", v8, self, v7);

  if (v9)
    -[NSMutableArray addObject:](self->_callOutQueue_agentSessions, "addObject:", v9);
  -[FBSSceneActivitySession open](v9, "open");
  return v9;
}

- (void)closeSession:(id)a3
{
  id v4;

  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (v4 && -[NSMutableArray containsObject:](self->_callOutQueue_agentSessions, "containsObject:", v4))
  {
    objc_msgSend(v4, "close");
    objc_msgSend(v4, "invalidate");
    -[NSMutableArray removeObject:](self->_callOutQueue_agentSessions, "removeObject:", v4);
  }

}

- (void)agent:(id)a3 registerMessageHandler:(id)a4
{
  id v6;
  void *v7;
  id callOutQueue_agentMessageHandler;
  void *v9;
  FBSSceneClientAgent *v10;

  v10 = (FBSSceneClientAgent *)a3;
  v6 = a4;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (v10 && self->_callOutQueue_agent == v10)
  {
    if (self->_callOutQueue_agentMessageHandler != v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      callOutQueue_agentMessageHandler = self->_callOutQueue_agentMessageHandler;
      self->_callOutQueue_agentMessageHandler = v7;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("agent && (agent == _callOutQueue_agent)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene agent:registerMessageHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  FBSSceneClientAgent *v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v8 = (FBSSceneClientAgent *)a3;
  v9 = a4;
  v10 = a5;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  if (self->_callOutQueue_agent != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("agent == _callOutQueue_agent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene agent:sendMessage:withResponse:].cold.3();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A708C48);
  }
  v11 = v9;
  NSClassFromString(CFSTR("FBSSceneMessage"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene agent:sendMessage:withResponse:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A708CACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneMessageClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene agent:sendMessage:withResponse:].cold.1();
    goto LABEL_20;
  }

  if (v10)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__FBSScene_agent_sendMessage_withResponse___block_invoke;
    v18[3] = &unk_1E38EB600;
    v18[4] = self;
    v19 = v10;
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AECA324](v18);

  }
  else
  {
    v12 = 0;
  }
  -[FBSScene updater](self, "updater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "scene:sendMessage:withResponse:", self, v11, v12);
  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v15);

  }
}

void __43__FBSScene_agent_sendMessage_withResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__FBSScene_agent_sendMessage_withResponse___block_invoke_2;
  v11[3] = &unk_1E38EB5D8;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "performAsync:", v11);

}

uint64_t __43__FBSScene_agent_sendMessage_withResponse___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)snapshotRequestAllowSnapshot:(id)a3
{
  void *v3;
  BOOL v4;

  -[FBSScene delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "setDelegate:", 0);
  +[FBSSceneSnapshotRequestHandle handleForRequestType:context:](FBSSceneSnapshotRequestHandle, "handleForRequestType:context:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "performRequestForScene:", self);
  return 1;
}

- (BOOL)conformsToExtension:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  -[FBSScene settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[FBSSceneDefinition specification](self->_definition, "specification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FBSGetDefaultExtensions(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", a3);

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "_allSceneExtensions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsObject:", a3);

    }
  }
  else
  {
    v9 = objc_msgSend(v5, "conformsToExtension:", a3);
  }

  return v9;
}

- (BOOL)everActivated
{
  return self->_everActivated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_updater, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_lock_hostHandle, 0);
  objc_storeStrong((id *)&self->_lock_components, 0);
  objc_storeStrong((id *)&self->_lock_sceneObservers, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_clientSettings, 0);
  objc_storeStrong((id *)&self->_lock_settings, 0);
  objc_storeStrong((id *)&self->_callout_sceneUpdate, 0);
  objc_storeStrong((id *)&self->_calloutQueue_animationFence, 0);
  objc_storeStrong(&self->_callOutQueue_agentMessageHandler, 0);
  objc_storeStrong((id *)&self->_callOutQueue_agentSessions, 0);
  objc_storeStrong((id *)&self->_callOutQueue_agent, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[FBSScene _callOutQueue](self, "_callOutQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if (-[FBSScene everActivated](self, "everActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot configure parameters after activation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSScene(FBSWorkspaceService) activateWithCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    -[FBSScene updater](self, "updater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "activateSceneFuture:completion:", self, v4);
    }
    else if (v4)
    {
      -[FBSScene _callOutQueue](self, "_callOutQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__FBSScene_FBSWorkspaceService__activateWithCompletion___block_invoke;
      v10[3] = &unk_1E38EB3B8;
      v11 = v4;
      objc_msgSend(v8, "performAsync:", v10);

    }
  }
}

void __56__FBSScene_FBSWorkspaceService__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("scene cannot be activated because it was already invalidated"), a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v10);

}

- (void)sendActions:(const char *)a1 toExtension:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sendActions:toExtension:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addObserver:withConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_beginUpdate
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_updateClientSettings:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_sendUpdate:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pseudoSceneWithIdentifier:specification:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pseudoSceneWithIdentifier:specification:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updateSettings:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithUpdater:(NSObject *)a3 identityToken:identity:parameters:hostHandle:.cold.7(uint64_t *a1, Class aClass, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  NSStringFromClass(aClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(&dword_19A6D4000, a3, v6, "[%{public}@] Specified client agent class (%{public}@) does not conform to <FBSSceneClientAgent>", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.9()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_configureParameters:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_callOutQueue_coalesceClientSettingsUpdates:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v3;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(&dword_19A6D4000, a2, v6, "[%{public}@] %{public}@ did not call the settings update completion block", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)updater:(void *)a1 didReceiveActions:(objc_class *)a2 forExtension:(NSObject *)a3 .cold.1(void *a1, objc_class *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "loggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(&dword_19A6D4000, a3, v7, "[%{public}@] Ignoring actions destined for unknown extension \"%{public}@\", (uint8_t *)&v8);

  OUTLINED_FUNCTION_8();
}

- (void)agent:registerMessageHandler:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)agent:sendMessage:withResponse:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)agent:sendMessage:withResponse:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
