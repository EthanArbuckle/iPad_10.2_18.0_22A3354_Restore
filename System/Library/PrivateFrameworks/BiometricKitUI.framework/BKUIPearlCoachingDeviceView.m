@implementation BKUIPearlCoachingDeviceView

- (BKUIPearlCoachingDeviceView)initWithSheetLayout:(BOOL)a3
{
  _BOOL4 v3;
  BKUIPearlCoachingDeviceView *v4;
  BKUIPearlCoachingDeviceView *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
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
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  char v60;
  id location;
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[7];

  v3 = a3;
  v64[5] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)BKUIPearlCoachingDeviceView;
  v4 = -[BKUIPearlCoachingDeviceView init](&v62, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_inSheet = v3;
    if (v3)
      v6 = 180.0;
    else
      v6 = 300.0;
    v7 = MGGetProductType();
    if (v7 > 2619317133)
    {
      if (v7 == 3241053352)
        goto LABEL_11;
      v8 = 2619317134;
    }
    else
    {
      if (v7 == 555503454)
        goto LABEL_11;
      v8 = 2487868872;
    }
    if (v7 != v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("ipad-%i-j3xx"), objc_msgSend(v10, "intValue"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("ipad-%i-landscape"), objc_msgSend(v10, "intValue"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 1;
LABEL_13:

    v12 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView traitCollection](v5, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", v57, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView setDeviceImage:](v5, "setDeviceImage:", v15);

    v16 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[BKUIPearlCoachingDeviceView deviceImage](v5, "deviceImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithImage:", v17);
    -[BKUIPearlCoachingDeviceView setDeviceView:](v5, "setDeviceView:", v18);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.125490196, 0.580392157, 0.980392157, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v19);

    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentMode:", 1);

    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView addSubview:](v5, "addSubview:", v23);

    -[BKUIPearlCoachingDeviceView deviceImage](v5, "deviceImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v25;
    -[BKUIPearlCoachingDeviceView deviceImage](v5, "deviceImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    v29 = v28;

    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = fmax(v6, v26 * (v6 / v29));
    objc_msgSend(v31, "constraintEqualToConstant:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView setHeightConstraint:](v5, "setHeightConstraint:", v33);

    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView setWidthConstraint:](v5, "setWidthConstraint:", v36);

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView centerXAnchor](v5, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v53;
    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView centerYAnchor](v5, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v38;
    -[BKUIPearlCoachingDeviceView deviceView](v5, "deviceView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView bottomAnchor](v5, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v42;
    -[BKUIPearlCoachingDeviceView heightConstraint](v5, "heightConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v43;
    -[BKUIPearlCoachingDeviceView widthConstraint](v5, "widthConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v45);

    objc_initWeak(&location, v5);
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __51__BKUIPearlCoachingDeviceView_initWithSheetLayout___block_invoke;
    v58[3] = &unk_1EA2804E0;
    objc_copyWeak(&v59, &location);
    v60 = v50;
    -[BKUIPearlCoachingDeviceView registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v46, v58);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView setTraitChangeRegistration:](v5, "setTraitChangeRegistration:", v47);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __51__BKUIPearlCoachingDeviceView_initWithSheetLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");
  v8 = objc_msgSend(v5, "horizontalSizeClass");

  if (v7 != v8)
  {
    if (objc_msgSend(WeakRetained, "inSheet"))
      v9 = 180.0;
    else
      v9 = 300.0;
    v10 = *(unsigned __int8 *)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");
    if (v10)
      v14 = CFSTR("ipad-%i-landscape");
    else
      v14 = CFSTR("ipad-%i-j3xx");
    objc_msgSend(v11, "stringWithFormat:", v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "deviceImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v17;
    objc_msgSend(WeakRetained, "deviceImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v21 = v18 * (v9 / v20);

    v22 = fmax(v9, v21);
    v23 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setDeviceImage:", v26);

    objc_msgSend(WeakRetained, "heightConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setConstant:", v22);

    objc_msgSend(WeakRetained, "widthConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setConstant:", v22);

    objc_msgSend(WeakRetained, "deviceView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutIfNeeded");

  }
}

- (void)startAnimation
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  int64_t v8;
  double v9;
  int64_t v10;
  NSObject *v11;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  int64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Coaching: startAnimation", buf, 2u);
  }

  if (!-[BKUIPearlCoachingDeviceView animationRunning](self, "animationRunning"))
  {
    -[BKUIPearlCoachingDeviceView setAnimationRunning:](self, "setAnimationRunning:", 1);
    v4 = MGGetProductType();
    if (v4 > 2619317133)
    {
      if (v4 == 2619317134)
        goto LABEL_10;
      v5 = 3241053352;
    }
    else
    {
      if (v4 == 555503454)
        goto LABEL_10;
      v5 = 2487868872;
    }
    if (v4 != v5)
    {
      v8 = -[BKUIPearlCoachingDeviceView orientation](self, "orientation");
      v9 = 0.0;
      if (v8 != 1)
      {
        if (-[BKUIPearlCoachingDeviceView orientation](self, "orientation", 0.0) == 4)
        {
          v9 = -1.57079633;
        }
        else if (-[BKUIPearlCoachingDeviceView orientation](self, "orientation") == 3)
        {
          v9 = 1.57079633;
        }
        else
        {
          v10 = -[BKUIPearlCoachingDeviceView orientation](self, "orientation");
          v9 = 3.14159265;
          if (v10 != 2)
            v9 = 0.0;
        }
      }
      v7 = -v9;
      goto LABEL_20;
    }
LABEL_10:
    v6 = -[BKUIPearlCoachingDeviceView orientation](self, "orientation") - 1;
    v7 = 0.0;
    if (v6 < 3)
      v7 = dbl_1DB2DF680[v6];
LABEL_20:
    _BKUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[BKUIPearlCoachingDeviceView orientation](self, "orientation");
      *(_DWORD *)buf = 134218240;
      v16 = v12;
      v17 = 2048;
      v18 = v7;
      _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Coaching: self.orientation = %lu, rotation = %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke;
    v13[3] = &unk_1EA27FB70;
    objc_copyWeak(&v14, (id *)buf);
    -[BKUIPearlCoachingDeviceView rotateDeviceToAngle:animated:completion:](self, "rotateDeviceToAngle:animated:completion:", v7 != 0.0, v13, v7);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_2;
  v3[3] = &unk_1EA27FB70;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "setDeviceHidden:animated:completion:", 1, 1, v3);
  objc_destroyWeak(&v4);

}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetDevice");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_3;
  v3[3] = &unk_1EA27FB70;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "setDeviceHidden:animated:completion:", 0, 1, v3);
  objc_destroyWeak(&v4);

}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAnimationRunning:", 0);
  objc_msgSend(WeakRetained, "startAnimation");

}

- (void)stopAnimation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[BKUIPearlCoachingDeviceView deviceView](self, "deviceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimationRemoveStroke");

  -[BKUIPearlCoachingDeviceView setAnimationRunning:](self, "setAnimationRunning:", 0);
}

- (void)resetDevice
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v19[8];

  -[BKUIPearlCoachingDeviceView stopAnimation](self, "stopAnimation");
  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetLayout");

  -[BKUIPearlCoachingDeviceView deviceView](self, "deviceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v19[5] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v19[7] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v19[0] = *MEMORY[0x1E0CD2610];
  v19[1] = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v19[3] = v9;
  objc_msgSend(v5, "setTransform:", v19);

  v10 = -[BKUIPearlCoachingDeviceView orientation](self, "orientation");
  if ((unint64_t)(v10 - 2) > 2)
    v11 = 0;
  else
    v11 = qword_1DB2DF698[v10 - 2];
  v12 = objc_alloc(MEMORY[0x1E0CEA638]);
  -[BKUIPearlCoachingDeviceView deviceImage](self, "deviceImage");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGImage");
  -[BKUIPearlCoachingDeviceView deviceImage](self, "deviceImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v16 = (void *)objc_msgSend(v12, "initWithCGImage:scale:orientation:", v14, v11);
  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIPearlCoachingDeviceView deviceView](self, "deviceView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

}

- (void)rotateDeviceToAngle:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];

  v5 = a4;
  v8 = a5;
  v9 = dbl_1DB2DF630[fabs(a3) > 1.57079633];
  -[BKUIPearlCoachingDeviceView center](self, "center");
  v11 = v10;
  v13 = v12;
  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPosition:", v11, v13);

  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsLayout");

  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.8;
  objc_msgSend(v17, "animateDirectionPath:orientation:duration:animationDelay:", -[BKUIPearlCoachingDeviceView orientation](self, "orientation"), a3, v9, 0.8);

  v19 = (void *)MEMORY[0x1E0CEABB0];
  if (!v5)
  {
    v9 = 0.0;
    v18 = 0.0;
  }
  v22 = v8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke;
  v23[3] = &unk_1EA2801E8;
  v23[4] = self;
  *(double *)&v23[5] = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke_2;
  v21[3] = &unk_1EA27FF90;
  v20 = v8;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0, v23, v21, v9, v18);

}

void __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeRotation(&v4, *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "deviceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

uint64_t __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  BOOL v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    v3 = a2 == 0;
  else
    v3 = 1;
  if (!v3)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BKUIRotationArrowAnimationLayer)animationLayer
{
  void *v3;
  void *v4;
  BKUIRotationArrowAnimationLayer *v5;
  BKUIRotationArrowAnimationLayer *animationLayer;
  _QWORD v8[5];

  if (!self->_animationLayer)
  {
    -[BKUIPearlCoachingDeviceView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCoachingDeviceView _colorForStroke](self, "_colorForStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__BKUIPearlCoachingDeviceView_animationLayer__block_invoke;
    v8[3] = &unk_1EA280508;
    v8[4] = self;
    +[BKUIRotationArrowAnimationLayer animatorByEmbedding:color:radiusForOrientation:](BKUIRotationArrowAnimationLayer, "animatorByEmbedding:color:radiusForOrientation:", v3, v4, v8);
    v5 = (BKUIRotationArrowAnimationLayer *)objc_claimAutoreleasedReturnValue();
    animationLayer = self->_animationLayer;
    self->_animationLayer = v5;

  }
  -[BKUIPearlCoachingDeviceView center](self, "center");
  -[BKUIRotationArrowAnimationLayer setPosition:](self->_animationLayer, "setPosition:");
  return self->_animationLayer;
}

double __45__BKUIPearlCoachingDeviceView_animationLayer__block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  double v8;
  int v9;
  double v10;

  v4 = objc_msgSend(*(id *)(a1 + 32), "inSheet");
  v5 = MGGetProductType();
  if (v5 <= 2619317133)
  {
    if (v5 != 555503454)
    {
      v6 = 2487868872;
      goto LABEL_6;
    }
LABEL_7:
    v7 = objc_msgSend(*(id *)(a1 + 32), "isDisplayZoomEnabled");
    if (a2 == 4 && (v7 & 1) != 0)
      v8 = 400.0;
    else
      v8 = dbl_1DB2DF640[a2 == 3];
    goto LABEL_15;
  }
  if (v5 == 3241053352)
    goto LABEL_7;
  v6 = 2619317134;
LABEL_6:
  if (v5 == v6)
    goto LABEL_7;
  v9 = objc_msgSend(*(id *)(a1 + 32), "isDisplayZoomEnabled");
  v8 = 670.0;
  if (v9)
    v8 = 400.0;
  if (a2 != 2)
    v8 = 583.0;
LABEL_15:
  v10 = 2.0;
  if (v4)
    v10 = 3.5;
  return v8 / v10;
}

- (void)layoutSubviews
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUIPearlCoachingDeviceView;
  -[BKUIPearlCoachingDeviceView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = -[BKUIPearlCoachingDeviceView animationLayer](self, "animationLayer");
  -[BKUIPearlCoachingDeviceView center](self, "center");
  -[BKUIRotationArrowAnimationLayer setPosition:](self->_animationLayer, "setPosition:");
}

- (void)setDeviceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  BOOL v17;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = 0.6;
  v10 = (void *)MEMORY[0x1E0CEABB0];
  if (v6)
    v9 = 1.1;
  if (v5)
    v11 = v9;
  else
    v11 = 0.0;
  if (v5)
    v12 = 0.2;
  else
    v12 = 0.0;
  v15 = v8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke;
  v16[3] = &unk_1EA280410;
  v16[4] = self;
  v17 = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke_2;
  v14[3] = &unk_1EA27FF90;
  v13 = v8;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 0, v16, v14, v12, v11);

}

void __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "deviceView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  id v4;

  self->_orientation = a3;
  -[BKUIPearlCoachingDeviceView resetDevice](self, "resetDevice");
  -[BKUIPearlCoachingDeviceView deviceView](self, "deviceView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (id)_colorForStroke
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.490196079, 1.0, 1.0);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImage, a3);
}

- (UIImageView)deviceView
{
  return self->_deviceView;
}

- (void)setDeviceView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceView, a3);
}

- (void)setAnimationLayer:(id)a3
{
  objc_storeStrong((id *)&self->_animationLayer, a3);
}

- (BOOL)animationRunning
{
  return self->_animationRunning;
}

- (void)setAnimationRunning:(BOOL)a3
{
  self->_animationRunning = a3;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_animationLayer, 0);
  objc_storeStrong((id *)&self->_deviceView, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
}

@end
