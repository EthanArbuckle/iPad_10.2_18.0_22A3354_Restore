@implementation CPUITableCell

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 56.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[CPUITableCell playbackProgress](self, "playbackProgress", a3.width, a3.height);
  if (v5 > 0.0)
  {
    -[CPUITableCell playbackProgress](self, "playbackProgress");
    if (v6 < 1.0)
      goto LABEL_4;
  }
  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
LABEL_4:
    objc_msgSend((id)objc_opt_class(), "rowHeight");
  else
    objc_msgSend((id)objc_opt_class(), "minimumHeight");
  v11 = v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)_updateTintColors
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CPUITableCell;
  -[_CPUIBaseTableCell _updateTintColors](&v19, sel__updateTintColors);
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CPUITableCell accessoryView](self, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPUITableCell isHighlighted](self, "isHighlighted"))
      v8 = v4;
    else
      v8 = v3;
    objc_msgSend(v7, "setTintColor:", v8);
  }
  else
  {
    v9 = 1056;
    if (self->_accessory)
    {
      v10 = objc_alloc(MEMORY[0x24BDF6AE8]);
    }
    else
    {
      if (!*(&self->super._itemEnabled + 4))
        goto LABEL_18;
      v10 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v9 = 1064;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v9), "imageWithTintColor:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v9), "imageWithTintColor:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithImage:highlightedImage:", v7, v11);
    -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", v12);

  }
LABEL_18:
  -[CPUITableCell playbackProgressView](self, "playbackProgressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
    else
      +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
    else
      +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPUITableCell isHighlighted](self, "isHighlighted"))
      v18 = v16;
    else
      v18 = v15;
    objc_msgSend(v17, "setTintColor:", v18);

  }
}

- (void)configureCell
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPUITableCell;
  -[_CPUIBaseTableCell configureCell](&v17, sel_configureCell);
  *(int64x2_t *)&self->_activityIndicatorView = vdupq_n_s64(0x4044000000000000uLL);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightedTextColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHighlightedTextColor:", v13);

  -[CPUITableCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CPListItem"));
  -[CPUITableCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("CPListItemTitle"));

  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("CPListItemSubtitle"));

}

- (void)applyConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  CPUITableCell *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
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
  _QWORD v55[3];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", objc_msgSend(v4, "enabled"));
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CPUITableCell setContainer:](self, "setContainer:", 0);
    -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", 0);
    v7 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v5, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIImageByScalingImageToSize(v8, *(double *)&self->_activityIndicatorView, self->_artworkSize.width);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithImage:", v9);
    -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", v10);

    goto LABEL_15;
  }
  +[CPUITableCellAccessory accessoryWithCloudIcon](CPUITableCellAccessory, "accessoryWithCloudIcon");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v11)
  {

    goto LABEL_10;
  }
  v12 = (void *)v11;
  +[CPUITableCellAccessory accessoryWithiCloudIcon](CPUITableCellAccessory, "accessoryWithiCloudIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v13)
  {
LABEL_10:
    -[CPUITableCell setContainer:](self, "setContainer:", 0);
    -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", v5);
    goto LABEL_15;
  }
  +[CPUITableCellAccessory accessoryWithDisclosureIndicator](CPUITableCellAccessory, "accessoryWithDisclosureIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v14)
  {
    -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", 0);
    v18 = self;
    v19 = 1;
    goto LABEL_12;
  }
  +[CPUITableCellAccessory accessoryWithActivityIndicator](CPUITableCellAccessory, "accessoryWithActivityIndicator");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v15)
  {

  }
  else
  {
    v16 = (void *)v15;
    v17 = objc_msgSend(v4, "showActivityIndicator");

    if ((v17 & 1) == 0)
    {
      -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", 0);
      v18 = self;
      v19 = 0;
LABEL_12:
      -[CPUITableCell setContainer:](v18, "setContainer:", v19);
      goto LABEL_15;
    }
  }
  -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", 0);
  -[CPUITableCell setContainer:](self, "setContainer:", 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 21);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v21);

  -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", v20);
  objc_msgSend(v20, "startAnimating");

LABEL_15:
  objc_msgSend(v4, "playbackProgress");
  if (v22 <= 0.0)
  {
    -[CPUITableCell setShouldShowPlaybackProgress:](self, "setShouldShowPlaybackProgress:", 0);
  }
  else
  {
    -[CPUITableCell setShouldShowPlaybackProgress:](self, "setShouldShowPlaybackProgress:", 1);
    objc_msgSend(v4, "playbackProgress");
    -[CPUITableCell setPlaybackProgress:](self, "setPlaybackProgress:");
  }
  -[CPUITableCell setPlaybackState:](self, "setPlaybackState:", objc_msgSend(v4, "playbackState"));
  if (objc_msgSend(v4, "currentlyPlaying"))
  {
    -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = objc_alloc(MEMORY[0x24BE63538]);
      v25 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v26 = *(void **)&self->_showExplicit;
      *(_QWORD *)&self->_showExplicit = v25;

      objc_msgSend(*(id *)&self->_showExplicit, "setNumberOfLevels:", 4);
      if ((-[CPUITableCell isHighlighted](self, "isHighlighted") & 1) != 0
        || (-[CPUITableCell isFocused](self, "isFocused") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v28 = (void *)v27;
      objc_msgSend(*(id *)&self->_showExplicit, "setLevelGuttersColor:", v27);

      -[CPUITableCell traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "displayScale");
      v31 = v30;

      v32 = 1.0 / v31 + 1.0;
      if (v31 < 1.0)
        v32 = 2.0;
      objc_msgSend(*(id *)&self->_showExplicit, "setInterLevelSpacing:", v32);
      -[CPUITableCell traitCollection](self, "traitCollection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "displayScale");
      v35 = v34;

      v36 = 1.0 / v35;
      if (v35 < 1.0)
        v36 = 1.0;
      objc_msgSend(*(id *)&self->_showExplicit, "setLevelCornerRadius:", v36);
      objc_msgSend(*(id *)&self->_showExplicit, "setMinimumFrameInterval:", 0.0666666667);
    }
  }
  -[CPUITableCell setPlayingIndicatorLeadingSide:](self, "setPlayingIndicatorLeadingSide:", objc_msgSend(v4, "playingIndicatorLeadingSide"));
  -[CPUITableCell setShowsExplicit:](self, "setShowsExplicit:", objc_msgSend(v4, "showExplicit"));
  objc_msgSend(v4, "text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell textLabel](self, "textLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setText:", v37);

  objc_msgSend(v4, "detailText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell detailTextLabel](self, "detailTextLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v39);

  objc_msgSend(v4, "image");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell setArtwork:](self, "setArtwork:", v41);

  -[CPUITableCell textLabel](self, "textLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "text");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[CPUITableCell detailTextLabel](self, "detailTextLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[CPUITableCell textLabel](self, "textLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "text");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v48;
      -[CPUITableCell detailTextLabel](self, "detailTextLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "text");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v50;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITableCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v51);

      goto LABEL_35;
    }
  }
  else
  {

  }
  -[CPUITableCell textLabel](self, "textLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "text");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
  {
    -[CPUITableCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", MEMORY[0x24BDBD1A8]);
    goto LABEL_37;
  }
  -[CPUITableCell textLabel](self, "textLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "text");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v49);
LABEL_35:

LABEL_37:
  -[CPUITableCell _updateTintColors](self, "_updateTintColors");
  -[CPUITableCell updatePlaybackProgress](self, "updatePlaybackProgress");
  -[CPUITableCell updateArtwork](self, "updateArtwork");
  -[CPUITableCell setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)currentlyPlaying
{
  return (unint64_t)&self->_artwork[-1].super.isa + 7 < 2;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPUITableCell;
  -[CPUITableCell setHighlighted:animated:](&v12, sel_setHighlighted_animated_, a3, a4);
  -[CPUITableCell playbackProgressView](self, "playbackProgressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlighted:", v4);

  }
  -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v4)
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLevelGuttersColor:", v10);

  }
  -[CPUITableCell _updateTintColors](self, "_updateTintColors");
  -[CPUITableCell updateArtwork](self, "updateArtwork");
}

- (void)setContainer:(BOOL)a3
{
  int v4;
  void *v5;
  UIImage *v6;
  UIImage *cloudImage;
  id v8;

  v4 = *((unsigned __int8 *)&self->super._itemEnabled + 4);
  if (v4 != a3)
  {
    *(&self->super._itemEnabled + 4) = a3;
    v4 = a3;
  }
  if (v4)
  {
    -[CPUITableCell traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    CPUIChevronRightGlyph();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    cloudImage = self->_cloudImage;
    self->_cloudImage = v6;

  }
  else
  {
    -[CPUITableCell setAccessoryType:](self, "setAccessoryType:", 0);
    -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", 0);
  }
}

- (void)setShowsExplicit:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  *(&self->super._itemEnabled + 1) = a3;
  -[CPUITableCell explicitItemView](self, "explicitItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      -[CPUITableCell traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CPUILocalizedExplicitImageForTraitCollection(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x24BDF6AE8]);
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_flatImageWithColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_flatImageWithColor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithImage:highlightedImage:", v11, v13);
      -[CPUITableCell setExplicitItemView:](self, "setExplicitItemView:", v14);

    }
    -[CPUITableCell contentView](self, "contentView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell explicitItemView](self, "explicitItemView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[CPUITableCell setExplicitItemView:](self, "setExplicitItemView:", 0);
  }
}

- (void)_setCloudAccessory:(id)a3
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  CPUITableCellAccessory *v10;
  CPUITableCellAccessory *accessory;
  CPUITableCellAccessory *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_nowPlayingIndicator, a3);
  if (v13)
  {
    +[CPUITableCellAccessory accessoryWithiCloudIcon](CPUITableCellAccessory, "accessoryWithiCloudIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("cloud");
    if (v5 == v13)
      v6 = CFSTR("icloud");
    v7 = v6;

    -[CPUITableCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CPUIGlyphFactoryWithTraitCollection(v7, 4, v8, 22.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = (CPUITableCellAccessory *)objc_claimAutoreleasedReturnValue();
    accessory = self->_accessory;
    self->_accessory = v10;

  }
  else
  {
    v12 = self->_accessory;
    self->_accessory = 0;

    -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", 0);
  }

}

- (void)setShowActivityIndicator:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (*(&self->super._itemEnabled + 2) != a3)
  {
    *(&self->super._itemEnabled + 2) = a3;
    if (a3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 21);
      -[CPUITableCell setActivityIndicatorView:](self, "setActivityIndicatorView:", v4);

      -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, 22.0, 22.0);

      -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startAnimating");

      -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", v11);

    }
    else
    {
      -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopAnimating");

        -[CPUITableCell activityIndicatorView](self, "activityIndicatorView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        -[CPUITableCell setActivityIndicatorView:](self, "setActivityIndicatorView:", 0);
      }
      -[CPUITableCell cloudAccessory](self, "cloudAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITableCell _setCloudAccessory:](self, "_setCloudAccessory:", v10);

      -[CPUITableCell setActivityIndicatorView:](self, "setActivityIndicatorView:", 0);
      -[CPUITableCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (double)_accessoryWidth
{
  void *v3;
  void *v4;
  double v5;
  CGRect v7;

  -[CPUITableCell accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CPUITableCell accessoryView](self, "accessoryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v5 = CGRectGetWidth(v7) + 8.0;

  }
  else if (-[CPUITableCell accessoryType](self, "accessoryType") == 3)
  {
    return 40.0;
  }
  else
  {
    return 0.0;
  }
  return v5;
}

- (void)updatePlaybackProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  CPUIPlaybackProgressView *v11;
  void *v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double playbackProgress;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;

  -[CPUITableCell playbackProgress](self, "playbackProgress");
  v4 = v3;
  if (!-[CPUITableCell shouldShowPlaybackProgress](self, "shouldShowPlaybackProgress"))
  {
    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
LABEL_9:
    objc_msgSend(v7, "removeFromSuperview");

    -[CPUITableCell setPlaybackProgressView:](self, "setPlaybackProgressView:", 0);
    return;
  }
  -[CPUITableCell playbackProgress](self, "playbackProgress");
  v6 = v5;
  -[CPUITableCell playbackProgressView](self, "playbackProgressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 > 0.0 && v4 < 0.999999881)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[CPUITableCell playbackProgressView](self, "playbackProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[CPUITableCell setPlaybackProgressView:](self, "setPlaybackProgressView:", 0);
      v11 = objc_alloc_init(CPUIPlaybackProgressView);
      -[CPUITableCell setPlaybackProgressView:](self, "setPlaybackProgressView:", v11);

      -[CPUITableCell playbackProgressView](self, "playbackProgressView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUITableCell addSubview:](self, "addSubview:", v12);

    }
    -[CPUITableCell playbackProgress](self, "playbackProgress");
    v14 = v13;
    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPlaybackProgress:", v14);
LABEL_7:

    return;
  }
  if (v4 < 0.999999881)
    goto LABEL_9;
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");

    -[CPUITableCell setPlaybackProgressView:](self, "setPlaybackProgressView:", 0);
    if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    else
      +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    else
      +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell detailTextLabel](self, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "font");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pointSize");
    v21 = v20;
    -[CPUITableCell traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIPlaybackProgressCompleteGlyphWithSize(v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithRenderingMode:", 2);
    v24 = objc_claimAutoreleasedReturnValue();
    playbackProgress = self->_playbackProgress;
    *(_QWORD *)&self->_playbackProgress = v24;

    v26 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(*(id *)&self->_playbackProgress, "imageWithTintColor:", v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&self->_playbackProgress, "imageWithTintColor:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithImage:highlightedImage:", v27, v28);
    -[CPUITableCell setPlaybackProgressView:](self, "setPlaybackProgressView:", v29);

    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPUITableCell isFocused](self, "isFocused"))
      v31 = v17;
    else
      v31 = v34;
    objc_msgSend(v30, "setTintColor:", v31);

    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sizeToFit");

    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell addSubview:](self, "addSubview:", v33);

    goto LABEL_7;
  }
}

- (void)updateArtwork
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CPUITableCell setArtworkImageView:](self, "setArtworkImageView:", v5);

    -[CPUITableCell artworkImageView](self, "artworkImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell addSubview:](self, "addSubview:", v6);

  }
  if (-[CPUITableCell currentlyPlaying](self, "currentlyPlaying")
    && (-[CPUITableCell isFocused](self, "isFocused") & 1) != 0
    || (-[CPUITableCell isSelected](self, "isSelected") & 1) != 0
    || -[CPUITableCell isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v7;
  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v11);

  -[CPUITableCell artwork](self, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  -[CPUITableCell _updatePlayingArtworkIfNeeded](self, "_updatePlayingArtworkIfNeeded");
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double MaxX;
  double v67;
  CGFloat v68;
  double Width;
  void *v70;
  double MinX;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  void *v88;
  void *v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  _BOOL4 v94;
  void *v95;
  void *v96;
  uint64_t v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  _BOOL4 v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  uint64_t v118;
  double v119;
  double v120;
  void *v121;
  double Height;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  CGFloat v150;
  CGFloat v151;
  double v152;
  double v153;
  double MidY;
  void *v155;
  double v156;
  double v157;
  int v158;
  void *v159;
  double v160;
  double v161;
  _BOOL4 v162;
  void *v163;
  double v164;
  void *v165;
  void *v166;
  _BOOL4 v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  double v179;
  CGFloat v180;
  void *v181;
  CGFloat v182;
  CGFloat v183;
  CGFloat v184;
  CGFloat v185;
  _BOOL4 v186;
  void *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  double v193;
  double v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  void *v199;
  void *v200;
  double v201;
  void *v202;
  void *v203;
  _BOOL4 v204;
  double v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  CGFloat rect;
  double v212;
  double v213;
  double v214;
  CGFloat v215;
  double v216;
  double v217;
  double v218;
  CGFloat v219;
  double v220;
  double v221;
  double v222;
  double v223;
  CGFloat v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double rect2;
  double rect2a;
  objc_super v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;

  v231.receiver = self;
  v231.super_class = (Class)CPUITableCell;
  -[CPUITableCell layoutSubviews](&v231, sel_layoutSubviews);
  v3 = -[CPUITableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[CPUITableCell playbackProgress](self, "playbackProgress");
  rect2 = v4;
  -[CPUITableCell artworkSize](self, "artworkSize");
  v6 = v5;
  v8 = v7;
  -[CPUITableCell artwork](self, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  -[CPUITableCell artwork](self, "artwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v11 < v13)
      v11 = v13;
    -[CPUITableCell bounds](self, "bounds");
    v15 = CGRectGetHeight(v232) + -12.0;
    if (v11 < v15)
      v15 = v11;
    if (v15 < v6)
      v6 = v15;
    if (v15 < v8)
      v8 = v15;
  }
  -[CPUITableCell bounds](self, "bounds");
  v16 = (CGRectGetHeight(v233) - v8) * 0.5;
  -[CPUITableCell artwork](self, "artwork");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_12:
    v18 = v6 + 6.0 + 8.0;
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    goto LABEL_16;
  }
  if (-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide")
    && -[CPUITableCell currentlyPlaying](self, "currentlyPlaying"))
  {
    goto LABEL_12;
  }
  v19 = *MEMORY[0x24BDF7718];
  v18 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v20 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v21 = *(double *)(MEMORY[0x24BDF7718] + 24);
LABEL_16:
  v22 = round(v16);
  -[CPUITableCell setSeparatorInset:](self, "setSeparatorInset:", v19, v18, v20, v21);
  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (CGFloat *)MEMORY[0x24BDBF090];
  if (!v23)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CPUITableCell setArtworkImageView:](self, "setArtworkImageView:", v25);

    -[CPUITableCell artworkImageView](self, "artworkImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell addSubview:](self, "addSubview:", v26);

  }
  -[CPUITableCell bounds](self, "bounds");
  v31 = CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(6.0, v22, v6, v8, v27, v28, v29, v30);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setContentMode:", 2);

  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClipsToBounds:", 1);

  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_setContinuousCornerRadius:", 4.0);

  -[CPUITableCell playbackProgressView](self, "playbackProgressView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[CPUITableCell textLabel](self, "textLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;

    -[CPUITableCell detailTextLabel](self, "detailTextLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "frame");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;

    -[CPUITableCell playbackProgressView](self, "playbackProgressView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "frame");
    v219 = v62;
    rect = v63;
    v225 = v65;
    v227 = v64;

    v215 = v47;
    v217 = v51;
    v212 = v49;
    v214 = v45;
    if (v3 == 1)
    {
      v234.origin.x = v45;
      v234.origin.y = v47;
      v234.size.width = v49;
      v234.size.height = v51;
      MaxX = CGRectGetMaxX(v234);
      v235.origin.x = v54;
      v67 = v56;
      v235.origin.y = v56;
      v68 = v58;
      v235.size.width = v58;
      v235.size.height = v60;
      Width = CGRectGetWidth(v235);
      -[CPUITableCell artworkImageView](self, "artworkImageView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "frame");
      MinX = CGRectGetMinX(v236);
      if (rect2 < 0.999999881)
      {
        v239.origin.x = v219;
        v239.origin.y = rect;
        v239.size.height = v225;
        v239.size.width = v227;
        v72 = CGRectGetWidth(v239);
      }
      else
      {
        objc_msgSend(*(id *)&self->_playbackProgress, "size", 0.999999881, rect2);
      }
      v73 = MaxX - Width;
      v74 = MinX - v72 + -8.0;

    }
    else
    {
      v67 = v56;
      v68 = v58;
      v237.origin.x = v45;
      v237.origin.y = v47;
      v237.size.width = v49;
      v237.size.height = v51;
      v73 = CGRectGetMinX(v237);
      v238.origin.x = v45;
      v238.origin.y = v47;
      v238.size.width = v49;
      v238.size.height = v51;
      v74 = CGRectGetMinX(v238);
    }
    v222 = v60;
    if (rect2 < 0.999999881)
    {
      v220 = v73;
      v242.origin.x = v73;
      v242.origin.y = v67;
      v75 = v68;
      v242.size.width = v68;
      v242.size.height = v60;
      v86 = CGRectGetMaxY(v242) + 5.0;
      v77 = v215;
    }
    else
    {
      v240.origin.x = v73;
      v240.origin.y = v67;
      v75 = v68;
      v240.size.width = v68;
      v240.size.height = v60;
      v76 = CGRectGetMinY(v240) + 1.0;
      v77 = v215;
      v78 = v74;
      v79 = v76;
      v81 = v225;
      v80 = v227;
      if (v3 == 1)
      {
        v82 = CGRectGetMinX(*(CGRect *)&v78);
        v241.origin.x = v73;
        v241.origin.y = v67;
        v241.size.width = v75;
        v241.size.height = v60;
        v83 = v82 - CGRectGetWidth(v241) + -6.0;
        -[CPUITableCell _accessoryWidth](self, "_accessoryWidth");
        v85 = v83 - v84;
      }
      else
      {
        v85 = CGRectGetMaxX(*(CGRect *)&v78) + 6.0;
      }
      v220 = v85;
      v86 = v76;
      v67 = v67 + 1.0;
      -[CPUITableCell accessoryView](self, "accessoryView", 0x3FEFFFFFC0000000);
      v87 = objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        v88 = (void *)v87;
        -[CPUITableCell accessoryView](self, "accessoryView");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "frame");
        v274.origin.x = v90;
        v274.origin.y = v91;
        v274.size.width = v92;
        v274.size.height = v93;
        v243.origin.x = v220;
        v243.size.height = v222;
        v243.origin.y = v67;
        v243.size.width = v75;
        v94 = CGRectIntersectsRect(v243, v274);

        if (v94)
        {
          v244.origin.x = v74;
          v244.origin.y = v76;
          v244.size.height = v225;
          v244.size.width = v227;
          v75 = v75 - (CGRectGetWidth(v244) + 6.0);
        }
      }
    }
    -[CPUITableCell detailTextLabel](self, "detailTextLabel", *(_QWORD *)&rect);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "text");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "length");

    if (v97)
    {
      v98 = rect2;
      if (rect2 >= 0.999999881)
      {
        v99 = v67;
LABEL_39:
        -[CPUITableCell textLabel](self, "textLabel", v98);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setFrame:", v214, v77, v212, v217);

        -[CPUITableCell detailTextLabel](self, "detailTextLabel");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "setFrame:", v220, v99, v75, v222);

        -[CPUITableCell playbackProgressView](self, "playbackProgressView");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setFrame:", v74, v86, v227, v225);

        goto LABEL_40;
      }
      v98 = -3.0;
      v77 = v77 + -3.0;
      v99 = v67 + -3.0;
    }
    else
    {
      v99 = v67;
      v98 = -8.0;
      v77 = v77 + -8.0;
    }
    v86 = v86 + v98;
    goto LABEL_39;
  }
LABEL_40:
  if (-[CPUITableCell currentlyPlaying](self, "currentlyPlaying")
    && !-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide"))
  {
    -[CPUITableCell accessoryView](self, "accessoryView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v104 != v105;

  }
  else
  {
    v103 = 0;
  }
  if (-[CPUITableCell currentlyPlaying](self, "currentlyPlaying"))
  {
    if (-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide"))
    {
      -[CPUITableCell artworkImageView](self, "artworkImageView");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "center");
      objc_msgSend(*(id *)&self->_showExplicit, "setCenter:");

    }
    else
    {
      -[CPUITableCell accessoryView](self, "accessoryView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = *(void **)&self->_showExplicit;

      if (v107 != v108)
      {
        -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "frame");
        v111 = v110;
        v113 = v112;
        v115 = v114;
        v117 = v116;

        v118 = -[CPUITableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
        if (v118 == 1)
        {
          v119 = 8.0;
        }
        else
        {
          -[CPUITableCell accessoryView](self, "accessoryView");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "frame");
          v120 = CGRectGetMinX(v245);
          v246.origin.x = v111;
          v246.origin.y = v113;
          v246.size.width = v115;
          v246.size.height = v117;
          v119 = v120 - CGRectGetWidth(v246) + -8.0;
        }
        -[CPUITableCell contentView](self, "contentView");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "bounds");
        Height = CGRectGetHeight(v247);
        v248.origin.x = v111;
        v248.origin.y = v113;
        v248.size.width = v115;
        v248.size.height = v117;
        v123 = (Height - CGRectGetHeight(v248)) * 0.5;
        v249.origin.x = v111;
        v249.origin.y = v113;
        v249.size.width = v115;
        v249.size.height = v117;
        v124 = CGRectGetWidth(v249);
        v250.origin.x = v111;
        v250.origin.y = v113;
        v250.size.width = v115;
        v250.size.height = v117;
        v125 = CGRectGetHeight(v250);

        if (v118 != 1)
        objc_msgSend(*(id *)&self->_showExplicit, "setFrame:", v119, v123, v124, v125);
      }
    }
  }
  if (-[CPUITableCell isShowExplicit](self, "isShowExplicit")
    || -[CPUITableCell currentlyPlaying](self, "currentlyPlaying")
    && !-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide"))
  {
    -[CPUITableCell explicitItemView](self, "explicitItemView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "frame");
    v128 = v127;
    v130 = v129;
    v228 = v132;
    rect2a = v131;

    -[CPUITableCell textLabel](self, "textLabel");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "frame");
    v135 = v134;
    v137 = v136;
    v139 = v138;
    v141 = v140;

    -[CPUITableCell detailTextLabel](self, "detailTextLabel");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "frame");
    v218 = v144;
    v221 = v143;
    v223 = v145;
    v216 = v146;

    v147 = v135;
    v148 = v137;
    v149 = v139;
    v150 = v141;
    if (v3 == 1)
    {
      v151 = CGRectGetMinX(*(CGRect *)&v147) + -8.0;
      v251.origin.x = v128;
      v251.origin.y = v130;
      v251.size.height = v228;
      v251.size.width = rect2a;
      v152 = v151 - CGRectGetWidth(v251);
    }
    else
    {
      v152 = CGRectGetMaxX(*(CGRect *)&v147) + 8.0;
    }
    v226 = v152;
    v153 = v141;
    v252.origin.x = v135;
    v252.origin.y = v137;
    v252.size.width = v139;
    v252.size.height = v141;
    MidY = CGRectGetMidY(v252);
    -[CPUITableCell explicitItemView](self, "explicitItemView");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "frame");
    v156 = round(MidY + CGRectGetHeight(v253) * -0.5);

    if (v3 == 1)
    {
      v157 = v226;
      LOBYTE(v158) = v226 < 0.0;
      -[CPUITableCell accessoryView](self, "accessoryView");
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      if (v159)
      {
        if (v226 < 0.0)
        {
          if (!v103)
            goto LABEL_95;
          goto LABEL_72;
        }
        -[CPUITableCell accessoryView](self, "accessoryView");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "frame");
        v275.origin.x = v226;
        v275.origin.y = v156;
        v275.size.height = v228;
        v275.size.width = rect2a;
        LOBYTE(v158) = CGRectIntersectsRect(v256, v275);

      }
      v164 = v223;
      if (!v103)
        goto LABEL_90;
      if ((v158 & 1) == 0)
      {
        -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "frame");
        v278.origin.x = v226;
        v278.origin.y = v156;
        v278.size.height = v228;
        v278.size.width = rect2a;
        if (CGRectIntersectsRect(v259, v278))
        {
          v158 = 1;
        }
        else
        {
          -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "frame");
          v280.origin.x = v135;
          v280.origin.y = v137;
          v280.size.width = v139;
          v280.size.height = v153;
          v158 = CGRectIntersectsRect(v261, v280);

        }
        goto LABEL_86;
      }
LABEL_72:
      v158 = 1;
LABEL_86:
      v213 = v156;
      -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "frame");
      v174 = v173;
      v176 = v175;
      v178 = v177;
      v180 = v179;
      -[CPUITableCell detailTextLabel](self, "detailTextLabel");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "frame");
      v281.origin.x = v182;
      v281.origin.y = v183;
      v281.size.width = v184;
      v281.size.height = v185;
      v262.origin.x = v174;
      v262.origin.y = v176;
      v262.size.width = v178;
      v262.size.height = v180;
      v186 = CGRectIntersectsRect(v262, v281);

      if (!v186)
      {
        v156 = v213;
        v164 = v223;
        v157 = v226;
        if (!v158)
        {
LABEL_111:
          -[CPUITableCell explicitItemView](self, "explicitItemView");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "setFrame:", v157, v156, rect2a, v228);

          return;
        }
        goto LABEL_93;
      }
      -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "frame");
      v188 = CGRectGetWidth(v263) + 8.0;

      v189 = v223 - v188;
      v190 = -0.0;
      if (v3 == 1)
        v190 = v188;
      v191 = v221 + v190;
      -[CPUITableCell detailTextLabel](self, "detailTextLabel");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = v191;
      v193 = v191;
      v164 = v189;
      objc_msgSend(v192, "setFrame:", v193, v218, v189, v216);

      v156 = v213;
      v157 = v226;
LABEL_90:
      if ((v158 & 1) == 0)
        goto LABEL_111;
LABEL_93:
      if (v3 != 1)
      {
        v224 = v137;
        -[CPUITableCell frame](self, "frame");
        v198 = CGRectGetMaxX(v267);
        -[CPUITableCell accessoryView](self, "accessoryView");
        v199 = (void *)objc_claimAutoreleasedReturnValue();

        if (v199)
        {
          -[CPUITableCell accessoryView](self, "accessoryView");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "frame");
          v198 = CGRectGetMinX(v268);

        }
        v201 = v24[2];
        if (v103)
        {
          -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v202, "frame");
          v198 = CGRectGetMinX(v269);

        }
        if (v201 > 0.0)
        {
          -[CPUITableCell accessoryView](self, "accessoryView");
          v203 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v203)
          {
            v270.origin.x = *v24;
            v270.origin.y = v24[1];
            v270.size.height = v24[3];
            v270.size.width = v201;
            v198 = CGRectGetMinX(v270);
          }
        }
        v204 = -[CPUITableCell isShowExplicit](self, "isShowExplicit");
        v205 = 8.0;
        if (v204)
        {
          v271.origin.x = v226;
          v271.size.height = v228;
          v271.origin.y = v156;
          v271.size.width = rect2a;
          v205 = CGRectGetWidth(v271) + 16.0;
        }
        v197 = v198 - v135 - v205;
        -[CPUITableCell textLabel](self, "textLabel");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "sizeToFit");

        -[CPUITableCell textLabel](self, "textLabel");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "frame");
        v196 = CGRectGetWidth(v272);

        if (v197 < v196)
          v196 = v197;
        v273.origin.x = v135;
        v137 = v224;
        v273.origin.y = v224;
        v273.size.width = v196;
        v273.size.height = v153;
        v157 = CGRectGetMaxX(v273) + 8.0;
        goto LABEL_110;
      }
      v223 = v164;
LABEL_95:
      v264.origin.x = v157;
      v264.origin.y = v156;
      v264.size.height = v228;
      v264.size.width = rect2a;
      v194 = round(CGRectGetWidth(v264) + 8.0);
      if (v103)
      {
        -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "frame");
        v194 = v194 + CGRectGetWidth(v265) + 8.0;

      }
      v196 = v139 - v194;
      v135 = v135 + v194;
      v266.origin.x = v135;
      v266.origin.y = v137;
      v266.size.width = v139 - v194;
      v266.size.height = v153;
      v157 = CGRectGetMinX(v266) - v194;
      v197 = v223;
LABEL_110:
      -[CPUITableCell textLabel](self, "textLabel");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "setFrame:", v135, v137, v196, v153);

      -[CPUITableCell detailTextLabel](self, "detailTextLabel");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "setFrame:", v221, v218, v197, v216);

      goto LABEL_111;
    }
    v254.origin.x = v226;
    v254.size.height = v228;
    v254.origin.y = v156;
    v254.size.width = rect2a;
    v160 = CGRectGetMaxX(v254);
    -[CPUITableCell frame](self, "frame");
    v161 = CGRectGetMaxX(v255) + -8.0;
    v162 = v160 >= v161;
    -[CPUITableCell accessoryView](self, "accessoryView");
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    if (v163)
    {
      if (v160 >= v161)
      {
        -[CPUITableCell currentlyPlaying](self, "currentlyPlaying");
        v158 = 1;
        v164 = v223;
        v157 = v226;
        goto LABEL_82;
      }
      -[CPUITableCell accessoryView](self, "accessoryView");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "frame");
      v157 = v226;
      v276.size.height = v228;
      v276.origin.x = v226;
      v276.origin.y = v156;
      v276.size.width = rect2a;
      v162 = CGRectIntersectsRect(v257, v276);

    }
    else
    {
      v157 = v226;
    }
    v164 = v223;
    v167 = -[CPUITableCell currentlyPlaying](self, "currentlyPlaying");
    v158 = v167 || v162;
    if (v167 && !v162)
    {
      -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "frame");
      v277.origin.x = v157;
      v277.origin.y = v156;
      v277.size.height = v228;
      v277.size.width = rect2a;
      if (CGRectIntersectsRect(v258, v277))
      {
        v158 = 1;
      }
      else
      {
        -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "frame");
        v279.origin.x = v135;
        v279.origin.y = v137;
        v279.size.width = v139;
        v279.size.height = v153;
        v158 = CGRectIntersectsRect(v260, v279);

      }
    }
LABEL_82:
    if (!v103)
      goto LABEL_90;
    goto LABEL_86;
  }
}

- (void)_updatePlayingArtworkIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;

  if (-[CPUITableCell currentlyPlaying](self, "currentlyPlaying"))
  {
    if (-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide"))
    {
      -[CPUITableCell artworkImageView](self, "artworkImageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAlpha:", 0.200000003);

    }
    objc_msgSend(*(id *)&self->_showExplicit, "sizeToFit");
    if (-[CPUITableCell playingIndicatorLeadingSide](self, "playingIndicatorLeadingSide"))
    {
      -[CPUITableCell contentView](self, "contentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)&self->_showExplicit;
      -[CPUITableCell artworkImageView](self, "artworkImageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertSubview:above:", v5, v6);

    }
    else
    {
      -[CPUITableCell accessoryView](self, "accessoryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[CPUITableCell setAccessoryView:](self, "setAccessoryView:", *(_QWORD *)&self->_showExplicit);
        goto LABEL_12;
      }
      -[CPUITableCell accessoryView](self, "accessoryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)&self->_showExplicit;

      if (v10 == v11)
      {
LABEL_12:
        v12 = -[CPUITableCell playbackState](self, "playbackState");
        -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPlaybackState:", v12);
        goto LABEL_13;
      }
      -[CPUITableCell contentView](self, "contentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", *(_QWORD *)&self->_showExplicit);
    }

    goto LABEL_12;
  }
  -[CPUITableCell artworkImageView](self, "artworkImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaybackState:", 0);

  -[CPUITableCell nowPlayingIndicator](self, "nowPlayingIndicator");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");
LABEL_13:

}

- (MPUNowPlayingIndicatorView)nowPlayingIndicator
{
  return *(MPUNowPlayingIndicatorView **)&self->_showExplicit;
}

- (CGSize)artworkSize
{
  UIActivityIndicatorView *activityIndicatorView;
  double width;
  CGSize result;

  activityIndicatorView = self->_activityIndicatorView;
  width = self->_artworkSize.width;
  result.height = width;
  result.width = *(double *)&activityIndicatorView;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  *(CGSize *)&self->_activityIndicatorView = a3;
}

- (BOOL)isShowExplicit
{
  return *(&self->super._itemEnabled + 1);
}

- (void)setShowExplicit:(BOOL)a3
{
  *(&self->super._itemEnabled + 1) = a3;
}

- (CPUITableCellAccessory)cloudAccessory
{
  return (CPUITableCellAccessory *)self->_nowPlayingIndicator;
}

- (void)setCloudAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingIndicator, a3);
}

- (CPUITableCellAccessory)accessory
{
  return self->_cloudAccessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAccessory, a3);
}

- (UIImage)cloudImage
{
  return (UIImage *)self->_accessory;
}

- (void)setCloudImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (UIImage)chevronImage
{
  return self->_cloudImage;
}

- (void)setChevronImage:(id)a3
{
  objc_storeStrong((id *)&self->_cloudImage, a3);
}

- (BOOL)showActivityIndicator
{
  return *(&self->super._itemEnabled + 2);
}

- (double)playbackProgress
{
  return *(double *)&self->_chevronImage;
}

- (void)setPlaybackProgress:(double)a3
{
  *(double *)&self->_chevronImage = a3;
}

- (UIImage)playbackProgressFullImage
{
  return *(UIImage **)&self->_playbackProgress;
}

- (void)setPlaybackProgressFullImage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackProgress, a3);
}

- (BOOL)shouldShowPlaybackProgress
{
  return *(&self->super._itemEnabled + 3);
}

- (void)setShouldShowPlaybackProgress:(BOOL)a3
{
  *(&self->super._itemEnabled + 3) = a3;
}

- (BOOL)container
{
  return *(&self->super._itemEnabled + 4);
}

- (UIImage)artwork
{
  return self->_playbackProgressFullImage;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_playbackProgressFullImage, a3);
}

- (int64_t)playbackState
{
  return (int64_t)self->_artwork;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_artwork = (UIImage *)a3;
}

- (BOOL)playingIndicatorLeadingSide
{
  return *(&self->super._itemEnabled + 5);
}

- (void)setPlayingIndicatorLeadingSide:(BOOL)a3
{
  *(&self->super._itemEnabled + 5) = a3;
}

- (UIView)playbackProgressView
{
  return (UIView *)self->_playbackState;
}

- (void)setPlaybackProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_playbackState, a3);
}

- (UIImageView)artworkImageView
{
  return (UIImageView *)self->_playbackProgressView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_playbackProgressView, a3);
}

- (UIImageView)explicitItemView
{
  return self->_artworkImageView;
}

- (void)setExplicitItemView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)self->_explicitItemView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_explicitItemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitItemView, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_playbackProgressView, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_playbackProgressFullImage, 0);
  objc_storeStrong((id *)&self->_playbackProgress, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_cloudAccessory, 0);
  objc_storeStrong((id *)&self->_nowPlayingIndicator, 0);
  objc_storeStrong((id *)&self->_showExplicit, 0);
}

@end
