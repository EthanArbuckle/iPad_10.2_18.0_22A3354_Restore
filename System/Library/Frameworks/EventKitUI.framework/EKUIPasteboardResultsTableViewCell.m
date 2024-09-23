@implementation EKUIPasteboardResultsTableViewCell

+ (id)reuseIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__EKUIPasteboardResultsTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_0 != -1)
    dispatch_once(&reuseIdentifier_onceToken_0, block);
  return (id)reuseIdentifier_reuseIdentifier_0;
}

void __53__EKUIPasteboardResultsTableViewCell_reuseIdentifier__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;
  reuseIdentifier_reuseIdentifier_0 = v1;

}

- (EKUIPasteboardResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIPasteboardResultsTableViewCell *v4;
  EKUIPasteboardResultsTableViewCell *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *eventCalendarColors;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *eventTitles;
  NSMutableArray *v16;
  void *v17;
  uint64_t v18;
  UILabel *aggregateTextLabel;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *colorDotViews;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *titleTextLabels;
  void *v29;
  void *v30;
  uint64_t v31;
  UILabel *xMoreLabel;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)EKUIPasteboardResultsTableViewCell;
  v4 = -[EKUIAutocompleteSearchResultBaseCell initWithStyle:reuseIdentifier:](&v35, sel_initWithStyle_reuseIdentifier_, a3, a4);
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
    -[EKUIPasteboardResultsTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = 4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v9 = objc_claimAutoreleasedReturnValue();
    eventCalendarColors = v5->_eventCalendarColors;
    v5->_eventCalendarColors = (NSMutableArray *)v9;

    do
    {
      v11 = v5->_eventCalendarColors;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v11, "addObject:", v12);

      --v8;
    }
    while (v8);
    v13 = 4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v14 = objc_claimAutoreleasedReturnValue();
    eventTitles = v5->_eventTitles;
    v5->_eventTitles = (NSMutableArray *)v14;

    do
    {
      v16 = v5->_eventTitles;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E601DFA8);
      -[NSMutableArray addObject:](v16, "addObject:", v17);

      --v13;
    }
    while (v13);
    -[EKUIAutocompleteSearchResultBaseCell createPrimaryLabel](v5, "createPrimaryLabel");
    v18 = objc_claimAutoreleasedReturnValue();
    aggregateTextLabel = v5->_aggregateTextLabel;
    v5->_aggregateTextLabel = (UILabel *)v18;

    -[EKUIPasteboardResultsTableViewCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v5->_aggregateTextLabel);

    v21 = 4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v22 = objc_claimAutoreleasedReturnValue();
    colorDotViews = v5->_colorDotViews;
    v5->_colorDotViews = (NSMutableArray *)v22;

    do
    {
      v24 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[EKUIPasteboardResultsTableViewCell contentView](v5, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v24);

      -[NSMutableArray addObject:](v5->_colorDotViews, "addObject:", v24);
      --v21;
    }
    while (v21);
    v26 = 4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v27 = objc_claimAutoreleasedReturnValue();
    titleTextLabels = v5->_titleTextLabels;
    v5->_titleTextLabels = (NSMutableArray *)v27;

    do
    {
      -[EKUIAutocompleteSearchResultBaseCell createPrimaryLabel](v5, "createPrimaryLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPasteboardResultsTableViewCell contentView](v5, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v29);

      -[NSMutableArray addObject:](v5->_titleTextLabels, "addObject:", v29);
      --v26;
    }
    while (v26);
    -[EKUIAutocompleteSearchResultBaseCell createPrimaryLabel](v5, "createPrimaryLabel");
    v31 = objc_claimAutoreleasedReturnValue();
    xMoreLabel = v5->_xMoreLabel;
    v5->_xMoreLabel = (UILabel *)v31;

    -[EKUIPasteboardResultsTableViewCell contentView](v5, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v5->_xMoreLabel);

    -[EKUIPasteboardResultsTableViewCell setLabelFonts](v5, "setLabelFonts");
    -[EKUIPasteboardResultsTableViewCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setLabelFonts
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
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
  -[UILabel setFont:](self->_aggregateTextLabel, "setFont:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_titleTextLabels;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[UILabel setFont:](self->_xMoreLabel, "setFont:", v4);
}

- (void)setupConstraints
{
  NSArray *cellConstraints;
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
  uint64_t i;
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
  double v48;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;

  if (self->_cellConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    cellConstraints = self->_cellConstraints;
    self->_cellConstraints = 0;

  }
  v71 = 1144;
  v4 = (void *)objc_opt_new();
  -[UILabel leadingAnchor](self->_aggregateTextLabel, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPasteboardResultsTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  -[UILabel trailingAnchor](self->_aggregateTextLabel, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPasteboardResultsTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  -[UILabel firstBaselineAnchor](self->_aggregateTextLabel, "firstBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPasteboardResultsTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToBaselineForTopLabel](self, "verticalSpacingTopToBaselineForTopLabel");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v18);

  -[UILabel leadingAnchor](self->_xMoreLabel, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  -[UILabel trailingAnchor](self->_xMoreLabel, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v26);

  -[UILabel firstBaselineAnchor](self->_xMoreLabel, "firstBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v30);

  for (i = 0; i != 4; ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", i, v71);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", i);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPasteboardResultsTableViewCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if ((i & 1) != 0)
    {
      objc_msgSend(v36, "centerXAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:constant:", v38, 4.0);
    }
    else
    {
      objc_msgSend(v36, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v38);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v39);

    objc_msgSend(v32, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v42);

    objc_msgSend(v32, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "image");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "size");
    objc_msgSend(v43, "constraintEqualToConstant:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    objc_msgSend(v32, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "size");
    objc_msgSend(v46, "constraintEqualToConstant:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v49);

    objc_msgSend(v33, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPasteboardResultsTableViewCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layoutMarginsGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if ((i & 1) != 0)
    {
      objc_msgSend(v52, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v65);

      objc_msgSend(v33, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "trailingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, 12.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v69);

      objc_msgSend(v33, "firstBaselineAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (i != 1)
      {
LABEL_9:
        -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", i - 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "lastBaselineAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToBaselineForBottomLabel](self, "verticalSpacingTopToBaselineForBottomLabel");
        objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v63);

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v52, "centerXAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v54, -4.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v55);

      objc_msgSend(v33, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 12.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v59);

      objc_msgSend(v33, "firstBaselineAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (i)
        goto LABEL_9;
    }
    -[UILabel lastBaselineAnchor](self->_aggregateTextLabel, "lastBaselineAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAutocompleteSearchResultBaseCell verticalSpacingTopToBaselineForBottomLabel](self, "verticalSpacingTopToBaselineForBottomLabel");
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v62);
LABEL_12:

  }
  v70 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71) = (Class)v4;
  v72 = v4;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71));
}

+ (id)_aggregateTitleStringForAggregateResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;
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

  v3 = (void *)MEMORY[0x1E0DC12B0];
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = a3;
  objc_msgSend(v4, "systemImageNamed:", CFSTR("doc.on.clipboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttachmentWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("multiple_events_from_pasteboard"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3498];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("%@ %@"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
  objc_msgSend(v14, "localizedAttributedStringWithFormat:", v15, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_titleStringForResult:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3498];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);
  return v7;
}

- (void)updateWithResult:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
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
  char v26;
  void *v27;
  void *v28;
  UILabel *xMoreLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  objc_msgSend(v37, "pasteboardResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v35 = v5;
  if (v5 <= 4)
  {
    objc_msgSend(v37, "pasteboardResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v36 = v8;
    v6 = 4 - v8;
  }
  else
  {
    v6 = 0;
    v36 = 3;
  }
  objc_msgSend((id)objc_opt_class(), "_aggregateTitleStringForAggregateResult:", v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSAttributedString isEqualToAttributedString:](self->_aggregateTitle, "isEqualToAttributedString:", v9))
  {
    objc_storeStrong((id *)&self->_aggregateTitle, v9);
    -[UILabel setAttributedText:](self->_aggregateTextLabel, "setAttributedText:", self->_aggregateTitle);
  }
  if (v6 >= 1)
  {
    v10 = 0;
    v11 = -v6;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", v10 + 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", v10 + 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      --v10;
    }
    while (v11 != v10);
  }
  if (v36 >= 1)
  {
    for (i = 0; i != v36; ++i)
    {
      objc_msgSend(v37, "pasteboardResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(v16, "calendarColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventCalendarColors, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 != v17)
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_eventCalendarColors, "setObject:atIndexedSubscript:", v17, i);
        -[NSMutableArray objectAtIndexedSubscript:](self->_eventCalendarColors, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "font");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ScaledCalendarColorDotImageForColor_SuggestedEvent((uint64_t)v19, (uint64_t)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setImage:", v22);

      }
      objc_msgSend((id)objc_opt_class(), "_titleStringForResult:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventTitles, "objectAtIndexedSubscript:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToAttributedString:", v24);

      if ((v26 & 1) == 0)
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_eventTitles, "setObject:atIndexedSubscript:", v24, i);
        -[NSMutableArray objectAtIndexedSubscript:](self->_eventTitles, "objectAtIndexedSubscript:", i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_titleTextLabels, "objectAtIndexedSubscript:", i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAttributedText:", v27);

      }
    }
  }
  xMoreLabel = self->_xMoreLabel;
  if (v35 <= 4)
  {
    -[UILabel setHidden:](xMoreLabel, "setHidden:", 1);
  }
  else
  {
    -[UILabel setHidden:](xMoreLabel, "setHidden:", 0);
    v30 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("and %d more"), &stru_1E601DFA8, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pasteboardResults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringWithFormat:", v32, objc_msgSend(v33, "count") - v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_xMoreLabel, "setText:", v34);

  }
  -[EKUIPasteboardResultsTableViewCell setupConstraints](self, "setupConstraints");

}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = a3;
  objc_msgSend(a1, "primaryTextLabelFontForWidth:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryTextLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pasteboardResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = 4;
  if (v10 < 4)
    v11 = v10;
  v12 = ceil((double)v11 * 0.5);
  objc_msgSend(a1, "verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:", v7);
  v14 = v13;
  objc_msgSend(a1, "verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:", v7);
  v16 = v14 + v15;
  objc_msgSend(a1, "verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:", v8);
  v18 = v16 + (double)(uint64_t)v12 * v17;
  objc_msgSend(a1, "rowSeparatorThickness");
  CalRoundToScreenScale(v19 + v18);
  v21 = v20;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_eventTitles, 0);
  objc_storeStrong((id *)&self->_eventCalendarColors, 0);
  objc_storeStrong((id *)&self->_aggregateTitle, 0);
  objc_storeStrong((id *)&self->_xMoreLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabels, 0);
  objc_storeStrong((id *)&self->_colorDotViews, 0);
  objc_storeStrong((id *)&self->_aggregateTextLabel, 0);
}

@end
