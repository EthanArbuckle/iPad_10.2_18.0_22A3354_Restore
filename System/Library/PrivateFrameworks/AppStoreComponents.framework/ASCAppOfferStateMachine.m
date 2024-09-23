@implementation ASCAppOfferStateMachine

- (ASCAppOfferStateMachine)initWithOffer:(id)a3 stateCenter:(id)a4
{
  id v6;
  id v7;
  ASCAppOfferStateMachine *v8;
  uint64_t v9;
  ASCOffer *offer;
  NSMutableArray *v11;
  NSMutableArray *delegates;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCAppOfferStateMachine;
  v8 = -[ASCAppOfferStateMachine init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    offer = v8->_offer;
    v8->_offer = (ASCOffer *)v9;

    objc_storeWeak((id *)&v8->_stateCenter, v7);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    delegates = v8->_delegates;
    v8->_delegates = v11;

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint8_t buf[4];
  ASCAppOfferStateMachine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[ASCAppOfferStateMachine stateCenter](self, "stateCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ASCAppOfferStateMachine offer](self, "offer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopObservingStateForOffer:", v4);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ is being destroyed on background thread", buf, 0xCu);
    }
    -[ASCAppOfferStateMachine stateCenter](self, "stateCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppOfferStateMachine offer](self, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__ASCAppOfferStateMachine_dealloc__block_invoke;
    block[3] = &unk_1E75605A0;
    v9 = v5;
    v10 = v6;
    v4 = v6;
    v3 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v7.receiver = self;
  v7.super_class = (Class)ASCAppOfferStateMachine;
  -[ASCAppOfferStateMachine dealloc](&v7, sel_dealloc);
}

uint64_t __34__ASCAppOfferStateMachine_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingStateForOffer:", *(_QWORD *)(a1 + 40));
}

- (void)addDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithWeakObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOfferStateMachine delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    -[ASCAppOfferStateMachine delegates](self, "delegates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

    -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "offerStateDidChange:withMetadata:isActionable:", v11, v13, objc_msgSend(v14, "isActionable"));

    }
    -[ASCAppOfferStateMachine mostRecentStatusText](self, "mostRecentStatusText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[ASCAppOfferStateMachine mostRecentStatusText](self, "mostRecentStatusText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "offerStatusTextDidChange:", v16);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCAppOfferStateMachine addDelegate:].cold.1();
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithWeakObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOfferStateMachine delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ASCAppOfferStateMachine delegates](self, "delegates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", v7);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[ASCAppOfferStateMachine removeDelegate:].cold.1();
  }

}

- (void)enumerateDelegatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[ASCAppOfferStateMachine delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__ASCAppOfferStateMachine_enumerateDelegatesUsingBlock___block_invoke;
  v10[3] = &unk_1E75605C8;
  v11 = v5;
  v12 = v4;
  v7 = v4;
  v9 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  -[ASCAppOfferStateMachine delegates](self, "delegates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsAtIndexes:", v9);

}

void __56__ASCAppOfferStateMachine_enumerateDelegatesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "weakObjectValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);

}

- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 flags:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ASCAppOfferSavedState *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v24 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOfferStateMachine overrideState](self, "overrideState");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ASCAppOfferStateMachine overrideState](self, "overrideState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", v13))
    {
      -[ASCAppOfferStateMachine overrideState](self, "overrideState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v15))
      {
        -[ASCAppOfferStateMachine overrideState](self, "overrideState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v16, "flags");

        if (v23 == a5)
          goto LABEL_9;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  v17 = -[ASCAppOfferSavedState initWithState:metadata:flags:]([ASCAppOfferSavedState alloc], "initWithState:metadata:flags:", v24, v8, a5);
  -[ASCAppOfferStateMachine setMostRecentState:](self, "setMostRecentState:", v17);

LABEL_9:
  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isLoadingFullState");

  if (!v19 || !v9)
  {
    -[ASCAppOfferStateMachine overrideState](self, "overrideState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      -[ASCAppOfferStateMachine overrideState](self, "overrideState");
    else
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__ASCAppOfferStateMachine_offerStateDidChange_withMetadata_flags___block_invoke;
    v25[3] = &unk_1E75605F0;
    v26 = v21;
    v22 = v21;
    -[ASCAppOfferStateMachine enumerateDelegatesUsingBlock:](self, "enumerateDelegatesUsingBlock:", v25);

  }
}

void __66__ASCAppOfferStateMachine_offerStateDidChange_withMetadata_flags___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "state");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offerStateDidChange:withMetadata:isActionable:", v6, v5, objc_msgSend(*(id *)(a1 + 32), "isActionable"));

}

- (void)offerStatusTextDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateMachine setMostRecentStatusText:](self, "setMostRecentStatusText:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ASCAppOfferStateMachine_offerStatusTextDidChange___block_invoke;
  v6[3] = &unk_1E75605F0;
  v7 = v4;
  v5 = v4;
  -[ASCAppOfferStateMachine enumerateDelegatesUsingBlock:](self, "enumerateDelegatesUsingBlock:", v6);

}

uint64_t __52__ASCAppOfferStateMachine_offerStatusTextDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offerStatusTextDidChange:", *(_QWORD *)(a1 + 32));
}

- (id)performActionWithActivity:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[ASCAppOfferStateMachine stateCenter](self, "stateCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppOfferStateMachine offer](self, "offer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionOfOffer:withActivity:inContext:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAppOfferStateMachine stateCenter](self, "stateCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewAppForAppDistributionOffer:", v4);

}

- (void)installTemporaryWaitingState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  ASCAppOfferSavedState *v11;
  id v12;

  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("openable")))
    goto LABEL_6;
  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("waiting")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:

    return;
  }
  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("installing")) & 1) != 0)
  {

    goto LABEL_5;
  }
  -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("installed"));

  if ((v10 & 1) == 0)
  {
    +[ASCOfferMetadata indeterminateProgressMetadata](ASCOfferMetadata, "indeterminateProgressMetadata");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[ASCAppOfferSavedState initWithState:metadata:flags:]([ASCAppOfferSavedState alloc], "initWithState:metadata:flags:", CFSTR("waiting"), v12, 0);
    -[ASCAppOfferStateMachine setOverrideState:](self, "setOverrideState:", v11);

    -[ASCAppOfferStateMachine offerStateDidChange:withMetadata:flags:](self, "offerStateDidChange:withMetadata:flags:", CFSTR("waiting"), v12, 0);
    goto LABEL_7;
  }
}

- (void)invalidateTemporaryStateForcingUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[ASCAppOfferStateMachine setOverrideState:](self, "setOverrideState:", 0);
  if (v3)
  {
    -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppOfferStateMachine mostRecentState](self, "mostRecentState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppOfferStateMachine offerStateDidChange:withMetadata:flags:](self, "offerStateDidChange:withMetadata:flags:", v6, v8, objc_msgSend(v9, "flags"));

    }
  }
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (ASCAppOfferStateCenter)stateCenter
{
  return (ASCAppOfferStateCenter *)objc_loadWeakRetained((id *)&self->_stateCenter);
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (ASCAppOfferSavedState)mostRecentState
{
  return self->_mostRecentState;
}

- (void)setMostRecentState:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentState, a3);
}

- (NSString)mostRecentStatusText
{
  return self->_mostRecentStatusText;
}

- (void)setMostRecentStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ASCAppOfferSavedState)overrideState
{
  return self->_overrideState;
}

- (void)setOverrideState:(id)a3
{
  objc_storeStrong((id *)&self->_overrideState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_mostRecentStatusText, 0);
  objc_storeStrong((id *)&self->_mostRecentState, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_destroyWeak((id *)&self->_stateCenter);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)addDelegate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BCB7B000, MEMORY[0x1E0C81028], v0, "%@ added delegate %@", v1, v2, v3, v4, v5);
}

- (void)removeDelegate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BCB7B000, MEMORY[0x1E0C81028], v0, "%@ removed delegate %@", v1, v2, v3, v4, v5);
}

@end
