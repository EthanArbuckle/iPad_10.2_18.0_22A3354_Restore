@implementation MUPlaceCollectionPullQuotePlatterView

- (MUPlaceCollectionPullQuotePlatterView)initWithFrame:(CGRect)a3
{
  MUPlaceCollectionPullQuotePlatterView *v3;
  MUPlaceCollectionPullQuotePlatterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceCollectionPullQuotePlatterView;
  v3 = -[MUPlaceCollectionPullQuotePlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPlaceCollectionPullQuotePlatterView _setupSubviews](v3, "_setupSubviews");
    -[MUPlaceCollectionPullQuotePlatterView _setupConstraints](v4, "_setupConstraints");
    -[MUPlaceCollectionPullQuotePlatterView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionPullQuotePlatter"));
  }
  return v4;
}

- (void)_setupSubviews
{
  MUCuratedCollectionSummaryView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  MUCuratedCollectionSummaryView *v8;
  MUCuratedCollectionSummaryView *collectionSummaryView;
  MUPullQuoteView *v10;
  MUPullQuoteView *pullQuoteView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = [MUCuratedCollectionSummaryView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[MUCuratedCollectionSummaryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  collectionSummaryView = self->_collectionSummaryView;
  self->_collectionSummaryView = v8;

  -[MUCuratedCollectionSummaryView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionSummaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceCollectionPullQuotePlatterView addSubview:](self, "addSubview:", self->_collectionSummaryView);
  v10 = -[MUExpandingLabel initWithFrame:]([MUPullQuoteView alloc], "initWithFrame:", v4, v5, v6, v7);
  pullQuoteView = self->_pullQuoteView;
  self->_pullQuoteView = v10;

  -[MUPullQuoteView setTranslatesAutoresizingMaskIntoConstraints:](self->_pullQuoteView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setFont:](self->_pullQuoteView, "setFont:", v12);

  +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setTextColor:](self->_pullQuoteView, "setTextColor:", v13);

  +[MUInfoCardStyle buttonCellTextColor](MUInfoCardStyle, "buttonCellTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setShowMoreTextColor:](self->_pullQuoteView, "setShowMoreTextColor:", v14);

  _MULocalizedStringFromThisBundle(CFSTR("More [Placecard]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setShowMoreText:](self->_pullQuoteView, "setShowMoreText:", v15);

  -[MUExpandingLabel setNumberOfLinesWhenCollapsed:](self->_pullQuoteView, "setNumberOfLinesWhenCollapsed:", 4);
  -[MUPullQuoteView setUserInteractionEnabled:](self->_pullQuoteView, "setUserInteractionEnabled:", 0);
  -[MUPlaceCollectionPullQuotePlatterView addSubview:](self, "addSubview:", self->_pullQuoteView);
  v16 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v16;

  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__didSelectCollection);
  -[MUPlaceCollectionPullQuotePlatterView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__didSelectCollection);
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)-[MUPlaceCollectionPullQuotePlatterView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v19, sel__contentSizeDidChange);

}

- (void)_setupConstraints
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[MUPullQuoteView leadingAnchor](self->_pullQuoteView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView leadingAnchor](self, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  -[MUPullQuoteView trailingAnchor](self->_pullQuoteView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  -[MUPullQuoteView topAnchor](self->_pullQuoteView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 14.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  -[MUPullQuoteView bottomAnchor](self->_pullQuoteView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView topAnchor](self->_collectionSummaryView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v14, -14.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v13;
  -[MUCuratedCollectionSummaryView leadingAnchor](self->_collectionSummaryView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v5;
  -[MUCuratedCollectionSummaryView trailingAnchor](self->_collectionSummaryView, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v8;
  -[MUCuratedCollectionSummaryView bottomAnchor](self->_collectionSummaryView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCollectionPullQuotePlatterView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v12);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceCollectionPullQuoteViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceCollectionPullQuotePlatterView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;

  -[MUPlaceCollectionPullQuoteViewModel plainTextDescription](self->_viewModel, "plainTextDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setText:](self->_pullQuoteView, "setText:", v3);

  -[MUCuratedCollectionSummaryView setViewModel:](self->_collectionSummaryView, "setViewModel:", self->_viewModel);
}

- (void)_didSelectCollection
{
  id v3;

  -[MUPlaceCollectionPullQuotePlatterView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pullQuoteViewDidTapMore:", self);

}

- (void)_contentSizeDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUExpandingLabel setFont:](self->_pullQuoteView, "setFont:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 307.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUPlaceCollectionPullQuotePlatterViewDelegate)delegate
{
  return (MUPlaceCollectionPullQuotePlatterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MUPlaceCollectionPullQuoteViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pullQuoteView, 0);
  objc_storeStrong((id *)&self->_collectionSummaryView, 0);
}

@end
