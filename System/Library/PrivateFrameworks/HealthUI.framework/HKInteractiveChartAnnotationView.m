@implementation HKInteractiveChartAnnotationView

- (HKInteractiveChartAnnotationView)initWithContext:(int64_t)a3
{
  HKInteractiveChartAnnotationView *v4;
  HKInteractiveChartAnnotationView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartAnnotationView;
  v4 = -[HKInteractiveChartAnnotationView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[HKInteractiveChartAnnotationView setContext:](v4, "setContext:", a3);
    -[HKInteractiveChartAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", a3 == 0);
    -[HKInteractiveChartAnnotationView layer](v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 5.0);

    -[HKInteractiveChartAnnotationView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    v5->_showsInfoButton = 0;
    -[HKInteractiveChartAnnotationView setDeferredNoDataTimer:](v5, "setDeferredNoDataTimer:", 0);
    -[HKInteractiveChartAnnotationView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    -[HKInteractiveChartAnnotationView _configureLayout](v5, "_configureLayout");
  }
  return v5;
}

- (HKInteractiveChartAnnotationView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKInteractiveChartAnnotationView;
  return -[HKInteractiveChartAnnotationView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIButton)infoButton
{
  UIButton *infoButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;

  infoButton = self->_infoButton;
  if (!infoButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "hk_currentValueViewInfoButtonWithTarget:action:", self, sel_infoButtonPressed_);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_infoButton;
    self->_infoButton = v4;

    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("Info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityIdentifier:](self->_infoButton, "setAccessibilityIdentifier:", v6);

    -[UIButton setHidden:](self->_infoButton, "setHidden:", 1);
    infoButton = self->_infoButton;
  }
  return infoButton;
}

- (void)_configureLayout
{
  _HKAnnotationColumnLayout *v3;
  void *v4;
  void *v5;
  _HKDateContentLayout *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HKBodyMarginsLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = -[_HKAnnotationColumnLayout initWithContext:]([_HKAnnotationColumnLayout alloc], "initWithContext:", -[HKInteractiveChartAnnotationView context](self, "context"));
  -[HKInteractiveChartAnnotationView setColumnLayout:](self, "setColumnLayout:", v3);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("Columns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

  v6 = objc_alloc_init(_HKDateContentLayout);
  -[HKInteractiveChartAnnotationView setDateContentLayout:](self, "setDateContentLayout:", v6);

  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentView:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("DateAndContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  v11 = objc_alloc_init(_HKBodyMarginsLayout);
  -[HKInteractiveChartAnnotationView setBodyMarginsLayout:](self, "setBodyMarginsLayout:", v11);

  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBodyView:", v12);

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("BodyMargins"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v15);

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView addSubview:](self, "addSubview:", v17);

}

- (void)setShowsInfoButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showsInfoButton != a3)
  {
    self->_showsInfoButton = a3;
    v3 = !a3;
    -[HKInteractiveChartAnnotationView infoButton](self, "infoButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)reloadData
{
  -[HKInteractiveChartAnnotationView _cancelDeferredDataReload](self, "_cancelDeferredDataReload");
  if (-[HKInteractiveChartAnnotationView _dataSourceHasNoData](self, "_dataSourceHasNoData"))
    -[HKInteractiveChartAnnotationView showNoDataStatus](self, "showNoDataStatus");
  else
    -[HKInteractiveChartAnnotationView _buildStandardAnnotationViews](self, "_buildStandardAnnotationViews");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKInteractiveChartAnnotationView;
  -[HKInteractiveChartAnnotationView layoutSubviews](&v13, sel_layoutSubviews);
  -[HKInteractiveChartAnnotationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v9 = v8;

  -[HKInteractiveChartAnnotationView _leadingMargin](self, "_leadingMargin");
  v11 = v10;
  if (v9 + 2.0 + 2.0 > v6)
    v9 = v6 + -4.0;
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v11, v6 + -2.0 - v9, v4 + v11 * -2.0, v9);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v5 = v4;
  v7 = v6;

  -[HKInteractiveChartAnnotationView _leadingMargin](self, "_leadingMargin");
  v9 = v5 + v8 * 2.0;
  v10 = v7 + 2.0 + 2.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)_leadingMargin
{
  double v3;
  double result;

  if ((-[HKInteractiveChartAnnotationView context](self, "context") | 2) != 2)
    return 10.0;
  -[HKInteractiveChartAnnotationView layoutMargins](self, "layoutMargins");
  result = 16.0;
  if (v3 >= 16.0)
    return v3;
  return result;
}

- (void)_updateRightMarginViewWithInfoButton
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[HKInteractiveChartAnnotationView showsInfoButton](self, "showsInfoButton");
  if (v3)
  {
    -[HKInteractiveChartAnnotationView infoButton](self, "infoButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightMarginView:", v5);

  if (v3)
}

- (void)_buildStandardAnnotationViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
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
  id v28;

  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showSeparators");
  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeSeparators:", v4);

  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "reverseColumnsInRightToLeftLayoutDirection");
    -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReverseColumnsInRightToLeftLayoutDirection:", v8);

  }
  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfValuesForAnnotationView:", self);

  if (v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueViewForColumnAtIndex:orientation:", i, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setColumnView:atIndex:", v14, i);

    }
  }
  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clearViewsFromIndex:", v11);

  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentView:", v17);

  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateViewWithOrientation:", 1);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v28)
  {
    objc_msgSend(v20, "setDateView:", v28);

    objc_msgSend(v28, "removeAllGestureRecognizers");
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleCurrentTimeGesture_);
    objc_msgSend(v28, "addGestureRecognizer:", v21);
    objc_msgSend(v28, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("Date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAccessibilityIdentifier:", v22);

  }
  else
  {
    objc_msgSend(v20, "setDateView:", 0);
  }

  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leftMarginViewWithOrientation:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLeftMarginView:", v24);

  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBodyView:", v26);

  -[HKInteractiveChartAnnotationView _updateRightMarginViewWithInfoButton](self, "_updateRightMarginViewWithInfoButton");
  -[HKInteractiveChartAnnotationView _invalidateLayout](self, "_invalidateLayout");

}

- (void)_invalidateLayout
{
  -[HKInteractiveChartAnnotationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HKInteractiveChartAnnotationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_removeViewsForRebuild
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearViews");

  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", 0);

  -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateView:", 0);

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftMarginView:", 0);

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBodyView:", 0);

  -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightMarginView:", 0);

}

- (void)scheduleDeferredDataReload
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke;
  v8 = &unk_1E9C40170;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 0.35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationView setDeferredNoDataTimer:](self, "setDeferredNoDataTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deferredNoDataTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke_2;
      block[3] = &unk_1E9C3F0D0;
      block[4] = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)_cancelDeferredDataReload
{
  void *v3;
  void *v4;

  -[HKInteractiveChartAnnotationView deferredNoDataTimer](self, "deferredNoDataTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKInteractiveChartAnnotationView deferredNoDataTimer](self, "deferredNoDataTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[HKInteractiveChartAnnotationView setDeferredNoDataTimer:](self, "setDeferredNoDataTimer:", 0);
  }
}

- (BOOL)_dataSourceHasNoData
{
  HKInteractiveChartAnnotationView *v2;
  void *v3;

  v2 = self;
  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "numberOfValuesForAnnotationView:", v2) == 0;

  return (char)v2;
}

- (void)showNoDataStatus
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (-[HKInteractiveChartAnnotationView dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "pendingData"),
        v5,
        (v6 & 1) == 0))
  {
    -[HKInteractiveChartAnnotationView _removeViewsForRebuild](self, "_removeViewsForRebuild");
    v7 = objc_alloc(MEMORY[0x1E0DC3990]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v26[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v26[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CHART_NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v14, v11);

    objc_msgSend(v8, "setAttributedText:", v15);
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v8, "setMinimumScaleFactor:", 0.1);
    -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addColumnView:", v8);

    -[HKInteractiveChartAnnotationView columnLayout](self, "columnLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentView:", v17);

    -[HKInteractiveChartAnnotationView dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateViewWithOrientation:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDateView:", v20);

      objc_msgSend(v20, "removeAllGestureRecognizers");
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleCurrentTimeGesture_);
      objc_msgSend(v20, "addGestureRecognizer:", v22);
      objc_msgSend(v20, "setUserInteractionEnabled:", 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("Date"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAccessibilityIdentifier:", v23);

    }
    -[HKInteractiveChartAnnotationView dateContentLayout](self, "dateContentLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationView bodyMarginsLayout](self, "bodyMarginsLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBodyView:", v24);

    -[HKInteractiveChartAnnotationView _updateRightMarginViewWithInfoButton](self, "_updateRightMarginViewWithInfoButton");
    -[HKInteractiveChartAnnotationView _invalidateLayout](self, "_invalidateLayout");

  }
}

- (void)infoButtonPressed:(id)a3
{
  id v4;

  -[HKInteractiveChartAnnotationView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapOnInfoButtonFromCurrentValueView:", self);

}

- (void)handleCurrentTimeGesture:(id)a3
{
  id v4;

  -[HKInteractiveChartAnnotationView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapOnDateFromCurrentValueView:", self);

}

- (HKInteractiveChartAnnotationViewDataSourceProtocol)dataSource
{
  return (HKInteractiveChartAnnotationViewDataSourceProtocol *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HKInteractiveChartAnnotationViewDelegate)delegate
{
  return (HKInteractiveChartAnnotationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsInfoButton
{
  return self->_showsInfoButton;
}

- (_HKAnnotationColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (void)setColumnLayout:(id)a3
{
  objc_storeStrong((id *)&self->_columnLayout, a3);
}

- (_HKDateContentLayout)dateContentLayout
{
  return self->_dateContentLayout;
}

- (void)setDateContentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_dateContentLayout, a3);
}

- (_HKBodyMarginsLayout)bodyMarginsLayout
{
  return self->_bodyMarginsLayout;
}

- (void)setBodyMarginsLayout:(id)a3
{
  objc_storeStrong((id *)&self->_bodyMarginsLayout, a3);
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, a3);
}

- (NSTimer)deferredNoDataTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_deferredNoDataTimer);
}

- (void)setDeferredNoDataTimer:(id)a3
{
  objc_storeWeak((id *)&self->_deferredNoDataTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deferredNoDataTimer);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_bodyMarginsLayout, 0);
  objc_storeStrong((id *)&self->_dateContentLayout, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
