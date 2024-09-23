@implementation NTKUpNextMatchupUpcomingView

- (NTKUpNextMatchupUpcomingView)initWithFrame:(CGRect)a3
{
  NTKUpNextMatchupUpcomingView *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  UIImageView *homeLogoImageView;
  uint64_t v25;
  UIImageView *awayLogoImageView;
  CLKUIColoringLabel *v27;
  CLKUIColoringLabel *versusLabel;
  CLKUIColoringLabel *v29;
  void *v30;
  CLKUIColoringLabel *descriptionLabel;
  UILayoutGuide *v32;
  UILayoutGuide *homeLogoLayoutGuide;
  UILayoutGuide *v34;
  UILayoutGuide *awayLogoLayoutGuide;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  CLKUIColoringLabel *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  CLKUIColoringLabel *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  objc_super v104;
  _QWORD v105[22];

  v105[20] = *MEMORY[0x1E0C80C00];
  v104.receiver = self;
  v104.super_class = (Class)NTKUpNextMatchupUpcomingView;
  v3 = -[NTKUpNextMatchupUpcomingView initWithFrame:](&v104, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_20);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_20);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_20);
      if (v9 == v6)
      {
        v10 = objc_msgSend(v6, "version");
        v11 = _LayoutConstants___previousCLKDeviceVersion_20;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_20);
          v14 = *(double *)&_LayoutConstants_constants_0_2;
          v15 = *(double *)&_LayoutConstants_constants_1_2;
          v97 = *(double *)&_LayoutConstants_constants_2_2;
          v16 = *(double *)&_LayoutConstants_constants_3_1;
          v17 = *(double *)&_LayoutConstants_constants_4_1;

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc(MEMORY[0x1E0DC3890]);
          v19 = *MEMORY[0x1E0C9D648];
          v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
          homeLogoImageView = v3->_homeLogoImageView;
          v3->_homeLogoImageView = (UIImageView *)v23;

          -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_homeLogoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[UIImageView setContentMode:](v3->_homeLogoImageView, "setContentMode:", 1);
          -[NTKUpNextMatchupUpcomingView addSubview:](v3, "addSubview:", v3->_homeLogoImageView);
          v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v19, v20, v21, v22);
          awayLogoImageView = v3->_awayLogoImageView;
          v3->_awayLogoImageView = (UIImageView *)v25;

          -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_awayLogoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[UIImageView setContentMode:](v3->_awayLogoImageView, "setContentMode:", 1);
          -[NTKUpNextMatchupUpcomingView addSubview:](v3, "addSubview:", v3->_awayLogoImageView);
          NTKClockFaceLocalizedString(CFSTR("UP_NEXT_MATCHUP_VERSUS"), CFSTR("vs"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v103);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "finalize");
          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v14);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:", v19, v20, v21, v22);
          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[CLKUIColoringLabel setTextColor:](v27, "setTextColor:", v102);
          -[CLKUIColoringLabel setFont:](v27, "setFont:", v101);
          -[CLKUIColoringLabel setTextProvider:](v27, "setTextProvider:", v100);
          -[NTKUpNextMatchupUpcomingView addSubview:](v3, "addSubview:", v27);
          v66 = v6;
          versusLabel = v3->_versusLabel;
          v3->_versusLabel = v27;
          v86 = v27;

          objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v15, *MEMORY[0x1E0DC1420]);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:", v19, v20, v21, v22);
          -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel setTextColor:](v29, "setTextColor:", v30);

          -[CLKUIColoringLabel setFont:](v29, "setFont:", v99);
          -[NTKUpNextMatchupUpcomingView addSubview:](v3, "addSubview:", v29);
          descriptionLabel = v3->_descriptionLabel;
          v3->_descriptionLabel = v29;
          v78 = v29;

          v32 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          homeLogoLayoutGuide = v3->_homeLogoLayoutGuide;
          v3->_homeLogoLayoutGuide = v32;

          -[UILayoutGuide setIdentifier:](v3->_homeLogoLayoutGuide, "setIdentifier:", CFSTR("NTKUpNextUpcomingHomeLogoView"));
          -[NTKUpNextMatchupUpcomingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_homeLogoLayoutGuide);
          v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          awayLogoLayoutGuide = v3->_awayLogoLayoutGuide;
          v3->_awayLogoLayoutGuide = v34;

          -[UILayoutGuide setIdentifier:](v3->_awayLogoLayoutGuide, "setIdentifier:", CFSTR("NTKUpNextUpcomingAwayLogoView"));
          -[NTKUpNextMatchupUpcomingView addLayoutGuide:](v3, "addLayoutGuide:", v3->_awayLogoLayoutGuide);
          -[UILayoutGuide leadingAnchor](v3->_homeLogoLayoutGuide, "leadingAnchor");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupUpcomingView leadingAnchor](v3, "leadingAnchor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "constraintEqualToAnchor:", v95);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v94;
          -[UILayoutGuide widthAnchor](v3->_homeLogoLayoutGuide, "widthAnchor");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "constraintEqualToConstant:", v16);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v105[1] = v92;
          -[UILayoutGuide heightAnchor](v3->_homeLogoLayoutGuide, "heightAnchor");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "constraintEqualToConstant:", v17);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v105[2] = v90;
          -[UILayoutGuide centerYAnchor](v3->_homeLogoLayoutGuide, "centerYAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel centerYAnchor](v3->_versusLabel, "centerYAnchor");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "constraintEqualToAnchor:", v88);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v105[3] = v87;
          -[UILayoutGuide trailingAnchor](v3->_awayLogoLayoutGuide, "trailingAnchor");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupUpcomingView trailingAnchor](v3, "trailingAnchor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "constraintEqualToAnchor:", v84);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v105[4] = v83;
          -[UILayoutGuide widthAnchor](v3->_awayLogoLayoutGuide, "widthAnchor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "constraintEqualToConstant:", v16);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v105[5] = v81;
          -[UILayoutGuide heightAnchor](v3->_awayLogoLayoutGuide, "heightAnchor");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "constraintEqualToConstant:", v17);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v105[6] = v79;
          -[UILayoutGuide centerYAnchor](v3->_awayLogoLayoutGuide, "centerYAnchor");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel centerYAnchor](v3->_versusLabel, "centerYAnchor");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "constraintEqualToAnchor:", v76);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v105[7] = v75;
          -[UIImageView centerXAnchor](v3->_homeLogoImageView, "centerXAnchor");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerXAnchor](v3->_homeLogoLayoutGuide, "centerXAnchor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "constraintEqualToAnchor:", v73);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v105[8] = v72;
          -[UIImageView centerYAnchor](v3->_homeLogoImageView, "centerYAnchor");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerYAnchor](v3->_homeLogoLayoutGuide, "centerYAnchor");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "constraintEqualToAnchor:", v70);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v105[9] = v69;
          -[UIImageView widthAnchor](v3->_homeLogoImageView, "widthAnchor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide widthAnchor](v3->_homeLogoLayoutGuide, "widthAnchor");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "constraintEqualToAnchor:", v67);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v105[10] = v65;
          -[UIImageView heightAnchor](v3->_homeLogoImageView, "heightAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide heightAnchor](v3->_homeLogoLayoutGuide, "heightAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "constraintEqualToAnchor:", v63);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v105[11] = v62;
          -[UIImageView centerXAnchor](v3->_awayLogoImageView, "centerXAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerXAnchor](v3->_awayLogoLayoutGuide, "centerXAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "constraintEqualToAnchor:", v60);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v105[12] = v59;
          -[UIImageView centerYAnchor](v3->_awayLogoImageView, "centerYAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerYAnchor](v3->_awayLogoLayoutGuide, "centerYAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "constraintEqualToAnchor:", v57);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v105[13] = v56;
          -[UIImageView widthAnchor](v3->_awayLogoImageView, "widthAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide widthAnchor](v3->_awayLogoLayoutGuide, "widthAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "constraintEqualToAnchor:", v54);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v105[14] = v53;
          -[UIImageView heightAnchor](v3->_awayLogoImageView, "heightAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide heightAnchor](v3->_awayLogoLayoutGuide, "heightAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "constraintEqualToAnchor:", v51);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v105[15] = v50;
          -[CLKUIColoringLabel centerXAnchor](v3->_versusLabel, "centerXAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupUpcomingView centerXAnchor](v3, "centerXAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "constraintEqualToAnchor:", v48);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v105[16] = v47;
          -[CLKUIColoringLabel centerYAnchor](v3->_versusLabel, "centerYAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupUpcomingView centerYAnchor](v3, "centerYAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel font](v3->_descriptionLabel, "font");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lineHeight");
          CLKRoundForDevice();
          objc_msgSend(v46, "constraintEqualToAnchor:constant:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v105[17] = v38;
          -[CLKUIColoringLabel centerXAnchor](v3->_descriptionLabel, "centerXAnchor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupUpcomingView centerXAnchor](v3, "centerXAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "constraintEqualToAnchor:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v105[18] = v41;
          -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLabel, "lastBaselineAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUIColoringLabel lastBaselineAnchor](v3->_versusLabel, "lastBaselineAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, v97);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v105[19] = v44;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 20);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          -[NTKUpNextMatchupUpcomingView addConstraints:](v3, "addConstraints:", v98);
          return v3;
        }
      }
      else
      {

      }
    }
    v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_20, v6);
    _LayoutConstants___previousCLKDeviceVersion_20 = objc_msgSend(v6, "version");

    ___LayoutConstants_block_invoke_17(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  return v3;
}

- (void)configureWithMatchup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "homeTeamImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_homeLogoImageView, "setImage:", v5);
  objc_msgSend(v23, "awayTeamImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_awayLogoImageView, "setImage:", v7);
  objc_msgSend(v23, "matchupStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v23, "status");
  if (v9 == 4 || v9 == 3)
  {
    v17 = (void *)MEMORY[0x1E0C94530];
    objc_msgSend(v23, "matchupProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textProviderWithText:", v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  if (v9 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C94560], "textProviderWithDate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NTKStartOfDayForDate(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NTKStartOfNextDayForDate(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NTKEndOfDayForDate(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v14);
    if (objc_msgSend(v15, "containsDate:", v8))
    {
      v16 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C944A8], "textProviderWithDate:units:", v8, 24);
      v22 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedString(CFSTR("UP_NEXT_MATCHUP_TIME_FORMAT"), CFSTR("%@, %@"));
      v21 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", v19, v10, v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v14 = v21;
      v12 = v22;
    }

    goto LABEL_10;
  }
  v16 = 0;
LABEL_11:
  -[CLKUIColoringLabel setTextProvider:](self->_descriptionLabel, "setTextProvider:", 0);
  -[CLKUIColoringLabel setText:](self->_descriptionLabel, "setText:", 0);
  objc_msgSend(v16, "finalize");
  -[CLKUIColoringLabel setTextProvider:](self->_descriptionLabel, "setTextProvider:", v16);
  -[CLKUIColoringLabel textProvider](self->_descriptionLabel, "textProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", -[NTKUpNextMatchupUpcomingView isPaused](self, "isPaused"));

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CLKUIColoringLabel textProvider](self->_descriptionLabel, "textProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v5;
  CLKUIColoringLabel *descriptionLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v5 = objc_claimAutoreleasedReturnValue();
  v16 = (id)v5;
  if (fabs(a3) >= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v16, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel setTextColor:](self->_versusLabel, "setTextColor:", v7);
    -[NTKUpNextMatchupUpcomingView filterProvider](self, "filterProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filtersForView:style:fraction:", self, 2, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CLKUIColoringLabel layer](self->_descriptionLabel, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFilters:", v10);

    }
    -[NTKUpNextMatchupUpcomingView filterProvider](self, "filterProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filtersForView:style:fraction:", self, 1, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIImageView layer](self->_awayLogoImageView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v13);

      -[UIImageView layer](self->_homeLogoImageView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFilters:", v13);

    }
  }
  else
  {
    -[CLKUIColoringLabel setTextColor:](self->_versusLabel, "setTextColor:", v5);
    descriptionLabel = self->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](descriptionLabel, "setTextColor:", v7);
  }

}

- (void)updateMonochromeColor
{
  CLKUIColoringLabel *versusLabel;
  void *v4;
  CLKUIColoringLabel *descriptionLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  versusLabel = self->_versusLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](versusLabel, "setTextColor:", v4);

  descriptionLabel = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](descriptionLabel, "setTextColor:", v6);

  -[NTKUpNextMatchupUpcomingView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", self, 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CLKUIColoringLabel layer](self->_descriptionLabel, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v13);

  }
  -[NTKUpNextMatchupUpcomingView filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:", self, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIImageView layer](self->_awayLogoImageView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v10);

    -[UIImageView layer](self->_homeLogoImageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v10);

  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_awayLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_homeLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_versusLabel, 0);
  objc_storeStrong((id *)&self->_awayLogoImageView, 0);
  objc_storeStrong((id *)&self->_homeLogoImageView, 0);
}

@end
