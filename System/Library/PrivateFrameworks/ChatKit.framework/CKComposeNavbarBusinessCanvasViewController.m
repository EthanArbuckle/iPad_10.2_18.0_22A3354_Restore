@implementation CKComposeNavbarBusinessCanvasViewController

- (void)updateContentsForConversation:(id)a3
{
  CKAvatarPickerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!self->_avatarController)
  {
    v4 = -[CKAvatarPickerViewController initWithConversation:]([CKAvatarPickerViewController alloc], "initWithConversation:", v12);
    -[CKComposeNavbarBusinessCanvasViewController setAvatarController:](self, "setAvatarController:", v4);

    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeNavbarBusinessCanvasViewController addChildViewController:](self, "addChildViewController:", v6);

    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didMoveToParentViewController:", self);

  }
  -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateContentsForConversation:", v12);

  -[CKComposeNavbarBusinessCanvasViewController _updateBrandingForConversation:](self, "_updateBrandingForConversation:", v12);
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleView:", v11);

  -[CKComposeNavbarBusinessCanvasViewController setCachedConversation:](self, "setCachedConversation:", v12);
}

- (void)viewDidLoad
{
  void *v3;
  CKLabel *v4;
  CKLabel *v5;
  CKLabel *defaultLabel;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  -[CKComposeNavbarCanvasViewController viewDidLoad](&v17, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookPartialChange_, *MEMORY[0x1E0D373D0], 0);

  v4 = [CKLabel alloc];
  v5 = -[CKLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  defaultLabel = self->_defaultLabel;
  self->_defaultLabel = v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setFont:](self->_defaultLabel, "setFont:", v7);

  -[CKLabel setTextAlignment:](self->_defaultLabel, "setTextAlignment:", 1);
  v8 = (void *)MEMORY[0x1E0D396F8];
  -[CKComposeNavbarBusinessCanvasViewController cachedConversation](self, "cachedConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "businessHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderNameForBrandURI:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setText:](self->_defaultLabel, "setText:", v12);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel setBackgroundColor:](self->_defaultLabel, "setBackgroundColor:", v13);

  -[CKLabel sizeToFit](self->_defaultLabel, "sizeToFit");
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleView:", v16);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double Width;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  float v37;
  double v38;
  void *v39;
  double v40;
  float v41;
  double v42;
  _QWORD v43[9];
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v44.receiver = self;
  v44.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  -[CKComposeNavbarBusinessCanvasViewController viewDidLayoutSubviews](&v44, sel_viewDidLayoutSubviews);
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarCanvasViewController systemMinimumLayoutMarginsForView:](self, "systemMinimumLayoutMarginsForView:", v8);
  v10 = v9;
  v12 = v11;
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "effectiveUserInterfaceLayoutDirection");
  if (v14)
    v15 = v12;
  else
    v15 = v10;
  if (!v14)
    v10 = v12;

  -[CKComposeNavbarBusinessCanvasViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_shouldReverseLayoutDirection");

  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v18, "rightItemView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v20 = v7 + v10 + CGRectGetWidth(v45);

    v7 = v7 + v15;
    -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftItemView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    Width = CGRectGetWidth(v46);
  }
  else
  {
    objc_msgSend(v18, "leftItemView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v20 = v5 + v15 + CGRectGetWidth(v47);

    -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightItemView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    Width = v10 + CGRectGetWidth(v48);
  }
  v25 = v7 + Width;

  if (v20 >= v25)
    v26 = v20;
  else
    v26 = v25;
  v27 = v26 + v26;
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v29 = CGRectGetWidth(v49) - (v27 + 14.0 + 14.0);

  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "titleView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");

  -[CKComposeNavbarBusinessCanvasViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;

  -[CKComposeNavbarBusinessCanvasViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = (v36 - v29) * 0.5;
  v38 = rintf(v37);

  -[CKComposeNavbarBusinessCanvasViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = (v40 - v34) * 0.5;
  v42 = rintf(v41);

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __68__CKComposeNavbarBusinessCanvasViewController_viewDidLayoutSubviews__block_invoke;
  v43[3] = &unk_1E274B8B8;
  v43[4] = self;
  *(double *)&v43[5] = v38;
  *(double *)&v43[6] = v42;
  *(CGFloat *)&v43[7] = v29;
  *(double *)&v43[8] = v34;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v43);
}

void __68__CKComposeNavbarBusinessCanvasViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "canvasView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKComposeNavbarBusinessCanvasViewController;
  -[CKComposeNavbarBusinessCanvasViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarBusinessCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleView:", v6);

}

- (id)_titleItemViewForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CKComposeNavbarBusinessCanvasViewController _canShowAvatarView](self, "_canShowAvatarView")
    && objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)_canShowAvatarView
{
  void *v2;
  char v3;

  -[CKComposeNavbarCanvasViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowAvatarViewInNavBarCanvas");

  return v3;
}

- (void)_updateBrandingForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "businessHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "navBarTextStyleForBusinessHandle:", v6);
  -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyle:", v7);

  -[CKComposeNavbarBusinessCanvasViewController _updateDefaultLabelForConversation:](self, "_updateDefaultLabelForConversation:", v9);
  -[CKComposeNavbarBusinessCanvasViewController _updateTitleForConversation:animated:](self, "_updateTitleForConversation:animated:", v9, 0);

}

- (void)_updateDefaultLabelForConversation:(id)a3
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
  id v13;

  v13 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "businessHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryBrandColorForBusinessHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "businessHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryBrandColorForBusinessHandle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

  }
}

- (void)_updateTitleForConversation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  objc_msgSend(v21, "businessHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v9) & 1) != 0)
    {
      v10 = -[CKComposeNavbarBusinessCanvasViewController _shouldUpdateVerifiedIconForConversation:](self, "_shouldUpdateVerifiedIconForConversation:", v21);

      if (!v10)
        goto LABEL_12;
    }
    else
    {

    }
  }
  else if (!-[CKComposeNavbarBusinessCanvasViewController _shouldUpdateVerifiedIconForConversation:](self, "_shouldUpdateVerifiedIconForConversation:", v21))
  {
    goto LABEL_12;
  }
  v11 = objc_msgSend(v21, "shouldShowVerifiedCheckmark");
  -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v7);

  -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setTitle:animated:", v7, v4);

  -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v14, "setTitleIconImageType:", 1);

    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 1;
  }
  else
  {
    objc_msgSend(v14, "setTitleIconImageType:", 0);

    -[CKComposeNavbarBusinessCanvasViewController avatarController](self, "avatarController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0;
  }
  objc_msgSend(v17, "setAvatarTitleAccessoryImageType:", v19);

  -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeToFit");

LABEL_12:
}

- (BOOL)_shouldUpdateVerifiedIconForConversation:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  -[CKComposeNavbarBusinessCanvasViewController defaultLabel](self, "defaultLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "titleIconImageType") == 1;

  LOBYTE(v5) = objc_msgSend(v4, "hasVerifiedBusiness");
  return v6 ^ v5;
}

- (void)_handleAddressBookPartialChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D373F0]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKComposeNavbarBusinessCanvasViewController cachedConversation](self, "cachedConversation");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D373D8]);

    if (v7)
    {
      -[CKComposeNavbarBusinessCanvasViewController cachedConversation](self, "cachedConversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeNavbarBusinessCanvasViewController _updateBrandingForConversation:](self, "_updateBrandingForConversation:", v8);

    }
  }

}

- (BOOL)hideChevron
{
  return 1;
}

- (CKLabel)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setDefaultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLabel, a3);
}

- (CKAvatarPickerViewController)avatarController
{
  return self->_avatarController;
}

- (void)setAvatarController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarController, a3);
}

- (CKConversation)cachedConversation
{
  return self->_cachedConversation;
}

- (void)setCachedConversation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConversation, 0);
  objc_storeStrong((id *)&self->_avatarController, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
}

@end
