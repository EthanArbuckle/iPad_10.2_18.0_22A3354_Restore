@implementation CNContactGridCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  return a3;
}

- (void)_createViewsIfNeeded
{
  void *v3;
  CNContactGridClippingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  CNAvatarView *v11;
  CNAvatarView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNContactGridClippingView *v17;

  -[CNContactGridCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CNContactGridClippingView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = -[CNContactGridClippingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[CNContactGridClippingView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGridClippingView setClipsToBounds:](v17, "setClipsToBounds:", 1);
    -[CNContactGridCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v17);

    -[CNContactGridCell setActionsClippingView:](self, "setActionsClippingView:", v17);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGridClippingView addSubview:](v17, "addSubview:", v10);
    -[CNContactGridCell setActionsContainerView:](self, "setActionsContainerView:", v10);
    v11 = [CNAvatarView alloc];
    -[CNContactGridCell bounds](self, "bounds");
    v12 = -[CNAvatarView initWithFrame:](v11, "initWithFrame:");
    -[CNContactGridCell delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setDelegate:](v12, "setDelegate:", v13);

    -[CNAvatarView setAutoUpdateContact:](v12, "setAutoUpdateContact:", 0);
    -[CNAvatarView setShowsContactOnTap:](v12, "setShowsContactOnTap:", -[CNContactGridCell showsContactOnTap](self, "showsContactOnTap"));
    -[CNAvatarView setAsynchronousRendering:](v12, "setAsynchronousRendering:", 1);
    -[CNAvatarView setForcePressView:](v12, "setForcePressView:", v12);
    -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGridCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    -[CNContactGridCell setAvatarView:](self, "setAvatarView:", v12);
    -[CNContactGridClippingView setAvatarView:](v17, "setAvatarView:", v12);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setTextAlignment:", 1);
    -[CNContactGridCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    -[CNContactGridCell setNameLabel:](self, "setNameLabel:", v15);
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[8];
  _QWORD v50[10];

  v50[8] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)CNContactGridCell;
  -[CNContactGridCell updateConstraints](&v46, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = CFSTR("top");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  objc_msgSend(v4, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v45;
  v49[1] = CFSTR("left");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  objc_msgSend(v5, "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v7;
  v49[2] = CFSTR("bottom");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v10;
  v49[3] = CFSTR("right");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  objc_msgSend(v11, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v13;
  v49[4] = CFSTR("width");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarSize](self, "avatarSize");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v15;
  v49[5] = CFSTR("height");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarSize](self, "avatarSize");
  objc_msgSend(v16, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v18;
  v49[6] = CFSTR("labelWidth");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactGridCell avatarSize](self, "avatarSize");
  v21 = v20;
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  v23 = v21 + v22;
  -[CNContactGridCell avatarMargins](self, "avatarMargins");
  objc_msgSend(v19, "numberWithDouble:", v23 + v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v25;
  v49[7] = CFSTR("actionsLeftMargin");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  +[CNContactGridCell actionsLeftMargin](CNContactGridCell, "actionsLeftMargin");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = CFSTR("avatar");
  -[CNContactGridCell avatarView](self, "avatarView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v29;
  v47[1] = CFSTR("nameLabel");
  -[CNContactGridCell nameLabel](self, "nameLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v30;
  v47[2] = CFSTR("actionsClippingView");
  -[CNContactGridCell actionsClippingView](self, "actionsClippingView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v31;
  v47[3] = CFSTR("actionsContainerView");
  -[CNContactGridCell actionsContainerView](self, "actionsContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(left)-[avatar(width)]-(>=right)-|"), 0, v28, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v34);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0-[nameLabel(labelWidth)]"), 0, v28, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v35);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(top)-[avatar(height)]-(bottom)-[nameLabel]-0-|"), 0, v28, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v36);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[actionsClippingView]-(right)-|"), 0, v28, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[actionsClippingView]-0-|"), 0, 0, v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v38);

  v39 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactGridCell actionsClippingView](self, "actionsClippingView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridCell avatarView](self, "avatarView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 5, 0, v41, 9, 1.0, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[avatar]-<=actionsLeftMargin-[actionsContainerView]->=0-|"), 0, v28, v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v43);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[actionsContainerView]-0-|"), 0, 0, v33);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v44);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)setContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v14 = a3;
  -[CNContactGridCell _createViewsIfNeeded](self, "_createViewsIfNeeded");
  v4 = v14;
  if (!v14)
    v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v15 = v4;
  -[CNContactGridCell avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContact:", v15);

  -[CNContactGridCell contactFormatter](self, "contactFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromContact:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CNContactGridCell nameTextAttributes](self, "nameTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v7, v11);
  -[CNContactGridCell nameLabel](self, "nameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v12);

  -[CNContactGridCell _updateActionsMask](self, "_updateActionsMask");
}

- (CNContact)contact
{
  void *v2;
  void *v3;

  -[CNContactGridCell avatarView](self, "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CNContactGridCell avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", obj);

    -[CNContactGridCell actionsView](self, "actionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", obj);

  }
}

- (id)animationBlockForPreparingToShowActions
{
  void *v3;
  void *v4;
  CNQuickActionsView *v5;
  CNQuickActionsView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[3];
  CGRect v29;
  CGRect v30;

  v28[2] = *MEMORY[0x1E0C80C00];
  -[CNContactGridCell actionsView](self, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [CNQuickActionsView alloc];
    v6 = -[CNQuickActionsView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNQuickActionsView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGridCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView setDelegate:](v6, "setDelegate:", v7);

    -[CNContactGridCell nameTextAttributes](self, "nameTextAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView setTitleTextAttributes:](v6, "setTitleTextAttributes:", v8);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceIdiom"))
    {
      -[CNQuickActionsView setInterspace:](v6, "setInterspace:", 24.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_referenceBounds");
      if (CGRectGetHeight(v29) <= 568.0)
      {
        -[CNQuickActionsView setInterspace:](v6, "setInterspace:", 24.0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "userInterfaceIdiom"))
        {
          -[CNQuickActionsView setInterspace:](v6, "setInterspace:", 35.0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_referenceBounds");
          v13 = CGRectGetHeight(v30) <= 667.0;
          v14 = 35.0;
          if (!v13)
            v14 = 24.0;
          -[CNQuickActionsView setInterspace:](v6, "setInterspace:", v14);

        }
      }

    }
    -[CNContactGridCell actionCategories](self, "actionCategories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView setCategories:](v6, "setCategories:", v15);

    -[CNContactGridCell actionsManager](self, "actionsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView setActionsManager:](v6, "setActionsManager:", v16);

    -[CNContactGridCell contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView setContact:](v6, "setContact:", v17);

    -[CNQuickActionsView setSortsWithDuet:](v6, "setSortsWithDuet:", 1);
    -[CNQuickActionsView setAlpha:](v6, "setAlpha:", 0.0);
    -[CNContactGridCell actionsContainerView](self, "actionsContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v6);

    -[CNContactGridCell setActionsView:](self, "setActionsView:", v6);
    v27[0] = CFSTR("avatar");
    -[CNContactGridCell avatarView](self, "avatarView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = CFSTR("actionsView");
    v28[0] = v19;
    v28[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0-[actionsView]-0-|"), 0, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v21);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactGridCell avatarView](self, "avatarView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 10, 0, v23, 10, 1.0, 10.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60__CNContactGridCell_animationBlockForPreparingToShowActions__block_invoke;
  v26[3] = &unk_1E204F648;
  v26[4] = self;
  return (id)objc_msgSend(v26, "copy");
}

- (id)completionBlockForHidingActions
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNContactGridCell actionsView](self, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridCell setActionsView:](self, "setActionsView:", 0);
  objc_msgSend(v3, "setAlpha:", 0.0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CNContactGridCell_completionBlockForHidingActions__block_invoke;
  v7[3] = &unk_1E204F648;
  v8 = v3;
  v4 = v3;
  v5 = (void *)objc_msgSend(v7, "copy");

  return v5;
}

- (void)_updateActionsMask
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[CNContactGridCell contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactGridCell contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNMonogrammer monogramTypeForContact:](CNMonogrammer, "monogramTypeForContact:", v4) != 2;

  }
  else
  {
    v5 = 0;
  }

  -[CNContactGridCell actionsClippingView](self, "actionsClippingView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToAvatar:", v5);

}

- (double)maximumActionsWidth
{
  void *v2;
  double v3;
  double v4;

  -[CNContactGridCell actionsView](self, "actionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumWidth");
  v4 = v3;

  return v4;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNAvatarViewDelegate)delegate
{
  return (CNAvatarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)avatarSize
{
  double width;
  double height;
  CGSize result;

  width = self->_avatarSize.width;
  height = self->_avatarSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAvatarSize:(CGSize)a3
{
  self->_avatarSize = a3;
}

- (UIEdgeInsets)avatarMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_avatarMargins.top;
  left = self->_avatarMargins.left;
  bottom = self->_avatarMargins.bottom;
  right = self->_avatarMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAvatarMargins:(UIEdgeInsets)a3
{
  self->_avatarMargins = a3;
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)setNameTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (BOOL)showsContactOnTap
{
  return self->_showsContactOnTap;
}

- (void)setShowsContactOnTap:(BOOL)a3
{
  self->_showsContactOnTap = a3;
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (void)setActionCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionsManager, a3);
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CNContactGridClippingView)actionsClippingView
{
  return self->_actionsClippingView;
}

- (void)setActionsClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsClippingView, a3);
}

- (UIView)actionsContainerView
{
  return self->_actionsContainerView;
}

- (void)setActionsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsContainerView, a3);
}

- (CNQuickActionsView)actionsView
{
  return self->_actionsView;
}

- (void)setActionsView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_actionsContainerView, 0);
  objc_storeStrong((id *)&self->_actionsClippingView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

uint64_t __52__CNContactGridCell_completionBlockForHidingActions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __60__CNContactGridCell_animationBlockForPreparingToShowActions__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "actionsView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

+ (double)actionsLeftMargin
{
  void *v2;
  void *v3;
  double Height;
  double result;
  void *v6;
  void *v7;
  double v8;
  CGRect v9;
  CGRect v10;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    Height = CGRectGetHeight(v9);

    result = 20.0;
    if (Height > 667.0)
      return result;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom"))
  {

    return 16.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v8 = CGRectGetHeight(v10);

    result = 16.0;
    if (v8 > 568.0)
      return 27.0;
  }
  return result;
}

@end
