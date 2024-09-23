@implementation HUWheelControlPanelCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUWheelControlPanelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUWheelControlPanelCell *v4;
  UILabel *v5;
  UILabel *titleLabel;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *p_wheelButton;
  HUWheelControlPopUpButton *wheelButton;
  UILabel *v13;
  UILabel *detailLabel;
  void *v15;
  void *v16;
  UIView *v17;
  UIView *separatorView;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUWheelControlPanelCell;
  v4 = -[HUWheelControlPanelCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v8);

    -[HUWheelControlPanelCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_titleLabel);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    {
      +[HUWheelControlPopUpButton buttonWithType:](HUWheelControlPopUpButton, "buttonWithType:", 124);
      v10 = objc_claimAutoreleasedReturnValue();
      p_wheelButton = &v4->_wheelButton;
      wheelButton = v4->_wheelButton;
      v4->_wheelButton = (HUWheelControlPopUpButton *)v10;

      -[HUWheelControlPopUpButton setContextMenuEnabled:](v4->_wheelButton, "setContextMenuEnabled:", 1);
      -[HUWheelControlPopUpButton setContextMenuIsPrimary:](v4->_wheelButton, "setContextMenuIsPrimary:", 1);
      -[HUWheelControlPopUpButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_wheelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    else
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      p_wheelButton = &v4->_detailLabel;
      detailLabel = v4->_detailLabel;
      v4->_detailLabel = v13;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v4->_detailLabel, "setFont:", v15);

    }
    -[HUWheelControlPanelCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", *p_wheelButton);

    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUWheelControlPanelCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_separatorView);

  }
  return v4;
}

- (id)allControlViews
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom");
  v4 = (void *)MEMORY[0x1E0C99E60];
  if (v3)
    -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
  else
    -[HUWheelControlPanelCell wheelView](self, "wheelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetailText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setWheelView:(id)a3
{
  HUWheelControlView *v5;
  HUWheelControlView **p_wheelView;
  HUWheelControlView *wheelView;
  void *v8;
  HUWheelControlView *v9;

  v5 = (HUWheelControlView *)a3;
  p_wheelView = &self->_wheelView;
  wheelView = self->_wheelView;
  if (wheelView != v5)
  {
    v9 = v5;
    -[HUWheelControlView removeFromSuperview](wheelView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wheelView, a3);
    -[HUWheelControlView setTranslatesAutoresizingMaskIntoConstraints:](*p_wheelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUWheelControlPanelCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_wheelView);

    -[HUWheelControlView setWheelDelegate:](*p_wheelView, "setWheelDelegate:", self);
    self->_wheelViewVisible = 0;
    -[HUWheelControlView setHidden:](*p_wheelView, "setHidden:", 1);
    -[UIView setHidden:](self->_separatorView, "setHidden:", 1);
    -[HUWheelControlPanelCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v9;
  }

}

- (void)setWheelViewVisible:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  if (self->_wheelViewVisible != a3)
  {
    self->_wheelViewVisible = a3;
    v4 = !a3;
    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    v6 = !self->_wheelViewVisible;
    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

    -[HUWheelControlPanelCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUWheelControlPanelCell wheelView](self, "wheelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  double v33;
  void *v34;
  double v35;
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
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;

  -[HUWheelControlPanelCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWheelControlPanelCell staticConstraints](self, "staticConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell topAnchor](self, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 22.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    {
      -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v22);

      -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v26);

      -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
    }
    else
    {
      -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v31);

      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 1144766464;
      objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 0, v33);

      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 1132134400;
      objc_msgSend(v34, "setContentHuggingPriority:forAxis:", 0, v35);

      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v39);

      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trailingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v43);

      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell topAnchor](self, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 22.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v47);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
    -[HUWheelControlPanelCell setStaticConstraints:](self, "setStaticConstraints:", v6);

  }
  v48 = (void *)MEMORY[0x1E0CB3718];
  -[HUWheelControlPanelCell dynamicConstraints](self, "dynamicConstraints");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "deactivateConstraints:", v49);

  LODWORD(v49) = -[HUWheelControlPanelCell wheelViewVisible](self, "wheelViewVisible");
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((_DWORD)v49)
  {
    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell layoutMargins](self, "layoutMargins");
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v56);

    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v60);

    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v65);

    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "heightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "scale");
    objc_msgSend(v67, "constraintEqualToConstant:", 1.0 / v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v70);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPanelCell separatorView](self, "separatorView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v75);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v79);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v83);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUWheelControlPanelCell titleLabel](self, "titleLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -5.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v91);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
      -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
    else
      -[HUWheelControlPanelCell detailLabel](self, "detailLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, -5.0);
    v87 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v87;
  objc_msgSend(v50, "addObject:", v87);

  -[HUWheelControlPanelCell setDynamicConstraints:](self, "setDynamicConstraints:", v50);
  v93 = (void *)MEMORY[0x1E0CB3718];
  -[HUWheelControlPanelCell dynamicConstraints](self, "dynamicConstraints");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "activateConstraints:", v94);

  v95.receiver = self;
  v95.super_class = (Class)HUWheelControlPanelCell;
  -[HUControlPanelCell updateConstraints](&v95, sel_updateConstraints);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUWheelControlPanelCell;
  -[HUWheelControlPanelCell layoutSubviews](&v5, sel_layoutSubviews);
  -[HUWheelControlPanelCell separatorColor](self, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlPanelCell separatorView](self, "separatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUWheelControlPanelCell setWheelView:](self, "setWheelView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUWheelControlPanelCell;
  -[HUWheelControlPanelCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
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
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v4 = objc_opt_class();
  -[HUControlPanelCell item](self, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v8 = 0;
  }
  v39 = v8;

  v11 = objc_opt_class();
  objc_msgSend(v39, "controlItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  v18 = (void *)MEMORY[0x1E0CB3658];
  objc_msgSend(v15, "incrementalCharacteristicType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "incrementalCharacteristicType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "metadataForCharacteristicType:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v19, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "minValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(v15, "maxValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  objc_msgSend(v15, "stepValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");

  -[HUWheelControlPanelCell _generateWheelValuesWithMinValue:maxValue:stepValue:](self, "_generateWheelValuesWithMinValue:maxValue:stepValue:", v26, v29, 1.0);
  LODWORD(v20) = objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom");
  objc_msgSend(v39, "identifierForControlItem:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v20)
  {
    -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setIdentifier:", v31);

    -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setValueFormatter:", v23);
  }
  else
  {
    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setIdentifier:", v31);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setValueFormatter:", v23);

    -[HUWheelControlPanelCell wheelView](self, "wheelView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCanBeHighlighted:", 1);
  }

  -[HUControlPanelCell item](self, "item");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "latestResults");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlPanelCell setTitleText:](self, "setTitleText:", v38);

}

- (void)wheelControlView:(id)a3 didUpdateValue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "valueFormatter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForObjectValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWheelControlPanelCell setDetailText:](self, "setDetailText:", v7);
}

- (void)setMaxValue:(id)a3
{
  id *p_maxValue;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  p_maxValue = (id *)&self->_maxValue;
  v15 = a3;
  if ((objc_msgSend(*p_maxValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_maxValue, a3);
    if (!*p_maxValue || objc_msgSend(*p_maxValue, "isEqualToNumber:", &unk_1E7041F50))
    {
      -[HUWheelControlPanelCell _defaultMaxValue](self, "_defaultMaxValue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *p_maxValue;
      *p_maxValue = (id)v6;

    }
    -[HUWheelControlPanelCell minValue](self, "minValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v15, "doubleValue");
    v12 = v11;
    -[HUWheelControlPanelCell stepValue](self, "stepValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[HUWheelControlPanelCell _generateWheelValuesWithMinValue:maxValue:stepValue:](self, "_generateWheelValuesWithMinValue:maxValue:stepValue:", v10, v12, v14);

  }
}

- (void)setMinValue:(id)a3
{
  id *p_minValue;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  p_minValue = (id *)&self->_minValue;
  v15 = a3;
  if ((objc_msgSend(*p_minValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minValue, a3);
    if (!*p_minValue || objc_msgSend(*p_minValue, "isEqualToNumber:", &unk_1E7041F50))
    {
      -[HUWheelControlPanelCell _defaultMinValue](self, "_defaultMinValue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *p_minValue;
      *p_minValue = (id)v6;

    }
    objc_msgSend(v15, "doubleValue");
    v9 = v8;
    -[HUWheelControlPanelCell maxValue](self, "maxValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    -[HUWheelControlPanelCell stepValue](self, "stepValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[HUWheelControlPanelCell _generateWheelValuesWithMinValue:maxValue:stepValue:](self, "_generateWheelValuesWithMinValue:maxValue:stepValue:", v9, v12, v14);

  }
}

- (void)setStepValue:(id)a3
{
  id *p_stepValue;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;

  p_stepValue = (id *)&self->_stepValue;
  v15 = a3;
  if ((objc_msgSend(*p_stepValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stepValue, a3);
    if (!*p_stepValue || objc_msgSend(*p_stepValue, "compare:", &unk_1E7041F68) == -1)
    {
      -[HUWheelControlPanelCell _defaultStepValue](self, "_defaultStepValue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *p_stepValue;
      *p_stepValue = (id)v6;

    }
    -[HUWheelControlPanelCell minValue](self, "minValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    -[HUWheelControlPanelCell maxValue](self, "maxValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v15, "doubleValue");
    -[HUWheelControlPanelCell _generateWheelValuesWithMinValue:maxValue:stepValue:](self, "_generateWheelValuesWithMinValue:maxValue:stepValue:", v10, v13, v14);

  }
}

- (void)setValueFormatter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[HUWheelControlPanelCell _defaultValueFormatter](self, "_defaultValueFormatter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_storeStrong((id *)&self->_valueFormatter, v4);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
  else
    -[HUWheelControlPanelCell wheelView](self, "wheelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueFormatter:", v6);

}

- (void)_generateWheelValuesWithMinValue:(double)a3 maxValue:(double)a4 stepValue:(double)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v8 = llround(a4 - a3);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8 < 1)
  {
    if (a4 == a3)
      objc_msgSend(v13, "addObject:", &unk_1E7041F50);
  }
  else
  {
    v9 = 0;
    v10 = v8 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v9 + a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v11);

      ++v9;
    }
    while (v10 != v9);
  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    -[HUWheelControlPanelCell wheelButton](self, "wheelButton");
  else
    -[HUWheelControlPanelCell wheelView](self, "wheelView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValues:", v13);

}

- (id)_defaultValueFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v2, "setMaximumFractionDigits:", 0);
  return v2;
}

- (id)_defaultMaxValue
{
  return &unk_1E7041F80;
}

- (id)_defaultMinValue
{
  return &unk_1E7041F50;
}

- (id)_defaultStepValue
{
  return &unk_1E7041F68;
}

- (HUWheelControlView)wheelView
{
  return self->_wheelView;
}

- (BOOL)wheelViewVisible
{
  return self->_wheelViewVisible;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (HUWheelControlPopUpButton)wheelButton
{
  return self->_wheelButton;
}

- (void)setWheelButton:(id)a3
{
  objc_storeStrong((id *)&self->_wheelButton, a3);
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (NSArray)wheelValues
{
  return self->_wheelValues;
}

- (void)setWheelValues:(id)a3
{
  objc_storeStrong((id *)&self->_wheelValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelValues, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_wheelButton, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_wheelView, 0);
}

@end
