@implementation CKBusinessMacToolbarViewController

- (CKBusinessMacToolbarViewController)initWithConversation:(id)a3 showingInStandAloneWindow:(BOOL)a4
{
  id v7;
  CKBusinessMacToolbarViewController *v8;
  CKBusinessMacToolbarViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKBusinessMacToolbarViewController;
  v8 = -[CKBusinessMacToolbarViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_showingInStandAloneWindow = a4;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBusinessMacToolbarViewController;
  -[CKBusinessMacToolbarViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CKBusinessMacToolbarView *v3;
  CKBusinessMacToolbarView *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = [CKBusinessMacToolbarView alloc];
  v4 = -[CKBusinessMacToolbarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKBusinessMacToolbarViewController setToolbarView:](self, "setToolbarView:", v4);

  v5 = -[CKBusinessMacToolbarViewController showingInStandAloneWindow](self, "showingInStandAloneWindow");
  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowingInStandAloneWindow:", v5);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useMacToolbar");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "macAppKitToolbarHeight");
  else
    objc_msgSend(v9, "marzNavigationBarHeight");
  v12 = v11;
  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredHeight:", v12);

  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarViewController setView:](self, "setView:", v14);

  v15 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CKBusinessMacToolbarViewController _detailsPopoverFrame](self, "_detailsPopoverFrame");
  v16 = (void *)objc_msgSend(v15, "initWithFrame:");
  -[CKBusinessMacToolbarViewController setDetailsPopoverPresentationSourceView:](self, "setDetailsPopoverPresentationSourceView:", v16);

  -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", 0);

  -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOpaque:", 0);

  -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);

  -[CKBusinessMacToolbarViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[CKBusinessMacToolbarViewController _updateBannerImageData](self, "_updateBannerImageData");
  -[CKBusinessMacToolbarViewController _updateFallbackTitle](self, "_updateFallbackTitle");
  -[CKBusinessMacToolbarViewController _updateBrandColors](self, "_updateBrandColors");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBusinessMacToolbarViewController;
  -[CKBusinessMacToolbarViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookPartialChange_, *MEMORY[0x1E0D373D0], 0);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)CKBusinessMacToolbarViewController;
  -[CKBusinessMacToolbarViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[CKBusinessMacToolbarViewController _detailsPopoverFrame](self, "_detailsPopoverFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v16 = CGRectEqualToRect(v20, v21);

  if (!v16)
  {
    -[CKBusinessMacToolbarViewController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  }
  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDetailsPopoverFrame:", v4, v6, v8, v10);

}

- (CGRect)_detailsPopoverFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "macNSToolbarItemSize");
  v5 = v4;
  v7 = v6;

  -[CKBusinessMacToolbarViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "macAppKitToolbarHeight");
  v13 = v12;

  -[CKBusinessMacToolbarViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "_shouldReverseLayoutDirection");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "macNSToolbarItemInterItemSpacing");
  v17 = v16;

  v18 = v10 - v17 - v5;
  if ((_DWORD)v11)
    v18 = v17;
  v19 = v13 * 0.5 - v7 * 0.5;
  v20 = v5;
  v21 = v7;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_updateBannerImageData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKBusinessMacToolbarViewController handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brandWideLogoImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  -[CKBusinessMacToolbarViewController handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "brandWideLogoImageData");
  else
    objc_msgSend(v6, "brandSquareLogoImageData");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBannerImageData:", v9);

}

- (void)_updateFallbackTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKBusinessMacToolbarViewController handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[CKBusinessMacToolbarViewController handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
  }
  else
  {
    IMSharedUtilitiesFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BUSINESS_NOTIFICATION_TITLE"), &stru_1E276D870, CFSTR("IMSharedUtilities"));
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFallbackTitle:", v7);

}

- (void)_updateBrandColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarViewController handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryBrandColorForBusinessHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[CKBusinessMacToolbarViewController toolbarView](self, "toolbarView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarViewController handle](self, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryBrandColorForBusinessHandle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFallbackTitleColor:", v11);

}

- (void)_handleAddressBookPartialChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D373F0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D373E8]))
  {
    -[CKBusinessMacToolbarViewController _updateBannerImageData](self, "_updateBannerImageData");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37400]))
  {
    -[CKBusinessMacToolbarViewController _updateFallbackTitle](self, "_updateFallbackTitle");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D373D8]))
  {
    -[CKBusinessMacToolbarViewController _updateBrandColors](self, "_updateBrandColors");
  }

}

- (UIView)detailsPopoverPresentationSourceView
{
  return self->_detailsPopoverPresentationSourceView;
}

- (void)setDetailsPopoverPresentationSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (CKBusinessMacToolbarView)toolbarView
{
  return self->_toolbarView;
}

- (void)setToolbarView:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, 0);
}

@end
