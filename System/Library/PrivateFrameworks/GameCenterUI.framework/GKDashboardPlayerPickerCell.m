@implementation GKDashboardPlayerPickerCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___GKDashboardPlayerPickerCell;
  objc_msgSendSuper2(&v4, sel_defaultSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)awakeFromNib
{
  id WeakRetained;
  double v4;
  id v5;
  double v6;
  id v7;
  double v8;
  id v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKDashboardPlayerPickerCell;
  -[GKDashboardPlayerCell awakeFromNib](&v11, sel_awakeFromNib);
  -[GKDashboardPlayerPickerCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_nameConstraint);
  objc_msgSend(WeakRetained, "constant");
  self->_nameInitialConstant = v4;

  v5 = objc_loadWeakRetained((id *)&self->_selectionHorizontalConstraint);
  objc_msgSend(v5, "constant");
  self->_selectionInitialHorizontalConstant = v6;

  v7 = objc_loadWeakRetained((id *)&self->_selectionVerticalConstraint);
  objc_msgSend(v7, "constant");
  self->_selectionInitialVerticalConstant = v8;

  v9 = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  objc_msgSend(v9, "constant");
  self->_statusInitialConstant = v10;

}

- (void)setPlayer:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPlayerPickerCell;
  -[GKDashboardPlayerCell setPlayer:](&v5, sel_setPlayer_, a3);
  -[GKDashboardPlayerPickerCell setStatusText:](self, "setStatusText:", &stru_1E59EB978);
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  objc_msgSend(WeakRetained, "setConstant:", 0.0);

}

- (void)setStatusWithAchievementEarnedPoints:(int64_t)a3 andDate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double statusInitialConstant;
  id WeakRetained;
  id v13;

  objc_msgSend(a4, "_gkFormattedWhenStringWithOptions:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKFormattedStringWithGroupingFromInteger();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardPlayerPickerCell setStatusText:](self, "setStatusText:", v10);
  statusInitialConstant = self->_statusInitialConstant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  objc_msgSend(WeakRetained, "setConstant:", statusInitialConstant);

}

- (void)setSelectable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_selectable = a3;
  -[GKDashboardPlayerPickerCell selectionButton](self, "selectionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  if (v3)
    v6 = 1.0;
  else
    v6 = 0.3;
  -[GKDashboardPlayerPickerCell selectionView](self, "selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  -[GKDashboardPlayerPickerCell selectionButton](self, "selectionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

  -[GKDashboardPlayerCell nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v6);

  -[GKDashboardPlayerCell statusLabel](self, "statusLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v6);

}

- (void)setStatusText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardPlayerPickerCell;
  -[GKDashboardPlayerCell setStatusText:](&v3, sel_setStatusText_, a3);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardPlayerPickerCell;
  -[GKDashboardPlayerCell setSelected:](&v11, sel_setSelected_);
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "playerPickerSelectedImage");
  else
    objc_msgSend(v5, "playerPickerUnselectedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionView);
  objc_msgSend(WeakRetained, "setImage:", v7);

  v9 = objc_loadWeakRetained((id *)&self->_selectionButton);
  objc_msgSend(v9, "setSelected:", v3);

  -[GKDashboardPlayerPickerCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", 0);

}

- (void)setShowsPlayerSubtitle:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double statusInitialConstant;
  id WeakRetained;
  id v12;

  v3 = a3;
  self->_showsPlayerSubtitle = a3;
  v5 = !a3;
  -[GKDashboardPlayerCell statusLabel](self, "statusLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[GKDashboardPlayerCell player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_gkCompositeName");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[GKDashboardPlayerPickerCell setStatusText:](self, "setStatusText:", v12);
  statusInitialConstant = 0.0;
  if (v3)
    statusInitialConstant = self->_statusInitialConstant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  objc_msgSend(WeakRetained, "setConstant:", statusInitialConstant);

}

- (void)setShowsMessagesHandleInStatusText:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  double statusInitialConstant;
  id WeakRetained;
  id v10;

  self->_showsMessagesHandleInStatusText = a3;
  v4 = !a3;
  -[GKDashboardPlayerCell statusLabel](self, "statusLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  -[GKDashboardPlayerCell player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagesID");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[GKDashboardPlayerPickerCell setStatusText:](self, "setStatusText:", v10);
  if (self->_showsMessagesHandleInStatusText)
    statusInitialConstant = self->_statusInitialConstant;
  else
    statusInitialConstant = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  objc_msgSend(WeakRetained, "setConstant:", statusInitialConstant);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[GKDashboardPlayerPickerCell selectionButton](self, "selectionButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "isSelected");
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "playerPickerSelectedImage");
  else
    objc_msgSend(v4, "playerPickerUnselectedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerPickerCell selectionView](self, "selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)showsPlayerSubtitle
{
  return self->_showsPlayerSubtitle;
}

- (BOOL)showsMessagesHandleInStatusText
{
  return self->_showsMessagesHandleInStatusText;
}

- (UIImageView)selectionView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_selectionView);
}

- (void)setSelectionView:(id)a3
{
  objc_storeWeak((id *)&self->_selectionView, a3);
}

- (UIView)ringView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ringView);
}

- (void)setRingView:(id)a3
{
  objc_storeWeak((id *)&self->_ringView, a3);
}

- (UIButton)selectionButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_selectionButton);
}

- (void)setSelectionButton:(id)a3
{
  objc_storeWeak((id *)&self->_selectionButton, a3);
}

- (NSLayoutConstraint)nameConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_nameConstraint);
}

- (void)setNameConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_nameConstraint, a3);
}

- (NSLayoutConstraint)selectionHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_selectionHorizontalConstraint);
}

- (void)setSelectionHorizontalConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_selectionHorizontalConstraint, a3);
}

- (NSLayoutConstraint)selectionVerticalConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_selectionVerticalConstraint);
}

- (void)setSelectionVerticalConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_selectionVerticalConstraint, a3);
}

- (NSLayoutConstraint)statusHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
}

- (void)setStatusHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_statusHeightConstraint, a3);
}

- (double)nameInitialConstant
{
  return self->_nameInitialConstant;
}

- (void)setNameInitialConstant:(double)a3
{
  self->_nameInitialConstant = a3;
}

- (double)selectionInitialHorizontalConstant
{
  return self->_selectionInitialHorizontalConstant;
}

- (void)setSelectionInitialHorizontalConstant:(double)a3
{
  self->_selectionInitialHorizontalConstant = a3;
}

- (double)selectionInitialVerticalConstant
{
  return self->_selectionInitialVerticalConstant;
}

- (void)setSelectionInitialVerticalConstant:(double)a3
{
  self->_selectionInitialVerticalConstant = a3;
}

- (double)statusInitialConstant
{
  return self->_statusInitialConstant;
}

- (void)setStatusInitialConstant:(double)a3
{
  self->_statusInitialConstant = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusHeightConstraint);
  objc_destroyWeak((id *)&self->_selectionVerticalConstraint);
  objc_destroyWeak((id *)&self->_selectionHorizontalConstraint);
  objc_destroyWeak((id *)&self->_nameConstraint);
  objc_destroyWeak((id *)&self->_selectionButton);
  objc_destroyWeak((id *)&self->_ringView);
  objc_destroyWeak((id *)&self->_selectionView);
}

@end
