@implementation CPUIBarButton

+ (id)buttonWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  id v29;
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
  id v40;
  int v41;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  objc_super v65;
  _QWORD v66[4];
  _QWORD v67[3];
  _QWORD v68[7];

  v68[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v65.receiver = a1;
  v65.super_class = (Class)&OBJC_METACLASS___CPUIBarButton;
  objc_msgSendSuper2(&v65, sel_buttonWithType_, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setImage:", v11);
    objc_msgSend(v13, "setType:", a6);
    objc_msgSend(v13, "setStyle:", a5);
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNormalColor:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFocusedColor:", v15);

    objc_msgSend(v13, "focusedColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNormalBackgroundColor:", v16);

    objc_msgSend(v13, "normalColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFocusedBackgroundColor:", v17);

    if (!v11 && a6 == 3)
    {
      objc_msgSend(v13, "setImageEdgeInsets:", -3.0, 1.0, 0.0, 0.0);
      objc_msgSend(v13, "setUsesSystemComposeGlyph:", 1);
      CPUILocalizedStringForKey(CFSTR("COMPOSE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v18;
      CPUILocalizedStringForKey(CFSTR("NEW_MESSAGE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v19;
      CPUILocalizedStringForKey(CFSTR("CREATE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v20;
      CPUILocalizedStringForKey(CFSTR("WRITE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v21;
      CPUILocalizedStringForKey(CFSTR("SQUARE_AND_PENCIL"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v68[4] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAccessibilityUserInputLabels:", v23);

      objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CPUIMessageComposeGlyph(v24, 17.0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v10)
    {
      objc_msgSend(v13, "setTitle:forState:", v10, 0);
    }
    else if (v11)
    {
      objc_msgSend(v13, "_updateButtonImage:", v11);
    }
    v25 = 0.0;
    v63 = v11;
    v64 = v10;
    if (objc_msgSend(v13, "showBackIndicator"))
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");

      if (v10)
      {
        if (v27 == 1)
          v28 = 0.0;
        else
          v28 = 10.0;
        objc_msgSend(v13, "setTitleEdgeInsets:", 0.0, v28);
      }
      else
      {
        objc_msgSend(v13, "setImageEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
      }
      v29 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
      objc_msgSend(v13, "setBackIndicatorImageView:", v29);

      objc_msgSend(v13, "backIndicatorImageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(v13, "backIndicatorImageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v31);

      objc_msgSend(v13, "backIndicatorImageView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "widthAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToConstant:", 19.5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v57;
      objc_msgSend(v13, "backIndicatorImageView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v34;
      objc_msgSend(v13, "backIndicatorImageView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "centerYAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "centerYAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 0.5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConstraints:", v39);

      objc_msgSend(v13, "_setupBackButtonImagesIfNeccessary");
      v25 = -6.0;
    }
    v40 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v41 = objc_msgSend(v13, "_showsRoundedBackground");
    objc_msgSend(v40, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v41)
    {
      objc_msgSend(v42, "setCornerRadius:", 17.0);

      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setBackgroundColor:", v43);
    }
    else
    {
      objc_msgSend(v42, "setCornerRadius:", 6.0);
    }

    objc_msgSend(v40, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    objc_msgSend(v13, "insertSubview:atIndex:", v40, 0);
    objc_msgSend(v13, "setBackgroundView:", v40);
    objc_msgSend(v40, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v60);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v58;
    objc_msgSend(v40, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v54);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v45;
    objc_msgSend(v40, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, v25);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v48;
    objc_msgSend(v40, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraints:", v52);

    objc_msgSend(v13, "sizeToFit");
    v11 = v63;
    v10 = v64;
  }

  return v13;
}

- (void)_updateButtonImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CPUIBarButton normalColor](self, "normalColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flatImageWithColor:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CPUIBarButton focusedColor](self, "focusedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_flatImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIBarButton setImage:forState:](self, "setImage:forState:", v8, 0);
  -[CPUIBarButton setImage:forState:](self, "setImage:forState:", v7, 8);

}

- (BOOL)_showsRoundedBackground
{
  void *v3;
  BOOL v4;

  -[CPUIBarButton image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CPUIBarButton style](self, "style") == 1;
  else
    v4 = 0;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[CPUIBarButton currentImage](self, "currentImage", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 30.0;
  if (v5
    || (v6 = 0.0, !v4)
    || !-[CPUIBarButton _showsRoundedBackground](self, "_showsRoundedBackground")
    || (objc_msgSend(v4, "size"), v11 = 34.0, v12 > 34.0))
  {
    -[CPUIBarButton titleForState:](self, "titleForState:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
      v9 = v6 + -10.0;
    else
      v9 = v6;
    if (v4)
    {
      objc_msgSend(v4, "size");
      v9 = v9 + v10;
    }
    else
    {
      -[CPUIBarButton currentTitle](self, "currentTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[CPUIBarButton titleLabel](self, "titleLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sizeToFit");

        -[CPUIBarButton titleLabel](self, "titleLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        v9 = v9 + v16;

      }
    }
    if (v9 <= 140.0)
      v11 = v9 + 13.0;
    else
      v11 = 153.0;
  }

  v17 = 34.0;
  v18 = v11;
  result.height = v17;
  result.width = v18;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CPUIBarButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_externalUnfocusedBorderColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPUIBarButton *v5;
  _BOOL8 v6;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (CPUIBarButton *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self;

  -[CPUIBarButton _updateBackgroundColorWithIsFocused:](self, "_updateBackgroundColorWithIsFocused:", v6);
  -[CPUIBarButton _updateBackIndicatorImageView](self, "_updateBackIndicatorImageView");
}

- (void)_updateBackgroundColorWithIsFocused:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[CPUIBarButton _showsRoundedBackground](self, "_showsRoundedBackground"))
  {
    if (!v3)
    {
      -[CPUIBarButton normalBackgroundColor](self, "normalBackgroundColor");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (id)v5;
      goto LABEL_8;
    }
LABEL_5:
    -[CPUIBarButton focusedBackgroundColor](self, "focusedBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v3)
    goto LABEL_5;
  v9 = 0;
LABEL_8:
  -[CPUIBarButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  -[CPUIBarButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[CPUIBarButton focusedColor](self, "focusedColor");
  else
    -[CPUIBarButton normalColor](self, "normalColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

}

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPUIBarButton;
  -[CPUIBarButton didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[CPUIBarButton backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIBarButton sendSubviewToBack:](self, "sendSubviewToBack:", v4);

}

- (void)_setupBackButtonImagesIfNeccessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
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
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[CPUIBarButton traitCollection](self, "traitCollection");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "userInterfaceIdiom") == 3 && -[CPUIBarButton showBackIndicator](self, "showBackIndicator"))
  {
    -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B8], 1024);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v5, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CPUIBarButton type](self, "type") == 2)
        v7 = CFSTR("xmark.circle.fill");
      else
        v7 = CFSTR("chevron.backward.circle.fill");
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithSymbolConfiguration:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIBarButton setBackIndicatorImage:](self, "setBackIndicatorImage:", v9);

      -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIBarButton backIndicatorImage](self, "backIndicatorImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v11);

      -[CPUIBarButton backIndicatorHeightConstraint](self, "backIndicatorHeightConstraint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "heightAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToConstant:", 19.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x24BDD1628];
        v20[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "activateConstraints:", v17);

        -[CPUIBarButton setBackIndicatorHeightConstraint:](self, "setBackIndicatorHeightConstraint:", v15);
      }
      -[CPUIBarButton backIndicatorHeightConstraint](self, "backIndicatorHeightConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", 19.0);

      -[CPUIBarButton _updateBackIndicatorImageView](self, "_updateBackIndicatorImageView");
    }
  }
  else
  {

  }
}

- (BOOL)showBackIndicator
{
  unint64_t v3;

  v3 = -[CPUIBarButton type](self, "type");
  if (v3 != 1)
    LOBYTE(v3) = -[CPUIBarButton type](self, "type") == 2;
  return v3;
}

- (UIFont)buttonFont
{
  void *v2;
  void *v3;

  -[CPUIBarButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setButtonFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPUIBarButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

  -[CPUIBarButton _setupBackButtonImagesIfNeccessary](self, "_setupBackButtonImagesIfNeccessary");
}

- (void)setNormalColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_normalColor, a3);
  v5 = a3;
  -[CPUIBarButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);
  -[CPUIBarButton image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIBarButton setImage:forState:](self, "setImage:forState:", v7, 0);
  -[CPUIBarButton _updateBackgroundColorWithIsFocused:](self, "_updateBackgroundColorWithIsFocused:", -[CPUIBarButton isFocused](self, "isFocused"));
  -[CPUIBarButton _updateBackIndicatorImageView](self, "_updateBackIndicatorImageView");
}

- (void)setFocusedColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_focusedColor, a3);
  v5 = a3;
  -[CPUIBarButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 1);
  -[CPUIBarButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 8);
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIBarButton setTitleColor:forState:](self, "setTitleColor:forState:", v6, 9);

  -[CPUIBarButton image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIBarButton setImage:forState:](self, "setImage:forState:", v8, 8);
  -[CPUIBarButton _updateBackgroundColorWithIsFocused:](self, "_updateBackgroundColorWithIsFocused:", -[CPUIBarButton isFocused](self, "isFocused"));
  -[CPUIBarButton _updateBackIndicatorImageView](self, "_updateBackIndicatorImageView");
}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
  -[CPUIBarButton _updateBackgroundColorWithIsFocused:](self, "_updateBackgroundColorWithIsFocused:", -[CPUIBarButton isFocused](self, "isFocused"));
}

- (void)setFocusedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, a3);
  -[CPUIBarButton _updateBackgroundColorWithIsFocused:](self, "_updateBackgroundColorWithIsFocused:", -[CPUIBarButton isFocused](self, "isFocused"));
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  -[CPUIButton traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[CPUIBarButton _setupBackButtonImagesIfNeccessary](self, "_setupBackButtonImagesIfNeccessary");
  if (-[CPUIBarButton usesSystemComposeGlyph](self, "usesSystemComposeGlyph"))
  {
    -[CPUIBarButton traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIMessageComposeGlyph(v4, 17.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIBarButton _updateButtonImage:](self, "_updateButtonImage:", v5);

  }
  else
  {
    -[CPUIBarButton image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    -[CPUIBarButton image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIBarButton _updateButtonImage:](self, "_updateButtonImage:", v4);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPUIBarButton;
  v6 = a3;
  -[CPUIBarButton touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, a4);
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if ((_DWORD)a4)
  {
    if ((-[CPUIBarButton isFocused](self, "isFocused", v9.receiver, v9.super_class) & 1) == 0)
    {
      -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 0.2);

    }
    -[CPUIBarButton backgroundView](self, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.2);

  }
}

- (void)_updateBackIndicatorImageView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[CPUIBarButton isFocused](self, "isFocused");
    -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[CPUIBarButton focusedColor](self, "focusedColor");
    else
      -[CPUIBarButton normalColor](self, "normalColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
}

- (void)_resetAlpha
{
  void *v3;
  id v4;

  -[CPUIBarButton backIndicatorImageView](self, "backIndicatorImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[CPUIBarButton backgroundView](self, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  v6 = a3;
  -[CPUIBarButton touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, v6, a4);
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if ((_DWORD)a4)
    -[CPUIBarButton _resetAlpha](self, "_resetAlpha", v7.receiver, v7.super_class);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  v6 = a3;
  -[CPUIBarButton touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, v6, a4);
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if ((_DWORD)a4)
    -[CPUIBarButton _resetAlpha](self, "_resetAlpha", v7.receiver, v7.super_class);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CPUIBarButton *v5;

  if (-[CPUIBarButton pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)usesSystemComposeGlyph
{
  return self->_usesSystemComposeGlyph;
}

- (void)setUsesSystemComposeGlyph:(BOOL)a3
{
  self->_usesSystemComposeGlyph = a3;
}

- (UIImageView)backIndicatorImageView
{
  return self->_backIndicatorImageView;
}

- (void)setBackIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backIndicatorImageView, a3);
}

- (UIImage)backIndicatorImage
{
  return self->_backIndicatorImage;
}

- (void)setBackIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_backIndicatorImage, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSLayoutConstraint)backIndicatorHeightConstraint
{
  return self->_backIndicatorHeightConstraint;
}

- (void)setBackIndicatorHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backIndicatorHeightConstraint, a3);
}

- (UIColor)normalColor
{
  return self->_normalColor;
}

- (UIColor)focusedColor
{
  return self->_focusedColor;
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedColor, 0);
  objc_storeStrong((id *)&self->_normalColor, 0);
  objc_storeStrong((id *)&self->_backIndicatorHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
  objc_storeStrong((id *)&self->_backIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
