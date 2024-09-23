@implementation HKInteractiveChartsMonthViewController

- (HKInteractiveChartsMonthViewController)initWithHealthStore:(id)a3 dateCache:(id)a4 date:(id)a5
{
  id v8;
  HKInteractiveChartsMonthViewController *v9;
  HKInteractiveChartsMonthViewController *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKInteractiveChartsMonthViewController;
  v9 = -[HKMonthViewController initWithDateCache:date:](&v12, sel_initWithDateCache_date_, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[HKInteractiveChartsMonthViewController setHealthStore:](v9, "setHealthStore:", v8);
    -[HKMonthViewController setTitleAlignment:](v10, "setTitleAlignment:", 1);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKWeekdayHeaderPaletteView *v10;
  HKWeekdayHeaderPaletteView *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HKInteractiveChartsMonthViewController;
  -[HKMonthViewController viewDidLoad](&v19, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissViewController_);
  -[HKInteractiveChartsMonthViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, sel_didTapTodayButton);
  -[HKInteractiveChartsMonthViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  v10 = [HKWeekdayHeaderPaletteView alloc];
  v11 = -[HKWeekdayHeaderPaletteView initWithFrame:shouldSupportRTL:](v10, "initWithFrame:shouldSupportRTL:", HKUICalendarLocaleIsRightToLeft(), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKInteractiveChartsMonthViewController setWeekdayHeaderPaletteView:](self, "setWeekdayHeaderPaletteView:", v11);

  -[HKInteractiveChartsMonthViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKWeekdayHeaderPaletteView preferredHeight](HKWeekdayHeaderPaletteView, "preferredHeight");
  objc_msgSend(v12, "paletteForEdge:size:", 2, 0.0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartsMonthViewController setContainingPalette:](self, "setContainingPalette:", v14);

  -[HKInteractiveChartsMonthViewController containingPalette](self, "containingPalette");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartsMonthViewController weekdayHeaderPaletteView](self, "weekdayHeaderPaletteView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[HKInteractiveChartsMonthViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartsMonthViewController containingPalette](self, "containingPalette");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attachPalette:isPinned:", v18, 1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double Width;
  double v5;
  double v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartsMonthViewController;
  -[HKMonthViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[HKInteractiveChartsMonthViewController containingPalette](self, "containingPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v9);
  +[HKWeekdayHeaderPaletteView preferredHeight](HKWeekdayHeaderPaletteView, "preferredHeight");
  v6 = v5;
  -[HKInteractiveChartsMonthViewController weekdayHeaderPaletteView](self, "weekdayHeaderPaletteView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, v6);

}

- (void)dismissViewController:(id)a3
{
  void *v4;
  id v5;

  -[HKMonthViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMonthViewController currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monthViewController:didSelectDate:", self, v4);

}

- (void)calendarScrollViewController:(id)a3 accessoryViewForDate:(id)a4 accessoryViewCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  HKInteractiveChartsMonthViewController *v21;
  id v22;

  v7 = a4;
  v8 = a5;
  -[HKInteractiveChartsMonthViewController sampleType](self, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesForDayFromDate:calendar:options:", v7, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartsMonthViewController additionalSamplePredicate](self, "additionalSamplePredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HKInteractiveChartsMonthViewController additionalSamplePredicate](self, "additionalSamplePredicate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIPredicateMatchingPredicates(v11, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    v15 = objc_alloc(MEMORY[0x1E0CB6AF8]);
    -[HKInteractiveChartsMonthViewController sampleType](self, "sampleType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke;
    v19[3] = &unk_1E9C3FC08;
    v20 = v7;
    v21 = self;
    v22 = v8;
    v17 = (void *)objc_msgSend(v15, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v16, v11, 1, 0, v19);

    -[HKInteractiveChartsMonthViewController healthStore](self, "healthStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "executeQuery:", v17);

  }
}

void __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke_2;
    v8[3] = &unk_1E9C3FBE0;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v4, "addOperationWithBlock:", v8);

  }
}

void __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke_2(uint64_t a1)
{
  WDInteractiveChartsMonthViewControllerIndicatorView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  WDInteractiveChartsMonthViewControllerIndicatorDotView *v7;
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
  WDInteractiveChartsMonthViewControllerIndicatorView *v20;

  v2 = [WDInteractiveChartsMonthViewControllerIndicatorView alloc];
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = -[WDInteractiveChartsMonthViewControllerIndicatorView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], v4, v5, v6);
  -[WDInteractiveChartsMonthViewControllerIndicatorView setDate:](v20, "setDate:", *(_QWORD *)(a1 + 32));
  v7 = -[WDInteractiveChartsMonthViewControllerIndicatorDotView initWithFrame:]([WDInteractiveChartsMonthViewControllerIndicatorDotView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[WDInteractiveChartsMonthViewControllerIndicatorDotView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "sampleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDInteractiveChartsMonthViewControllerIndicatorDotView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[WDInteractiveChartsMonthViewControllerIndicatorDotView layer](v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 5.0);

  -[WDInteractiveChartsMonthViewControllerIndicatorView addSubview:](v20, "addSubview:", v7);
  -[WDInteractiveChartsMonthViewControllerIndicatorDotView heightAnchor](v7, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[WDInteractiveChartsMonthViewControllerIndicatorDotView widthAnchor](v7, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[WDInteractiveChartsMonthViewControllerIndicatorDotView centerXAnchor](v7, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDInteractiveChartsMonthViewControllerIndicatorView centerXAnchor](v20, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[WDInteractiveChartsMonthViewControllerIndicatorDotView centerYAnchor](v7, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDInteractiveChartsMonthViewControllerIndicatorView centerYAnchor](v20, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)didTapTodayButton
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMonthViewController setCurrentDate:animateIfPossible:](self, "setCurrentDate:animateIfPossible:", v3, 1);

}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
}

- (UIColor)sampleColor
{
  return self->_sampleColor;
}

- (void)setSampleColor:(id)a3
{
  objc_storeStrong((id *)&self->_sampleColor, a3);
}

- (NSPredicate)additionalSamplePredicate
{
  return self->_additionalSamplePredicate;
}

- (void)setAdditionalSamplePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSamplePredicate, a3);
}

- (_UINavigationControllerPalette)containingPalette
{
  return self->_containingPalette;
}

- (void)setContainingPalette:(id)a3
{
  objc_storeStrong((id *)&self->_containingPalette, a3);
}

- (HKWeekdayHeaderPaletteView)weekdayHeaderPaletteView
{
  return self->_weekdayHeaderPaletteView;
}

- (void)setWeekdayHeaderPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_weekdayHeaderPaletteView, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_weekdayHeaderPaletteView, 0);
  objc_storeStrong((id *)&self->_containingPalette, 0);
  objc_storeStrong((id *)&self->_additionalSamplePredicate, 0);
  objc_storeStrong((id *)&self->_sampleColor, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

@end
