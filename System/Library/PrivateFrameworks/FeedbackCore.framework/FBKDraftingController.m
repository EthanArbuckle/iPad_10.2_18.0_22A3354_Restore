@implementation FBKDraftingController

- (FBKDraftingController)initWithFBKData:(id)a3
{
  id v4;
  FBKDraftingController *v5;
  FBKDraftingController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKDraftingController;
  v5 = -[FBKDraftingController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_FBKData, v4);
    -[FBKDraftingController configure](v6, "configure");
  }

  return v6;
}

- (FBKDraftingController)init
{
  FBKDraftingController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKDraftingController;
  v2 = -[FBKDraftingController init](&v5, sel_init);
  if (v2)
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_FBKData, v3);

    -[FBKDraftingController configure](v2, "configure");
  }
  return v2;
}

- (void)configure
{
  NSDictionary *v3;
  NSDictionary *cachedDiffableSections;

  v3 = (NSDictionary *)objc_opt_new();
  cachedDiffableSections = self->_cachedDiffableSections;
  self->_cachedDiffableSections = v3;

}

- (void)loadResponseForFeedbackObject:(id)a3 withTeam:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FBKDraftingController loadFormResponseFromContentItem:](self, "loadFormResponseFromContentItem:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FBKDraftingController loadNewResponseForBugFormStub:withTeam:](self, "loadNewResponseForBugFormStub:withTeam:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[FBKDraftingController loadNewResponseForBugForm:withTeam:](self, "loadNewResponseForBugForm:withTeam:", v6, v7);
      }
      else
      {
        Log_3();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[FBKDraftingController loadResponseForFeedbackObject:withTeam:].cold.1();

      }
    }
  }

}

- (void)loadResponseForFeedbackObject:(id)a3
{
  -[FBKDraftingController loadResponseForFeedbackObject:withTeam:](self, "loadResponseForFeedbackObject:withTeam:", a3, 0);
}

- (void)loadFormResponseFromContentItem:(id)a3
{
  -[FBKDraftingController _loadResponseWithFormResponse:item:](self, "_loadResponseWithFormResponse:item:", 0, a3);
}

- (void)_loadResponseWithFormResponse:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD aBlock[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKDraftingController _resetInternalEntities](self, "_resetInternalEntities");
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke;
  aBlock[3] = &unk_24E157EB0;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  -[FBKDraftingController setIsLoading:](self, "setIsLoading:", 1);
  -[FBKDraftingController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[FBKDraftingController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "draftingControllerDidBeginLoading:", self);

  }
  if (v6)
  {
    objc_msgSend(v6, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
  }
  else
  {
    objc_msgSend(v7, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
  }
  objc_msgSend(v14, "formID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "singleTeam");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  Log_3();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v13, "intValue");
    v19 = objc_msgSend(v15, "intValue");
    *(_DWORD *)buf = 67109376;
    v30 = v18;
    v31 = 1024;
    v32 = v19;
    _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "loading response for FR [%i] Form [%i]", buf, 0xEu);
  }

  -[FBKDraftingController FBKData](self, "FBKData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_20;
  v24[3] = &unk_24E157F00;
  v24[4] = self;
  v25 = v13;
  v26 = v7;
  v27 = v9;
  v21 = v9;
  v22 = v7;
  v23 = v13;
  objc_msgSend(v20, "refreshBugFormWithID:fromStub:forTeam:completion:", v15, 0, v16, v24);

}

void __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsDirty:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draftingControllerDidFinishLoading:withError:", *(_QWORD *)(a1 + 32), v6);

  }
}

void __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "FBKData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_2;
  v6[3] = &unk_24E157ED8;
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "refreshFormResponseWithID:contentItem:completion:", v3, v4, v6);

}

uint64_t __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setFormResponse:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_initForFormResponse");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)loadNewResponseForBugFormStub:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_3();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "signatureDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@] requesting plugIns [%{public}@]", (uint8_t *)&v13, 0x16u);

  }
  -[FBKDraftingController setFormStub:](self, "setFormStub:", v8);
  -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](self, "_loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:", 0, v8, 0, v9, v10);

}

- (void)loadNewResponseForBugFormStub:(id)a3 withTeam:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "signatureDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v10, 0xCu);

  }
  -[FBKDraftingController setFormStub:](self, "setFormStub:", v6);
  -[FBKDraftingController setTeam:](self, "setTeam:", v7);
  -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](self, "_loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:", 0, v6, v7, 0, 0);

}

- (void)loadNewResponseForBugFormStub:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "signatureDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v7, 0xCu);

  }
  -[FBKDraftingController setFormStub:](self, "setFormStub:", v4);
  -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](self, "_loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:", 0, v4, 0, 0, 0);

}

- (void)loadNewResponseForBugForm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "signatureDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v7, 0xCu);

  }
  -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](self, "_loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:", v4, 0, 0, 0, 0);

}

- (void)loadNewResponseForBugForm:(id)a3 withTeam:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "signatureDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v10, 0xCu);

  }
  -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](self, "_loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:", v6, 0, v7, 0, 0);

}

- (void)_loadNewResponseForBugForm:(id)a3 orBugFormStub:(id)a4 withTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12 | v13)
  {
    +[FBKTimeIntervals sharedInstance](FBKTimeIntervals, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didStartEvent:", 1);

    -[FBKDraftingController _resetInternalEntities](self, "_resetInternalEntities");
    if (!v14)
    {
      Log_3();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:]";
        _os_log_impl(&dword_21D9A9000, v21, OS_LOG_TYPE_DEFAULT, "nil team in [%{public}s] falling back to default team", buf, 0xCu);
      }

      -[FBKDraftingController FBKData](self, "FBKData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultTeam");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[FBKDraftingController setTeam:](self, "setTeam:", v14);
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__FBKDraftingController__loadNewResponseForBugForm_orBugFormStub_withTeam_requestPlugIns_appToken___block_invoke;
    aBlock[3] = &unk_24E157F28;
    aBlock[4] = self;
    v23 = _Block_copy(aBlock);
    -[FBKDraftingController setIsLoading:](self, "setIsLoading:", 1);
    -[FBKDraftingController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[FBKDraftingController delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "draftingControllerDidBeginLoading:", self);

    }
    if (v12)
    {
      -[FBKDraftingController FBKData](self, "FBKData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "newFormResponseForBugForm:inTeam:completion:", v12, v14, v23);
    }
    else
    {
      if (!v13)
      {
LABEL_16:

        goto LABEL_17;
      }
      -[FBKDraftingController FBKData](self, "FBKData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "newFormResponseForBugFormStub:inTeam:requestPlugIns:appToken:completion:", v13, v14, v15, v16, v23);
    }

    goto LABEL_16;
  }
  Log_3();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:].cold.1(v17, v18, v19);

LABEL_17:
}

void __99__FBKDraftingController__loadNewResponseForBugForm_orBugFormStub_withTeam_requestPlugIns_appToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setIsLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsDirty:", 0);
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFormResponse:", v11);
    objc_msgSend(*(id *)(a1 + 32), "_initForFormResponse");
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "draftingControllerDidFinishLoading:withError:", *(_QWORD *)(a1 + 32), v5);

  }
  +[FBKTimeIntervals sharedInstance](FBKTimeIntervals, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "didEndEvent:", 1);

}

- (void)_initForFormResponse
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  FBKQuestionDependencyGraph *v8;
  void *v9;
  void *v10;
  FBKQuestionDependencyGraph *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[FBKDraftingController formResponse](self, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    Log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[FBKDraftingController formResponse](self, "formResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134217984;
      v15 = objc_msgSend(v6, "integerValue");
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "FBKDraftingController _initForFormResponse: %ld", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_spamDebugLogs = objc_msgSend(v7, "BOOLForKey:", CFSTR("FBKSpamDependencies"));

    v8 = [FBKQuestionDependencyGraph alloc];
    -[FBKDraftingController formResponse](self, "formResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bugForm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FBKQuestionDependencyGraph initWithBugForm:](v8, "initWithBugForm:", v10);
    -[FBKDraftingController setDependencyGraph:](self, "setDependencyGraph:", v11);

    -[FBKDraftingController runResolvers](self, "runResolvers");
    -[FBKDraftingController updateQuestionVisibility](self, "updateQuestionVisibility");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDraftingController setQuestionIDsInErrorState:](self, "setQuestionIDsInErrorState:", v12);

    v13 = -[FBKDraftingController newModelSnapshot](self, "newModelSnapshot");
    -[FBKDraftingController setCurrentSnapshot:](self, "setCurrentSnapshot:", v13);

  }
}

- (BOOL)updateQuestionVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  FBKDraftingController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  void *v36;
  void *v37;
  FBKDraftingController *v38;
  int v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  void *v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  -[FBKDraftingController formResponse](self, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bugForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "questionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = self;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", v6);
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v6);
    -[FBKDraftingController setCachedVisibleQuestions:](self, "setCachedVisibleQuestions:", v9);

  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDraftingController formResponse](self, "formResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bugForm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "questionWithRole:", CFSTR(":why_opt_out"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  while (1)
  {
    v49 = v12;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[FBKDraftingController formResponse](v7, "formResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bugForm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "questionGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (!v16)
      break;
    v17 = v16;
    v57 = 0;
    v18 = *(_QWORD *)v65;
    v52 = *(_QWORD *)v65;
    do
    {
      v19 = 0;
      v53 = v17;
      do
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v19);
        if ((objc_msgSend(v20, "isFileCollectionGroup") & 1) == 0)
        {
          v56 = v19;
          -[FBKDraftingController cachedVisibleQuestions](v7, "cachedVisibleQuestions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "ID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v58 = (void *)v23;
          if (!v23)
          {
            v24 = objc_alloc(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v20, "questions");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

          }
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v55 = v20;
          objc_msgSend(v20, "questions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v61 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                objc_msgSend(v59, "ID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "ID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v32, "isEqual:", v33);

                if ((v34 & 1) == 0)
                {
                  v35 = objc_msgSend(v58, "containsObject:", v31);
                  -[FBKDraftingController dependencyGraph](v7, "dependencyGraph");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FBKDraftingController formResponse](v7, "formResponse");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = v7;
                  v39 = objc_msgSend(v36, "visibilityForQuestion:inFormResponse:", v31, v37);

                  v40 = v35 == v39;
                  v7 = v38;
                  if (!v40)
                  {
                    if (v35)
                    {
                      -[FBKDraftingController formResponse](v38, "formResponse");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "answerForQuestion:", v31);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v42)
                        objc_msgSend(v42, "setValue:", MEMORY[0x24BDBD1A8]);
                      objc_msgSend(v58, "removeObject:", v31);

                      v57 = 1;
                      v7 = v38;
                    }
                    else
                    {
                      objc_msgSend(v58, "addObject:", v31);
                      v57 = 1;
                    }
                  }
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            }
            while (v28);
          }

          v69 = v51;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "sortUsingDescriptors:", v43);

          -[FBKDraftingController cachedVisibleQuestions](v7, "cachedVisibleQuestions");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "ID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v58, v45);

          v18 = v52;
          if (objc_msgSend(v58, "count"))
            objc_msgSend(v50, "addObject:", v55);
          else
            objc_msgSend(v50, "removeObject:", v55);
          v17 = v53;
          v19 = v56;

        }
        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v17);

    v12 = 1;
    if ((v57 & 1) == 0)
      goto LABEL_35;
  }

LABEL_35:
  v68 = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sortedArrayUsingDescriptors:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDraftingController setCachedVisibleGroups:](v7, "setCachedVisibleGroups:", v47);

  return v49 & 1;
}

- (id)newModelSnapshot
{
  FBKDraftModelSnapshot *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FBKDraftModelSnapshot *v8;

  v3 = [FBKDraftModelSnapshot alloc];
  -[FBKDraftingController visibleQuestionGroups](self, "visibleQuestionGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[FBKDraftingController diagnosticsController](self, "diagnosticsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FBKDraftModelSnapshot initWithQuestionGroups:questions:deviceDiagnostics:](v3, "initWithQuestionGroups:questions:deviceDiagnostics:", v4, v6, v7);

  return v8;
}

- (void)reevaluateDependenciesWithQuestionChanged:(id)a3 toAdd:(id)a4 toRemove:(id)a5
{
  void *v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  id v35;
  id v36;
  id obj;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v36 = a4;
  v35 = a5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  *(_QWORD *)&v10 = 138543362;
  v34 = v10;
  do
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set", v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_spamDebugLogs)
    {
      Log_3();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "valueForKey:", CFSTR("role"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v34;
        v46 = v12;
        _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "Processing: %{public}@", buf, 0xCu);

      }
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v13)
    {
      v33 = v9;
      goto LABEL_33;
    }
    v14 = v13;
    v39 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[FBKDraftingController dependencyGraph](self, "dependencyGraph");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKDraftingController formResponse](self, "formResponse");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "visibilityForQuestion:inFormResponse:", v16, v18);

        -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "questionGroup");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          if ((v19 & 1) != 0)
          {
LABEL_22:
            if (self->_spamDebugLogs)
            {
              Log_3();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "role");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_impl(&dword_21D9A9000, v29, OS_LOG_TYPE_DEFAULT, "Conditionals will add: %@", buf, 0xCu);

              }
            }
            objc_msgSend(v36, "addObject:", v16);
          }
LABEL_27:
          if ((v9 & 1) == 0)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = objc_msgSend(v23, "containsObject:", v16);
        if (v19 == v24)
          goto LABEL_27;
        if (!v24)
          goto LABEL_22;
        -[FBKDraftingController formResponse](self, "formResponse");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "answerForQuestion:", v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(v26, "setValue:", MEMORY[0x24BDBD1A8]);
        if (self->_spamDebugLogs)
        {
          Log_3();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "role");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v46 = v28;
            _os_log_impl(&dword_21D9A9000, v27, OS_LOG_TYPE_DEFAULT, "Conditionals will remove: %@", buf, 0xCu);

          }
        }
        objc_msgSend(v35, "addObject:", v16);

LABEL_28:
        -[FBKDraftingController dependencyGraph](self, "dependencyGraph");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "questionsDependentOnQuestion:", v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "unionSet:", v32);
LABEL_29:

        LOBYTE(v9) = 0;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      LOBYTE(v9) = 0;
      v33 = 0;
    }
    while (v14);
LABEL_33:

    v8 = (void *)objc_msgSend(v38, "copy");
    v9 = v33;
  }
  while (objc_msgSend(v8, "count"));

}

- (void)updateVisibilityForChangedQuestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  FBKDraftingController *v62;
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
  void *v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v58 = (void *)v5;
  v59 = v4;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDraftingController reevaluateDependenciesWithQuestionChanged:toAdd:toRemove:](self, "reevaluateDependenciesWithQuestionChanged:toAdd:toRemove:", v4, v5);
  v6 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[FBKDraftingController cachedVisibleGroups](self, "cachedVisibleGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v62 = self;
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v76 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
        -[FBKDraftingController cachedVisibleQuestions](v62, "cachedVisibleQuestions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v14);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v21 = v57;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v72 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        objc_msgSend(v26, "questionGroup");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "ID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "removeObject:", v26);
        if (!objc_msgSend(v29, "count"))
        {
          objc_msgSend(v26, "questionGroup");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", v30);

          objc_msgSend(v26, "questionGroup");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "ID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObjectForKey:", v32);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v23);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v33 = v58;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v68 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
        objc_msgSend(v38, "questionGroup");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "questionGroup");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "ID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v41, v43);

        }
        objc_msgSend(v38, "questionGroup");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "member:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          objc_msgSend(v38, "questionGroup");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v46);

          objc_msgSend(v38, "questionGroup");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v47);

        }
        objc_msgSend(v41, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    }
    while (v35);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v11, "allKeys");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v64;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v64 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v61;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "sortUsingDescriptors:", v54);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
    }
    while (v50);
  }

  v79 = v61;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDraftingController setCachedVisibleGroups:](v62, "setCachedVisibleGroups:", v56);

  -[FBKDraftingController setCachedVisibleQuestions:](v62, "setCachedVisibleQuestions:", v11);
}

- (void)_resetInternalEntities
{
  FBKFormResponse *formResponse;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  formResponse = self->_formResponse;
  self->_formResponse = 0;

  -[FBKDraftingController setCurrentSnapshot:](self, "setCurrentSnapshot:", 0);
  -[FBKDraftingController setDiagnosticsController:](self, "setDiagnosticsController:", 0);
  -[FBKDraftingController setCachedVisibleGroups:](self, "setCachedVisibleGroups:", 0);
  -[FBKDraftingController setCachedVisibleQuestions:](self, "setCachedVisibleQuestions:", 0);
  -[FBKDraftingController setQuestionIDsInErrorState:](self, "setQuestionIDsInErrorState:", 0);
  -[FBKDraftingController setIsDirty:](self, "setIsDirty:", 0);
  -[FBKDraftingController setIsLoading:](self, "setIsLoading:", 0);
  -[FBKDraftingController delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[FBKDraftingController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[FBKDraftingController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "questionVisibilityDidUpdateForDraftingController:", self);

    }
  }
}

- (BOOL)isQuestionVisible:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "questionGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "ID", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedIntegerValue");

          if (v17 == v6)
          {
            v18 = 1;
            goto LABEL_15;
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }
  }
  else
  {
    Log_3();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FBKDraftingController isQuestionVisible:].cold.1(v4, v11);
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (id)visibleQuestionGroups
{
  void *v2;
  void *v3;
  id v4;

  -[FBKDraftingController cachedVisibleGroups](self, "cachedVisibleGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (id)visibleQuestionsForGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)MEMORY[0x24BDBD1A8];
  if (v5)
  {
    -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v6 = v11;

  }
  return v6;
}

- (id)indexPathForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKDraftingController cachedVisibleGroups](self, "cachedVisibleGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "questionGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "questionGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (v13 = objc_msgSend(v12, "indexOfObject:", v4), v13 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v15[0] = v7;
      v15[1] = v13;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:", v15, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (NSArray)allVisibleAnswers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[FBKDraftingController currentSnapshot](self, "currentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allQuestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__FBKDraftingController_allVisibleAnswers__block_invoke;
  v7[3] = &unk_24E157F50;
  v7[4] = self;
  objc_msgSend(v4, "ded_mapWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __42__FBKDraftingController_allVisibleAnswers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "formResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "answerForQuestion:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "question");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __42__FBKDraftingController_allVisibleAnswers__block_invoke_cold_1(v5, v7);

  }
  return v5;
}

- (void)setResponse:(id)a3 forQuestion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[FBKDraftingController formResponse](self, "formResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "answerForQuestion:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)objc_msgSend(v6, "copy");

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v8, "setValues:", v10);
  else
    objc_msgSend(v8, "setValue:", v10);

  -[FBKDraftingController didChangeAnswerToQuestion:](self, "didChangeAnswerToQuestion:", v11);
}

- (void)didChangeAnswerToQuestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDraftingController formResponse](self, "formResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "answerForQuestion:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543619;
    v13 = v6;
    v14 = 2113;
    v15 = v10;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "didChangeAnswerToQuestion Q: [%{public}@] A: [%{private}@]", (uint8_t *)&v12, 0x16u);

  }
  if (-[FBKDraftingController isLoading](self, "isLoading"))
  {
    Log_3();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBKDraftingController didChangeAnswerToQuestion:].cold.1(v4, v11);

  }
  else
  {
    -[FBKDraftingController setIsDirty:](self, "setIsDirty:", 1);
    -[FBKDraftingController updateVisibilityForChangedQuestion:](self, "updateVisibilityForChangedQuestion:", v4);
    -[FBKDraftingController sendSnapshotUpdate](self, "sendSnapshotUpdate");
  }

}

- (void)sendSnapshotUpdate
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  FBKDraftModelSnapshotDiff *v8;
  void *v9;
  void *v10;
  id v11;

  -[FBKDraftingController currentSnapshot](self, "currentSnapshot");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[FBKDraftingController newModelSnapshot](self, "newModelSnapshot");
  -[FBKDraftingController setCurrentSnapshot:](self, "setCurrentSnapshot:", v3);
  -[FBKDraftingController delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[FBKDraftingController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = -[FBKDraftModelSnapshotDiff initWithPreviousSnapshot:newSnapshot:]([FBKDraftModelSnapshotDiff alloc], "initWithPreviousSnapshot:newSnapshot:", v11, v3);
      -[FBKDraftingController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "draftingController:madeVisibilityUpdatesWithSnapshotDiff:", self, v8);

    }
  }
  -[FBKDraftingController diagnosticsController](self, "diagnosticsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reevaluateMatcherPredicates");

}

- (void)attachAnswersToQuestionsWithGivenData:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  Log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FBKDraftingController attachAnswersToQuestionsWithGivenData:].cold.1();

  _answerQuestions(self, v4, 0, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
  -[FBKDraftingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[FBKDraftingController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "draftingController:didChangeSnapshot:", self, v8);

  }
}

- (void)runResolvers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  int v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  _BYTE v62[18];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[FBKDraftingController formResponse](self, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bugForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "questionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v58;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v58 != v44)
          objc_enumerationMutation(obj);
        v46 = v6;
        v7 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v6);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v7, "questions");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v54 != v10)
                objc_enumerationMutation(v48);
              v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v12, "userAgentPopulate");
              v13 = objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                v14 = (void *)v13;
                +[FBKResolver resolverForQuestion:](FBKResolver, "resolverForQuestion:", v12);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                {
                  Log_3();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v12, "userAgentPopulate");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "role");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v62 = v17;
                    *(_WORD *)&v62[8] = 2112;
                    *(_QWORD *)&v62[10] = v18;
                    _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "evaluating question resolver [%@] for question [%@]", buf, 0x16u);

                  }
                  -[FBKDraftingController formResponse](self, "formResponse");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "answerForQuestion:", v12);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  -[FBKDraftingController dependencyGraph](self, "dependencyGraph");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FBKDraftingController formResponse](self, "formResponse");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v21, "visibilityForQuestion:inFormResponse:", v12, v22);

                  if ((!objc_msgSend(v12, "visible") || v23) && (objc_msgSend(v20, "resolved") & 1) == 0)
                  {
                    Log_3();
                    v24 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v12, "ID");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = objc_msgSend(v47, "intValue");
                      objc_msgSend(v12, "text");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v62 = v41;
                      *(_WORD *)&v62[4] = 2114;
                      *(_QWORD *)&v62[6] = v42;
                      _os_log_debug_impl(&dword_21D9A9000, v24, OS_LOG_TYPE_DEBUG, "Resolving question %d:%{public}@", buf, 0x12u);

                    }
                    objc_msgSend(v15, "run");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[FBKDraftingController formResponse](self, "formResponse");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "answerForQuestion:", v12);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v27, "setValue:", v25);
                    objc_msgSend(v27, "setResolved:", 1);

                  }
                }
              }
              objc_msgSend(v12, "choiceSetClientSideResolver");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v12, "choiceSetClientSideResolver");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "serverSideChoices");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[FBKDraftingController choiceSetResolverWithValue:givenChoices:](self, "choiceSetResolverWithValue:givenChoices:", v29, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "setChoiceSetResolver:", v31);
                objc_msgSend(v12, "choiceSetClientSideResolver");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "role");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                Log_3();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v12, "choiceSetClientSideResolver");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "role");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)v62 = v35;
                  *(_WORD *)&v62[8] = 2112;
                  *(_QWORD *)&v62[10] = v36;
                  _os_log_impl(&dword_21D9A9000, v34, OS_LOG_TYPE_INFO, "dispatching question set resolver [%@] for question [%@]", buf, 0x16u);

                }
                dispatch_get_global_queue(25, 0);
                v37 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __37__FBKDraftingController_runResolvers__block_invoke;
                block[3] = &unk_24E157F78;
                v50 = v32;
                v51 = v33;
                v52 = v31;
                v38 = v31;
                v39 = v33;
                v40 = v32;
                dispatch_async(v37, block);

              }
            }
            v9 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v9);
        }

        v6 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v45);
  }

}

uint64_t __37__FBKDraftingController_runResolvers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  Log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "evaluating choice set resolver [%@] for question [%@] in background", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "prefetchChoices");
}

- (id)choiceSetResolverWithValue:(id)a3 givenChoices:(id)a4
{
  id v5;
  FBKAppListResolver *v6;

  v5 = a4;
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("appTitlesBundles")))
    v6 = -[FBKAppListResolver initWithServerSideChoices:]([FBKAppListResolver alloc], "initWithServerSideChoices:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)firstVisibleInvalidQuestion
{
  FBKDraftingController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  id v43;
  void *v45;
  FBKDraftingController *obj;
  id obja;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v2 = self;
  v70 = *MEMORY[0x24BDAC8D0];
  -[FBKDraftingController invalidQuestionIDs](self, "invalidQuestionIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[FBKDraftingController cachedVisibleGroups](v2, "cachedVisibleGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v64;
    v45 = v6;
    obj = v2;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v64 != v50)
          objc_enumerationMutation(v6);
        v8 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v8, "questions");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v8, "questions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            -[FBKDraftingController cachedVisibleQuestions](v2, "cachedVisibleQuestions");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "ID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 && objc_msgSend(v15, "count"))
            {
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v48 = v15;
              v16 = v15;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v60;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v60 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                    objc_msgSend(v21, "ID");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v4, "containsObject:", v22);

                    if (v23)
                      objc_msgSend(v5, "addObject:", v21);
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
                }
                while (v18);
              }

              v6 = v45;
              v2 = obj;
              v15 = v48;
            }

          }
        }
      }
      v52 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v52);
  }

  if (!objc_msgSend(v5, "count"))
  {
    v24 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(v5, "count") != 1)
  {
    objc_msgSend(v5, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obja = v5;
    v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (!v51)
      goto LABEL_39;
    v49 = *(_QWORD *)v56;
    while (1)
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v26, "questionGroup");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sortOrder");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v28, "intValue");
        objc_msgSend(v24, "questionGroup");
        v29 = v24;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sortOrder");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "intValue");

        v24 = v29;
        if (v53 < v32)
          goto LABEL_36;
        objc_msgSend(v26, "questionGroup");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sortOrder");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "intValue");
        objc_msgSend(v29, "questionGroup");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sortOrder");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v24;
        v38 = objc_msgSend(v37, "intValue");

        if (v35 > v38)
        {
          v24 = v54;
          continue;
        }
        objc_msgSend(v26, "sortOrder");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "intValue");
        v24 = v54;
        objc_msgSend(v54, "sortOrder");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "intValue");

        if (v40 < v42)
        {
LABEL_36:
          v43 = v26;

          v24 = v43;
        }
      }
      v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (!v51)
      {
LABEL_39:

        goto LABEL_40;
      }
    }
  }
  objc_msgSend(v5, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v24;
}

- (BOOL)answer:(id)a3 isValidForQuestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isRequired"))
  {
    -[FBKDraftingController dependencyGraph](self, "dependencyGraph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "visibilityForQuestion:inFormResponse:", v7, v9))
    {
      objc_msgSend(v6, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = !_FBKAnswerIsBlank(v10);

    }
    else
    {
      LOBYTE(v11) = 1;
    }

  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (BOOL)validate:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v44;
  id v45;
  id obj;
  id obja;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[16];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  +[FBKTimeIntervals sharedInstance](FBKTimeIntervals, "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "didStartEvent:", 2);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 20);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[FBKDraftingController cachedVisibleQuestions](self, "cachedVisibleQuestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v50 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v66 != v48)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v62 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
              -[FBKDraftingController formResponse](self, "formResponse");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "answerForQuestion:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v13, "ID");
                v16 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v15, v16);
              }
              else
              {
                Log_3();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
                  -[FBKDraftingController validate:].cold.2((uint64_t)v71, (uint64_t)v13);
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
          }
          while (v10);
        }

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v50);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[FBKDraftingController formResponse](self, "formResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bugForm");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "questionGroups");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v19;
  v49 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v49)
  {
    obja = *(id *)v58;
    do
    {
      v20 = 0;
      do
      {
        if (*(id *)v58 != obja)
          objc_enumerationMutation(v45);
        v51 = v20;
        v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v20);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v21, "questions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v54;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v54 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
              if (objc_msgSend(v27, "answerType") != 5 && objc_msgSend(v27, "answerType") != 11)
              {
                objc_msgSend(v27, "ID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKey:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                v30 = -[FBKDraftingController answer:isValidForQuestion:](self, "answer:isValidForQuestion:", v29, v27);
                -[FBKDraftingController questionIDsInErrorState](self, "questionIDsInErrorState");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "ID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                  objc_msgSend(v31, "removeObject:", v32);
                else
                  objc_msgSend(v31, "addObject:", v32);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          }
          while (v24);
        }

        v20 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v49);
  }

  -[FBKDraftingController questionIDsInErrorState](self, "questionIDsInErrorState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_TITLE"), &stru_24E15EAF8, CFSTR("CommonStrings"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDD0FC8]);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_MESSAGE"), &stru_24E15EAF8, CFSTR("CommonStrings"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v39, *MEMORY[0x24BDD0FF0]);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], -4, v35);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    Log_3();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[FBKDraftingController validate:].cold.1(self, v40);

  }
  v41 = (id)objc_msgSend(v44, "didEndEvent:", 2);

  return v34 == 0;
}

- (void)preemptivelyRemoveQuestionFromErrorStateWithQuestion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKDraftingController questionIDsInErrorState](self, "questionIDsInErrorState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v5);
}

- (id)invalidQuestionIDs
{
  void *v2;
  void *v3;

  -[FBKDraftingController questionIDsInErrorState](self, "questionIDsInErrorState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSArray)unansweredRequiredModalQuestions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKDraftingController visibleQuestionGroups](self, "visibleQuestionGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        -[FBKDraftingController visibleQuestionsForGroup:](self, "visibleQuestionsForGroup:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __57__FBKDraftingController_unansweredRequiredModalQuestions__block_invoke;
        v14[3] = &unk_24E157FA0;
        v14[4] = self;
        objc_msgSend(v9, "ded_selectItemsPassingTest:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

uint64_t __57__FBKDraftingController_unansweredRequiredModalQuestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "answerType") == 11)
  {
    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerForQuestion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(*(id *)(a1 + 32), "answer:isValidForQuestion:", v5, v3) ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)questionsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKDraftingController cachedDiffableSections](self, "cachedDiffableSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visibleQuestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateSnapshotIdentifiers:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  _TtC12FeedbackCore31FBKQuestionGroupDiffableSection *v18;
  void *v19;
  void *v20;
  id obj;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[FBKDraftingController visibleQuestionGroups](self, "visibleQuestionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[FBKDraftingController visibleQuestionGroups](self, "visibleQuestionGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v26 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[FBKDraftingController visibleQuestionsForGroup:](self, "visibleQuestionsForGroup:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __53__FBKDraftingController_generateSnapshotIdentifiers___block_invoke;
        v27[3] = &unk_24E157FA0;
        v27[4] = self;
        objc_msgSend(v10, "ded_selectItemsPassingTest:", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v12 = [_TtC12FeedbackCore31FBKQuestionGroupDiffableSection alloc];
          -[FBKDraftingController formResponse](self, "formResponse");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKDraftingController delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            v15 = -[FBKDraftingController useInlineChoices](self, "useInlineChoices");
          else
            v15 = 0;
          if (a3)
          {
            -[FBKDraftingController invalidQuestionIDs](self, "invalidQuestionIDs");
            v16 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = objc_opt_new();
          }
          v17 = (void *)v16;
          v18 = -[FBKQuestionGroupDiffableSection initWithQuestionGroup:visibleQuestions:formResponse:useInlineChoices:questionIDsInErrorState:](v12, "initWithQuestionGroup:visibleQuestions:formResponse:useInlineChoices:questionIDsInErrorState:", v9, v11, v13, v15, v16);

          objc_msgSend(v9, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v19);

          objc_msgSend(v24, "addObject:", v18);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  -[FBKDraftingController setCachedDiffableSections:](self, "setCachedDiffableSections:", v25);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __53__FBKDraftingController_generateSnapshotIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "answerType") == 11)
  {
    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerForQuestion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAnswered") ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)questionChoiceForSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[FBKDraftingController cachedDiffableSections](self, "cachedDiffableSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "questionOrChoiceWithRowIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)visibleQuestionForSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKDraftingController cachedDiffableSections](self, "cachedDiffableSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "questionWithRowIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)questionForVisibleChoice:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKDraftingController cachedDiffableSections](self, "cachedDiffableSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "questionWithChoice:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)questionGroupForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKDraftingController cachedDiffableSections](self, "cachedDiffableSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "questionGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifierForVisibleQuestion:(id)a3 hasAttemptedSubmission:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[FBKDraftingController formResponse](self, "formResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    -[FBKDraftingController invalidQuestionIDs](self, "invalidQuestionIDs");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  +[FBKQuestionGroupDiffableSection identifierForQuestion:formResponse:questionIDsInErrorState:](_TtC12FeedbackCore31FBKQuestionGroupDiffableSection, "identifierForQuestion:formResponse:questionIDsInErrorState:", v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateUIAfterAutoFill
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, v0, v1, "Unanswered questions %ld", v2);
  OUTLINED_FUNCTION_7();
}

uint64_t __46__FBKDraftingController_updateUIAfterAutoFill__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "automaticallyFillInAllAnswers");
}

- (void)automaticallyFillInAllAnswers
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[FBKDraftingController visibleQuestionGroups](self, "visibleQuestionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v30)
  {
    v4 = *(_QWORD *)v37;
    v31 = v3;
    v29 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v37 != v4)
          objc_enumerationMutation(v3);
        v6 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        -[FBKDraftingController visibleQuestionsForGroup:](self, "visibleQuestionsForGroup:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v33 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              -[FBKDraftingController formResponse](self, "formResponse");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "answerForQuestion:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (FBKAnswerIsBlank(v15))
              {
                v16 = objc_msgSend(v12, "isAnswerableByAutoFill");

                if (v16)
                {
                  if (!objc_msgSend(v12, "answerType") || objc_msgSend(v12, "answerType") == 1)
                  {
                    v19 = objc_alloc_init(MEMORY[0x24BDD1500]);
                    objc_msgSend(v19, "setDateStyle:", 1);
                    objc_msgSend(v19, "setTimeStyle:", 2);
                    v25 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(MEMORY[0x24BDBCE60], "date");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "stringFromDate:", v26);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ FBK Auto Fill"), v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    -[FBKDraftingController setResponse:forQuestion:](self, "setResponse:forQuestion:", v28, v12);

                    -[FBKDraftingController updateUIAfterAutoFill](self, "updateUIAfterAutoFill");
                    v3 = v31;
LABEL_30:

                    goto LABEL_31;
                  }
                  if (objc_msgSend(v12, "answerType") == 4
                    || objc_msgSend(v12, "answerType") == 2
                    || objc_msgSend(v12, "answerType") == 3)
                  {
                    objc_msgSend(v12, "allChoices");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isPrompt = NO"));
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "filteredArrayUsingPredicate:", v18);
                    v19 = (id)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v12, "role");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v18) = objc_msgSend(v20, "isEqualToString:", CFSTR(":area"));

                    v3 = v31;
                    if (!(_DWORD)v18)
                      goto LABEL_27;
                    objc_msgSend(v19, "ded_selectItemsPassingTest:", &__block_literal_global_16);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "firstObject");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "valueForKey:", CFSTR("value"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v23)
                    {
LABEL_27:
                      objc_msgSend(v19, "firstObject");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "valueForKey:", CFSTR("value"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    -[FBKDraftingController setResponse:forQuestion:](self, "setResponse:forQuestion:", v23, v12);
                    -[FBKDraftingController updateUIAfterAutoFill](self, "updateUIAfterAutoFill");

                    goto LABEL_30;
                  }
                }
              }
              else
              {

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v9)
              continue;
            break;
          }
        }

        v3 = v31;
        v4 = v29;
      }
      v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v30);
  }
LABEL_31:

}

uint64_t __54__FBKDraftingController_automaticallyFillInAllAnswers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Feedback Assistant"));

  return v3;
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
  objc_storeStrong((id *)&self->_formResponse, a3);
}

- (FBKBugFormStub)formStub
{
  return self->_formStub;
}

- (void)setFormStub:(id)a3
{
  objc_storeStrong((id *)&self->_formStub, a3);
}

- (FBKDraftingDelegate)delegate
{
  return (FBKDraftingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBKDeviceDiagnosticsController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (void)setDiagnosticsController:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsController, a3);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (BOOL)isSubmitting
{
  return self->_isSubmitting;
}

- (void)setIsSubmitting:(BOOL)a3
{
  self->_isSubmitting = a3;
}

- (BOOL)useInlineChoices
{
  return self->_useInlineChoices;
}

- (void)setUseInlineChoices:(BOOL)a3
{
  self->_useInlineChoices = a3;
}

- (FBKDraftModelSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (FBKQuestionDependencyGraph)dependencyGraph
{
  return (FBKQuestionDependencyGraph *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDependencyGraph:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (FBKTeam)team
{
  return self->_team;
}

- (void)setTeam:(id)a3
{
  objc_storeStrong((id *)&self->_team, a3);
}

- (NSDictionary)cachedDiffableSections
{
  return self->_cachedDiffableSections;
}

- (void)setCachedDiffableSections:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDiffableSections, a3);
}

- (NSArray)cachedVisibleGroups
{
  return self->_cachedVisibleGroups;
}

- (void)setCachedVisibleGroups:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVisibleGroups, a3);
}

- (NSMutableDictionary)cachedVisibleQuestions
{
  return self->_cachedVisibleQuestions;
}

- (void)setCachedVisibleQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVisibleQuestions, a3);
}

- (NSMutableSet)questionIDsInErrorState
{
  return self->_questionIDsInErrorState;
}

- (void)setQuestionIDsInErrorState:(id)a3
{
  objc_storeStrong((id *)&self->_questionIDsInErrorState, a3);
}

- (BOOL)spamDebugLogs
{
  return self->_spamDebugLogs;
}

- (void)setSpamDebugLogs:(BOOL)a3
{
  self->_spamDebugLogs = a3;
}

- (FBKData)FBKData
{
  return (FBKData *)objc_loadWeakRetained((id *)&self->_FBKData);
}

- (void)setFBKData:(id)a3
{
  objc_storeWeak((id *)&self->_FBKData, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_FBKData);
  objc_storeStrong((id *)&self->_questionIDsInErrorState, 0);
  objc_storeStrong((id *)&self->_cachedVisibleQuestions, 0);
  objc_storeStrong((id *)&self->_cachedVisibleGroups, 0);
  objc_storeStrong((id *)&self->_cachedDiffableSections, 0);
  objc_storeStrong((id *)&self->_team, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formStub, 0);
  objc_storeStrong((id *)&self->_formResponse, 0);
}

- (void)loadResponseForFeedbackObject:withTeam:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v2 = 2080;
  v3 = "-[FBKDraftingController loadResponseForFeedbackObject:withTeam:]";
  _os_log_error_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_ERROR, "Attempted to load object %{public}@, but %s doesn't support it.", v1, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)_loadNewResponseForBugForm:(uint64_t)a3 orBugFormStub:withTeam:requestPlugIns:appToken:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5(&dword_21D9A9000, a1, a3, "no form or stub, cannot start draft", v3);
  OUTLINED_FUNCTION_1();
}

- (void)isQuestionVisible:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, a2, v4, "group is not visible for question [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

void __42__FBKDraftingController_allVisibleAnswers__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "intValue");
  _os_log_fault_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_FAULT, "Answer.question is nil for Answer [%d]", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_7();
}

- (void)didChangeAnswerToQuestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "updated question [%ld] while loading", v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

- (void)attachAnswersToQuestionsWithGivenData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, v0, v1, "Will pre attach answers %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)validate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "questionIDsInErrorState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, a2, v4, "Validation found %ld missing answers", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)validate:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _DWORD *v3;
  uint8_t *v4;
  void *v5;
  int v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");
  *(_DWORD *)v4 = 67109120;
  *v3 = v6;
  _os_log_fault_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_FAULT, "No answer for question [%u] in validate:", v4, 8u);

  OUTLINED_FUNCTION_8();
}

@end
