@implementation HUQuickControlCollectionViewCellContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)_titleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB548], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3 titlePosition:(unint64_t)a4
{
  HUQuickControlCollectionViewCellContainerView *result;

  result = -[HUQuickControlCollectionViewCellContainerView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_titlePosition = a4;
  return result;
}

- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3
{
  HUQuickControlCollectionViewCellContainerView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  UILayoutGuide *v19;
  UILayoutGuide *preferredContentFrameLayoutGuide;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlCollectionViewCellContainerView;
  v3 = -[HUQuickControlCollectionViewCellContainerView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    objc_msgSend((id)objc_opt_class(), "_titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 1);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMinimumScaleFactor:", 0.5);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsDefaultTighteningForTruncation:", 1);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1148846080;
    objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v17);

    -[HUQuickControlCollectionViewCellContainerView titleLabel](v3, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewCellContainerView naui_addAutoLayoutSubview:](v3, "naui_addAutoLayoutSubview:", v18);

    v19 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    preferredContentFrameLayoutGuide = v3->_preferredContentFrameLayoutGuide;
    v3->_preferredContentFrameLayoutGuide = v19;

    -[HUQuickControlCollectionViewCellContainerView preferredContentFrameLayoutGuide](v3, "preferredContentFrameLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewCellContainerView addLayoutGuide:](v3, "addLayoutGuide:", v21);

    -[HUQuickControlCollectionViewCellContainerView _configureConstraintSets](v3, "_configureConstraintSets");
  }
  return v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[HUQuickControlCollectionViewCellContainerView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[HUQuickControlCollectionViewCellContainerView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") == 0;

  -[HUQuickControlCollectionViewCellContainerView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  v8 = objc_msgSend(v4, "length");
  if (((v6 ^ (v8 != 0)) & 1) == 0)
  {
    -[HUQuickControlCollectionViewCellContainerView constraintSet](self, "constraintSet");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v9 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[HUQuickControlCollectionViewCellContainerView naui_addAutoLayoutSubview:](self, "naui_addAutoLayoutSubview:", v9);
    -[HUQuickControlCollectionViewCellContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v9);
    -[HUQuickControlCollectionViewCellContainerView constraintSet](self, "constraintSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[HUQuickControlCollectionViewCellContainerView preferredContentFrameConstraintSet](self, "preferredContentFrameConstraintSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3
{
  id v6;

  if (self->_preferredContentLayoutFrameInset.left != a3.left
    || self->_preferredContentLayoutFrameInset.top != a3.top
    || self->_preferredContentLayoutFrameInset.right != a3.right
    || self->_preferredContentLayoutFrameInset.bottom != a3.bottom)
  {
    self->_preferredContentLayoutFrameInset = a3;
    -[HUQuickControlCollectionViewCellContainerView preferredContentFrameConstraintSet](self, "preferredContentFrameConstraintSet");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateConstraintConstants");

  }
}

- (void)setTitlePosition:(unint64_t)a3
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = a3 == 2;
  -[HUQuickControlCollectionViewCellContainerView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  if (self->_titlePosition != a3)
  {
    self->_titlePosition = a3;
    -[HUQuickControlCollectionViewCellContainerView constraintSet](self, "constraintSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUQuickControlCollectionViewCellContainerView constraintSet](self, "constraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateIfNeeded");

  -[HUQuickControlCollectionViewCellContainerView preferredContentFrameConstraintSet](self, "preferredContentFrameConstraintSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateIfNeeded");

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlCollectionViewCellContainerView;
  -[HUQuickControlCollectionViewCellContainerView updateConstraints](&v5, sel_updateConstraints);
}

- (void)_configureConstraintSets
{
  NAUILayoutConstraintSet *v3;
  NAUILayoutConstraintSet *preferredContentFrameConstraintSet;
  NAUILayoutConstraintSet *v5;
  NAUILayoutConstraintSet *constraintSet;

  v3 = (NAUILayoutConstraintSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51A18]), "initWithOwningView:constraintBuilder:", self, &__block_literal_global_207);
  preferredContentFrameConstraintSet = self->_preferredContentFrameConstraintSet;
  self->_preferredContentFrameConstraintSet = v3;

  v5 = (NAUILayoutConstraintSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51A18]), "initWithOwningView:constraintBuilder:", self, &__block_literal_global_56_2);
  constraintSet = self->_constraintSet;
  self->_constraintSet = v5;

}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "preferredContentLayoutFrameInset");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v2, "preferredContentFrameLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    objc_msgSend(v2, "preferredContentFrameLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v24;
    objc_msgSend(v2, "preferredContentFrameLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v14;
    objc_msgSend(v2, "preferredContentFrameLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
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
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  BOOL v56;
  _QWORD v57[4];
  id v58;
  BOOL v59;
  _QWORD v60[4];
  id v61;
  BOOL v62;
  _QWORD v63[3];
  _BYTE v64[128];
  _QWORD v65[9];

  v65[7] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v48 = objc_msgSend(v2, "titlePosition") != 2;
    else
      v48 = 0;

    objc_msgSend(v2, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "titleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v42;
    objc_msgSend(v2, "titleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v38;
    v65[2] = v49;
    v65[3] = v46;
    objc_msgSend(v2, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[4] = v12;
    objc_msgSend(v2, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = v16;
    objc_msgSend(v2, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3;
    v60[3] = &unk_1E6F5B000;
    v62 = v48;
    v22 = v2;
    v61 = v22;
    __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3((uint64_t)v60);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    v57[0] = v21;
    v57[1] = 3221225472;
    v57[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4;
    v57[3] = &unk_1E6F5B028;
    v59 = v48;
    v25 = v22;
    v58 = v25;
    __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4((uint64_t)v57);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);
    v54[0] = v21;
    v54[1] = 3221225472;
    v54[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5;
    v54[3] = &unk_1E6F5B028;
    v56 = v48;
    v55 = v25;
    __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5((uint64_t)v54);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v27);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v63[0] = v49;
    v63[1] = v46;
    v63[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v29)
    {
      v31 = v29;
      v32 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v28);
          LODWORD(v30) = 1111752704;
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "setPriority:", v30);
        }
        v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v31);
    }

    objc_msgSend(v47, "arrayByAddingObjectsFromArray:", v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend(v3, "titlePosition");
    v5 = *(void **)(a1 + 32);
    if (v4 == 1)
    {
      objc_msgSend(v5, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstBaselineAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 19.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v20;
    }
    else
    {
      objc_msgSend(v5, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentView", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastBaselineAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 12.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v19;
    }
    objc_msgSend(v15, "arrayWithObjects:count:", v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "titlePosition"))
  {
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastBaselineAnchor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bottomAnchor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "titlePosition"))
  {
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastBaselineAnchor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bottomAnchor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintLessThanOrEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)preferredChromeHeightForTitlePosition:(unint64_t)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  if (a3 == 1)
  {
    objc_msgSend(a1, "_titleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descender");
    v5 = fabs(v7);
    v6 = 19.0;
    goto LABEL_5;
  }
  v3 = 0.0;
  if (!a3)
  {
    objc_msgSend(a1, "_titleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ascender");
    v6 = 12.0;
LABEL_5:
    v3 = v6 + HURoundToScreenScale(v5);

  }
  return v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (UIEdgeInsets)preferredContentLayoutFrameInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredContentLayoutFrameInset.top;
  left = self->_preferredContentLayoutFrameInset.left;
  bottom = self->_preferredContentLayoutFrameInset.bottom;
  right = self->_preferredContentLayoutFrameInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UILayoutGuide)preferredContentFrameLayoutGuide
{
  return self->_preferredContentFrameLayoutGuide;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (NAUILayoutConstraintSet)preferredContentFrameConstraintSet
{
  return self->_preferredContentFrameConstraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentFrameConstraintSet, 0);
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_preferredContentFrameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
