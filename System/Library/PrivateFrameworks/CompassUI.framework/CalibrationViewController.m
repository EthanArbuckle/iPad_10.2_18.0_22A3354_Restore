@implementation CalibrationViewController

- (CalibrationViewController)init
{
  return (CalibrationViewController *)MEMORY[0x24BEDD108](self, sel_initWithOriginPoint_);
}

- (CalibrationViewController)initWithOriginPoint:(CGPoint)a3
{
  double y;
  double x;
  CalibrationViewController *v5;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *calibrationConstraints;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)CalibrationViewController;
  v5 = -[CalibrationViewController init](&v14, sel_init);
  if (v5)
  {
    v5->_ticsShowingArray = (float *)malloc_type_calloc(0xB4uLL, 4uLL, 0x100004052888210uLL);
    v5->_angleToRim = 0.34906585;
    v5->_previousHorizontalAngle = -1.0;
    if (x != *MEMORY[0x24BDBEFB0] || y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      v5->_compassOriginPoint.x = x;
      v5->_compassOriginPoint.y = y;
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleForKey:", CFSTR("CalibrationAwesomeAngle"));
    v5->_calibrationAngle = v8 * 3.14159265 / 180.0;

    if (v5->_calibrationAngle == 0.0)
      v5->_calibrationAngle = 0.872664626;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_quantizationType = objc_msgSend(v9, "integerForKey:", CFSTR("CalibrationQuantizationType"));

    if (!v5->_quantizationType)
      v5->_quantizationType = 0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldCompleteTics = objc_msgSend(v10, "BOOLForKey:", CFSTR("CalibrationShouldCompleteTics"));

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    calibrationConstraints = v5->_calibrationConstraints;
    v5->_calibrationConstraints = v11;

  }
  return v5;
}

- (void)_updateSizes
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  double Width;
  void *v8;
  double Height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  double v31;
  void *v32;
  double v33;
  double compassRadius;
  double v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  -[CalibrationViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") == 2)
  {
    -[CalibrationViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verticalSizeClass") == 2;

  }
  else
  {
    v5 = 0;
  }

  -[CalibrationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v39);

  -[CalibrationViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Height = CGRectGetHeight(v40);

  if (Width >= Height)
    Width = Height;
  v10 = 203.0;
  v11 = round(Width * 100.0 / 320.0);
  if (!v5)
    v10 = v11;
  self->_compassRadius = v10;
  v12 = 0.0;
  -[CompassBackgroundView setFrame:](self->_compassBackgroundView, "setFrame:", 0.0, 0.0, Width, Width);
  -[CompassBackgroundView setTicRadius:](self->_compassBackgroundView, "setTicRadius:", self->_compassRadius);
  -[CompassBackgroundView center](self->_compassBackgroundView, "center");
  v14 = v13 - self->_compassRadius;
  -[CompassBackgroundView center](self->_compassBackgroundView, "center");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15 - self->_compassRadius, self->_compassRadius + self->_compassRadius, self->_compassRadius + self->_compassRadius);
  v16 = (void *)MEMORY[0x24BDF6A70];
  if (v5)
  {
    v17 = 24.0;
    v12 = 6.0;
    v18 = 4.0;
  }
  else
  {
    LODWORD(v37) = -798153473;
    v36 = xmmword_22825E0D0;
    v19 = MGIsDeviceOfType();
    v20 = 0.850000024;
    v18 = 1.0;
    if (!v19)
      v20 = 1.0;
    v17 = round(Width * 18.0 / 320.0) * v20;
  }
  objc_msgSend(v16, "systemFontOfSize:", v17, v36, v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v21);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointSize");
  v24 = v23;

  v25 = fmin(v24, 26.0);
  v26 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  LODWORD(v38) = -798153473;
  v30 = MGIsDeviceOfType();
  v31 = 0.850000024;
  if (!v30)
    v31 = 1.0;
  objc_msgSend(v26, "boldSystemFontOfSize:", v31 * round(v25 * v29 / 320.0), 0x6C743B9540D7A421, 0xBCD16A8CA16013ECLL, v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_instructionLabel, "setFont:", v32);

  -[CompassBackgroundView ticLength](self->_compassBackgroundView, "ticLength");
  -[CalibrationBallView setBallRadius:](self->_ballView, "setBallRadius:", v33 - v12);
  compassRadius = self->_compassRadius;
  -[CalibrationBallView ballRadius](self->_ballView, "ballRadius");
  -[CalibrationBallView setTrackRadius:](self->_ballView, "setTrackRadius:", compassRadius - v35 - v18);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CompassBackgroundView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CompassBackgroundView *v16;
  CompassBackgroundView *compassBackgroundView;
  CAShapeLayer *v18;
  CAShapeLayer *compassBackgroundViewMask;
  id v20;
  double v21;
  UILabel *v22;
  UILabel *titleLabel;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *instructionLabel;
  void *v30;
  void *v31;
  void *v32;
  UIButton *v33;
  UIButton *cancelButton;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIButton *v39;
  void *v40;
  void *v41;
  UIButton *v42;
  void *v43;
  UIButton *v44;
  void *v45;
  CalibrationBallView *v46;
  CalibrationBallView *ballView;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewDidLoad](&v55, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalibrationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CalibrationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  -[CalibrationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v8);

  v11 = [CompassBackgroundView alloc];
  v12 = *MEMORY[0x24BDBF090];
  v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v16 = -[CompassBackgroundView initWithFrame:forCompass:](v11, "initWithFrame:forCompass:", 0, *MEMORY[0x24BDBF090], v13, v14, v15);
  compassBackgroundView = self->_compassBackgroundView;
  self->_compassBackgroundView = v16;

  -[CompassBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](self->_compassBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_numCompleteTics = 0;
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v18 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  compassBackgroundViewMask = self->_compassBackgroundViewMask;
  self->_compassBackgroundViewMask = v18;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_compassBackgroundViewMask, "setFillColor:", objc_msgSend(v20, "CGColor"));

  -[CAShapeLayer setLineWidth:](self->_compassBackgroundViewMask, "setLineWidth:", 0.5);
  LODWORD(v21) = 1060320051;
  -[CAShapeLayer setOpacity:](self->_compassBackgroundViewMask, "setOpacity:", v21);
  -[CalibrationViewController reset](self, "reset");
  v22 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v12, v13, v14, v15);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v22;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v24);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Calibrate"), &stru_24F0D2678, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v26);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v27);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.699999988);
  v28 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v12, v13, v14, v15);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v28;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_instructionLabel, "setTextColor:", v30);

  -[UILabel setTextAlignment:](self->_instructionLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Tilt the screen to roll the ball around the circle"), &stru_24F0D2678, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_instructionLabel, "setText:", v32);

  -[UILabel setNumberOfLines:](self->_instructionLabel, "setNumberOfLines:", 3);
  -[CompassBackgroundView center](self->_compassBackgroundView, "center");
  -[UILabel setCenter:](self->_instructionLabel, "setCenter:");
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v33 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v33;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.400000006, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](self->_cancelButton, "setBackgroundColor:", v35);

  -[UIButton layer](self->_cancelButton, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerRadius:", 5.0);

  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v37);

  v39 = self->_cancelButton;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F0D2678, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v39, "setTitle:forState:", v41, 0);

  v42 = self->_cancelButton;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v42, "setTitleColor:forState:", v43, 0);

  v44 = self->_cancelButton;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v44, "setTitleColor:forState:", v45, 4);

  -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel_cancel, 64);
  v46 = -[CalibrationBallView initWithFrame:ballRadius:]([CalibrationBallView alloc], "initWithFrame:ballRadius:", v12, v13, v14, v15, 0.0);
  ballView = self->_ballView;
  self->_ballView = v46;

  -[CalibrationBallView setTranslatesAutoresizingMaskIntoConstraints:](self->_ballView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CalibrationViewController _updateSizes](self, "_updateSizes");
  -[CalibrationViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", self->_compassBackgroundView);

  -[CalibrationViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", self->_instructionLabel);

  -[CalibrationViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSublayer:", self->_compassBackgroundViewMask);

  -[CalibrationViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", self->_titleLabel);

  -[CalibrationViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSubview:", self->_ballView);

  -[CalibrationViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSubview:", self->_cancelButton);

}

- (void)userDefaultsChanged:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_quantizationType = objc_msgSend(v4, "integerForKey:", CFSTR("CalibrationQuantizationType"));

  if (!self->_quantizationType)
    self->_quantizationType = 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", CFSTR("CalibrationAwesomeAngle"));
  self->_calibrationAngle = v6 * 3.14159265 / 180.0;

  if (self->_calibrationAngle == 0.0)
    self->_calibrationAngle = 0.872664626;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  self->_shouldCompleteTics = objc_msgSend(v7, "BOOLForKey:", CFSTR("CalibrationShouldCompleteTics"));

}

- (float)quantizedPercentage:(double)a3 forAngle:(double)a4
{
  double v7;
  int quantizationType;
  float result;

  if (qword_255972B70 != -1)
    dispatch_once(&qword_255972B70, &unk_24F0D2390);
  v7 = fmax(cos((a4 * 2.0 + -270.0) * 3.14159265 / 180.0) * *(double *)&qword_255972B68, 0.0) + a3;
  quantizationType = self->_quantizationType;
  if (quantizationType)
  {
    if (quantizationType == 1)
    {
      result = 1.0;
      if (v7 > 0.660000026)
        return result;
      if (v7 > 0.330000013)
        return 0.66;
      if (v7 > 0.100000001)
        return 0.33;
    }
    else if (quantizationType == 2 && v7 > 0.100000001)
    {
      return v7;
    }
    return 0.1;
  }
  result = 1.0;
  if (v7 <= 0.5)
  {
    result = 0.5;
    if (v7 <= 0.100000001)
      return 0.1;
  }
  return result;
}

- (void)addConstraints
{
  void *v3;
  NSMutableArray *calibrationConstraints;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  CompassBackgroundView *compassBackgroundView;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  NSMutableArray *v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  NSMutableArray *v38;
  void *v39;
  UILabel *instructionLabel;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  void *v44;
  UIButton *cancelButton;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  NSMutableArray *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  double Width;
  void *v65;
  double Height;
  void *v67;
  double v68;
  double compassRadius;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  NSMutableArray *v85;
  void *v86;
  CompassBackgroundView *v87;
  void *v88;
  void *v89;
  NSMutableArray *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  NSMutableArray *v100;
  void *v101;
  CompassBackgroundView *v102;
  double v103;
  void *v104;
  CompassBackgroundView *v105;
  uint64_t v106;
  void *v107;
  double v108;
  void *v109;
  CompassBackgroundView *v110;
  void *v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[3];
  _QWORD v116[3];
  const __CFString *v117;
  _QWORD v118[3];
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v118[1] = *MEMORY[0x24BDAC8D0];
  -[CalibrationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", self->_calibrationConstraints);

  -[NSMutableArray removeAllObjects](self->_calibrationConstraints, "removeAllObjects");
  calibrationConstraints = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compassBackgroundView, 7, 0, self->_compassBackgroundView, 8, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](calibrationConstraints, "addObject:", v5);

  v6 = self->_calibrationConstraints;
  v7 = (void *)MEMORY[0x24BDD1628];
  compassBackgroundView = self->_compassBackgroundView;
  -[CalibrationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", compassBackgroundView, 9, 0, v9, 9, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v6, "addObject:", v10);

  -[CalibrationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  -[CalibrationViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;

  if (v13 >= v16)
    v17 = v16;
  else
    v17 = v13;
  v18 = self->_calibrationConstraints;
  v19 = (void *)MEMORY[0x24BDD1628];
  v117 = CFSTR("compassWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_compassBackgroundView"), self->_compassBackgroundView, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_compassBackgroundView(==compassWidth)]"), 0, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v18, "addObjectsFromArray:", v23);

  v24 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_ballView, 3, 0, self->_compassBackgroundView, 3, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v24, "addObject:", v25);

  v26 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_ballView, 1, 0, self->_compassBackgroundView, 1, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v26, "addObject:", v27);

  v28 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_ballView, 4, 0, self->_compassBackgroundView, 4, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v28, "addObject:", v29);

  v30 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_ballView, 2, 0, self->_compassBackgroundView, 2, 1.0, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v30, "addObject:", v31);

  v32 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 10, 0, self->_compassBackgroundView, 10, 1.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v32, "addObject:", v33);

  v34 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 9, 0, self->_compassBackgroundView, 9, 1.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v34, "addObject:", v35);

  v36 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionLabel, 9, 0, self->_compassBackgroundView, 9, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v36, "addObject:", v37);

  v38 = self->_calibrationConstraints;
  v39 = (void *)MEMORY[0x24BDD1628];
  instructionLabel = self->_instructionLabel;
  -[CalibrationViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", instructionLabel, 7, 0, v41, 7, 0.660000026, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v38, "addObject:", v42);

  v43 = self->_calibrationConstraints;
  v44 = (void *)MEMORY[0x24BDD1628];
  cancelButton = self->_cancelButton;
  -[CalibrationViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", cancelButton, 9, 0, v46, 9, 1.0, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v43, "addObject:", v47);

  v48 = self->_calibrationConstraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cancelButton, 7, 0, 0, 7, 1.0, 150.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v48, "addObject:", v49);

  -[CalibrationViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frame");
  v52 = v51;

  v53 = self->_calibrationConstraints;
  v54 = (v52 - (self->_compassRadius + v52 * 0.5 + 40.0 + 7.0)) * 0.5;
  v55 = (void *)MEMORY[0x24BDD1628];
  v115[0] = CFSTR("buttonHeight");
  v115[1] = CFSTR("buttonBottomMargin");
  v116[0] = &unk_24F0D39D8;
  v116[1] = &unk_24F0D39E8;
  v115[2] = CFSTR("instructionBottomMargin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v56;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_instructionLabel, _cancelButton"), self->_instructionLabel, self->_cancelButton, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_instructionLabel]-(instructionBottomMargin)-[_cancelButton(==buttonHeight)]-(buttonBottomMargin)-|"), 0, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v53, "addObjectsFromArray:", v59);

  -[CalibrationViewController traitCollection](self, "traitCollection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "horizontalSizeClass") == 2)
  {
    -[CalibrationViewController traitCollection](self, "traitCollection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "verticalSizeClass") == 2;

  }
  else
  {
    v62 = 0;
  }

  -[CalibrationViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "frame");
  Width = CGRectGetWidth(v119);

  -[CalibrationViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "frame");
  Height = CGRectGetHeight(v120);

  if (Width >= Height)
    Width = Height;
  -[CalibrationViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "frame");
  v68 = CGRectGetWidth(v121);

  compassRadius = self->_compassRadius;
  -[CompassBackgroundView ticLength](self->_compassBackgroundView, "ticLength");
  v71 = (v68 + (compassRadius - v70) * -2.0) * 0.5;
  if (v71 >= 0.0)
    v72 = v71;
  else
    v72 = 0.0;
  v113[0] = CFSTR("titleLabelWidth");
  v73 = (void *)MEMORY[0x24BDD16E0];
  v74 = self->_compassRadius;
  -[CompassBackgroundView ticLength](self->_compassBackgroundView, "ticLength");
  objc_msgSend(v73, "numberWithDouble:", v74 - v75 + v74 - v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = CFSTR("titleMarginWidth");
  v114[0] = v76;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v72);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v77;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = self->_calibrationConstraints;
  v80 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), self->_titleLabel, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(>=titleMarginWidth)-[_titleLabel(==titleLabelWidth)]-(>=titleMarginWidth)-|"), 0, v78, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v79, "addObjectsFromArray:", v82);

  if (v62
    || (-[CalibrationViewController traitCollection](self, "traitCollection"),
        v83 = (void *)objc_claimAutoreleasedReturnValue(),
        v84 = objc_msgSend(v83, "horizontalSizeClass"),
        v83,
        v84 == 2))
  {
    v85 = self->_calibrationConstraints;
    v86 = (void *)MEMORY[0x24BDD1628];
    v87 = self->_compassBackgroundView;
    -[CalibrationViewController view](self, "view");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 10, 0, v88, 10, 1.0, -18.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v85, "addObject:", v89);

    v90 = self->_calibrationConstraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_compassBackgroundView, 8, 0, 0, 0, 1.0, Width);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v90, "addObject:", v91);
  }
  else
  {
    -[CalibrationViewController view](self, "view");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "frame");
    v94 = (v93 + v93) / 3.0;
    -[CompassBackgroundView frame](self->_compassBackgroundView, "frame");
    v96 = v95;

    if (v94 <= v96)
    {
      v100 = self->_calibrationConstraints;
      v109 = (void *)MEMORY[0x24BDD1628];
      v110 = self->_compassBackgroundView;
      -[CalibrationViewController view](self, "view");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 1.0;
      v108 = 20.0;
      v104 = v109;
      v105 = v110;
      v106 = 3;
      v107 = v91;
    }
    else
    {
      -[CalibrationViewController view](self, "view");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "frame");
      v99 = round(v98 * 227.0 / 568.0);

      v100 = self->_calibrationConstraints;
      v101 = (void *)MEMORY[0x24BDD1628];
      v102 = self->_compassBackgroundView;
      -[CalibrationViewController view](self, "view");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 1.0;
      v104 = v101;
      v105 = v102;
      v106 = 10;
      v107 = v91;
      v108 = v99;
    }
    objc_msgSend(v104, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v105, v106, 0, v107, 3, v103, v108);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v100, "addObject:", v111);

  }
  -[CalibrationViewController view](self, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "addConstraints:", self->_calibrationConstraints);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_userDefaultsChanged_, *MEMORY[0x24BDD13F0], 0);

  memset_pattern16(self->_ticsShowingArray, &unk_22825E100, 0x2D0uLL);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[CalibrationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[CalibrationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStiffness:", 1560.0);
  objc_msgSend(v6, "setMass:", 3.0);
  objc_msgSend(v6, "setDamping:", 600.0);
  objc_msgSend(v6, "setDuration:", 0.400000006);
  objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + 0.5);
  memset_pattern16(self->_ticsShowingArray, &unk_22825E100, 0x2D0uLL);
  -[CalibrationViewController updatedMaskingPath](self, "updatedMaskingPath");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setFromValue:", objc_msgSend(v7, "CGPath"));

  memset_pattern16(self->_ticsShowingArray, &unk_22825E0F0, 0x2D0uLL);
  -[CalibrationViewController updatedMaskingPath](self, "updatedMaskingPath");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGPath");

  objc_msgSend(v6, "setToValue:", v9);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x24BDE5970]);
  -[CAShapeLayer setPath:](self->_compassBackgroundViewMask, "setPath:", v9);
  -[CAShapeLayer addAnimation:forKey:](self->_compassBackgroundViewMask, "addAnimation:forKey:", v6, CFSTR("growAnimation"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  self->_ignoreMotionUpdates = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CalibrationViewController hideAllTics](self, "hideAllTics");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CalibrationViewController _updateSizes](self, "_updateSizes");
  -[CalibrationViewController addConstraints](self, "addConstraints");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CompassBackgroundView frame](self->_compassBackgroundView, "frame");
  -[CAShapeLayer setFrame:](self->_compassBackgroundViewMask, "setFrame:");
  -[CalibrationViewController updateMaskingPath](self, "updateMaskingPath");
}

- (void)reset
{
  self->_ignoreMotionUpdates = 0;
  -[CalibrationViewController hideAllTics](self, "hideAllTics");
  self->_previousTimestamp = -1.0;
  self->_startTicAngle = -1.0;
}

- (id)updatedMaskingPath
{
  double compassRadius;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  long double v13;
  __double2 v14;
  double v15;
  long double v16;
  __double2 v17;
  double v19;
  double v20;
  double v21;

  compassRadius = self->_compassRadius;
  -[CompassBackgroundView ticLength](self->_compassBackgroundView, "ticLength");
  v19 = compassRadius + v4 * 0.5 + 1.0;
  -[CompassBackgroundView frame](self->_compassBackgroundView, "frame");
  v21 = v5 * 0.5;
  -[CompassBackgroundView frame](self->_compassBackgroundView, "frame");
  v20 = v6 * 0.5;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineWidth:", 0.5);
  v8 = 0;
  for (i = 0; i != 360; i += 2)
  {
    v10 = (float)(1.0 - self->_ticsShowingArray[v8]);
    -[CompassBackgroundView ticLength](self->_compassBackgroundView, "ticLength");
    v12 = (v11 + 2.0) * v10;
    v13 = fmod((double)(int)i + -1.0, (double)0x168uLL);
    v14 = __sincos_stret(v13 * 3.14159265 / 180.0);
    objc_msgSend(v7, "moveToPoint:");
    v15 = v19 - v12;
    objc_msgSend(v7, "addLineToPoint:", v21 + v15 * v14.__cosval, v20 + v15 * v14.__sinval);
    v16 = fmod((double)(int)i + 1.0, (double)0x168uLL);
    v17 = __sincos_stret(v16 * 3.14159265 / 180.0);
    objc_msgSend(v7, "addLineToPoint:", v21 + v15 * v17.__cosval, v20 + v15 * v17.__sinval);
    objc_msgSend(v7, "addLineToPoint:", v21 + v19 * v17.__cosval, v20 + v19 * v17.__sinval);
    objc_msgSend(v7, "addLineToPoint:", v21 + v19 * v14.__cosval, v20 + v19 * v14.__sinval);
    ++v8;
  }
  return v7;
}

- (void)updateMaskingPath
{
  id v3;

  -[CalibrationViewController updatedMaskingPath](self, "updatedMaskingPath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_compassBackgroundViewMask, "setPath:", objc_msgSend(v3, "CGPath"));

}

- (void)showTicAtAngle:(double)a3 withCredit:(double)a4
{
  unint64_t v5;
  unint64_t v6;
  float *ticsShowingArray;
  float v8;

  v5 = vcvtmd_u64_f64(a3 * 0.5);
  if (v5 <= 0xB3)
    v6 = v5;
  else
    v6 = v5 % 0xB3;
  ticsShowingArray = self->_ticsShowingArray;
  v8 = ticsShowingArray[v6];
  if (v8 < 1.0)
  {
    if (v8 < a4)
    {
      -[CalibrationViewController quantizedPercentage:forAngle:](self, "quantizedPercentage:forAngle:", a4, a3);
      ticsShowingArray = self->_ticsShowingArray;
    }
    ticsShowingArray[v6] = v8;
    if (v8 == 1.0)
      ++self->_numCompleteTics;
    -[CalibrationViewController updateMaskingPath](self, "updateMaskingPath");
  }
}

- (void)showTicsBetweenStartAngle:(double)a3 endAngle:(double)a4 withCredit:(double)a5
{
  char v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float *ticsShowingArray;
  float v13;

  for (; a3 - a4 > 180.0; a3 = a3 + -360.0)
    ;
  for (; a4 - a3 > 180.0; a4 = a4 + -360.0)
    ;
  v7 = 0;
  v8 = vcvtmd_u64_f64(a3 * 0.5) % 0xB4;
  v9 = vcvtmd_u64_f64(a4 * 0.5);
  if (v8 <= v9 % 0xB4)
    v10 = v9 % 0xB4;
  else
    v10 = v8;
  if (v8 >= v9 % 0xB4)
    v11 = v9 % 0xB4;
  else
    v11 = v8;
  ticsShowingArray = self->_ticsShowingArray;
  do
  {
    v13 = ticsShowingArray[v11];
    if (v13 < 1.0)
    {
      if (v13 < a5)
      {
        -[CalibrationViewController quantizedPercentage:forAngle:](self, "quantizedPercentage:forAngle:", a5, (double)v11);
        ticsShowingArray = self->_ticsShowingArray;
      }
      ticsShowingArray[v11] = v13;
      if (v13 == 1.0)
        ++self->_numCompleteTics;
      v7 = 1;
    }
    v11 = (v11 + 1);
  }
  while (v10 >= v11);
  if ((v7 & 1) != 0)
    -[CalibrationViewController updateMaskingPath](self, "updateMaskingPath");
}

- (void)hideAllTics
{
  memset_pattern16(self->_ticsShowingArray, &unk_22825E0F0, 0x2D0uLL);
  self->_numCompleteTics = 0;
  -[CalibrationViewController updateMaskingPath](self, "updateMaskingPath");
}

- (BOOL)circleIsCompleted
{
  return self->_numCompleteTics - 176 < 5;
}

- (void)setBallAngle:(double)a3 tiltAngle:(double)a4
{
  if (self->_startTicAngle < 0.0)
    self->_startTicAngle = a3 / 0.0174532925;
  -[CalibrationViewController showTicsBetweenStartAngle:endAngle:withCredit:](self, "showTicsBetweenStartAngle:endAngle:withCredit:");
  self->_startTicAngle = a3 / 0.0174532925;
  -[CalibrationBallView setAngle:](self->_ballView, "setAngle:", a3);
  -[CompassBackgroundView setNeedsLayout](self->_compassBackgroundView, "setNeedsLayout");
  -[CalibrationBallView setNeedsLayout](self->_ballView, "setNeedsLayout");
}

- (double)_correctedAngleForCurrentOrientation:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  long double v10;

  -[CalibrationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  switch(v7)
  {
    case 2:
      v8 = 3.14159265;
      break;
    case 3:
      v8 = -1.57079633;
      break;
    case 4:
      v8 = 1.57079633;
      break;
    default:
      return a3;
  }
  v9 = a3 + v8;
  v10 = fmod(a3 + v8, 6.28318531);
  a3 = v10;
  if (v9 < 0.0)
    return v10 + 6.28318531;
  return a3;
}

- (void)setMotion:(id)a3
{
  id v4;
  double v5;
  double v6;
  float64_t v7;
  float64x2_t v8;
  long double v9;
  double v10;
  uint64_t v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  float64x2_t __x;
  float64x2_t __xa;

  if (!self->_ignoreMotionUpdates)
  {
    v4 = a3;
    objc_msgSend(v4, "gravity");
    v6 = v5;
    v8.f64[1] = v7;
    __x = v8;
    v9 = atan2(sqrt(vaddvq_f64(vmulq_f64(v8, v8))), -v5);
    v10 = fmod(v9, 6.28318531);
    if (v9 < 0.0)
      v10 = v10 + 6.28318531;
    -[CalibrationViewController _correctedAngleForCurrentOrientation:](self, "_correctedAngleForCurrentOrientation:", v10);
    *(double *)&v12 = *(double *)&v12 * 1.4037466 + 0.01;
    if (*(double *)&v12 <= 0.5)
      v13 = *(double *)&v12;
    else
      v13 = 0.5;
    __xa = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)self->_previousGravity, 1.0 - v13), __x, v13);
    v14 = *(double *)&self->_previousGravity[16] * (1.0 - v13);
    *(double *)&v12 = v14 + v13 * v6;
    v25 = v12;
    objc_msgSend(v4, "timestamp", *(_QWORD *)&v13, v11);
    v16 = v15;

    v17 = atan2(-__xa.f64[1], __xa.f64[0]);
    v18 = fmod(v17, 6.28318531);
    if (v17 < 0.0)
      v18 = v18 + 6.28318531;
    -[CalibrationViewController _correctedAngleForCurrentOrientation:](self, "_correctedAngleForCurrentOrientation:", v18);
    v20 = v19;
    v21 = atan2(sqrt(vaddvq_f64(vmulq_f64(__xa, __xa))), -(v14 + v24 * v6));
    v22 = fmod(v21, 6.28318531);
    v23 = v22 + 6.28318531;
    if (v21 >= 0.0)
      v23 = v22;
    self->_previousHorizontalAngle = v20;
    -[CalibrationViewController setBallAngle:tiltAngle:](self, "setBallAngle:tiltAngle:", v20, v23);
    *(float64x2_t *)self->_previousGravity = __xa;
    *(_OWORD *)&self->_previousGravity[16] = v25;
    self->_previousTimestamp = v16;
  }
}

- (double)completeCircle
{
  double v3;
  double v4;
  double v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v11[4];
  id v12[3];
  id location;

  self->_ignoreMotionUpdates = 1;
  -[CalibrationBallView currentAngle](self->_ballView, "currentAngle");
  v4 = v3 * 180.0 / 3.14159265;
  objc_initWeak(&location, self);
  v5 = 0.0;
  v6 = 360;
  v7 = MEMORY[0x24BDAC760];
  v8 = MEMORY[0x24BDAC9B8];
  do
  {
    v9 = dispatch_time(0, (uint64_t)(v5 / 360.0 * 1000000000.0));
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = sub_22825D65C;
    v11[3] = &unk_24F0D23B8;
    objc_copyWeak(v12, &location);
    v12[1] = *(id *)&v5;
    v12[2] = *(id *)&v4;
    dispatch_after(v9, v8, v11);
    objc_destroyWeak(v12);
    v5 = v5 + 1.0;
    --v6;
  }
  while (v6);
  objc_destroyWeak(&location);
  return 1.0;
}

- (void)cancel
{
  notify_post("com.apple.DismissCalibration");
}

- (void)dealloc
{
  objc_super v3;

  free(self->_ticsShowingArray);
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  -[CalibrationViewController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationConstraints, 0);
  objc_storeStrong((id *)&self->_ballView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_compassBackgroundViewMask, 0);
  objc_storeStrong((id *)&self->_compassBackgroundView, 0);
}

@end
