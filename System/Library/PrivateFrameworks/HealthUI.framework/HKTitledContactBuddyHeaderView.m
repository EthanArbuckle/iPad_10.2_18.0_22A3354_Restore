@implementation HKTitledContactBuddyHeaderView

- (HKTitledContactBuddyHeaderView)initWithTopInset:(double)a3 parentViewController:(id)a4
{
  id v6;
  HKTitledContactBuddyHeaderView *v7;
  HKTitledContactBuddyHeaderView *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
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
  uint64_t v38;
  NSLayoutConstraint *titleBaselineConstraint;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HKTitledContactBuddyHeaderView;
  v7 = -[HKTitledBuddyHeaderView initWithTopInset:linkButtonTitle:](&v41, sel_initWithTopInset_linkButtonTitle_, 0, a3);
  v8 = v7;
  if (v7)
  {
    -[HKTitledContactBuddyHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v9 = objc_alloc_init(MEMORY[0x1E0CFAED0]);
    objc_msgSend(v9, "profilePictureForAccountOwnerWithoutMonogramFallback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_resizedInterfaceImageWithSize:", 59.0, 59.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");

      v47 = 0;
      v48 = &v47;
      v49 = 0x2050000000;
      v14 = (void *)getCNAvatarImageRendererClass_softClass;
      v50 = getCNAvatarImageRendererClass_softClass;
      if (!getCNAvatarImageRendererClass_softClass)
      {
        v42 = MEMORY[0x1E0C809B0];
        v43 = 3221225472;
        v44 = __getCNAvatarImageRendererClass_block_invoke;
        v45 = &unk_1E9C3FDF8;
        v46 = &v47;
        __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v42);
        v14 = (void *)v48[3];
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v47, 8);
      v16 = objc_alloc_init(v15);
      v47 = 0;
      v48 = &v47;
      v49 = 0x2050000000;
      v17 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
      v50 = getCNAvatarImageRenderingScopeClass_softClass;
      if (!getCNAvatarImageRenderingScopeClass_softClass)
      {
        v42 = MEMORY[0x1E0C809B0];
        v43 = 3221225472;
        v44 = __getCNAvatarImageRenderingScopeClass_block_invoke;
        v45 = &unk_1E9C3FDF8;
        v46 = &v47;
        __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v42);
        v17 = (void *)v48[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v47, 8);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");
      objc_msgSend(v18, "scopeWithPointSize:scale:rightToLeft:style:", v13 == 1, 0, 59.0, 59.0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_alloc_init(MEMORY[0x1E0C97200]);
      v51[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "avatarImageForContacts:scope:", v23, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKTitledContactBuddyHeaderView addSubview:](v8, "addSubview:", v24);
    -[HKTitledBuddyHeaderView deactivateDefaultTitleLabelBaselineConstraint](v8, "deactivateDefaultTitleLabelBaselineConstraint");
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledContactBuddyHeaderView topAnchor](v8, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    objc_msgSend(v24, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledContactBuddyHeaderView centerXAnchor](v8, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    objc_msgSend(v24, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 59.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    objc_msgSend(v24, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 59.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[HKTitledBuddyHeaderView titleLabel](v8, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 0.0);
    v38 = objc_claimAutoreleasedReturnValue();
    titleBaselineConstraint = v8->_titleBaselineConstraint;
    v8->_titleBaselineConstraint = (NSLayoutConstraint *)v38;

    -[NSLayoutConstraint setActive:](v8->_titleBaselineConstraint, "setActive:", 1);
    -[HKTitledContactBuddyHeaderView _updateForCurrentSizeCategory](v8, "_updateForCurrentSizeCategory");

  }
  return v8;
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKTitledContactBuddyHeaderView;
  -[HKTitledBuddyHeaderView _updateForCurrentSizeCategory](&v4, sel__updateForCurrentSizeCategory);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 44.0);
  -[NSLayoutConstraint setConstant:](self->_titleBaselineConstraint, "setConstant:");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[HKTitledContactBuddyHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[HKTitledContactBuddyHeaderView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
      v4 = v9;
    }
  }

}

- (double)bottomPadding
{
  return 56.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBaselineConstraint, 0);
}

@end
