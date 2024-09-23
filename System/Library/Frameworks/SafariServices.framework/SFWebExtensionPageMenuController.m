@implementation SFWebExtensionPageMenuController

- (SFWebExtensionPageMenuController)initWithExtension:(id)a3
{
  id v4;
  void *v5;
  SFWebExtensionPageMenuController *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "extensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SFWebExtensionPageMenuController;
  v6 = -[WBSWebExtensionToolbarItem initWithWebExtension:extensionsController:](&v8, sel_initWithWebExtension_extensionsController_, v4, v5);

  return v6;
}

- (id)iconForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v4 = a3;
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(unint64_t)objc_msgSend(v6, "toolbarItemIdealPointSize");

  -[SFWebExtensionPageMenuController iconForTab:size:](self, "iconForTab:size:", v4, v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)wantsGrayscaleIconForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (-[WBSWebExtensionToolbarItem isEnabledForTab:](self, "isEnabledForTab:", v4))
  {
    -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlForExtensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasPermissionToAccessURL:inTab:", v6, v4) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)wantsTemplateIconForTab:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  char v8;
  BOOL v9;

  v4 = a3;
  if (-[SFWebExtensionPageMenuController wantsGrayscaleIconForTab:](self, "wantsGrayscaleIconForTab:", v4))
  {
    -[SFWebExtensionPageMenuController iconForTab:](self, "iconForTab:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_computeAverageLuminance");
    v7 = v6;
    v8 = objc_msgSend(v5, "safari_transparencyAnalysisResultIsNotOpaque");
    if (v7 < 0.1)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)iconForTab:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[7];
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v22.receiver = self;
  v22.super_class = (Class)SFWebExtensionPageMenuController;
  v7 = a3;
  -[WBSWebExtensionToolbarItem iconForTab:](&v22, sel_iconForTab_, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_computeAverageLuminance");
  v10 = v9;
  v11 = objc_msgSend(v8, "safari_isGrayscale");
  v12 = objc_msgSend(v8, "safari_transparencyAnalysisResultIsNotOpaque");
  objc_msgSend(MEMORY[0x1E0D8A9C8], "resizedImage:withSize:", v8, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SFWebExtensionPageMenuController wantsGrayscaleIconForTab:](self, "wantsGrayscaleIconForTab:", v7);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke;
  v21[3] = &__block_descriptor_56_e38___UIImage_24__0__UIImage_8__UIColor_16l;
  *(double *)&v21[4] = v10;
  *(double *)&v21[5] = width;
  *(double *)&v21[6] = height;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v21);
  if (v14 && v10 < 0.1 && v12 != 0)
  {
    objc_msgSend(v13, "imageWithRenderingMode:", 2);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:

    v13 = (void *)v17;
    goto LABEL_13;
  }
  if (v14)
  {
    objc_msgSend(v13, "safari_makeGrayscale");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v15)[2](v15, v18, v19);
    v17 = objc_claimAutoreleasedReturnValue();

LABEL_11:
    v13 = (void *)v18;
    goto LABEL_12;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v18 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v15)[2](v15, v13, v18);
    v17 = objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_13:

  return v13;
}

id __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  __int128 *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  __int128 v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  __int128 v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a2;
  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__12;
  v34 = __Block_byref_object_dispose__12;
  v35 = 0;
  v7 = *(double *)(a1 + 32) >= 0.1;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_67;
  v24[3] = &unk_1E4AC7028;
  v27 = &v30;
  v10 = v5;
  v25 = v10;
  v11 = v6;
  v26 = v11;
  v28 = *(_OWORD *)(a1 + 40);
  v29 = v7;
  objc_msgSend(v8, "performAsCurrentTraitCollection:", v24);

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__int128 *)(a1 + 40);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_2;
  v18[3] = &unk_1E4AC7028;
  v21 = &v30;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v22 = *v13;
  v23 = v7;
  objc_msgSend(v12, "performAsCurrentTraitCollection:", v18);

  v16 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v16;
}

void __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_67(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  SFTintImage();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "imageAsset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SFTintImage();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerImage:withTraitCollection:", v1, v2);

}

- (void)showPopupForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[SFWebExtensionPageMenuController showingExtensionPopup](self, "showingExtensionPopup"))
  {
    -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webKitContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionForTab:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "presentsPopup"))
    {
      -[SFWebExtensionPageMenuController dismissPopupImmediatelyIfNecessary](self, "dismissPopupImmediatelyIfNecessary");
      objc_storeWeak((id *)&self->_parentViewController, v8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "popupViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self->_popupViewController, v13);
        objc_msgSend(v13, "popoverPresentationController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "windowScene");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _SFContextInfoWithComment();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v18;
          v21 = v22;
          _SFPopoverSourceInfoUnwrap();

        }
        objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0, v18);

      }
    }

  }
}

uint64_t __91__SFWebExtensionPageMenuController_showPopupForTab_parentViewController_popoverSourceInfo___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  objc_msgSend(*(id *)(a1 + 32), "setSourceView:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "setSourceRect:", a3, a4, a5, a6);
}

uint64_t __91__SFWebExtensionPageMenuController_showPopupForTab_parentViewController_popoverSourceInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSourceItem:", a2);
}

- (void)performActionForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int);
  void *v22;
  SFWebExtensionPageMenuController *v23;
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_tab, a3);
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionsController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hasPendingWebsiteRequests");
  if (-[WBSWebExtensionToolbarItem shouldRequestAccessForTab:](self, "shouldRequestAccessForTab:", v9) || v14)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke;
    v22 = &unk_1E4AC3950;
    v23 = self;
    v24 = v9;
    v25 = v10;
    v26 = v11;
    objc_msgSend(v12, "requestPermissionsFromToolbarItemInTab:completionHandler:", v24, &v19);
    objc_msgSend(v12, "extension", v19, v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didShowPerSiteAccessPermissionForExtension:", v18);

  }
  else
  {
    objc_msgSend(v13, "analyticsEventCoalescer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "composedIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didInvokeToolbarButtonForExtensionWithIdentifier:", v16);

    objc_msgSend(v12, "webKitContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performActionForTab:", v9);

  }
}

void __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  if (a2)
  {
    v3 = dispatch_time(0, 500000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke_2;
    v5[3] = &unk_1E4AC06B8;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActionForTab:parentViewController:popoverSourceInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)dismissPopupImmediatelyIfNecessary
{
  UIViewController **p_popupViewController;
  id WeakRetained;

  p_popupViewController = &self->_popupViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_popupViewController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_storeWeak((id *)p_popupViewController, 0);
}

- (id)activityForTab:(id)a3
{
  id v5;
  _SFWebExtensionActivity *v6;
  void *v7;
  _SFWebExtensionActivity *v8;
  _SFWebExtensionActivity *activityItem;
  _SFWebExtensionActivity *v10;

  objc_storeStrong((id *)&self->_tab, a3);
  v5 = a3;
  v6 = [_SFWebExtensionActivity alloc];
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SFWebExtensionActivity initWithPageMenuController:webExtension:tab:](v6, "initWithPageMenuController:webExtension:tab:", self, v7, v5);
  activityItem = self->_activityItem;
  self->_activityItem = v8;

  v10 = self->_activityItem;
  return v10;
}

- (id)alertItemForTab:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _SFWebExtensionSettingsAlertItem *v11;
  _SFWebExtensionSettingsAlertItem *alertItem;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFWebExtensionSettingsAlertItem *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  SFWebExtensionPageMenuController *v25;
  id v26;

  v5 = a3;
  objc_storeStrong((id *)&self->_tab, a3);
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayShortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC4A88];
  -[SFWebExtensionPageMenuController iconForTab:](self, "iconForTab:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke;
  v24 = &unk_1E4AC4B88;
  v25 = self;
  v10 = v5;
  v26 = v10;
  +[_SFWebExtensionSettingsAlertItem buttonWithTitle:textStyle:icon:extension:handler:](_SFWebExtensionSettingsAlertItem, "buttonWithTitle:textStyle:icon:extension:handler:", v7, v8, v9, v6, &v21);
  v11 = (_SFWebExtensionSettingsAlertItem *)objc_claimAutoreleasedReturnValue();
  alertItem = self->_alertItem;
  self->_alertItem = v11;

  -[_SFSettingsAlertItem setEnabled:](self->_alertItem, "setEnabled:", -[WBSWebExtensionToolbarItem isEnabledForTab:](self, "isEnabledForTab:", self->_tab, v21, v22, v23, v24, v25));
  -[WBSWebExtensionToolbarItem badgeTextForTab:](self, "badgeTextForTab:", self->_tab);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "badgeViewForText:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertItem setBadgeView:](self->_alertItem, "setBadgeView:", v14);

  -[_SFSettingsAlertItem setBadgeText:](self->_alertItem, "setBadgeText:", v13);
  if (-[SFWebExtensionPageMenuController shouldShowWarningTriangleImageForTab:](self, "shouldShowWarningTriangleImageForTab:", v10))
  {
    v15 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_imageViewForWarningTriangleImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItem setStatusImageView:](self->_alertItem, "setStatusImageView:", v17);

    -[_SFSettingsAlertItem setShowsStatusAlert:](self->_alertItem, "setShowsStatusAlert:", 1);
  }
  +[_SFPageFormatMenuBadgeView defaultComponentsArrangement](_SFPageFormatMenuBadgeView, "defaultComponentsArrangement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertItem setComponentsArrangement:](self->_alertItem, "setComponentsArrangement:", v18);

  v19 = self->_alertItem;
  return v19;
}

void __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPopoverSourceInfoForViewController();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke_2;
  v11[3] = &unk_1E4AC06B8;
  v6 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v4;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v11);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 96);
  *(_QWORD *)(v9 + 96) = 0;

}

uint64_t __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActionForTab:parentViewController:popoverSourceInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)badgeViewForText:(id)a3
{
  id v3;
  _SFPageFormatMenuBadgeView *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = -[_SFPageFormatMenuBadgeView initWithText:]([_SFPageFormatMenuBadgeView alloc], "initWithText:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)_imageViewForWarningTriangleImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DC3890];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
}

- (BOOL)shouldShowWarningTriangleImageForTab:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v4 = -[WBSWebExtensionToolbarItem shouldRequestAccessForTab:](self, "shouldRequestAccessForTab:", a3);
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasShownPerSiteAccessPermissionForExtension:", v7);

  v9 = v4 & (v8 ^ 1) | objc_msgSend(v5, "hasPendingWebsiteRequests");
  return v9;
}

- (void)_createTabWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController _createTabWithURL:]", v7, 933, v9);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController _createTabWithURL:]", v7, 933, &stru_1E4AC8470);
    v8 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v8, v10);

  abort();
}

- (BOOL)showingExtensionPopup
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_popupViewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)webKitExtensionAction:(id)a3 didChangeForTab:(id)a4
{
  WBSWebExtensionTab *v6;
  void *v7;
  void *v8;
  WBSWebExtensionTab *tab;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = (WBSWebExtensionTab *)a4;
  -[WBSWebExtensionToolbarItem webExtension](self, "webExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("activityContentsDidUpdate"), v7);

  objc_msgSend(v7, "_validateToolbarItemInAllWindows");
  if (self->_alertItem)
  {
    tab = self->_tab;
    if (!v6 || (v10 = tab == v6, tab = v6, v10))
    {
      -[SFWebExtensionPageMenuController iconForTab:](self, "iconForTab:", tab);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertItem setIcon:](self->_alertItem, "setIcon:", v11);

      v12 = (void *)objc_opt_class();
      objc_msgSend(v16, "badgeText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "badgeViewForText:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertItem setBadgeView:](self->_alertItem, "setBadgeView:", v14);

      objc_msgSend(v16, "badgeText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertItem setBadgeText:](self->_alertItem, "setBadgeText:", v15);

      -[_SFSettingsAlertItem setEnabled:](self->_alertItem, "setEnabled:", objc_msgSend(v16, "isEnabled"));
    }
  }

}

- (void)didSetBadgeText:(id)a3 forTab:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetBadgeText:forTab:]", v10, 1006, v12);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetBadgeText:forTab:]", v10, 1006, &stru_1E4AC8470);
    v11 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v11, v13);

  abort();
}

- (void)didSetEnabledState:(BOOL)a3 forTab:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetEnabledState:forTab:]", v8, 1035, v10);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetEnabledState:forTab:]", v8, 1035, &stru_1E4AC8470);
    v9 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v9, v11);

  abort();
}

- (void)didSetIcon:(id)a3 forTab:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetIcon:forTab:]", v10, 1060, v12);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController didSetIcon:forTab:]", v10, 1060, &stru_1E4AC8470);
    v11 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v11, v13);

  abort();
}

- (void)popupDidNavigateRequestingNewWindowToURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController popupDidNavigateRequestingNewWindowToURL:]", v7, 1080, v9);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController popupDidNavigateRequestingNewWindowToURL:]", v7, 1080, &stru_1E4AC8470);
    v8 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v8, v10);

  abort();
}

- (void)webViewDidClose:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController webViewDidClose:]", v7, 1092, v9);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController webViewDidClose:]", v7, 1092, &stru_1E4AC8470);
    v8 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v8, v10);

  abort();
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:]", v16, 1102, v18);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!(1)", "-[SFWebExtensionPageMenuController webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:]", v16, 1102, &stru_1E4AC8470);
    v17 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v17, v19);

  abort();
}

- (WBSWebExtensionWindow)windowDisplayingPopupWebView
{
  return self->_windowDisplayingPopupWebView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowDisplayingPopupWebView, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_alertItem, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_destroyWeak((id *)&self->_popupViewController);
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end
