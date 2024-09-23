@implementation EKReminderTitleDetailCell

- (EKReminderTitleDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  EKReminderTitleDetailCell *v12;
  EKReminderTitleDetailCell *v13;
  UILabel *v14;
  UILabel *title;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id *p_event;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UILabel *v45;
  UILabel *subtitle;
  void *v47;
  double v48;
  UIView *v49;
  UIView *background;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  UIButton *editButton;
  double v56;
  void *v57;
  UIButton *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  UIButton *circle;
  double v68;
  double v69;
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
  id WeakRetained;
  UIButton *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id obj;
  id v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  _QWORD v141[4];
  id v142;
  objc_super v143;
  id location[5];
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[3];
  _QWORD v150[11];
  uint64_t v151;
  _QWORD v152[3];

  v7 = a5;
  v152[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  obj = a6;
  v143.receiver = self;
  v143.super_class = (Class)EKReminderTitleDetailCell;
  v131 = v10;
  v132 = v11;
  v12 = -[EKReminderDetailCell initWithEvent:reminder:editable:](&v143, sel_initWithEvent_reminder_editable_, v10, v11, v7);
  v13 = v12;
  if (v12)
  {
    -[EKReminderTitleDetailCell setSeparatorInset:](v12, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    objc_storeWeak((id *)&v13->_delegate, obj);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v13->_title;
    v13->_title = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v13->_title, "setNumberOfLines:", 0);
    v136 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v136, "setObject:forKeyedSubscript:", v16);

    -[EKEvent title](v13->super.super._event, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13->_title, "setText:", v17);

    if ((-[EKEvent completed](v13->super.super._event, "completed") & 1) != 0
      || (-[EKEvent CUIK_reminderShouldBeEditable](v13->super.super._event, "CUIK_reminderShouldBeEditable") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DC1140]);

    }
    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    p_event = (id *)&v13->super.super._event;
    -[EKEvent title](v13->super.super._event, "title");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1E601DFA8;
    v126 = (void *)objc_msgSend(v19, "initWithString:attributes:", v23, v136);

    -[UILabel setAttributedText:](v13->_title, "setAttributedText:", v126);
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v13->_title);

    LODWORD(v25) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v13->_title, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    v139 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v139, "setTimeStyle:", objc_msgSend(*p_event, "isAllDay") ^ 1);
    objc_msgSend(v139, "setDateStyle:", 1);
    objc_msgSend(v139, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(*p_event, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "stringFromDate:", v26);
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*p_event, "hasRecurrenceRules"))
    {
      v27 = (void *)MEMORY[0x1E0DC12B0];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("repeat"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textAttachmentWithImage:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x1E0CB3498]);
      EventKitUIBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("%@, %@ %@"), &stru_1E601DFA8, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v31, "initWithString:", v33);

      v145 = 0;
      v146 = &v145;
      v147 = 0x2050000000;
      v35 = (void *)getREMRecurrenceRuleFormatterClass_softClass_0;
      v148 = getREMRecurrenceRuleFormatterClass_softClass_0;
      if (!getREMRecurrenceRuleFormatterClass_softClass_0)
      {
        location[0] = (id)MEMORY[0x1E0C809B0];
        location[1] = (id)3221225472;
        location[2] = __getREMRecurrenceRuleFormatterClass_block_invoke_0;
        location[3] = &unk_1E6018EE8;
        location[4] = &v145;
        __getREMRecurrenceRuleFormatterClass_block_invoke_0((uint64_t)location);
        v35 = (void *)v146[3];
      }
      v36 = objc_retainAutorelease(v35);
      _Block_object_dispose(&v145, 8);
      objc_msgSend(v132, "recurrenceRules");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent startDate](v13->super.super._event, "startDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent eventStore](v13->super.super._event, "eventStore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeZone");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shortNaturalLanguageDescriptionForRecurrenceRule:date:timeZone:lowercase:", v38, v39, v41, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3778], "localizedAttributedStringWithFormat:", v34, v125, v30, v42);
      v137 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v125);
    }
    v138 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setObject:forKeyedSubscript:", v43, v127);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0DC1140]);

    objc_msgSend(v137, "addAttributes:range:", v138, 0, objc_msgSend(v137, "length"));
    v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitle = v13->_subtitle;
    v13->_subtitle = v45;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_subtitle, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v13->_subtitle, "setNumberOfLines:", 0);
    -[UILabel setAttributedText:](v13->_subtitle, "setAttributedText:", v137);
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v13->_subtitle);

    LODWORD(v48) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v13->_subtitle, "setContentCompressionResistancePriority:forAxis:", 1, v48);
    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    background = v13->_background;
    v13->_background = v49;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13->_background, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->_background, "setBackgroundColor:", v51);

    -[UIView layer](v13->_background, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setCornerRadius:", 12.0);

    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v13->_background);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v54 = objc_claimAutoreleasedReturnValue();
    editButton = v13->_editButton;
    v13->_editButton = (UIButton *)v54;

    LODWORD(v56) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v13->_editButton, "setContentCompressionResistancePriority:forAxis:", 0, v56);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_editButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Edit"), &stru_1E601DFA8, 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v13->_editButton;
    v59 = objc_alloc(MEMORY[0x1E0CB3498]);
    v151 = v127;
    v152[0] = v124;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initWithString:attributes:", v123, v60);
    -[UIButton setAttributedTitle:forState:](v58, "setAttributedTitle:forState:", v61, 0);

    -[UIButton addTarget:action:forControlEvents:](v13->_editButton, "addTarget:action:forControlEvents:", v13, sel__editButtonTapped, 64);
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSubview:", v13->_editButton);

    objc_initWeak(location, v13);
    v63 = (void *)MEMORY[0x1E0DC3428];
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __70__EKReminderTitleDetailCell_initWithEvent_reminder_editable_delegate___block_invoke;
    v141[3] = &unk_1E6019DA8;
    objc_copyWeak(&v142, location);
    objc_msgSend(v63, "actionWithHandler:", v141);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)MEMORY[0x1E0DC3518];
    -[EKReminderTitleDetailCell _buttonConfigForReminder:](v13, "_buttonConfigForReminder:", v13->super.super._event);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "buttonWithConfiguration:primaryAction:", v65, v128);
    v66 = objc_claimAutoreleasedReturnValue();
    circle = v13->_circle;
    v13->_circle = (UIButton *)v66;

    LODWORD(v68) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v13->_circle, "setContentCompressionResistancePriority:forAxis:", 0, v68);
    LODWORD(v69) = 1144750080;
    -[UIButton setContentHuggingPriority:forAxis:](v13->_circle, "setContentHuggingPriority:forAxis:", 0, v69);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_circle, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSubview:", v13->_circle);

    -[EKEventDetailCell event](v13, "event");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setUserInteractionEnabled:](v13->_circle, "setUserInteractionEnabled:", objc_msgSend(v71, "CUIK_reminderShouldBeEditable"));

    v133 = (void *)MEMORY[0x1E0C99DE8];
    -[UIButton leadingAnchor](v13->_circle, "leadingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v13->_background, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:constant:", v119, 11.0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = v118;
    -[UIButton firstBaselineAnchor](v13->_circle, "firstBaselineAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v13->_title, "firstBaselineAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToAnchor:", v117);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v150[1] = v115;
    -[UILabel leadingAnchor](v13->_title, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v13->_circle, "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:constant:", v113, 11.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v150[2] = v112;
    -[UILabel topAnchor](v13->_title, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v13->_background, "topAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, 11.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v150[3] = v109;
    -[UILabel bottomAnchor](v13->_title, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v13->_subtitle, "topAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, -4.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v150[4] = v106;
    -[UILabel trailingAnchor](v13->_title, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v13->_background, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:constant:", v105, -11.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v150[5] = v103;
    -[UILabel leadingAnchor](v13->_subtitle, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v13->_title, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v150[6] = v100;
    -[UILabel bottomAnchor](v13->_subtitle, "bottomAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v13->_background, "bottomAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v99, -11.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v150[7] = v97;
    -[UILabel trailingAnchor](v13->_subtitle, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v13->_title, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v129);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v150[8] = v95;
    -[UIView leadingAnchor](v13->_background, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "layoutMarginsGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v150[9] = v74;
    -[UIView trailingAnchor](v13->_background, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderTitleDetailCell contentView](v13, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v150[10] = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 11);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "arrayWithArray:", v80);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
    LODWORD(v73) = objc_msgSend(WeakRetained, "shouldShowEditButtonInline");

    v82 = v13->_editButton;
    if ((_DWORD)v73)
    {
      -[UIButton setHidden:](v82, "setHidden:", 0);
      -[UIView topAnchor](v13->_background, "topAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton bottomAnchor](v13->_editButton, "bottomAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v149[0] = v84;
      -[UIButton trailingAnchor](v13->_editButton, "trailingAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderTitleDetailCell contentView](v13, "contentView");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "layoutMarginsGuide");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "trailingAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToAnchor:", v120);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v149[1] = v86;
      -[UIButton topAnchor](v13->_editButton, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderTitleDetailCell contentView](v13, "contentView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v149[2] = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 3);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "addObjectsFromArray:", v91);

    }
    else
    {
      -[UIButton setHidden:](v82, "setHidden:", 1);
      -[UIView topAnchor](v13->_background, "topAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderTitleDetailCell contentView](v13, "contentView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "topAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "addObject:", v85);
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v134);
    -[EKReminderTitleDetailCell setupConstraintsWithExtraSpace:](v13, "setupConstraintsWithExtraSpace:", v13->_showExtraSpaceAtBottom);

    objc_destroyWeak(&v142);
    objc_destroyWeak(location);

  }
  return v13;
}

void __70__EKReminderTitleDetailCell_initWithEvent_reminder_editable_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  int v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "event");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "CUIK_reminderShouldBeEditable");

    WeakRetained = v5;
    if (v3)
    {
      v4 = objc_loadWeakRetained(v5 + 147);
      objc_msgSend(v4, "reminderToggled");

      WeakRetained = v5;
    }
  }

}

- (void)setupConstraintsWithExtraSpace:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *bottomConstraint;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (self->_bottomConstraint)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    v15[0] = self->_bottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  -[UIView bottomAnchor](self->_background, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderTitleDetailCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, -15.0);
  else
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v10;

  v12 = (void *)MEMORY[0x1E0CB3718];
  v14 = self->_bottomConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  if (self->_showExtraSpaceAtBottom != a3)
  {
    self->_showExtraSpaceAtBottom = a3;
    -[EKReminderTitleDetailCell setupConstraintsWithExtraSpace:](self, "setupConstraintsWithExtraSpace:");
  }
}

- (void)_editButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "editButtonPressed");

}

- (id)_buttonConfigForReminder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v4, "setContentInsets:");
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3870];
  if (v3)
  {
    objc_msgSend(v3, "CUIK_symbolName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v9);

    if ((objc_msgSend(v3, "CUIK_reminderShouldBeEditable") & 1) != 0)
      objc_msgSend(v3, "CUIK_symbolColor");
    else
      objc_msgSend(v3, "CUIK_disabledSymbolColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseForegroundColor:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", *MEMORY[0x1E0D0CA38], v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v10);
  }

  return v4;
}

- (BOOL)showExtraSpaceAtBottom
{
  return self->_showExtraSpaceAtBottom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
