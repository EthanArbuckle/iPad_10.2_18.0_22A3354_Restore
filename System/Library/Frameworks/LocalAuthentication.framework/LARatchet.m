@implementation LARatchet

- (LARatchet)initWithIdentifier:(id)a3
{
  id v5;
  LARatchet *v6;
  LARatchet *v7;
  uint64_t v8;
  LARatchetManager *ratchetManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LARatchet;
  v6 = -[LARatchet init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    +[LARatchetManager sharedInstance](LARatchetManager, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    ratchetManager = v7->_ratchetManager;
    v7->_ratchetManager = (LARatchetManager *)v8;

  }
  return v7;
}

- (void)armWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  LAContext *v9;
  LARatchetManager *ratchetManager;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_msgSend(WeakRetained, "checkContextValidWithError:", 0) & 1) == 0)
  {
    v9 = objc_alloc_init(LAContext);

    objc_storeWeak((id *)&self->_context, v9);
    WeakRetained = v9;
  }
  ratchetManager = self->_ratchetManager;
  -[LARatchet identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__LARatchet_armWithOptions_completion___block_invoke;
  v14[3] = &unk_1E7079328;
  v15 = WeakRetained;
  v16 = v6;
  v12 = WeakRetained;
  v13 = v6;
  -[LARatchetManager performArmRequestWithIdentifier:context:options:completion:](ratchetManager, "performArmRequestWithIdentifier:context:options:completion:", v11, v12, v7, v14);

}

uint64_t __39__LARatchet_armWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancelWithReason:(id)a3 completion:(id)a4
{
  LAContext **p_context;
  id v7;
  id v8;
  id WeakRetained;
  LARatchetManager *ratchetManager;
  id v11;

  p_context = &self->_context;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "invalidate");

  ratchetManager = self->_ratchetManager;
  -[LARatchet identifier](self, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[LARatchetManager cancelArmRequestWithIdentifier:reason:completion:](ratchetManager, "cancelArmRequestWithIdentifier:reason:completion:", v11, v8, v7);

}

- (void)stateWithCompletion:(id)a3
{
  LARatchetManager *ratchetManager;
  LAContext **p_context;
  id v5;
  id WeakRetained;

  ratchetManager = self->_ratchetManager;
  p_context = &self->_context;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  -[LARatchetManager stateInContext:completion:](ratchetManager, "stateInContext:completion:", WeakRetained, v5);

}

- (void)addObserver:(id)a3
{
  -[LARatchetManager addObserver:](self->_ratchetManager, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[LARatchetManager removeObserver:](self->_ratchetManager, "removeObserver:", a3);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_ratchetManager, 0);
}

@end
