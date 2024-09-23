@implementation BKUIAlertView

- (BKUIAlertView)init
{
  BKUIAlertView *v2;
  BKUIAlertView *v3;
  os_log_t v4;
  OS_os_log *bkui_alert_view_log;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIAlertView;
  v2 = -[BKUIAlertView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BKUIAlertView _init](v2, "_init");
    v4 = os_log_create("com.apple.biometrickitui", "AlertView");
    bkui_alert_view_log = v3->bkui_alert_view_log;
    v3->bkui_alert_view_log = (OS_os_log *)v4;

  }
  return v3;
}

- (void)_init
{
  UIAlertController *alertController;

  alertController = self->_alertController;
  self->_alertController = 0;

}

- (void)show:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 viewController:(id)a6
{
  -[BKUIAlertView show:title:message:cancelButtonTitle:cancelButtonSelector:otherButtonTitle:otherButtonSelector:viewController:](self, "show:title:message:cancelButtonTitle:cancelButtonSelector:otherButtonTitle:otherButtonSelector:viewController:", 0, a3, a4, a5, 0, 0, 0, a6);
}

- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 viewController:(id)a8
{
  -[BKUIAlertView show:title:message:cancelButtonTitle:cancelButtonSelector:otherButtonTitle:otherButtonSelector:viewController:](self, "show:title:message:cancelButtonTitle:cancelButtonSelector:otherButtonTitle:otherButtonSelector:viewController:", a3, a4, a5, a6, a7, 0, 0, a8);
}

- (void)show:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 cancelButtonSelector:(SEL)a7 otherButtonTitle:(id)a8 otherButtonSelector:(SEL)a9 viewController:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *bkui_alert_view_log;
  id WeakRetained;
  void *v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  UIAlertController *alertController;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v34 = a6;
  v33 = a8;
  v19 = a10;
  bkui_alert_view_log = self->bkui_alert_view_log;
  if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v17;
    v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_1DB281000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Show alert with title: \"%@\", message: \"%@\", buf, 0x16u);
  }
  objc_storeWeak(&self->_parent, v16);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);
  objc_msgSend(WeakRetained, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained((id *)&self->_alertHudView);
  objc_msgSend(v22, "bringSubviewToFront:", v23);

  v24 = objc_loadWeakRetained((id *)&self->_alertHudView);
  if (v24)
  {
    if (CACurrentMediaTime() - self->_alertHudTextStartTime > self->_alertHudMinDisplayTime)
    {
      v25 = objc_loadWeakRetained((id *)&self->_alertHudView);
      v26 = objc_msgSend(v25, "isHidden");

      if ((v26 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideAlertHudView, 0);
      v27 = objc_loadWeakRetained((id *)&self->_alertHudText);
      objc_msgSend(v27, "setText:", v18);

      self->_alertHudTextStartTime = CACurrentMediaTime();
      v28 = objc_loadWeakRetained((id *)&self->_alertHudView);
      -[BKUIAlertView _setFadeAnimation:](self, "_setFadeAnimation:", v28);

      v29 = objc_loadWeakRetained((id *)&self->_alertHudView);
      objc_msgSend(v29, "setHidden:", 0);

      -[BKUIAlertView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideAlertHudView, 0, self->_alertHudTimeout);
    }
  }
  else
  {
    self->_cancelButtonSelector = a7;
    self->_otherButtonSelector = a9;
    -[UIAlertController view](self->_alertController, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      alertController = self->_alertController;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __127__BKUIAlertView_show_title_message_cancelButtonTitle_cancelButtonSelector_otherButtonTitle_otherButtonSelector_viewController___block_invoke;
      v35[3] = &unk_1EA27FCC8;
      v35[4] = self;
      v36 = v17;
      v37 = v18;
      v38 = v34;
      v39 = v33;
      v40 = v19;
      -[UIAlertController dismissViewControllerAnimated:completion:](alertController, "dismissViewControllerAnimated:completion:", 0, v35);

    }
    else
    {
      -[BKUIAlertView showAlert:message:cancelButtonTitle:otherButtonTitle:viewController:](self, "showAlert:message:cancelButtonTitle:otherButtonTitle:viewController:", v17, v18, v34, v33, v19);
    }
  }

}

uint64_t __127__BKUIAlertView_show_title_message_cancelButtonTitle_cancelButtonSelector_otherButtonTitle_otherButtonSelector_viewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlert:message:cancelButtonTitle:otherButtonTitle:viewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)showAlert:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 viewController:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *bkui_alert_view_log;
  UIAlertController *v18;
  UIAlertController *alertController;
  UIAlertController *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  UIAlertController *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  bkui_alert_view_log = self->bkui_alert_view_log;
  if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1DB281000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Show alert with title: \"%@\", message: \"%@\", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, v13);
  v18 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v18;

  v20 = self->_alertController;
  v21 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke;
  v28[3] = &unk_1EA27FCF0;
  v28[4] = self;
  v22 = v14;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v14, 1, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v20, "addAction:", v23);

  if (v15)
  {
    v24 = self->_alertController;
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke_2;
    v27[3] = &unk_1EA27FCF0;
    v27[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v15, 0, v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v24, "addAction:", v25);

  }
  objc_msgSend(v16, "presentViewController:animated:completion:", self->_alertController, 1, 0);

}

void __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "performSelector:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));

}

void __85__BKUIAlertView_showAlert_message_cancelButtonTitle_otherButtonTitle_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "performSelector:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));

}

- (BOOL)isAlertHidden
{
  UIView **p_alertHudView;
  id WeakRetained;
  id v5;
  uint64_t v6;
  NSObject *bkui_alert_view_log;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIAlertController *alertController;
  void *v15;
  void *v16;

  p_alertHudView = &self->_alertHudView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_alertHudView);
    v6 = objc_msgSend(v5, "isHidden");

    bkui_alert_view_log = self->bkui_alert_view_log;
    if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEBUG))
LABEL_8:
      -[BKUIAlertView isAlertHidden].cold.1(v6, bkui_alert_view_log, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    alertController = self->_alertController;
    if (alertController)
    {
      -[UIAlertController view](alertController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v16 == 0;

    }
    else
    {
      v6 = 1;
    }
    bkui_alert_view_log = self->bkui_alert_view_log;
    if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
  }
  return v6;
}

- (void)hideAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIView **p_alertHudView;
  id WeakRetained;
  id v7;
  char v8;
  NSObject *bkui_alert_view_log;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  p_alertHudView = &self->_alertHudView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_alertHudView);
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      bkui_alert_view_log = self->bkui_alert_view_log;
      if (os_log_type_enabled(bkui_alert_view_log, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 67109120;
        v14 = v3;
        _os_log_impl(&dword_1DB281000, bkui_alert_view_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Hiding alert animated: %i", (uint8_t *)&v13, 8u);
      }
      if (CACurrentMediaTime() - self->_alertHudTextStartTime > self->_alertHudMinDisplayTime)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideAlertHudView, 0);
        -[BKUIAlertView _hideAlertHudView](self, "_hideAlertHudView");
      }
    }
  }
  else
  {
    -[UIAlertController view](self->_alertController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = self->bkui_alert_view_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 67109120;
        v14 = v3;
        _os_log_impl(&dword_1DB281000, v12, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Hiding alert animated: %i", (uint8_t *)&v13, 8u);
      }
      -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", v3, 0);
    }
  }
}

- (void)_hideAlertHudView
{
  UIView **p_alertHudView;
  id WeakRetained;
  id v5;

  p_alertHudView = &self->_alertHudView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertHudView);
  -[BKUIAlertView _setFadeAnimation:](self, "_setFadeAnimation:", WeakRetained);

  v5 = objc_loadWeakRetained((id *)p_alertHudView);
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)_setFadeAnimation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CD28D0];
  v4 = a3;
  objc_msgSend(v3, "animation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v5);

  objc_msgSend(v8, "setDuration:", 0.2);
  objc_msgSend(v8, "setType:", CFSTR("fade"));
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAnimation:forKey:", v8, *MEMORY[0x1E0CD3168]);
}

- (id)parent
{
  return objc_loadWeakRetained(&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak(&self->_parent, a3);
}

- (SEL)cancelButtonSelector
{
  return self->_cancelButtonSelector;
}

- (void)setCancelButtonSelector:(SEL)a3
{
  self->_cancelButtonSelector = a3;
}

- (SEL)otherButtonSelector
{
  return self->_otherButtonSelector;
}

- (void)setOtherButtonSelector:(SEL)a3
{
  self->_otherButtonSelector = a3;
}

- (UIView)alertHudView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_alertHudView);
}

- (void)setAlertHudView:(id)a3
{
  objc_storeWeak((id *)&self->_alertHudView, a3);
}

- (UILabel)alertHudText
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_alertHudText);
}

- (void)setAlertHudText:(id)a3
{
  objc_storeWeak((id *)&self->_alertHudText, a3);
}

- (double)alertHudTimeout
{
  return self->_alertHudTimeout;
}

- (void)setAlertHudTimeout:(double)a3
{
  self->_alertHudTimeout = a3;
}

- (double)alertHudMinDisplayTime
{
  return self->_alertHudMinDisplayTime;
}

- (void)setAlertHudMinDisplayTime:(double)a3
{
  self->_alertHudMinDisplayTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertHudText);
  objc_destroyWeak((id *)&self->_alertHudView);
  objc_destroyWeak(&self->_parent);
  objc_storeStrong((id *)&self->bkui_alert_view_log, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (void)isAlertHidden
{
  OUTLINED_FUNCTION_0_1(&dword_1DB281000, a2, a3, "BiometricKitUI: Is alert hidden: %i", a5, a6, a7, a8, 0);
}

@end
