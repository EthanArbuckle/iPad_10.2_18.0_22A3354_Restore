@implementation CSComplicationWrapperViewController

- (CSComplicationWrapperViewController)initWithWidgetHostViewController:(id)a3
{
  id v5;
  CSComplicationWrapperViewController *v6;
  CSComplicationWrapperViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSComplicationWrapperViewController;
  v6 = -[CSComplicationWrapperViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_widgetHostViewController, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CHUISWidgetHostViewController invalidate](self->_widgetHostViewController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSComplicationWrapperViewController;
  -[CSComplicationWrapperViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSComplicationWrapperViewController;
  -[CSComplicationWrapperViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CSComplicationWrapperViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_widgetHostViewController);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  UIView *v7;
  UIView *dimmingView;
  UIView *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    if (!self->_dimmingView)
    {
      v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
      -[CSComplicationWrapperViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      dimmingView = self->_dimmingView;
      self->_dimmingView = v7;

      -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
      v9 = self->_dimmingView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.600000024);
      -[CSComplicationWrapperViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_dimmingView);

    }
    v12 = self->_dimmingView;
    if (v3)
    {
      -[CHUISWidgetHostViewController snapshotView](self->_widgetHostViewController, "snapshotView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setMaskView:](v12, "setMaskView:", v13);

    }
    else
    {
      -[UIView setMaskView:](self->_dimmingView, "setMaskView:", 0);
    }
    -[UIView setHidden:](self->_dimmingView, "setHidden:", !v3);
  }
}

- (CHUISWidgetHostViewController)widgetHostViewController
{
  return self->_widgetHostViewController;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_widgetHostViewController, 0);
}

@end
