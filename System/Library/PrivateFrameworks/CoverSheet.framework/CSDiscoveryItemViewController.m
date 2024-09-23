@implementation CSDiscoveryItemViewController

- (CSDiscoveryItemViewController)initWithPlatterDiscoveryView:(id)a3 firstDidAppearCompletion:(id)a4
{
  id v7;
  id v8;
  CSDiscoveryItemViewController *v9;
  CSDiscoveryItemViewController *v10;
  uint64_t v11;
  id firstDidAppearCompletion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDiscoveryItemViewController;
  v9 = -[CSDiscoveryItemViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platterDiscoveryView, a3);
    v11 = MEMORY[0x1D17E1614](v8);
    firstDidAppearCompletion = v10->_firstDidAppearCompletion;
    v10->_firstDidAppearCompletion = (id)v11;

  }
  return v10;
}

- (void)loadView
{
  -[CSDiscoveryItemViewController setView:](self, "setView:", self->_platterDiscoveryView);
  -[CSDiscoveryItemViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[PLPlatterDiscoveryView overrideUserInterfaceStyle](self->_platterDiscoveryView, "overrideUserInterfaceStyle"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemViewController;
  -[CSDiscoveryItemViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_visible = 1;
  -[CSDiscoveryItemViewController _callFirstDidAppearCompletionIfNecessary](self, "_callFirstDidAppearCompletionIfNecessary");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemViewController;
  -[CSDiscoveryItemViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_visible = 0;
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    -[CSDiscoveryItemViewController _callFirstDidAppearCompletionIfNecessary](self, "_callFirstDidAppearCompletionIfNecessary");
  }
}

- (void)_callFirstDidAppearCompletionIfNecessary
{
  void (**firstDidAppearCompletion)(id, SEL);
  id v4;

  if (self->_visible && self->_screenOn)
  {
    firstDidAppearCompletion = (void (**)(id, SEL))self->_firstDidAppearCompletion;
    if (firstDidAppearCompletion)
    {
      firstDidAppearCompletion[2](firstDidAppearCompletion, a2);
      v4 = self->_firstDidAppearCompletion;
      self->_firstDidAppearCompletion = 0;

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (PLPlatterDiscoveryView)platterDiscoveryView
{
  return self->_platterDiscoveryView;
}

- (void)setPlatterDiscoveryView:(id)a3
{
  objc_storeStrong((id *)&self->_platterDiscoveryView, a3);
}

- (id)firstDidAppearCompletion
{
  return self->_firstDidAppearCompletion;
}

- (void)setFirstDidAppearCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstDidAppearCompletion, 0);
  objc_storeStrong((id *)&self->_platterDiscoveryView, 0);
}

@end
