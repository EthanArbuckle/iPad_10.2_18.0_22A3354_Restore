@implementation SUUIStatusBarAlertCenter

+ (id)sharedCenter
{
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_46);
  return (id)sharedCenter_sharedHeadsUp;
}

void __40__SUUIStatusBarAlertCenter_sharedCenter__block_invoke()
{
  SUUIStatusBarAlertCenter *v0;
  void *v1;

  v0 = objc_alloc_init(SUUIStatusBarAlertCenter);
  v1 = (void *)sharedCenter_sharedHeadsUp;
  sharedCenter_sharedHeadsUp = (uint64_t)v0;

}

- (SUUIStatusBarAlertCenter)init
{
  SUUIStatusBarAlertCenter *v2;
  _SUUIStatusBarAlertViewController *v3;
  _SUUIStatusBarAlertViewController *rootViewController;
  _SUUIClickThroughWindow *v5;
  void *v6;
  uint64_t v7;
  _SUUIClickThroughWindow *window;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIStatusBarAlertCenter;
  v2 = -[SUUIStatusBarAlertCenter init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_SUUIStatusBarAlertViewController);
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = v3;

    -[_SUUIStatusBarAlertViewController setDelegate:](v2->_rootViewController, "setDelegate:", v2);
    v5 = [_SUUIClickThroughWindow alloc];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[_SUUIClickThroughWindow initWithFrame:](v5, "initWithFrame:");
    window = v2->_window;
    v2->_window = (_SUUIClickThroughWindow *)v7;

    -[_SUUIClickThroughWindow setWindowLevel:](v2->_window, "setWindowLevel:", *MEMORY[0x24BEBE9F8]);
    -[_SUUIClickThroughWindow setRootViewController:](v2->_window, "setRootViewController:", v2->_rootViewController);
    -[_SUUIClickThroughWindow _setWindowControlsStatusBarOrientation:](v2->_window, "_setWindowControlsStatusBarOrientation:", 0);
    v2->_duration = 3.0;
  }
  return v2;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[SUUIStatusBarAlertCenter window](self, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isVisible
{
  void *v2;
  char v3;

  -[SUUIStatusBarAlertCenter window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)showMessage:(id)a3 withStyle:(int64_t)a4 forDuration:(double)a5 actionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  int64_t v31;

  v10 = a6;
  if (a5 < 2.22044605e-16)
    a5 = 3.0;
  v11 = a3;
  -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMessage:", v11);

  -[SUUIStatusBarAlertCenter setDuration:](self, "setDuration:", a5);
  -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endAllAnimations");

  if (-[SUUIStatusBarAlertCenter isVisible](self, "isVisible"))
  {
    -[SUUIStatusBarAlertCenter unscheduleDismiss](self, "unscheduleDismiss");
    v14 = (void *)MEMORY[0x24BEBDB00];
    v15 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke;
    v29[3] = &unk_2511FB878;
    v29[4] = self;
    v31 = a4;
    v30 = v10;
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_2;
    v28[3] = &unk_2511F4908;
    v28[4] = self;
    objc_msgSend(v14, "animateWithDuration:animations:completion:", v29, v28, 0.2);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "rootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "supportedInterfaceOrientations");
    }
    else
    {
      -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "defaultInterfaceOrientations");
    }
    v20 = v19;
    -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSupportedInterfaceOrientations:", v20);

    -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStyle:", a4);

    -[SUUIStatusBarAlertCenter setActionBlock:](self, "setActionBlock:", v10);
    -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "statusBarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStatusBarAlertCenter window](self, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInteractionView:", v24);

    -[SUUIStatusBarAlertCenter setVisible:](self, "setVisible:", 1);
    v26[4] = self;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_3;
    v27[3] = &unk_2511F47C0;
    v27[4] = self;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_4;
    v26[3] = &unk_2511F4908;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v27, v26, 0.2);

  }
}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOnScreen:", 1);

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setActionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "scheduleDismiss");
  return result;
}

void __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOnScreen:", 1);

}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "scheduleDismiss");
  return result;
}

- (void)unscheduleDismiss
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_dismiss, 0);
}

- (void)scheduleDismiss
{
  -[SUUIStatusBarAlertCenter duration](self, "duration");
  -[SUUIStatusBarAlertCenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_dismiss, 0);
}

- (void)dismiss
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[SUUIStatusBarAlertCenter unscheduleDismiss](self, "unscheduleDismiss");
  if (-[SUUIStatusBarAlertCenter isVisible](self, "isVisible"))
  {
    -[SUUIStatusBarAlertCenter rootViewController](self, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endAllAnimations");

    v4[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__SUUIStatusBarAlertCenter_dismiss__block_invoke;
    v5[3] = &unk_2511F47C0;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __35__SUUIStatusBarAlertCenter_dismiss__block_invoke_2;
    v4[3] = &unk_2511F4908;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v5, v4, 0.2);
  }
}

void __35__SUUIStatusBarAlertCenter_dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOnScreen:", 0);

}

uint64_t __35__SUUIStatusBarAlertCenter_dismiss__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setVisible:", 0);
    objc_msgSend(*(id *)(v2 + 32), "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMessage:", 0);

    return objc_msgSend(*(id *)(v2 + 32), "setActionBlock:", 0);
  }
  return result;
}

- (void)statusBarAlertViewControllerWasTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[SUUIStatusBarAlertCenter dismiss](self, "dismiss", a3);
  -[SUUIStatusBarAlertCenter actionBlock](self, "actionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUUIStatusBarAlertCenter actionBlock](self, "actionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_SUUIClickThroughWindow)window
{
  return self->_window;
}

- (_SUUIStatusBarAlertViewController)rootViewController
{
  return self->_rootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
