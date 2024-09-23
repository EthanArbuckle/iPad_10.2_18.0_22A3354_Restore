@implementation EKUIAutocompleteOccurrenceTableViewCell

+ (id)reuseIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__EKUIAutocompleteOccurrenceTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken != -1)
    dispatch_once(&reuseIdentifier_onceToken, block);
  return (id)reuseIdentifier_reuseIdentifier;
}

void __58__EKUIAutocompleteOccurrenceTableViewCell_reuseIdentifier__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reuseIdentifier_reuseIdentifier;
  reuseIdentifier_reuseIdentifier = v1;

}

- (EKUIAutocompleteOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIAutocompleteOccurrenceTableViewCell *v4;
  EKUIAutocompleteOccurrenceTableViewCell *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *colorDotView;
  void *v10;
  uint64_t v11;
  UILabel *titleTextLabel;
  void *v13;
  uint64_t v14;
  UILabel *locationTextLabel;
  void *v16;
  uint64_t v17;
  UILabel *timeTextLabelWithThisTimeZone;
  void *v19;
  uint64_t v20;
  UILabel *timeTextLabelWithResultTimeZone;
  void *v22;
  uint64_t v23;
  UILabel *inviteesTextLabel;
  void *v25;
  uint64_t v26;
  UILabel *foundInTextLabel;
  void *v28;
  uint64_t v29;
  NSArray *secondaryLabels;
  objc_super v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)EKUIAutocompleteOccurrenceTableViewCell;
  v4 = -[EKUIAutocompleteSearchResultBaseCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUITableViewCell setDrawsOwnRowSeparators:](v4, "setDrawsOwnRowSeparators:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell setRowSeparatorColor:](v5, "setRowSeparatorColor:", v6);

    -[EKUITableViewCell setUsesInsetMargin:](v5, "setUsesInsetMargin:", 0);
    EKHalfSystemGroupedBackgroundColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAutocompleteOccurrenceTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    colorDotView = v5->_colorDotView;
    v5->_colorDotView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_colorDotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_colorDotView);

    -[EKUIAutocompleteSearchResultBaseCell createPrimaryLabel](v5, "createPrimaryLabel");
    v11 = objc_claimAutoreleasedReturnValue();
    titleTextLabel = v5->_titleTextLabel;
    v5->_titleTextLabel = (UILabel *)v11;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_titleTextLabel);

    -[EKUIAutocompleteSearchResultBaseCell createSecondaryLabel](v5, "createSecondaryLabel");
    v14 = objc_claimAutoreleasedReturnValue();
    locationTextLabel = v5->_locationTextLabel;
    v5->_locationTextLabel = (UILabel *)v14;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_locationTextLabel);

    -[EKUIAutocompleteSearchResultBaseCell createSecondaryLabel](v5, "createSecondaryLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    timeTextLabelWithThisTimeZone = v5->_timeTextLabelWithThisTimeZone;
    v5->_timeTextLabelWithThisTimeZone = (UILabel *)v17;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v5->_timeTextLabelWithThisTimeZone);

    -[EKUIAutocompleteSearchResultBaseCell createSecondaryLabel](v5, "createSecondaryLabel");
    v20 = objc_claimAutoreleasedReturnValue();
    timeTextLabelWithResultTimeZone = v5->_timeTextLabelWithResultTimeZone;
    v5->_timeTextLabelWithResultTimeZone = (UILabel *)v20;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v5->_timeTextLabelWithResultTimeZone);

    -[EKUIAutocompleteSearchResultBaseCell createSecondaryLabel](v5, "createSecondaryLabel");
    v23 = objc_claimAutoreleasedReturnValue();
    inviteesTextLabel = v5->_inviteesTextLabel;
    v5->_inviteesTextLabel = (UILabel *)v23;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v5->_inviteesTextLabel);

    -[EKUIAutocompleteSearchResultBaseCell createSecondaryLabel](v5, "createSecondaryLabel");
    v26 = objc_claimAutoreleasedReturnValue();
    foundInTextLabel = v5->_foundInTextLabel;
    v5->_foundInTextLabel = (UILabel *)v26;

    -[EKUIAutocompleteOccurrenceTableViewCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v5->_foundInTextLabel);

    v33[0] = v5->_locationTextLabel;
    v33[1] = v5->_timeTextLabelWithThisTimeZone;
    v33[2] = v5->_timeTextLabelWithResultTimeZone;
    v33[3] = v5->_inviteesTextLabel;
    v33[4] = v5->_foundInTextLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
    v29 = objc_claimAutoreleasedReturnValue();
    secondaryLabels = v5->_secondaryLabels;
    v5->_secondaryLabels = (NSArray *)v29;

    -[EKUIAutocompleteOccurrenceTableViewCell setLabelFonts](v5, "setLabelFonts");
    -[EKUIAutocompleteOccurrenceTableViewCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setLabelFonts
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[EKUITableViewCellWithPrimaryAndSecondaryFonts primaryTextLabelFont](self, "primaryTextLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "secondaryTextLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleTextLabel, "setFont:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_secondaryLabels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setFont:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setupConstraints
{
  void *v3;
  NSArray *ekUIAutocompleteOccurrenceTableViewCellConstraints;
  NSArray *v5;
  void *v6;
  UIImageView *colorDotView;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  UIImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *titleTextLabel;
  void *v26;
  double v27;
  void *v28;
  UILabel *v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  UILabel *v36;
  void *v37;
  NSArray *v38;
  NSArray *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (self->_ekUIAutocompleteOccurrenceTableViewCellConstraints)
  {
    -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraints:", self->_ekUIAutocompleteOccurrenceTableViewCellConstraints);

    ekUIAutocompleteOccurrenceTableViewCellConstraints = self->_ekUIAutocompleteOccurrenceTableViewCellConstraints;
    self->_ekUIAutocompleteOccurrenceTableViewCellConstraints = 0;

  }
  v5 = (NSArray *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB3718];
  colorDotView = self->_colorDotView;
  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", colorDotView, 5, 0, v8, 5, 1.0, 18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  v11 = self->_colorDotView;
  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToColorDot](self, "verticalSpacingTopToColorDot");
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 3, 0, v12, 3, 1.0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  v16 = self->_colorDotView;
  -[UIImageView image](v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 7, 0, 0, 0, 1.0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3718];
  v21 = self->_colorDotView;
  -[UIImageView image](v21, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 8, 0, 0, 0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3718];
  titleTextLabel = self->_titleTextLabel;
  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToBaselineForTopLabel](self, "verticalSpacingTopToBaselineForTopLabel");
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleTextLabel, 11, 0, v26, 3, 1.0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v5, "addObject:", v28);

  -[EKUIAutocompleteOccurrenceTableViewCell _addConstraintsForLabel:belowView:toArray:](self, "_addConstraintsForLabel:belowView:toArray:", self->_titleTextLabel, 0, v5);
  v29 = self->_titleTextLabel;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = self->_secondaryLabels;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v35, "isHidden", (_QWORD)v40) & 1) == 0)
        {
          -[EKUIAutocompleteOccurrenceTableViewCell _addConstraintsForLabel:belowView:toArray:](self, "_addConstraintsForLabel:belowView:toArray:", v35, v29, v5);
          v36 = v35;

          v29 = v36;
        }
      }
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v32);
  }

  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addConstraints:", v5);

  v38 = self->_ekUIAutocompleteOccurrenceTableViewCellConstraints;
  self->_ekUIAutocompleteOccurrenceTableViewCellConstraints = v5;
  v39 = v5;

}

- (void)_addConstraintsForLabel:(id)a3 belowView:(id)a4 toArray:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 5, 0, self->_colorDotView, 6, 1.0, 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteOccurrenceTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 6, 0, v12, 6, 1.0, -v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  if (v8)
  {
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToBaselineForBottomLabel](self, "verticalSpacingTopToBaselineForBottomLabel");
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 11, 0, v8, 11, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

  }
}

+ (id)_titleStringForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "source") == 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Maybe: %@"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_locationStringForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CAA030];
  objc_msgSend(v3, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deserializeConference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "joinMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "joinMethods");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isBroadcast");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLocationWithoutPrediction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "displayLocationWithoutPrediction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  objc_msgSend(v3, "notes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "notes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  objc_msgSend(v3, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v21);

  }
  objc_msgSend(MEMORY[0x1E0D0C288], "conferenceURLFromSources:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D0CD88];
  objc_msgSend(v3, "displayLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLocationWithoutPrediction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v27 = v10;
  else
    v27 = v22;
  objc_msgSend(v23, "locationStringForLocation:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:", v24, v25, v26, v27, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)_foundInStringForResult:(id)a3 pasteboardEvent:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "foundInBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (v4)
    {
      v11 = (void *)MEMORY[0x1E0DC12B0];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.clipboard"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textAttachmentWithImage:", v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CB3498]);
      EventKitUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ From clipboard"), &stru_1E601DFA8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithString:", v15);

      objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v16, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (!v6)
  {
    v17 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "Unable to find bundle for id %@, %@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  objc_msgSend(v6, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0CE20], "brandedOriginDescriptionStringWithAppName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);

LABEL_6:
LABEL_11:

  return v10;
}

+ (BOOL)_shouldShowOtherTimeZoneForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((objc_msgSend(v3, "allDay") & 1) != 0
    || (objc_msgSend(v3, "timeZone"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((CUIKShouldShowTimezoneClarification() & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CUIKShouldShowTimezoneClarification();

    }
  }

  return v7;
}

+ (id)_timeStringForResult:(id)a3 usingTimeZone:(id)a4
{
  _BOOL8 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a4 != 0;
  v6 = a4;
  v7 = a3;
  +[EKStringFactory sharedInstance](EKStringFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "allDay");

  objc_msgSend(v8, "dateStringForSuggestedEventWithStartDate:endDate:timeZone:allDay:showTimeZone:", v9, v10, v6, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_inviteeStringForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D0CD80];
  objc_msgSend(a3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inviteeStringForAttendees:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateWithResult:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIColor *v8;
  UIColor *eventCalendarColor;
  void *v10;
  void *v11;
  void *v12;
  NSString **p_eventTitle;
  NSString *eventTitle;
  void *v15;
  NSAttributedString **p_eventLocation;
  NSAttributedString *eventLocation;
  void *v18;
  NSString **p_eventTimeWithThisTimeZone;
  NSString *eventTimeWithThisTimeZone;
  void *v21;
  void *v22;
  void *v23;
  NSString **p_eventTimeWithResultTimeZone;
  NSString *eventTimeWithResultTimeZone;
  void *v26;
  NSString **p_eventInvitees;
  NSString *eventInvitees;
  void *v29;
  NSAttributedString **p_eventFoundIn;
  NSAttributedString *eventFoundIn;
  id v32;
  id v33;

  v32 = a3;
  v4 = objc_msgSend(v32, "source");
  if (v4 == 4)
  {
    objc_msgSend(v32, "pasteboardResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
  }
  else
  {
    v7 = v32;
  }
  v33 = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(v7, "calendarColor"));
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  if (self->_eventCalendarColor != v8)
  {
    objc_storeStrong((id *)&self->_eventCalendarColor, v8);
    eventCalendarColor = self->_eventCalendarColor;
    -[UILabel font](self->_titleTextLabel, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ScaledCalendarColorDotImageForColor_SuggestedEvent((uint64_t)eventCalendarColor, (uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_colorDotView, "setImage:", v11);

  }
  objc_msgSend((id)objc_opt_class(), "_titleStringForResult:", v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  p_eventTitle = &self->_eventTitle;
  eventTitle = self->_eventTitle;
  if (!eventTitle)
  {
    if (objc_msgSend(v12, "length"))
      goto LABEL_10;
    eventTitle = *p_eventTitle;
  }
  if (!-[NSString isEqualToString:](eventTitle, "isEqualToString:", v12))
  {
LABEL_10:
    objc_storeStrong((id *)&self->_eventTitle, v12);
    -[UILabel setText:](self->_titleTextLabel, "setText:", *p_eventTitle);
  }
  objc_msgSend((id)objc_opt_class(), "_locationStringForResult:", v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_eventLocation = &self->_eventLocation;
  eventLocation = self->_eventLocation;
  if (!eventLocation)
  {
    if (objc_msgSend(v15, "length"))
      goto LABEL_15;
    eventLocation = *p_eventLocation;
  }
  if (!-[NSAttributedString isEqualToAttributedString:](eventLocation, "isEqualToAttributedString:", v15))
  {
LABEL_15:
    objc_storeStrong((id *)&self->_eventLocation, v15);
    -[UILabel setAttributedText:](self->_locationTextLabel, "setAttributedText:", v15);
  }
  -[UILabel setHidden:](self->_locationTextLabel, "setHidden:", *p_eventLocation == 0);
  objc_msgSend((id)objc_opt_class(), "_timeStringForResult:usingTimeZone:", v33, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  p_eventTimeWithThisTimeZone = &self->_eventTimeWithThisTimeZone;
  eventTimeWithThisTimeZone = self->_eventTimeWithThisTimeZone;
  if (!eventTimeWithThisTimeZone)
  {
    if (objc_msgSend(v18, "length"))
      goto LABEL_20;
    eventTimeWithThisTimeZone = *p_eventTimeWithThisTimeZone;
  }
  if (!-[NSString isEqualToString:](eventTimeWithThisTimeZone, "isEqualToString:", v18))
  {
LABEL_20:
    objc_storeStrong((id *)&self->_eventTimeWithThisTimeZone, v18);
    -[UILabel setText:](self->_timeTextLabelWithThisTimeZone, "setText:", v18);
  }
  -[UILabel setHidden:](self->_timeTextLabelWithThisTimeZone, "setHidden:", *p_eventTimeWithThisTimeZone == 0);
  if (!objc_msgSend((id)objc_opt_class(), "_shouldShowOtherTimeZoneForResult:", v33))
  {
    -[UILabel setHidden:](self->_timeTextLabelWithResultTimeZone, "setHidden:", 1);
    goto LABEL_29;
  }
  v21 = (void *)objc_opt_class();
  objc_msgSend(v33, "timeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_timeStringForResult:usingTimeZone:", v33, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  p_eventTimeWithResultTimeZone = &self->_eventTimeWithResultTimeZone;
  eventTimeWithResultTimeZone = self->_eventTimeWithResultTimeZone;
  if (eventTimeWithResultTimeZone)
  {
LABEL_23:
    if (-[NSString isEqualToString:](eventTimeWithResultTimeZone, "isEqualToString:", v23))
      goto LABEL_28;
    goto LABEL_27;
  }
  if (!objc_msgSend(v23, "length"))
  {
    eventTimeWithResultTimeZone = *p_eventTimeWithResultTimeZone;
    goto LABEL_23;
  }
LABEL_27:
  objc_storeStrong((id *)&self->_eventTimeWithResultTimeZone, v23);
  -[UILabel setText:](self->_timeTextLabelWithResultTimeZone, "setText:", v23);
LABEL_28:
  -[UILabel setHidden:](self->_timeTextLabelWithResultTimeZone, "setHidden:", *p_eventTimeWithResultTimeZone == 0);

LABEL_29:
  objc_msgSend((id)objc_opt_class(), "_inviteeStringForResult:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  p_eventInvitees = &self->_eventInvitees;
  eventInvitees = self->_eventInvitees;
  if (!eventInvitees)
  {
    if (objc_msgSend(v26, "length"))
      goto LABEL_33;
    eventInvitees = *p_eventInvitees;
  }
  if (!-[NSString isEqualToString:](eventInvitees, "isEqualToString:", v26))
  {
LABEL_33:
    objc_storeStrong((id *)&self->_eventInvitees, v26);
    -[UILabel setText:](self->_inviteesTextLabel, "setText:", v26);
  }
  -[UILabel setHidden:](self->_inviteesTextLabel, "setHidden:", *p_eventInvitees == 0);
  objc_msgSend((id)objc_opt_class(), "_foundInStringForResult:pasteboardEvent:", v33, v4 == 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  p_eventFoundIn = &self->_eventFoundIn;
  eventFoundIn = self->_eventFoundIn;
  if (eventFoundIn)
    goto LABEL_35;
  if (!objc_msgSend(v29, "length"))
  {
    eventFoundIn = *p_eventFoundIn;
LABEL_35:
    if (-[NSAttributedString isEqualToAttributedString:](eventFoundIn, "isEqualToAttributedString:", v29))
      goto LABEL_39;
  }
  objc_storeStrong((id *)&self->_eventFoundIn, v29);
  -[UILabel setAttributedText:](self->_foundInTextLabel, "setAttributedText:", *p_eventFoundIn);
LABEL_39:
  -[UILabel setHidden:](self->_foundInTextLabel, "setHidden:", *p_eventFoundIn == 0);
  -[EKUIAutocompleteOccurrenceTableViewCell setupConstraints](self, "setupConstraints");

}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v6 = a3;
  v7 = objc_msgSend(v6, "source");
  if (v7 == 4)
  {
    objc_msgSend(v6, "pasteboardResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_msgSend(a1, "primaryTextLabelFontForWidth:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryTextLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_locationStringForResult:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_timeStringForResult:usingTimeZone:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 1;
  if (v12)
    v14 = 2;
  if (v13)
    v15 = v14;
  else
    v15 = v12 != 0;
  if (objc_msgSend(a1, "_shouldShowOtherTimeZoneForResult:", v6))
  {
    objc_msgSend(v6, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_timeStringForResult:usingTimeZone:", v6, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      ++v15;
  }
  v18 = v7 == 4;
  objc_msgSend(a1, "_inviteeStringForResult:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v15 + 1;
  else
    v20 = v15;
  objc_msgSend(a1, "_foundInStringForResult:pasteboardEvent:", v6, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v22 = v20 + 1;
  else
    v22 = v20;
  objc_msgSend(a1, "verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:", v10);
  v24 = v23;
  objc_msgSend(a1, "verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:", v10);
  v26 = v24 + v25;
  objc_msgSend(a1, "verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:", v11);
  v28 = v26 + (double)v22 * v27;
  objc_msgSend(a1, "rowSeparatorThickness");
  CalRoundToScreenScale(v28 + v29);
  v31 = v30;

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekUIAutocompleteOccurrenceTableViewCellConstraints, 0);
  objc_storeStrong((id *)&self->_eventFoundIn, 0);
  objc_storeStrong((id *)&self->_eventInvitees, 0);
  objc_storeStrong((id *)&self->_eventTimeWithResultTimeZone, 0);
  objc_storeStrong((id *)&self->_eventTimeWithThisTimeZone, 0);
  objc_storeStrong((id *)&self->_eventLocation, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventCalendarColor, 0);
  objc_storeStrong((id *)&self->_secondaryLabels, 0);
  objc_storeStrong((id *)&self->_foundInTextLabel, 0);
  objc_storeStrong((id *)&self->_inviteesTextLabel, 0);
  objc_storeStrong((id *)&self->_timeTextLabelWithResultTimeZone, 0);
  objc_storeStrong((id *)&self->_timeTextLabelWithThisTimeZone, 0);
  objc_storeStrong((id *)&self->_locationTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
  objc_storeStrong((id *)&self->_colorDotView, 0);
}

@end
