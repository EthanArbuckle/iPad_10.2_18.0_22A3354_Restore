@implementation QLWebLocationItemViewController

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  WKWebView *v10;
  WKWebView *webView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *leftConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *rightConstraint;
  void *v30;
  void *v31;
  WKWebView *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_webView)
  {
    v3 = (void *)objc_opt_new();
    -[QLWebLocationItemViewController setView:](self, "setView:", v3);

    v4 = objc_alloc(MEMORY[0x24BDFA920]);
    -[QLItemViewController presentingDelegate](self, "presentingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostApplicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "ql_initWithForegroundPriorityAndSourceBundleIdentifier:", v6);

    v8 = objc_alloc(MEMORY[0x24BDFA918]);
    -[QLWebLocationItemViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = (WKWebView *)objc_msgSend(v8, "initWithFrame:configuration:", v7);
    webView = self->_webView;
    self->_webView = v10;

    -[QLWebLocationItemViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_webView);

    -[QLWebLocationItemViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKWebView leftAnchor](self->_webView, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLWebLocationItemViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController appearance](self, "appearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "peripheryInsets");
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ql_activatedConstraint");
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v20;

    -[QLWebLocationItemViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView rightAnchor](self->_webView, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController appearance](self, "appearance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "peripheryInsets");
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ql_activatedConstraint");
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v28;

    -[QLWebLocationItemViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD1628];
    v32 = self->_webView;
    v35 = CFSTR("webView");
    v36[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[webView]|"), 0, 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addConstraints:", v34);

  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void (**v8)(id, _QWORD);
  void *v9;
  WKWebView *webView;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v7 = (void *)MEMORY[0x24BDBCF48];
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[QLWebLocationItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[WKWebView addObserver:forKeyPath:options:context:](self->_webView, "addObserver:forKeyPath:options:context:", self, CFSTR("estimatedProgress"), 1, 0);
    webView = self->_webView;
    objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WKWebView loadRequest:](webView, "loadRequest:", v11);

    -[QLWebLocationItemViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

    v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLWebLocationItemViewController"), 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v8[2](v8, v14);

    v8 = (void (**)(id, _QWORD))v14;
  }

}

- (void)previewIsAppearingWithProgress:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLWebLocationItemViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  -[QLWebLocationItemViewController accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

}

- (void)previewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLWebLocationItemViewController;
  -[QLItemViewController previewDidAppear:](&v5, sel_previewDidAppear_, a3);
  -[QLWebLocationItemViewController accessoryView](self, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)dealloc
{
  objc_super v3;

  -[WKWebView removeObserver:forKeyPath:](self->_webView, "removeObserver:forKeyPath:", self, CFSTR("estimatedProgress"));
  v3.receiver = self;
  v3.super_class = (Class)QLWebLocationItemViewController;
  -[QLWebLocationItemViewController dealloc](&v3, sel_dealloc);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)QLWebLocationItemViewController;
  -[QLItemViewController setAppearance:animated:](&v6, sel_setAppearance_animated_, a3);
  -[QLWebLocationItemViewController _updateConstraintConstants:](self, "_updateConstraintConstants:", v4);
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (id)scrollView
{
  return -[WKWebView scrollView](self->_webView, "scrollView");
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  WKWebView *v9;
  id v10;
  double v11;
  id v12;

  v12 = a3;
  v9 = (WKWebView *)a4;
  v10 = a5;
  if (self->_loadingHandler)
  {
    if (self->_webView == v9)
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("estimatedProgress")))
      {
        -[WKWebView estimatedProgress](self->_webView, "estimatedProgress");
        if (v11 == 1.0)
          (*((void (**)(void))self->_loadingHandler + 2))();
      }
    }
  }

}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[QLWebLocationItemViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "zoomScale");
    v5 = v4;
    objc_msgSend(v3, "minimumZoomScale");
    v7 = v5 == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)accessoryView
{
  UIView *locationViewContainer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *locationView;
  void *v11;
  UIView *v12;
  UIView *v13;

  locationViewContainer = self->_locationViewContainer;
  if (!locationViewContainer)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[QLItemViewController contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[QLWebLocationBarViewInterface makeLocationBarUI:](_TtC9QuickLook29QLWebLocationBarViewInterface, "makeLocationBarUI:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    locationView = self->_locationView;
    self->_locationView = v9;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_locationView, "setBackgroundColor:", v11);

    v12 = (UIView *)objc_opt_new();
    v13 = self->_locationViewContainer;
    self->_locationViewContainer = v12;

    -[UIView addSubview:](self->_locationViewContainer, "addSubview:", self->_locationView);
    locationViewContainer = self->_locationViewContainer;
  }
  -[UIView bounds](locationViewContainer, "bounds");
  -[UIView setFrame:](self->_locationView, "setFrame:");
  return self->_locationView;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLSafariButtonIdentifier"));
  objc_msgSend(v3, "setSymbolImageName:", CFSTR("safari"));
  objc_msgSend(v3, "setPlacement:", 2);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLSafariButtonIdentifier")))
  {
    -[QLItemViewController contents](self, "contents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSObject **)MEMORY[0x24BE7BF48];
    v12 = *MEMORY[0x24BE7BF48];
    if (v10)
    {
      if (!v12)
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEFAULT, "Will open URL #AnyItemViewController", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BEBDFD0];
      v19[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "openURL:options:completionHandler:", v10, v14, &__block_literal_global_8);

    }
    else
    {
      if (!v12)
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_ERROR, "Safari button tapped but the URL is invalid: %@ #AnyItemViewController", buf, 0xCu);
      }
    }
    if (v7)
      v7[2](v7);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)QLWebLocationItemViewController;
    -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](&v15, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);
  }

}

void __81__QLWebLocationItemViewController_buttonPressedWithIdentifier_completionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject **v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_DEFAULT, "The url was opened successfully: %d #AnyItemViewController", (uint8_t *)v5, 8u);
  }
}

- (void)_updateConstraintConstants:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__QLWebLocationItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, 0.2);
  else
    (*((void (**)(void *))v4 + 2))(v4);

}

void __62__QLWebLocationItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setConstant:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_locationView, 0);
  objc_storeStrong((id *)&self->_locationViewContainer, 0);
  objc_storeStrong(&self->_loadingHandler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
