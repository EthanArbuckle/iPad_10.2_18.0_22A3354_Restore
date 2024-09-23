@implementation _SFSettingsAlertStepper

- (_SFSettingsAlertStepper)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _SFSettingsAlertStepper *v7;
  _SFSettingsAlertStepper *v8;
  _SFSettingsAlertStepper *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[_SFSettingsAlertStepper initUsingResetButton:usingTopSeparator:](self, "initUsingResetButton:usingTopSeparator:", 1, 0);
  v8 = v7;
  if (v7)
  {
    -[_SFSettingsAlertStepper setFrame:](v7, "setFrame:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

+ (id)stepperForBrowsingAssistant
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (id *)objc_msgSend(objc_alloc((Class)a1), "initUsingResetButton:usingTopSeparator:", 0, 0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[64], "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredSymbolConfiguration:", v3);

  objc_msgSend(v2[63], "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v3);

  objc_msgSend(v2, "setDefaultBackgroundMode:", 0);
  return v2;
}

- (id)initUsingResetButton:(BOOL)a3 usingTopSeparator:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _SFSettingsAlertStepper *v6;
  _SFSettingsAlertStepper *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  float v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
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
  _BOOL4 v68;
  void *v69;
  void *v70;
  _SFSettingsAlertStepper *v71;
  void *v72;
  _QWORD v73[4];
  id *v74;
  objc_super v75;
  void *v76;
  _QWORD v77[5];
  _QWORD v78[9];

  v4 = a4;
  v5 = a3;
  v78[7] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)_SFSettingsAlertStepper;
  v6 = -[_SFSettingsAlertControl initWithFrame:](&v75, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    if (v4)
      v8 = 3;
    else
      v8 = 5;
    -[_SFSettingsAlertControl setDefaultBackgroundMode:](v6, "setDefaultBackgroundMode:", v8);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertStepper setTintColor:](v7, "setTintColor:", v9);

    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __66___SFSettingsAlertStepper_initUsingResetButton_usingTopSeparator___block_invoke;
    v73[3] = &unk_1E4AC55A8;
    v71 = v7;
    v10 = v7;
    v74 = v10;
    v11 = MEMORY[0x1A8598C40](v73);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v11, sel__decrementTapped_, 6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v10[64];
    v10[64] = (id)v12;

    objc_msgSend(v10[64], "setAccessibilityIdentifier:", CFSTR("Decrement"));
    (*(void (**)(uint64_t, char *, _QWORD))(v11 + 16))(v11, sel__incrementTapped_, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v10[63];
    v10[63] = (id)v14;

    objc_msgSend(v10[63], "setAccessibilityIdentifier:", CFSTR("Increment"));
    v68 = v5;
    if (v5)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v11, sel__resetTapped_, 6);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v10[65];
      v10[65] = (id)v16;

      objc_msgSend(v10[65], "setAccessibilityIdentifier:", CFSTR("Reset"));
    }
    v70 = (void *)v11;
    objc_msgSend(v10[63], "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10[64], "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v21) = 1144733696;
    objc_msgSend(v20, "setPriority:", v21);
    _SFOnePixel();
    v23 = v22;
    if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isBrowsingAssistantEnabled"))
      v23 = 0.0;
    v55 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v10[64], "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v63);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v61;
    objc_msgSend(v10[64], "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v57;
    objc_msgSend(v10[64], "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -v23;
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v54, v24);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v53;
    objc_msgSend(v10[63], "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v26;
    objc_msgSend(v10[63], "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v29;
    objc_msgSend(v10[63], "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v78[5] = v32;
    v78[6] = v20;
    v72 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v33);

    if (v68)
    {
      objc_msgSend(v10[65], "widthAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[63], "widthAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "priority");
      *(float *)&v38 = v37 + -1.0;
      objc_msgSend(v36, "setPriority:", v38);
      v64 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10[65], "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[64], "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v40;
      objc_msgSend(v10[65], "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v66);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v62;
      objc_msgSend(v10[65], "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _SFOnePixel();
      objc_msgSend(v60, "constraintEqualToAnchor:constant:", v41, -v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v43;
      objc_msgSend(v10[63], "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[65], "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v77[3] = v46;
      v77[4] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "activateConstraints:", v47);

      v48 = v69;
    }
    else
    {
      v49 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10[63], "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[64], "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v48);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "activateConstraints:", v40);
    }

    v50 = v10;
    v7 = v71;
  }

  return v7;
}

- (void)_incrementTapped:(id)a3
{
  self->_value = 0;
  -[_SFSettingsAlertStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_decrementTapped:(id)a3
{
  self->_value = 1;
  -[_SFSettingsAlertStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_resetTapped:(id)a3
{
  self->_value = 2;
  -[_SFSettingsAlertStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)setImage:(id)a3 forButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_SFSettingsAlertStepper _button:](self, "_button:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_SFSettingsAlertStepper _button:](self, "_button:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[_SFSettingsAlertStepper _button:](self, "_button:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (id)_button:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.super.super.super.super.isa + *off_1E4AC55C8[a3]);
  return (id)(id)a2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _SFSettingsAlertStepper *v5;
  _SFSettingsAlertStepper *v6;
  _SFSettingsAlertStepper *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertStepper;
  -[_SFSettingsAlertStepper hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_SFSettingsAlertStepper *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (int64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);
  objc_storeStrong((id *)&self->_incrementButton, 0);
}

@end
