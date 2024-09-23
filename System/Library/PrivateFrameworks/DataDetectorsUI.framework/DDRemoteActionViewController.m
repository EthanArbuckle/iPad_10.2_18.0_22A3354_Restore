@implementation DDRemoteActionViewController

- (void)_prepareForAction:(id)a3 inActionController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v11;

  if (!self->_proxyConfigured)
    self->_proxyConfigured = 1;
  self->_waitingForRemoteConfiguration = 1;
  v6 = a4;
  v7 = a3;
  -[DDRemoteActionViewController setAction:](self, "setAction:", v7);
  -[DDRemoteActionViewController setActionController:](self, "setActionController:", v6);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 <= 6 && ((1 << v9) & 0x62) != 0)
    -[DDRemoteActionViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareForAction:", v7);

}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5623C8);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE581770);
}

+ (BOOL)controllerIsAvailable
{
  if (controllerIsAvailable_onceToken != -1)
    dispatch_once(&controllerIsAvailable_onceToken, &__block_literal_global_9);
  return controllerIsAvailable__available;
}

void __53__DDRemoteActionViewController_controllerIsAvailable__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.InputUI")) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.calendar.EventKitUIRemoteUIExtension")) ^ 1;
  }
  controllerIsAvailable__available = v1;

}

- (void)viewControllerReady
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
  v4 = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "action:viewControllerReady:", v4, self);

  self->_waitingForRemoteConfiguration = 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (self->_waitingForRemoteConfiguration)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:].cold.4();
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
    v7 = objc_loadWeakRetained((id *)&self->_action);
    objc_msgSend(WeakRetained, "failedToPrepareViewControllerForAction:", v7);

    goto LABEL_15;
  }
  if (!self->_receivedActionDidFinish)
    goto LABEL_18;
  if (objc_msgSend(v4, "code") == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:].cold.2();
    goto LABEL_15;
  }
  if (self->_receivedActionDidFinish)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:].cold.3();
  }
  else
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDRemoteActionViewController viewServiceDidTerminateWithError:].cold.1();
    -[DDRemoteActionViewController actionDidFinishShouldDismiss:](self, "actionDidFinishShouldDismiss:", 1);
  }
LABEL_15:
  v8.receiver = self;
  v8.super_class = (Class)DDRemoteActionViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v5);

}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adaptForPresentationInPopover:", v3);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)DDRemoteActionViewController;
  -[DDRemoteActionViewController preferredContentSize](&v4, sel_preferredContentSize);
  if (v2 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v3 = 480.0;
    v2 = 360.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)prepareViewController:(id)a3 forAction:(id)a4 actionController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v13[1] = 3221225472;
  v13[2] = __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke;
  v13[3] = &unk_1E4258C50;
  v14 = a4;
  v15 = a5;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DDRemoteActionViewController;
  v13[0] = MEMORY[0x1E0C809B0];
  v8 = v15;
  v9 = v14;
  objc_msgSendSuper2(&v12, sel_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_, a3, CFSTR("com.apple.datadetectors.DDActionsService"), v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setViewController:", v5);
    objc_msgSend(v5, "_prepareForAction:inActionController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "failedToPrepareViewControllerForAction:", *(_QWORD *)(a1 + 32));
  }

}

- (void)actionCanBeCancelledExternally:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionController);
  v5 = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "action:presentationShouldBeModal:", v5, !v3);

}

- (void)actionDidFinishShouldDismiss:(BOOL)a3
{
  _BOOL8 v3;
  DDAction **p_action;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  if (!self->_receivedActionDidFinish)
  {
    v3 = a3;
    self->_receivedActionDidFinish = 1;
    p_action = &self->_action;
    WeakRetained = objc_loadWeakRetained((id *)&self->_action);
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_action);
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)p_action);
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_loadWeakRetained((id *)p_action);
        objc_msgSend(v11, "actionDidFinish:shouldDismiss:", v12, v3);

      }
    }
    v13 = objc_loadWeakRetained((id *)p_action);
    objc_msgSend(v13, "invalidate");

    objc_storeWeak((id *)p_action, 0);
  }
}

- (void)getIsBeingPresentedInPopover:(id)a3
{
  DDActionController **p_actionController;
  id v5;
  id WeakRetained;

  p_actionController = &self->_actionController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_actionController);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(WeakRetained, "isPresentingInPopover"));

}

- (DDAction)action
{
  return (DDAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (DDActionController)actionController
{
  return (DDActionController *)objc_loadWeakRetained((id *)&self->_actionController);
}

- (void)setActionController:(id)a3
{
  objc_storeWeak((id *)&self->_actionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionController);
  objc_destroyWeak((id *)&self->_action);
}

- (void)viewServiceDidTerminateWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "View service did terminate with error %@ before completing its action", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)viewServiceDidTerminateWithError:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "View service did terminate after action ended.", v0, 2u);
}

- (void)viewServiceDidTerminateWithError:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "View service did terminate with error %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)viewServiceDidTerminateWithError:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "View service did terminate with error while preparing itself %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __81__DDRemoteActionViewController_prepareViewController_forAction_actionController___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Could not get an out-of-process view controller. Error %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
