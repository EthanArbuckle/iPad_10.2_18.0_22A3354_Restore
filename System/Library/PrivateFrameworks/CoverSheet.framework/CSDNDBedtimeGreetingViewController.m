@implementation CSDNDBedtimeGreetingViewController

- (CSDNDBedtimeGreetingViewController)initWithLegibilityPrimaryColor:(id)a3
{
  id v5;
  CSDNDBedtimeGreetingViewController *v6;
  CSDNDBedtimeGreetingViewController *v7;
  uint64_t v8;
  CLInUseAssertion *weatherInUseAssertion;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDNDBedtimeGreetingViewController;
  v6 = -[CSDNDBedtimeGreetingViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legibilityPrimaryColor, a3);
    v8 = objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", CFSTR("com.apple.weather"), CFSTR("DND bedtime greeting"), 0);
    weatherInUseAssertion = v7->_weatherInUseAssertion;
    v7->_weatherInUseAssertion = (CLInUseAssertion *)v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLInUseAssertion invalidate](self->_weatherInUseAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSDNDBedtimeGreetingViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  CSModalView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CSModalView *v9;

  v3 = [CSModalView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v9 = -[CSModalView initWithFrame:](v3, "initWithFrame:");

  -[CSModalView setShowsStatusText:](v9, "setShowsStatusText:", 0);
  -[CSModalView setDelegate:](v9, "setDelegate:", self);
  -[CSModalView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
  -[CSModalView setWantsEnhancedSecondaryActionButton:](v9, "setWantsEnhancedSecondaryActionButton:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DND_BEDTIME_DISMISS"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSModalView setSecondaryActionButtonText:](v9, "setSecondaryActionButtonText:", v6);

  -[CSModalView setSecondaryActionButtonTextColor:](v9, "setSecondaryActionButtonTextColor:", self->_legibilityPrimaryColor);
  -[CSDNDBedtimeGreetingViewController _greetingString](self, "_greetingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSModalView setTitleText:](v9, "setTitleText:", v7);

  -[CSModalView setTitleTextColor:](v9, "setTitleTextColor:", self->_legibilityPrimaryColor);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8A48]), "initWithColor:", self->_legibilityPrimaryColor);
  -[CSModalView setDetailView:](v9, "setDetailView:", v8);
  -[CSDNDBedtimeGreetingViewController setView:](self, "setView:", v9);

}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSDNDBedtimeGreetingViewController;
  v3 = a3;
  -[CSModalViewControllerBase aggregateAppearance:](&v7, sel_aggregateAppearance_, v3);
  +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel", v7.receiver, v7.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "priority:", 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hidden:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v6);

}

- (void)handleSecondaryActionForView:(id)a3
{
  id v4;

  -[CSDNDBedtimeGreetingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissDNDBedtimeGreetingViewController:animated:", self, 1);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDNDBedtimeGreetingViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    if (objc_msgSend(v4, "type") != 27)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[CSDNDBedtimeGreetingViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissDNDBedtimeGreetingViewController:animated:", self, 1);

  }
  v6 = objc_msgSend(v4, "isConsumable");
LABEL_7:

  return v6;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 27;
}

- (id)_greetingString
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "bs_dayPeriodForDate:inLocale:", v3, v4);

  if (v5 > 0xA)
    v6 = 0;
  else
    v6 = off_1E8E30818[v5];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "component:fromDate:", 32, v9);

  if ((unint64_t)(v10 - 3) <= 6
    && -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("DND_BEDTIME_EVENING_GREETING")))
  {
    v6 = CFSTR("DND_BEDTIME_MORNING_GREETING");
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v6, &stru_1E8E30B28, CFSTR("CoverSheet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CSDNDBedtimeGreetingDelegate)delegate
{
  return (CSDNDBedtimeGreetingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weatherInUseAssertion, 0);
  objc_storeStrong((id *)&self->_legibilityPrimaryColor, 0);
}

@end
