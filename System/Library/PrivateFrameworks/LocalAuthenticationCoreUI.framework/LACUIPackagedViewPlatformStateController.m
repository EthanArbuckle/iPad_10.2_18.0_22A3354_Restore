@implementation LACUIPackagedViewPlatformStateController

- (LACUIPackagedViewPlatformStateController)initWithLayer:(id)a3
{
  id v4;
  LACUIPackagedViewPlatformStateController *v5;
  uint64_t v6;
  CAStateController *stateController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewPlatformStateController;
  v5 = -[LACUIPackagedViewPlatformStateController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDE5788]), "initWithLayer:", v4);
    stateController = v5->_stateController;
    v5->_stateController = (CAStateController *)v6;

    -[CAStateController setDelegate:](v5->_stateController, "setDelegate:", v5);
  }

  return v5;
}

- (id)state
{
  CAStateController *stateController;
  void *v3;
  void *v4;
  void *v5;

  stateController = self->_stateController;
  -[CAStateController layer](stateController, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAStateController stateOfLayer:](stateController, "stateOfLayer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasState:(id)a3
{
  CAStateController *stateController;
  id v4;
  void *v5;
  void *v6;

  stateController = self->_stateController;
  v4 = a3;
  -[CAStateController layer](stateController, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)setState:(id)a3 speed:(double)a4
{
  CAStateController *stateController;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  if (!-[LACUIPackagedViewPlatformStateController hasState:](self, "hasState:"))
    -[LACUIPackagedViewPlatformStateController setState:speed:].cold.1();
  stateController = self->_stateController;
  -[CAStateController layer](stateController, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateWithName:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAStateController layer](self->_stateController, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  -[CAStateController setState:ofLayer:transitionSpeed:](stateController, "setState:ofLayer:transitionSpeed:", v8, v9, v10);

}

- (void)setInitialState
{
  CAStateController *stateController;
  id v3;

  stateController = self->_stateController;
  -[CAStateController layer](stateController, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAStateController setInitialStatesOfLayer:](stateController, "setInitialStatesOfLayer:", v3);

}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  CAStateController *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  int v18;
  LACUIPackagedViewPlatformStateController *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (CAStateController *)a3;
  v9 = a4;
  if (self->_stateController != v8)
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStop:completed:].cold.1();
  v10 = v9;
  LA_LOG_LACUIPackagedViewPlatformStateController();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
    v13 = OS_LOG_TYPE_DEBUG;
  else
    v13 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v11, v13))
  {
    if (v5)
      v14 = "finish";
    else
      v14 = "skip";
    _NSStringFromCAStateTransition(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = self;
    v20 = 2080;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_240AAB000, v12, v13, "%{public}@ did %s %{public}@", (uint8_t *)&v18, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v10, "toState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "packagedViewPlatformStateController:didTransitionToState:completed:", self, v17, v5);

}

- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4
{
  CAStateController *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  LACUIPackagedViewPlatformStateController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (CAStateController *)a3;
  v7 = a4;
  if (self->_stateController != v6)
    -[LACUIPackagedViewPlatformStateController stateController:didSetStateOfLayer:].cold.1();
  v8 = v7;
  LA_LOG_LACUIPackagedViewPlatformStateController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v11;
    _os_log_debug_impl(&dword_240AAB000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ did set layer state to '%{public}@'", (uint8_t *)&v12, 0x16u);

  }
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  CAStateController *v7;
  id v8;
  void *v9;
  NSObject *v10;

  v7 = (CAStateController *)a3;
  v8 = a4;
  if (self->_stateController != v7)
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:].cold.2();
  v9 = v8;
  LA_LOG_LACUIPackagedViewPlatformStateController();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:].cold.1((uint64_t)self, v9, v10);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@; %p>"), objc_opt_class(), self);
}

- (LACUIPackagedViewPlatformStateControllerDelegate)delegate
{
  return (LACUIPackagedViewPlatformStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)setState:speed:.cold.1()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController setState:speed:]", "LACUIPackagedViewPlatformStateController.m", 48, "[self hasState:state]");
}

- (void)stateController:transitionDidStop:completed:.cold.1()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:transitionDidStop:completed:]", "LACUIPackagedViewPlatformStateController.m", 61, "controller == _stateController");
}

- (void)stateController:didSetStateOfLayer:.cold.1()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:didSetStateOfLayer:]", "LACUIPackagedViewPlatformStateController.m", 68, "controller == _stateController");
}

- (void)stateController:(uint64_t)a1 transitionDidStart:(void *)a2 speed:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _NSStringFromCAStateTransition(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_240AAB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ will start %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)stateController:transitionDidStart:speed:.cold.2()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:]", "LACUIPackagedViewPlatformStateController.m", 74, "controller == _stateController");
}

@end
