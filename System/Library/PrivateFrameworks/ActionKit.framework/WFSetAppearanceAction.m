@implementation WFSetAppearanceAction

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("style")))
    goto LABEL_6;
  -[WFSetAppearanceAction runningDelegate](self, "runningDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
    goto LABEL_6;
  -[WFSetAppearanceAction runningDelegate](self, "runningDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionReversalStateForAction:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4020]), "initWithActionReversalState:", v21);
    if (v22)
    {
      +[WFAppearanceSettingsClient getReversalStateWithBookmark:completionHandler:](WFAppearanceSettingsClient, "getReversalStateWithBookmark:completionHandler:", v22, v16);
    }
    else
    {
      getWFActionsLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFSetAppearanceAction resolveSlot:withProcessedValue:parameter:input:completion:]";
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_FAULT, "%s Couldn't turn action reversal state %@ into a settings client bookmark", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    }

  }
  else
  {
LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)WFSetAppearanceAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v24, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  objc_super v8;

  v4 = a3;
  if (v4
    || (-[WFSetAppearanceAction runningDelegate](self, "runningDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSetAppearanceAction;
    -[WFHandleIntentAction finishRunningWithError:](&v8, sel_finishRunningWithError_, v4);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__WFSetAppearanceAction_finishRunningWithError___block_invoke;
    v7[3] = &unk_24F8B3230;
    v7[4] = self;
    +[WFAppearanceSettingsClient getBookmarkForCurrentStateWithCompletionHandler:](WFAppearanceSettingsClient, "getBookmarkForCurrentStateWithCompletionHandler:", v7);
  }

}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSetAppearanceAction;
  -[WFHandleCustomIntentAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__WFSetAppearanceAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "actionReversalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action:didGenerateReversalState:", v7, v8);

    objc_msgSendSuper2(&v9, sel_finishRunningWithError_, 0, *(_QWORD *)(a1 + 32), WFSetAppearanceAction, v10.receiver, v10.super_class);
  }
  else
  {
    objc_msgSendSuper2(&v10, sel_finishRunningWithError_, a3, v9.receiver, v9.super_class, *(_QWORD *)(a1 + 32), WFSetAppearanceAction);
  }

}

@end
