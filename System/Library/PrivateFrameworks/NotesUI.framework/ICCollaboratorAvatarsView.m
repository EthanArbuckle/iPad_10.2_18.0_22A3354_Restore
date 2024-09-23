@implementation ICCollaboratorAvatarsView

- (ICCollaboratorAvatarsView)initWithCoder:(id)a3
{
  ICCollaboratorAvatarsView *v3;
  ICCollaboratorAvatarsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCollaboratorAvatarsView;
  v3 = -[ICCollaboratorAvatarsView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICCollaboratorAvatarsView commonInit](v3, "commonInit");
  return v4;
}

- (ICCollaboratorAvatarsView)initWithFrame:(CGRect)a3
{
  ICCollaboratorAvatarsView *v3;
  ICCollaboratorAvatarsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCollaboratorAvatarsView;
  v3 = -[ICCollaboratorAvatarsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICCollaboratorAvatarsView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;

  -[ICCollaboratorAvatarsView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

  self->_borderWidth = 1.5;
  self->_dimension = 26.0;
  self->_shadowOffset.width = 0.0;
  self->_shadowOffset.height = 0.0;
  self->_shadowOpacity = 0.1;
  self->_shadowRadius = 2.0;
  self->_spacing = -12.0;
  -[ICCollaboratorAvatarsView setUpAvatarContainerViews](self, "setUpAvatarContainerViews");
  -[ICCollaboratorAvatarsView updateShadows](self, "updateShadows");
  -[NSArray enumerateObjectsUsingBlock:](self->_avatarContainerViews, "enumerateObjectsUsingBlock:", &__block_literal_global_39);
  -[ICCollaboratorAvatarsView registerForTraitChanges](self, "registerForTraitChanges");
}

uint64_t __39__ICCollaboratorAvatarsView_commonInit__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 1);
}

- (void)setBorderWidth:(double)a3
{
  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    -[ICCollaboratorAvatarsView updateUI](self, "updateUI");
  }
}

- (void)setDimension:(double)a3
{
  if (self->_dimension != a3)
  {
    self->_dimension = a3;
    -[ICCollaboratorAvatarsView setUpAvatarContainerViews](self, "setUpAvatarContainerViews");
  }
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
  -[ICCollaboratorAvatarsView updateUI](self, "updateUI");
}

- (void)setShare:(id)a3
{
  objc_storeWeak((id *)&self->_share, a3);
  -[ICCollaboratorAvatarsView updateUI](self, "updateUI");
}

- (void)setShadowRadius:(double)a3
{
  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    -[ICCollaboratorAvatarsView updateShadows](self, "updateShadows");
  }
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3)
  {
    self->_shadowOpacity = a3;
    -[ICCollaboratorAvatarsView updateShadows](self, "updateShadows");
  }
}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    -[ICCollaboratorAvatarsView updateShadows](self, "updateShadows");
  }
}

- (void)setSpacing:(double)a3
{
  id v4;

  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSpacing:", a3);

  }
}

- (unint64_t)displayedAvatarCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0DC3E88], "ic_traitsAffectingSizeAndColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICCollaboratorAvatarsView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5C205C8;
  v5[4] = self;
  v4 = (id)-[ICCollaboratorAvatarsView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __52__ICCollaboratorAvatarsView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpAvatarContainerViews");
  return objc_msgSend(*(id *)(a1 + 32), "updateUI");
}

- (id)createAvatarContainerView
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[ICCollaboratorAvatarsView dimension](self, "dimension");
  objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", v4 * 0.5);
  v5 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView dimension](self, "dimension");
  objc_msgSend(v6, "constraintEqualToConstant:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(v3, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView dimension](self, "dimension");
  objc_msgSend(v8, "constraintEqualToConstant:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v10);

  return v3;
}

- (void)setUpAvatarContainerViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[ICCollaboratorAvatarsView createAvatarContainerView](self, "createAvatarContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView createAvatarContainerView](self, "createAvatarContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView createAvatarContainerView](self, "createAvatarContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = v6;
  v18[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView setAvatarContainerViews:](self, "setAvatarContainerViews:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[ICCollaboratorAvatarsView avatarContainerViews](self, "avatarContainerViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);
  -[ICCollaboratorAvatarsView setAvatarStackView:](self, "setAvatarStackView:", v11);

  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDistribution:", 1);

  -[ICCollaboratorAvatarsView spacing](self, "spacing");
  v14 = v13;
  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSpacing:", v14);

  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView addSubview:](self, "addSubview:", v16);

  -[ICCollaboratorAvatarsView avatarStackView](self, "avatarStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_addAnchorsToFillSuperview");

}

- (void)updateShadows
{
  void *v3;
  _QWORD v4[5];

  -[ICCollaboratorAvatarsView avatarContainerViews](self, "avatarContainerViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ICCollaboratorAvatarsView_updateShadows__block_invoke;
  v4[3] = &unk_1E5C205F0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __42__ICCollaboratorAvatarsView_updateShadows__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v3, "shadowRadius");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "shadowOpacity");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "shadowOffset");
  objc_msgSend(v10, "ic_applyShadowWithRadius:opacity:offset:", v5, v7, v8, v9);

}

- (void)updateUI
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICCollaboratorAvatarsView *v8;
  _QWORD *v9;
  _QWORD v10[4];

  -[ICCollaboratorAvatarsView avatarViews](self, "avatarViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 1000;
  -[ICCollaboratorAvatarsView avatarContainerViews](self, "avatarContainerViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ICCollaboratorAvatarsView_updateUI__block_invoke;
  v6[3] = &unk_1E5C20618;
  v5 = v3;
  v7 = v5;
  v8 = self;
  v9 = v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  _Block_object_dispose(v10, 8);
}

void __37__ICCollaboratorAvatarsView_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  CGRect v18;

  v17 = a2;
  objc_msgSend(v17, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3
    && (objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(v17, "addSubview:", v6);
    objc_msgSend(v7, "ic_addAnchorsToFillSuperview");
    objc_msgSend(*(id *)(a1 + 40), "dimension");
    objc_msgSend(v7, "ic_applyRoundedCornersWithRadius:", v8 * 0.5);
    if ((objc_msgSend(MEMORY[0x1E0D641E0], "deviceIsVision") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dimension");
      v11 = v10 + 1.0;
      objc_msgSend(*(id *)(a1 + 40), "dimension");
      objc_msgSend(v9, "setFrame:", -0.5, -0.5, v11, v12 + 1.0);
      objc_msgSend(v9, "frame");
      objc_msgSend(v9, "setCornerRadius:", CGRectGetMidX(v18));
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v13, "CGColor"));

      objc_msgSend(*(id *)(a1 + 40), "borderWidth");
      objc_msgSend(v9, "setBorderWidth:");
      objc_msgSend(v7, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSublayer:", v9);

      objc_msgSend(v9, "setZPosition:", 1.0);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "reverseZIndexing"))
    {
      v15 = (double)(unint64_t)--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(v17, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setZPosition:", v15);

    }
    objc_msgSend(v17, "setHidden:", 0);

  }
  else
  {
    objc_msgSend(v17, "setHidden:", 1);
  }

}

- (id)avatarViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[ICCollaboratorAvatarsView dimension](self, "dimension");
  v4 = v3;
  -[ICCollaboratorAvatarsView dimension](self, "dimension");
  v6 = v5;
  -[ICCollaboratorAvatarsView participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[ICCollaboratorAvatarsView share](self, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_nonCurrentUserParticipants");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ICCollaboratorAvatarsView share](self, "share");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "ic_isPublicShare"))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v9, "count");

  if (v12)
  {
LABEL_8:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__ICCollaboratorAvatarsView_avatarViews__block_invoke;
    v16[3] = &unk_1E5C20668;
    v16[4] = self;
    *(double *)&v16[5] = v4;
    *(double *)&v16[6] = v6;
    objc_msgSend(v9, "ic_map:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[ICCollaboratorAvatarsView defaultAvatarImageViewWithSize:](self, "defaultAvatarImageViewWithSize:", v4, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

id __40__ICCollaboratorAvatarsView_avatarViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ICThumbnailConfiguration *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "defaultAvatarImageViewWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v5 = [ICThumbnailConfiguration alloc];
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICThumbnailConfiguration initForAvatarWithParticipants:preferredSize:hasBorder:](v5, "initForAvatarWithParticipants:preferredSize:hasBorder:", v6, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

  +[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_2;
  v10[3] = &unk_1E5C20640;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "thumbnailWithConfiguration:completion:", v7, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v4;
}

void __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  performBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "setImage:", v2);
  }
  else
  {
    objc_msgSend(WeakRetained, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setImage:", v3);

  }
}

- (id)defaultAvatarImageViewWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  ICThumbnailConfiguration *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_initWeak(&location, v5);
  v6 = [ICThumbnailConfiguration alloc];
  v7 = -[ICThumbnailConfiguration initForAvatarWithParticipants:preferredSize:hasBorder:](v6, "initForAvatarWithParticipants:preferredSize:hasBorder:", MEMORY[0x1E0C9AA60], 0, width, height);
  +[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke;
  v10[3] = &unk_1E5C20640;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "thumbnailWithConfiguration:completion:", v7, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  performBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "setImage:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setImage:", v3);

  }
}

- (BOOL)isAccessibilityElement
{
  return _AXSAutomationEnabled() != 0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("Collaborator Avatars");
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__32;
  v11 = __Block_byref_object_dispose__32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCollaboratorAvatarsView participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ICCollaboratorAvatarsView_accessibilityValue__block_invoke;
  v6[3] = &unk_1E5C20690;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__ICCollaboratorAvatarsView_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "ic_shortParticipantName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v3);

}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (double)dimension
{
  return self->_dimension;
}

- (NSArray)participants
{
  return self->_participants;
}

- (CKShare)share
{
  return (CKShare *)objc_loadWeakRetained((id *)&self->_share);
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)spacing
{
  return self->_spacing;
}

- (BOOL)reverseZIndexing
{
  return self->_reverseZIndexing;
}

- (void)setReverseZIndexing:(BOOL)a3
{
  self->_reverseZIndexing = a3;
}

- (NSArray)avatarContainerViews
{
  return self->_avatarContainerViews;
}

- (void)setAvatarContainerViews:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainerViews, a3);
}

- (UIStackView)avatarStackView
{
  return self->_avatarStackView;
}

- (void)setAvatarStackView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStackView, 0);
  objc_storeStrong((id *)&self->_avatarContainerViews, 0);
  objc_destroyWeak((id *)&self->_share);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
