@implementation MUExpandableHoursView

- (MUExpandableHoursView)initWithBusinessHoursConfiguration:(id)a3
{
  id v5;
  MUExpandableHoursView *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUExpandableHoursView;
  v6 = -[MUPlaceSectionRowView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    MUGetMUExpandableHoursViewLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUExpandableHoursViewInit", ", v10, 2u);
    }

    objc_storeStrong((id *)&v6->_config, a3);
    v6->_expanded = 0;
    -[MUExpandableHoursView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("ExpandableHours"));
    -[MUExpandableHoursView _buildDayRowViewModels](v6, "_buildDayRowViewModels");
    -[MUExpandableHoursView _setupStackView](v6, "_setupStackView");
    -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](v6, "_mapsui_addSelectGestureRecognizerWithTarget:action:", v6->_hoursSummaryView, sel_expandButtonTapped);
    MUGetMUExpandableHoursViewLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUExpandableHoursViewInit", ", v10, 2u);
    }

  }
  return v6;
}

- (void)_buildDayRowViewModels
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  MUDayRowViewModel *v24;
  MUDayRowViewModel *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *dayRowViewModels;
  id obj;
  uint64_t v35;
  MUExpandableHoursView *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v36 = self;
  -[MUBusinessHoursConfiguration businessHours](self->_config, "businessHours");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v37)
  {
    v38 = 1;
    v35 = *(_QWORD *)v43;
    v4 = 0x1E0CC1000uLL;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(obj);
        v40 = v5;
        v6 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v5);
        v41 = &stru_1E2E05448;
        if (objc_msgSend(v6, "hoursType") != v38)
        {
          v38 = objc_msgSend(v6, "hoursType");
          v7 = objc_msgSend(v6, "hoursType");
          if (v7 == 2)
          {
            objc_msgSend(v6, "localizedMessage");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              goto LABEL_12;
            objc_msgSend(*(id *)(v4 + 2592), "localizedHoursDayRangeString:", v6);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              v12 = v10;
            }
            else
            {
              objc_msgSend(*(id *)(v4 + 2592), "localizedHoursStringSpecialHours");
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v41 = v12;

LABEL_18:
            v9 = 0;
          }
          else
          {
            if (v7 != 1)
            {
              v41 = &stru_1E2E05448;
              goto LABEL_20;
            }
            objc_msgSend(v6, "localizedMessage");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v8)
            {
              objc_msgSend(*(id *)(v4 + 2592), "localizedHoursStringNormalHours");
              v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_18;
            }
LABEL_12:
            v9 = v8;
            v41 = v9;
          }

        }
LABEL_20:
        v13 = objc_alloc(*(Class *)(v4 + 2592));
        -[MUBusinessHoursConfiguration placeTimeZone](v36->_config, "placeTimeZone");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithBusinessHours:timeZone:localizedHoursStringOptions:", v6, v14, 2);

        objc_msgSend(v15, "operatingHours");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "placeDailyHours");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "formatData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DaysShort"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DaysFull"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HoursFull"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v18;
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SingularWeekdayIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          v23 = 0;
          do
          {
            v24 = objc_alloc_init(MUDayRowViewModel);
            v25 = v24;
            if (!v23)
              -[MUDayRowViewModel setLabelHeaderString:](v24, "setLabelHeaderString:", v41);
            objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "BOOLValue");

            if (v27)
              v28 = v20;
            else
              v28 = v19;
            objc_msgSend(v28, "objectAtIndexedSubscript:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUDayRowViewModel setDayString:](v25, "setDayString:", v29);

            objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUDayRowViewModel setHourStrings:](v25, "setHourStrings:", v30);

            objc_msgSend(v15, "AMPMSymbols");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUDayRowViewModel setAMPMStrings:](v25, "setAMPMStrings:", v31);

            objc_msgSend(v3, "addObject:", v25);
            ++v23;
          }
          while (v23 < objc_msgSend(v19, "count"));
        }

        v5 = v40 + 1;
        v4 = 0x1E0CC1000;
      }
      while (v40 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v37);
  }

  v32 = objc_msgSend(v3, "copy");
  dayRowViewModels = v36->_dayRowViewModels;
  v36->_dayRowViewModels = (NSArray *)v32;

}

- (void)_createDayRowViewsIfNeeded
{
  NSArray *v3;
  NSArray *dayRowViews;

  if (!self->_dayRowViews)
  {
    MUMap(self->_dayRowViewModels, &__block_literal_global_30);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dayRowViews = self->_dayRowViews;
    self->_dayRowViews = v3;

  }
}

MUDayRowView *__51__MUExpandableHoursView__createDayRowViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MUDayRowView *v3;

  v2 = a2;
  v3 = -[MUDayRowView initWithViewModel:]([MUDayRowView alloc], "initWithViewModel:", v2);

  return v3;
}

- (void)_addDayRowViewsToStackViewIfNeeded
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MUStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", self->_dayRowViews);

  if ((v4 & 1) == 0)
  {
    -[MUExpandableHoursView _createDayRowViewsIfNeeded](self, "_createDayRowViewsIfNeeded");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_dayRowViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          v10 = v7;
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[MUStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", v11);
          objc_msgSend(v11, "viewModel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "labelHeaderString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v10)
          {
            if (v14)
              -[MUStackView setCustomSpacing:afterView:](self->_contentStackView, "setCustomSpacing:afterView:", v10, 12.0);
          }
          v7 = v11;

          objc_msgSend(v7, "widthAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUStackView widthAnchor](self->_contentStackView, "widthAnchor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "constraintEqualToAnchor:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setActive:", 1);

          objc_msgSend(v7, "setHidden:", 1);
          objc_msgSend(v7, "layoutIfNeeded");
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
}

- (void)_setupStackView
{
  MUStackView *v3;
  MUStackView *v4;
  MUStackView *contentStackView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MUHoursSummaryViewModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MUHoursSummaryView *v20;
  MUHoursSummaryView *hoursSummaryView;
  MUHoursSummaryView *v22;
  MUStackLayout *v23;
  void *v24;
  MUStackLayout *v25;
  MUStackLayout **p_summaryAndHoursStackLayout;
  MUStackLayout *summaryAndHoursStackLayout;
  MUStackView *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id location;
  MUStackLayout *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  -[MUExpandableHoursView setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[MUExpandableHoursView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 16.0);
  v3 = [MUStackView alloc];
  v4 = -[MUStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  -[MUStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUStackView setAxis:](self->_contentStackView, "setAxis:", 1);
  -[MUStackView setAlpha:](self->_contentStackView, "setAlpha:", 0.0);
  -[MUStackView setAccessibilityIdentifier:](self->_contentStackView, "setAccessibilityIdentifier:", CFSTR("ExpandedStack"));
  v6 = objc_alloc(MEMORY[0x1E0CC1A20]);
  -[MUBusinessHoursConfiguration businessHours](self->_config, "businessHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBusinessHoursConfiguration placeTimeZone](self->_config, "placeTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithBusinessHours:timeZone:localizedHoursStringOptions:", v8, v9, 272);

  v11 = objc_alloc_init(MUHoursSummaryViewModel);
  -[MUBusinessHoursConfiguration hoursName](self->_config, "hoursName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryViewModel setTitleText:](v11, "setTitleText:", v12);

  objc_msgSend(v10, "AMPMSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryViewModel setAMPMSymbols:](v11, "setAMPMSymbols:", v13);

  -[MUHoursSummaryViewModel setServiceHours:](v11, "setServiceHours:", -[MUBusinessHoursConfiguration isServiceHours](self->_config, "isServiceHours"));
  -[MUHoursSummaryViewModel setHideChevron:](v11, "setHideChevron:", -[NSArray count](self->_dayRowViewModels, "count") == 0);
  if ((objc_msgSend(v10, "geoMapItemOpeningHourOptions") & 0x198) == 0)
  {
    objc_msgSend(v10, "localizedOperatingHours");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHoursSummaryViewModel setHoursText:](v11, "setHoursText:", v14);

  }
  objc_msgSend(v10, "localizedOpenState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryViewModel setOpenStateText:](v11, "setOpenStateText:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateHoursLabelColorWithDefaultLabelColor:", v16);

  objc_msgSend(v10, "hoursStateLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryViewModel setOpenStateColor:](v11, "setOpenStateColor:", v18);

  objc_msgSend(v10, "AMPMSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHoursSummaryViewModel setAMPMSymbols:](v11, "setAMPMSymbols:", v19);

  v20 = -[MUHoursSummaryView initWithViewModel:]([MUHoursSummaryView alloc], "initWithViewModel:", v11);
  hoursSummaryView = self->_hoursSummaryView;
  self->_hoursSummaryView = v20;

  -[MUHoursSummaryView setTranslatesAutoresizingMaskIntoConstraints:](self->_hoursSummaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (-[NSArray count](self->_dayRowViewModels, "count"))
  {
    objc_initWeak(&location, self);
    v22 = self->_hoursSummaryView;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __40__MUExpandableHoursView__setupStackView__block_invoke;
    v35 = &unk_1E2E01DA8;
    objc_copyWeak(&v36, &location);
    -[MUHoursSummaryView setActionHandler:](v22, "setActionHandler:", &v32);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  -[MUExpandableHoursView addSubview:](self, "addSubview:", self->_hoursSummaryView, v32, v33, v34, v35);
  -[MUExpandableHoursView addSubview:](self, "addSubview:", self->_contentStackView);
  v23 = [MUStackLayout alloc];
  -[MUExpandableHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MUStackLayout initWithContainer:axis:](v23, "initWithContainer:axis:", v24, 1);
  p_summaryAndHoursStackLayout = &self->_summaryAndHoursStackLayout;
  summaryAndHoursStackLayout = self->_summaryAndHoursStackLayout;
  self->_summaryAndHoursStackLayout = v25;

  v28 = self->_contentStackView;
  v39[0] = self->_hoursSummaryView;
  v39[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackLayout setArrangedLayoutItems:](*p_summaryAndHoursStackLayout, "setArrangedLayoutItems:", v29);

  v30 = (void *)MEMORY[0x1E0CB3718];
  v38 = *p_summaryAndHoursStackLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_mapsui_activateLayouts:", v31);

}

void __40__MUExpandableHoursView__setupStackView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setExpanded:animated:", objc_msgSend(WeakRetained, "isExpanded") ^ 1, 1);
    WeakRetained = v2;
  }

}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  if (-[MUExpandableHoursView isExpanded](self, "isExpanded", a3, a4) != a3)
  {
    -[MUExpandableHoursView setExpanded:](self, "setExpanded:", v4);
    -[MUExpandableHoursView _updateHoursVisibilityAnimated:](self, "_updateHoursVisibilityAnimated:", 1);
    -[MUExpandableHoursView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expandableHoursViewDidExpand:", self);

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v3 = *MEMORY[0x1E0DC4FF8];
  v4 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  -[MUHoursSummaryView systemLayoutSizeFittingSize:](self->_hoursSummaryView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], v4);
  v6 = v5;
  v8 = v7;
  -[MUStackView systemLayoutSizeFittingSize:](self->_contentStackView, "systemLayoutSizeFittingSize:", v3, v4);
  v11 = v10;
  if (v6 >= v9)
    v12 = v6;
  else
    v12 = v9;
  -[MUExpandableHoursView directionalLayoutMargins](self, "directionalLayoutMargins");
  v14 = v13 + v12;
  -[MUExpandableHoursView directionalLayoutMargins](self, "directionalLayoutMargins");
  v16 = v15 + v14;
  v17 = -[MUExpandableHoursView isExpanded](self, "isExpanded");
  v18 = 0.0;
  if (v17)
    v18 = v11;
  v19 = v8 + v18;
  -[MUExpandableHoursView directionalLayoutMargins](self, "directionalLayoutMargins");
  v21 = v19 + v20;
  -[MUExpandableHoursView directionalLayoutMargins](self, "directionalLayoutMargins");
  v23 = v21 + v22;
  v24 = v16;
  result.height = v23;
  result.width = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MUExpandableHoursView intrinsicContentSize](self, "intrinsicContentSize");
  if (width < v5)
    v5 = width;
  if (height < v6)
    v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateHoursVisibilityAnimated:(BOOL)a3
{
  double v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  if (a3)
    v4 = 0.300000012;
  else
    v4 = 0.0;
  objc_initWeak(&location, self);
  if (-[MUExpandableHoursView isExpanded](self, "isExpanded"))
    -[MUExpandableHoursView _addDayRowViewsToStackViewIfNeeded](self, "_addDayRowViewsToStackViewIfNeeded");
  -[MUHoursSummaryView handleAnimationStart](self->_hoursSummaryView, "handleAnimationStart");
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MUExpandableHoursView__updateHoursVisibilityAnimated___block_invoke;
  v6[3] = &unk_1E2E01AB0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "_mapsui_animateWithDuration:animations:completion:", v6, 0, v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__MUExpandableHoursView__updateHoursVisibilityAnimated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  double v10;
  int v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[60], "handleAnimation");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3[61];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8++), "setHidden:", objc_msgSend(v3, "isExpanded", (_QWORD)v13) ^ 1);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    v9 = objc_msgSend(v3, "isExpanded");
    v10 = 1.0;
    if (!v9)
      v10 = 0.0;
    objc_msgSend(v3[59], "setAlpha:", v10, (_QWORD)v13);
    v11 = objc_msgSend(v3, "isExpanded");
    v12 = 12.0;
    if (!v11)
      v12 = 0.0;
    objc_msgSend(v3[62], "setSpacing:", v12);
    objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  }

}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_dayRowViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "shouldStackForProposedWidth:", a3, (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setStacked:(BOOL)a3
{
  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    -[MUExpandableHoursView _invokeChildrenOfStackingChange](self, "_invokeChildrenOfStackingChange");
  }
}

- (void)_invokeChildrenOfStackingChange
{
  NSArray *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_dayRowViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setStacked:", self->_stacked, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (MUBusinessHoursConfiguration)hoursConfiguration
{
  return self->_config;
}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUExpandableHoursViewDelegate)delegate
{
  return (MUExpandableHoursViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dayRowViewModels, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_summaryAndHoursStackLayout, 0);
  objc_storeStrong((id *)&self->_dayRowViews, 0);
  objc_storeStrong((id *)&self->_hoursSummaryView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
