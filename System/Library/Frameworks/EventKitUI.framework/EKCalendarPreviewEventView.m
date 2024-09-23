@implementation EKCalendarPreviewEventView

- (EKCalendarPreviewEventView)initWithEvent:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  EKCalendarPreviewEventView *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  UIView *colorBar;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  EKCalendarPreviewEventView *v33;
  void *v34;
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
  objc_super v68;
  _QWORD v69[13];

  v69[11] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)EKCalendarPreviewEventView;
  v8 = -[EKCalendarPreviewEventView init](&v68, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    objc_msgSend(v6, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

    -[EKCalendarPreviewEventView addSubview:](v8, "addSubview:", v9);
    v13 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    objc_msgSend(v13, "setDateStyle:", 2);
    objc_msgSend(v13, "setTimeStyle:", 1);
    v14 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v16);

    v66 = v13;
    v67 = v6;
    if (objc_msgSend(v6, "isAllDay"))
    {
      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1E601DFA8, 0);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:toDate:", v17, v19);
      v18 = objc_claimAutoreleasedReturnValue();

    }
    v45 = (void *)v18;

    objc_msgSend(v14, "setText:", v18);
    -[EKCalendarPreviewEventView addSubview:](v8, "addSubview:", v14);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "uiColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[UIView layer](v20, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 1.5);

    colorBar = v8->_colorBar;
    v8->_colorBar = v20;
    v24 = v20;

    -[EKCalendarPreviewEventView addSubview:](v8, "addSubview:", v24);
    v51 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v24, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v63;
    -[UIView bottomAnchor](v24, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v60;
    -[UIView widthAnchor](v24, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToConstant:", 3.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v58;
    -[UIView leadingAnchor](v24, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarPreviewEventView leadingAnchor](v8, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v55;
    objc_msgSend(v9, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarPreviewEventView topAnchor](v8, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v52;
    objc_msgSend(v9, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarPreviewEventView trailingAnchor](v8, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v46;
    objc_msgSend(v9, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v24, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v43, 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v42;
    objc_msgSend(v14, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v39;
    objc_msgSend(v14, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarPreviewEventView bottomAnchor](v8, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69[8] = v36;
    objc_msgSend(v14, "leadingAnchor");
    v25 = v14;
    v47 = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v28;
    objc_msgSend(v25, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarPreviewEventView trailingAnchor](v8, "trailingAnchor");
    v48 = v9;
    v30 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[10] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 11);
    v33 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v34);

    v8 = v33;
    v7 = v30;

    v6 = v67;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorBar, 0);
}

@end
