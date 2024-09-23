@implementation SFDefaultBrowserAppCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("BrowserAppCollectionViewCell");
}

+ (CGSize)estimatedSizeForBounds:(CGSize)a3 withTraits:(id)a4
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  ASCLockupViewSizeGetEstimatedSize();
  v6 = v5 + 12.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFDefaultBrowserAppCollectionViewCell;
  -[SFDefaultBrowserAppCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  -[SFDefaultBrowserAppCollectionViewCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDefaultBrowserAppCollectionViewCell estimatedSizeForBounds:withTraits:](SFDefaultBrowserAppCollectionViewCell, "estimatedSizeForBounds:withTraits:", v9, v6, v8);
  objc_msgSend(v4, "setSize:");

  return v4;
}

- (void)setLockupView:(id)a3
{
  ASCLockupView *v5;
  ASCLockupView **p_lockupView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
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
  SFDefaultBrowserAppCollectionViewCell *v47;
  ASCLockupView *v48;
  _QWORD v49[4];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
  v5 = (ASCLockupView *)a3;
  p_lockupView = &self->_lockupView;
  if (self->_lockupView != v5)
  {
    v48 = v5;
    -[ASCLockupView lockup](v5, "lockup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v8;
    -[ASCLockupView removeFromSuperview](*p_lockupView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lockupView, a3);
    -[ASCLockupView setTranslatesAutoresizingMaskIntoConstraints:](*p_lockupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v47 = self;
    -[SFDefaultBrowserAppCollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 4);
    objc_msgSend(v9, "setLayoutMargins:", 6.0, 10.0, 6.0, 10.0);
    objc_msgSend(v9, "addSubview:", *p_lockupView);
    v37 = (void *)MEMORY[0x1E0CB3718];
    -[ASCLockupView leadingAnchor](*p_lockupView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v10;
    -[ASCLockupView trailingAnchor](*p_lockupView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -20.0;
    if (!v8)
      v14 = 0.0;
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v15;
    -[ASCLockupView centerYAnchor](*p_lockupView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v19);

    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v42);
      objc_msgSend(v20, "setContentMode:", 4);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v21);

      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "addSubview:", v20);
      v35 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v20, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutMarginsGuide");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36, -20.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v22;
      objc_msgSend(v20, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 20.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v24;
      objc_msgSend(v20, "heightAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToConstant:", 20.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v26;
      objc_msgSend(v20, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v9;
      objc_msgSend(v9, "centerYAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "activateConstraints:", v30);

      objc_msgSend(v20, "setSemanticContentAttribute:", 3);
      -[ASCLockupView subviews](v48, "subviews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "effectiveUserInterfaceLayoutDirection");

      if (v33 == 1)
        objc_msgSend(v20, "setSemanticContentAttribute:", 4);

      v9 = v46;
    }
    -[SFDefaultBrowserAppCollectionViewCell lockupView](v47, "lockupView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setUserInteractionEnabled:", 0);

    -[SFDefaultBrowserAppCollectionViewCell _updateBackgroundColor](v47, "_updateBackgroundColor");
    v5 = v48;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFDefaultBrowserAppCollectionViewCell;
  -[SFDefaultBrowserAppCollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SFDefaultBrowserAppCollectionViewCell _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFDefaultBrowserAppCollectionViewCell;
  -[SFDefaultBrowserAppCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SFDefaultBrowserAppCollectionViewCell _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[ASCLockupView lockup](self->_lockupView, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((-[SFDefaultBrowserAppCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
      || (-[SFDefaultBrowserAppCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v5;
  -[SFDefaultBrowserAppCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
