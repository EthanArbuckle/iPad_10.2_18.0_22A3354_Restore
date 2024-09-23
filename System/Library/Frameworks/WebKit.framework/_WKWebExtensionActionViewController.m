@implementation _WKWebExtensionActionViewController

- (_WKWebExtensionActionViewController)initWithWebExtensionAction:(void *)a3
{
  _WKWebExtensionActionViewController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *m_ptr;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  id v14;
  _WKWebExtensionActionWebView *v15;
  _WKWebExtensionActionViewController *v16;
  _WKWebExtensionActionWebView *popupWebView;
  void *v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_WKWebExtensionActionViewController;
  v4 = -[_WKWebExtensionActionViewController init](&v25, sel_init);
  if (v4 && (v5 = *((_QWORD *)a3 + 3)) != 0 && (v6 = *(_QWORD *)(v5 + 8)) != 0)
  {
    CFRetain(*(CFTypeRef *)(v6 - 8));
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 4, (uint64_t)a3);
    v8 = (unsigned int *)*((_QWORD *)a3 + 2);
    if (v8)
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 + 1, v8));
    }
    m_ptr = (unsigned int *)v4->_webExtensionAction.m_impl.m_ptr;
    v4->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v8;
    if (m_ptr)
    {
      do
      {
        v11 = __ldaxr(m_ptr);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, m_ptr));
      if (!v12)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v7);
      }
    }
    WebKit::WebExtensionAction::popupWebView((WebKit::WebExtensionAction *)a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (_WKWebExtensionActionWebView *)v14;
    else
      v15 = 0;

    popupWebView = v4->_popupWebView;
    v4->_popupWebView = v15;

    -[_WKWebExtensionActionViewController setView:](v4, "setView:", v4->_popupWebView);
    -[_WKWebExtensionActionViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 7);
    -[_WKWebExtensionActionViewController popoverPresentationController](v4, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v4);

    -[_WKWebExtensionActionViewController navigationItem](v4, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(uint64_t **)(v6 + 40);
    WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)v20);
    WTF::RetainPtr<__IOHIDDevice *>::get(v20 + 24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v4, sel__dismissPopup);
    objc_msgSend(v19, "setRightBarButtonItem:", v22);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v4, sel__viewControllerDismissalTransitionDidEnd_, *MEMORY[0x1E0CEBA38], 0);

    v16 = v4;
    CFRelease(*(CFTypeRef *)(v6 - 8));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == 1)
    return 2;
  else
    return 7;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  WTF::dynamic_objc_cast<UISheetPresentationController>(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[_WKWebExtensionActionViewController _updateDetentForSheetPresentationController:](self, "_updateDetentForSheetPresentationController:", v5);

}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "presentedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "standardAppearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrollEdgeAppearance:", v9);

  }
  else
  {
    v7 = (void *)v5;
  }
  return v7;
}

- (void)_viewControllerDismissalTransitionDidEnd:(id)a3
{
  id v4;
  DefaultWeakPtrImpl *m_ptr;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _WKWebExtensionActionViewController *v11;
  _WKWebExtensionActionViewController *v12;
  DefaultWeakPtrImpl *v13;
  WebKit::WebExtensionAction *v14;
  id v15;

  v4 = a3;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    if (*((_QWORD *)m_ptr + 1))
    {
      v15 = v4;
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WebKit::objectForKey<NSNumber>(v6, *MEMORY[0x1E0CEBA30]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      v4 = v15;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v15, "object");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = (_WKWebExtensionActionViewController *)v10;
        else
          v11 = 0;

        if (v11 == self
          || (-[_WKWebExtensionActionViewController navigationController](self, "navigationController"),
              v12 = (_WKWebExtensionActionViewController *)objc_claimAutoreleasedReturnValue(),
              v12,
              v11 == v12))
        {
          v13 = self->_webExtensionAction.m_impl.m_ptr;
          if (v13)
            v14 = (WebKit::WebExtensionAction *)*((_QWORD *)v13 + 1);
          else
            v14 = 0;
          WebKit::WebExtensionAction::closePopup(v14);
        }

        v4 = v15;
      }
    }
  }

}

- (void)_updatePopoverContentSize
{
  _BOOL4 presentedAsSheet;
  char isKindOfClass;
  _WKWebExtensionActionWebView *popupWebView;
  void *v6;
  uint64_t v7;
  void *v8;
  double Width;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;

  -[_WKWebExtensionActionViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    presentedAsSheet = self->_presentedAsSheet;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    self->_presentedAsSheet = isKindOfClass & 1;
    if (presentedAsSheet != (isKindOfClass & 1))
    {
      -[_WKWebExtensionActionWebView setNeedsLayout](self->_popupWebView, "setNeedsLayout");
      presentedAsSheet = self->_presentedAsSheet;
    }
    popupWebView = self->_popupWebView;
    if (presentedAsSheet)
    {
      -[WKWebView _clearOverrideLayoutParameters](popupWebView, "_clearOverrideLayoutParameters");
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_referenceBounds");
        Width = CGRectGetWidth(v25);

        -[_WKWebExtensionActionViewController preferredContentSize](self, "preferredContentSize");
        if (v10 < Width)
          v10 = Width;
        -[_WKWebExtensionActionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10);
      }
      objc_opt_class();
      WTF::dynamic_objc_cast<UISheetPresentationController>(v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionActionViewController _updateDetentForSheetPresentationController:](self, "_updateDetentForSheetPresentationController:", v11);

    }
    else
    {
      -[_WKWebExtensionActionWebView bounds](popupWebView, "bounds");
      v13 = v12;
      v15 = v14;
      -[WKWebView scrollView](self->_popupWebView, "scrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentSize");
      v18 = v17;
      v20 = v19;

      if (v18 > 800.0)
        v18 = 800.0;
      if (v20 > 600.0)
        v20 = 600.0;
      v21 = -[_WKWebExtensionActionWebView contentSizeHasStabilized](self->_popupWebView, "contentSizeHasStabilized");
      if (v13 >= v18)
        v22 = v18;
      else
        v22 = v13;
      if (v15 >= v20)
        v23 = v20;
      else
        v23 = v15;
      if (!v21)
        v23 = 50.0;
      -[WKWebView _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:](self->_popupWebView, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v22, v23, v22, v23, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[_WKWebExtensionActionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v18, v20);
    }
  }

}

- (void)_updateDetentForSheetPresentationController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA9A8], "mediumDetent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0CEA9A8], "largeDetent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetents:", v6);

  objc_msgSend(v3, "setPrefersEdgeAttachedInCompactHeight:", 1);
  objc_msgSend(v3, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);

}

- (void)_dismissPopup
{
  id v2;

  -[_WKWebExtensionActionViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  void *v3;
  unsigned int *m_ptr;
  unsigned int v5;
  unsigned int v6;

  objc_storeStrong((id *)&self->_popupWebView, 0);
  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v5 = __ldaxr(m_ptr);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, m_ptr));
    if (!v6)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v3);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 121) = 0;
  return self;
}

@end
