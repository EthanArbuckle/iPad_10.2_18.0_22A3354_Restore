@implementation AutomationOverlayWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  id WeakRetained;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AutomationOverlayWindow;
  -[AutomationOverlayWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_automationWindowDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "automationWindowAllowsUserInteraction:", self) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (AutomationOverlayWindowDelegate)automationWindowDelegate
{
  return (AutomationOverlayWindowDelegate *)objc_loadWeakRetained((id *)&self->_automationWindowDelegate);
}

- (void)setAutomationWindowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_automationWindowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_automationWindowDelegate);
}

@end
