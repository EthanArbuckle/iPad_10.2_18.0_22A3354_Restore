@implementation HUTimerTableViewCell

- (HUTimerTableViewCell)initWithTimer:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  HUTimerTableViewCell *v9;
  HUTimerTableViewCell *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUTimerTableViewCell;
  v9 = -[HUTimerTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 0, CFSTR("kHUTimerCellReuseIdentifier"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timer, a3);
    objc_storeStrong((id *)&v10->_timerManager, a4);
    objc_msgSend(v7, "remainingTime");
    v10->_previousRemainingTime = v11;
    -[HUTimerTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
    -[HUTimerTableViewCell setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerTableViewCell setBackgroundView:](v10, "setBackgroundView:", v12);

      -[HUTimerTableViewCell backgroundView](v10, "backgroundView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerRadius:", 8.0);

    }
    -[HUTimerTableViewCell _alarmBackgroundColor](v10, "_alarmBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTableViewCell setBackgroundColor:](v10, "setBackgroundColor:", v15);

    -[HUTimerTableViewCell _createSubviews](v10, "_createSubviews");
    -[HUTimerTableViewCell _createConstraints](v10, "_createConstraints");
  }

  return v10;
}

- (HUTimerTableViewCell)initWithMobileTimerObject:(id)a3 manager:(id)a4 roomName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HUTimerTableViewCell *v14;
  void *v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "timer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerTableViewCell.m"), 86, CFSTR("HUMobileTimerObject must wrap a timer"));

  }
  -[HUTimerTableViewCell setRoomName:](self, "setRoomName:", v9);
  objc_msgSend(v11, "timer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HUTimerTableViewCell initWithTimer:manager:](self, "initWithTimer:manager:", v13, v10);
  return v14;
}

+ (id)_stringForDuration:(double)a3
{
  uint64_t v4;

  if (qword_1EF226998 != -1)
    dispatch_once(&qword_1EF226998, &__block_literal_global_4);
  if (a3 >= 3600.0)
    v4 = 224;
  else
    v4 = 192;
  objc_msgSend((id)_MergedGlobals_3, "setAllowedUnits:", v4);
  return (id)objc_msgSend((id)_MergedGlobals_3, "stringFromTimeInterval:", a3);
}

uint64_t __43__HUTimerTableViewCell__stringForDuration___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_3, "setUnitsStyle:", 0);
  return objc_msgSend((id)_MergedGlobals_3, "setZeroFormattingBehavior:", 0x10000);
}

- (void)_createSubviews
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HUTimerCancelButtonView *v50;
  void *v51;
  void *v52;
  void *v53;
  HUTimerCountdownView *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  HUTimerCountdownView *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[3];

  v66[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEA710]);
  -[HUTimerTableViewCell setButtonGuide:](self, "setButtonGuide:", v3);

  -[HUTimerTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addLayoutGuide:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUTimerTableViewCell setTimerNameLabel:](self, "setTimerNameLabel:", v6);

  -[HUTimerTableViewCell timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerLabelNoName"), CFSTR("HUTimerLabelNoName"), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[HUTimerTableViewCell roomName](self, "roomName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[HUTimerTableViewCell roomName](self, "roomName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUAlarmTextLabelAdditionalInfoFormat"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v22;
  }
  -[HUTimerTableViewCell timerNameLabel](self, "timerNameLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB558], 1024);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerNameLabel](self, "timerNameLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerNameLabel](self, "timerNameLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  v28 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUTimerTableViewCell setTimerTimeLabel:](self, "setTimerTimeLabel:", v28);

  -[HUTimerTableViewCell timerTimeLabel](self, "timerTimeLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timer](self, "timer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "remainingTime");
  +[HUTimerTableViewCell _stringForDuration:](HUTimerTableViewCell, "_stringForDuration:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v31);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB5B0], 1024);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0D33718];
  objc_msgSend(v32, "fontDescriptor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "fontDescriptorWithMonospacedDigitsForFontDescriptor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v35, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerTimeLabel](self, "timerTimeLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFont:", v36);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerTimeLabel](self, "timerTimeLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTextColor:", v38);

  v40 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  -[HUTimerTableViewCell timerNameLabel](self, "timerNameLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v41;
  -[HUTimerTableViewCell timerTimeLabel](self, "timerTimeLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v40, "initWithArrangedSubviews:", v43);
  -[HUTimerTableViewCell setStackView:](self, "setStackView:", v44);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAxis:", 1);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAlignment:", 1);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTimerTableViewCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell stackView](self, "stackView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v49);

  v50 = -[HUTimerCancelButtonView initWithDelegate:]([HUTimerCancelButtonView alloc], "initWithDelegate:", self);
  -[HUTimerTableViewCell setCancelButtonView:](self, "setCancelButtonView:", v50);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTimerTableViewCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", v53);

  v54 = [HUTimerCountdownView alloc];
  -[HUTimerTableViewCell timer](self, "timer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "remainingTime");
  v57 = v56;
  -[HUTimerTableViewCell timer](self, "timer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "state");
  -[HUTimerTableViewCell timer](self, "timer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "duration");
  v62 = -[HUTimerCountdownView initWithRemainingTime:state:duration:delegate:](v54, "initWithRemainingTime:state:duration:delegate:", v59, self, v57, v61);
  -[HUTimerTableViewCell setTimerCountdownView:](self, "setTimerCountdownView:", v62);

  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUTimerTableViewCell contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSubview:", v65);

}

- (void)_createConstraints
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
  id v84;

  v84 = (id)objc_opt_new();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 20.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v7);

  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v12);

  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v17);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v22);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v27);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 20.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v32);

  -[HUTimerTableViewCell stackView](self, "stackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v37);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v42);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v47);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v52);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToConstant:", 48.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v55);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v60);

  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell contentView](self, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, -20.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v65);

  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell buttonGuide](self, "buttonGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v70);

  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", 48.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v73);

  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v78);

  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell cancelButtonView](self, "cancelButtonView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v82, -10.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v83);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v84);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  -[HUTimerTableViewCell _alarmBackgroundColor](self, "_alarmBackgroundColor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (id)_alarmBackgroundColor
{
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    -[HUTimerTableViewCell backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_homePodControlCellBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTimerTableViewCell;
  -[HUTimerTableViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[HUTimerTableViewCell _alarmBackgroundColor](self, "_alarmBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HUTimerTableViewCell layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 8.0);

  -[HUTimerTableViewCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (void)updateTimerInfo
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HUTimerTableViewCell previousRemainingTime](self, "previousRemainingTime");
  v4 = v3;
  -[HUTimerTableViewCell timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remainingTime");
  v7 = v6;

  if (v4 != v7)
  {
    -[HUTimerTableViewCell timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remainingTime");
    -[HUTimerTableViewCell setPreviousRemainingTime:](self, "setPreviousRemainingTime:");

    -[HUTimerTableViewCell timerTimeLabel](self, "timerTimeLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTableViewCell timer](self, "timer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remainingTime");
    +[HUTimerTableViewCell _stringForDuration:](HUTimerTableViewCell, "_stringForDuration:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v11);

    -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTableViewCell timer](self, "timer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remainingTime");
    objc_msgSend(v12, "updateToNewTime:");

  }
  -[HUTimerTableViewCell timerCountdownView](self, "timerCountdownView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timer](self, "timer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateToNewState:", objc_msgSend(v14, "state"));

}

- (void)toggleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  HUTimerTableViewCell *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUTimerTableViewCell timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2080;
    v21 = "-[HUTimerTableViewCell toggleTimer]";
    v22 = 2048;
    v23 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s toggling timer (current state = %lu)", buf, 0x20u);

  }
  -[HUTimerTableViewCell timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 == 3)
    v7 = 2;
  else
    v7 = 3;
  -[HUTimerTableViewCell timer](self, "timer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timerByUpdatingWithState:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTimerTableViewCell timerManager](self, "timerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateTimer:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reschedule:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__HUTimerTableViewCell_toggleTimer__block_invoke;
  v16[3] = &unk_1E6F4C820;
  v16[4] = self;
  v17 = v9;
  v14 = v9;
  v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v16);

}

uint64_t __35__HUTimerTableViewCell_toggleTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v3;
    v8 = 2080;
    v9 = "-[HUTimerTableViewCell toggleTimer]_block_invoke";
    v10 = 2048;
    v11 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s timer toggled (new state = %lu)", (uint8_t *)&v6, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateTimerInfo");
}

- (void)cancelTimer
{
  void *v3;
  id v4;
  id v5;

  -[HUTimerTableViewCell timerManager](self, "timerManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimerTableViewCell timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "removeTimer:", v3);

}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (COTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (UILabel)timerNameLabel
{
  return self->_timerNameLabel;
}

- (void)setTimerNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timerNameLabel, a3);
}

- (UILabel)timerTimeLabel
{
  return self->_timerTimeLabel;
}

- (void)setTimerTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timerTimeLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILayoutGuide)buttonGuide
{
  return self->_buttonGuide;
}

- (void)setButtonGuide:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGuide, a3);
}

- (HUTimerCountdownView)timerCountdownView
{
  return self->_timerCountdownView;
}

- (void)setTimerCountdownView:(id)a3
{
  objc_storeStrong((id *)&self->_timerCountdownView, a3);
}

- (HUTimerCancelButtonView)cancelButtonView
{
  return self->_cancelButtonView;
}

- (void)setCancelButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonView, a3);
}

- (double)previousRemainingTime
{
  return self->_previousRemainingTime;
}

- (void)setPreviousRemainingTime:(double)a3
{
  self->_previousRemainingTime = a3;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_cancelButtonView, 0);
  objc_storeStrong((id *)&self->_timerCountdownView, 0);
  objc_storeStrong((id *)&self->_buttonGuide, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_timerTimeLabel, 0);
  objc_storeStrong((id *)&self->_timerNameLabel, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
