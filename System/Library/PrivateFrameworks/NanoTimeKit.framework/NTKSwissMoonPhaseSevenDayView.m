@implementation NTKSwissMoonPhaseSevenDayView

- (NTKSwissMoonPhaseSevenDayView)initWithFrame:(CGRect)a3
{
  NTKSwissMoonPhaseSevenDayView *v3;
  UIStackView *v4;
  UIStackView *sevenDayLayoutView;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *dailyViews;
  uint64_t v26;
  NSArray *dividerViews;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)NTKSwissMoonPhaseSevenDayView;
  v3 = -[NTKSwissMoonPhaseSevenDayView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_opt_new();
    -[UIStackView setAxis:](v4, "setAxis:", 0);
    -[UIStackView setDistribution:](v4, "setDistribution:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    sevenDayLayoutView = v3->_sevenDayLayoutView;
    v3->_sevenDayLayoutView = v4;

    -[NTKSwissMoonPhaseSevenDayView addSubview:](v3, "addSubview:", v3->_sevenDayLayoutView);
    -[UIStackView topAnchor](v3->_sevenDayLayoutView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissMoonPhaseSevenDayView topAnchor](v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    -[NTKSwissMoonPhaseSevenDayView bottomAnchor](v3, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v3->_sevenDayLayoutView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v6;
    -[UIStackView leadingAnchor](v3->_sevenDayLayoutView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissMoonPhaseSevenDayView leadingAnchor](v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v9;
    -[NTKSwissMoonPhaseSevenDayView trailingAnchor](v3, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v3->_sevenDayLayoutView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v13 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "addObject:", v15);
    -[UIStackView addArrangedSubview:](v3->_sevenDayLayoutView, "addArrangedSubview:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v18, "addObject:", v19);
      -[UIStackView addArrangedSubview:](v3->_sevenDayLayoutView, "addArrangedSubview:", v19);
      objc_msgSend(v19, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView widthAnchor](v3->_sevenDayLayoutView, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:multiplier:", v21, 0.128571429);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v22);

      v23 = (void *)objc_opt_new();
      objc_msgSend(v14, "addObject:", v23);
      -[UIStackView addArrangedSubview:](v3->_sevenDayLayoutView, "addArrangedSubview:", v23);

      --v17;
    }
    while (v17);
    v24 = objc_msgSend(v18, "copy");
    dailyViews = v3->_dailyViews;
    v3->_dailyViews = (NSArray *)v24;

    v26 = objc_msgSend(v14, "copy");
    dividerViews = v3->_dividerViews;
    v3->_dividerViews = (NSArray *)v26;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  }
  return v3;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKSwissMoonPhaseSevenDayView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;

  v5 = configureWithImageProvider_reason__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&configureWithImageProvider_reason__onceToken, &__block_literal_global_135);
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AnyLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CurrentEventDate"));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "components:fromDate:", 60, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "day");
  objc_msgSend(v6, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MoonViewOffsetDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "components:fromDate:", 60, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "day");
  -[NTKSwissMoonPhaseSevenDayView dailyViews](self, "dailyViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke_2;
  v26[3] = &unk_1E6BD8440;
  v27 = v13;
  v28 = v11;
  v32 = v14;
  v33 = v18;
  v29 = v17;
  v30 = v8;
  v31 = v10;
  v20 = v10;
  v21 = v8;
  v22 = v17;
  v23 = v11;
  v24 = v13;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v26);

}

void __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setDateFormat:", CFSTR("d"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  v2 = (void *)configureWithImageProvider_reason__DayFormatter;
  configureWithImageProvider_reason__DayFormatter = (uint64_t)v0;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("EEEEE"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  v5 = (void *)configureWithImageProvider_reason__WeekdayFormatter;
  configureWithImageProvider_reason__WeekdayFormatter = (uint64_t)v3;

}

void __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDay:", *(_QWORD *)(a1 + 72) + a3);
  objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)configureWithImageProvider_reason__DayFormatter, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dayLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(*(id *)(a1 + 48), "setDay:", *(_QWORD *)(a1 + 80) + a3);
  objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", &unk_1E6CA1308, CFSTR("vista"), v8, CFSTR("entry date"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("CurrentLocation"));
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("AnyLocation"));
  objc_msgSend(v18, "moonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleTemplateMetadata:reason:", v10, 0);

  objc_msgSend((id)configureWithImageProvider_reason__WeekdayFormatter, "stringFromDate:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "weekdayLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "weekdayLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NTKSwissMoonPhaseSevenDayView dailyViews](self, "dailyViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "moonView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (int64_t)_moonFilterStyle
{
  void *v2;
  void *v3;
  int v4;

  -[NTKSwissMoonPhaseSevenDayView filterProvider](self, "filterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if (v4)
    return 5;
  else
    return 1;
}

- (int64_t)_labelFilterStyle
{
  void *v2;
  void *v3;
  int v4;

  -[NTKSwissMoonPhaseSevenDayView filterProvider](self, "filterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  return v4 ^ 1u;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  CLKMonochromeFilterProvider **p_filterProvider;
  id WeakRetained;
  id v7;
  void *v8;
  BOOL v9;
  NSArray *dailyViews;
  uint64_t v11;
  id v12;
  NSArray *dividerViews;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  p_filterProvider = &self->_filterProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "filtersForView:style:fraction:", self, -[NTKSwissMoonPhaseSevenDayView _moonFilterStyle](self, "_moonFilterStyle"), a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)p_filterProvider);
  objc_msgSend(v7, "filtersForView:style:fraction:", self, -[NTKSwissMoonPhaseSevenDayView _labelFilterStyle](self, "_labelFilterStyle"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    dailyViews = self->_dailyViews;
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke;
    v17[3] = &unk_1E6BD8468;
    v18 = v14;
    v12 = v8;
    v19 = v12;
    -[NSArray enumerateObjectsUsingBlock:](dailyViews, "enumerateObjectsUsingBlock:", v17);
    dividerViews = self->_dividerViews;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke_2;
    v15[3] = &unk_1E6BD8490;
    v16 = v12;
    -[NSArray enumerateObjectsUsingBlock:](dividerViews, "enumerateObjectsUsingBlock:", v15);

  }
}

void __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "moonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "dayLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "weekdayLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", *(_QWORD *)(a1 + 40));

}

void __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", *(_QWORD *)(a1 + 32));

}

- (void)updateMonochromeColor
{
  -[NTKSwissMoonPhaseSevenDayView transitionToMonochromeWithFraction:](self, "transitionToMonochromeWithFraction:", 1.0);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (UIStackView)sevenDayLayoutView
{
  return self->_sevenDayLayoutView;
}

- (void)setSevenDayLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_sevenDayLayoutView, a3);
}

- (NSArray)dailyViews
{
  return self->_dailyViews;
}

- (void)setDailyViews:(id)a3
{
  objc_storeStrong((id *)&self->_dailyViews, a3);
}

- (NSArray)dividerViews
{
  return self->_dividerViews;
}

- (void)setDividerViews:(id)a3
{
  objc_storeStrong((id *)&self->_dividerViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_dailyViews, 0);
  objc_storeStrong((id *)&self->_sevenDayLayoutView, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end
