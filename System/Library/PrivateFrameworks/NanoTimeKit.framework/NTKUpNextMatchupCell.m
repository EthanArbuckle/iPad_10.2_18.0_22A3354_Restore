@implementation NTKUpNextMatchupCell

- (NTKUpNextMatchupCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NTKUpNextMatchupCell *v7;
  NTKUpNextMatchupCell *v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UILayoutGuide *v21;
  UILayoutGuide *scoreLayoutGuide;
  void *v23;
  NTKUpNextMatchupScoreView *v24;
  NTKUpNextMatchupScoreView *scoreView;
  void *v26;
  UILayoutGuide *v27;
  UILayoutGuide *upcomingLayoutGuide;
  void *v29;
  NTKUpNextMatchupUpcomingView *v30;
  NTKUpNextMatchupUpcomingView *upcomingView;
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
  objc_super v92;
  _QWORD v93[18];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v93[16] = *MEMORY[0x1E0C80C00];
  v92.receiver = self;
  v92.super_class = (Class)NTKUpNextMatchupCell;
  v7 = -[NTKUpNextBaseCell initWithFrame:](&v92, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[NTKUpNextBaseCell device](v7, "device");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_62);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_62);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      v12 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_62);
      if (v12 == v9)
      {
        v13 = objc_msgSend(v9, "version");
        v14 = _LayoutConstants___previousCLKDeviceVersion_62;

        if (v13 == v14)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_62);
          v17 = *(double *)&_LayoutConstants_constants_1_7;
          v18 = *(double *)&_LayoutConstants_constants_3_5;
          v19 = *(double *)&_LayoutConstants_constants_5_2;
          v20 = *(double *)&_LayoutConstants_constants_7_2;

          v21 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          scoreLayoutGuide = v8->_scoreLayoutGuide;
          v8->_scoreLayoutGuide = v21;

          -[UILayoutGuide setIdentifier:](v8->_scoreLayoutGuide, "setIdentifier:", CFSTR("NTKUpNextMatchupCellScoreGuide"));
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addLayoutGuide:", v8->_scoreLayoutGuide);

          v24 = -[NTKUpNextMatchupScoreView initWithFrame:]([NTKUpNextMatchupScoreView alloc], "initWithFrame:", x, y, width, height);
          scoreView = v8->_scoreView;
          v8->_scoreView = v24;

          -[NTKUpNextMatchupScoreView setTranslatesAutoresizingMaskIntoConstraints:](v8->_scoreView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addSubview:", v8->_scoreView);

          v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
          upcomingLayoutGuide = v8->_upcomingLayoutGuide;
          v8->_upcomingLayoutGuide = v27;

          -[UILayoutGuide setIdentifier:](v8->_upcomingLayoutGuide, "setIdentifier:", CFSTR("NTKUpNextMatchupCellUpcomingGuide"));
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addLayoutGuide:", v8->_upcomingLayoutGuide);

          v30 = -[NTKUpNextMatchupUpcomingView initWithFrame:]([NTKUpNextMatchupUpcomingView alloc], "initWithFrame:", x, y, width, height);
          upcomingView = v8->_upcomingView;
          v8->_upcomingView = v30;

          -[NTKUpNextMatchupUpcomingView setTranslatesAutoresizingMaskIntoConstraints:](v8->_upcomingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addSubview:", v8->_upcomingView);

          -[UILayoutGuide topAnchor](v8->_scoreLayoutGuide, "topAnchor");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "topAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, 0.0);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = v88;
          -[UILayoutGuide bottomAnchor](v8->_scoreLayoutGuide, "bottomAnchor");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "bottomAnchor");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, -0.0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v93[1] = v84;
          -[UILayoutGuide leadingAnchor](v8->_scoreLayoutGuide, "leadingAnchor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "leadingAnchor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, v17);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v93[2] = v80;
          -[UILayoutGuide trailingAnchor](v8->_scoreLayoutGuide, "trailingAnchor");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "trailingAnchor");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -v18);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v93[3] = v76;
          -[NTKUpNextMatchupScoreView topAnchor](v8->_scoreView, "topAnchor");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide topAnchor](v8->_scoreLayoutGuide, "topAnchor");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "constraintEqualToAnchor:", v74);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v93[4] = v73;
          -[NTKUpNextMatchupScoreView bottomAnchor](v8->_scoreView, "bottomAnchor");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide bottomAnchor](v8->_scoreLayoutGuide, "bottomAnchor");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "constraintEqualToAnchor:", v71);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v93[5] = v70;
          -[NTKUpNextMatchupScoreView leadingAnchor](v8->_scoreView, "leadingAnchor");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v8->_scoreLayoutGuide, "leadingAnchor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "constraintEqualToAnchor:", v68);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v93[6] = v67;
          -[NTKUpNextMatchupScoreView trailingAnchor](v8->_scoreView, "trailingAnchor");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v8->_scoreLayoutGuide, "trailingAnchor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "constraintEqualToAnchor:", v65);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v93[7] = v64;
          -[UILayoutGuide topAnchor](v8->_upcomingLayoutGuide, "topAnchor");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "topAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 0.0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v93[8] = v60;
          -[UILayoutGuide bottomAnchor](v8->_upcomingLayoutGuide, "bottomAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "bottomAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "constraintEqualToAnchor:constant:", v56, -0.0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v93[9] = v55;
          -[UILayoutGuide leadingAnchor](v8->_upcomingLayoutGuide, "leadingAnchor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "leadingAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, v19);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v93[10] = v51;
          -[UILayoutGuide trailingAnchor](v8->_upcomingLayoutGuide, "trailingAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "trailingAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -v20);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v93[11] = v47;
          -[NTKUpNextMatchupUpcomingView topAnchor](v8->_upcomingView, "topAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide topAnchor](v8->_upcomingLayoutGuide, "topAnchor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "constraintEqualToAnchor:", v45);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v93[12] = v44;
          -[NTKUpNextMatchupUpcomingView bottomAnchor](v8->_upcomingView, "bottomAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide bottomAnchor](v8->_upcomingLayoutGuide, "bottomAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "constraintEqualToAnchor:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v93[13] = v35;
          -[NTKUpNextMatchupUpcomingView leadingAnchor](v8->_upcomingView, "leadingAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide leadingAnchor](v8->_upcomingLayoutGuide, "leadingAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "constraintEqualToAnchor:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v93[14] = v38;
          -[NTKUpNextMatchupUpcomingView trailingAnchor](v8->_upcomingView, "trailingAnchor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v8->_upcomingLayoutGuide, "trailingAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "constraintEqualToAnchor:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v93[15] = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 16);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          -[NTKUpNextMatchupCell contentView](v8, "contentView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addConstraints:", v57);

          return v8;
        }
      }
      else
      {

      }
    }
    v15 = objc_storeWeak(&_LayoutConstants___cachedDevice_62, v9);
    _LayoutConstants___previousCLKDeviceVersion_62 = objc_msgSend(v9, "version");

    ___LayoutConstants_block_invoke_59(v16, (uint64_t)v9);
    goto LABEL_7;
  }
  return v8;
}

- (void)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextMatchupCell;
  v4 = a3;
  -[NTKUpNextBaseCell configureWithContent:](&v8, sel_configureWithContent_, v4);
  objc_msgSend(v4, "matchupAccessory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKUpNextMatchupScoreView configureWithMatchup:](self->_scoreView, "configureWithMatchup:", v5);
  -[NTKUpNextMatchupUpcomingView configureWithMatchup:](self->_upcomingView, "configureWithMatchup:", v5);
  v6 = objc_msgSend(v5, "status");
  v7 = (v6 < 8) & (0xECu >> v6);
  -[NTKUpNextMatchupScoreView setHidden:](self->_scoreView, "setHidden:", !((v6 < 8) & (0xECu >> v6)));
  -[NTKUpNextMatchupUpcomingView setHidden:](self->_upcomingView, "setHidden:", v7);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextMatchupCell;
  -[NTKUpNextBaseCell prepareForReuse](&v3, sel_prepareForReuse);
  -[NTKUpNextMatchupScoreView transitionToMonochromeWithFraction:](self->_scoreView, "transitionToMonochromeWithFraction:", 0.0);
  -[NTKUpNextMatchupUpcomingView transitionToMonochromeWithFraction:](self->_upcomingView, "transitionToMonochromeWithFraction:", 0.0);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextMatchupScoreView transitionToMonochromeWithFraction:](self->_scoreView, "transitionToMonochromeWithFraction:");
  -[NTKUpNextMatchupUpcomingView transitionToMonochromeWithFraction:](self->_upcomingView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[NTKUpNextMatchupScoreView updateMonochromeColor](self->_scoreView, "updateMonochromeColor");
  -[NTKUpNextMatchupUpcomingView updateMonochromeColor](self->_upcomingView, "updateMonochromeColor");
}

- (void)setFilterProvider:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMatchupCell;
  v4 = a3;
  -[NTKUpNextBaseCell setFilterProvider:](&v5, sel_setFilterProvider_, v4);
  -[NTKUpNextMatchupScoreView setFilterProvider:](self->_scoreView, "setFilterProvider:", v4, v5.receiver, v5.super_class);
  -[NTKUpNextMatchupUpcomingView setFilterProvider:](self->_upcomingView, "setFilterProvider:", v4);

}

- (void)updateTimeLabel
{
  -[NTKUpNextMatchupScoreView updateTimeLabel](self->_scoreView, "updateTimeLabel");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMatchupCell;
  -[NTKUpNextBaseCell setPaused:](&v5, sel_setPaused_);
  -[NTKUpNextMatchupScoreView setPaused:](self->_scoreView, "setPaused:", v3);
  -[NTKUpNextMatchupUpcomingView setPaused:](self->_upcomingView, "setPaused:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upcomingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scoreLayoutGuide, 0);
  objc_storeStrong((id *)&self->_upcomingView, 0);
  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end
