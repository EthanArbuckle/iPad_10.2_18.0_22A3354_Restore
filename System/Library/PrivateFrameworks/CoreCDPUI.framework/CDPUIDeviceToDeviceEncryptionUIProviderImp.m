@implementation CDPUIDeviceToDeviceEncryptionUIProviderImp

- (void)promptForUpgradeWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForUpgradeWithContext_vm_completion___block_invoke;
  v14[3] = &unk_24C854278;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __88__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForUpgradeWithContext_vm_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_upgradeViewControllerWithContext:vm:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "forceInlinePresentation")
    && (objc_msgSend(*(id *)(a1 + 40), "presentingViewController"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v5, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)promptForCancelWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BEBD3A8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "continueTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke;
  v30[3] = &unk_24C8545C0;
  v13 = v7;
  v31 = v13;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v11, 0, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v9, "cancelTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v12;
  v26 = 3221225472;
  v27 = __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke_2;
  v28 = &unk_24C8545C0;
  v29 = v13;
  v17 = v13;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v9, "title", v25, v26, v27, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "message");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addAction:", v14);
  objc_msgSend(v22, "addAction:", v18);
  objc_msgSend(v10, "presentingViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "presentedViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentViewController:animated:completion:", v22, 1, 0);

}

uint64_t __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)promptIneligibilityWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BEBD3A8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "continueTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptIneligibilityWithContext_vm_completion___block_invoke;
  v20[3] = &unk_24C8545C0;
  v21 = v7;
  v12 = v7;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v11, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v9, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "message");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v13);
  objc_msgSend(v10, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "presentedViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v17, 1, 0);

}

uint64_t __91__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptIneligibilityWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DC8F000, log, OS_LOG_TYPE_DEBUG, "\"CDPUIDeviceToDeviceEncryptionUIProviderImp is going away...\", v1, 2u);
}

- (id)_upgradeViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "deviceToDeviceEncryptionUpgradeUIStyle"))
  {
    -[CDPUIDeviceToDeviceEncryptionUIProviderImp _upgradeAlertControllerWithContext:vm:completion:](self, "_upgradeAlertControllerWithContext:vm:completion:", v8, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (void *)v13;
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "deviceToDeviceEncryptionUpgradeUIStyle") == 1)
  {
    if (objc_msgSend(v8, "forceInlinePresentation")
      && (objc_msgSend(v8, "presentingViewController"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) != 0))
    {
      -[CDPUIDeviceToDeviceEncryptionUIProviderImp _upgradeCardUIViewControllerWithContext:vm:completion:](self, "_upgradeCardUIViewControllerWithContext:vm:completion:", v8, v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CDPUIDeviceToDeviceEncryptionUIProviderImp _upgradeCardUINavigationControllerWithContext:vm:completion:](self, "_upgradeCardUINavigationControllerWithContext:vm:completion:", v8, v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)_upgradeAlertControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  _QWORD v27[4];
  id v28;

  v6 = a5;
  v7 = (void *)MEMORY[0x24BEBD3A8];
  v8 = a4;
  objc_msgSend(v8, "continueTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke;
  v27[3] = &unk_24C8545C0;
  v11 = v6;
  v28 = v11;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v8, "cancelTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v10;
  v23 = 3221225472;
  v24 = __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke_2;
  v25 = &unk_24C8545C0;
  v26 = v11;
  v15 = v11;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v8, "title", v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "message");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAction:", v12);
  objc_msgSend(v20, "addAction:", v16);

  return v20;
}

uint64_t __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_upgradeCardUIViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = a4;
  objc_msgSend(v8, "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("lock_icon_bg_buddy"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE6E458]);
  objc_msgSend(v9, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTitle:detailText:icon:", v13, v14, v11);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "continueTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  v18 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke;
  v32[3] = &unk_24C854368;
  v19 = v7;
  v33 = v19;
  -[CDPUIDeviceToDeviceEncryptionUIProviderImp setContinueActionHandler:](self, "setContinueActionHandler:", v32);
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_continueTapped_, 64);
  objc_msgSend(v15, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v16);

  v27 = v18;
  v28 = 3221225472;
  v29 = __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke_2;
  v30 = &unk_24C854368;
  v31 = v19;
  v21 = v19;
  -[CDPUIDeviceToDeviceEncryptionUIProviderImp setCancelActionHandler:](self, "setCancelActionHandler:", &v27);
  v22 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(v9, "cancelTitle", v27, v28, v29, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 0, self, sel_cancelTapped_);
  objc_msgSend(v15, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLeftBarButtonItem:", v24);

  return v15;
}

uint64_t __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_upgradeCardUINavigationControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  void *v5;
  void *v6;

  -[CDPUIDeviceToDeviceEncryptionUIProviderImp _upgradeCardUIViewControllerWithContext:vm:completion:](self, "_upgradeCardUIViewControllerWithContext:vm:completion:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E420]), "initWithRootViewController:", v5);

  return v6;
}

- (void)continueTapped:(id)a3
{
  (*((void (**)(void))self->_continueActionHandler + 2))();
}

- (void)cancelTapped:(id)a3
{
  (*((void (**)(void))self->_cancelActionHandler + 2))();
}

- (id)cancelActionHandler
{
  return self->_cancelActionHandler;
}

- (void)setCancelActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong(&self->_cancelActionHandler, 0);
}

@end
