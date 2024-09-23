@implementation GKDashboardPickerPlayerCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (id)cellBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.08);
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)GKDashboardPickerPlayerCell;
  -[GKFocusHighlightingCollectionViewCell awakeFromNib](&v32, sel_awakeFromNib);
  -[GKDashboardPickerPlayerCell playerView](self, "playerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseDarkerPlaceholder:", 1);

  -[GKDashboardPickerPlayerCell playerView](self, "playerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarSize:", 0x10000);

  -[GKDashboardPickerPlayerCell cellBackgroundColor](self, "cellBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[GKDashboardPickerPlayerCell playerView](self, "playerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell bottomLine](self, "bottomLine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = *MEMORY[0x1E0CD2EA0];
  -[GKDashboardPickerPlayerCell subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", v11);

  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1E0DC3508];
  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  objc_msgSend(v15, "bezierPathWithOvalInRect:", 0.0, 0.0, v18);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setPath:", objc_msgSend(v20, "CGPath"));

  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSublayer:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorWithAlphaComponent:", 0.6);
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setFillColor:", objc_msgSend(v25, "CGColor"));

  objc_msgSend(v14, "setLineWidth:", 2.0);
  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCompositingFilter:", v11);

  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 1);

  GKGameCenterUIFrameworkBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAccessibilityLabel:", v30);

}

- (void)configureWithPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;

  v6 = a6;
  v7 = a4;
  v10 = a5;
  v11 = a3;
  -[GKDashboardPickerPlayerCell monogramColorView](self, "monogramColorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

  -[GKDashboardPickerPlayerCell playerView](self, "playerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlayer:", v11);

  objc_msgSend(v11, "displayNameWithOptions:", 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v22);

  -[GKDashboardPickerPlayerCell subtitleForPlayer:isCoreRecent:matchedContactName:onlyShowContactName:](self, "subtitleForPlayer:isCoreRecent:matchedContactName:onlyShowContactName:", v11, v7, v10, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardPickerPlayerCell setOriginalSubtitle:](self, "setOriginalSubtitle:", v15);
  v16 = -[GKDashboardPickerPlayerCell selectable](self, "selectable");
  v17 = v16;
  if (v16)
  {
    -[GKDashboardPickerPlayerCell originalSubtitle](self, "originalSubtitle");
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v7 = objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell subtitle](self, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  if (!v17)
  {

    v18 = (void *)v7;
  }

  v20 = objc_msgSend(v15, "length") == 0;
  -[GKDashboardPickerPlayerCell subtitle](self, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", v20);

}

- (void)setAccessibilityPrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[GKDashboardPickerPlayerCell title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.title-%@"), v12, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardPickerPlayerCell title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.subtitle-%@"), v12, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardPickerPlayerCell subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ring-%@"), v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardPickerPlayerCell ringView](self, "ringView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", v10);

  }
}

- (id)subtitleForPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v10 = a5;
  if (!v6)
  {
    if (v8)
    {
LABEL_6:
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v9, "lastPlayedGame");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_10;
    v15 = (void *)v14;
    objc_msgSend(v9, "lastPlayedGame");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPlayedGame");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_10:
      objc_msgSend(v9, "lastPlayedDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(v9, "contact");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_14;
        goto LABEL_6;
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPlayedDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_gkFormattedWhenStringWithOptions:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v22;
    objc_msgSend(v19, "stringWithFormat:", v20, v22);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  objc_msgSend(v9, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v10 && !v11)
    v12 = v10;
LABEL_14:

  return v12;
}

- (void)updateLayerMask:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC3508];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "setFrame:");
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMask:", v6);
}

- (void)setLineVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[GKDashboardPickerPlayerCell bottomLine](self, "bottomLine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)lineVisible
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bottomLine);
  v3 = objc_msgSend(WeakRetained, "isHidden") ^ 1;

  return v3;
}

- (void)setSelectable:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  self->_selectable = a3;
  v5 = !a3;
  -[GKDashboardPickerPlayerCell playerView](self, "playerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDimmed:", v5);

  if ((v5 & 1) != 0)
  {
    GKGameCenterUIFrameworkBundle();
    v5 = objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    -[GKDashboardPickerPlayerCell originalSubtitle](self, "originalSubtitle");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  if (!a3)
  {

    v8 = (id)v5;
  }

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setUsesClearBackground:(BOOL)a3
{
  self->_usesClearBackground = a3;
  -[GKDashboardPickerPlayerCell updateCellBackground](self, "updateCellBackground");
}

- (void)updateCellBackground
{
  void *v3;
  id v4;

  if (self->_usesClearBackground)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[GKDashboardPickerPlayerCell cellBackgroundColor](self, "cellBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerCell;
  -[GKDashboardPickerPlayerCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__GKDashboardPickerPlayerCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E59C5278;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, 0, 0.05);
}

void __46__GKDashboardPickerPlayerCell_setHighlighted___block_invoke(uint64_t a1)
{
  float v1;
  double v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.5;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v2 = v1;
  objc_msgSend(v3, "setOpacity:", v2);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerCell;
  -[GKDashboardPickerPlayerCell setSelected:](&v7, sel_setSelected_);
  -[GKDashboardPickerPlayerCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  -[GKDashboardPickerPlayerCell ringView](self, "ringView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", !v3);

}

- (BOOL)selectable
{
  return self->_selectable;
}

- (BOOL)usesClearBackground
{
  return self->_usesClearBackground;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, a3);
}

- (UIView)container
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (UILabel)subtitle
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitle);
}

- (void)setSubtitle:(id)a3
{
  objc_storeWeak((id *)&self->_subtitle, a3);
}

- (UILabel)title
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_title);
}

- (void)setTitle:(id)a3
{
  objc_storeWeak((id *)&self->_title, a3);
}

- (UIView)bottomLine
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_bottomLine);
}

- (void)setBottomLine:(id)a3
{
  objc_storeWeak((id *)&self->_bottomLine, a3);
}

- (UIView)monogramColorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_monogramColorView);
}

- (void)setMonogramColorView:(id)a3
{
  objc_storeWeak((id *)&self->_monogramColorView, a3);
}

- (UIView)backView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backView);
}

- (void)setBackView:(id)a3
{
  objc_storeWeak((id *)&self->_backView, a3);
}

- (UIView)ringView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ringView);
}

- (void)setRingView:(id)a3
{
  objc_storeWeak((id *)&self->_ringView, a3);
}

- (NSString)originalSubtitle
{
  return self->_originalSubtitle;
}

- (void)setOriginalSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_originalSubtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSubtitle, 0);
  objc_destroyWeak((id *)&self->_ringView);
  objc_destroyWeak((id *)&self->_backView);
  objc_destroyWeak((id *)&self->_monogramColorView);
  objc_destroyWeak((id *)&self->_bottomLine);
  objc_destroyWeak((id *)&self->_title);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
}

@end
