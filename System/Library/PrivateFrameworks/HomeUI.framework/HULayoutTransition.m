@implementation HULayoutTransition

- (HULayoutTransition)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithView_setupBlock_transitionBlock_completionBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULayoutTransition.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULayoutTransition init]",
    v5);

  return 0;
}

- (HULayoutTransition)initWithView:(id)a3 setupBlock:(id)a4 transitionBlock:(id)a5 completionBlock:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HULayoutTransition *v16;
  HULayoutTransition *v17;
  void *v18;
  id setupBlock;
  void *v20;
  id transitionBlock;
  void *v22;
  id completionBlock;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULayoutTransition.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setupBlock"));

  }
  v26.receiver = self;
  v26.super_class = (Class)HULayoutTransition;
  v16 = -[HULayoutTransition init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_view, a3);
    v18 = _Block_copy(v13);
    setupBlock = v17->_setupBlock;
    v17->_setupBlock = v18;

    v20 = _Block_copy(v14);
    transitionBlock = v17->_transitionBlock;
    v17->_transitionBlock = v20;

    v22 = _Block_copy(v15);
    completionBlock = v17->_completionBlock;
    v17->_completionBlock = v22;

    v17->_phase = 0;
  }

  return v17;
}

- (void)setupTransitionWithFromState:(id)a3 toState:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (-[HULayoutTransition phase](self, "phase"))
  {
    NSLog(CFSTR("Attempting to setup a transition that has already been setup!"));
  }
  else
  {
    -[HULayoutTransition setFromState:](self, "setFromState:", v8);
    -[HULayoutTransition setToState:](self, "setToState:", v6);
    -[HULayoutTransition setPhase:](self, "setPhase:", 1);
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HULayoutTransition_setupTransitionWithFromState_toState___block_invoke;
    v9[3] = &unk_1E6F4E020;
    v9[4] = self;
    v10 = v8;
    v11 = v6;
    objc_msgSend(v7, "performWithoutAnimation:", v9);

  }
}

void __59__HULayoutTransition_setupTransitionWithFromState_toState___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setupBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setupBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateConstraintsIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)executeTransition
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[HULayoutTransition phase](self, "phase") == 1)
  {
    -[HULayoutTransition setPhase:](self, "setPhase:", 2);
    -[HULayoutTransition transitionBlock](self, "transitionBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HULayoutTransition fromState](self, "fromState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULayoutTransition toState](self, "toState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v3)[2](v3, v4, v5);

    -[HULayoutTransition view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateConstraintsIfNeeded");

    -[HULayoutTransition view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
  else
  {
    NSLog(CFSTR("Attempting to execute a transition that is either not setup or already running. Phase: %lu"), -[HULayoutTransition phase](self, "phase"));
  }
}

- (void)completeTransition
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *);

  if (-[HULayoutTransition phase](self, "phase") == 2)
  {
    -[HULayoutTransition setPhase:](self, "setPhase:", 3);
    -[HULayoutTransition completionBlock](self, "completionBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HULayoutTransition completionBlock](self, "completionBlock");
      v6 = (void (**)(id, void *, void *))objc_claimAutoreleasedReturnValue();
      -[HULayoutTransition fromState](self, "fromState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULayoutTransition toState](self, "toState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v4, v5);

    }
  }
  else
  {
    NSLog(CFSTR("Attempting to complete a transition that is not running. Phase: %lu"), -[HULayoutTransition phase](self, "phase"));
  }
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (UIView)view
{
  return self->_view;
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)fromState
{
  return self->_fromState;
}

- (void)setFromState:(id)a3
{
  objc_storeStrong(&self->_fromState, a3);
}

- (id)toState
{
  return self->_toState;
}

- (void)setToState:(id)a3
{
  objc_storeStrong(&self->_toState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toState, 0);
  objc_storeStrong(&self->_fromState, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
