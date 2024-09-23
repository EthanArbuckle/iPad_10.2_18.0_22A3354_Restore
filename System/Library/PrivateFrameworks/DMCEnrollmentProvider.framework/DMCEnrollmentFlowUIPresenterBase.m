@implementation DMCEnrollmentFlowUIPresenterBase

- (DMCEnrollmentFlowUIPresenterBase)initWithBaseViewController:(id)a3
{
  id v4;
  DMCEnrollmentFlowUIPresenterBase *v5;
  DMCEnrollmentFlowUIPresenterBase *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCEnrollmentFlowUIPresenterBase;
  v5 = -[DMCEnrollmentFlowUIPresenterBase init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_baseViewController, v4);

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[DMCEnrollmentFlowUIPresenterBase dealloc]";
    _os_log_impl(&dword_216358000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentFlowUIPresenterBase;
  -[DMCEnrollmentFlowUIPresenterBase dealloc](&v4, sel_dealloc);
}

- (void)pushViewController:(id)a3
{
  -[DMCEnrollmentFlowUIPresenterBase pushViewController:foundationViewController:](self, "pushViewController:foundationViewController:", a3, 0);
}

- (void)pushViewController:(id)a3 foundationViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  DMCDismissalAwareNavigationController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!v6)
  {
    -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
    v10 = (DMCDismissalAwareNavigationController *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController dmc_popToViewController:pushViewController:animated:](v10, "dmc_popToViewController:pushViewController:animated:", v6, v12, 1);
  }
  else
  {
    v10 = -[DMCDismissalAwareNavigationController initWithRootViewController:]([DMCDismissalAwareNavigationController alloc], "initWithRootViewController:", v12);
    if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
      -[DMCDismissalAwareNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
    -[DMCDismissalAwareNavigationController setDismissedCompletionBlock:](v10, "setDismissedCompletionBlock:", self->_dismissedCompletionBlock);
    -[DMCEnrollmentFlowUIPresenterBase baseViewController](self, "baseViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

    -[DMCEnrollmentFlowUIPresenterBase setNavigationController:](self, "setNavigationController:", v10);
  }

}

- (void)setDismissedCompletionBlock:(id)a3
{
  void *v4;
  id dismissedCompletionBlock;
  id v6;

  v4 = (void *)MEMORY[0x2199F7854](a3, a2);
  dismissedCompletionBlock = self->_dismissedCompletionBlock;
  self->_dismissedCompletionBlock = v4;

  -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDismissedCompletionBlock:", self->_dismissedCompletionBlock);

}

- (void)dismissWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__DMCEnrollmentFlowUIPresenterBase_dismissWithCompletion___block_invoke;
  v6[3] = &unk_24D52E7A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__DMCEnrollmentFlowUIPresenterBase_dismissWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));

}

- (void)requestDevicePasscodeWithDescriptionText:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  DMCEnrollmentFlowUIPresenterBase *v10;

  v6 = a3;
  -[DMCEnrollmentFlowUIPresenterBase setPasscodeCompletionHandler:](self, "setPasscodeCompletionHandler:", a4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__DMCEnrollmentFlowUIPresenterBase_requestDevicePasscodeWithDescriptionText_completionHandler___block_invoke;
  v8[3] = &unk_24D52E730;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __95__DMCEnrollmentFlowUIPresenterBase_requestDevicePasscodeWithDescriptionText_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  DMCPINEntryViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DMCPINEntryViewController *v13;

  v2 = objc_msgSend(MEMORY[0x24BE2A818], "isPad");
  v3 = [DMCPINEntryViewController alloc];
  if ((v2 & 1) != 0)
  {
    v13 = -[DMCPINEntryViewController initWithStyle:](v3, "initWithStyle:", 0);
    -[DMCPINEntryViewController setDelegate:](v13, "setDelegate:", *(_QWORD *)(a1 + 40));
    -[DevicePINController setHidesNavigationButtons:](v13, "setHidesNavigationButtons:", 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v13);
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
    objc_msgSend(v4, "setModalInPresentation:", 1);
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "baseViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v7;

    objc_msgSend(v11, "presentViewController:animated:completion:", v4, 1, 0);
    -[DMCPINEntryViewController navigationController](v13, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNavigationBarHidden:animated:", 0, 0);

  }
  else
  {
    v13 = -[DMCPINEntryViewController initWithStyle:](v3, "initWithStyle:", 1);
    -[DMCPINEntryViewController setDescriptionText:](v13, "setDescriptionText:", *(_QWORD *)(a1 + 32));
    -[DMCPINEntryViewController setDelegate:](v13, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushViewController:animated:", v13, 1);

    }
    else
    {
      objc_msgSend(v9, "pushViewController:", v13);
    }
    objc_msgSend(*(id *)(a1 + 40), "setPinEntryViewController:", v13);
  }

}

- (void)presentActivityPageWithText:(id)a3 showButtomView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DMCActivityViewController *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[DMCActivityViewController initWithActivityText:showBottomView:]([DMCActivityViewController alloc], "initWithActivityText:showBottomView:", v6, v4);

  -[DMCEnrollmentFlowUIPresenterBase setActivityController:](self, "setActivityController:", v7);
  -[DMCEnrollmentFlowUIPresenterBase pushViewController:](self, "pushViewController:", v7);

}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD v9[5];
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
  {
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke_2;
    v9[3] = &unk_24D52E500;
    v9[4] = self;
    v6 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
  -[DMCEnrollmentFlowUIPresenterBase passcodeCompletionHandler](self, "passcodeCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DMCEnrollmentFlowUIPresenterBase passcodeCompletionHandler](self, "passcodeCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v4, 0);

    -[DMCEnrollmentFlowUIPresenterBase setPasscodeCompletionHandler:](self, "setPasscodeCompletionHandler:", 0);
  }

}

uint64_t __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pinEntryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pinEntryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInProgress:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setPinEntryViewController:", 0);
}

void __56__DMCEnrollmentFlowUIPresenterBase_didAcceptEnteredPIN___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "baseViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didCancelEnteringPIN
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__DMCEnrollmentFlowUIPresenterBase_didCancelEnteringPIN__block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  -[DMCEnrollmentFlowUIPresenterBase passcodeCompletionHandler](self, "passcodeCompletionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCEnrollmentFlowUIPresenterBase passcodeCompletionHandler](self, "passcodeCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, 1);

    -[DMCEnrollmentFlowUIPresenterBase setPasscodeCompletionHandler:](self, "setPasscodeCompletionHandler:", 0);
  }
}

void __56__DMCEnrollmentFlowUIPresenterBase_didCancelEnteringPIN__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "baseViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UIViewController)baseViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_baseViewController);
}

- (void)setBaseViewController:(id)a3
{
  objc_storeWeak((id *)&self->_baseViewController, a3);
}

- (DMCDismissalAwareNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (DMCActivityViewController)activityController
{
  return self->_activityController;
}

- (void)setActivityController:(id)a3
{
  objc_storeStrong((id *)&self->_activityController, a3);
}

- (id)dismissedCompletionBlock
{
  return self->_dismissedCompletionBlock;
}

- (id)passcodeCompletionHandler
{
  return self->_passcodeCompletionHandler;
}

- (void)setPasscodeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (DMCPINEntryViewController)pinEntryViewController
{
  return self->_pinEntryViewController;
}

- (void)setPinEntryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pinEntryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinEntryViewController, 0);
  objc_storeStrong(&self->_passcodeCompletionHandler, 0);
  objc_storeStrong(&self->_dismissedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_activityController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_baseViewController);
}

@end
