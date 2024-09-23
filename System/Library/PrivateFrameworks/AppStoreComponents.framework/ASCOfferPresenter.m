@implementation ASCOfferPresenter

- (ASCOfferPresenter)initWithView:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  ASCOfferPresenter *v8;
  ASCOfferPresenter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASCOfferPresenter;
  v8 = -[ASCOfferPresenter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    objc_storeStrong((id *)&v9->_mostRecentAppState, CFSTR("unknown"));
  }

  return v9;
}

- (ASCOfferPresenter)initWithView:(id)a3
{
  id v4;
  void *v5;
  ASCOfferPresenter *v6;

  v4 = a3;
  +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCOfferPresenter initWithView:context:](self, "initWithView:context:", v4, v5);

  return v6;
}

- (void)setOfferStateMachine:(id)a3
{
  ASCAppOfferStateMachine **p_offerStateMachine;
  ASCAppOfferStateMachine *v6;
  char v7;
  ASCAppOfferStateMachine *v8;

  v8 = (ASCAppOfferStateMachine *)a3;
  p_offerStateMachine = &self->_offerStateMachine;
  v6 = self->_offerStateMachine;
  if (v8 && v6)
  {
    v7 = -[ASCAppOfferStateMachine isEqual:](v6, "isEqual:", v8);

    if ((v7 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

    if (v6 == v8)
      goto LABEL_10;
  }
  if (*p_offerStateMachine)
    -[ASCAppOfferStateMachine removeDelegate:](*p_offerStateMachine, "removeDelegate:", self);
  objc_storeStrong((id *)&self->_offerStateMachine, a3);
  if (*p_offerStateMachine)
    -[ASCAppOfferStateMachine addDelegate:](*p_offerStateMachine, "addDelegate:", self);
LABEL_10:

}

- (void)setOffer:(id)a3
{
  ASCOffer *v4;
  ASCOffer *offer;
  ASCOffer *v6;
  ASCOffer *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  ASCOffer *v13;
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
  ASCOffer *v25;

  v4 = (ASCOffer *)a3;
  offer = self->_offer;
  v25 = v4;
  if (v4 && offer)
  {
    if ((-[ASCOffer isEqual:](offer, "isEqual:", v4) & 1) != 0)
      goto LABEL_14;
  }
  else if (offer == v4)
  {
    goto LABEL_14;
  }
  -[ASCOfferPresenter setMostRecentAppState:](self, "setMostRecentAppState:", CFSTR("unknown"));
  v6 = (ASCOffer *)-[ASCOffer copyWithZone:](v25, "copyWithZone:", 0);
  v7 = self->_offer;
  self->_offer = v6;

  -[ASCOfferPresenter clearConfirmForNewStateIfNeeded](self, "clearConfirmForNewStateIfNeeded");
  -[ASCOfferPresenter view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOfferEnabled:", 1);

  v9 = -[ASCOffer flags](v25, "flags");
  -[ASCOfferPresenter view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 8) != 0)
    v12 = CFSTR(" ");
  else
    v12 = 0;
  objc_msgSend(v10, "setOfferStatus:", v12);

  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v25;
      -[ASCOfferPresenter setOfferStateMachine:](self, "setOfferStateMachine:", 0);
      -[ASCOfferPresenter view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOffer action](v13, "action");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setOfferInteractive:", v15 != 0);

      -[ASCOfferPresenter view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOffer metadata](v13, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOfferMetadata:", v17);
    }
    else
    {
      -[ASCOfferPresenter view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setOfferInteractive:", 1);

      -[ASCOfferPresenter context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appOfferStateCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stateMachineForOffer:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferPresenter setOfferStateMachine:](self, "setOfferStateMachine:", v24);

    }
  }
  else
  {
    -[ASCOfferPresenter view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOfferInteractive:", 1);

    -[ASCOfferPresenter view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferMetadata emptyMetadata](ASCOfferMetadata, "emptyMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOfferMetadata:", v20);

    -[ASCOfferPresenter setOfferStateMachine:](self, "setOfferStateMachine:", 0);
  }
LABEL_14:

}

- (BOOL)clearConfirmForNewStateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ASCOfferPresenter savedStateForConfirm](self, "savedStateForConfirm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCOfferPresenter savedStateForConfirm](self, "savedStateForConfirm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCOfferPresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOfferMetadata:", v5);

    -[ASCOfferPresenter savedStateForConfirm](self, "savedStateForConfirm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCOfferPresenter view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOfferTheme:", v8);

    -[ASCOfferPresenter view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endOfferModalState");

    -[ASCOfferPresenter setSavedStateForConfirm:](self, "setSavedStateForConfirm:", 0);
  }
  return v3 != 0;
}

- (BOOL)confirmOfferActionIfNeeded
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;

  if (-[ASCOfferPresenter clearConfirmForNewStateIfNeeded](self, "clearConfirmForNewStateIfNeeded"))
    return 0;
  -[ASCOfferPresenter offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confirmation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (-[ASCOfferPresenter offer](self, "offer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "flags"),
        v7,
        (v8 & 4) != 0))
  {
    v3 = 0;
  }
  else
  {
    -[ASCOfferPresenter mostRecentAppState](self, "mostRecentAppState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("buyable")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("unknown")))
    {
      -[ASCOfferPresenter view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "saveOfferState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v11 != 0;
      if (v11)
      {
        objc_msgSend(v11, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isText"))
        {
          v13 = v12;
          -[ASCOfferPresenter view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subtitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          +[ASCOfferMetadata textMetadataWithTitle:subtitle:](ASCOfferMetadata, "textMetadataWithTitle:subtitle:", v6, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOfferMetadata:", v16);

        }
        else
        {
          -[ASCOfferPresenter view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[ASCOfferMetadata textMetadataWithTitle:subtitle:](ASCOfferMetadata, "textMetadataWithTitle:subtitle:", v6, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOfferMetadata:", v15);
        }

        -[ASCOfferPresenter view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "theme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASCOfferTheme confirmationForTheme:](ASCOfferTheme, "confirmationForTheme:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setOfferTheme:", v19);

        objc_initWeak(&location, self);
        -[ASCOfferPresenter view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __47__ASCOfferPresenter_confirmOfferActionIfNeeded__block_invoke;
        v25 = &unk_1E7560470;
        objc_copyWeak(&v26, &location);
        objc_msgSend(v20, "beginOfferModalStateWithCancelBlock:", &v22);

        -[ASCOfferPresenter setSavedStateForConfirm:](self, "setSavedStateForConfirm:", v11, v22, v23, v24, v25);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[ASCOfferPresenter confirmOfferActionIfNeeded].cold.1(self);
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void __47__ASCOfferPresenter_confirmOfferActionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearConfirmForNewStateIfNeeded");

}

- (void)performOfferAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void (**v19)(void);
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  -[ASCOfferPresenter offerStateMachine](self, "offerStateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!-[ASCOfferPresenter confirmOfferActionIfNeeded](self, "confirmOfferActionIfNeeded"))
    {
      -[ASCOfferPresenter view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferInteractive:", 0);

      objc_initWeak(&location, self);
      v5 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke;
      v25[3] = &unk_1E75615D8;
      objc_copyWeak(&v27, &location);
      v26 = v3;
      v6 = (void *)MEMORY[0x1BCCFE944](v25);
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_4;
      v22[3] = &unk_1E7561628;
      objc_copyWeak(&v24, &location);
      v7 = v6;
      v23 = v7;
      v8 = (void *)MEMORY[0x1BCCFE944](v22);
      -[ASCOfferPresenter observer](self, "observer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[ASCOfferPresenter mostRecentAppState](self, "mostRecentAppState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCOfferPresenter observer](self, "observer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCOfferPresenter offer](self, "offer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v5;
        v20[1] = 3221225472;
        v20[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_9;
        v20[3] = &unk_1E7560ED8;
        v21 = v8;
        objc_msgSend(v11, "offerPresenterPreprocessOffer:inState:completionBlock:", v12, v10, v20);

      }
      else if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v7[2](v7);
      }
      else
      {
        dispatch_async(MEMORY[0x1E0C80D38], v7);
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[ASCOfferPresenter offer](self, "offer");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[ASCOfferPresenter offer](self, "offer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[ASCOfferPresenter offer](self, "offer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "action");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "action");
          v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v19[2]();

        }
      }
    }
  }

}

void __39__ASCOfferPresenter_performOfferAction__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  ASCMetricsActivity *v4;
  ASCOfferContext *v5;
  void *v6;
  void *v7;
  void *v8;
  ASCMetricsActivity *v9;
  ASCOfferContext *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ASCOfferContext *v15;
  ASCMetricsActivity *v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateTemporaryStateForcingUpdate:", 0);
    v4 = objc_alloc_init(ASCMetricsActivity);
    v5 = objc_alloc_init(ASCOfferContext);
    objc_msgSend(WeakRetained, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "offer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mostRecentAppState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16 = v4;
    objc_msgSend(v6, "offerPresenterWillPerformActionOfOffer:inState:withActivity:inContext:", v7, v8, &v16, &v15);
    v9 = v16;

    v10 = v15;
    objc_msgSend(*(id *)(a1 + 32), "performActionWithActivity:inContext:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_2;
    v12[3] = &unk_1E7561600;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v11, "addFinishBlock:", v12);

    objc_destroyWeak(&v14);
  }

}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_3;
  v2[3] = &unk_1E75615D8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "offerStateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOfferInteractive:", 1);

  }
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __39__ASCOfferPresenter_performOfferAction__block_invoke_4_cold_1(v3);
      objc_msgSend(WeakRetained, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOfferInteractive:", 1);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_2_11;
    v4[3] = &unk_1E7560EB0;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __39__ASCOfferPresenter_performOfferAction__block_invoke_2_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)viewAppForAppDistributionOffer
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  -[ASCOfferPresenter offer](self, "offer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ASCOfferPresenter offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[ASCOfferPresenter offer](self, "offer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferPresenter offerStateMachine](self, "offerStateMachine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewAppForAppDistributionOffer:", v7);

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 isActionable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = a4;
  -[ASCOfferPresenter clearConfirmForNewStateIfNeeded](self, "clearConfirmForNewStateIfNeeded");
  -[ASCOfferPresenter view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOfferEnabled:", v5);

  -[ASCOfferPresenter view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOfferMetadata:", v8);

  -[ASCOfferPresenter mostRecentAppState](self, "mostRecentAppState");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 && v11)
  {
    v12 = objc_msgSend(v14, "isEqual:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v11 != v14)
  {
LABEL_6:
    -[ASCOfferPresenter observer](self, "observer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "offerPresenterDidObserveChangeToState:", v14);

    -[ASCOfferPresenter setMostRecentAppState:](self, "setMostRecentAppState:", v14);
  }
LABEL_7:

}

- (void)offerStatusTextDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCOfferPresenter view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOfferStatus:", v4);

}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCOfferPresenter offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, CFSTR("offer"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (ASCOfferPresenterObserver)observer
{
  return (ASCOfferPresenterObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (ASCOfferPresenterView)view
{
  return (ASCOfferPresenterView *)objc_loadWeakRetained((id *)&self->_view);
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCAppOfferStateMachine)offerStateMachine
{
  return self->_offerStateMachine;
}

- (NSString)mostRecentAppState
{
  return self->_mostRecentAppState;
}

- (void)setMostRecentAppState:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentAppState, a3);
}

- (ASCOfferPresenterViewState)savedStateForConfirm
{
  return self->_savedStateForConfirm;
}

- (void)setSavedStateForConfirm:(id)a3
{
  objc_storeStrong((id *)&self->_savedStateForConfirm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedStateForConfirm, 0);
  objc_storeStrong((id *)&self->_mostRecentAppState, 0);
  objc_storeStrong((id *)&self->_offerStateMachine, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)confirmOfferActionIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, MEMORY[0x1E0C81028], v2, "Offer presenter view %@ did not provide offer state for two phase buy", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_4_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, MEMORY[0x1E0C81028], v2, "Offer preprocessing failed with error: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4();
}

@end
