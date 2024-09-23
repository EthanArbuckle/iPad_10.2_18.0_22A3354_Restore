@implementation AutomationOverlayViewController

- (AutomationOverlayViewController)initWithDelegate:(id)a3
{
  id v5;
  AutomationOverlayViewController *v6;
  AutomationOverlayViewController *v7;
  AutomationOverlayViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AutomationOverlayViewController;
  v6 = -[AutomationOverlayViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_allowsUserInteraction = 0;
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AutomationOverlayViewController;
  -[AutomationOverlayViewController loadView](&v6, sel_loadView);
  -[AutomationOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SFDebugMenuEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

  }
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  objc_msgSend(v3, "setAutoresizingMask:", 18);
}

- (BOOL)allowsUserInteraction
{
  return self->_allowsUserInteraction
      || (objc_opt_respondsToSelector() & 1) != 0
      && (-[AutomationOverlayViewControllerDelegate automationOverlayControllerShouldAllowUserInteraction:](self->_delegate, "automationOverlayControllerShouldAllowUserInteraction:", self) & 1) != 0;
}

- (void)_interceptUserInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];

  -[AutomationOverlayViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && !-[AutomationOverlayViewController allowsUserInteraction](self, "allowsUserInteraction"))
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke;
    v23[3] = &unk_1E9CF4AE8;
    v23[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    v12 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_2;
    v22[3] = &unk_1E9CF4AE8;
    v22[4] = self;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    if (SFDebugMenuEnabled())
    {
      v15 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow Interaction for %.f seconds"), 0x4014000000000000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_3;
      v21[3] = &unk_1E9CF4AE8;
      v21[4] = self;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v17);

    }
    v18 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, &__block_literal_global_12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v20);

    -[AutomationOverlayViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "automationOverlayControllerDidDisableAutomation:");
  return result;
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "automationOverlayControllerDidCancelAutomation:");
  return result;
}

uint64_t __60__AutomationOverlayViewController__interceptUserInteraction__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleAllowsUserInteractionTemporarily:", 1);
}

- (void)_toggleAllowsUserInteractionTemporarily:(BOOL)a3
{
  _BOOL4 allowsUserInteraction;
  id resetTemporaryUserInteractionAllowedBlock;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  BOOL v11;
  id location;

  objc_initWeak(&location, self);
  allowsUserInteraction = self->_allowsUserInteraction;
  resetTemporaryUserInteractionAllowedBlock = self->_resetTemporaryUserInteractionAllowedBlock;
  if (resetTemporaryUserInteractionAllowedBlock)
  {
    dispatch_block_cancel(resetTemporaryUserInteractionAllowedBlock);
    v7 = self->_resetTemporaryUserInteractionAllowedBlock;
    self->_resetTemporaryUserInteractionAllowedBlock = 0;

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke;
  v8[3] = &unk_1E9CF4B58;
  v10 = a3;
  objc_copyWeak(&v9, &location);
  v11 = allowsUserInteraction;
  -[AutomationOverlayViewController _setAllowsUserInteraction:completionHandler:](self, "_setAllowsUserInteraction:completionHandler:", !allowsUserInteraction, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke(uint64_t a1)
{
  id *v2;
  dispatch_block_t *WeakRetained;
  dispatch_block_t v4;
  dispatch_block_t v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  char v9;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = (dispatch_block_t *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke_2;
      v7[3] = &unk_1E9CF4B30;
      objc_copyWeak(&v8, v2);
      v9 = *(_BYTE *)(a1 + 41);
      v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v7);
      v5 = WeakRetained[123];
      WeakRetained[123] = v4;

      v6 = dispatch_time(0, 5000000000);
      dispatch_after(v6, MEMORY[0x1E0C80D38], WeakRetained[123]);
      objc_destroyWeak(&v8);
    }

  }
}

void __75__AutomationOverlayViewController__toggleAllowsUserInteractionTemporarily___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setAllowsUserInteraction:completionHandler:", *(unsigned __int8 *)(a1 + 40), 0);

}

- (void)_setAllowsUserInteraction:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke;
  v12[3] = &unk_1E9CF1EE8;
  v12[4] = self;
  v13 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E9CF4B80;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v12, v9, 0.5);

}

void __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __79__AutomationOverlayViewController__setAllowsUserInteraction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 976) = *(_BYTE *)(a1 + 48);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "automationOverlayController:didChangeAllowsUserInteraction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 976));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetTemporaryUserInteractionAllowedBlock, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
