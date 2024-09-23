@implementation HUGridServicePlaceholderCell

- (unint64_t)iconDisplayStyle
{
  return 2;
}

- (void)displayStyleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridServicePlaceholderCell;
  -[HUGridServiceCell displayStyleDidChange](&v3, sel_displayStyleDidChange);
  -[HUGridServicePlaceholderCell _updateSecondaryContentDisplayStyle](self, "_updateSecondaryContentDisplayStyle");
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUGridServicePlaceholderCell;
  -[HUGridServiceCell updateUIWithAnimation:](&v5, sel_updateUIWithAnimation_);
  -[HUGridServiceCell _updateIconAnimated:](self, "_updateIconAnimated:", v3);
  -[HUGridServiceCell _updateText](self, "_updateText");
  -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
  -[HUGridServicePlaceholderCell setNeedsLayout](self, "setNeedsLayout");
  -[HUGridServiceCell setHasUpdatedUISinceLastReuse:](self, "setHasUpdatedUISinceLastReuse:", 1);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22.receiver = self;
  v22.super_class = (Class)HUGridServicePlaceholderCell;
  -[HUGridServiceCell layoutSubviews](&v22, sel_layoutSubviews);
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellInnerMargin");
  v5 = v4;

  v6 = -[HUGridServicePlaceholderCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[HUGridServicePlaceholderCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconSize");
  v10 = v9;
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconSize");
  objc_msgSend(v7, "sizeThatFits:", v10, v12);
  v14 = v13;
  v16 = v15;

  -[HUGridServicePlaceholderCell contentView](self, "contentView");
  if (v6 == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v18 = CGRectGetMaxX(v23) - v5 - v14;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v18 = v5 + CGRectGetMinX(v24);
  }
  -[HUGridServicePlaceholderCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = v5 + CGRectGetMinY(v25);
  -[HUGridServicePlaceholderCell iconView](self, "iconView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v18, v20, v14, v16);

}

- (void)_setupServiceCell
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUGridServicePlaceholderCell;
  -[HUGridServiceCell _setupServiceCell](&v5, sel__setupServiceCell);
  if (!+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects"))
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOverrideBackgroundEffect:", v3);

  }
}

- (id)_textConfiguration
{
  HUGridServiceCellTextConfiguration *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(HUGridServiceCellTextConfiguration);
  v3 = objc_alloc(MEMORY[0x1E0D317E8]);
  +[HUAddAccessoryUtilities addAccessoryString](HUAddAccessoryUtilities, "addAccessoryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRawServiceName:rawRoomName:", v4, 0);
  -[HUGridServiceCellTextConfiguration setNameComponents:](v2, "setNameComponents:", v5);

  return v2;
}

- (void)_updateSecondaryContentDisplayStyle
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[HUGridServicePlaceholderCell iconDisplayStyle](self, "iconDisplayStyle") == 2;
  -[HUGridServicePlaceholderCell serviceTextView](self, "serviceTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColorFollowsTintColor:", v3);

  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v6 = v5;
  -[HUGridServicePlaceholderCell serviceTextView](self, "serviceTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDescriptionTextColorDimmingFactor:", v6);

  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v9 = v8;
  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "innerContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  -[HUGridCell secondaryContentEffect](self, "secondaryContentEffect");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEffect:", v13);

}

- (id)serviceTextView
{
  return self->_serviceTextView;
}

- (void)setServiceTextView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTextView, a3);
}

- (id)descriptionLabelEffectView
{
  return self->_descriptionLabelEffectView;
}

- (void)setDescriptionLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, a3);
}

- (id)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  self->_shouldShowRoomName = a3;
}

- (id)coloredDescriptionLabel
{
  return self->_coloredDescriptionLabel;
}

- (void)setColoredDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, a3);
}

- (BOOL)showingUpdatingState
{
  return self->_showingUpdatingState;
}

- (void)setShowingUpdatingState:(BOOL)a3
{
  self->_showingUpdatingState = a3;
}

- (id)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, 0);
  objc_storeStrong((id *)&self->_serviceTextView, 0);
}

@end
