@implementation EKExpandedReminderDateView

+ (id)exampleHeader
{
  EKExpandedReminderDateView *v2;
  EKExpandedReminderDateView *v3;
  void *v4;

  v2 = [EKExpandedReminderDateView alloc];
  v3 = -[EKExpandedReminderDateView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderDateView setupWithDate:](v3, "setupWithDate:", v4);

  return v3;
}

- (EKExpandedReminderDateView)initWithFrame:(CGRect)a3
{
  EKExpandedReminderDateView *v3;
  void *v4;
  DayCircleView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  DayCircleView *v10;
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
  double v26;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[4];
  id v82;
  id location;
  objc_super v84;
  uint64_t v85;
  void *v86;
  _QWORD v87[3];
  _QWORD v88[2];
  _QWORD v89[6];

  v89[4] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)EKExpandedReminderDateView;
  v3 = -[EKExpandedReminderDateView initWithFrame:](&v84, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = [DayCircleView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[DayCircleView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[EKExpandedReminderDateView setDateNumberView:](v3, "setDateNumberView:", v10);

    -[EKExpandedReminderDateView dateNumberView](v3, "dateNumberView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateNumberView](v3, "dateNumberView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[EKExpandedReminderDateView dateNumberView](v3, "dateNumberView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView addSubview:](v3, "addSubview:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 62.0, 62.0);
    -[EKExpandedReminderDateView setDateLabel:](v3, "setDateLabel:", v15);

    -[EKExpandedReminderDateView dateLabel](v3, "dateLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 1);

    -[EKExpandedReminderDateView dateLabel](v3, "dateLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 34.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateLabel](v3, "dateLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    CalendarAppCircleTextColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateLabel](v3, "dateLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    -[EKExpandedReminderDateView dateNumberView](v3, "dateNumberView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateLabel](v3, "dateLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    -[DayCircleView topAnchor](v3->_dateNumberView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView topAnchor](v3, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = 1132068864;
    objc_msgSend(v79, "setPriority:", v26);
    v27 = (void *)MEMORY[0x1E0CB3718];
    v89[0] = v79;
    -[DayCircleView centerXAnchor](v3->_dateNumberView, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView centerXAnchor](v3, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v30;
    -[DayCircleView widthAnchor](v3->_dateNumberView, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 62.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v32;
    -[DayCircleView heightAnchor](v3->_dateNumberView, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 62.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v35);

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    -[EKExpandedReminderDateView setWeekdayLabel:](v3, "setWeekdayLabel:", v36);

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B50], 1024);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView weekdayLabel](v3, "weekdayLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFont:", v78);

    -[EKExpandedReminderDateView weekdayLabel](v3, "weekdayLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView weekdayLabel](v3, "weekdayLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTextColor:", v39);

    -[EKExpandedReminderDateView weekdayLabel](v3, "weekdayLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[EKExpandedReminderDateView weekdayLabel](v3, "weekdayLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView addSubview:](v3, "addSubview:", v42);

    v43 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_weekdayLabel, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DayCircleView bottomAnchor](v3->_dateNumberView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 6.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v46;
    -[UILabel centerXAnchor](v3->_weekdayLabel, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView centerXAnchor](v3, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v50);

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    -[EKExpandedReminderDateView setMonthYearLabel:](v3, "setMonthYearLabel:", v51);

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1024);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView monthYearLabel](v3, "monthYearLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFont:", v80);

    -[EKExpandedReminderDateView monthYearLabel](v3, "monthYearLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView monthYearLabel](v3, "monthYearLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTextColor:", v54);

    -[EKExpandedReminderDateView monthYearLabel](v3, "monthYearLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[EKExpandedReminderDateView monthYearLabel](v3, "monthYearLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView addSubview:](v3, "addSubview:", v57);

    v76 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_monthYearLabel, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_weekdayLabel, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v58, 6.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v59;
    -[UILabel centerXAnchor](v3->_monthYearLabel, "centerXAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView centerXAnchor](v3, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v62;
    -[UILabel bottomAnchor](v3->_monthYearLabel, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView bottomAnchor](v3, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v65;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "activateConstraints:", v66);

    v67 = objc_alloc(MEMORY[0x1E0CD2780]);
    v68 = (void *)objc_msgSend(v67, "initWithType:", *MEMORY[0x1E0CD2C88]);
    -[EKExpandedReminderDateView setBlurFilter:](v3, "setBlurFilter:", v68);

    -[EKExpandedReminderDateView blurFilter](v3, "blurFilter");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setValue:forKey:", 0, *MEMORY[0x1E0CD2D90]);

    -[EKExpandedReminderDateView blurFilter](v3, "blurFilter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView layer](v3, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFilters:", v71);

    objc_initWeak(&location, v3);
    v85 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __44__EKExpandedReminderDateView_initWithFrame___block_invoke;
    v81[3] = &unk_1E6018610;
    objc_copyWeak(&v82, &location);
    v74 = (id)-[EKExpandedReminderDateView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v73, v81);

    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __44__EKExpandedReminderDateView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dateNumberView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsDisplay");

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKExpandedReminderDateView;
    v5 = -[EKExpandedReminderDateView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setBlurFilterRadius:(double)a3
{
  void *v4;
  id v5;

  -[EKExpandedReminderDateView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)setupWithDate:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "isSameDayAsDate:inCalendar:", v4, v5);

  if (v6)
  {
    CalendarAppTintColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateNumberView](self, "dateNumberView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCircleColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderDateView dateLabel](self, "dateLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  v11 = objc_alloc(MEMORY[0x1E0D0C420]);
  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDate:timeZone:", v21, v12);

  objc_msgSend(v13, "day");
  CUIKLocalizedStringForInteger();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderDateView dateLabel](self, "dateLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  CUIKLongStringForWeekday();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderDateView weekdayLabel](self, "weekdayLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  CUIKStringForMonthYear();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedUppercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderDateView monthYearLabel](self, "monthYearLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

}

- (DayCircleView)dateNumberView
{
  return self->_dateNumberView;
}

- (void)setDateNumberView:(id)a3
{
  objc_storeStrong((id *)&self->_dateNumberView, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (void)setWeekdayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_weekdayLabel, a3);
}

- (UILabel)monthYearLabel
{
  return self->_monthYearLabel;
}

- (void)setMonthYearLabel:(id)a3
{
  objc_storeStrong((id *)&self->_monthYearLabel, a3);
}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (void)setBlurFilter:(id)a3
{
  objc_storeStrong((id *)&self->_blurFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_monthYearLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_dateNumberView, 0);
}

@end
