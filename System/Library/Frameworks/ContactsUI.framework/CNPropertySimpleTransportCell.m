@implementation CNPropertySimpleTransportCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNPropertySimpleTransportCell layoutSubviews](&v11, sel_layoutSubviews);
  if (-[CNPropertySimpleTransportCell needsUpdateTouchAreas](self, "needsUpdateTouchAreas"))
  {
    -[CNPropertySimpleTransportCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    -[CNPropertySimpleTransportCell setNeedsUpdateTouchAreas:](self, "setNeedsUpdateTouchAreas:", 0);
  }
}

- (BOOL)needsUpdateTouchAreas
{
  return self->_needsUpdateTouchAreas;
}

- (void)setActionsColor:(id)a3
{
  void *v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_actionsColor != v7)
  {
    objc_storeStrong((id *)&self->_actionsColor, a3);
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlyphColor:", v7);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGlyphColor:", v7);

  }
}

- (void)setShouldShowTransportButtons:(BOOL)a3
{
  self->_shouldShowTransportButtons = a3;
}

- (void)setAllowsActions:(BOOL)a3
{
  self->_allowsActions = a3;
  -[CNPropertySimpleTransportCell updateTransportButtons](self, "updateTransportButtons");
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("allowsIMessage"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("allowsPhone"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("allowsEmail"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("allowsTTY"));
  }
  v7.receiver = self;
  v7.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNPropertyCell setCardGroupItem:](&v7, sel_setCardGroupItem_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("allowsIMessage"), 0, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("allowsPhone"), 0, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("allowsEmail"), 0, 0);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("allowsTTY"), 0, 0);

  -[CNPropertySimpleTransportCell updateLabelNeedingHuggingContent](self, "updateLabelNeedingHuggingContent");
}

- (void)updateLabelNeedingHuggingContent
{
  _BOOL8 v3;

  v3 = -[CNPropertySimpleTransportCell shouldShowBadge](self, "shouldShowBadge")
    || -[CNPropertySimpleTransportCell shouldShowStar](self, "shouldShowStar");
  -[CNLabeledCell setLabelViewNeedsHuggingContent:](self, "setLabelViewNeedsHuggingContent:", v3);
}

- (BOOL)shouldShowBadge
{
  return self->_shouldShowBadge;
}

- (void)updateStarIcon
{
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *starView;
  void *v7;

  if (-[CNPropertySimpleTransportCell shouldShowStar](self, "shouldShowStar"))
  {
    -[UIImageView superview](self->_starView, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (self->_starView
        || (objc_msgSend((id)objc_opt_class(), "standardStarView"),
            v5 = (UIImageView *)objc_claimAutoreleasedReturnValue(),
            starView = self->_starView,
            self->_starView = v5,
            starView,
            self->_starView))
      {
        -[CNPropertySimpleTransportCell contentView](self, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", self->_starView);

      }
      goto LABEL_10;
    }
  }
  if (!-[CNPropertySimpleTransportCell shouldShowStar](self, "shouldShowStar"))
  {
    -[UIImageView superview](self->_starView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIImageView removeFromSuperview](self->_starView, "removeFromSuperview");
LABEL_10:
      -[CNPropertySimpleTransportCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
}

- (BOOL)shouldShowStar
{
  void *v2;
  char v3;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFavorite");

  return v3;
}

- (void)updateWithPropertyItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNPropertyCell updateWithPropertyItem:](&v4, sel_updateWithPropertyItem_, a3);
  -[CNPropertySimpleTransportCell updateTransportButtons](self, "updateTransportButtons");
  -[CNPropertySimpleTransportCell updateStarIcon](self, "updateStarIcon");
}

- (id)rightMostView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNPropertySimpleTransportCell;
    -[CNLabeledCell rightMostView](&v7, sel_rightMostView);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *starView;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  UIImageView *v24;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  objc_super v67;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v67.receiver = self;
  v67.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNLabeledCell variableConstraints](&v67, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView superview](self->_starView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3718];
    starView = self->_starView;
    -[CNPropertySimpleCell labelLabel](self, "labelLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", starView, 5, 0, v9, 6, 1.0, 3.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    v12 = self->_starView;
    -[CNPropertySimpleCell labelLabel](self, "labelLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 11, 0, v13, 11, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleCell labelLabel](self, "labelLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleCell valueLabel](self, "valueLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bounds](self->_starView, "bounds");
    objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 6, -1, v17, 6, 1.0, -(v18 + 3.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[UIImageView superview](self->_starView, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = self->_starView;
    }
    else
    {
      -[CNPropertySimpleCell labelLabel](self, "labelLabel");
      v23 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 5, 0, v24, 6, 1.0, 3.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v27);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleCell labelLabel](self, "labelLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 11, 0, v30, 11, 1.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);

  }
  -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "superview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleTransportCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 10, 0, v36, 10, 1.0, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v37);

    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleTransportCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, -16.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v42);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "superview");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = (void *)MEMORY[0x1E0CB3718];
    if (v44)
    {
      -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleTransportCell contentView](self, "contentView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 10, 0, v47, 10, 1.0, 0.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v48);

      v49 = (void *)MEMORY[0x1E0CB3718];
      -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 6, 0, v51, 5, 1.0, -16.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v52);

      -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "superview");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = (void *)MEMORY[0x1E0CB3718];
      if (v54)
      {
        -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPropertySimpleTransportCell contentView](self, "contentView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 10, 0, v56, 10, 1.0, 0.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v57);

        v58 = (void *)MEMORY[0x1E0CB3718];
        -[CNPropertySimpleCell valueView](self, "valueView");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 6, 0, v60, 5, 1.0, -16.0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v61);

        v45 = (void *)MEMORY[0x1E0CB3718];
        -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
      }
      else
      {
        -[CNPropertySimpleCell valueView](self, "valueView");
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNPropertySimpleCell valueView](self, "valueView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v64 = (void *)v63;
    objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 6, 0, v63, 5, 1.0, -16.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v65);

  }
  return v5;
}

- (CNTransportButton)transportIcon1
{
  CNTransportButton *transportIcon1;
  CNTransportButton *v4;
  CNTransportButton *v5;

  transportIcon1 = self->_transportIcon1;
  if (!transportIcon1)
  {
    -[CNPropertySimpleTransportCell standardTransportIcon](self, "standardTransportIcon");
    v4 = (CNTransportButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transportIcon1;
    self->_transportIcon1 = v4;

    transportIcon1 = self->_transportIcon1;
  }
  return transportIcon1;
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (CNTransportButton)standardTransportIcon
{
  void *v3;

  +[CNTransportButton transportButton](CNTransportButton, "transportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setTransportType:", 0);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_transportButtonClicked_, 64);
  return (CNTransportButton *)v3;
}

- (CNTransportButton)transportIcon2
{
  CNTransportButton *transportIcon2;
  CNTransportButton *v4;
  CNTransportButton *v5;

  transportIcon2 = self->_transportIcon2;
  if (!transportIcon2)
  {
    -[CNPropertySimpleTransportCell standardTransportIcon](self, "standardTransportIcon");
    v4 = (CNTransportButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transportIcon2;
    self->_transportIcon2 = v4;

    transportIcon2 = self->_transportIcon2;
  }
  return transportIcon2;
}

- (void)updateTransportButtons
{
  void (**v3)(void *, void *);
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (-[CNPropertySimpleTransportCell shouldShowTransportButtons](self, "shouldShowTransportButtons"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__CNPropertySimpleTransportCell_updateTransportButtons__block_invoke;
    v7[3] = &unk_1E204D120;
    v7[4] = self;
    v7[5] = &v8;
    v3 = (void (**)(void *, void *))_Block_copy(v7);
    -[CNPropertySimpleTransportCell transportIcon1](self, "transportIcon1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v4);

    -[CNPropertySimpleTransportCell transportIcon2](self, "transportIcon2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v5);

    -[CNPropertySimpleTransportCell transportIcon3](self, "transportIcon3");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v6);

    if (*((_BYTE *)v9 + 24))
    {
      -[CNPropertySimpleTransportCell setNeedsUpdateTouchAreas:](self, "setNeedsUpdateTouchAreas:", 1);
      -[CNPropertySimpleTransportCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }

    _Block_object_dispose(&v8, 8);
  }
}

- (BOOL)shouldShowTransportButtons
{
  return self->_shouldShowTransportButtons;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (CNTransportButton)transportIcon3
{
  CNTransportButton *transportIcon3;
  CNTransportButton *v4;
  CNTransportButton *v5;

  transportIcon3 = self->_transportIcon3;
  if (!transportIcon3)
  {
    -[CNPropertySimpleTransportCell standardTransportIcon](self, "standardTransportIcon");
    v4 = (CNTransportButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transportIcon3;
    self->_transportIcon3 = v4;

    transportIcon3 = self->_transportIcon3;
  }
  return transportIcon3;
}

- (CNPropertySimpleTransportCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertySimpleTransportCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertySimpleTransportCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v4->_shouldShowTransportButtons = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[CNPropertySimpleTransportCell setShouldShowBadge:](self, "setShouldShowBadge:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNContactCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setShouldShowBadge:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_shouldShowBadge != a3)
  {
    v3 = a3;
    self->_shouldShowBadge = a3;
    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6 || v3)
    {
      objc_msgSend(v7, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 || !v3)
        goto LABEL_11;
      -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[CNPropertySimpleTransportCell standardBadgeView](self, "standardBadgeView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPropertySimpleTransportCell setBadgeView:](self, "setBadgeView:", v11);

        -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      }
      -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleTransportCell addSubview:](self, "addSubview:", v13);

    }
    else
    {
      objc_msgSend(v7, "removeFromSuperview");

      -[CNPropertySimpleTransportCell setBadgeView:](self, "setBadgeView:", 0);
    }
    -[CNPropertySimpleTransportCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_11:
    -[CNPropertySimpleTransportCell updateLabelNeedingHuggingContent](self, "updateLabelNeedingHuggingContent");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleTransportCell;
  -[CNContactCell dealloc](&v4, sel_dealloc);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_starView)
    objc_msgSend((id)objc_opt_class(), "_updateStarImageForView:", self->_starView);
  if (self->_shouldShowBadge)
  {
    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[CNPropertySimpleTransportCell standardBadgeView](self, "standardBadgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleTransportCell setBadgeView:](self, "setBadgeView:", v5);

    -[CNPropertySimpleTransportCell badgeView](self, "badgeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleTransportCell addSubview:](self, "addSubview:", v6);

  }
  -[CNPropertySimpleTransportCell updateLabelNeedingHuggingContent](self, "updateLabelNeedingHuggingContent");

}

- (UIView)standardBadgeView
{
  void *v2;
  void *v3;
  void *v4;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENT_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNLabeledBadge labeledBadgeWithText:](CNLabeledBadge, "labeledBadgeWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("allowsIMessage")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("allowsPhone")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("allowsEmail")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("allowsTTY")))
  {
    -[CNPropertySimpleTransportCell updateTransportButtons](self, "updateTransportButtons");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNPropertySimpleTransportCell;
    -[CNPropertySimpleTransportCell observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)shouldPerformDefaultAction
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertySimpleTransportCell;
  v3 = -[CNContactCell shouldPerformDefaultAction](&v5, sel_shouldPerformDefaultAction);
  if (v3)
    LOBYTE(v3) = -[CNPropertySimpleTransportCell allowsActions](self, "allowsActions");
  return v3;
}

- (void)transportButtonClicked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[CNPropertyCell delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "transportType");

  objc_msgSend(v7, "propertyCell:performActionForItem:withTransportType:", self, v5, v6);
}

- (UIImageView)standardStarView
{
  return self->_standardStarView;
}

- (UIColor)actionsColor
{
  return self->_actionsColor;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (void)setNeedsUpdateTouchAreas:(BOOL)a3
{
  self->_needsUpdateTouchAreas = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_actionsColor, 0);
  objc_storeStrong((id *)&self->_standardStarView, 0);
  objc_storeStrong((id *)&self->_starView, 0);
  objc_storeStrong((id *)&self->_transportIcon3, 0);
  objc_storeStrong((id *)&self->_transportIcon2, 0);
  objc_storeStrong((id *)&self->_transportIcon1, 0);
}

void __55__CNPropertySimpleTransportCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "transportType"))
  {
    objc_msgSend(v6, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v6);

      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v6, "transportType"))
  {
    objc_msgSend(v6, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v6, "removeFromSuperview");
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

+ (void)_updateStarImageForView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  +[CNUIColorRepository contactCardStarImageColor](CNUIColorRepository, "contactCardStarImageColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("star.fill"), 1, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setImage:", v6);
}

+ (id)standardStarView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
  objc_msgSend(a1, "_updateStarImageForView:", v3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  return v3;
}

@end
