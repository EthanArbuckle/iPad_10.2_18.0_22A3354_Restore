@implementation ReadingListTableViewCell

- (ReadingListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReadingListTableViewCell *v4;
  ReadingListTableViewCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *textLabel;
  uint64_t v9;
  void *v10;
  UILabel *v11;
  UILabel *detailTextLabel;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *siteNameLabel;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  ReadingListTableViewCell *v22;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)ReadingListTableViewCell;
  v4 = -[ReadingListTableViewCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ReadingListTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v7;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v9 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_textLabel, "setFont:", v10);

    objc_msgSend(v6, "addSubview:", v5->_textLabel);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailTextLabel = v5->_detailTextLabel;
    v5->_detailTextLabel = v11;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_detailTextLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B20], 0x8000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_detailTextLabel, "setFont:", v13);

    -[UILabel setNumberOfLines:](v5->_detailTextLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_detailTextLabel, "setTextColor:", v14);

    objc_msgSend(v6, "addSubview:", v5->_detailTextLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    siteNameLabel = v5->_siteNameLabel;
    v5->_siteNameLabel = v15;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_siteNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_siteNameLabel, "setFont:", v17);

    objc_msgSend(v6, "addSubview:", v5->_siteNameLabel);
    -[ReadingListTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    -[ReadingListTableViewCell setLayoutMargins:](v5, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ReadingListTableViewCell setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 0);
    -[ReadingListTableViewCell _initializeAutoLayoutConstraints](v5, "_initializeAutoLayoutConstraints");
    -[ReadingListTableViewCell _updateNumberOfLines](v5, "_updateNumberOfLines");
    -[ReadingListTableViewCell _updateMaximumContentSizeCategory](v5, "_updateMaximumContentSizeCategory");
    v26[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[ReadingListTableViewCell registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v18, v5, sel__updateNumberOfLines);

    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)-[ReadingListTableViewCell registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v20, v5, sel__updateMaximumContentSizeCategory);

    v22 = v5;
  }

  return v5;
}

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell setAlpha:](&v7, sel_setAlpha_);
  if (a3 >= 1.0)
    v5 = 1;
  else
    v5 = -[VibrantTableViewCell usesVibrantEffect](self, "usesVibrantEffect") ^ 1;
  -[ReadingListTableViewCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", v5);
  objc_msgSend(v6, "setAllowsGroupOpacity:", v5);

}

- (void)setUsesVibrantEffect:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[VibrantTableViewCell usesVibrantEffect](self, "usesVibrantEffect") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ReadingListTableViewCell;
    -[VibrantTableViewCell setUsesVibrantEffect:](&v5, sel_setUsesVibrantEffect_, v3);
    -[ReadingListTableViewCell _updateVibrantEffect](self, "_updateVibrantEffect");
  }
}

- (void)_updateVibrantEffect
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[VibrantTableViewCell usesVibrantEffect](self, "usesVibrantEffect"))
    v3 = self->_dragState != 0;
  else
    v3 = 1;
  -[ReadingListTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAllowsGroupBlending:", v3);
  objc_msgSend(v5, "setAllowsGroupOpacity:", v3);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_SFSiteIconView setBookmark:](self->_imageView, "setBookmark:", 0);
}

- (void)_initializeAutoLayoutConstraints
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_siteNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ReadingListTableViewCell _createImageViewIfNeeded](self, "_createImageViewIfNeeded");
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[_SFSiteIconView widthAnchor](self->_imageView, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSiteIconView heightAnchor](self->_imageView, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  -[_SFSiteIconView widthAnchor](self->_imageView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 72.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v8);

  _NSDictionaryOfVariableBindings((NSString *)CFSTR("_textLabel, _detailTextLabel, _siteNameLabel, _imageView"), self->_textLabel, self->_detailTextLabel, self->_siteNameLabel, self->_imageView, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings((NSString *)CFSTR("vInterLabelSpacing, vImageViewSpacing, vLabelSpacing, hLabelSpacing, hLeadingImageViewSpacing"), &unk_1E9D629E8, &unk_1E9D629F8, &unk_1E9D62A08, &unk_1E9D629F8, &unk_1E9D62A18, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(vImageViewSpacing)-[_imageView]-(>=vImageViewSpacing)-|"), 0, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(vLabelSpacing)-[_textLabel]-(vInterLabelSpacing)-[_siteNameLabel]-(vInterLabelSpacing)-[_detailTextLabel]-(>=vLabelSpacing)-|"), 96, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(hLeadingImageViewSpacing)-[_imageView]-(hLabelSpacing)-[_textLabel]-(hLabelSpacing)-|"), 0, v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v16);

}

- (void)_createImageViewIfNeeded
{
  _SFSiteIconView *v3;
  _SFSiteIconView *imageView;
  void *v5;
  void *v6;

  if (!self->_imageView)
  {
    v3 = (_SFSiteIconView *)objc_alloc_init(MEMORY[0x1E0D4EF80]);
    imageView = self->_imageView;
    self->_imageView = v3;

    -[ReadingListTableViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_imageView);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v6);

    -[_SFSiteIconView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
    -[_SFSiteIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
}

- (void)_updateNumberOfLines
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;
  uint64_t v7;

  -[ReadingListTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    v6 = 3;
  else
    v6 = 2;
  if (IsAccessibilityCategory)
    v7 = 2;
  else
    v7 = 1;
  -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", v6);
  -[UILabel setNumberOfLines:](self->_siteNameLabel, "setNumberOfLines:", v7);
}

- (void)_updateMaximumContentSizeCategory
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[ReadingListTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  if (v4 == 1)
    v5 = *MEMORY[0x1E0DC48D0];
  else
    v5 = 0;
  -[ReadingListTableViewCell setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v5);
}

- (void)setReadingListIcon:(id)a3
{
  -[_SFSiteIconView setLeadingImage:](self->_imageView, "setLeadingImage:", a3);
}

- (void)displayThumbnailIconForBookmark:(id)a3 synchronously:(BOOL)a4
{
  id v6;
  int bookmarkID;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _SFSiteIconView *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  ReadingListTableViewCell *v17;
  id v18;
  _SFSiteIconView *v19;

  v6 = a3;
  bookmarkID = self->_bookmarkID;
  if (bookmarkID == objc_msgSend(v6, "identifier"))
  {
    -[_SFSiteIconView image](self->_imageView, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v6, "iconData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ReadingListTableViewCell reuseIdentifier](self, "reuseIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ReadingListTableViewCellWithImage"));

        if (v11)
        {
          v12 = self->_imageView;
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_SFSiteIconView setLeadingImage:](v12, "setLeadingImage:", v13);

          }
          else
          {
            dispatch_get_global_queue(0, 0);
            v14 = objc_claimAutoreleasedReturnValue();
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke;
            v15[3] = &unk_1E9CF32B8;
            v16 = v9;
            v17 = self;
            v18 = v6;
            v19 = v12;
            dispatch_async(v14, v15);

          }
        }
      }

    }
  }

}

void __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke_2;
  v5[3] = &unk_1E9CF32B8;
  v3 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = *(id *)(a1 + 56);
  v8 = v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "bookmarkID");
  result = objc_msgSend(*(id *)(a1 + 40), "identifier");
  if (v2 == (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 48), "setLeadingImage:", *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  }
  return result;
}

- (void)setBookmark:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *siteName;
  char v10;
  NSString *previewText;
  int v12;
  uint64_t v13;
  UILabel *textLabel;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  self->_bookmarkID = objc_msgSend(v18, "identifier");
  objc_msgSend(v18, "previewText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v18, "previewText");
  else
    objc_msgSend(v18, "localPreviewText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_previewText, v5);

  objc_msgSend(v18, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_userVisibleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  siteName = self->_siteName;
  self->_siteName = v8;

  v10 = objc_opt_respondsToSelector();
  previewText = self->_previewText;
  if ((v10 & 1) != 0)
    v12 = -[NSString _isNaturallyRTL](previewText, "_isNaturallyRTL");
  else
    v12 = -[NSString isNaturallyRTL](previewText, "isNaturallyRTL");
  if (v12)
    v13 = 2;
  else
    v13 = 0;
  textLabel = self->_textLabel;
  objc_msgSend(v18, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](textLabel, "setText:", v15);

  -[UILabel setText:](self->_detailTextLabel, "setText:", self->_previewText);
  -[UILabel setTextAlignment:](self->_detailTextLabel, "setTextAlignment:", v13);
  -[UILabel setText:](self->_siteNameLabel, "setText:", self->_siteName);
  -[_SFSiteIconView bookmark](self->_imageView, "bookmark");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToBookmark:", v18);

  if ((v17 & 1) == 0)
    -[_SFSiteIconView setBookmark:](self->_imageView, "setBookmark:", v18);
  -[ReadingListTableViewCell _setFetchingStatusTextForBookmark:](self, "_setFetchingStatusTextForBookmark:", v18);

}

- (void)setBookmark:(id)a3 isArchiving:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = v6;
  if (v4)
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListTableViewCell setFetchingStatusText:](self, "setFetchingStatusText:", v7);

  }
  else
  {
    -[ReadingListTableViewCell _setFetchingStatusTextForBookmark:](self, "_setFetchingStatusTextForBookmark:", v6);
  }

}

- (void)_setFetchingStatusTextForBookmark:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isFullArchiveAvailable") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isNetworkReachable"),
        v4,
        (v5 & 1) != 0))
  {
    -[ReadingListTableViewCell setFetchingStatusText:](self, "setFetchingStatusText:", 0);
  }
  else
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListTableViewCell setFetchingStatusText:](self, "setFetchingStatusText:", v6);

  }
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  _BOOL8 v4;
  _SFSiteIconView *v6;
  objc_super v7;

  v4 = a3;
  v6 = (_SFSiteIconView *)a4;
  if (self->_imageView != v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)ReadingListTableViewCell;
    -[ReadingListTableViewCell _setOpaque:forSubview:](&v7, sel__setOpaque_forSubview_, v4, v6);
  }

}

- (void)dragStateDidChange:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell dragStateDidChange:](&v5, sel_dragStateDidChange_);
  self->_dragState = a3;
  -[ReadingListTableViewCell _updateSelectedAnimated:](self, "_updateSelectedAnimated:", 0);
  -[ReadingListTableViewCell _updateVibrantEffect](self, "_updateVibrantEffect");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_wantsSelectedAppearance = a3;
  -[ReadingListTableViewCell _updateSelectedAnimated:](self, "_updateSelectedAnimated:", a4);
  -[ReadingListTableViewCell safari_updateVisualStateIsSelected:isEditing:](self, "safari_updateVisualStateIsSelected:isEditing:", self->_wantsSelectedAppearance, -[ReadingListTableViewCell isEditing](self, "isEditing"));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;
  _QWORD v8[5];

  v4 = a4;
  v5 = a3;
  if (-[ReadingListTableViewCell isEditing](self, "isEditing") != a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__ReadingListTableViewCell_setEditing_animated___block_invoke;
    v8[3] = &unk_1E9CF31B0;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    -[ReadingListTableViewCell safari_updateVisualStateIsSelected:isEditing:](self, "safari_updateVisualStateIsSelected:isEditing:", -[ReadingListTableViewCell isSelected](self, "isSelected"), v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
}

uint64_t __48__ReadingListTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
}

- (void)_updateSelectedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v4;
  objc_super v5;

  v3 = a3;
  v4 = self->_wantsSelectedAppearance && self->_dragState == 0;
  v5.receiver = self;
  v5.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell setSelected:animated:](&v5, sel_setSelected_animated_, v4, v3);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell layoutSubviews](&v7, sel_layoutSubviews);
  -[ReadingListTableViewCell fetchingStatusText](self, "fetchingStatusText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ReadingListTableViewCell previewText](self, "previewText");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[UILabel setText:](self->_detailTextLabel, "setText:", v6);
}

+ (double)minimumCellHeight
{
  return 96.0;
}

- (int)bookmarkID
{
  return self->_bookmarkID;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSString)previewText
{
  return self->_previewText;
}

- (void)setPreviewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (NSString)fetchingStatusText
{
  return self->_fetchingStatusText;
}

- (void)setFetchingStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchingStatusText, 0);
  objc_storeStrong((id *)&self->_previewText, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_siteNameLabel, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
}

@end
