@implementation AXUIPasscodeViewController

- (AXUIPasscodeViewController)initWithPresentationStyle:(int)a3 forSetup:(BOOL)a4 pinLength:(unint64_t)a5
{
  int v5;
  _BOOL4 v6;
  uint64_t v7;
  AXUIPasscodeViewController *v8;
  AXUIPasscodeViewController *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AXUIPasscodePaneContainingNavigationController *v14;
  void *v15;
  objc_super v17;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)AXUIPasscodeViewController;
  v8 = -[AXUIPasscodeViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = 0;
    else
      v10 = 3;
    v11 = (int)*MEMORY[0x1E0D80540];
    *(_DWORD *)((char *)&v8->super.super.super.super.super.super.isa + v11) = v10;
    if (v6)
      *(_DWORD *)((char *)&v8->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80548]) = 1;
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v9, *MEMORY[0x1E0D809C8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)((char *)&v9->super.super.super.super.super.super.isa + v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v13, CFSTR("mode"));

    -[DevicePINController setSpecifier:](v9, "setSpecifier:", v12);
    -[AXUIPasscodeViewController setPresentationStyle:](v9, "setPresentationStyle:", v7);
    v14 = -[AXUIPasscodePaneContainingNavigationController initWithRootViewController:]([AXUIPasscodePaneContainingNavigationController alloc], "initWithRootViewController:", v9);
    -[AXUIPasscodePaneContainingNavigationController setDelegate:](v14, "setDelegate:", v9);
    -[AXUIPasscodeViewController setHostingNavigationController:](v9, "setHostingNavigationController:", v14);
    if ((_DWORD)v7)
    {
      if ((_DWORD)v7 == 1)
      {
        -[AXUIPasscodeViewController preferredContentSize](v9, "preferredContentSize");
        -[AXUIPasscodeViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
        -[AXUIPasscodePaneContainingNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 2);
        -[AXUIPasscodePaneContainingNavigationController popoverPresentationController](v14, "popoverPresentationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPermittedArrowDirections:", 0);
        objc_msgSend(v15, "setDelegate:", v9);

      }
    }
    else
    {
      -[AXUIPasscodePaneContainingNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 0);
    }
    v9->_pinLength = v5;

  }
  return v9;
}

- (AXUIPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AXUIPasscodeViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUIPasscodeViewController;
  v4 = -[AXUIPasscodeViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)

  return 0;
}

- (AXUIPasscodeViewController)initWithCoder:(id)a3
{
  AXUIPasscodeViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXUIPasscodeViewController;
  v3 = -[AXUIPasscodeViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  if (v3)

  return 0;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  GuidedAccessDevicePINPane *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  v19.receiver = self;
  v19.super_class = (Class)AXUIPasscodeViewController;
  -[DevicePINController loadView](&v19, sel_loadView);
  -[AXUIPasscodeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[DevicePINPane initWithFrame:]([GuidedAccessDevicePINPane alloc], "initWithFrame:", v7, v9, v11, v13);
  objc_msgSend(v5, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GuidedAccessDevicePINPane setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[PSEditingPane setDelegate:](v15, "setDelegate:", self);
  -[DevicePINController setPane:](self, "setPane:", v15);
  -[AXUIPasscodeViewController pinViewTitle](self, "pinViewTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AXUIPasscodeViewController pinViewTitle](self, "pinViewTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DevicePINPane setTitle:](v15, "setTitle:", v18);

  }
  -[GuidedAccessDevicePINPane setFrame:](v15, "setFrame:", v8, v10, v12, v14);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  else
    return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_presentPasscodeViewWithParentViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  v5 = a3;
  -[AXUIPasscodeViewController setPresentorViewController:](self, "setPresentorViewController:", v5);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__AXUIPasscodeViewController__presentPasscodeViewWithParentViewController_animated___block_invoke;
  aBlock[3] = &unk_1E76AB330;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[AXUIPasscodeViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", 1);
  if (!-[AXUIPasscodeViewController _shouldShowCancelButton](self, "_shouldShowCancelButton"))
  {
    objc_msgSend(v7, "setRightBarButtonItem:", 0);
    objc_msgSend(v7, "setLeftBarButtonItem:", 0);
  }
  if (-[AXUIPasscodeViewController presentationStyle](self, "presentationStyle") == 1)
  {
    objc_msgSend(v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIPasscodeViewController hostingNavigationController](self, "hostingNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSourceView:", v8);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v10, "setSourceRect:");

  }
  -[AXUIPasscodeViewController hostingNavigationController](self, "hostingNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v11, 1, v6);

}

uint64_t __84__AXUIPasscodeViewController__presentPasscodeViewWithParentViewController_animated___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setPasscodeViewVisible:", 1);
  v2 = *MEMORY[0x1E0DC45C0];
  objc_msgSend(*(id *)(a1 + 32), "pane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPasscodeViewVisibilityChange");
}

- (void)_dismissPasscodeViewAnimated:(BOOL)a3 withReason:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  _QWORD v8[6];

  v5 = a3;
  -[AXUIPasscodeViewController presentorViewController](self, "presentorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__AXUIPasscodeViewController__dismissPasscodeViewAnimated_withReason___block_invoke;
  v8[3] = &unk_1E76AB868;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v5, v8);

}

uint64_t __70__AXUIPasscodeViewController__dismissPasscodeViewAnimated_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishDismissingPasscodeViewWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_didFinishDismissingPasscodeViewWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[AXUIPasscodeViewController presentationStyle](self, "presentationStyle") == 1)
  {
    -[AXUIPasscodeViewController hostingNavigationController](self, "hostingNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

  }
  -[AXUIPasscodeViewController hostingNavigationController](self, "hostingNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[AXUIPasscodeViewController setHostingNavigationController:](self, "setHostingNavigationController:", 0);
  -[AXUIPasscodeViewController _notifyDelegateOfPasscodeViewDismissalWithReason:](self, "_notifyDelegateOfPasscodeViewDismissalWithReason:", a3);
  -[AXUIPasscodeViewController setPresentorViewController:](self, "setPresentorViewController:", 0);
  -[AXUIPasscodeViewController setPasscodeViewVisible:](self, "setPasscodeViewVisible:", 0);
  -[AXUIPasscodeViewController _notifyDelegateOfPasscodeViewVisibilityChange](self, "_notifyDelegateOfPasscodeViewVisibilityChange");
}

- (void)_notifyDelegateOfPasscodeViewVisibilityChange
{
  id v3;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeViewController:passcodeViewIsVisible:", self, -[AXUIPasscodeViewController isPasscodeViewVisible](self, "isPasscodeViewVisible"));

}

- (void)_notifyDelegateOfPasscodeViewDismissalWithReason:(int64_t)a3
{
  id v5;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passcodeViewController:wasDismissedWithReason:", self, a3);

}

- (BOOL)_shouldShowCancelButton
{
  void *v3;
  char v4;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldShowCancelButtonForPasscodeViewController:", self);
  else
    v4 = 1;

  return v4;
}

- (int64_t)_activeInterfaceOrientation
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "activeInterfaceOrientationForPasscodeViewController:", self);
  }
  else
  {
    -[AXUIPasscodeViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "interfaceOrientation");

  }
  return v4;
}

- (BOOL)_shouldAllowMultipleEntryAttempts
{
  void *v3;
  char v4;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldAllowMultipleEntryAttemptsForPasscodeViewController:", self);
  else
    v4 = 0;

  return v4;
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (BOOL)switchFromKeypadToKeyboard
{
  return 0;
}

- (BOOL)useProgressiveDelays
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 0;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (void)pinEntered:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AXUIPasscodeViewController setAsynchronouslyCheckedPinWasValid:](self, "setAsynchronouslyCheckedPinWasValid:", 0);
  if (-[DevicePINController mode](self, "mode") == 3)
  {
    -[AXUIPasscodeViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode");
    if (-[DevicePINController mode](self, "mode") == 3 && (v6 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __41__AXUIPasscodeViewController_pinEntered___block_invoke;
      v9[3] = &unk_1E76AB890;
      v9[4] = self;
      v10 = v4;
      objc_msgSend(v5, "passcodeViewController:isPasscode:correctWithCompletionHandler:", self, v10, v9);

    }
    else
    {
      -[AXUIPasscodeViewController setAsynchronouslyCheckedPinWasValid:](self, "setAsynchronouslyCheckedPinWasValid:", v6);
      v8.receiver = self;
      v8.super_class = (Class)AXUIPasscodeViewController;
      -[DevicePINController pinEntered:](&v8, sel_pinEntered_, v4);
      -[AXUIPasscodeViewController setAsynchronouslyCheckedPinWasValid:](self, "setAsynchronouslyCheckedPinWasValid:", 0);
    }

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AXUIPasscodeViewController;
    -[DevicePINController pinEntered:](&v7, sel_pinEntered_, v4);
  }

}

uint64_t __41__AXUIPasscodeViewController_pinEntered___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  objc_super v5;

  objc_msgSend(*(id *)(a1 + 32), "setAsynchronouslyCheckedPinWasValid:", a2);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)AXUIPasscodeViewController;
  objc_msgSendSuper2(&v5, sel_pinEntered_, v3);
  return objc_msgSend(*(id *)(a1 + 32), "setAsynchronouslyCheckedPinWasValid:", 0);
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "length") == 6 || objc_msgSend(v4, "length") == 4;

  return v5;
}

- (void)_slidePasscodeField
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80570]), "slideToNewPasscodeField:requiresKeyboard:numericOnly:", -[AXUIPasscodeViewController simplePIN](self, "simplePIN"), -[AXUIPasscodeViewController requiresKeyboard](self, "requiresKeyboard"), 1);
}

- (void)_updateErrorTextAndFailureCount:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (*(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80540]) == 3
    && !-[AXUIPasscodeViewController _shouldAllowMultipleEntryAttempts](self, "_shouldAllowMultipleEntryAttempts"))
  {
    -[AXUIPasscodeViewController _dismissPasscodeViewAnimated:withReason:](self, "_dismissPasscodeViewAnimated:withReason:", 1, 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUIPasscodeViewController;
    -[DevicePINController _updateErrorTextAndFailureCount:](&v5, sel__updateErrorTextAndFailureCount_, v3);
  }
}

- (void)cancelButtonTapped
{
  -[AXUIPasscodeViewController _dismissPasscodeViewAnimated:withReason:](self, "_dismissPasscodeViewAnimated:withReason:", 1, 3);
}

- (void)didAcceptEnteredPIN
{
  -[AXUIPasscodeViewController _dismissPasscodeViewAnimated:withReason:](self, "_dismissPasscodeViewAnimated:withReason:", 1, 2);
}

- (void)didAcceptSetPIN
{
  void *v3;
  id v4;

  -[AXUIPasscodeViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AXUIPasscodeViewController passcode](self, "passcode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passcodeViewController:didFinishSettingUpPasscode:", self, v3);

  }
  -[AXUIPasscodeViewController _dismissPasscodeViewAnimated:withReason:](self, "_dismissPasscodeViewAnimated:withReason:", 1, 4);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[AXUIPasscodeViewController _didFinishDismissingPasscodeViewWithReason:](self, "_didFinishDismissingPasscodeViewWithReason:", 3);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;

  -[AXUIPasscodeViewController presentorViewController](self, "presentorViewController", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  a4->origin.x = v7;
  a4->origin.y = v8;
  a4->size.width = v9;
  a4->size.height = v10;

}

- (int)pinLength
{
  return self->_pinLength;
}

- (void)setPinLength:(int)a3
{
  self->_pinLength = a3;
}

- (AXUIPasscodeViewControllerDelegate)delegate
{
  return (AXUIPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPasscodeViewVisible
{
  return self->_asynchronouslyCheckedPinWasValid;
}

- (void)setPasscodeViewVisible:(BOOL)a3
{
  self->_asynchronouslyCheckedPinWasValid = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int)a3
{
  self->_presentationStyle = a3;
}

- (UIViewController)presentorViewController
{
  return self->_presentorViewController;
}

- (void)setPresentorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentorViewController, a3);
}

- (UINavigationController)hostingNavigationController
{
  return self->_hostingNavigationController;
}

- (void)setHostingNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingNavigationController, a3);
}

- (NSString)pinViewTitle
{
  return self->_pinViewTitle;
}

- (void)setPinViewTitle:(id)a3
{
  objc_storeStrong((id *)&self->_pinViewTitle, a3);
}

- (BOOL)asynchronouslyCheckedPinWasValid
{
  return *(&self->_asynchronouslyCheckedPinWasValid + 1);
}

- (void)setAsynchronouslyCheckedPinWasValid:(BOOL)a3
{
  *(&self->_asynchronouslyCheckedPinWasValid + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinViewTitle, 0);
  objc_storeStrong((id *)&self->_hostingNavigationController, 0);
  objc_storeStrong((id *)&self->_presentorViewController, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
