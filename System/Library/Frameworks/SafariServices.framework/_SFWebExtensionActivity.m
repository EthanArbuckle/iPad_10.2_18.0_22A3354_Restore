@implementation _SFWebExtensionActivity

- (_SFWebExtensionActivity)initWithPageMenuController:(id)a3 webExtension:(id)a4 tab:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SFWebExtensionActivity *v11;
  _SFWebExtensionActivity *v12;
  void *v13;
  _SFWebExtensionActivity *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_SFWebExtensionActivity;
  v11 = -[UIActivity init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_pageMenuController, v8);
    objc_storeStrong((id *)&v12->_webExtension, a4);
    objc_storeStrong((id *)&v12->_tab, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel__reloadActivitySoon, CFSTR("activityContentsDidUpdate"), v12->_webExtension);

    v14 = v12;
  }

  return v12;
}

- (id)activityTitle
{
  return (id)-[WBSWebExtensionData displayShortName](self->_webExtension, "displayShortName");
}

- (BOOL)_wantsOriginalImageColor
{
  _SFWebExtensionActivity *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "wantsTemplateIconForTab:", v2->_tab) ^ 1;

  return (char)v2;
}

- (id)_actionImage
{
  void *v3;

  if (-[_SFWebExtensionActivity _wantsOriginalImageColor](self, "_wantsOriginalImageColor"))
  {
    v3 = 0;
  }
  else
  {
    -[_SFWebExtensionActivity _activityImage](self, "_activityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_activityImage
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  objc_msgSend(WeakRetained, "iconForTab:", self->_tab);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activityType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[WBSWebExtensionData composedIdentifier](self->_webExtension, "composedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.mobilesafari.webextension"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return -[WBSWebExtensionData shouldShowToolbarItemForTab:](self->_webExtension, "shouldShowToolbarItemForTab:", self->_tab);
}

- (BOOL)_isEnabled
{
  return !-[_SFWebExtensionActivity _isDisabled](self, "_isDisabled");
}

- (BOOL)_isDisabled
{
  _SFWebExtensionActivity *v2;
  void *v3;

  v2 = self;
  -[WBSWebExtensionData toolbarItem](self->_webExtension, "toolbarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isEnabledForTab:", v2->_tab) ^ 1;

  return (char)v2;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPopoverSourceInfoForViewController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
  v5 = objc_loadWeakRetained((id *)&self->_pageMenuController);
  objc_msgSend(v5, "performActionForTab:parentViewController:popoverSourceInfo:", self->_tab, v3, v4);

}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (id)_activityBadgeTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("shareSheetBadgeBackgroundColor"));
}

- (id)_activityBadgeText
{
  void *v3;
  void *v4;

  -[WBSWebExtensionData toolbarItem](self->_webExtension, "toolbarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeTextForTab:", self->_tab);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_activityStatusImage
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  if (objc_msgSend(WeakRetained, "shouldShowWarningTriangleImageForTab:", self->_tab))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_activityStatusTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
}

- (void)_reloadActivitySoon
{
  -[_SFWebExtensionActivity performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadActivity, 0, 0.0);
}

- (void)_reloadActivity
{
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  if ((objc_msgSend(WeakRetained, "isBeingDismissed") & 1) == 0)
    objc_msgSend(WeakRetained, "_reloadActivity:", self);

}

- (UIActivityViewController)parentViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_destroyWeak((id *)&self->_pageMenuController);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_webExtension, 0);
}

@end
