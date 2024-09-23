@implementation SFPrivacyReportDetailToggleTableViewCell

- (SFPrivacyReportDetailToggleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportDetailToggleTableViewCell *v4;
  UISegmentedControl *v5;
  UISegmentedControl *segmentedControl;
  const __CFString *v7;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
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
  SFPrivacyReportDetailToggleTableViewCell *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[9];

  v42[7] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)SFPrivacyReportDetailToggleTableViewCell;
  v4 = -[SFPrivacyReportDetailToggleTableViewCell initWithStyle:reuseIdentifier:](&v41, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = v4->_segmentedControl;
    v4->_segmentedControl = v5;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v4->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivacyReportDetailToggleTableViewCell _addSegmentForDetailType:](v4, "_addSegmentForDetailType:", 0);
    -[SFPrivacyReportDetailToggleTableViewCell _addSegmentForDetailType:](v4, "_addSegmentForDetailType:", 1);
    if (v4->_detailType == 1)
      v7 = CFSTR("trackers");
    else
      v7 = CFSTR("websites");
    -[UISegmentedControl setSelectedSegmentIndex:](v4->_segmentedControl, "setSelectedSegmentIndex:", -[UISegmentedControl segmentIndexForActionIdentifier:](v4->_segmentedControl, "segmentIndexForActionIdentifier:", v7));
    -[SFPrivacyReportDetailToggleTableViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_segmentedControl);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[SFPrivacyReportDetailToggleTableViewCell _updateTitle](v4, "_updateTitle");
    objc_msgSend(v8, "addSubview:", v4->_titleLabel);
    objc_msgSend(v8, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB3718];
    -[UISegmentedControl leadingAnchor](v4->_segmentedControl, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    -[UISegmentedControl trailingAnchor](v4->_segmentedControl, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v34;
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v13;
    objc_msgSend(v13, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v31;
    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v26;
    -[UISegmentedControl topAnchor](v4->_segmentedControl, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    objc_msgSend(v8, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v14, 2.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v15;
    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl bottomAnchor](v4->_segmentedControl, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v17, 2.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v18;
    objc_msgSend(v8, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v20, 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v22);

    v23 = v4;
  }

  return v4;
}

- (void)_addSegmentForDetailType:(int64_t)a3
{
  void *v3;
  UISegmentedControl *segmentedControl;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  objc_initWeak(&location, self);
  segmentedControl = self->_segmentedControl;
  v7 = (void *)MEMORY[0x1E0DC3428];
  if ((unint64_t)a3 <= 1)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = CFSTR("websites");
  if (a3 == 1)
    v8 = CFSTR("trackers");
  v9 = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__SFPrivacyReportDetailToggleTableViewCell__addSegmentForDetailType___block_invoke;
  v11[3] = &unk_1E4AC1478;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v3, 0, v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl insertSegmentWithAction:atIndex:animated:](segmentedControl, "insertSegmentWithAction:atIndex:animated:", v10, -[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments"), 0);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __69__SFPrivacyReportDetailToggleTableViewCell__addSegmentForDetailType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectDetailType:", *(_QWORD *)(a1 + 40));

}

- (void)_selectDetailType:(int64_t)a3
{
  id WeakRetained;

  self->_detailType = a3;
  -[SFPrivacyReportDetailToggleTableViewCell _updateTitle](self, "_updateTitle");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "cellDidToggleDetailType:", self);

}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  id v5;

  if (self->_detailType > 1uLL)
  {
    v3 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v3;
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (void)setDetailType:(int64_t)a3
{
  UISegmentedControl *segmentedControl;
  const __CFString *v5;

  if (self->_detailType != a3)
  {
    self->_detailType = a3;
    segmentedControl = self->_segmentedControl;
    if (a3 == 1)
      v5 = CFSTR("trackers");
    else
      v5 = CFSTR("websites");
    -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", -[UISegmentedControl segmentIndexForActionIdentifier:](segmentedControl, "segmentIndexForActionIdentifier:", v5));
    -[SFPrivacyReportDetailToggleTableViewCell _updateTitle](self, "_updateTitle");
  }
}

- (void)setUseCurrentWebsiteHeader:(BOOL)a3
{
  if (self->_useCurrentWebsiteHeader != a3)
  {
    self->_useCurrentWebsiteHeader = a3;
    -[SFPrivacyReportDetailToggleTableViewCell _updateTitle](self, "_updateTitle");
  }
}

- (int64_t)detailType
{
  return self->_detailType;
}

- (SFPrivacyReportDetailToggleTableViewCellDelegate)delegate
{
  return (SFPrivacyReportDetailToggleTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useCurrentWebsiteHeader
{
  return self->_useCurrentWebsiteHeader;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
