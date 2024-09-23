@implementation MUDayRowView

+ (id)_hoursMonospacedFont
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC13D0];
  v10[0] = *MEMORY[0x1E0DC13D8];
  v10[1] = v2;
  v11[0] = &unk_1E2E55668;
  v11[1] = &unk_1E2E55680;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MUDayRowView)initWithViewModel:(id)a3
{
  id v5;
  MUDayRowView *v6;
  MUDayRowView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDayRowView;
  v6 = -[MUDayRowView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[MUDayRowView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("DayRow"));
    -[MUDayRowView _setupSubviews](v7, "_setupSubviews");
    -[MUDayRowView _setupConstraints](v7, "_setupConstraints");
    -[MUDayRowView _updateAppearance](v7, "_updateAppearance");
  }

  return v7;
}

- (void)_setupSubviews
{
  void *v3;
  uint64_t v4;
  MULabelViewProtocol *v5;
  MULabelViewProtocol *headerLabel;
  void *v7;
  void *v8;
  MULabelViewProtocol *v9;
  MULabelViewProtocol *dayLabel;
  void *v11;
  MULabelViewProtocol *v12;
  MULabelViewProtocol *hoursLabel;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[MUDayRowViewModel labelHeaderString](self->_viewModel, "labelHeaderString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
    v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
    headerLabel = self->_headerLabel;
    self->_headerLabel = v5;

    -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_headerLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setFont:](self->_headerLabel, "setFont:", v8);

    -[MULabelViewProtocol setAllowsDefaultTighteningForTruncation:](self->_headerLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[MULabelViewProtocol setAccessibilityIdentifier:](self->_headerLabel, "setAccessibilityIdentifier:", CFSTR("DayRowHeader"));
    -[MUDayRowView addSubview:](self, "addSubview:", self->_headerLabel);
  }
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v9 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  dayLabel = self->_dayLabel;
  self->_dayLabel = v9;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_dayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_dayLabel, "setFont:", v11);

  -[MULabelViewProtocol setAllowsDefaultTighteningForTruncation:](self->_dayLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_dayLabel, "setAccessibilityIdentifier:", CFSTR("DayRowDayLabel"));
  -[MUDayRowView addSubview:](self, "addSubview:", self->_dayLabel);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v12 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  hoursLabel = self->_hoursLabel;
  self->_hoursLabel = v12;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_hoursLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_hoursLabel, "setNumberOfLines:", 0);
  -[MULabelViewProtocol setAllowsDefaultTighteningForTruncation:](self->_hoursLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[MULabelViewProtocol setTextAlignment:](self->_hoursLabel, "setTextAlignment:", 2 * (-[MUDayRowView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1));
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_hoursLabel, "setAccessibilityIdentifier:", CFSTR("DayRowHoursLabel"));
  -[MUDayRowView addSubview:](self, "addSubview:", self->_hoursLabel);
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)-[MUDayRowView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v15, sel__updateFonts);

}

- (void)_setupConstraints
{
  id v3;
  void *v4;
  uint64_t v5;
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
  NSArray *v17;
  NSArray *hoursConstraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUDayRowViewModel labelHeaderString](self->_viewModel, "labelHeaderString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v25 = v3;
    -[MULabelViewProtocol leadingAnchor](self->_headerLabel, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView leadingAnchor](self, "leadingAnchor");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    -[MULabelViewProtocol trailingAnchor](self->_headerLabel, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView trailingAnchor](self, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintLessThanOrEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    -[MULabelViewProtocol topAnchor](self->_headerLabel, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView topAnchor](self, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v10;
    -[MULabelViewProtocol bottomAnchor](self->_headerLabel, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol topAnchor](self->_dayLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -2.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v14);

    v3 = v25;
    v15 = (void *)v23;

    v16 = v24;
  }
  else
  {
    -[MULabelViewProtocol topAnchor](self->_dayLabel, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView topAnchor](self, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);
  }

  -[MUDayRowView _createHoursConstraints](self, "_createHoursConstraints");
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hoursConstraints = self->_hoursConstraints;
  self->_hoursConstraints = v17;

  objc_msgSend(v3, "addObjectsFromArray:", self->_hoursConstraints);
  v19 = (void *)MEMORY[0x1E0CB3718];
  v20 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v19, "activateConstraints:", v20);

}

- (id)_createHoursConstraints
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
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
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v3 = -[MUDayRowView isStacked](self, "isStacked");
  -[MULabelViewProtocol leadingAnchor](self->_dayLabel, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDayRowView leadingAnchor](self, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v4;
  objc_msgSend(v4, "constraintEqualToAnchor:", v29);
  v5 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  if (v3)
  {
    v32[0] = v5;
    -[MULabelViewProtocol bottomAnchor](self->_dayLabel, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol topAnchor](self->_hoursLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v26, -2.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v25;
    -[MULabelViewProtocol trailingAnchor](self->_dayLabel, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol trailingAnchor](self->_hoursLabel, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    objc_msgSend(v7, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v22;
    -[MULabelViewProtocol leadingAnchor](self->_hoursLabel, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView leadingAnchor](self, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v10;
    -[MULabelViewProtocol trailingAnchor](self->_hoursLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView trailingAnchor](self, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v13;
    -[MULabelViewProtocol bottomAnchor](self->_hoursLabel, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v16;
    v17 = v32;
  }
  else
  {
    v31[0] = v5;
    -[MULabelViewProtocol bottomAnchor](self->_dayLabel, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView bottomAnchor](self, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v26, -2.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v25;
    -[MULabelViewProtocol trailingAnchor](self->_dayLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol leadingAnchor](self->_hoursLabel, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v22;
    -[MULabelViewProtocol topAnchor](self->_hoursLabel, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol topAnchor](self->_dayLabel, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v10;
    -[MULabelViewProtocol trailingAnchor](self->_hoursLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView trailingAnchor](self, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v13;
    -[MULabelViewProtocol bottomAnchor](self->_hoursLabel, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUDayRowView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v16;
    v17 = v31;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUDayRowViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUDayRowView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;

  -[MUDayRowViewModel labelHeaderString](self->_viewModel, "labelHeaderString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_headerLabel, "setText:", v3);

  -[MUDayRowViewModel dayString](self->_viewModel, "dayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_dayLabel, "setText:", v4);

  -[MUDayRowView _refreshHoursLabel](self, "_refreshHoursLabel");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_dayLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_headerLabel, "setFont:", v4);

  -[MUDayRowView _refreshHoursLabel](self, "_refreshHoursLabel");
}

- (void)_refreshHoursLabel
{
  id v3;

  -[MUDayRowViewModel buildDefaultPlacecardHoursString](self->_viewModel, "buildDefaultPlacecardHoursString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_hoursLabel, "setAttributedText:", v3);

}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  double Width;
  double v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;
  CGRect v11;

  -[MUDayRowView frame](self, "frame", a3);
  Width = CGRectGetWidth(v11);
  -[MULabelViewProtocol idealWidth](self->_dayLabel, "idealWidth");
  v5 = Width * 0.5;
  if (v6 > v5)
    return 1;
  -[MULabelViewProtocol attributedText](self->_hoursLabel, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v7 = v9 > v5;

  return v7;
}

- (void)setStacked:(BOOL)a3
{
  NSArray *v4;
  NSArray *hoursConstraints;

  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    if (-[NSArray count](self->_hoursConstraints, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_hoursConstraints);
      -[MUDayRowView _createHoursConstraints](self, "_createHoursConstraints");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      hoursConstraints = self->_hoursConstraints;
      self->_hoursConstraints = v4;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_hoursConstraints);
    }
  }
}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUDayRowViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hoursConstraints, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
