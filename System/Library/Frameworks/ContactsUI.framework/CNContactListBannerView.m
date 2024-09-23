@implementation CNContactListBannerView

- (void)setTopSeparatorWithInset:(double)a3 andLength:(double)a4
{
  CALayer *v7;
  CALayer *topSeparator;
  id v9;
  void *v10;
  double v11;
  id v12;

  if (!self->_topSeparator)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
    topSeparator = self->_topSeparator;
    self->_topSeparator = v7;

    +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  -[CALayer setFrame:](self->_topSeparator, "setFrame:", a3, 0.0, a4, 1.0 / v11);

  -[CNContactListBannerView layer](self, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", self->_topSeparator);

}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setAvatarView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id firstValue;

  firstValue = a3;
  -[UIView removeFromSuperview](self->_avatarView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_avatarView, a3);
  if (firstValue)
  {
    objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _NSDictionaryOfVariableBindings(CFSTR("avatarView"), firstValue, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListBannerView avatarViewContainer](self, "avatarViewContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", firstValue);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[avatarView(avatarSize)]|"), 0, &unk_1E20D39D0, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(verticalMargin)-[avatarView(avatarSize)]-(verticalMargin)-|"), 0, &unk_1E20D39D0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  }

}

- (UIView)avatarViewContainer
{
  return self->_avatarViewContainer;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_17692 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_17692, &__block_literal_global_17693);
  return (id)descriptorForRequiredKeys_cn_once_object_1_17694;
}

void __52__CNContactListBannerView_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListBannerView descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_17694;
  descriptorForRequiredKeys_cn_once_object_1_17694 = v4;

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    -[UILabel setPreferredMaxLayoutWidth:](self->_titleLabel, "setPreferredMaxLayoutWidth:", floor(width + -60.0 + -30.0));
LABEL_5:
    -[CNContactListBannerView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", width, height);
    width = v8;
    goto LABEL_6;
  }
  -[CNContactListBannerView avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  v7 = 80.0;
LABEL_6:
  v9 = width;
  result.height = v7;
  result.width = v9;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (CNContactListBannerView)init
{
  CNContactListBannerView *v2;
  CNContactFormatter *v3;
  CNContactFormatter *formatter;
  uint64_t v5;
  UIGestureRecognizer *longPress;
  UIView *v7;
  UIView *avatarViewContainer;
  id v9;
  UILabel *v10;
  UILabel *titleLabel;
  UIView *v12;
  UIView *footnoteContainer;
  void *v14;
  UILabel *v15;
  UILabel *footnoteLabel;
  UILabel *v17;
  UILabel *footnoteValueLabel;
  UILabel *v19;
  NSArray *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSLayoutConstraint *footnoteTitleToTitleVerticalConstraint;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSLayoutConstraint *footnoteTitleToValueHorizontalSpaceConstraint;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  UIView *v56;
  void *v57;
  void *v58;
  void *v59;
  NSArray *constraintsPendingActivation;
  CNContactListBannerView *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[6];
  _QWORD v70[8];

  v70[6] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)CNContactListBannerView;
  v2 = -[CNContactListBannerView init](&v68, sel_init);
  if (v2)
  {
    v3 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    -[CNContactFormatter setStyle:](v2->_formatter, "setStyle:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v2, sel_cellWasLongPressed_);
    longPress = v2->_longPress;
    v2->_longPress = (UIGestureRecognizer *)v5;

    -[CNContactListBannerView addGestureRecognizer:](v2, "addGestureRecognizer:", v2->_longPress);
    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v2, sel_cellWasSingleTapped_);
    objc_msgSend(v67, "setNumberOfTapsRequired:", 1);
    -[CNContactListBannerView addGestureRecognizer:](v2, "addGestureRecognizer:", v67);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    avatarViewContainer = v2->_avatarViewContainer;
    v2->_avatarViewContainer = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_avatarViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactListBannerView addSubview:](v2, "addSubview:", v2->_avatarViewContainer);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactListBannerView addSubview:](v2, "addSubview:", v9);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v2->_titleLabel);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    footnoteContainer = v2->_footnoteContainer;
    v2->_footnoteContainer = v12;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_footnoteContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2->_footnoteContainer, "setBackgroundColor:", v14);

    objc_msgSend(v9, "addSubview:", v2->_footnoteContainer);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    footnoteLabel = v2->_footnoteLabel;
    v2->_footnoteLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_footnoteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_footnoteContainer, "addSubview:", v2->_footnoteLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    footnoteValueLabel = v2->_footnoteValueLabel;
    v2->_footnoteValueLabel = v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_footnoteValueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_footnoteContainer, "addSubview:", v2->_footnoteValueLabel);
    v69[0] = CFSTR("avatarViewContainer");
    v70[0] = v2->_avatarViewContainer;
    v69[1] = CFSTR("title");
    v70[1] = v2->_titleLabel;
    v69[2] = CFSTR("footnoteContainer");
    v70[2] = v2->_footnoteContainer;
    v69[3] = CFSTR("footnoteTitle");
    v70[3] = v2->_footnoteLabel;
    v69[4] = CFSTR("footnoteValue");
    v19 = v2->_footnoteValueLabel;
    v69[5] = CFSTR("labelContainer");
    v70[4] = v19;
    v70[5] = v9;
    v64 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 6);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 8, 0, 0, 0, 0.0, 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1132068864;
    objc_msgSend(v66, "setPriority:", v21);
    -[NSArray addObject:](v20, "addObject:", v66);
    v22 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_avatarViewContainer, 10, 0, v2, 10, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_avatarViewContainer, 8, -1, v2, 8, 1.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v24);

    if (-[CNContactListBannerView effectiveUserInterfaceLayoutDirection](v2, "effectiveUserInterfaceLayoutDirection") != 1)
      v22 = 2.0;
    v25 = (void *)MEMORY[0x1E0CB3718];
    v26 = v2->_avatarViewContainer;
    -[CNContactListBannerView layoutMarginsGuide](v2, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 5, 0, v27, 5, v22, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v28);

    LODWORD(v29) = 1132068864;
    -[UIView setContentHuggingPriority:forAxis:](v2->_avatarViewContainer, "setContentHuggingPriority:forAxis:", 1, v29);
    LODWORD(v30) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v2->_avatarViewContainer, "setContentHuggingPriority:forAxis:", 0, v30);
    LODWORD(v31) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v2->_avatarViewContainer, "setContentCompressionResistancePriority:forAxis:", 1, v31);
    LODWORD(v32) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v2->_avatarViewContainer, "setContentCompressionResistancePriority:forAxis:", 0, v32);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_avatarViewContainer, 7, 0, 0, 0, 0.0, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1132068864;
    objc_msgSend(v65, "setPriority:", v33);
    -[NSArray addObject:](v20, "addObject:", v65);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 10, 0, v2, 10, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v34);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_titleLabel, 3, 1, v2, 3, 1.0, 10.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v35);

    LODWORD(v36) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_titleLabel, 5, 0, v2->_avatarViewContainer, 6, 1.0, 15.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v37);

    v38 = (void *)MEMORY[0x1E0CB3718];
    v39 = v2->_titleLabel;
    -[CNContactListBannerView layoutMarginsGuide](v2, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 6, -1, v40, 6, 1.0, 0.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v41);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[title]"), 0, 0, v63);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v42);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[title]|"), 0, 0, v63);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v43);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_footnoteLabel, 12, 0, v2->_titleLabel, 11, 1.0, 0.0);
    v44 = objc_claimAutoreleasedReturnValue();
    footnoteTitleToTitleVerticalConstraint = v2->_footnoteTitleToTitleVerticalConstraint;
    v2->_footnoteTitleToTitleVerticalConstraint = (NSLayoutConstraint *)v44;

    -[NSArray addObject:](v20, "addObject:", v2->_footnoteTitleToTitleVerticalConstraint);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_footnoteLabel, 4, -1, v2, 4, 1.0, -10.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v46);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[footnoteTitle]"), 0, 0, v63);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v47);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[footnoteValue]|"), 0, 0, v63);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v48);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_footnoteValueLabel, 10, 0, v2->_footnoteLabel, 10, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v49);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_footnoteLabel, 6, 0, v2->_footnoteValueLabel, 5, 1.0, 0.0);
    v50 = objc_claimAutoreleasedReturnValue();
    footnoteTitleToValueHorizontalSpaceConstraint = v2->_footnoteTitleToValueHorizontalSpaceConstraint;
    v2->_footnoteTitleToValueHorizontalSpaceConstraint = (NSLayoutConstraint *)v50;

    -[NSArray addObject:](v20, "addObject:", v2->_footnoteTitleToValueHorizontalSpaceConstraint);
    LODWORD(v52) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v2->_footnoteLabel, "setContentHuggingPriority:forAxis:", 0, v52);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[footnoteTitle]|"), 0, 0, v63);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v53);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->_footnoteContainer, 5, 0, v2->_avatarViewContainer, 6, 1.0, 15.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v54);

    v55 = (void *)MEMORY[0x1E0CB3718];
    v56 = v2->_footnoteContainer;
    -[CNContactListBannerView layoutMarginsGuide](v2, "layoutMarginsGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v56, 6, 0, v57, 6, 1.0, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v20, "addObject:", v58);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[footnoteContainer]|"), 0, 0, v63);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v59);

    constraintsPendingActivation = v2->_constraintsPendingActivation;
    v2->_constraintsPendingActivation = v20;

    v61 = v2;
  }

  return v2;
}

- (void)setMeContact:(id)a3 footnoteTitle:(id)a4 footnoteValue:(id)a5
{
  void *v5;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v9 = a5;
  -[CNContactListBannerView setMeContact:](self, "setMeContact:", a3);
  v10 = *MEMORY[0x1E0D13848];
  v11 = (*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v23);
  v12 = v23;
  if (v11)
  {
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MY_CARD"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactListBannerView footnoteLabel](self, "footnoteLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  if (v11)
  {

  }
  -[CNContactListBannerView footnoteValueLabel](self, "footnoteValueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v9);

  v15 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v9);
  -[CNContactListBannerView longPress](self, "longPress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v15 ^ 1u);

  if (v15)
    v17 = 0.0;
  else
    v17 = -5.0;
  -[CNContactListBannerView footnoteTitleToValueHorizontalSpaceConstraint](self, "footnoteTitleToValueHorizontalSpaceConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

  if (-[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"))
  {
    -[CNContactListBannerView formatter](self, "formatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListBannerView meContact](self, "meContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromContact:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListBannerView titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

  }
  else
  {
    -[CNContactListBannerView titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", 0);
  }

  -[CNContactListBannerView updateFontRelatedConstraints](self, "updateFontRelatedConstraints");
  -[CNContactListBannerView activatePendingConstraints](self, "activatePendingConstraints");
  -[CNContactListBannerView configureDragInteraction](self, "configureDragInteraction");

}

- (UILabel)footnoteValueLabel
{
  return self->_footnoteValueLabel;
}

- (void)updateFontRelatedConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[CNContactListBannerView contactListStyleApplier](self, "contactListStyleApplier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListBannerView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyContactListStyleToBannerTitle:primaryAppearance:", v4, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  -[CNContactListBannerView contactListStyleApplier](self, "contactListStyleApplier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListBannerView footnoteLabel](self, "footnoteLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyContactListStyleToBannerFootnote:primaryAppearance:", v6, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  -[CNContactListBannerView contactListStyleApplier](self, "contactListStyleApplier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListBannerView footnoteValueLabel](self, "footnoteValueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyContactListStyleToBannerFootnote:primaryAppearance:", v8, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  -[CNContactListBannerView footnoteLabel](self, "footnoteLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 20.0);
  v12 = v11;

  -[CNContactListBannerView footnoteTitleToTitleVerticalConstraint](self, "footnoteTitleToTitleVerticalConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v12);

  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    v14 = 2;
  else
    v14 = 1;
  -[CNContactListBannerView titleLabel](self, "titleLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", v14);

}

- (BOOL)displaysContactInfo
{
  void *v2;
  BOOL v3;

  -[CNContactListBannerView meContact](self, "meContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (void)setConstraintsPendingActivation:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsPendingActivation, a3);
}

- (UIGestureRecognizer)longPress
{
  return self->_longPress;
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (NSLayoutConstraint)footnoteTitleToValueHorizontalSpaceConstraint
{
  return self->_footnoteTitleToValueHorizontalSpaceConstraint;
}

- (NSLayoutConstraint)footnoteTitleToTitleVerticalConstraint
{
  return self->_footnoteTitleToTitleVerticalConstraint;
}

- (void)configureDragInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (objc_msgSend(MEMORY[0x1E0DC3750], "isEnabledByDefault"))
  {
    -[CNContactListBannerView meContact](self, "meContact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListBannerView dragInteraction](self, "dragInteraction");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

      if (!v8)
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", self);
        -[CNContactListBannerView setDragInteraction:](self, "setDragInteraction:", v4);

        -[CNContactListBannerView dragInteraction](self, "dragInteraction");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactListBannerView addInteraction:](self, "addInteraction:", v5);

      }
      -[CNContactListBannerView dragInteraction](self, "dragInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v7 = 1;
    }
    else
    {
      v6 = v8;
      v7 = 0;
    }
    objc_msgSend(v6, "setEnabled:", v7);

  }
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (void)activatePendingConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNContactListBannerView constraintsPendingActivation](self, "constraintsPendingActivation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactListBannerView constraintsPendingActivation](self, "constraintsPendingActivation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v6);

    -[CNContactListBannerView setConstraintsPendingActivation:](self, "setConstraintsPendingActivation:", MEMORY[0x1E0C9AA60]);
  }
}

- (NSArray)constraintsPendingActivation
{
  return self->_constraintsPendingActivation;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactListBannerView;
  v4 = a3;
  -[CNContactListBannerView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[CNContactListBannerView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v6)
  {
    +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  }
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
  -[CNContactListBannerView applyStyle](self, "applyStyle");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactListBannerView;
  -[CNContactListBannerView dealloc](&v4, sel_dealloc);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNContactListBannerView meContact](self, "meContact", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListBannerView contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDraggingContacts dragItemForContact:withContactStore:](CNUIDraggingContacts, "dragItemForContact:withContactStore:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (sel_copy_ == a3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)CNContactListBannerView;
  return -[CNContactListBannerView canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactListBannerView footnoteValueLabel](self, "footnoteValueLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v5);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)menuDidHide:(id)a3
{
  id v4;

  -[CNContactListBannerView resignFirstResponder](self, "resignFirstResponder", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)showMenu
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListBannerView bounds](self, "bounds");
  objc_msgSend(v4, "setTargetRect:inView:", self);
  objc_msgSend(v4, "setMenuVisible:animated:", 1, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_menuDidHide_, *MEMORY[0x1E0DC5040], v4);

}

- (void)cellWasLongPressed:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
  {
    if (-[CNContactListBannerView becomeFirstResponder](self, "becomeFirstResponder"))
      -[CNContactListBannerView showMenu](self, "showMenu");
  }
}

- (void)cellWasSingleTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactListBannerView meContact](self, "meContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactListBannerView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListBannerView meContact](self, "meContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bannerView:wasSelectedToPresentMeContact:", self, v5);

  }
}

- (CNContactListBannerViewDelegate)delegate
{
  return (CNContactListBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (UIView)footnoteContainer
{
  return self->_footnoteContainer;
}

- (CALayer)topSeparator
{
  return self->_topSeparator;
}

- (void)setFootnoteTitleToTitleVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteTitleToTitleVerticalConstraint, a3);
}

- (void)setFootnoteTitleToValueHorizontalSpaceConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteTitleToValueHorizontalSpaceConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_constraintsPendingActivation, 0);
  objc_storeStrong((id *)&self->_footnoteTitleToValueHorizontalSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_footnoteTitleToTitleVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_footnoteValueLabel, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarViewContainer, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
