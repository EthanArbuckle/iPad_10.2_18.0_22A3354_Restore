@implementation LNActionExecutor

- (void)performOneShotWithConnectionOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v4 = a3;
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "Requested to perform action in a single shot", buf, 2u);
  }

  -[LNActionExecutor action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "setOneShotActionForSpringBoardOnly:", v6);
  -[LNActionExecutor options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "setOneShotActionExecutorOptionsForSpringBoardOnly:", v10);
  -[LNActionExecutor connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__LNActionExecutor_OneShot__performOneShotWithConnectionOptions___block_invoke;
  v15[3] = &unk_1E45DC1B0;
  v15[4] = self;
  objc_msgSend(v14, "getConnectionInterfaceWithOptions:completionHandler:", v11, v15);

}

void __65__LNActionExecutor_OneShot__performOneShotWithConnectionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  LNActionOutput *v8;
  void *v9;
  LNActionOutput *v10;
  LNSuccessResult *v11;
  void *v12;
  LNSuccessResult *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v7, &state);

  if (v5)
  {
    v8 = [LNActionOutput alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = 0;
    LOBYTE(v23) = 0;
    v10 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](v8, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v9, 0, 0, 0, 0, 0, 0, v23, 0, 0, 0, 0, v24, 0, 0);

    v11 = [LNSuccessResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LNSuccessResult initWithAction:output:actionAppContext:predictions:](v11, "initWithAction:output:actionAppContext:predictions:", v12, v10, 0, MEMORY[0x1E0C9AA60]);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "executor:didPerformActionWithResult:error:", *(_QWORD *)(a1 + 32), v13, v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "executor:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), v13, v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "executor:didCompleteExecutionWithResult:error:", *(_QWORD *)(a1 + 32), v13, v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedWithError:", v6);
  }
  os_activity_scope_leave(&state);

}

- (LNActionExecutor)initWithAction:(id)a3 connection:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNActionExecutor *v12;
  uint64_t v13;
  NSUUID *identifier;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  LNAction *v22;
  LNAction *action;
  uint64_t v24;
  LNActionExecutorOptions *options;
  void *v26;
  void *v27;
  int v28;
  os_activity_t v29;
  OS_os_activity *activity;
  uint64_t v31;
  NSProgress *progress;
  LNActionExecutor *v33;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v11)
      goto LABEL_4;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v10)
    goto LABEL_15;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_4:
  v38.receiver = self;
  v38.super_class = (Class)LNActionExecutor;
  v12 = -[LNActionExecutor init](&v38, sel_init);
  if (!v12)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = objc_claimAutoreleasedReturnValue();
  identifier = v12->_identifier;
  v12->_identifier = (NSUUID *)v13;

  objc_msgSend(v9, "systemProtocols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "openEntitySystemProtocol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsObject:", v16) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v9, "systemProtocols");
  v17 = a4;
  v18 = v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "urlRepresentableProtocol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "containsObject:", v20);

  v10 = v18;
  a4 = v17;

  if (!v21)
  {
LABEL_9:
    v22 = (LNAction *)v9;
    goto LABEL_10;
  }
  objc_msgSend(v9, "actionWithOpenWhenRun:", 0);
  v22 = (LNAction *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  action = v12->_action;
  v12->_action = v22;

  objc_storeStrong((id *)&v12->_connection, a4);
  v24 = objc_msgSend(v11, "copy");
  options = v12->_options;
  v12->_options = (LNActionExecutorOptions *)v24;

  objc_msgSend(v9, "systemProtocols");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "cameraCaptureProtocol");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "containsObject:", v27);

  if (v28)
    -[LNActionExecutorOptions setOneShotForSpringBoardOnly:](v12->_options, "setOneShotForSpringBoardOnly:", 1);
  v12->_state = 0;
  v29 = _os_activity_create(&dword_1A18F6000, "appintents:action executor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  activity = v12->_activity;
  v12->_activity = (OS_os_activity *)v29;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100000);
  v31 = objc_claimAutoreleasedReturnValue();
  progress = v12->_progress;
  v12->_progress = (NSProgress *)v31;

  v12->_progressSubscriptionLock._os_unfair_lock_opaque = 0;
  v33 = v12;
LABEL_13:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[LNActionExecutor unsubscribeProgressObservation](self, "unsubscribeProgressObservation");
  v3.receiver = self;
  v3.super_class = (Class)LNActionExecutor;
  -[LNActionExecutor dealloc](&v3, sel_dealloc);
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  void *v7;

  state = self->_state;
  if (state != a3)
  {
    switch(state)
    {
      case 0:
        if (a3 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNActionExecutorStateConnecting"));
          goto LABEL_16;
        }
        state = 0;
        break;
      case 1:
        if ((unint64_t)(a3 - 2) >= 9 || ((0x183u >> (a3 - 2)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNActionExecutorStateWaitingForAppProtectionUnlock || state == LNActionExecutorStateResolving || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted"));
          goto LABEL_16;
        }
        state = 1;
        break;
      case 2:
        if (a3 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNActionExecutorStateConnecting"));
          goto LABEL_16;
        }
        state = 2;
        break;
      case 3:
        if ((unint64_t)(a3 - 4) >= 7 || ((0x67u >> (a3 - 4)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNActionExecutorStateWaitingForValue || state == LNActionExecutorStateWaitingForDisambiguation || state == LNActionExecutorStateWaitingForConfirmation || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted"));
          goto LABEL_16;
        }
        state = 3;
        break;
      case 4:
      case 5:
      case 6:
      case 8:
        if ((unint64_t)a3 > 0xA || ((1 << a3) & 0x608) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionExecutor.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == LNActionExecutorStateResolving || state == LNActionExecutorStatePerforming || state == LNActionExecutorStateCompleted"));
LABEL_16:

          state = self->_state;
        }
        break;
      default:
        break;
    }
    -[LNActionExecutor _logTransitionFromState:toState:](self, "_logTransitionFromState:toState:", state, a3);
    self->_state = a3;
  }
}

- (void)_logTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_signpost_type_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 == a4)
    return;
  getLNLogCategoryExecution();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 9)
      v8 = CFSTR("Idle");
    else
      v8 = off_1E45DD670[a3 - 1];
    if ((unint64_t)(a4 - 1) > 9)
      v9 = CFSTR("Idle");
    else
      v9 = off_1E45DD670[a4 - 1];
    v24 = 138543618;
    v25 = v8;
    v26 = 2114;
    v27 = v9;
  }

  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x174) != 0)
    {
      getLNLogCategoryExecution();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v10))
        goto LABEL_22;
      LOWORD(v24) = 0;
      v12 = "waiting";
    }
    else if (a3 == 1)
    {
      getLNLogCategoryExecution();
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v14))
        goto LABEL_22;
      LOWORD(v24) = 0;
      v12 = "connecting";
    }
    else
    {
      if (a3 != 9)
        goto LABEL_23;
      getLNLogCategoryExecution();
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = v13;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v13))
        goto LABEL_22;
      LOWORD(v24) = 0;
      v12 = "performing";
    }
    _os_signpost_emit_with_name_impl(&dword_1A18F6000, v11, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)self, v12, "", (uint8_t *)&v24, 2u);
LABEL_22:

  }
LABEL_23:
  switch(a4)
  {
    case 1:
      getLNLogCategoryExecution();
      v20 = objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v20))
        goto LABEL_39;
      LOWORD(v24) = 0;
      v17 = "connecting";
      goto LABEL_27;
    case 2:
    case 4:
    case 5:
    case 6:
    case 8:
      getLNLogCategoryExecution();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v15))
        goto LABEL_39;
      LOWORD(v24) = 0;
      v17 = "waiting";
      goto LABEL_27;
    case 3:
      getLNLogCategoryExecution();
      v21 = objc_claimAutoreleasedReturnValue();
      v16 = v21;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v21))
        goto LABEL_39;
      LOWORD(v24) = 0;
      v17 = "resolving";
      goto LABEL_27;
    case 7:
      getLNLogCategoryExecution();
      v22 = objc_claimAutoreleasedReturnValue();
      v16 = v22;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v22))
        goto LABEL_39;
      LOWORD(v24) = 0;
      v17 = "resolving";
      v18 = v16;
      v19 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_28;
    case 9:
      getLNLogCategoryExecution();
      v23 = objc_claimAutoreleasedReturnValue();
      v16 = v23;
      if ((unint64_t)&self->super.isa + 1 < 2 || !os_signpost_enabled(v23))
        goto LABEL_39;
      LOWORD(v24) = 0;
      v17 = "performing";
LABEL_27:
      v18 = v16;
      v19 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_28:
      _os_signpost_emit_with_name_impl(&dword_1A18F6000, v18, v19, (os_signpost_id_t)self, v17, "", (uint8_t *)&v24, 2u);
LABEL_39:

      break;
    default:
      return;
  }
}

- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CF9688];
  -[LNActionExecutor connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWithBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isLocked") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke;
    v13[3] = &unk_1E45DD3B8;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v12, "getIsChallengeCurrentlyRequiredForSubject:completion:", v11, v13);

  }
  else
  {
    -[LNActionExecutor getPrimaryConnectionInterfaceWithOptions:completionHandler:](self, "getPrimaryConnectionInterfaceWithOptions:completionHandler:", v6, v7);
  }

}

- (void)getPrimaryConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  -[LNActionExecutor action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "xpcListenerProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    -[LNActionExecutor getXPCListenerConnectionInterfaceWithOptions:completionHandler:](self, "getXPCListenerConnectionInterfaceWithOptions:completionHandler:", v6, v7);
  }
  else
  {
    -[LNActionExecutor connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__LNActionExecutor_getPrimaryConnectionInterfaceWithOptions_completionHandler___block_invoke;
    v13[3] = &unk_1E45DD390;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v12, "getConnectionInterfaceWithOptions:completionHandler:", v6, v13);

  }
}

- (void)getXPCListenerConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  LNActionExecutor *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[LNActionExecutor action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithNonSecureParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNActionExecutor connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E45DD408;
  v17 = v9;
  v18 = self;
  v19 = v6;
  v20 = v7;
  v13 = v6;
  v14 = v9;
  v15 = v7;
  objc_msgSend(v10, "getListenerEndpointForBundleIdentifier:action:completionHandler:", v12, v14, v16);

}

- (void)perform
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  _QWORD v27[5];
  _QWORD v28[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  -[LNActionExecutor setState:](self, "setState:", 1);
  -[LNActionExecutor action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (!v5)
  {
    -[LNActionExecutor action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __27__LNActionExecutor_perform__block_invoke;
    v28[3] = &unk_1E45DD430;
    v28[4] = self;
    -[LNActionExecutor openActionURL:completionHandler:](self, "openActionURL:completionHandler:", v6, v28);
    goto LABEL_14;
  }
  -[LNActionExecutor action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "openAppWhenRun"))
    goto LABEL_6;
  -[LNActionExecutor connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("openAppWhenRun is not supported in extensions");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("LNContextErrorDomain"), 2001, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor setCompletedWithError:](self, "setCompletedWithError:", v11);

LABEL_6:
  }
  -[LNActionExecutor connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  -[LNActionExecutor action](self, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor options](self, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "interactionMode");
  -[LNActionExecutor options](self, "options");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "source");
  -[LNActionExecutor options](self, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sourceOverride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "optionsForAction:interactionMode:source:sourceOverride:", v14, v16, v18, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNActionExecutor options](self, "options");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v21, "requestUnlockIfNeeded");

  if ((_DWORD)v14)
    objc_msgSend(v6, "setAuthenticationPolicy:", 1);
  getLNLogCategoryExecution();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[LNActionExecutor options](self, "options");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "executionUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v24;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1A18F6000, v22, OS_LOG_TYPE_INFO, "Performing action with UUID: %@, connection options: %@", buf, 0x16u);

  }
  -[LNActionExecutor options](self, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "oneShotForSpringBoardOnly");

  if (v26)
  {
    -[LNActionExecutor performOneShotWithConnectionOptions:](self, "performOneShotWithConnectionOptions:", v6);
  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __27__LNActionExecutor_perform__block_invoke_70;
    v27[3] = &unk_1E45DD510;
    v27[4] = self;
    -[LNActionExecutor getConnectionInterfaceWithOptions:completionHandler:](self, "getConnectionInterfaceWithOptions:completionHandler:", v6, v27);
  }
LABEL_14:

  os_activity_scope_leave(&state);
}

- (void)openActionURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, LNURLLaunchRequest *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  LNURLLaunchRequest *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, LNURLLaunchRequest *))a4;
  getLNLogCategoryExecution();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v9;

  }
  -[LNActionExecutor delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0
    && (-[LNActionExecutor delegate](self, "delegate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "executor:shouldOpenActionURL:", self, v6),
        v12,
        (v13 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v14 = (LNURLLaunchRequest *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);
  }
  else
  {
    v14 = -[LNURLLaunchRequest initWithAction:]([LNURLLaunchRequest alloc], "initWithAction:", v6);
    -[LNURLLaunchRequest performValidatingURLScheme:completionHandler:](v14, "performValidatingURLScheme:completionHandler:", -[LNActionExecutor validateURLSchemeBeforeLaunching](self, "validateURLSchemeBeforeLaunching"), v7);
  }

}

- (void)donateActionIfNecessary:(id)a3 result:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  LNTranscriptActionRecord *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  LNTranscriptActionRecord *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LNActionExecutor options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "donateToTranscript");

  if (v9 && (v12 & 1) != 0)
  {
    v29 = v10;
    v13 = [LNTranscriptActionRecord alloc];
    -[LNActionExecutor connection](self, "connection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor options](self, "options");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v32, "source");
    -[LNActionExecutor options](self, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clientLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor options](self, "options");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "executionUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v38;
    if (v16 || !v15)
    {
      getLNLogCategoryGeneral();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v8;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v9, "actionData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outputData");
    v35 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionsData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "output");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nextAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = v22 != 0;
    v25 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:](v13, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:", v33, v14, v30, v27, v26, v15, v18, v19, v20, v24);

    +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __69__LNActionExecutor_donateActionIfNecessary_result_completionHandler___block_invoke;
    v36[3] = &unk_1E45DE2E8;
    v10 = v29;
    v37 = v29;
    objc_msgSend(v23, "donateActionRecord:completionHandler:", v25, v36);

    v8 = v35;
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)runShowOutputActionIfNecessary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;
  id v16;
  LNActionMetadata *showOutputActionMetadata;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LNActionMetadata *v22;
  LNActionMetadata *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  LNActionExecutorPassthroughDelegate *v29;
  void *v30;
  LNActionExecutorPassthroughDelegate *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  objc_msgSend(v6, "showOutputAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[LNActionExecutor connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[LNActionExecutor delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_9;
      }
      -[LNActionExecutor delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "executor:shouldRunShowOutputAction:", self, v8);

      if ((v13 & 1) != 0)
      {
LABEL_9:
        objc_msgSend(v8, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (!v15)
        {
          -[LNActionExecutor setState:](self, "setState:", 9);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke;
          v43[3] = &unk_1E45DDED0;
          v45 = v7;
          v8 = v8;
          v44 = v8;
          -[LNActionExecutor openActionURL:completionHandler:](self, "openActionURL:completionHandler:", v8, v43);

          v16 = v45;
LABEL_24:

          goto LABEL_25;
        }
        showOutputActionMetadata = self->_showOutputActionMetadata;
        if (showOutputActionMetadata)
        {
          v16 = 0;
        }
        else
        {
          v18 = (void *)objc_opt_new();
          -[LNActionExecutor connection](self, "connection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appBundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v18, "actionForBundleIdentifier:andActionIdentifier:error:", v20, v21, &v42);
          v22 = (LNActionMetadata *)objc_claimAutoreleasedReturnValue();
          v38 = v19;
          v16 = v42;
          v23 = self->_showOutputActionMetadata;
          self->_showOutputActionMetadata = v22;

          if (!self->_showOutputActionMetadata)
          {
            getLNLogCategoryExecution();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v48 = v16;
              _os_log_impl(&dword_1A18F6000, v37, OS_LOG_TYPE_ERROR, "Failed to read intent metadata: %{public}@.", buf, 0xCu);
            }

            (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v16);
            goto LABEL_23;
          }

          showOutputActionMetadata = self->_showOutputActionMetadata;
        }
        +[LNConnectionPolicy policyWithActionMetadata:](LNConnectionPolicy, "policyWithActionMetadata:", showOutputActionMetadata, v38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v16;
        objc_msgSend(v24, "connectionWithError:", &v41);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v41;

        if (v25)
        {
          objc_msgSend(v8, "parameters");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "actionWithParameters:", v27);
          v28 = objc_claimAutoreleasedReturnValue();

          v29 = [LNActionExecutorPassthroughDelegate alloc];
          -[LNActionExecutor delegate](self, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke_104;
          v39[3] = &unk_1E45DD538;
          v40 = v7;
          v31 = -[LNActionExecutorPassthroughDelegate initWithShowOutputActionDelegate:performCompletionHandler:](v29, "initWithShowOutputActionDelegate:performCompletionHandler:", v30, v39);
          -[LNActionExecutor setShowOutputActionPassthroughDelegate:](self, "setShowOutputActionPassthroughDelegate:", v31);

          -[LNActionExecutor options](self, "options");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "copy");

          if ((objc_msgSend(v6, "showOutputActionOptions") & 1) != 0)
            objc_msgSend(v33, "setPreferNoticePresentation:", 1);
          -[LNActionExecutor showOutputActionPassthroughDelegate](self, "showOutputActionPassthroughDelegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "executorForAction:options:delegate:", v28, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "perform");
          v8 = (id)v28;
        }
        else
        {
          getLNLogCategoryExecution();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v26;
            _os_log_impl(&dword_1A18F6000, v36, OS_LOG_TYPE_ERROR, "Failed to initialize connection: %{public}@.", buf, 0xCu);
          }

          (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v26);
        }

        v18 = v24;
        v16 = v26;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
  }
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_25:

  os_activity_scope_leave(&state);
}

- (void)setCompletedWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[LNActionExecutor setState:](self, "setState:", 10);
  -[LNActionExecutor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[LNActionExecutor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executor:didPerformActionWithResult:error:", self, 0, v13);

  }
  -[LNActionExecutor delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutor delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:didFinishWithResult:error:", self, 0, v13);

  }
  -[LNActionExecutor delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[LNActionExecutor delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executor:didCompleteExecutionWithResult:error:", self, 0, v13);

  }
}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v6 = a3;
  objc_msgSend(v6, "setCompletionHandler:", a4);
  v7 = -[LNActionExecutor state](self, "state");
  -[LNActionExecutor setState:](self, "setState:", 5);
  objc_msgSend(v6, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__LNActionExecutor_requestParameterConfirmation_completionHandler___block_invoke;
  v13[3] = &unk_1E45DD560;
  v14 = v8;
  v15 = v7;
  v13[4] = self;
  v9 = v8;
  objc_msgSend(v6, "setCompletionHandler:", v13);
  -[LNActionExecutor connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelTimeoutForOperationWithIdentifier:", v11);

  -[LNActionExecutor delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executor:needsConfirmationWithRequest:", self, v6);

}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v6 = a3;
  objc_msgSend(v6, "setCompletionHandler:", a4);
  v7 = -[LNActionExecutor state](self, "state");
  -[LNActionExecutor setState:](self, "setState:", 4);
  objc_msgSend(v6, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__LNActionExecutor_requestParameterDisambiguation_completionHandler___block_invoke;
  v13[3] = &unk_1E45DD588;
  v14 = v8;
  v15 = v7;
  v13[4] = self;
  v9 = v8;
  objc_msgSend(v6, "setCompletionHandler:", v13);
  -[LNActionExecutor connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelTimeoutForOperationWithIdentifier:", v11);

  -[LNActionExecutor delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executor:needsDisambiguationWithRequest:", self, v6);

}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v6 = a3;
  objc_msgSend(v6, "setCompletionHandler:", a4);
  v7 = -[LNActionExecutor state](self, "state");
  -[LNActionExecutor setState:](self, "setState:", 6);
  objc_msgSend(v6, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__LNActionExecutor_requestParameterNeedsValue_completionHandler___block_invoke;
  v13[3] = &unk_1E45DD5B0;
  v14 = v8;
  v15 = v7;
  v13[4] = self;
  v9 = v8;
  objc_msgSend(v6, "setCompletionHandler:", v13);
  -[LNActionExecutor connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelTimeoutForOperationWithIdentifier:", v11);

  -[LNActionExecutor delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executor:needsValueWithRequest:", self, v6);

}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;

  v6 = a3;
  objc_msgSend(v6, "setCompletionHandler:", a4);
  v7 = -[LNActionExecutor state](self, "state");
  -[LNActionExecutor setState:](self, "setState:", 8);
  objc_msgSend(v6, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__LNActionExecutor_requestActionConfirmation_completionHandler___block_invoke;
  v15[3] = &unk_1E45DD5D8;
  v15[4] = self;
  v17 = v7;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v6, "setCompletionHandler:", v15);
  -[LNActionExecutor delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[LNActionExecutor connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancelTimeoutForOperationWithIdentifier:", v13);

    -[LNActionExecutor delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "executor:needsActionConfirmationWithRequest:", self, v6);

  }
  else
  {
    objc_msgSend(v6, "respondWithConfirmation:", 1);
  }

}

- (void)requestAppProtectionUnlockWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  v4 = a3;
  -[LNActionExecutor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = -[LNActionExecutor state](self, "state");
    -[LNActionExecutor setState:](self, "setState:", 2);
    -[LNActionExecutor connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelTimeoutForOperationWithIdentifier:", v9);

    -[LNActionExecutor delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__LNActionExecutor_requestAppProtectionUnlockWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E45DD600;
    v11[4] = self;
    v13 = v7;
    v12 = v4;
    objc_msgSend(v10, "executor:needsAppProtectionUnlockWithCompletionHandler:", self, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)requestViewSnippetEnvironmentWithCompletion:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[LNActionExecutor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[LNActionExecutor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executor:environmentForViewSnippetWithCompletion:", self, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)requestViewSnippetSizeWithCompletion:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[LNActionExecutor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[LNActionExecutor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executor:preferredContentSizeForViewSnippetWithCompletion:", self, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  __CFString *v28;
  __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  __CFString *v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[LNActionExecutor connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v13, 0, 0);
  if (v14)
  {
    objc_msgSend(v6, "setCompletionHandler:", v7);
    -[LNActionExecutor connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isDaemon");

    if (!v16)
    {
      v24 = +[LNUnlockService isDeviceLocked](LNUnlockService, "isDeviceLocked");
      getLNLogCategoryExecution();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        -[LNActionExecutor options](self, "options");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "source");
        if (v27 > 0xA)
          v28 = CFSTR("Application");
        else
          v28 = *(&off_1E45DBE20 + v27);
        v29 = v28;
        if (v24)
          v30 = CFSTR("locked");
        else
          v30 = CFSTR("unlocked");
        v31 = objc_msgSend(v6, "type");
        v32 = CFSTR("UserInitiated");
        if (v31 == 1)
          v32 = CFSTR("ForegroundLaunch");
        if (v31 == 2)
          v32 = CFSTR("ForegroundLaunchWithRunningUI");
        v33 = v32;
        *(_DWORD *)buf = 138543874;
        v48 = v29;
        v49 = 2114;
        v50 = v30;
        v51 = 2114;
        v52 = v33;
        _os_log_impl(&dword_1A18F6000, v25, OS_LOG_TYPE_INFO, "Source: %{public}@, device is %{public}@, request type: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v6, "sceneOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "completionHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke;
      v42[3] = &unk_1E45DD650;
      v42[4] = self;
      v21 = v34;
      v43 = v21;
      v44 = v13;
      v45 = v7;
      v36 = v35;
      v46 = v36;
      objc_msgSend(v6, "setCompletionHandler:", v42);
      if ((objc_msgSend(v6, "requestConfirmation") & 1) != 0)
      {
        -[LNActionExecutor connection](self, "connection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNActionExecutor identifier](self, "identifier");
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "cancelTimeoutForOperationWithIdentifier:", v38);

        -[LNActionExecutor delegate](self, "delegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v38) = objc_opt_respondsToSelector();

        if ((v38 & 1) != 0)
        {
          -[LNActionExecutor delegate](self, "delegate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "executor:needsContinueInAppWithRequest:", self, v6);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "respondWithError:", v41);

        }
      }
      else
      {
        objc_msgSend(v6, "respondWithSuccess");
      }

      goto LABEL_32;
    }
    getLNLogCategoryExecution();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[LNActionExecutor connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIdentifier");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v19;

    }
    if ((objc_msgSend(v6, "requestConfirmation") & 1) != 0)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("LNActionExecutorErrorDomain"), 2018, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v22);

LABEL_32:
      goto LABEL_33;
    }
    objc_msgSend(v6, "respondWithSuccess");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LNActionExecutorErrorDomain"), 2018, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v23);

  }
LABEL_33:

}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  LNURLLaunchRequest *v9;
  void *v10;
  LNURLLaunchRequest *v11;
  _BOOL8 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setCompletionHandler:", a4);
  getLNLogCategoryExecution();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v8;

  }
  v9 = [LNURLLaunchRequest alloc];
  objc_msgSend(v6, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LNURLLaunchRequest initWithURL:](v9, "initWithURL:", v10);

  v12 = -[LNActionExecutor validateURLSchemeBeforeLaunching](self, "validateURLSchemeBeforeLaunching");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__LNActionExecutor_requestOpenURL_completionHandler___block_invoke;
  v14[3] = &unk_1E45DD430;
  v15 = v6;
  v13 = v6;
  -[LNURLLaunchRequest performValidatingURLScheme:completionHandler:](v11, "performValidatingURLScheme:completionHandler:", v12, v14);

}

- (void)requestCancelTimeout
{
  void *v3;
  id v4;

  -[LNActionExecutor connection](self, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTimeoutForOperationWithIdentifier:", v3);

}

- (void)requestExtendTimeout
{
  void *v3;
  id v4;

  -[LNActionExecutor connection](self, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendTimeoutForOperationWithIdentifier:", v3);

}

- (BOOL)validateURLSchemeBeforeLaunching
{
  void *v2;
  void *v3;
  char v4;

  -[LNActionExecutor connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")) ^ 1;

  return v4;
}

- (void)unsubscribeProgressObservation
{
  os_unfair_lock_s *p_progressSubscriptionLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_progressSubscriptionLock = &self->_progressSubscriptionLock;
  os_unfair_lock_lock(&self->_progressSubscriptionLock);
  -[LNActionExecutor executionProgress](self, "executionProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LNActionExecutor executionProgress](self, "executionProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), LNActionExecutorRemoteProgressCompletedContext);

    -[LNActionExecutor setExecutionProgress:](self, "setExecutionProgress:", 0);
  }
  os_unfair_lock_unlock(p_progressSubscriptionLock);
  -[LNActionExecutor progressSubscriber](self, "progressSubscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB38A8];
    -[LNActionExecutor progressSubscriber](self, "progressSubscriber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeSubscriber:", v8);

    -[LNActionExecutor setProgressSubscriber:](self, "setProgressSubscriber:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v10 = a4;
  v11 = v10;
  if ((void *)LNActionExecutorRemoteProgressCompletedContext == a6)
  {
    objc_msgSend(v10, "fractionCompleted");
    v13 = (uint64_t)(v12 * 100000.0);
    -[LNActionExecutor progress](self, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompletedUnitCount:", v13);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)LNActionExecutor;
    -[LNActionExecutor observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (LNActionMetadata)_showOutputActionMetadata
{
  return self->_showOutputActionMetadata;
}

- (void)set_showOutputActionMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (LNConnection)connection
{
  return self->_connection;
}

- (LNActionExecutorOptions)options
{
  return self->_options;
}

- (LNAction)action
{
  return self->_action;
}

- (LNActionExecutorDelegate)delegate
{
  return (LNActionExecutorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LNActionExecutorPassthroughDelegate)showOutputActionPassthroughDelegate
{
  return self->_showOutputActionPassthroughDelegate;
}

- (void)setShowOutputActionPassthroughDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_showOutputActionPassthroughDelegate, a3);
}

- (os_unfair_lock_s)progressSubscriptionLock
{
  return self->_progressSubscriptionLock;
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (void)setProgressSubscriber:(id)a3
{
  objc_storeStrong(&self->_progressSubscriber, a3);
}

- (NSProgress)executionProgress
{
  return self->_executionProgress;
}

- (void)setExecutionProgress:(id)a3
{
  objc_storeStrong((id *)&self->_executionProgress, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_executionProgress, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_showOutputActionPassthroughDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_showOutputActionMetadata, 0);
}

uint64_t __53__LNActionExecutor_requestOpenURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

void __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "source");

    if (v6 == 6)
      objc_msgSend(v4, "setValue:forKey:", *MEMORY[0x1E0DAB800], *MEMORY[0x1E0D22D58]);
    objc_msgSend(*(id *)(a1 + 32), "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "source");

    if (v8 == 7)
      objc_msgSend(v4, "setValue:forKey:", *MEMORY[0x1E0DAB818], *MEMORY[0x1E0D22D58]);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "progressIsPersistentInSystemApertureForExecutor:", *(_QWORD *)(a1 + 32));

      if (v12)
        objc_msgSend(v4, "setValue:forKey:", *MEMORY[0x1E0DAB820], *MEMORY[0x1E0D22D58]);
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "executorWillLaunchApplicationInForeground:", *(_QWORD *)(a1 + 32));

    }
    v16 = *(void **)(a1 + 40);
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fbsOpenApplicationOptionsWithActionExecutorOptions:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addEntriesFromDictionary:", v18);
    }
    getLNLogCategoryExecution();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_INFO, "INCAppLaunchRequest with options %@", buf, 0xCu);
    }

    v20 = objc_alloc(MEMORY[0x1E0D3E520]);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = (void *)objc_msgSend(v4, "copy");
    v23 = (void *)objc_msgSend(v20, "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v21, v22, 0, 0, 1);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_133;
    v24[3] = &unk_1E45DD628;
    v24[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 64);
    v25 = v3;
    objc_msgSend(v23, "performWithCompletionHandler:", v24);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __59__LNActionExecutor_requestContinueInApp_completionHandler___block_invoke_133(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void (*v9)(void);
  uint8_t v10[16];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendTimeoutForOperationWithIdentifier:", v7);

  if ((a2 & 1) != 0)
  {
    getLNLogCategoryExecution();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "App Launch request succeeded", v10, 2u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v9();

}

uint64_t __68__LNActionExecutor_requestAppProtectionUnlockWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendTimeoutForOperationWithIdentifier:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__LNActionExecutor_requestActionConfirmation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a3;
  v10 = a2;
  objc_msgSend(v5, "setState:", v6);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendTimeoutForOperationWithIdentifier:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__LNActionExecutor_requestParameterNeedsValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a3;
  v10 = a2;
  objc_msgSend(v5, "setState:", v6);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendTimeoutForOperationWithIdentifier:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__LNActionExecutor_requestParameterDisambiguation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a3;
  v10 = a2;
  objc_msgSend(v5, "setState:", v6);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendTimeoutForOperationWithIdentifier:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__LNActionExecutor_requestParameterConfirmation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a3;
  v10 = a2;
  objc_msgSend(v5, "setState:", v6);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendTimeoutForOperationWithIdentifier:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  LNActionOutput *v3;
  void *v4;
  uint64_t v5;
  LNSuccessResult *v6;
  LNSuccessResult *v7;
  uint64_t v8;
  uint64_t v9;
  LNActionOutput *v10;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = [LNActionOutput alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 0;
    LOBYTE(v8) = 0;
    v10 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](v3, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v4, 0, 0, 0, 0, 0, 0, v8, 0, 0, 0, 0, v9, 0, 0);

    v5 = *(_QWORD *)(a1 + 40);
    v6 = [LNSuccessResult alloc];
    v7 = -[LNSuccessResult initWithAction:output:actionAppContext:predictions:](v6, "initWithAction:output:actionAppContext:predictions:", *(_QWORD *)(a1 + 32), v10, 0, MEMORY[0x1E0C9AA60]);
    (*(void (**)(uint64_t, LNSuccessResult *, _QWORD))(v5 + 16))(v5, v7, 0);

  }
}

uint64_t __69__LNActionExecutor_runShowOutputActionIfNecessary_completionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__LNActionExecutor_donateActionIfNecessary_result_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __27__LNActionExecutor_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedWithError:", a2);
  if (!a2)
  {
    getLNLogCategoryExecution();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "action");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;

    }
  }
}

void __27__LNActionExecutor_perform__block_invoke_70(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  LNPerformActionConnectionOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  LNPerformActionConnectionOperation *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  os_activity_scope_state_s state;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 104), &state);
  if (v11)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v13 = (void *)MEMORY[0x1E0CB38A8];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __27__LNActionExecutor_perform__block_invoke_2;
    v26[3] = &unk_1E45DD460;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v13, "_addSubscriberForCategory:usingPublishingHandler:", CFSTR("com.apple.PerformActionProgressCategory"), v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProgressSubscriber:", v14);

    v15 = [LNPerformActionConnectionOperation alloc];
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "activity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __27__LNActionExecutor_perform__block_invoke_4;
    v23 = &unk_1E45DD4E8;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = v10;
    v19 = -[LNPerformActionConnectionOperation initWithConnectionInterface:action:executor:executorActivity:queue:completionHandler:](v15, "initWithConnectionInterface:action:executor:executorActivity:queue:completionHandler:", v11, v25, v16, v17, v18, &v20);

    objc_msgSend(*(id *)(a1 + 32), "setState:", 9, v20, v21, v22, v23, v24);
    objc_msgSend(v9, "enqueueConnectionOperation:", v19);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedWithError:", v12);
  }
  os_activity_scope_leave(&state);

}

id __27__LNActionExecutor_perform__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD aBlock[5];

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ExecutionUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_unfair_lock_s options](WeakRetained, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("fractionCompleted"), 1, LNActionExecutorRemoteProgressCompletedContext);
    -[os_unfair_lock_s setExecutionProgress:](WeakRetained, "setExecutionProgress:", v3);
    os_unfair_lock_unlock(WeakRetained + 2);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __27__LNActionExecutor_perform__block_invoke_3;
    aBlock[3] = &unk_1E45DDE18;
    aBlock[4] = WeakRetained;
    v10 = _Block_copy(aBlock);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __27__LNActionExecutor_perform__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD block[5];
  id v33;
  uint64_t *v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unsubscribeProgressObservation");
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8165;
  v45 = __Block_byref_object_dispose__8166;
  v46 = 0;
  if (v6)
  {
    getLNLogCategoryExecution();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v6;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_ERROR, "Perform action connection operation completed with error: %{public}@", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v47[0] = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = CFSTR("LNActionExecutorErrorCodePerformAction");
    objc_msgSend(v6, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@. Underlying error: %@"), CFSTR("LNActionExecutorErrorCodePerformAction"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("LNActionExecutorErrorUnderlyingError");
    v48[0] = v12;
    v48[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("LNActionExecutorErrorDomain"), 3001, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v42[5];
    v42[5] = v14;

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 10);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "executor:didPerformActionWithResult:error:", *(_QWORD *)(a1 + 32), v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "executor:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), v5, v6);

  }
  v22 = dispatch_group_create();
  dispatch_group_enter(v22);
  v23 = *(void **)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v25 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __27__LNActionExecutor_perform__block_invoke_83;
  v38[3] = &unk_1E45DD8F0;
  v40 = &v41;
  v26 = v22;
  v39 = v26;
  objc_msgSend(v23, "donateActionIfNecessary:result:completionHandler:", v24, v5, v38);
  dispatch_group_enter(v26);
  v27 = *(void **)(a1 + 32);
  objc_msgSend(v5, "output");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __27__LNActionExecutor_perform__block_invoke_2_84;
  v35[3] = &unk_1E45DD498;
  v37 = &v41;
  v29 = v26;
  v36 = v29;
  objc_msgSend(v27, "runShowOutputActionIfNecessary:completionHandler:", v28, v35);

  dispatch_get_global_queue(2, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __27__LNActionExecutor_perform__block_invoke_3_86;
  block[3] = &unk_1E45DD4C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v33 = v5;
  v34 = &v41;
  v31 = v5;
  dispatch_group_notify(v29, v30, block);

  _Block_object_dispose(&v41, 8);
}

void __27__LNActionExecutor_perform__block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = *MEMORY[0x1E0CB2D50];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("LNActionExecutorErrorCodeActionDonation");
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@. Underlying error: %@"), CFSTR("LNActionExecutorErrorCodeActionDonation"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("LNActionExecutorErrorUnderlyingError");
    v14[0] = v8;
    v14[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("LNActionExecutorErrorDomain"), 3002, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __27__LNActionExecutor_perform__block_invoke_2_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v16[0] = *MEMORY[0x1E0CB2D50];
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("LNActionExecutorErrorCodePerformShowOutputAction");
    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@. Underlying error: %@"), CFSTR("LNActionExecutorErrorCodePerformShowOutputAction"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("LNActionExecutorErrorUnderlyingError");
    v17[0] = v11;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("LNActionExecutorErrorDomain"), 3003, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __27__LNActionExecutor_perform__block_invoke_3_86(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executor:didCompleteExecutionWithResult:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

uint64_t __27__LNActionExecutor_perform__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsubscribeProgressObservation");
}

void __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
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
  uint64_t v26;
  id v27;
  id v28;
  LNXPCListenerEndpointConnection *v29;
  LNXPCListenerEndpointConnection *v30;
  void *v31;
  LNXPCListenerEndpointConnection *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  LNXPCListenerEndpointConnection *v42;
  id v43;
  id v44;
  id v45;
  _OWORD v46[2];
  _QWORD v47[4];
  id v48;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40 = v10;
  if (v9)
  {
    v39 = v9;
    objc_msgSend(*(id *)(a1 + 32), "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "action");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v11;
    objc_msgSend(v11, "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v47[3] = &unk_1E45DE190;
    v37 = v14;
    v48 = v37;
    objc_msgSend(v16, "if_objectsPassingTest:", v47);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithByMergingParameters:", v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = [LNXPCListenerEndpointConnection alloc];
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bundleType");
    v20 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "userIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v20, "if_auditToken");
    else
      memset(v46, 0, sizeof(v46));
    v45 = v12;
    v9 = v39;
    v30 = -[LNXPCListenerEndpointConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:listenerEndpoint:auditToken:error:](v32, "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:listenerEndpoint:auditToken:error:", v18, v19, v21, v23, 0, v25, v39, v46, &v45);
    v33 = v45;

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_3;
    v41[3] = &unk_1E45DD3E0;
    v26 = *(_QWORD *)(a1 + 48);
    v27 = *(id *)(a1 + 56);
    v42 = v30;
    v43 = v36;
    v44 = v27;
    v28 = v36;
    v29 = v30;
    -[LNConnection getConnectionInterfaceWithOptions:completionHandler:](v29, "getConnectionInterfaceWithOptions:completionHandler:", v26, v41);

    v12 = v33;
    v11 = v38;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __83__LNActionExecutor_getXPCListenerConnectionInterfaceWithOptions_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3);
}

void __79__LNActionExecutor_getPrimaryConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);

}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke(id *a1, void *a2)
{
  char v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = a1[4];
  if ((v3 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_3;
    v8[3] = &unk_1E45DDE68;
    v8[4] = v4;
    v9 = a1[5];
    v10 = a1[6];
    objc_msgSend(v4, "requestAppProtectionUnlockWithCompletionHandler:", v8);

  }
  else
  {
    objc_msgSend(a1[4], "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v11[3] = &unk_1E45DD390;
    v6 = a1[5];
    v7 = a1[6];
    v11[4] = a1[4];
    v12 = v7;
    objc_msgSend(v5, "getConnectionInterfaceWithOptions:completionHandler:", v6, v11);

  }
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);

}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_4;
    v8[3] = &unk_1E45DD390;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v3, "getConnectionInterfaceWithOptions:completionHandler:", v4, v8);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    LNConnectionErrorWithCode(2400);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, 0, v7);

  }
}

void __72__LNActionExecutor_getConnectionInterfaceWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id, id))(v5 + 16))(v5, v10, v9, v8, v7);

}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[LNActionExecutor connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
