@implementation CPSAppStoreButton

- (CPSAppStoreButton)initWithFrame:(CGRect)a3
{
  CPSAppStoreButton *v3;
  CPSAppStoreButton *v4;
  CPSAppStoreButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppStoreButton;
  v3 = -[CPSButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPSAppStoreButton _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (CPSAppStoreButton)initWithCoder:(id)a3
{
  CPSAppStoreButton *v3;
  CPSAppStoreButton *v4;
  CPSAppStoreButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppStoreButton;
  v3 = -[CPSButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CPSAppStoreButton _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  CGSize v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIStackView *v14;
  UIStackView *fullSizeStack;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  UIStackView *v20;
  UIStackView *glyphOnlyStack;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[9];
  _QWORD v56[2];
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_lastLayoutBounds.size = v3;
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  label = self->_label;
  self->_label = v4;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB548], 256);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v6);

  _CPSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v7);

  LODWORD(v8) = 1144733696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  v9 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  makeAppStoreImageView();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v10;
  makeVibrant(self->_label, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v11;
  makeChevronImageView();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UIStackView *)objc_msgSend(v9, "initWithArrangedSubviews:", v13);
  fullSizeStack = self->_fullSizeStack;
  self->_fullSizeStack = v14;

  -[UIStackView setSpacing:](self->_fullSizeStack, "setSpacing:", 3.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_fullSizeStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSAppStoreButton addSubview:](self, "addSubview:", self->_fullSizeStack);
  v16 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  makeAppStoreImageView();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v17;
  makeChevronImageView();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (UIStackView *)objc_msgSend(v16, "initWithArrangedSubviews:", v19);
  glyphOnlyStack = self->_glyphOnlyStack;
  self->_glyphOnlyStack = v20;

  -[UIStackView setSpacing:](self->_glyphOnlyStack, "setSpacing:", 3.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphOnlyStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSAppStoreButton addSubview:](self, "addSubview:", self->_glyphOnlyStack);
  v42 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView centerXAnchor](self->_fullSizeStack, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton centerXAnchor](self, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v52;
  -[UIStackView centerYAnchor](self->_fullSizeStack, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton centerYAnchor](self, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v49;
  -[UIStackView widthAnchor](self->_fullSizeStack, "widthAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton widthAnchor](self, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v46;
  -[UIStackView heightAnchor](self->_fullSizeStack, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton heightAnchor](self, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v43;
  -[UIStackView heightAnchor](self->_fullSizeStack, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton heightAnchor](self, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1144750080;
  objc_msgSend(v39, "cps_setPriority:", v22);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v38;
  -[UIStackView centerYAnchor](self->_glyphOnlyStack, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton centerYAnchor](self, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v35;
  -[UIStackView heightAnchor](self->_glyphOnlyStack, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton heightAnchor](self, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v24;
  -[UIStackView heightAnchor](self->_glyphOnlyStack, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton heightAnchor](self, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 1144750080;
  objc_msgSend(v27, "cps_setPriority:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v29;
  -[UIStackView trailingAnchor](self->_glyphOnlyStack, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppStoreButton trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v33);

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  _BOOL8 v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)CPSAppStoreButton;
  -[CPSAppStoreButton layoutSubviews](&v10, sel_layoutSubviews);
  -[CPSAppStoreButton bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (!CGRectEqualToRect(v11, self->_lastLayoutBounds))
  {
    self->_lastLayoutBounds.origin.x = x;
    self->_lastLayoutBounds.origin.y = y;
    self->_lastLayoutBounds.size.width = width;
    self->_lastLayoutBounds.size.height = height;
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v7 = CGRectGetWidth(v12);
    -[UIStackView systemLayoutSizeFittingSize:](self->_fullSizeStack, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    v9 = v7 >= v8;
    -[UIStackView setHidden:](self->_fullSizeStack, "setHidden:", v7 < v8);
    -[UIStackView setHidden:](self->_glyphOnlyStack, "setHidden:", v9);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  CGSize v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPSAppStoreButton;
  v4 = a3;
  -[CPSAppStoreButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[CPSAppStoreButton traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  v8 = UIContentSizeCategoryCompareToCategory(v6, v7);
  if (v8)
  {
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_lastLayoutBounds.size = v9;
    -[CPSAppStoreButton setNeedsLayout](self, "setNeedsLayout");
    -[CPSAppStoreButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSAppStoreButton;
  -[CPSButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UIStackView cps_configureForAnimatesAlphaWhenHighlighted:](self->_fullSizeStack, "cps_configureForAnimatesAlphaWhenHighlighted:", -[CPSAppStoreButton isHighlighted](self, "isHighlighted"));
  -[UIStackView cps_configureForAnimatesAlphaWhenHighlighted:](self->_glyphOnlyStack, "cps_configureForAnimatesAlphaWhenHighlighted:", -[CPSAppStoreButton isHighlighted](self, "isHighlighted"));
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)invalidateIntrinsicContentSize
{
  objc_super v2;

  self->_intrinsicContentSizeIsValid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CPSAppStoreButton;
  -[CPSAppStoreButton invalidateIntrinsicContentSize](&v2, sel_invalidateIntrinsicContentSize);
}

- (CGSize)intrinsicContentSize
{
  CGSize *p_intrinsicContentSize;
  double width;
  double height;
  CGSize result;

  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (self->_intrinsicContentSizeIsValid)
  {
    width = p_intrinsicContentSize->width;
    height = self->_intrinsicContentSize.height;
  }
  else
  {
    -[UIStackView systemLayoutSizeFittingSize:](self->_glyphOnlyStack, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    p_intrinsicContentSize->width = width;
    p_intrinsicContentSize->height = height;
    self->_intrinsicContentSizeIsValid = 1;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphOnlyStack, 0);
  objc_storeStrong((id *)&self->_fullSizeStack, 0);
}

@end
