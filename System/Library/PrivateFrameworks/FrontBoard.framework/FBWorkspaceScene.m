@implementation FBWorkspaceScene

- (FBSceneHost)host
{
  return (FBSceneHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)workspace:(void *)a3 sendUpdatedSettings:(void *)a4 withDiff:(void *)a5 transitionContext:(void *)a6 completion:
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  uint32_t v42;
  unsigned int v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  unsigned int v57;
  char v58;
  _QWORD v59[5];
  id v60;
  id v61;
  _QWORD *v62;
  char v63;
  char v64;
  char v65;
  _QWORD v66[6];
  _QWORD v67[5];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  _QWORD v72[5];
  id v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v46 = a3;
  v48 = a4;
  v11 = a5;
  v44 = a6;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 152), "assertOnQueue");
    objc_msgSend(v47, "process");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = arc4random();
    v12 = FBSceneLifecycleStateForSettings(v46);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v13 = objc_msgSend(v46, "copy");
    v14 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v13;

    v15 = +[FBWorkspaceScene _sceneActionForLifecycleFromState:toState:](FBWorkspaceScene, "_sceneActionForLifecycleFromState:toState:", *(unsigned __int8 *)(a1 + 140), v12);
    if ((_DWORD)v15 == 1)
    {
      v15 = 1;
      if ((objc_msgSend(v48, "_isSignifcant") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 24), "specification");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_isSignificantTransitionContext:", v11);

        if (!v17)
          v15 = 0;
      }
    }
    v43 = objc_msgSend(v11, "allowCPUThrottling");
    objc_msgSend(v11, "updateContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isClientLifecycleExternallyManaged");

    objc_msgSend(v11, "_uiApplicationSceneTransitionContextShim");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "execTime");
    objc_msgSend(v45, "setExecTime:");
    v20 = *(unsigned __int8 *)(a1 + 140);
    if (v20 != (_DWORD)v12)
    {
      FBLogProcessScene();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(void **)(a1 + 40);
        FBSceneLifecycleStateDescription(v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v22;
        v76 = 2114;
        v77 = v23;
        _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene lifecycle state did change: %{public}@", buf, 0x16u);

      }
      *(_BYTE *)(a1 + 140) = v12;
    }
    if (*(_BYTE *)(a1 + 143))
    {
      v24 = 0;
    }
    else
    {
      *(_BYTE *)(a1 + 143) = 1;
      v25 = (void *)MEMORY[0x1E0D23148];
      objc_msgSend(*(id *)(a1 + 24), "specification");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "parametersForSpecification:", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setSettings:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v24, "setClientSettings:", *(_QWORD *)(a1 + 72));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x3032000000;
    v72[3] = __Block_byref_object_copy__4;
    v72[4] = __Block_byref_object_dispose__4;
    v73 = 0;
    v27 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 48))
    {
      v28 = MEMORY[0x1E0C809B0];
      v29 = objc_alloc_init(MEMORY[0x1E0D231D8]);
      objc_msgSend(v29, "setSettingsDiff:", v48);
      objc_msgSend(v29, "setTransitionContext:", v11);
      objc_msgSend(v29, "setSource:", 1);
      v68 = 0;
      v69 = &v68;
      v70 = 0x2020000000;
      v71 = 0;
      v30 = *(void **)(a1 + 48);
      if (v24)
      {
        v67[0] = v28;
        v67[1] = 3221225472;
        v67[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke;
        v67[3] = &unk_1E4A11EE8;
        v67[4] = &v68;
        objc_msgSend(v30, "scene:didInitializeWithEvent:completion:", a1, v29, v67);
      }
      else
      {
        v66[0] = v28;
        v66[1] = 3221225472;
        v66[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2;
        v66[3] = &unk_1E4A13308;
        v66[4] = &v68;
        v66[5] = v72;
        objc_msgSend(v30, "scene:reviewEvent:withCompletion:", a1, v29, v66);
      }
      if (!*((_BYTE *)v69 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v29, *(_QWORD *)(a1 + 48));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = MEMORY[0x1E0C81028];
        v37 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_sendUpdatedSettings_withDiff_transitionContext_completion_);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v75 = v38;
          v76 = 2114;
          v77 = v40;
          v78 = 2048;
          v79 = a1;
          v80 = 2114;
          v81 = CFSTR("FBWorkspaceScene.m");
          v82 = 1024;
          v83 = 671;
          v84 = 2114;
          v85 = v35;
          _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
        v41 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v41);
      }
      _Block_object_dispose(&v68, 8);

      v27 = v28;
    }
    objc_msgSend((id)a1, "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", v15, v43, v19);
    if (v20 != (_DWORD)v12)
      -[FBWorkspace _workspaceSceneLifecycleStateChanged:](v47, (void *)a1);
    if (v24)
    {
      FBAnalyticsLogHangTracerEvent(v49, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v59[0] = v27;
    v59[1] = 3221225472;
    v59[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_67;
    v59[3] = &unk_1E4A13330;
    v59[4] = a1;
    v63 = v15;
    v64 = v43;
    v65 = v19;
    v60 = v44;
    v62 = v72;
    v32 = v31;
    v61 = v32;
    v33 = MEMORY[0x1A8590C4C](v59);
    v34 = (void *)v33;
    if ((_DWORD)v15)
    {
      v50[0] = v27;
      v50[1] = 3221225472;
      v50[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2_69;
      v50[3] = &unk_1E4A13380;
      v51 = v49;
      v52 = a1;
      v58 = v15;
      v53 = v11;
      v57 = v42 % 0xFFFF;
      v56 = v34;
      v54 = v24;
      v55 = v48;
      objc_msgSend((id)a1, "_workspaceQueue_sendMessageToClient:", v50);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v33 + 16))(v33, 1, 0);
    }

    _Block_object_dispose(v72, 8);
  }

}

- (void)_workspaceQueue_incrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5
{
  uint64_t v5;

  if (a3)
  {
    ++self->_queue_inFlightUpdateEvents;
    v5 = 120;
    if (a4)
      v5 = 112;
    ++*(Class *)((char *)&self->super.isa + v5);
    if (a3 != 1)
      ++self->_queue_inFlightLifecycleEvents;
    if (a5)
      ++self->_queue_inFlightExternallyManagedEvents;
  }
  -[FBWorkspaceScene _workspaceQueue_updateAssertion](self, "_workspaceQueue_updateAssertion");
}

+ (unsigned)_sceneActionForLifecycleFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4
{
  char v4;
  unsigned int v5;
  int v6;

  if (a3)
  {
    if (a3 == 2)
    {
      if (a4 < 3u)
      {
        v4 = 8 * a4;
        v5 = 66307;
        return v5 >> v4;
      }
    }
    else if (a3 == 1 && a4 < 3u)
    {
      v4 = 8 * a4;
      v5 = 131329;
      return v5 >> v4;
    }
    LOBYTE(v6) = 1;
    return v6;
  }
  LOBYTE(v6) = 2;
  return v6;
}

- (void)_workspaceQueue_updateAssertion
{
  os_unfair_lock_s *p_lock;
  FBSSceneSettings *v4;
  int v5;
  int lock_lifecycleState;
  FBWorkspaceConnection *v7;
  int v8;
  unint64_t queue_inFlightUpdateEvents;
  uint64_t IsForeground;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSString *logProem;
  void *v15;
  const char *v16;
  NSString *v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  BSInvalidatable *v24;
  BSInvalidatable *v25;
  BSInvalidatable *queue_workspaceAssertion;
  int v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    return;
  }
  v4 = self->_lock_settings;
  v5 = -[FBSSceneSettings activityMode](v4, "activityMode");
  lock_lifecycleState = self->_lock_lifecycleState;
  v7 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    if (-[FBSSceneSettings isForeground](v4, "isForeground")
      && (-[FBSSceneSettings prefersProcessTaskSuspensionWhileSceneForeground](v4, "prefersProcessTaskSuspensionWhileSceneForeground") & 1) == 0)
    {
      v8 = 0;
      if (-[FBSSceneSettings isOccluded](v4, "isOccluded"))
        LOBYTE(v5) = -[FBSSceneSettings isIgnoringOcclusions](v4, "isIgnoringOcclusions") - 1;
      else
        LOBYTE(v5) = 0;
      goto LABEL_19;
    }
    LOBYTE(v5) = -3;
  }
  v8 = 0;
  queue_inFlightUpdateEvents = self->_queue_inFlightUpdateEvents;
  if (queue_inFlightUpdateEvents && v5 == 253)
  {
    if (queue_inFlightUpdateEvents == self->_queue_inFlightExternallyManagedEvents)
    {
      v8 = 0;
      LOBYTE(v5) = -3;
    }
    else
    {
      if (self->_queue_inFlightUpdateAllowsThrottling)
      {
        if (self->_queue_inFlightUpdateDisallowsThrottling)
          LOBYTE(v5) = -1;
        else
          LOBYTE(v5) = -2;
      }
      else
      {
        LOBYTE(v5) = -1;
      }
      v8 = 1;
    }
  }
LABEL_19:
  if (lock_lifecycleState == 2)
  {
    IsForeground = 1;
  }
  else if (self->_queue_inFlightLifecycleEvents)
  {
    IsForeground = FBWorkspaceAssertionStateIsForeground(self->_queue_assertionState);
    v8 |= IsForeground;
  }
  else
  {
    IsForeground = 0;
  }
  v11 = (char)v5;
  if (self->_queue_activityMode == v5)
    goto LABEL_32;
  self->_queue_activityMode = v5;
  FBLogProcessScene();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      logProem = self->_logProem;
      NSStringFromFBSSceneActivityMode();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = logProem;
      v29 = 2114;
      v30 = v15;
      v16 = "[%{public}@] Scene activity mode did change: %{public}@ (transient).";
LABEL_30:
      _os_log_impl(&dword_1A359A000, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, 0x16u);

    }
  }
  else if (v13)
  {
    v17 = self->_logProem;
    NSStringFromFBSSceneActivityMode();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v17;
    v29 = 2114;
    v30 = v15;
    v16 = "[%{public}@] Scene activity mode did change: %{public}@.";
    goto LABEL_30;
  }

LABEL_32:
  switch(v11)
  {
    case -3:
      if ((_DWORD)IsForeground)
      {
        v18 = -[FBSSceneSettings jetsamMode](v4, "jetsamMode") == 1;
        v19 = 3;
        v20 = 7;
        goto LABEL_42;
      }
      break;
    case -2:
      if ((_DWORD)IsForeground)
      {
        v18 = -[FBSSceneSettings jetsamMode](v4, "jetsamMode") == 1;
        v19 = 4;
        v20 = 8;
        goto LABEL_42;
      }
      IsForeground = 1;
      break;
    case -1:
      if (!(_DWORD)IsForeground)
        goto LABEL_45;
      v18 = -[FBSSceneSettings jetsamMode](v4, "jetsamMode") == 1;
      v19 = 5;
      v20 = 9;
      goto LABEL_42;
    case 0:
      if ((_DWORD)IsForeground)
      {
        v18 = -[FBSSceneSettings jetsamMode](v4, "jetsamMode") == 1;
        v19 = 6;
        v20 = 10;
LABEL_42:
        if (v18)
          IsForeground = v20;
        else
          IsForeground = v19;
      }
      else
      {
LABEL_45:
        IsForeground = 2;
      }
      break;
    default:
      IsForeground = 0;
      break;
  }
  if (self->_queue_assertionState != (_DWORD)IsForeground)
  {
    self->_queue_assertionState = IsForeground;
    FBLogProcessScene();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_logProem;
      NSStringFromFBWorkspaceAssertionState(IsForeground);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v22;
      v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene assertion state did change: %{public}@.", (uint8_t *)&v27, 0x16u);

    }
    v24 = self->_queue_workspaceAssertion;
    -[FBWorkspaceConnection _workspaceScene:acquireAssertionWithState:]((uint64_t)v7, self, IsForeground);
    v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    queue_workspaceAssertion = self->_queue_workspaceAssertion;
    self->_queue_workspaceAssertion = v25;

    -[BSInvalidatable invalidate](v24, "invalidate");
  }

}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5
{
  unint64_t queue_inFlightUpdateEvents;
  unint64_t *p_queue_inFlightUpdateAllowsThrottling;
  unint64_t queue_inFlightUpdateAllowsThrottling;
  void *v8;
  unint64_t queue_inFlightExternallyManagedEvents;
  void *v10;
  void *v11;

  if (a3)
  {
    queue_inFlightUpdateEvents = self->_queue_inFlightUpdateEvents;
    if (!queue_inFlightUpdateEvents)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, a5, CFSTR("_queue_inFlightUpdateEvents > 0"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:].cold.1();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A359F818);
    }
    self->_queue_inFlightUpdateEvents = queue_inFlightUpdateEvents - 1;
    if (a4)
    {
      p_queue_inFlightUpdateAllowsThrottling = &self->_queue_inFlightUpdateAllowsThrottling;
      queue_inFlightUpdateAllowsThrottling = self->_queue_inFlightUpdateAllowsThrottling;
      if (!queue_inFlightUpdateAllowsThrottling)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_queue_inFlightUpdateAllowsThrottling > 0"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:].cold.2();
        goto LABEL_23;
      }
    }
    else
    {
      p_queue_inFlightUpdateAllowsThrottling = &self->_queue_inFlightUpdateDisallowsThrottling;
      queue_inFlightUpdateAllowsThrottling = self->_queue_inFlightUpdateDisallowsThrottling;
      if (!queue_inFlightUpdateAllowsThrottling)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_queue_inFlightUpdateDisallowsThrottling > 0"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:].cold.4();
        objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A359F87CLL);
      }
    }
    *p_queue_inFlightUpdateAllowsThrottling = queue_inFlightUpdateAllowsThrottling - 1;
    if (a3 >= 2u)
      --self->_queue_inFlightLifecycleEvents;
    if (a5)
    {
      queue_inFlightExternallyManagedEvents = self->_queue_inFlightExternallyManagedEvents;
      if (!queue_inFlightExternallyManagedEvents)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_queue_inFlightExternallyManagedEvents > 0"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:].cold.3();
LABEL_23:
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A359F764);
      }
      self->_queue_inFlightExternallyManagedEvents = queue_inFlightExternallyManagedEvents - 1;
    }
  }
  -[FBWorkspaceScene _workspaceQueue_updateAssertion](self, "_workspaceQueue_updateAssertion");
}

- (void)_workspaceQueue_sendMessageToClient:(id)a3
{
  id v4;
  FBWorkspaceConnection *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__FBWorkspaceScene__workspaceQueue_sendMessageToClient___block_invoke;
    v6[3] = &unk_1E4A132E0;
    v6[4] = self;
    v7 = v4;
    -[FBWorkspaceConnection _workspaceScene:enqueueConnectBlock:]((uint64_t)v5, self, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __56__FBWorkspaceScene__workspaceQueue_sendMessageToClient___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 136);
  v6 = a2;
  os_unfair_lock_lock(v3);
  v4 = *(_QWORD *)(a1 + 32);
  LODWORD(v3) = *(unsigned __int8 *)(v4 + 145);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 136));
  v5 = v6;
  if ((_DWORD)v3)
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

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

- (void)_workspaceQueue_sendSceneUpdateToClient:(id)a3 settingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  int v16;
  FBSSceneIdentity *identity;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD, _QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
    if ((objc_msgSend(v11, "_isSignifcant") & 1) != 0
      || (-[FBSSceneDefinition specification](self->_definition, "specification"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "_isSignificantTransitionContext:", v12),
          v15,
          v16))
    {
      identity = self->_identity;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __102__FBWorkspaceScene__workspaceQueue_sendSceneUpdateToClient_settingsDiff_transitionContext_completion___block_invoke;
      v19[3] = &unk_1E4A12B00;
      v20 = v14;
      objc_msgSend(v10, "sceneID:updateWithSettingsDiff:transitionContext:completion:", identity, v11, v12, v19);

    }
    else
    {
      v14[2](v14, 1, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("client != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceScene _workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __102__FBWorkspaceScene__workspaceQueue_sendSceneUpdateToClient_settingsDiff_transitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v3 = MEMORY[0x1A8590C4C](a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBWorkspaceScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identity, 0);
  os_unfair_lock_lock(&self->_lock);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (void)_workspaceQueue_sendSceneCreateToClient:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSString *logProem;
  FBSSceneIdentity *identity;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("client != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceScene _workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BED04);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__FBWorkspaceScene__workspaceQueue_sendSceneCreateToClient_parameters_transitionContext_completion___block_invoke;
  v20[3] = &unk_1E4A127C8;
  v20[4] = self;
  v14 = v13;
  v21 = v14;
  v15 = (void *)MEMORY[0x1A8590C4C](v20);
  FBLogProcessScene();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    logProem = self->_logProem;
    *(_DWORD *)buf = 138543362;
    v23 = logProem;
    _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending scene create.", buf, 0xCu);
  }

  identity = self->_identity;
  if (self->_reconnect)
    objc_msgSend(v10, "reconnectSceneWithIdentity:parameters:transitionContext:completion:", identity, v11, v12, v15);
  else
    objc_msgSend(v10, "createSceneWithIdentity:parameters:transitionContext:completion:", identity, v11, v12, v15);

}

void __100__FBWorkspaceScene__workspaceQueue_sendSceneCreateToClient_parameters_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    FBLogProcessScene();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pretending scene creation was successful, even though we got no response (<rdar://problem/62751231>). This does *not* mean there is a problem in FrontBoard, only that we are working around a bug in UIKit.", buf, 0xCu);
    }

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 136));
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 136));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

- (FBWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7
{
  id **v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  FBWorkspaceScene *v19;
  FBWorkspaceScene *v20;
  uint64_t v21;
  FBSSerialQueue *workspaceQueue;
  uint64_t v23;
  FBSSceneDefinition *definition;
  uint64_t v25;
  FBSSceneIdentity *identity;
  NSMutableArray *v27;
  NSMutableArray *lock_sceneCreatedBlocks;
  char v29;
  uint64_t v30;
  FBSSceneSettings *lock_settings;
  uint64_t v32;
  FBSSceneClientSettings *lock_clientSettings;
  uint64_t v34;
  NSString *logProem;
  void *v36;
  objc_class *v37;
  FBSSceneHostAgent *v38;
  FBSSceneHostAgent *hostAgent;
  NSMutableArray *v40;
  NSMutableArray *agentSessions;
  NSObject *v42;
  NSString *v43;
  void *v45;
  void *v46;
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  id **v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = (id **)a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceScene initWithConnection:host:settings:clientSettings:fromRemnant:].cold.1();
    objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35DD54CLL);
  }
  v17 = v16;
  objc_msgSend(v14, "definition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[definition isValid]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceScene initWithConnection:host:settings:clientSettings:fromRemnant:].cold.2();
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35DD5B0);
  }
  v19 = -[FBWorkspaceScene init](self, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_host, v14);
    v20->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_lock_connection, a3);
    v20->_usesOutgoingConnection = -[FBWorkspaceConnection isOutgoing]((_BOOL8)v13);
    -[FBWorkspaceConnection queue](v13);
    v21 = objc_claimAutoreleasedReturnValue();
    workspaceQueue = v20->_workspaceQueue;
    v20->_workspaceQueue = (FBSSerialQueue *)v21;

    v23 = objc_msgSend(v18, "copy");
    definition = v20->_definition;
    v20->_definition = (FBSSceneDefinition *)v23;

    objc_msgSend(v18, "identity");
    v25 = objc_claimAutoreleasedReturnValue();
    identity = v20->_identity;
    v20->_identity = (FBSSceneIdentity *)v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_sceneCreatedBlocks = v20->_lock_sceneCreatedBlocks;
    v20->_lock_sceneCreatedBlocks = v27;

    if (a7)
      v29 = 1;
    else
      v29 = objc_msgSend(v15, "isClientFuture");
    v20->_reconnect = v29;
    v30 = objc_msgSend(v15, "copy");
    lock_settings = v20->_lock_settings;
    v20->_lock_settings = (FBSSceneSettings *)v30;

    v32 = objc_msgSend(v17, "copy");
    lock_clientSettings = v20->_lock_clientSettings;
    v20->_lock_clientSettings = (FBSSceneClientSettings *)v32;

    v20->_queue_activityMode = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p:%@"), v20, v20->_identity);
    v34 = objc_claimAutoreleasedReturnValue();
    logProem = v20->_logProem;
    v20->_logProem = (NSString *)v34;

    objc_msgSend(v18, "specification");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_msgSend(v36, "hostAgentClass");

    if (v37)
    {
      v38 = (FBSSceneHostAgent *)objc_alloc_init(v37);
      hostAgent = v20->_hostAgent;
      v20->_hostAgent = v38;

      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      agentSessions = v20->_agentSessions;
      v20->_agentSessions = v40;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[FBSSceneHostAgent _configureWithScene:](v20->_hostAgent, "_configureWithScene:", v20);
    }
    FBLogProcessScene();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v20->_logProem;
      *(_DWORD *)buf = 138543618;
      v48 = v43;
      v49 = 2048;
      v50 = v13;
      _os_log_impl(&dword_1A359A000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initialized with connection: %p.", buf, 0x16u);
    }

  }
  return v20;
}

- (void)dealloc
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  NSString *logProem;
  FBWorkspaceConnection *lock_connection;
  FBWorkspaceConnection *v7;
  NSMutableArray *v8;
  NSMutableArray *lock_sceneCreatedBlocks;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  FBSSerialQueue *workspaceQueue;
  NSMutableArray *obj;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t v28[128];
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  FBWorkspaceConnection *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    FBLogProcessScene();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      logProem = self->_logProem;
      lock_connection = self->_lock_connection;
      *(_DWORD *)buf = 138543618;
      v30 = logProem;
      v31 = 2048;
      v32 = lock_connection;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated for connection: %p.", buf, 0x16u);
    }

    v7 = self->_lock_connection;
    self->_lock_connection = 0;

    self->_lock_invalidated = 1;
    v8 = self->_lock_sceneCreatedBlocks;
    lock_sceneCreatedBlocks = self->_lock_sceneCreatedBlocks;
    self->_lock_sceneCreatedBlocks = 0;

    os_unfair_lock_unlock(p_lock);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v8;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      v13 = *MEMORY[0x1E0CB2D68];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v26 = v13;
          v27 = CFSTR("scene was invalidated");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspaceScene"), 1, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v18);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v11);
    }

    workspaceQueue = self->_workspaceQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __30__FBWorkspaceScene_invalidate__block_invoke;
    v21[3] = &unk_1E4A12348;
    v21[4] = self;
    -[FBSSerialQueue performAsync:](workspaceQueue, "performAsync:", v21);

  }
}

uint64_t __30__FBWorkspaceScene_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_invalidate");
}

- (void)_enqueueSceneCreateCompletionBlock:(uint64_t)a1
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceScene _enqueueSceneCreateCompletionBlock:].cold.1();
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35DDAE4);
    }
    v5 = (os_unfair_lock_s *)(a1 + 136);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v6 = *(void **)(a1 + 80);
    if (v6)
    {
      v7 = (void *)objc_msgSend(v4, "copy");
      v8 = (void *)MEMORY[0x1A8590C4C]();
      objc_msgSend(v6, "addObject:", v8);

      os_unfair_lock_unlock(v5);
    }
    else
    {
      v9 = *(unsigned __int8 *)(a1 + 145);
      os_unfair_lock_unlock(v5);
      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB2D68];
        v15[0] = CFSTR("scene was invalidated");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspaceScene"), 1, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v12);

      }
      else
      {
        v4[2](v4, 1, 0);
      }
    }
  }

}

- (void)_workspaceQueue_invalidateSceneAgentWithEvent:(id)a3
{
  id v4;
  void *v5;
  FBSSceneHostAgent *hostAgent;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  FBSSceneHostAgent *v13;
  NSMutableArray *agentSessions;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  hostAgent = self->_hostAgent;
  if (hostAgent)
  {
    if (v4)
    {
      -[FBSSceneHostAgent scene:willInvalidateWithEvent:completion:](self->_hostAgent, "scene:willInvalidateWithEvent:completion:", self, v4, &__block_literal_global_12);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D231D8]);
      -[FBSSceneHostAgent scene:willInvalidateWithEvent:completion:](hostAgent, "scene:willInvalidateWithEvent:completion:", self, v7, &__block_literal_global_12);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_agentSessions;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "invalidate", (_QWORD)v15);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = self->_hostAgent;
    self->_hostAgent = 0;

    agentSessions = self->_agentSessions;
    self->_agentSessions = 0;

  }
}

- (void)_workspaceQueue_invalidate
{
  -[FBSSerialQueue assertOnQueue](self->_workspaceQueue, "assertOnQueue");
  -[BSInvalidatable invalidate](self->_queue_workspaceAssertion, "invalidate");
  -[FBWorkspaceScene _workspaceQueue_invalidateSceneAgentWithEvent:](self, "_workspaceQueue_invalidateSceneAgentWithEvent:", 0);
}

- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5
{
  return 0;
}

- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBWorkspaceScene descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBWorkspaceScene *v11;

  v4 = a3;
  -[FBWorkspaceScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__FBWorkspaceScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4A11FD0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __58__FBWorkspaceScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
  {
    objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("agent"));

  }
  else
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("(none)"), CFSTR("agent"));
  }
  v6 = (void *)MEMORY[0x1E0D22FA0];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "succinctDescriptionForObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "appendObject:withName:", v9, CFSTR("clientProcess"));

  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("agentSessions"), 1);
}

- (NSString)debugDescription
{
  return (NSString *)-[FBWorkspaceScene descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)identifier
{
  return (id)-[FBSSceneIdentity identifier](self->_identity, "identifier");
}

- (id)definition
{
  return self->_definition;
}

- (id)parameters
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D23148]);
  -[FBSSceneDefinition specification](self->_definition, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSpecification:", v4);

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v5, "setSettings:", self->_lock_settings);
  objc_msgSend(v5, "setClientSettings:", self->_lock_clientSettings);
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)-[FBSSceneDefinition specification](self->_definition, "specification");
}

- (id)callOutQueue
{
  return self->_workspaceQueue;
}

- (id)counterpartAgent
{
  return 0;
}

- (id)hostProcess
{
  void *v2;
  void *v3;

  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clientProcess
{
  os_unfair_lock_s *p_lock;
  FBWorkspaceConnection *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  -[FBWorkspaceConnection remoteProcess]((id *)&v4->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4
{
  FBSSerialQueue *workspaceQueue;
  id v7;
  id v8;
  void *v9;

  workspaceQueue = self->_workspaceQueue;
  v7 = a4;
  v8 = a3;
  -[FBSSerialQueue assertOnQueue](workspaceQueue, "assertOnQueue");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D231B8]), "initWithName:scene:executionPolicy:", v8, self, v7);

  if (v9)
    -[NSMutableArray addObject:](self->_agentSessions, "addObject:", v9);
  objc_msgSend(v9, "open");
  return v9;
}

- (void)closeSession:(id)a3
{
  id v4;

  v4 = a3;
  -[FBSSerialQueue assertOnQueue](self->_workspaceQueue, "assertOnQueue");
  if (v4 && -[NSMutableArray containsObject:](self->_agentSessions, "containsObject:", v4))
  {
    objc_msgSend(v4, "close");
    objc_msgSend(v4, "invalidate");
    -[NSMutableArray removeObject:](self->_agentSessions, "removeObject:", v4);
  }

}

- (void)agent:(id)a3 registerMessageHandler:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  FBLogProcessScene();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBWorkspaceScene agent:registerMessageHandler:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

}

- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (void (**)(id, _QWORD, void *))a5;
  FBLogProcessScene();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FBWorkspaceScene agent:sendMessage:withResponse:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v14);

  }
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(unsigned __int8 *)(a1 + 66));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v10);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7 = v10;
  if (v6)
  {
    if ((_DWORD)a2)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

    }
    v7 = v10;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);
    v7 = v10;
  }

}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  int v31;
  os_log_type_t v32;
  char v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    if (v4 && (v5 = objc_msgSend(v4, "pid"), v5 != getpid()))
    {
      objc_msgSend(*(id *)(a1 + 40), "_workspaceQueue_createWatchdogForProcess:sceneAction:transitionContext:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v12 = *(_BYTE *)(a1 + 84) == 1 && v6 == 0;
    FBLogProcessScene();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, v12))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      _FBSceneActionToString(*(unsigned __int8 *)(a1 + 84));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_DWORD *)(a1 + 80);
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "_policyDesc");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      *(_DWORD *)buf = 138544386;
      v20 = CFSTR("none");
      v37 = v14;
      if (v18)
        v20 = (const __CFString *)v18;
      v38 = 2114;
      v39 = v15;
      v40 = 1024;
      v41 = v16;
      v42 = 2048;
      v43 = v17;
      v44 = 2114;
      v45 = v20;
      _os_log_impl(&dword_1A359A000, v13, v12, "[%{public}@] Sending scene action [%{public}@][%#04x] to process %p (watchdog: %{public}@)", buf, 0x30u);

    }
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_72;
    v27 = &unk_1E4A13358;
    v32 = v12;
    v28 = *(_QWORD *)(a1 + 40);
    v33 = *(_BYTE *)(a1 + 84);
    v31 = *(_DWORD *)(a1 + 80);
    v9 = v6;
    v29 = v9;
    v30 = *(id *)(a1 + 72);
    v21 = (void *)MEMORY[0x1A8590C4C](&v24);
    v22 = *(_QWORD *)(a1 + 56);
    v23 = *(void **)(a1 + 40);
    if (v22)
      objc_msgSend(v23, "_workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:", v3, v22, *(_QWORD *)(a1 + 48), v21, v24, v25, v26, v27, v28, v29);
    else
      objc_msgSend(v23, "_workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v21, v24, v25, v26, v27, v28, v29);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 72);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D68];
    v35 = CFSTR("Client process exited.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspaceScene"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v10);

  }
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  FBLogProcessScene();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(a1 + 60);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    _FBSceneActionToString(*(unsigned __int8 *)(a1 + 61));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(a1 + 56);
    v12 = 138544130;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    v18 = 1024;
    v19 = a2;
    _os_log_impl(&dword_1A359A000, v6, v7, "[%{public}@] Scene action [%{public}@][%#04x] completed with success: %d", (uint8_t *)&v12, 0x22u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_cancelWatchdogTimer:", *(_QWORD *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void)workspace:(void *)a3 sendInvalidationWithTransitionContext:(void *)a4 completion:
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  char v18;

  v6 = a3;
  v7 = a4;
  if (a1)
  {
    objc_msgSend(a1[19], "assertOnQueue");
    v8 = objc_msgSend(v6, "allowCPUThrottling");
    v9 = v8;
    objc_msgSend(a1, "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 3, v8, 0);
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke;
    v16[3] = &unk_1E4A133A8;
    v16[4] = a1;
    v18 = v9;
    v17 = v7;
    v11 = (void *)MEMORY[0x1A8590C4C](v16);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_2;
    v13[3] = &unk_1E4A133D0;
    v13[4] = a1;
    v14 = v6;
    v15 = v11;
    v12 = v11;
    objc_msgSend(a1, "_workspaceQueue_sendMessageToClient:", v13);

  }
}

void __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 3, *(unsigned __int8 *)(a1 + 48), 0);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    FBLogProcessScene();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending scene destroy.", buf, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 48))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D231D8]);
      objc_msgSend(v7, "setTransitionContext:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v7, "setSource:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_invalidateSceneAgentWithEvent:", v7);

      v6 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(_QWORD *)(v6 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_75;
    v14[3] = &unk_1E4A12B00;
    v9 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v3, "sceneID:destroyWithTransitionContext:completion:", v8, v9, v14);
    v10 = v15;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("Client is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspaceScene"), 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

  }
}

uint64_t __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_75(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)workspace:(void *)a3 sendActions:(uint64_t)a4 toExtension:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 152), "assertOnQueue");
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    if (!a4 && *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 24), "specification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v11, "transitionContextClass"), "transitionContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setActions:", v9);
      v13 = objc_alloc_init(MEMORY[0x1E0D231D8]);
      objc_msgSend(v13, "setTransitionContext:", v12);
      objc_msgSend(v13, "setSource:", 1);
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v14 = *(void **)(a1 + 48);
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke;
      v26[3] = &unk_1E4A133F8;
      v26[4] = a1;
      v26[5] = &v27;
      objc_msgSend(v14, "scene:reviewEvent:withCompletion:", a1, v13, v26);
      if (!*((_BYTE *)v28 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v13, *(_QWORD *)(a1 + 48));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C81028];
        v18 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_sendActions_toExtension_);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v32 = v19;
          v33 = 2114;
          v34 = v21;
          v35 = 2048;
          v36 = a1;
          v37 = 2114;
          v38 = CFSTR("FBWorkspaceScene.m");
          v39 = 1024;
          v40 = 792;
          v41 = 2114;
          v42 = v16;
          _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
        v22 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v22);
      }
      objc_msgSend(v12, "actions");
      v15 = objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v27, 8);
      v9 = (id)v15;
    }
    if (objc_msgSend(v9, "count"))
    {
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_80;
      v23[3] = &unk_1E4A13448;
      v23[4] = a1;
      v24 = v9;
      v25 = a4;
      objc_msgSend((id)a1, "_workspaceQueue_sendMessageToClient:", v23);

    }
  }

}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2;
    v6[3] = &unk_1E4A12168;
    v7 = v3;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "sceneMessageErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 1, 0, 0);
    v4 = (void *)objc_opt_new();
    v5 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2_82;
    v25[3] = &unk_1E4A11FD0;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v26 = v6;
    v27 = v7;
    v8 = (void *)objc_msgSend(v25, "copy");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      NSStringFromClass(*(Class *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_3;
    v23[3] = &unk_1E4A12B00;
    v13 = v8;
    v24 = v13;
    objc_msgSend(v3, "sceneID:sendActions:toExtension:completion:", v10, v9, v12, v23);
    if (v11)

    v14 = BSDispatchTimeWithInterval();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "backingQueueIfExists");
    v15 = objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4;
    v19[3] = &unk_1E4A13420;
    v16 = *(_QWORD *)(a1 + 32);
    v20 = v6;
    v21 = v16;
    v22 = v13;
    v17 = v13;
    v18 = v6;
    dispatch_after(v14, v15, v19);

  }
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2_82(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signal");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 1, 0, 0);
  return result;
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    FBLogProcessScene();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)workspace:(void *)a3 handleUpdatedClientSettings:(void *)a4 transitionContext:(void *)a5 fromConnection:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  NSObject *WeakRetained;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 152), "assertOnQueue");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v13 = *(id *)(a1 + 8);
    if (v13 == v12)
    {
      v17 = (__CFString *)*(id *)(a1 + 72);
      v18 = v17;
      if (v10)
      {
        FBLogProcessScene();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v37 = v20;
          v38 = 2112;
          v39 = v10;
          _os_log_impl(&dword_1A359A000, v19, OS_LOG_TYPE_INFO, "[%{public}@] Client settings updated with diff: %@", buf, 0x16u);
        }

        objc_msgSend(v10, "settingsByApplyingToMutableCopyOfSettings:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (__CFString *)objc_msgSend(v21, "copy");

        objc_storeStrong((id *)(a1 + 72), v14);
      }
      else
      {
        v14 = v17;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      if (*(_QWORD *)(a1 + 48))
      {
        v22 = objc_alloc_init(MEMORY[0x1E0D231D8]);
        objc_msgSend(v22, "setClientSettingsDiff:", v10);
        objc_msgSend(v22, "setTransitionContext:", v11);
        objc_msgSend(v22, "setSource:", 2);
        v32 = 0;
        v33 = &v32;
        v34 = 0x2020000000;
        v35 = 0;
        v23 = *(void **)(a1 + 48);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke;
        v31[3] = &unk_1E4A133F8;
        v31[4] = a1;
        v31[5] = &v32;
        objc_msgSend(v23, "scene:reviewEvent:withCompletion:", a1, v22, v31);
        if (!*((_BYTE *)v33 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v22, *(_QWORD *)(a1 + 48));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_workspace_handleUpdatedClientSettings_transitionContext_fromConnection_);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v37 = v27;
            v38 = 2114;
            v39 = v29;
            v40 = 2048;
            v41 = a1;
            v42 = 2114;
            v43 = CFSTR("FBWorkspaceScene.m");
            v44 = 1024;
            v45 = 855;
            v46 = 2114;
            v47 = v24;
            _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
          v30 = _bs_set_crash_log_message();
          -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v30);
        }
        _Block_object_dispose(&v32, 8);

      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      -[NSObject clientToken:didUpdateClientSettings:withDiff:transitionContext:](WeakRetained, "clientToken:didUpdateClientSettings:withDiff:transitionContext:", a1, v14, v10, v11);
    }
    else
    {
      v14 = (__CFString *)v13;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      FBLogProcessScene();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v37 = v16;
        v38 = 2112;
        v39 = v10;
        v40 = 2112;
        v41 = (uint64_t)v12;
        v42 = 2112;
        v43 = v14;
        _os_log_error_impl(&dword_1A359A000, WeakRetained, OS_LOG_TYPE_ERROR, "[%{public}@] Client settings update aborted due to connection mismatch : diff=%@ connection=%@ expected=%@", buf, 0x2Au);
      }
    }

  }
}

void __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke_2;
    v6[3] = &unk_1E4A12168;
    v7 = v3;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

uint64_t __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)workspace:(void *)a3 handleActions:(uint64_t)a4 forExtension:(void *)a5 fromConnection:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  _BYTE v38[28];
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 152), "assertOnQueue");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v12 = *(id *)(a1 + 8);
    if (v12 != v11)
    {
      WeakRetained = v12;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      FBLogProcessScene();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v36 = v22;
        v37 = 1024;
        *(_DWORD *)v38 = objc_msgSend(v10, "count");
        *(_WORD *)&v38[4] = 2112;
        *(_QWORD *)&v38[6] = v11;
        *(_WORD *)&v38[14] = 2112;
        *(_QWORD *)&v38[16] = WeakRetained;
        _os_log_error_impl(&dword_1A359A000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Aborted %u action(s) due to connection mismatch : connection=%@ expected=%@", buf, 0x26u);
      }

      goto LABEL_14;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    FBLogProcessScene();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v16;
      v37 = 1024;
      *(_DWORD *)v38 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1A359A000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Received %u action(s)", buf, 0x12u);
    }

    if (!a4 && *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 24), "specification");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v17, "transitionContextClass"), "transitionContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setActions:", v10);
      v19 = objc_alloc_init(MEMORY[0x1E0D231D8]);
      objc_msgSend(v19, "setTransitionContext:", v18);
      objc_msgSend(v19, "setSource:", 2);
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v20 = *(void **)(a1 + 48);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke;
      v30[3] = &unk_1E4A133F8;
      v30[4] = a1;
      v30[5] = &v31;
      objc_msgSend(v20, "scene:reviewEvent:withCompletion:", a1, v19, v30);
      if (!*((_BYTE *)v32 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("agent callout's completion was not called in scope : event=%@ agent=%@"), v19, *(_QWORD *)(a1 + 48));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x1E0C81028];
        v25 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_handleActions_forExtension_fromConnection_);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v26;
          v37 = 2114;
          *(_QWORD *)v38 = v28;
          *(_WORD *)&v38[8] = 2048;
          *(_QWORD *)&v38[10] = a1;
          *(_WORD *)&v38[18] = 2114;
          *(_QWORD *)&v38[20] = CFSTR("FBWorkspaceScene.m");
          v39 = 1024;
          v40 = 893;
          v41 = 2114;
          v42 = v23;
          _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
        v29 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v29);
      }
      objc_msgSend(v18, "actions");
      v21 = objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v31, 8);
      v10 = (id)v21;
    }
    if (objc_msgSend(v10, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "clientToken:didReceiveActions:forExtension:", a1, v10, a4);
LABEL_14:

    }
  }

}

void __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke_2;
    v6[3] = &unk_1E4A12168;
    v7 = v3;
    objc_msgSend(v5, "performAsync:", v6);

  }
}

uint64_t __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)usesOutgoingConnection
{
  return self->_usesOutgoingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceQueue, 0);
  objc_storeStrong((id *)&self->_queue_workspaceAssertion, 0);
  objc_storeStrong((id *)&self->_lock_sceneCreatedBlocks, 0);
  objc_storeStrong((id *)&self->_lock_clientSettings, 0);
  objc_storeStrong((id *)&self->_lock_settings, 0);
  objc_storeStrong((id *)&self->_agentSessions, 0);
  objc_storeStrong((id *)&self->_hostAgent, 0);
  objc_storeStrong((id *)&self->_logProem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

- (void)initWithConnection:host:settings:clientSettings:fromRemnant:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithConnection:host:settings:clientSettings:fromRemnant:.cold.2()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueSceneCreateCompletionBlock:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.2()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.3()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.4()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)agent:(uint64_t)a3 registerMessageHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[%{public}@] Agent message handlers are no longer supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)agent:(uint64_t)a3 sendMessage:(uint64_t)a4 withResponse:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[%{public}@] Agent messages are no longer supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[%{public}@] Send action timed out.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

@end
