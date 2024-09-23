@implementation HKMonthViewController

- (HKMonthViewController)initWithDateCache:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  HKMonthViewController *v9;
  HKMonthViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMonthViewController;
  v9 = -[HKMonthViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a3);
    objc_storeStrong((id *)&v10->_currentDate, a4);
    -[HKMonthViewController _updateBackButton](v10, "_updateBackButton");
    -[HKMonthViewController createCalendarScrollViewController](v10, "createCalendarScrollViewController");
    -[HKMonthViewController setTitleAlignment:](v10, "setTitleAlignment:", 4);
  }

  return v10;
}

- (void)createCalendarScrollViewController
{
  HKCalendarScrollViewController *v3;
  void *v4;
  id v5;

  v3 = -[HKCalendarScrollViewController initWithSelectedDate:]([HKCalendarScrollViewController alloc], "initWithSelectedDate:", self->_currentDate);
  -[HKMonthViewController setCalendarScrollViewController:](self, "setCalendarScrollViewController:", v3);

  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMonthViewController addChildViewController:](self, "addChildViewController:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMonthViewController;
  -[HKMonthViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[HKMonthViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);

  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didMoveToParentViewController:", self);

  -[HKMonthViewController createTitleLabel](self, "createTitleLabel");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKMonthViewController;
  -[HKMonthViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[HKMonthViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)createTitleLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (-[HKMonthViewController titleAlignment](self, "titleAlignment") == 1)
  {
    -[HKMonthViewController currentDate](self, "currentDate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForDateAndTemplate(v11, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMonthViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v3);
  }
  else
  {
    if (-[HKMonthViewController titleAlignment](self, "titleAlignment") != 4)
      return;
    v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[HKMonthViewController setTitleLabel:](self, "setTitleLabel:", v5);

    -[HKMonthViewController currentDate](self, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMonthViewController _titleStringForDate:](self, "_titleStringForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMonthViewController titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v7);

    -[HKMonthViewController titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeToFit");

    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[HKMonthViewController titleLabel](self, "titleLabel");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v10, "initWithCustomView:");
    -[HKMonthViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);
  }

}

- (HKMonthViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HKMonthViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMonthViewController;
  return -[HKMonthViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setCurrentDate:(id)a3 animateIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[HKMonthViewController _setCurrentDate:](self, "_setCurrentDate:", v6);
  -[HKMonthViewController calendarScrollViewController](self, "calendarScrollViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollToDate:animateIfPossible:", v6, v4);

}

- (void)_setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  -[HKMonthViewController _updateBackButton](self, "_updateBackButton");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMonthViewController;
  -[HKMonthViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKMonthViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[HKMonthViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "monthViewController:didSelectDate:", self, self->_currentDate);

    }
  }

}

- (void)calendarScrollViewController:(id)a3 didSelectDate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HKMonthViewController _setCurrentDate:](self, "_setCurrentDate:", v5);
  -[HKMonthViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "monthViewController:didSelectDate:", self, v5);

}

- (void)calendarScrollViewController:(id)a3 didUpdateCenteredMonth:(id)a4
{
  -[HKMonthViewController _updateCurrentMonthBarButtonItemWithDate:](self, "_updateCurrentMonthBarButtonItemWithDate:", a4);
}

- (void)_updateBackButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKMonthViewController currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMonthViewController dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKRelativeMonthYearText(v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 0, self, sel__didTapBackButton);
  -[HKMonthViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackBarButtonItem:", v5);

}

- (void)_updateCurrentMonthBarButtonItemWithDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDateComponents **p_cachedDateComponents;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HKMonthViewController dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 12, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  p_cachedDateComponents = &self->_cachedDateComponents;
  if ((-[NSDateComponents isEqual:](self->_cachedDateComponents, "isEqual:", v6) & 1) == 0)
  {
    if (-[HKMonthViewController titleAlignment](self, "titleAlignment") == 1)
    {
      HKLocalizedStringForDateAndTemplate(v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMonthViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v8);

    }
    else
    {
      if (-[HKMonthViewController titleAlignment](self, "titleAlignment") != 4)
      {
LABEL_7:
        objc_storeStrong((id *)p_cachedDateComponents, v6);
        goto LABEL_8;
      }
      -[HKMonthViewController titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMonthViewController _titleStringForDate:](self, "_titleStringForDate:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedText:", v11);

      -[HKMonthViewController titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sizeToFit");
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (id)_titleStringForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 IsLargerThanSizeCategory;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HKLocalizedStringForDateAndTemplate(v3, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v3, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfString:", v5);
  v9 = v8;
  v10 = objc_msgSend(v4, "rangeOfString:", v6);
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0CB3778]);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v38[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1440]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v26;
    v38[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v4, v28);
  }
  else
  {
    v35 = v9;
    v36 = v12;
    v14 = *MEMORY[0x1E0DC1140];
    v44 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v4, v16);

    v18 = *MEMORY[0x1E0DC48C8];
    IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC48C8]);
    v20 = (void *)MEMORY[0x1E0DC1350];
    v21 = *MEMORY[0x1E0DC4A88];
    v37 = v5;
    if (IsLargerThanSizeCategory)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredFontForTextStyle:compatibleWithTraitCollection:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_scaledValueForValue:", 17.0);
      v25 = v24;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_scaledValueForValue:", 17.0);
      v25 = v29;
    }

    v42[0] = *MEMORY[0x1E0DC1138];
    v30 = v42[0];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v25, *MEMORY[0x1E0DC1438]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v14;
    v43[0] = v31;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:range:", v33, v7, v35);

    v40[0] = v30;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v25, *MEMORY[0x1E0DC1460]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v14;
    v41[0] = v26;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:range:", v28, v10, v36);
    v5 = v37;
  }

  return v17;
}

- (void)_didTapBackButton
{
  id v3;

  -[HKMonthViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapBackButtonForMonthViewController:", self);

}

- (HKMonthViewControllerDelegate)delegate
{
  return (HKMonthViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (BOOL)wantsShortTitleDate
{
  return self->_wantsShortTitleDate;
}

- (void)setWantsShortTitleDate:(BOOL)a3
{
  self->_wantsShortTitleDate = a3;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (void)setTitleAlignment:(int64_t)a3
{
  self->_titleAlignment = a3;
}

- (HKCalendarScrollViewController)calendarScrollViewController
{
  return self->_calendarScrollViewController;
}

- (void)setCalendarScrollViewController:(id)a3
{
  objc_storeStrong((id *)&self->_calendarScrollViewController, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_calendarScrollViewController, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedDateComponents, 0);
}

@end
