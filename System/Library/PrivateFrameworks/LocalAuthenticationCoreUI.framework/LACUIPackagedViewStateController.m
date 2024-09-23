@implementation LACUIPackagedViewStateController

- (LACUIPackagedViewStateController)initWithLayer:(id)a3
{
  id v4;
  LACUIPackagedViewPlatformStateController *v5;
  LACUIPackagedViewStateController *v6;

  v4 = a3;
  v5 = -[LACUIPackagedViewPlatformStateController initWithLayer:]([LACUIPackagedViewPlatformStateController alloc], "initWithLayer:", v4);

  v6 = -[LACUIPackagedViewStateController initWithPlatformStateController:](self, "initWithPlatformStateController:", v5);
  return v6;
}

- (LACUIPackagedViewStateController)initWithPlatformStateController:(id)a3
{
  id v5;
  LACUIPackagedViewStateController *v6;
  LACUIPackagedViewStateController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewStateController;
  v6 = -[LACUIPackagedViewStateController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stateController, a3);
    -[LACUIPackagedViewPlatformStateController setDelegate:](v7->_stateController, "setDelegate:", v7);
  }

  return v7;
}

- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  LACUIPackagedViewPlatformStateController *stateController;
  void *v11;
  LACUIPackagedViewState *v12;
  void *v13;
  LACUIPackagedViewState *v14;
  void *v15;
  int v16;
  LACUIPackagedViewStateTransition *v17;
  LACUIPackagedViewStateTransition *pendingStateTransition;
  LACUIPackagedViewPlatformStateController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  dispatch_time_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  stateController = self->_stateController;
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stateController) = -[LACUIPackagedViewPlatformStateController hasState:](stateController, "hasState:", v11);

  if ((stateController & 1) != 0)
  {
    v12 = [LACUIPackagedViewState alloc];
    -[LACUIPackagedViewPlatformStateController state](self->_stateController, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[LACUIPackagedViewState initWithName:](v12, "initWithName:", v13);

    -[LACUIPackagedViewState name](v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "containsStateNamed:", v15);

    if (v16)
    {
      v9[2](v9, 1);
    }
    else
    {
      -[LACUIPackagedViewStateController _clearPendingTransitionWithFlag:](self, "_clearPendingTransitionWithFlag:", 0);
      v17 = -[LACUIPackagedViewStateTransition initWithFromState:toState:completion:]([LACUIPackagedViewStateTransition alloc], "initWithFromState:toState:completion:", v14, v8, v9);
      pendingStateTransition = self->_pendingStateTransition;
      self->_pendingStateTransition = v17;

      v19 = self->_stateController;
      objc_msgSend(v8, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUIPackagedViewPlatformStateController setState:speed:](v19, "setState:speed:", v20, (double)v6);

      if (v6)
      {
        objc_msgSend(v8, "animationOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "maxDuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v22)
          v22 = &unk_2511004A0;
        objc_msgSend(v22, "floatValue");
        v25 = v24;

        if (v25 > 0.0)
        {
          v26 = v25;
          if (v26 < 1.79769313e308)
          {
            objc_initWeak(&location, self);
            v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __65__LACUIPackagedViewStateController_setState_animated_completion___block_invoke;
            block[3] = &unk_2510F81D8;
            objc_copyWeak(&v30, &location);
            v29 = v8;
            dispatch_after(v27, MEMORY[0x24BDAC9B8], block);

            objc_destroyWeak(&v30);
            objc_destroyWeak(&location);
          }
        }
      }
      else
      {
        -[LACUIPackagedViewStateController _clearPendingTransitionWithFlag:](self, "_clearPendingTransitionWithFlag:", 1);
      }
    }

  }
  else
  {
    v9[2](v9, 0);
  }

}

void __65__LACUIPackagedViewStateController_setState_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 2))
  {
    if (LA_LOG_LACUIPackagedViewStateController_once != -1)
      dispatch_once(&LA_LOG_LACUIPackagedViewStateController_once, &__block_literal_global_0);
    v4 = LA_LOG_LACUIPackagedViewStateController_log;
    if (os_log_type_enabled((os_log_t)LA_LOG_LACUIPackagedViewStateController_log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_240AAB000, v4, OS_LOG_TYPE_DEFAULT, "Calling completion for %{public}@ after reaching duration limit", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(v3, "_clearPendingTransitionWithFlag:", 1);
  }

}

- (void)setInitialState
{
  -[LACUIPackagedViewPlatformStateController setInitialState](self->_stateController, "setInitialState");
}

- (void)packagedViewPlatformStateController:(id)a3 didTransitionToState:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  LACUIPackagedViewStateTransition *pendingStateTransition;
  id v8;
  void *v9;
  int v10;

  v5 = a5;
  pendingStateTransition = self->_pendingStateTransition;
  v8 = a4;
  -[LACUIPackagedViewStateTransition toState](pendingStateTransition, "toState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "finishesWithStateNamed:", v8);

  if (v10)
    -[LACUIPackagedViewStateController _clearPendingTransitionWithFlag:](self, "_clearPendingTransitionWithFlag:", v5);
}

- (void)_clearPendingTransitionWithFlag:(BOOL)a3
{
  LACUIPackagedViewStateTransition *pendingStateTransition;

  -[LACUIPackagedViewStateTransition complete:](self->_pendingStateTransition, "complete:", a3);
  pendingStateTransition = self->_pendingStateTransition;
  self->_pendingStateTransition = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStateTransition, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
