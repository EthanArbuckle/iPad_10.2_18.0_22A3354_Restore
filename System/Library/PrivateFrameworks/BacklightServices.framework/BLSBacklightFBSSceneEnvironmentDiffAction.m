@implementation BLSBacklightFBSSceneEnvironmentDiffAction

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_diffInspector, 0);
}

void __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((a3 & 0x38) != 0)
  {
    -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, *(void **)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      bls_scenes_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke_cold_1();

      v8 = OS_LOG_TYPE_INFO;
      if ((a3 & 1) != 0)
        goto LABEL_6;
LABEL_11:
      -[BLSBacklightFBSSceneEnvironmentDiffAction completeBLSActionsForUpdatedFBSScene:transitionContext:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v5);
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = OS_LOG_TYPE_DEBUG;
  if ((a3 & 1) == 0)
    goto LABEL_11;
LABEL_6:
  bls_scenes_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = *(void **)(a1 + 56);
    v26 = 134218498;
    v27 = v10;
    v28 = 2114;
    v29 = v6;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1B0C75000, v9, v8, "%p updated with sceneUpdate:%{public}@ environment:%{public}@", (uint8_t *)&v26, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "updater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatedEnvironmentWithDelta:backlightSceneUpdate:", a3, v6);

LABEL_12:
  -[BLSBacklightFBSSceneEnvironmentDiffAction desiredFidelityRequestForUpdatedFBSScene:fromSettings:transitionContext:](*(_QWORD *)(a1 + 32), v12, v13, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    bls_scenes_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 56);
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218498;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1B0C75000, v17, OS_LOG_TYPE_INFO, "%p environment:%{public}@ will perform desiredFidelityRequest:%@", (uint8_t *)&v26, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "updater");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "performDesiredFidelityRequest:", v16);

  }
  -[BLSBacklightFBSSceneEnvironmentDiffAction frameSpecifiersRequestForUpdatedFBSScene:fromSettings:transitionContext:](*(_QWORD *)(a1 + 32), v14, v15, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    bls_scenes_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(void **)(a1 + 56);
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218498;
      v27 = v23;
      v28 = 2114;
      v29 = v24;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1B0C75000, v22, OS_LOG_TYPE_INFO, "%p environment:%{public}@ will perform frameSpecifiersRequest:%@", (uint8_t *)&v26, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "updater");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "performFrameSpecifiersRequest:", v21);

  }
}

- (void)performActionsForUpdatedFBSScene:(id)a3 settingsDiff:(id)a4 fromSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  NSObject *v17;
  BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[BLSBacklightFBSSceneEnvironmentDiffAction environmentDiffInspector](self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "inspectDiff:", v11);
  objc_msgSend(v10, "backlightSceneEnvironment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  bls_scenes_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    BLSBacklightFBSSceneEnvironmentDeltaDescription(v15);
    v23 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0CB3940];
    v35 = (void *)v23;
    objc_msgSend(v16, "visualState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bls_shortLoggingString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ %@"), v31, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "bls_visualState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bls_presentationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bls_shortLoggingString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ %@"), v28, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frameSpecifier");
    *(_DWORD *)buf = 134219522;
    v42 = v16;
    v43 = 2114;
    v44 = v36;
    v45 = 2114;
    v46 = v35;
    v47 = 2114;
    v48 = v11;
    v49 = 2114;
    v50 = v34;
    v51 = 2114;
    v52 = v27;
    v53 = 2114;
    v54 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v54;
    _os_log_debug_impl(&dword_1B0C75000, v17, OS_LOG_TYPE_DEBUG, "%p environment updated:%{public}@\n  delta:%{public}@\n  diff:%{public}@\n  new:%{public}@\n  old:%{public}@\n  new:%{public}@", buf, 0x48u);

  }
  -[BLSBacklightFBSSceneEnvironmentDiffAction delegate](self, "delegate");
  v18 = (BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    v18 = objc_alloc_init(BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke;
  v37[3] = &unk_1E621A770;
  v37[4] = self;
  v38 = v10;
  v39 = v12;
  v40 = v16;
  v19 = v15;
  v20 = v16;
  v21 = v12;
  v22 = v10;
  -[BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate performChangesWithTransitionContext:environmentDelta:performActionsBlock:](v18, "performChangesWithTransitionContext:environmentDelta:performActionsBlock:", v13, v19, v37);

}

- (_QWORD)environmentDiffInspector
{
  _QWORD *v1;
  void *v2;
  BLSBacklightSceneSettingsDiffInspector *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      v3 = objc_alloc_init(BLSBacklightSceneSettingsDiffInspector);
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (id)desiredFidelityRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a4, "actions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = v8;
          goto LABEL_12;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  +[BLSBacklightFBSSceneEnvironmentActionHandler desiredFidelityRequestFromAction:](BLSBacklightFBSSceneEnvironmentActionHandler, "desiredFidelityRequestFromAction:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)frameSpecifiersRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a4, "actions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = v8;
          goto LABEL_12;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  +[BLSBacklightFBSSceneEnvironmentActionHandler frameSpecifiersRequestFromAction:](BLSBacklightFBSSceneEnvironmentActionHandler, "frameSpecifiersRequestFromAction:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BLSBacklightFBSSceneEnvironmentDiffActionDelegate)delegate
{
  return (BLSBacklightFBSSceneEnvironmentDiffActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)completeBLSActionsForUpdatedFBSScene:(void *)a3 transitionContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  BLSBacklightSceneUpdateBacklightRampResponse *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_43;
  objc_msgSend(v6, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_43;
  v32 = a1;
  v33 = v7;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (!v11)
  {
    v13 = 0;
    v34 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = 0;
  v34 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v36 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v14;
        v19 = v13;
        v14 = v17;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v34;
          v19 = v13;
          v34 = v17;
        }
        else
        {
          objc_opt_class();
          v18 = v13;
          v19 = v17;
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
      }
      v20 = v17;

      v13 = v19;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  }
  while (v12);
LABEL_18:

  objc_msgSend(v5, "backlightSceneEnvironment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v23 = objc_msgSend(v14, "canSendResponse");
    bls_scenes_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v40 = v32;
        v41 = 2114;
        v42 = v22;
        v43 = 2114;
        v44 = v14;
        _os_log_debug_impl(&dword_1B0C75000, v25, OS_LOG_TYPE_DEBUG, "%p nothing changed in updateAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendResponse:", v25);
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v40 = v32;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v14;
      _os_log_impl(&dword_1B0C75000, v25, OS_LOG_TYPE_INFO, "%p nothing changed in updateAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }

  }
  v7 = v33;
  if (v34)
  {
    v26 = objc_msgSend(v34, "canSendResponse");
    bls_scenes_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (BLSBacklightSceneUpdateBacklightRampResponse *)v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v40 = v32;
        v41 = 2114;
        v42 = v22;
        v43 = 2114;
        v44 = v34;
        _os_log_debug_impl(&dword_1B0C75000, &v28->super.super, OS_LOG_TYPE_DEBUG, "%p nothing changed in rampAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      v28 = -[BLSBacklightSceneUpdateBacklightRampResponse initWithRampDuration:]([BLSBacklightSceneUpdateBacklightRampResponse alloc], "initWithRampDuration:", 0.0);
      objc_msgSend(v34, "sendResponse:", v28);
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v40 = v32;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v34;
      _os_log_impl(&dword_1B0C75000, &v28->super.super, OS_LOG_TYPE_INFO, "%p nothing changed in rampAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }

  }
  if (v13)
  {
    v29 = objc_msgSend(v13, "canSendResponse");
    bls_scenes_log();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v40 = v32;
        v41 = 2114;
        v42 = v22;
        v43 = 2114;
        v44 = v13;
        _os_log_debug_impl(&dword_1B0C75000, v31, OS_LOG_TYPE_DEBUG, "%p nothing changed in animationCompleteAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendResponse:", v31);
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v40 = v32;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v13;
      _os_log_impl(&dword_1B0C75000, v31, OS_LOG_TYPE_INFO, "%p nothing changed in animationCompleteAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }

  }
LABEL_43:

}

- (NSObject)sceneUpdateForUpdatedFBSScene:(void *)a3 fromSettings:(void *)a4 transitionContext:(void *)a5 environment:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  BLSBacklightSceneUpdateBacklightRampResponse *v33;
  BLSBacklightSceneUpdateBacklightRampResponse *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD *v45;
  id *v46;
  id *v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  int v51;
  _QWORD *v52;
  id v53;
  void *v54;
  BLSBacklightSceneUpdate *v55;
  char v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id *v64;
  id *v65;
  id *v66;
  id *v67;
  id *v68;
  id *v69;
  id *v70;
  BLSBacklightSceneUpdateBacklightRampResponse *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  unint64_t v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint64_t v91;
  _QWORD v92[4];
  id v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  id v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  unint64_t v108;
  __int16 v109;
  unint64_t v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v80 = a5;
  if (!a1)
  {
    v27 = 0;
    goto LABEL_72;
  }
  objc_msgSend(v9, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bls_visualState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    bls_scenes_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v80, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v100 = v80;
      v101 = 2114;
      v102 = v26;
      _os_log_impl(&dword_1B0C75000, v25, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ settings visualState nil", buf, 0x16u);

    }
    v27 = 0;
    goto LABEL_71;
  }
  v75 = v9;
  v76 = v12;
  v77 = v11;
  v78 = v10;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v11, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
  v79 = v13;
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v81 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v96;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v96 != v19)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = v18;
          v23 = v17;
          v18 = v21;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = (void *)v81;
            v23 = v17;
            v81 = (unint64_t)v21;
          }
          else
          {
            objc_opt_class();
            v22 = (void *)v17;
            v23 = (unint64_t)v21;
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
        }
        v24 = v21;

        v17 = v23;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
      if (!v16)
        goto LABEL_21;
    }
  }
  v17 = 0;
  v81 = 0;
  v18 = 0;
LABEL_21:

  v28 = v18;
  v29 = objc_msgSend(v18, "isAnimated");
  v30 = v29;
  v13 = v79;
  if (!v18 && v81 | v17)
  {
    bls_scenes_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v9 = v75;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:].cold.1((uint64_t)v80, v77, v31);

    v32 = (void *)v81;
    if (v81)
    {
      v33 = -[BLSBacklightSceneUpdateBacklightRampResponse initWithRampDuration:]([BLSBacklightSceneUpdateBacklightRampResponse alloc], "initWithRampDuration:", 0.0);
      objc_msgSend((id)v81, "sendResponse:", v33);

    }
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v34 = (BLSBacklightSceneUpdateBacklightRampResponse *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v17;
LABEL_39:
      objc_msgSend(v35, "sendResponse:", v34);
      v39 = 0;
LABEL_69:

      goto LABEL_70;
    }
    goto LABEL_48;
  }
  if (v17)
    v36 = 0;
  else
    v36 = v29;
  v9 = v75;
  if (v36 != 1)
  {
    objc_msgSend(v10, "bls_visualState");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "frameSpecifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setGrantedFidelity:", objc_msgSend(v79, "updateFidelity"));
    objc_msgSend(v18, "event");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v41;
    if (!v41)
    {
      objc_msgSend(v80, "presentationDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        bls_scenes_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:].cold.2();

      }
      v28 = v18;
    }
    v71 = (BLSBacklightSceneUpdateBacklightRampResponse *)v40;
    v44 = MEMORY[0x1E0C809B0];
    if (v28)
    {
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10;
      v92[3] = &unk_1E621A3B8;
      v45 = v92;
      v46 = &v93;
      v93 = v28;
      v47 = (id *)&v94;
      v48 = v80;
      v69 = (id *)&v94;
    }
    else
    {
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12;
      v88[3] = &unk_1E621A7B8;
      v45 = v88;
      v46 = &v89;
      v89 = v80;
      v69 = &v90;
      v90 = v79;
      v47 = (id *)&v91;
      v48 = v74;
    }
    v68 = v47;
    *v47 = v48;
    v72 = (void *)MEMORY[0x1B5E0F100](v45);
    if (v81)
    {
      v85[0] = v44;
      v85[1] = 3221225472;
      v85[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_13;
      v85[3] = &unk_1E621A7E0;
      v49 = v85;
      v65 = &v86;
      v86 = (id)v81;
      v64 = &v87;
      v87 = v80;
    }
    else
    {
      v49 = 0;
    }
    v50 = (void *)MEMORY[0x1B5E0F100](v49);
    if (v17)
      v51 = v30;
    else
      v51 = 0;
    v70 = v46;
    if (v51 == 1)
    {
      objc_msgSend(v80, "setAnimatingVisualState:", 1);
    }
    else if (!v17)
    {
      v52 = 0;
      v53 = v80;
      goto LABEL_60;
    }
    v82[0] = v44;
    v82[1] = 3221225472;
    v82[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15;
    v82[3] = &unk_1E621A3B8;
    v52 = v82;
    v67 = &v83;
    v83 = v80;
    v53 = v80;
    v66 = &v84;
    v84 = (id)v17;
LABEL_60:
    v54 = (void *)MEMORY[0x1B5E0F100](v52);
    v55 = [BLSBacklightSceneUpdate alloc];
    v56 = objc_msgSend(v18, "isTouchTargetable");
    v34 = v71;
    BYTE1(v63) = objc_msgSend(v18, "isUpdateToDateSpecifier");
    LOBYTE(v63) = v56;
    v39 = -[BLSBacklightSceneUpdate initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:](v55, "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", v53, v79, v71, v74, v30, v73, v63, v72, v50, v54);
    bls_scenes_log();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v80, "identifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v100 = v80;
      v101 = 2114;
      v102 = v62;
      v103 = 2112;
      v104 = v39;
      v105 = 2112;
      v106 = v18;
      v107 = 2112;
      v108 = v81;
      v109 = 2112;
      v110 = v17;
      _os_log_debug_impl(&dword_1B0C75000, v57, OS_LOG_TYPE_DEBUG, "%p:%{public}@ created sceneUpdate %@ from actions\n\t%@\n\t%@\n\t%@", buf, 0x3Eu);

    }
    if (v17)
    {

    }
    v13 = v79;
    v28 = v18;
    v32 = (void *)v81;
    if (v81)
    {

    }
    v10 = v78;
    if (!v18)

    goto LABEL_69;
  }
  bls_scenes_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v80, "identifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "debugDescription");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "debugDescription");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v100 = v80;
    v101 = 2114;
    v102 = v59;
    v103 = 2114;
    v104 = v60;
    v105 = 2114;
    v106 = v61;
    _os_log_error_impl(&dword_1B0C75000, v37, OS_LOG_TYPE_ERROR, "%p:%{public}@ scene settings change animated but did not contain animationComplete action, transitionContext:%{public}@ scene:%{public}@", buf, 0x2Au);

  }
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendResponse:", v38);

  }
  v32 = (void *)v81;
  if (v81)
  {
    v34 = -[BLSBacklightSceneUpdateBacklightRampResponse initWithRampDuration:]([BLSBacklightSceneUpdateBacklightRampResponse alloc], "initWithRampDuration:", 0.0);
    v35 = (void *)v81;
    goto LABEL_39;
  }
LABEL_48:
  v39 = 0;
LABEL_70:
  v25 = v39;

  v27 = v25;
  v12 = v76;
  v11 = v77;
LABEL_71:

LABEL_72:
  return v27;
}

uint64_t __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke()
{
  return objc_opt_class();
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10(uint64_t a1)
{
  void **v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "canSendResponse");
  bls_scenes_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10_cold_1();

    v6 = *v2;
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendResponse:", v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 134218498;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send response to updateAction:%{public}@", (uint8_t *)&v10, 0x20u);

  }
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12(uint64_t a1)
{
  NSObject *v2;

  bls_scenes_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12_cold_1(a1, v2);

}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_13(uint64_t a1, double a2)
{
  int v4;
  NSObject *v5;
  BLSBacklightSceneUpdateBacklightRampResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "canSendResponse");
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (BLSBacklightSceneUpdateBacklightRampResponse *)v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 134218754;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2048;
      v19 = a2;
      v20 = 2114;
      v21 = v13;
      _os_log_debug_impl(&dword_1B0C75000, &v6->super.super, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will send duration:%lf response to rampAction:%{public}@", (uint8_t *)&v14, 0x2Au);

    }
    v7 = *(void **)(a1 + 32);
    v6 = -[BLSBacklightSceneUpdateBacklightRampResponse initWithRampDuration:]([BLSBacklightSceneUpdateBacklightRampResponse alloc], "initWithRampDuration:", a2);
    objc_msgSend(v7, "sendResponse:", v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v14 = 134218754;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2048;
    v19 = a2;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1B0C75000, &v6->super.super, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send duration:%lf response to rampAction:%{public}@", (uint8_t *)&v14, 0x2Au);

  }
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15(uint64_t a1)
{
  void **v2;
  void **v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setAnimatingVisualState:", 0);
  v4 = *(void **)(a1 + 40);
  v3 = (void **)(a1 + 40);
  v5 = objc_msgSend(v4, "canSendResponse");
  bls_scenes_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15_cold_1();

    v8 = *v3;
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendResponse:", v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = *v2;
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *v3;
    v12 = 134218498;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B0C75000, v7, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send response to animationCompleteAction:%{public}@", (uint8_t *)&v12, 0x20u);

  }
}

void __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_4_0();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = v1;
  _os_log_debug_impl(&dword_1B0C75000, v0, OS_LOG_TYPE_DEBUG, "FBSSceneDiffAction.performActionsForUpdatedFBSScene: got sceneUpdate from sceneSettings for %@: %@", (uint8_t *)&v4, 0x16u);

}

- (void)sceneUpdateForUpdatedFBSScene:(NSObject *)a3 fromSettings:transitionContext:environment:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = a1;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_ERROR, "%p scene settings change did not contain an update action, but did contain a ramp or animation complete action \nenvironment:%{public}@ \nactions:%{public}@", (uint8_t *)&v7, 0x20u);

  OUTLINED_FUNCTION_0_2();
}

- (void)sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:.cold.2()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  OUTLINED_FUNCTION_4_0();
  v3 = v2;
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alwaysOnSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218754;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1B0C75000, v0, OS_LOG_TYPE_ERROR, "%p:%{public}@ unexpectedly nil frameSpecifier. presentationDate:%{public}@ alwaysOnSession:%{public}@", (uint8_t *)&v7, 0x2Au);

  OUTLINED_FUNCTION_2_0();
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(*(id *)(v0 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_1B0C75000, v2, v3, "%p:%{public}@ will send response to updateAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bls_shortLoggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = 134218754;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  v12 = 2114;
  v13 = v6;
  v14 = 2114;
  v15 = v7;
  _os_log_debug_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_DEBUG, "%p:%{public}@ bare scene update complete visualState:%{public}@ frameSpecifier:%{public}@", (uint8_t *)&v8, 0x2Au);

  OUTLINED_FUNCTION_2_0();
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(*v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_1B0C75000, v2, v3, "%p:%{public}@ will send response to animationCompleteAction:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

@end
