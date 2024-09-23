@implementation HUAlarmTableViewCell

- (HUAlarmTableViewCell)initWithMobileTimerObject:(id)a3 roomName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUAlarmTableViewCell *v10;
  uint64_t v11;
  MTAlarm *alarm;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "alarm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAlarmTableViewCell.m"), 70, CFSTR("HUMobileTimerObject must wrap an alarm"));

  }
  v10 = -[HUAlarmTableViewCell init](self, "init");
  if (v10)
  {
    objc_msgSend(v7, "alarm");
    v11 = objc_claimAutoreleasedReturnValue();
    alarm = v10->_alarm;
    v10->_alarm = (MTAlarm *)v11;

    objc_msgSend(v7, "alarm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmTableViewCell refreshUI:roomName:animated:](v10, "refreshUI:roomName:animated:", v13, v8, 1);

  }
  return v10;
}

+ (id)timeFormatter
{
  if (qword_1ED57FAD0 != -1)
    dispatch_once(&qword_1ED57FAD0, &__block_literal_global_195);
  return (id)_MergedGlobals_1_5;
}

void __37__HUAlarmTableViewCell_timeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0D313F0]);
  objc_msgSend(v2, "timeFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_5;
  _MergedGlobals_1_5 = v0;

}

- (HUAlarmTableViewCell)init
{
  return -[HUAlarmTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, CFSTR("kHUAlarmTableViewCellReuseIdentifier"));
}

- (HUAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUAlarmTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSCalendar *calendar;
  void *v13;
  uint64_t v14;
  NSDate *baseDate;
  HUAlarmTableViewCell *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUAlarmTableViewCell;
  v4 = -[HUAlarmTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmTableViewCell setBackgroundView:](v4, "setBackgroundView:", v5);

      -[HUAlarmTableViewCell backgroundView](v4, "backgroundView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerRadius:", 8.0);

    }
    -[HUAlarmTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
    v8 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.forward"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithImage:", v9);
    -[HUAlarmTableViewCell setEditingAccessoryView:](v4, "setEditingAccessoryView:", v10);

    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v11 = objc_claimAutoreleasedReturnValue();
    calendar = v4->_calendar;
    v4->_calendar = (NSCalendar *)v11;

    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v4->_calendar, "setTimeZone:", v13);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v14 = objc_claimAutoreleasedReturnValue();
    baseDate = v4->_baseDate;
    v4->_baseDate = (NSDate *)v14;

    -[HUAlarmTableViewCell _createSubviews](v4, "_createSubviews");
    v16 = v4;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  -[HUAlarmTableViewCell _alarmBackgroundColor](self, "_alarmBackgroundColor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (id)_alarmBackgroundColor
{
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    -[HUAlarmTableViewCell backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_homePodControlCellBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
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
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[HUAlarmTableViewCell setEnabledSwitch:](self, "setEnabledSwitch:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOnTintColor:", v4);

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__alarmActiveChanged_, 4096);

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  v8 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUAlarmTableViewCell setNameAndDescriptionLabel:](self, "setNameAndDescriptionLabel:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB558], 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  v14 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUAlarmTableViewCell setTimeLabel:](self, "setTimeLabel:", v14);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB5B0], 1024);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D33718];
  objc_msgSend(v15, "fontDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontDescriptorWithMonospacedDigitsForFontDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v19);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  v23 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v24;
  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v26);
  -[HUAlarmTableViewCell setLabelsStackView:](self, "setLabelsStackView:", v27);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAxis:", 1);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlignment:", 1);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDistribution:", 4);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAlarmTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  -[HUAlarmTableViewCell _alarmBackgroundColor](self, "_alarmBackgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v34);

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAlarmTableViewCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v37);

  -[HUAlarmTableViewCell _setupConstraints](self, "_setupConstraints");
}

- (void)refreshUI:(id)a3 roomName:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  self->_enabled = objc_msgSend(v9, "isEnabled");
  objc_msgSend(v9, "repeatSchedule");
  DetailDateMaskToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell _setTimeLabelToHour:minute:](self, "_setTimeLabelToHour:minute:", objc_msgSend(v9, "hour"), objc_msgSend(v9, "minute"));
  objc_msgSend(v9, "displayTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    HULocalizedStringWithFormat(CFSTR("HUAlarmTextLabelAdditionalInfoFormat"), CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v19;
  }
  if (objc_msgSend(v10, "length"))
  {
    HULocalizedStringWithFormat(CFSTR("HUAlarmTextLabelAdditionalInfoFormat"), CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v27;
  }
  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v11);

  -[HUAlarmTableViewCell nameAndDescriptionLabel](self, "nameAndDescriptionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeToFit");

  -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sizeToFit");

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setOn:animated:", self->_enabled, 0);

  if (self->_enabled)
    objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsDisabledTextColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_enabled)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsDisabledTextColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CEABB0];
  if (v5)
    v35 = 0.2;
  else
    v35 = 0.0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __52__HUAlarmTableViewCell_refreshUI_roomName_animated___block_invoke;
  v38[3] = &unk_1E6F4E020;
  v38[4] = self;
  v39 = v32;
  v40 = v33;
  v36 = v33;
  v37 = v32;
  objc_msgSend(v34, "animateWithDuration:animations:", v38, v35);

}

void __52__HUAlarmTableViewCell_refreshUI_roomName_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "timeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v2);

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "nameAndDescriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = (id)objc_opt_new();
  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 20.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v7);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v12);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v17);

  -[HUAlarmTableViewCell labelsStackView](self, "labelsStackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v22);

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -12.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v27);

  -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v32);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  if (self->_disabled != a3)
  {
    v4 = !a3;
    -[HUAlarmTableViewCell enabledSwitch](self, "enabledSwitch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v4);

    -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v4);

  }
}

- (void)_alarmActiveChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HUAlarmTableViewCell window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HUAlarmTableViewCell__alarmActiveChanged___block_invoke;
  v9[3] = &unk_1E6F4C638;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

void __44__HUAlarmTableViewCell__alarmActiveChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "isOn");
    v7 = 138412802;
    v8 = v3;
    v9 = 2080;
    v10 = "-[HUAlarmTableViewCell _alarmActiveChanged:]_block_invoke";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s alarm toggled to %{BOOL}d", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlarmEnabled:forCell:", objc_msgSend(*(id *)(a1 + 40), "isOn"), *(_QWORD *)(a1 + 32));

}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmTableViewCell;
  -[HUAlarmTableViewCell willTransitionToState:](&v4, sel_willTransitionToState_, a3);
  -[HUAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAlarmTableViewCell;
  -[HUAlarmTableViewCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[HUAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAlarmTableViewCell;
  -[HUAlarmTableViewCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[HUAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  objc_super v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = a4;
  v5 = a3;
  v7 = 0.2;
  if (!a4)
    v7 = 0.0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HUAlarmTableViewCell_setEditing_animated___block_invoke;
  v9[3] = &unk_1E6F4D200;
  v9[4] = self;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v9, v7);
  v8.receiver = self;
  v8.super_class = (Class)HUAlarmTableViewCell;
  -[HUAlarmTableViewCell setEditing:animated:](&v8, sel_setEditing_animated_, v5, v4);
}

uint64_t __44__HUAlarmTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 15.0;
  if (*(_BYTE *)(a1 + 40))
    v1 = 45.0;
  return objc_msgSend(*(id *)(a1 + 32), "setSeparatorInset:", 0.0, v1, 0.0, 0.0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAlarmTableViewCell;
  -[HUAlarmTableViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[HUAlarmTableViewCell _alarmBackgroundColor](self, "_alarmBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HUAlarmTableViewCell layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 8.0);

  -[HUAlarmTableViewCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (void)_setTimeLabelToHour:(int64_t)a3 minute:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend((id)objc_opt_class(), "timeFormatter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 1644, self->_baseDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  -[HUAlarmTableViewCell calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmTableViewCell timeLabel](self, "timeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_alarm, a3);
}

- (HUAlarmTableViewCellDelegate)delegate
{
  return (HUAlarmTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSDate)baseDate
{
  return self->_baseDate;
}

- (void)setBaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_baseDate, a3);
}

- (UILabel)nameAndDescriptionLabel
{
  return self->_nameAndDescriptionLabel;
}

- (void)setNameAndDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameAndDescriptionLabel, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelsStackView, a3);
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (void)setEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSwitch, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_nameAndDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
