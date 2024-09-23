@implementation ManageWebExtensionsActivity

- (ManageWebExtensionsActivity)init
{
  ManageWebExtensionsActivity *v2;
  ManageWebExtensionsActivity *v3;
  ManageWebExtensionsActivity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ManageWebExtensionsActivity;
  v2 = -[UIActivity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ManageWebExtensionsActivity _formatBadgeText](v2, "_formatBadgeText");
    v4 = v3;
  }

  return v3;
}

- (void)_formatBadgeText
{
  void *numberOfNewlyInstalledExtensions;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _SFBrowserDocument *v9;

  v9 = self->_browserDocument;
  if (-[_SFBrowserDocument isPrivateBrowsingEnabled](v9, "isPrivateBrowsingEnabled"))
  {
    numberOfNewlyInstalledExtensions = self->_numberOfNewlyInstalledExtensions;
    self->_numberOfNewlyInstalledExtensions = 0;
LABEL_8:

    goto LABEL_9;
  }
  -[_SFBrowserDocument webExtensionsController](v9, "webExtensionsController");
  numberOfNewlyInstalledExtensions = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(numberOfNewlyInstalledExtensions, "recentlyInstalledExtensionCount");
  -[_SFBrowserDocument contentBlockerManager](v9, "contentBlockerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recentlyInstalledExtensionCount") + v4;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    numberOfNewlyInstalledExtensions = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", numberOfNewlyInstalledExtensions, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong((id *)&self->_numberOfNewlyInstalledExtensions, v8);
  if (v6)
  {

    goto LABEL_8;
  }
LABEL_9:

}

- (void)setBrowserDocument:(id)a3
{
  _SFBrowserDocument *v4;
  void *v5;
  _SFBrowserDocument *browserDocument;
  _SFBrowserDocument *v7;
  id v8;

  v4 = (_SFBrowserDocument *)a3;
  -[_SFBrowserDocument webExtensionsController](self->_browserDocument, "webExtensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  browserDocument = self->_browserDocument;
  self->_browserDocument = v4;
  v7 = v4;

  -[_SFBrowserDocument webExtensionsController](self->_browserDocument, "webExtensionsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObserver:", self);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_SFBrowserDocument webExtensionsController](self->_browserDocument, "webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ManageWebExtensionsActivity;
  -[ManageWebExtensionsActivity dealloc](&v4, sel_dealloc);
}

- (id)activityType
{
  return CFSTR("SafariActivityTypeWebExtension");
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("puzzlepiece.extension");
}

- (id)_activityBadgeText
{
  return self->_numberOfNewlyInstalledExtensions;
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("shareSheetBadgeBackgroundColor"));
}

- (id)_activityBadgeTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)activityViewController
{
  UIViewController *activityViewController;
  UIViewController *v4;
  UIViewController *v5;

  activityViewController = self->_activityViewController;
  if (!activityViewController)
  {
    objc_msgSend(MEMORY[0x1E0D4ECC8], "createManageExtensionsNavigationControllerFromPageFormatMenu:activeDocument:", 0, self->_browserDocument);
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_activityViewController;
    self->_activityViewController = v4;

    activityViewController = self->_activityViewController;
  }
  return activityViewController;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)_reloadBadgeCount
{
  id WeakRetained;

  -[ManageWebExtensionsActivity _formatBadgeText](self, "_formatBadgeText");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentActivityViewController);
  objc_msgSend(WeakRetained, "_reloadActivity:", self);

}

- (void)extensionsControllerExtensionListDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ManageWebExtensionsActivity_extensionsControllerExtensionListDidChange___block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __74__ManageWebExtensionsActivity_extensionsControllerExtensionListDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBadgeCount");
}

- (UIActivityViewController)parentActivityViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_parentActivityViewController);
}

- (void)setParentActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentActivityViewController, a3);
}

- (_SFBrowserDocument)browserDocument
{
  return self->_browserDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDocument, 0);
  objc_destroyWeak((id *)&self->_parentActivityViewController);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_numberOfNewlyInstalledExtensions, 0);
}

@end
