@implementation GKDashboardPickerPlayerGroupCell

+ (id)reuseIdentifier
{
  return CFSTR("GKDashboardPickerPlayerGroupCellIdentifier");
}

+ (id)reuseIdentifierAX
{
  return CFSTR("GKDashboardPickerPlayerGroupCellAXIdentifier");
}

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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell awakeFromNib](&v38, sel_awakeFromNib);
  -[GKDashboardPickerPlayerGroupCell cellBackgroundColor](self, "cellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell checkmark](self, "checkmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell bottomLine](self, "bottomLine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = *MEMORY[0x1E0CD2EA0];
  -[GKDashboardPickerPlayerGroupCell checkmark](self, "checkmark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", v11);

  -[GKDashboardPickerPlayerGroupCell subtitle](self, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompositingFilter:", v11);

  +[GKPlayerGroupView create](_TtC12GameCenterUI17GKPlayerGroupView, "create");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[GKDashboardPickerPlayerGroupCell iconContainer](self, "iconContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v16);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[GKDashboardPickerPlayerGroupCell iconContainer](self, "iconContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v16, v19);

    -[GKDashboardPickerPlayerGroupCell setPlayerGroupView:](self, "setPlayerGroupView:", v16);
  }
  v20 = (void *)objc_opt_new();
  v21 = (void *)MEMORY[0x1E0DC3508];
  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v23;
  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  objc_msgSend(v21, "bezierPathWithOvalInRect:", 0.0, 0.0, v24);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "setPath:", objc_msgSend(v26, "CGPath"));

  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSublayer:", v20);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colorWithAlphaComponent:", 0.6);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v31, "CGColor"));

  objc_msgSend(v20, "setLineWidth:", 2.0);
  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCompositingFilter:", v11);

  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", 1);

  GKGameCenterUIFrameworkBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAccessibilityLabel:", v36);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[GKDashboardPickerPlayerGroupCell longPressRecognizer](self, "longPressRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKDashboardPickerPlayerGroupCell longPressRecognizer](self, "longPressRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardPickerPlayerGroupCell removeGestureRecognizer:](self, "removeGestureRecognizer:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell dealloc](&v5, sel_dealloc);
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8
{
  void *v8;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;

  v58 = a3;
  v15 = a5;
  v16 = a8;
  v17 = a6;
  v18 = a4;
  -[GKDashboardPickerPlayerGroupCell title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[GKDashboardPickerPlayerGroupCell subtitle](self, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v15);

  if (objc_msgSend(v15, "length") || objc_msgSend(v58, "count") != 1)
    goto LABEL_16;
  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastPlayedGame");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v21, "lastPlayedGame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v56 = objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPlayedGame");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v29);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)v56;
LABEL_8:
      v15 = (id)v27;
LABEL_9:

      v15 = v8;
      goto LABEL_10;
    }
  }
  objc_msgSend(v21, "lastPlayedDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v33 = objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPlayedDate");
    v57 = v21;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_gkFormattedWhenStringWithOptions:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", v27, v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)v33;
    v21 = v57;
    goto LABEL_8;
  }
  if (a7 == 1
    || (objc_msgSend(v21, "contact"), v55 = (void *)objc_claimAutoreleasedReturnValue(), v55, v55))
  {
    GKGameCenterUIFrameworkBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  -[GKDashboardPickerPlayerGroupCell setOriginalSubtitle:](self, "setOriginalSubtitle:", v15);
  v36 = objc_msgSend(v16, "playerIsSelectable:", v21);
  v37 = v36;
  if (v36)
  {
    -[GKDashboardPickerPlayerGroupCell originalSubtitle](self, "originalSubtitle");
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell subtitle](self, "subtitle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setText:", v38);

  if ((v37 & 1) == 0)
  {

    v38 = v8;
  }

LABEL_16:
  -[GKDashboardPickerPlayerGroupCell messageIcon](self, "messageIcon");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHidden:", a7 != 1);

  -[GKDashboardPickerPlayerGroupCell setCanExpand:](self, "setCanExpand:", (unint64_t)objc_msgSend(v58, "count") > 1);
  v41 = -[GKDashboardPickerPlayerGroupCell canExpand](self, "canExpand") ^ 1;
  -[GKDashboardPickerPlayerGroupCell checkmark](self, "checkmark");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v41);

  -[GKDashboardPickerPlayerGroupCell playerGroupView](self, "playerGroupView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "configureWithPlayers:messagesGroupIdentifier:playerSelectionProxy:", v58, v17, v16);

  if (objc_msgSend(v58, "count") == 1)
  {
    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v16, "playerIsSelectable:", v44);

    if ((v45 & 1) == 0)
    {
      GKGameCenterUIFrameworkBundle();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardPickerPlayerGroupCell subtitle](self, "subtitle");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setText:", v47);

    }
  }
  v49 = objc_msgSend(v58, "count");
  -[GKDashboardPickerPlayerGroupCell longPressRecognizer](self, "longPressRecognizer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v49 < 2)
  {

    if (v51)
    {
      -[GKDashboardPickerPlayerGroupCell longPressRecognizer](self, "longPressRecognizer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardPickerPlayerGroupCell removeGestureRecognizer:](self, "removeGestureRecognizer:", v54);

    }
    -[GKDashboardPickerPlayerGroupCell setLongPressRecognizer:](self, "setLongPressRecognizer:", 0);
  }
  else
  {

    if (!v51)
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleLongPress_);
      -[GKDashboardPickerPlayerGroupCell setLongPressRecognizer:](self, "setLongPressRecognizer:", v52);

      -[GKDashboardPickerPlayerGroupCell longPressRecognizer](self, "longPressRecognizer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardPickerPlayerGroupCell addGestureRecognizer:](self, "addGestureRecognizer:", v53);

    }
  }
  -[GKDashboardPickerPlayerGroupCell updateTitleForSearchText](self, "updateTitleForSearchText");

}

- (void)updateTitleForSearchText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[GKDashboardPickerPlayerGroupCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[GKDashboardPickerPlayerGroupCell searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v14, "localizedStandardRangeOfString:", v4);
  v7 = v6;

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
    v9 = *MEMORY[0x1E0DC1140];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, v5);

    }
    if (v5 + v7 < (unint64_t)objc_msgSend(v14, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v11, v5 + v7, objc_msgSend(v14, "length") - (v5 + v7));

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v9, v12, v5, v7);

    -[GKDashboardPickerPlayerGroupCell title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedText:", v8);

  }
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
  -[GKDashboardPickerPlayerGroupCell bottomLine](self, "bottomLine");
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

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setUsesClearBackground:(BOOL)a3
{
  self->_usesClearBackground = a3;
  -[GKDashboardPickerPlayerGroupCell updateCellBackground](self, "updateCellBackground");
}

- (void)updateCellBackground
{
  void *v3;
  id v4;

  if (self->_usesClearBackground)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[GKDashboardPickerPlayerGroupCell cellBackgroundColor](self, "cellBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPickerPlayerGroupCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__GKDashboardPickerPlayerGroupCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E59C5278;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, 0, 0.05);
}

void __51__GKDashboardPickerPlayerGroupCell_setHighlighted___block_invoke(uint64_t a1)
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
  v7.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell setSelected:](&v7, sel_setSelected_);
  -[GKDashboardPickerPlayerGroupCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  -[GKDashboardPickerPlayerGroupCell ringView](self, "ringView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", !v3);

}

- (void)handleLongPress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 3)
  {
    -[GKDashboardPickerPlayerGroupCell groupCellDelegate](self, "groupCellDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[GKDashboardPickerPlayerGroupCell groupCellDelegate](self, "groupCellDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleLongPressGesture:", v6);

    }
  }

}

- (BOOL)usesClearBackground
{
  return self->_usesClearBackground;
}

- (GKDashboardPickerPlayerGroupCellDelegate)groupCellDelegate
{
  return (GKDashboardPickerPlayerGroupCellDelegate *)objc_loadWeakRetained((id *)&self->_groupCellDelegate);
}

- (void)setGroupCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_groupCellDelegate, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_searchText, a3);
}

- (UIView)container
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (UIView)iconContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_iconContainer);
}

- (void)setIconContainer:(id)a3
{
  objc_storeWeak((id *)&self->_iconContainer, a3);
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

- (UIImageView)checkmark
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_checkmark);
}

- (void)setCheckmark:(id)a3
{
  objc_storeWeak((id *)&self->_checkmark, a3);
}

- (UIImageView)messageIcon
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_messageIcon);
}

- (void)setMessageIcon:(id)a3
{
  objc_storeWeak((id *)&self->_messageIcon, a3);
}

- (UIView)ringView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ringView);
}

- (void)setRingView:(id)a3
{
  objc_storeWeak((id *)&self->_ringView, a3);
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (NSString)originalSubtitle
{
  return self->_originalSubtitle;
}

- (void)setOriginalSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_originalSubtitle, a3);
}

- (_TtC12GameCenterUI17GKPlayerGroupView)playerGroupView
{
  return self->_playerGroupView;
}

- (void)setPlayerGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_playerGroupView, a3);
}

- (BOOL)canExpand
{
  return self->_canExpand;
}

- (void)setCanExpand:(BOOL)a3
{
  self->_canExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerGroupView, 0);
  objc_storeStrong((id *)&self->_originalSubtitle, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_destroyWeak((id *)&self->_ringView);
  objc_destroyWeak((id *)&self->_messageIcon);
  objc_destroyWeak((id *)&self->_checkmark);
  objc_destroyWeak((id *)&self->_bottomLine);
  objc_destroyWeak((id *)&self->_title);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_iconContainer);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_destroyWeak((id *)&self->_groupCellDelegate);
}

@end
