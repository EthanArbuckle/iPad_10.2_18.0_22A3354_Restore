@implementation HUGridActionSetPlaceholderCell

- (id)iconView
{
  HUIconView *iconView;
  HUIconView *v4;
  HUIconView *v5;
  void *v6;
  void *v7;

  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
    v5 = self->_iconView;
    self->_iconView = v4;

    -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_iconView);

    -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIconView setContentMode:](self->_iconView, "setContentMode:", 1);
    -[HUGridCell contentEffect](self, "contentEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconView setVibrancyEffect:](self->_iconView, "setVibrancyEffect:", v7);

    iconView = self->_iconView;
  }
  return iconView;
}

- (unint64_t)iconDisplayStyle
{
  return 2;
}

- (void)_setupActionSetCell
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUGridActionSetPlaceholderCell;
  -[HUGridActionSetCell _setupActionSetCell](&v5, sel__setupActionSetCell);
  if (!+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects"))
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOverrideBackgroundEffect:", v3);

  }
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
  double v41;
  void *v42;
  double v43;
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
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  objc_super v68;

  -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetPlaceholderCell iconView](self, "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconInnerHorizontalMargin");
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    -[HUGridActionSetPlaceholderCell iconView](self, "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    -[HUGridActionSetPlaceholderCell iconView](self, "iconView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconSize");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    -[HUGridActionSetPlaceholderCell iconView](self, "iconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "iconSize");
    objc_msgSend(v21, "constraintEqualToConstant:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetPlaceholderCell iconView](self, "iconView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "iconInnerHorizontalMargin");
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[HUGridActionSetCell accessoryView](self, "accessoryView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "leadingAnchor");
    }
    else
    {
      -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "iconInnerHorizontalMargin");
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v43) = 1148829696;
    objc_msgSend(v42, "setPriority:", v43);
    objc_msgSend(v4, "addObject:", v42);
    -[HUGridActionSetCell accessoryView](self, "accessoryView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "centerYAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "centerYAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v49);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "trailingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "iconInnerHorizontalMargin");
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v56);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "heightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetPlaceholderCell contentView](self, "contentView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "heightAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "iconInnerHorizontalMargin");
      objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:constant:", v60, v62 * -2.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v63);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v65) = 1144750080;
      objc_msgSend(v64, "setContentHuggingPriority:forAxis:", 0, v65);

    }
    -[HUGridActionSetCell setActionSetCellConstraints:](self, "setActionSetCellConstraints:", v4);
    v66 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v67);

  }
  v68.receiver = self;
  v68.super_class = (Class)HUGridActionSetPlaceholderCell;
  -[HUGridActionSetCell updateConstraints](&v68, sel_updateConstraints);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
