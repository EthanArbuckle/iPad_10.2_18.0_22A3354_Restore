@implementation HUCCInfoMosaicGridView

- (HUCCInfoMosaicGridView)initWithFrame:(CGRect)a3
{
  HUCCInfoMosaicGridView *v3;
  HUCCInfoMosaicGridView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCCInfoMosaicGridView;
  v3 = -[HUCCInfoMosaicGridView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUCCInfoMosaicGridView _setupInfoMosaicView](v3, "_setupInfoMosaicView");
  return v4;
}

- (HUCCInfoMosaicGridView)initWithCoder:(id)a3
{
  HUCCInfoMosaicGridView *v3;
  HUCCInfoMosaicGridView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCCInfoMosaicGridView;
  v3 = -[HUCCInfoMosaicGridView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUCCInfoMosaicGridView _setupInfoMosaicView](v3, "_setupInfoMosaicView");
  return v4;
}

- (void)resetView
{
  void *v3;
  id v4;

  -[HUCCInfoMosaicGridView infoLabel](self, "infoLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E6F60E80);

  -[HUCCInfoMosaicGridView actionLabel](self, "actionLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_1E6F60E80);

}

- (void)updateUIWithInfoText:(id)a3 andActionText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HUCCInfoMosaicGridView infoLabel](self, "infoLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[HUCCInfoMosaicGridView actionLabel](self, "actionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

  -[HUCCInfoMosaicGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFrameDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrameDelegate:", v4);

}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  void *v2;
  void *v3;

  -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mosaicLayoutGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUMosaicLayoutGeometry *)v3;
}

- (void)setMosaicLayoutGeometry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMosaicLayoutGeometry:", v4);

}

- (void)_setupInfoMosaicView
{
  void *v3;
  id v4;
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
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  -[HUCCInfoMosaicGridView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCInfoMosaicGridView addSubview:](self, "addSubview:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  -[HUCCInfoMosaicGridView iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCInfoMosaicGridView infoLabel](self, "infoLabel", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  -[HUCCInfoMosaicGridView actionLabel](self, "actionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithArrangedSubviews:", v8);
  -[HUCCInfoMosaicGridView setStackView:](self, "setStackView:", v9);

  -[HUCCInfoMosaicGridView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCInfoMosaicGridView iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v11, 16.0);

  -[HUCCInfoMosaicGridView stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCInfoMosaicGridView infoLabel](self, "infoLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSpacing:afterView:", v13, 8.0);

  -[HUCCInfoMosaicGridView stackView](self, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAxis:", 1);

  -[HUCCInfoMosaicGridView stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCCInfoMosaicGridView stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCInfoMosaicGridView addSubview:](self, "addSubview:", v16);

  -[HUCCInfoMosaicGridView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_invalidateConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[HUCCInfoMosaicGridView infoMosaicConstraints](self, "infoMosaicConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUCCInfoMosaicGridView infoMosaicConstraints](self, "infoMosaicConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[HUCCInfoMosaicGridView setInfoMosaicConstraints:](self, "setInfoMosaicConstraints:", 0);
  -[HUCCInfoMosaicGridView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;

  -[HUCCInfoMosaicGridView infoMosaicConstraints](self, "infoMosaicConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView leadingAnchor](self, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView topAnchor](self, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUCCInfoMosaicGridView backgroundGridView](self, "backgroundGridView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUCCInfoMosaicGridView iconView](self, "iconView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 38.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView layoutMarginsGuide](self, "layoutMarginsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 16.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v29) = 1144750080;
    objc_msgSend(v28, "setPriority:", v29);
    objc_msgSend(v4, "addObject:", v28);
    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView layoutMarginsGuide](self, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, -16.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v35) = 1144750080;
    objc_msgSend(v34, "setPriority:", v35);
    objc_msgSend(v4, "addObject:", v34);
    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView layoutMarginsGuide](self, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 8.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v40);

    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView layoutMarginsGuide](self, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -8.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView layoutMarginsGuide](self, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v50);

    -[HUCCInfoMosaicGridView stackView](self, "stackView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "heightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCInfoMosaicGridView heightAnchor](self, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v54);

    -[HUCCInfoMosaicGridView setInfoMosaicConstraints:](self, "setInfoMosaicConstraints:", v4);
    v55 = (void *)MEMORY[0x1E0CB3718];
    -[HUCCInfoMosaicGridView infoMosaicConstraints](self, "infoMosaicConstraints");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v56);

  }
  v57.receiver = self;
  v57.super_class = (Class)HUCCInfoMosaicGridView;
  -[HUCCInfoMosaicGridView updateConstraints](&v57, sel_updateConstraints);
}

- (UILabel)infoLabel
{
  UILabel *infoLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;

  infoLabel = self->_infoLabel;
  if (!infoLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_infoLabel;
    self->_infoLabel = v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_infoLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_infoLabel, "setFont:", v8);

    -[UILabel setTextAlignment:](self->_infoLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 3);
    infoLabel = self->_infoLabel;
  }
  return infoLabel;
}

- (UILabel)actionLabel
{
  UILabel *actionLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;

  actionLabel = self->_actionLabel;
  if (!actionLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_actionLabel;
    self->_actionLabel = v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_actionLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_actionLabel, "setFont:", v8);

    -[UILabel setTextAlignment:](self->_actionLabel, "setTextAlignment:", 1);
    actionLabel = self->_actionLabel;
  }
  return actionLabel;
}

- (UIImageView)iconView
{
  UIImageView *iconView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v5 = self->_iconView;
    self->_iconView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_iconView, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 38.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithConfiguration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_iconView, "setImage:", v10);

    iconView = self->_iconView;
  }
  return iconView;
}

- (HUCCFakeMosaicGridView)backgroundGridView
{
  HUCCFakeMosaicGridView *backgroundGridView;
  HUCCFakeMosaicGridView *v4;
  HUCCFakeMosaicGridView *v5;
  HUCCFakeMosaicGridView *v6;

  backgroundGridView = self->_backgroundGridView;
  if (!backgroundGridView)
  {
    v4 = [HUCCFakeMosaicGridView alloc];
    v5 = -[HUCCFakeMosaicGridView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_backgroundGridView;
    self->_backgroundGridView = v5;

    -[HUCCFakeMosaicGridView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundGridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    backgroundGridView = self->_backgroundGridView;
  }
  return backgroundGridView;
}

- (HUProvidesMosaicFrames)frameDelegate
{
  return (HUProvidesMosaicFrames *)objc_loadWeakRetained((id *)&self->_frameDelegate);
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (void)setActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_actionLabel, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void)setBackgroundGridView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGridView, a3);
}

- (NSArray)infoMosaicConstraints
{
  return self->_infoMosaicConstraints;
}

- (void)setInfoMosaicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_infoMosaicConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoMosaicConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundGridView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_destroyWeak((id *)&self->_frameDelegate);
}

@end
