@implementation _SFAdaptivePreviewViewController

- (_SFAdaptivePreviewViewController)initWithURL:(id)a3
{
  id v4;
  _SFAdaptivePreviewViewController *v5;
  uint64_t v6;
  NSURL *URL;
  _SFAdaptivePreviewViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAdaptivePreviewViewController;
  v5 = -[_SFAdaptivePreviewViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFAdaptivePreviewViewController;
  -[_SFAdaptivePreviewViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[_SFAdaptivePreviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (_SFShouldShowLinkPreviews())
    -[_SFAdaptivePreviewViewController _setUpLinkPreviewViewControllerIfNeeded](self, "_setUpLinkPreviewViewControllerIfNeeded");
  else
    -[_SFAdaptivePreviewViewController _setUpTextPreviewViewControllerIfNeeded](self, "_setUpTextPreviewViewControllerIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAdaptivePreviewViewController;
  -[_SFAdaptivePreviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[_SFAdaptivePreviewViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_setUpLinkPreviewViewControllerIfNeeded
{
  id WeakRetained;
  _SFBrowserViewProviding *v4;
  _SFBrowserViewProviding *linkPreviewViewController;

  if (!self->_linkPreviewViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "adaptivePreviewViewController:requestLinkPreviewViewControllerWithURL:", self, self->_URL);
    v4 = (_SFBrowserViewProviding *)objc_claimAutoreleasedReturnValue();
    linkPreviewViewController = self->_linkPreviewViewController;
    self->_linkPreviewViewController = v4;

    -[_SFBrowserViewProviding setPreferredContentSize:](self->_linkPreviewViewController, "setPreferredContentSize:", self->_preferredDocumentContentSize.width, self->_preferredDocumentContentSize.height);
    -[_SFAdaptivePreviewViewController addChildViewController:](self, "addChildViewController:", self->_linkPreviewViewController);
    -[_SFAdaptivePreviewViewController _addViewFromViewController:](self, "_addViewFromViewController:", self->_linkPreviewViewController);
    -[_SFBrowserViewProviding didMoveToParentViewController:](self->_linkPreviewViewController, "didMoveToParentViewController:", self);
  }
}

- (void)_addViewFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAdaptivePreviewViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = 1144586240;
  v19 = v9;
  objc_msgSend(v9, "setPriority:", v10);
  v20 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(v6, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(v6, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  v23[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v18);

}

- (void)_setUpTextPreviewViewControllerIfNeeded
{
  _SFURLTextPreviewViewController *v3;
  _SFURLTextPreviewViewController *textPreviewViewController;
  id v5;

  if (!self->_textPreviewViewController)
  {
    v3 = -[_SFURLTextPreviewViewController initWithURL:]([_SFURLTextPreviewViewController alloc], "initWithURL:", self->_URL);
    textPreviewViewController = self->_textPreviewViewController;
    self->_textPreviewViewController = v3;

    -[_SFAdaptivePreviewViewController addChildViewController:](self, "addChildViewController:", self->_textPreviewViewController);
    -[_SFAdaptivePreviewViewController _addViewFromViewController:](self, "_addViewFromViewController:", self->_textPreviewViewController);
    -[_SFURLTextPreviewViewController didMoveToParentViewController:](self->_textPreviewViewController, "didMoveToParentViewController:", self);
    -[_SFURLTextPreviewViewController _previewHeader](self->_textPreviewViewController, "_previewHeader");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
}

- (void)_removeViewController:(id)a3
{
  _SFURLTextPreviewViewController *v4;
  void *v5;
  _QWORD *p_textPreviewViewController;
  _SFURLTextPreviewViewController *v7;

  v4 = (_SFURLTextPreviewViewController *)a3;
  if (v4)
  {
    v7 = v4;
    -[_SFURLTextPreviewViewController view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[_SFAdaptivePreviewViewController removeChildViewController:](self, "removeChildViewController:", v7);
    -[_SFURLTextPreviewViewController didMoveToParentViewController:](v7, "didMoveToParentViewController:", 0);
    v4 = v7;
    p_textPreviewViewController = &self->_textPreviewViewController;
    if (self->_textPreviewViewController == v7
      || (p_textPreviewViewController = &self->_linkPreviewViewController,
          (_SFURLTextPreviewViewController *)self->_linkPreviewViewController == v7))
    {
      *p_textPreviewViewController = 0;

      v4 = v7;
    }
  }

}

- (void)setLinkPreviewEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[5];

  v3 = a3;
  if (a3)
  {
    -[_SFAdaptivePreviewViewController _setUpLinkPreviewViewControllerIfNeeded](self, "_setUpLinkPreviewViewControllerIfNeeded");
    v5 = &OBJC_IVAR____SFAdaptivePreviewViewController__textPreviewViewController;
  }
  else
  {
    -[_SFAdaptivePreviewViewController _setUpTextPreviewViewControllerIfNeeded](self, "_setUpTextPreviewViewControllerIfNeeded");
    v5 = &OBJC_IVAR____SFAdaptivePreviewViewController__linkPreviewViewController;
  }
  -[_SFAdaptivePreviewViewController _removeViewController:](self, "_removeViewController:", *(Class *)((char *)&self->super.super.super.isa + *v5));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___SFAdaptivePreviewViewController_setLinkPreviewEnabled___block_invoke;
  v8[3] = &unk_1E4ABFE00;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E0D4F698], v6, (CFStringRef)*MEMORY[0x1E0C9B228]);
  CFPreferencesAppSynchronize(v7);

}

- (UIViewController)contentViewController
{
  void *linkPreviewViewController;

  linkPreviewViewController = self->_linkPreviewViewController;
  if (!linkPreviewViewController)
    linkPreviewViewController = self->_textPreviewViewController;
  return (UIViewController *)linkPreviewViewController;
}

- (BOOL)showingLinkPreview
{
  return self->_linkPreviewViewController != 0;
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 1;
}

- (void)setPreferredDocumentContentSize:(CGSize)a3
{
  _SFBrowserViewProviding *linkPreviewViewController;

  if (a3.width != self->_preferredDocumentContentSize.width || a3.height != self->_preferredDocumentContentSize.height)
  {
    self->_preferredDocumentContentSize = a3;
    linkPreviewViewController = self->_linkPreviewViewController;
    if (linkPreviewViewController)
    {
      -[_SFBrowserViewProviding setPreferredContentSize:](linkPreviewViewController, "setPreferredContentSize:");
      -[_SFAdaptivePreviewViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    }
  }
}

- (void)_updatePreferredContentSize
{
  _SFURLTextPreviewViewController *textPreviewViewController;
  void *v4;
  void *v5;
  void *v6;
  double Width;
  double v8;
  double v9;
  double height;
  id WeakRetained;
  double v12;
  double v13;
  id v14;
  _QWORD v15[5];
  id v16;
  CGRect v17;

  textPreviewViewController = self->_textPreviewViewController;
  if (textPreviewViewController)
  {
    -[_SFURLTextPreviewViewController view](textPreviewViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63___SFAdaptivePreviewViewController__updatePreferredContentSize__block_invoke;
    v15[3] = &unk_1E4ABFB20;
    v15[4] = self;
    v16 = v4;
    v14 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v15);
    -[_SFAdaptivePreviewViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v17);

    LODWORD(v8) = 1148846080;
    LODWORD(v9) = 1112014848;
    objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v8, v9);
    -[_SFAdaptivePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0);

  }
  else if (self->_linkPreviewViewController && self->_preferredDocumentContentSize.width != 0.0)
  {
    height = self->_preferredDocumentContentSize.height;
    if (height == 0.0)
    {
      v13 = 0.0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "headerViewHeightForAdaptivePreviewViewController:", self);
      height = height + v12;

      v13 = self->_preferredDocumentContentSize.width;
    }
    -[_SFAdaptivePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v13, height);
  }
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "adaptivePreviewViewControllerWillDisableLinkPreview:", self);

  }
  -[_SFAdaptivePreviewViewController setLinkPreviewEnabled:](self, "setLinkPreviewEnabled:", v4);
}

- (void)linkPreviewHeaderBoundsDidChange:(id)a3
{
  if (self->_linkPreviewViewController)
    -[_SFAdaptivePreviewViewController _updatePreferredContentSize](self, "_updatePreferredContentSize", a3);
}

- (_SFAdaptivePreviewViewControllerDelegate)delegate
{
  return (_SFAdaptivePreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)linkActions
{
  return self->_linkActions;
}

- (void)setLinkActions:(id)a3
{
  objc_storeStrong((id *)&self->_linkActions, a3);
}

- (_WKActivatedElementInfo)activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)setActivatedElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activatedElementInfo, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (CGSize)preferredDocumentContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredDocumentContentSize.width;
  height = self->_preferredDocumentContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkPreviewViewController, 0);
  objc_storeStrong((id *)&self->_textPreviewViewController, 0);
}

@end
