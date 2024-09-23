@implementation MUPlaceHoursSectionView

- (MUPlaceHoursSectionView)initWithSectionViewConfiguration:(id)a3
{
  id v5;
  MUPlaceHoursSectionView *v6;
  MUPlaceHoursSectionView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceHoursSectionView;
  v6 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v9, sel_initWithShowsSeparators_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionViewConfiguration, a3);
    -[MUPlaceHoursSectionView _setupViews](v7, "_setupViews");
    -[MUPlaceVerticalCardContainerView setDelegate:](v7, "setDelegate:", v7);
  }

  return v7;
}

- (void)_setupViews
{
  id v3;
  void *v4;
  MUExpandableHoursView *v5;
  void *v6;
  MUExpandableHoursView *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  MUExpandableHoursView *v14;
  NSArray *v15;
  NSArray *v16;
  MULabelViewProtocol *v17;
  MULabelViewProtocol *moreLabel;
  void *v19;
  void *v20;
  void *v21;
  MUPlaceSectionRowView *v22;
  MUPlaceSectionRowView *v23;
  MUPlaceSectionRowView *moreRowView;
  NSArray *hoursViews;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceHoursSectionViewConfiguration placeHours](self->_sectionViewConfiguration, "placeHours");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [MUExpandableHoursView alloc];
    -[MUPlaceHoursSectionViewConfiguration placeHours](self->_sectionViewConfiguration, "placeHours");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUExpandableHoursView initWithBusinessHoursConfiguration:](v5, "initWithBusinessHoursConfiguration:", v6);

    -[MUExpandableHoursView setDelegate:](v7, "setDelegate:", self);
    objc_msgSend(v3, "addObject:", v7);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[MUPlaceHoursSectionViewConfiguration serviceHoursList](self->_sectionViewConfiguration, "serviceHoursList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v9)
  {

    v33 = (NSArray *)objc_msgSend(v3, "copy");
    hoursViews = self->_hoursViews;
    self->_hoursViews = v33;
    goto LABEL_15;
  }
  v10 = v9;
  v43 = v3;
  v41 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v45 != v12)
        objc_enumerationMutation(v8);
      v14 = -[MUExpandableHoursView initWithBusinessHoursConfiguration:]([MUExpandableHoursView alloc], "initWithBusinessHoursConfiguration:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      -[MUExpandableHoursView setDelegate:](v14, "setDelegate:", self);
      objc_msgSend(v43, "addObject:", v14);
      if (v11 + i >= -[MUPlaceHoursSectionViewConfiguration numberOfInlineServiceHours](self->_sectionViewConfiguration, "numberOfInlineServiceHours"))
      {
        v41 = 1;
        -[MUExpandableHoursView setHidden:](v14, "setHidden:", 1);
      }

    }
    v11 += v10;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v10);

  v3 = v43;
  v15 = (NSArray *)objc_msgSend(v43, "copy");
  v16 = self->_hoursViews;
  self->_hoursViews = v15;

  if ((v41 & 1) != 0)
  {
    +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
    v17 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
    moreLabel = self->_moreLabel;
    self->_moreLabel = v17;

    -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_moreLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _MULocalizedStringFromThisBundle(CFSTR("More [Hours]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setText:](self->_moreLabel, "setText:", v19);

    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_moreLabel, "setTextColor:", v20);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setFont:](self->_moreLabel, "setFont:", v21);

    -[MULabelViewProtocol setAdjustsFontForContentSizeCategory:](self->_moreLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v22 = [MUPlaceSectionRowView alloc];
    v23 = -[MUPlaceSectionRowView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MUPlaceSectionRowView setHandlesHighlighting:](v23, "setHandlesHighlighting:", 1);
    -[MUPlaceSectionRowView addSubview:](v23, "addSubview:", self->_moreLabel);
    moreRowView = self->_moreRowView;
    self->_moreRowView = v23;
    hoursViews = v23;

    v3 = v43;
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[MULabelViewProtocol leadingAnchor](self->_moreLabel, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray leadingAnchor](hoursViews, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, 16.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v39;
    -[MULabelViewProtocol topAnchor](self->_moreLabel, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray topAnchor](hoursViews, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 11.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v35;
    -[MULabelViewProtocol bottomAnchor](self->_moreLabel, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray bottomAnchor](hoursViews, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -11.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v28;
    -[MULabelViewProtocol trailingAnchor](self->_moreLabel, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray trailingAnchor](hoursViews, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -16.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v32);

    objc_msgSend(v43, "addObject:", hoursViews);
LABEL_15:

  }
  v34 = (void *)objc_msgSend(v3, "copy");
  -[MUPlaceVerticalCardContainerView setRowViews:](self, "setRowViews:", v34);

}

- (void)_performExpansion
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MUPlaceHoursSectionView__performExpansion__block_invoke;
  v6[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __44__MUPlaceHoursSectionView__performExpansion__block_invoke_2;
  v4[3] = &unk_1E2E01A10;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v4, 0.200000003);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__MUPlaceHoursSectionView__performExpansion__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(WeakRetained, "arrangedSubviews", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHidden:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    objc_msgSend(v2[59], "setHidden:", 1);
  }

}

void __44__MUPlaceHoursSectionView__performExpansion__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "removeArrangedSubview:", WeakRetained[59]);
    WeakRetained = v2;
  }

}

- (void)layoutSubviews
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceHoursSectionView;
  -[MUPlaceHoursSectionView layoutSubviews](&v4, sel_layoutSubviews);
  -[MUPlaceHoursSectionView _recalculateStackingIfNeeded](self, "_recalculateStackingIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceHoursSectionView;
  -[MUPlaceHoursSectionView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_recalculateStackingIfNeeded
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_hoursViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MUPlaceHoursSectionView bounds](self, "bounds");
        if ((objc_msgSend(v7, "shouldStackForProposedWidth:", CGRectGetWidth(v24)) & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_hoursViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "setStacked:", v4, (_QWORD)v13);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  if (self->_moreRowView == a4)
    -[MUPlaceHoursSectionView _performExpansion](self, "_performExpansion", a3);
}

- (void)expandableHoursViewDidExpand:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[NSArray indexOfObject:](self->_hoursViews, "indexOfObject:");
  if (v4 < -[NSArray count](self->_hoursViews, "count"))
  {
    objc_msgSend(v7, "hoursConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHoursSectionView expandDelegate](self, "expandDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hoursSectionView:didExpand:forConfiguration:", self, objc_msgSend(v7, "isExpanded"), v5);

  }
}

- (MUPlaceHoursSectionViewDelegate)expandDelegate
{
  return (MUPlaceHoursSectionViewDelegate *)objc_loadWeakRetained((id *)&self->_expandDelegate);
}

- (void)setExpandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expandDelegate, a3);
}

- (MUPlaceHoursSectionViewConfiguration)sectionViewConfiguration
{
  return self->_sectionViewConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_expandDelegate);
  objc_storeStrong((id *)&self->_hoursViews, 0);
  objc_storeStrong((id *)&self->_moreRowView, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
}

@end
