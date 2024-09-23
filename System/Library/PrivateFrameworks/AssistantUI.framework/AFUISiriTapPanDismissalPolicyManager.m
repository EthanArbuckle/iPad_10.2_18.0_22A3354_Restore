@implementation AFUISiriTapPanDismissalPolicyManager

- (AFUISiriTapPanDismissalPolicyManager)initWithPolicy:(int64_t)a3 delegate:(id)a4
{
  id v6;
  AFUISiriTapPanDismissalPolicyManager *v7;
  AFUISiriTapPanDismissalPolicyManager *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AFUISiriTapPanDismissalPolicyManager;
  v7 = -[AFUISiriTapPanDismissalPolicyManager init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AFUISiriTapPanDismissalPolicyManager _setDismissalPolicy:](v7, "_setDismissalPolicy:", a3);
    -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:](v8, "_setShouldDismissForTapsAndPans:", 0);
    -[AFUISiriTapPanDismissalPolicyManager _setDelegate:](v8, "_setDelegate:", v6);
  }

  return v8;
}

- (void)idleAndQuietDidChange:(BOOL)a3 forSessionState:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriTapPanDismissalPolicyManager _setIdleAndQuiet:](self, "_setIdleAndQuiet:");
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[AFUISiriTapPanDismissalPolicyManager idleAndQuietDidChange:forSessionState:]";
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss Siri for state:%@ siriIsIdleAndQuiet:%@", (uint8_t *)&v13, 0x20u);

  }
  v12 = -[AFUISiriTapPanDismissalPolicyManager _dismissalPolicy](self, "_dismissalPolicy");
  if (v12 == 2)
  {
    -[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughUnlessDimmed:forSessionState:](self, "_dismissalPolicyForPassThroughUnlessDimmed:forSessionState:", -[AFUISiriTapPanDismissalPolicyManager _dimmingLayerVisible](self, "_dimmingLayerVisible"), a4);
  }
  else if (!v12)
  {
    -[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughAlways:forSessionState:](self, "_dismissalPolicyForPassThroughAlways:forSessionState:", v5, a4);
  }
}

- (void)dimmingLayerVisibilityDidChange:(BOOL)a3 forSessionState:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v5 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriTapPanDismissalPolicyManager _setDimmingLayerVisible:](self, "_setDimmingLayerVisible:");
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[AFUISiriTapPanDismissalPolicyManager dimmingLayerVisibilityDidChange:forSessionState:]";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss for dimming layer change:%@ sessiontState:%@", (uint8_t *)&v12, 0x20u);

  }
  if (-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicy](self, "_dismissalPolicy") == 2)
    -[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughUnlessDimmed:forSessionState:](self, "_dismissalPolicyForPassThroughUnlessDimmed:forSessionState:", v5, a4);
}

- (void)inputTypeDidChange:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[AFUISiriTapPanDismissalPolicyManager inputTypeDidChange:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss for input type:%@", (uint8_t *)&v9, 0x16u);

  }
  if (-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicy](self, "_dismissalPolicy") == 3)
    -[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughUnlessTypeToSiri:](self, "_dismissalPolicyForPassThroughUnlessTypeToSiri:", a3);
}

- (void)invalidate
{
  if (-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicy](self, "_dismissalPolicy") != 1)
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateDelegateOfPolicyChange, 0);
    -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:](self, "_setShouldDismissForTapsAndPans:", 0);
    -[AFUISiriTapPanDismissalPolicyManager _updateDelegateOfPolicyChange](self, "_updateDelegateOfPolicyChange");
  }
}

- (void)_dismissalPolicyForPassThroughAlways:(BOOL)a3 forSessionState:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (self->_dismissalPolicy)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriTapPanDismissalPolicyManager.m"), 99, CFSTR("Can't perform policy updates for iPad from a different device class"));

  }
  if (a4 != 4)
  {
    if (a4 == 3)
    {
      v7 = 1;
      goto LABEL_9;
    }
    if (a4)
    {
      v5 = 0;
      v7 = 0;
      goto LABEL_9;
    }
  }
  v7 = 0;
  v5 = 1;
LABEL_9:
  -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:](self, "_setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:", v5, v7);
}

- (void)_dismissalPolicyForPassThroughUnlessDimmed:(BOOL)a3 forSessionState:(int64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  uint64_t v8;
  _BOOL8 v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v5 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicy](self, "_dismissalPolicy") == 1)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughUnlessDimmed:forSessionState:]";
      _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal Not updating tap pan dismissal policy on phone, feature flag not enabled.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) >= 4)
      v8 = a4 == 0;
    else
      v8 = v5;
    v9 = (unint64_t)(a4 - 1) < 4 && v5;
    -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:](self, "_setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:", v8, v9);
  }
}

- (void)_dismissalPolicyForPassThroughUnlessTypeToSiri:(int64_t)a3
{
  -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:](self, "_setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:", a3 == 1, 0);
}

- (void)_setShouldDismissForTapsAndPans:(BOOL)a3 shouldDelayDelegateUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldDismissForTapsAndPans != a3)
  {
    v4 = a4;
    v5 = a3;
    -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:](self, "_setShouldDismissForTapsAndPans:");
    v7 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v8 = 0.7;
      else
        v8 = 0.0;
      v9 = (void *)MEMORY[0x24BDD16E0];
      v10 = v7;
      objc_msgSend(v9, "numberWithDouble:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:]";
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s #dismissal: cancelling pending tap/pan dismissal policy update. Scheduling new update with delay:%@ shouldDismiss:%@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateDelegateOfPolicyChange, 0);
    if (v4)
      -[AFUISiriTapPanDismissalPolicyManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateDelegateOfPolicyChange, 0, 0.7);
    else
      -[AFUISiriTapPanDismissalPolicyManager _updateDelegateOfPolicyChange](self, "_updateDelegateOfPolicyChange");
  }
}

- (void)_updateDelegateOfPolicyChange
{
  id v3;

  -[AFUISiriTapPanDismissalPolicyManager _delegate](self, "_delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tapPanDismissalPolicyManager:dismissalPolicyDidChange:", self, -[AFUISiriTapPanDismissalPolicyManager _shouldDismissForTapsAndPans](self, "_shouldDismissForTapsAndPans"));

}

- (BOOL)_shouldDismissForTapsAndPans
{
  return self->_shouldDismissForTapsAndPans;
}

- (void)_setShouldDismissForTapsAndPans:(BOOL)a3
{
  self->_shouldDismissForTapsAndPans = a3;
}

- (BOOL)_idleAndQuiet
{
  return self->_idleAndQuiet;
}

- (void)_setIdleAndQuiet:(BOOL)a3
{
  self->_idleAndQuiet = a3;
}

- (BOOL)_dimmingLayerVisible
{
  return self->_dimmingLayerVisible;
}

- (void)_setDimmingLayerVisible:(BOOL)a3
{
  self->_dimmingLayerVisible = a3;
}

- (int64_t)_dismissalPolicy
{
  return self->_dismissalPolicy;
}

- (void)_setDismissalPolicy:(int64_t)a3
{
  self->_dismissalPolicy = a3;
}

- (AFUISiriTapPanDismissalPolicyManagerDelegate)_delegate
{
  return (AFUISiriTapPanDismissalPolicyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
