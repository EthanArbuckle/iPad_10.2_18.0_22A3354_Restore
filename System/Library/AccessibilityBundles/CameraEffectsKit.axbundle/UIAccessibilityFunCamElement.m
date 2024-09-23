@implementation UIAccessibilityFunCamElement

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (-[UIAccessibilityFunCamElement tracked](self, "tracked"))
  {
    objc_initWeak(&location, self);
    -[UIAccessibilityFunCamElement timer](self, "timer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x24BE005F0]);
      -[UIAccessibilityFunCamElement setTimer:](self, "setTimer:", v4);

    }
    -[UIAccessibilityFunCamElement timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__UIAccessibilityFunCamElement_accessibilityElementDidBecomeFocused__block_invoke;
    v6[3] = &unk_2501A9D50;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "afterDelay:processBlock:", v6, 0.1);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __68__UIAccessibilityFunCamElement_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateElementFrame");

}

- (void)accessibilityElementDidLoseFocus
{
  id v2;

  -[UIAccessibilityFunCamElement timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)updateElementFrame
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[UIAccessibilityFunCamElement timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE005F0]);
    -[UIAccessibilityFunCamElement setTimer:](self, "setTimer:", v4);

  }
  if (-[UIAccessibilityFunCamElement accessibilityElementIsFocused](self, "accessibilityElementIsFocused"))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], self);
    objc_initWeak(&location, self);
    -[UIAccessibilityFunCamElement timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__UIAccessibilityFunCamElement_updateElementFrame__block_invoke;
    v6[3] = &unk_2501A9D50;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "afterDelay:processBlock:", v6, 0.1);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __50__UIAccessibilityFunCamElement_updateElementFrame__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateElementFrame");

}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)tracked
{
  return self->_tracked;
}

- (void)setTracked:(BOOL)a3
{
  self->_tracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
