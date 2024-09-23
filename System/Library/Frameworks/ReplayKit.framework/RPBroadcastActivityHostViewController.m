@implementation RPBroadcastActivityHostViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPBroadcastActivityHostViewController;
  -[RPBroadcastActivityHostViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPBroadcastActivityHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  _BOOL8 v6;
  RPBroadcastActivityViewController **p_broadcastActivityViewController;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v6 = a6;
  p_broadcastActivityViewController = &self->_broadcastActivityViewController;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
  objc_msgSend(WeakRetained, "extensionDidFinishWithLaunchURL:broadcastURL:extensionBundleID:cancelled:", v12, v11, v10, v6);

}

- (CGRect)popoverControllerSourceRect
{
  RPBroadcastActivityViewController **p_broadcastActivityViewController;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  p_broadcastActivityViewController = &self->_broadcastActivityViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  objc_msgSend(WeakRetained, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
    objc_msgSend(v5, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
    objc_msgSend(v8, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v7, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:toView:", v19, v11, v13, v15, v17);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

  }
  else
  {
    v21 = *MEMORY[0x24BDBF090];
    v23 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v25 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v27 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (unint64_t)popoverArrowDirection
{
  id WeakRetained;
  void *v3;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  objc_msgSend(WeakRetained, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "arrowDirection");

  return v4;
}

- (int64_t)modalPresentationStyle
{
  id WeakRetained;
  int64_t v4;
  CGRect v6;

  -[RPBroadcastActivityHostViewController popoverControllerSourceRect](self, "popoverControllerSourceRect");
  if (!CGRectEqualToRect(v6, *MEMORY[0x24BDBF090]))
    return 7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  v4 = objc_msgSend(WeakRetained, "modalPresentationStyle");

  return v4;
}

- (void)presentationInfoWithCompletion:(id)a3
{
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v5 = -[RPBroadcastActivityHostViewController modalPresentationStyle](self, "modalPresentationStyle");
  -[RPBroadcastActivityHostViewController popoverControllerSourceRect](self, "popoverControllerSourceRect");
  (*((void (**)(id, int64_t, unint64_t, double, double, double, double))a3 + 2))(v10, v5, -[RPBroadcastActivityHostViewController popoverArrowDirection](self, "popoverArrowDirection"), v6, v7, v8, v9);

}

- (RPBroadcastActivityViewController)broadcastActivityViewController
{
  return (RPBroadcastActivityViewController *)objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
}

- (void)setBroadcastActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_broadcastActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_broadcastActivityViewController);
}

@end
