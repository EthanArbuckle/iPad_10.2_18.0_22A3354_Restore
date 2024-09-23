@implementation IAMModalWebMessageViewController

- (IAMModalWebMessageViewController)initWithWebView:(id)a3
{
  id v5;
  IAMModalWebMessageViewController *v6;
  IAMModalWebMessageViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IAMModalWebMessageViewController;
  v6 = -[IAMModalWebMessageViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webView, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IAMModalWebMessageViewController;
  -[IAMModalWebMessageViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[IAMModalWebMessageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[IAMWebView setFrame:](self->_webView, "setFrame:");

  -[IAMWebView setAutoresizingMask:](self->_webView, "setAutoresizingMask:", 18);
  -[IAMModalWebMessageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_webView);

}

- (UIButton)closeButton
{
  UIButton *closeButton;
  UIButton *v4;
  UIButton *v5;

  closeButton = self->_closeButton;
  if (!closeButton)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 7);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__handleCloseButtonTap_, 64);
    v5 = self->_closeButton;
    self->_closeButton = v4;

    closeButton = self->_closeButton;
  }
  return closeButton;
}

- (void)setShouldDisplayCloseButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  if (self->_shouldDisplayCloseButton != a3)
  {
    self->_shouldDisplayCloseButton = a3;
    if (a3)
    {
      -[IAMModalWebMessageViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", v5);

      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v7 = (void *)MEMORY[0x24BDD1628];
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v8;
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 16.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -16.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activateConstraints:", v17);
    }
    else
    {
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isDescendantOfView:", v19);

      if (!v20)
        return;
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      v22 = (void *)MEMORY[0x24BDD1628];
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v10, 16.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v11;
      -[IAMModalWebMessageViewController closeButton](self, "closeButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IAMModalWebMessageViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -16.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deactivateConstraints:", v17);
    }

  }
}

- (void)_handleCloseButtonTap:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[IAMModalWebMessageViewController metricsDelegate](self, "metricsDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IAMModalWebMessageViewController metricsDelegate](self, "metricsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewController:didReportDismissalAction:", self, 0);

  }
  -[IAMModalWebMessageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (IAMViewControllerMetricsDelegate)metricsDelegate
{
  return (IAMViewControllerMetricsDelegate *)objc_loadWeakRetained((id *)&self->_metricsDelegate);
}

- (void)setMetricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metricsDelegate, a3);
}

- (BOOL)shouldDisplayCloseButton
{
  return self->_shouldDisplayCloseButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (IAMWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
}

@end
