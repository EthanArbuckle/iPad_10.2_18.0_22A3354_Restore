@implementation FBKDevicePickingNavigationController

- (FBKDevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  FBKDeviceChoicesViewController *v10;
  FBKDevicePickingNavigationController *v11;
  FBKDevicePickingNavigationController *v12;
  objc_super v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(FBKDeviceChoicesViewController);
  -[FBKDeviceChoicesViewController setDeviceChoices:](v10, "setDeviceChoices:", v9);

  -[FBKDeviceChoicesViewController setIsMultiSelect:](v10, "setIsMultiSelect:", v5);
  -[FBKDeviceChoicesViewController setChoiceDelegate:](v10, "setChoiceDelegate:", self);
  v14.receiver = self;
  v14.super_class = (Class)FBKDevicePickingNavigationController;
  v11 = -[FBKDevicePickingNavigationController initWithRootViewController:](&v14, sel_initWithRootViewController_, v10);
  v12 = v11;
  if (v11)
    -[FBKDevicePickingNavigationController setCompletion:](v11, "setCompletion:", v8);

  return v12;
}

- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[FBKLog ded](FBKLog, "ded");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "device picker paired new device [%{public}@]", buf, 0xCu);
    }

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __86__FBKDevicePickingNavigationController_pairedDevicesDidChangeWithAddedDevice_removed___block_invoke;
    v12[3] = &unk_24E157020;
    v12[4] = self;
    v13 = v6;
    -[FBKDevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        objc_msgSend(v7, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "removed device [%{public}@] while being asked to pair with new one, noop", buf, 0xCu);

      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "how did we get here?", buf, 2u);
    }

  }
}

void __86__FBKDevicePickingNavigationController_pairedDevicesDidChangeWithAddedDevice_removed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3);

  }
}

- (void)pairingViewDidClose
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FBKDevicePickingNavigationController pairingViewDidClose]";
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)pairingViewDidCancel
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  +[FBKLog ded](FBKLog, "ded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "device picker paired no device", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__FBKDevicePickingNavigationController_pairingViewDidCancel__block_invoke;
  v4[3] = &unk_24E156D78;
  v4[4] = self;
  -[FBKDevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
}

void __60__FBKDevicePickingNavigationController_pairingViewDidCancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3);

  }
}

- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[FBKLog ded](FBKLog, "ded");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("publicLogDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "device picker chose devices [%{public}@]", buf, 0xCu);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke;
  v9[3] = &unk_24E157020;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[FBKDevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

}

void __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v11 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, *(_QWORD *)(a1 + 40));

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)deviceChoicesControllerDidCancelWithController:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  +[FBKLog ded](FBKLog, "ded", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "device picker chose no device", buf, 2u);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__FBKDevicePickingNavigationController_deviceChoicesControllerDidCancelWithController___block_invoke;
  v5[3] = &unk_24E156D78;
  v5[4] = self;
  -[FBKDevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

void __87__FBKDevicePickingNavigationController_deviceChoicesControllerDidCancelWithController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v12 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v3);

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

void __81__FBKDevicePickingNavigationController_deviceChoicesController_didChooseDevices___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "Device choices made but no completion block given", a5, a6, a7, a8, 0);
}

@end
