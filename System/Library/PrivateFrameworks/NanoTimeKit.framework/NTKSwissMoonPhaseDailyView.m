@implementation NTKSwissMoonPhaseDailyView

- (NTKSwissMoonPhaseDailyView)initWithFrame:(CGRect)a3
{
  NTKSwissMoonPhaseDailyView *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *v17;
  double v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  UILabel *dayLabel;
  NTKAstronomyRichComplicationContentView *v26;
  void *v27;
  NTKAstronomyRichComplicationContentView *v28;
  double v29;
  NTKAstronomyRichComplicationContentView *moonView;
  UILabel *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  UILabel *weekdayLabel;
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
  objc_super v63;

  v63.receiver = self;
  v63.super_class = (Class)NTKSwissMoonPhaseDailyView;
  v3 = -[NTKSwissMoonPhaseDailyView initWithFrame:](&v63, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_63);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_63);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_63);
      if (v7 == v4)
      {
        v8 = objc_msgSend(v4, "version");
        v9 = _LayoutConstants___previousCLKDeviceVersion_63;

        if (v8 == v9)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_63);
          v12 = *(double *)&_LayoutConstants_constants_0_7;
          v13 = *(double *)&_LayoutConstants_constants_1_8;
          v14 = *(double *)&_LayoutConstants_constants_2_7;
          v15 = *(double *)&_LayoutConstants_constants_3_6;
          v16 = *(double *)&_LayoutConstants_constants_4_4;

          v17 = (UILabel *)objc_opt_new();
          v18 = *MEMORY[0x1E0DC1448];
          v19 = (_QWORD *)MEMORY[0x1E0C940A8];
          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v12, *MEMORY[0x1E0DC1448]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v17, "setFont:", v20);

          objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v17, "setTextColor:", v21);

          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          LODWORD(v22) = 1144750080;
          -[UILabel setContentHuggingPriority:forAxis:](v17, "setContentHuggingPriority:forAxis:", 0, v22);
          LODWORD(v23) = 1144750080;
          -[UILabel setContentHuggingPriority:forAxis:](v17, "setContentHuggingPriority:forAxis:", 1, v23);
          LODWORD(v24) = 1148846080;
          -[UILabel setContentCompressionResistancePriority:forAxis:](v17, "setContentCompressionResistancePriority:forAxis:", 0, v24);
          dayLabel = v3->_dayLabel;
          v3->_dayLabel = v17;

          -[NTKSwissMoonPhaseDailyView addSubview:](v3, "addSubview:", v3->_dayLabel);
          v26 = [NTKAstronomyRichComplicationContentView alloc];
          objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[NTKAstronomyRichComplicationContentView initForDevice:family:diameter:](v26, "initForDevice:family:diameter:", v27, 10, v14);

          -[NTKAstronomyRichComplicationContentView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          LODWORD(v29) = 1132068864;
          -[NTKAstronomyRichComplicationContentView setContentHuggingPriority:forAxis:](v28, "setContentHuggingPriority:forAxis:", 1, v29);
          moonView = v3->_moonView;
          v3->_moonView = v28;

          -[NTKSwissMoonPhaseDailyView addSubview:](v3, "addSubview:", v3->_moonView);
          v31 = (UILabel *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v19, v15, v18);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v31, "setFont:", v32);

          -[UILabel setTextAlignment:](v31, "setTextAlignment:", 1);
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v31, "setTextColor:", v33);

          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          LODWORD(v34) = 1144750080;
          -[UILabel setContentHuggingPriority:forAxis:](v31, "setContentHuggingPriority:forAxis:", 0, v34);
          LODWORD(v35) = 1144750080;
          -[UILabel setContentHuggingPriority:forAxis:](v31, "setContentHuggingPriority:forAxis:", 1, v35);
          LODWORD(v36) = 1148846080;
          -[UILabel setContentCompressionResistancePriority:forAxis:](v31, "setContentCompressionResistancePriority:forAxis:", 0, v36);
          weekdayLabel = v3->_weekdayLabel;
          v3->_weekdayLabel = v31;

          -[NTKSwissMoonPhaseDailyView addSubview:](v3, "addSubview:", v3->_weekdayLabel);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel centerXAnchor](v3->_dayLabel, "centerXAnchor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKSwissMoonPhaseDailyView centerXAnchor](v3, "centerXAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "constraintEqualToAnchor:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v41);

          -[UILabel firstBaselineAnchor](v3->_dayLabel, "firstBaselineAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKSwissMoonPhaseDailyView topAnchor](v3, "topAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, v13);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

          -[NTKAstronomyRichComplicationContentView centerXAnchor](v3->_moonView, "centerXAnchor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKSwissMoonPhaseDailyView centerXAnchor](v3, "centerXAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "constraintEqualToAnchor:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v47);

          -[NTKAstronomyRichComplicationContentView centerYAnchor](v3->_moonView, "centerYAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKSwissMoonPhaseDailyView centerYAnchor](v3, "centerYAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "constraintEqualToAnchor:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v50);

          -[NTKAstronomyRichComplicationContentView widthAnchor](v3->_moonView, "widthAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "constraintEqualToConstant:", v14);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v52);

          -[NTKAstronomyRichComplicationContentView heightAnchor](v3->_moonView, "heightAnchor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKAstronomyRichComplicationContentView widthAnchor](v3->_moonView, "widthAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "constraintEqualToAnchor:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v55);

          -[UILabel centerXAnchor](v3->_weekdayLabel, "centerXAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKSwissMoonPhaseDailyView centerXAnchor](v3, "centerXAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintEqualToAnchor:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v58);

          -[NTKSwissMoonPhaseDailyView bottomAnchor](v3, "bottomAnchor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel firstBaselineAnchor](v3->_weekdayLabel, "firstBaselineAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, v16);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v61);

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v38);
          return v3;
        }
      }
      else
      {

      }
    }
    v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_63, v4);
    _LayoutConstants___previousCLKDeviceVersion_63 = objc_msgSend(v4, "version");

    ___LayoutConstants_block_invoke_60(v11, (uint64_t)v4);
    goto LABEL_7;
  }
  return v3;
}

- (UILabel)dayLabel
{
  return self->_dayLabel;
}

- (void)setDayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dayLabel, a3);
}

- (NTKAstronomyRichComplicationContentView)moonView
{
  return self->_moonView;
}

- (void)setMoonView:(id)a3
{
  objc_storeStrong((id *)&self->_moonView, a3);
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (void)setWeekdayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_weekdayLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_moonView, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end
