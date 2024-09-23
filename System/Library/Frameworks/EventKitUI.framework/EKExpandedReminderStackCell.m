@implementation EKExpandedReminderStackCell

- (EKExpandedReminderStackCell)initWithFrame:(CGRect)a3
{
  EKExpandedReminderStackCell *v3;
  UILabel *v4;
  UILabel *title;
  void *v6;
  UILabel *v7;
  UILabel *time;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *backgroundColorView;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *backgroundImageView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIButton *circle;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _QWORD v93[4];
  id v94;
  id location;
  objc_super v96;
  _QWORD v97[19];

  v97[17] = *MEMORY[0x1E0C80C00];
  v96.receiver = self;
  v96.super_class = (Class)EKExpandedReminderStackCell;
  v3 = -[EKExpandedReminderStackCell initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v3->_title;
    v3->_title = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_title, "setNumberOfLines:", 1);
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_title);

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    time = v3->_time;
    v3->_time = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_time, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_time, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4B10], 0x10000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_time, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_time, "setTextColor:", v10);

    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_time);

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundColorView = v3->_backgroundColorView;
    v3->_backgroundColorView = v12;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundColorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v3->_backgroundColorView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 12.0);

    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v3->_backgroundColorView);

    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendSubviewToBack:", v3->_backgroundColorView);

    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v3->_backgroundImageView);

    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendSubviewToBack:", v3->_backgroundImageView);

    objc_initWeak(&location, v3);
    v21 = (void *)MEMORY[0x1E0DC3428];
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __45__EKExpandedReminderStackCell_initWithFrame___block_invoke;
    v93[3] = &unk_1E6019DA8;
    objc_copyWeak(&v94, &location);
    objc_msgSend(v21, "actionWithHandler:", v93);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "buttonWithConfiguration:primaryAction:", v23, v90);
    v24 = objc_claimAutoreleasedReturnValue();
    circle = v3->_circle;
    v3->_circle = (UIButton *)v24;

    -[UIButton setExclusiveTouch:](v3->_circle, "setExclusiveTouch:", 1);
    LODWORD(v26) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_circle, "setContentCompressionResistancePriority:forAxis:", 0, v26);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_circle, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v3->_circle);

    -[UILabel topAnchor](v3->_title, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_backgroundColorView, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 11.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v30) = 1132068864;
    objc_msgSend(v92, "setPriority:", v30);
    -[UILabel bottomAnchor](v3->_time, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_backgroundColorView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -11.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v33) = 1132068864;
    objc_msgSend(v91, "setPriority:", v33);
    v44 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton leadingAnchor](v3->_circle, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_backgroundColorView, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, 11.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v87;
    -[UIButton firstBaselineAnchor](v3->_circle, "firstBaselineAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_title, "firstBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v84;
    -[UILabel leadingAnchor](v3->_title, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v3->_circle, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 10.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v81;
    -[UILabel trailingAnchor](v3->_title, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_backgroundColorView, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintLessThanOrEqualToAnchor:constant:", v79, -11.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v97[3] = v78;
    -[UILabel leadingAnchor](v3->_time, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v3->_circle, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 10.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v97[4] = v75;
    -[UILabel trailingAnchor](v3->_time, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_backgroundColorView, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", v73, -11.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v97[5] = v72;
    -[UILabel topAnchor](v3->_time, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_title, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 2.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v97[6] = v69;
    v97[7] = v92;
    v97[8] = v91;
    -[UIView leadingAnchor](v3->_backgroundColorView, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v97[9] = v65;
    -[UIView topAnchor](v3->_backgroundColorView, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v97[10] = v61;
    -[UIView trailingAnchor](v3->_backgroundColorView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v97[11] = v57;
    -[UIView bottomAnchor](v3->_backgroundColorView, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v97[12] = v53;
    -[UIImageView leadingAnchor](v3->_backgroundImageView, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v97[13] = v49;
    -[UIImageView topAnchor](v3->_backgroundImageView, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v97[14] = v45;
    -[UIImageView trailingAnchor](v3->_backgroundImageView, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v97[15] = v37;
    -[UIImageView bottomAnchor](v3->_backgroundImageView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKExpandedReminderStackCell contentView](v3, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v97[16] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 17);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v42);

    objc_destroyWeak(&v94);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __45__EKExpandedReminderStackCell_initWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 82);
    objc_msgSend(v2, "reminderToggled:", v3);

    WeakRetained = v3;
  }

}

+ (id)exampleCell
{
  EKExpandedReminderStackCell *v2;
  EKExpandedReminderStackCell *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = [EKExpandedReminderStackCell alloc];
  v3 = -[EKExpandedReminderStackCell initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D0CA38];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackCell setupCellWithTitle:completed:editable:date:buttonColor:buttonImageName:backgroundColor:recurringString:delegate:](v3, "setupCellWithTitle:completed:editable:date:buttonColor:buttonImageName:backgroundColor:recurringString:delegate:", CFSTR("Example"), 0, 1, v4, v5, v6, v7, CFSTR("Daily"), 0);

  return v3;
}

- (void)setupCellWithTitle:(id)a3 completed:(BOOL)a4 editable:(BOOL)a5 date:(id)a6 buttonColor:(id)a7 buttonImageName:(id)a8 backgroundColor:(id)a9 recurringString:(id)a10 delegate:(id)a11
{
  _BOOL4 v14;
  _BOOL4 v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  EKExpandedReminderStackCell *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;

  v14 = a5;
  v15 = a4;
  v55 = a3;
  v54 = a10;
  v17 = a9;
  v51 = a8;
  v52 = a7;
  v18 = a6;
  objc_storeWeak((id *)&self->_delegate, a11);
  -[UIView setBackgroundColor:](self->_backgroundColorView, "setBackgroundColor:", v17);

  -[UILabel setText:](self->_title, "setText:", v55);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DC1138]);

  v49 = v22;
  if (!v14 || v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;
  v25 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0DC1140]);

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v55, v19);
  -[UILabel setAttributedText:](self->_title, "setAttributedText:");
  v26 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v26, "setTimeStyle:", 1);
  objc_msgSend(v26, "setDateStyle:", 0);
  objc_msgSend(v26, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v26, "stringFromDate:", v18);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v27 = (void *)MEMORY[0x1E0DC12B0];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("repeat"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "textAttachmentWithImage:", v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x1E0CB3498]);
    EventKitUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("%@, %@ %@"), &stru_1E601DFA8, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v26;
    v34 = self;
    v35 = v25;
    v36 = v19;
    v37 = v20;
    v38 = (void *)objc_msgSend(v30, "initWithString:", v32);

    v39 = 0x1E0DC3000;
    objc_msgSend(MEMORY[0x1E0CB3778], "localizedAttributedStringWithFormat:", v38, v53, v29, v54);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v37;
    v19 = v36;
    v25 = v35;
    self = v34;
    v26 = v33;

  }
  else
  {
    v39 = 0x1E0DC3000uLL;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v53);
  }
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, v49);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, v25);

  objc_msgSend(v40, "addAttributes:range:", v41, 0, objc_msgSend(v40, "length"));
  -[UILabel setAttributedText:](self->_time, "setAttributedText:", v40);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "contentInsets");
  objc_msgSend(v44, "setContentInsets:");
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v20, *MEMORY[0x1E0DC1448]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v45, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v39 + 2160), "systemImageNamed:withConfiguration:", v51, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setImage:", v47);
  objc_msgSend(v44, "setBaseForegroundColor:", v52);

  -[UIButton setConfiguration:](self->_circle, "setConfiguration:", v44);
}

- (void)setVisibleForExpandingAnimation:(BOOL)a3
{
  UIButton *circle;
  void *v5;
  id *p_backgroundImageView;
  void *v7;

  circle = self->_circle;
  if (a3)
  {
    -[UIButton setAlpha:](circle, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_title, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_time, "setAlpha:", 1.0);
    -[UIView layer](self->_backgroundColorView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 12.0);

    -[UIView setAlpha:](self->_backgroundColorView, "setAlpha:", 1.0);
    p_backgroundImageView = (id *)&self->_backgroundImageView;
  }
  else
  {
    -[UIButton setAlpha:](circle, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_title, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_time, "setAlpha:", 0.0);
    p_backgroundImageView = (id *)&self->_backgroundColorView;
    -[UIView layer](self->_backgroundColorView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 0.0);

    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", 1.0);
  }
  objc_msgSend(*p_backgroundImageView, "setAlpha:", 0.0);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorView, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILabel)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (UIButton)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
  objc_storeStrong((id *)&self->_circle, a3);
}

- (UIImageView)recurringImageView
{
  return self->_recurringImageView;
}

- (void)setRecurringImageView:(id)a3
{
  objc_storeStrong((id *)&self->_recurringImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringImageView, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventIdentifer, 0);
}

@end
