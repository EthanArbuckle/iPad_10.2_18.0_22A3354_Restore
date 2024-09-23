@implementation MKTransitItemIncidentView

- (MKTransitItemIncidentView)initWithFrame:(CGRect)a3
{
  MKTransitItemIncidentView *v3;
  MKTransitItemIncidentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentView;
  v3 = -[MKTransitItemIncidentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKTransitItemIncidentView configureViews](v3, "configureViews");
  return v4;
}

- (void)configureViews
{
  id v3;
  UIImageView *v4;
  UIImageView *incidentIconImageView;
  MKTransitIncidentItemCellBackgroundView *v6;
  MKTransitIncidentItemCellBackgroundView *backgroundView;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *bottomToBackgroundConstraint;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  void *v20;
  _MKUILabel *v21;
  _MKUILabel *titleLabel;
  _MKUILabel *v23;
  _MKUILabel *lastUpdatedLabel;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  self->_contentInsets = *(UIEdgeInsets *)ymmword_18B2AA000;
  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  incidentIconImageView = self->_incidentIconImageView;
  self->_incidentIconImageView = v4;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitItemIncidentView addSubview:](self, "addSubview:", self->_incidentIconImageView);
  self->_needsConstraintsRebuild = 1;
  -[UIImageView setContentMode:](self->_incidentIconImageView, "setContentMode:", 1);
  v6 = objc_alloc_init(MKTransitIncidentItemCellBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v6;

  -[MKTransitIncidentItemCellBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitItemIncidentView addSubview:](self, "addSubview:", self->_backgroundView);
  -[MKTransitItemIncidentView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  -[MKTransitItemIncidentView bottomAnchor](self, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomToBackgroundConstraint = self->_bottomToBackgroundConstraint;
  self->_bottomToBackgroundConstraint = v10;

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKTransitIncidentItemCellBackgroundView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentView layoutMarginsGuide](self, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v30;
  -[MKTransitIncidentItemCellBackgroundView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentView layoutMarginsGuide](self, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  -[MKTransitIncidentItemCellBackgroundView topAnchor](self->_backgroundView, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentView topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_bottomToBackgroundConstraint;
  v34[2] = v18;
  v34[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v20);

  v21 = objc_alloc_init(_MKUILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v21;

  -[_MKUILabel set_mapkit_themeColorProvider:](self->_titleLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_63);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 4);
  -[_MKUILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[MKTransitIncidentItemCellBackgroundView addSubview:](self->_backgroundView, "addSubview:", self->_titleLabel);
  v23 = objc_alloc_init(_MKUILabel);
  lastUpdatedLabel = self->_lastUpdatedLabel;
  self->_lastUpdatedLabel = v23;

  LODWORD(v25) = 1148846080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_lastUpdatedLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v25);
  LODWORD(v26) = 1148829696;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_lastUpdatedLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v26);
  -[_MKUILabel set_mapkit_themeColorProvider:](self->_lastUpdatedLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_5_1);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_lastUpdatedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (MKApplicationLayoutDirectionIsRightToLeft())
    v27 = 0;
  else
    v27 = 2;
  -[_MKUILabel setTextAlignment:](self->_lastUpdatedLabel, "setTextAlignment:", v27);
  -[MKTransitIncidentItemCellBackgroundView addSubview:](self->_backgroundView, "addSubview:", self->_lastUpdatedLabel);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  -[MKTransitItemIncidentView _updateConstraintValues](self, "_updateConstraintValues");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);

}

uint64_t __43__MKTransitItemIncidentView_configureViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

uint64_t __43__MKTransitItemIncidentView_configureViews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tertiaryTextColor");
}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  +[MKTransitIncidentStringProvider cellTitleForIncident:](MKTransitIncidentStringProvider, "cellTitleForIncident:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastUpdated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isBlockingIncident");

  -[MKTransitItemIncidentView _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v14, v10, v12, v13, v7, v6);
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "lastUpdated");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isBlockingIncident");

  -[MKTransitItemIncidentView _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v14, v12, v16, v15, v8, v7);
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "transitIncidents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1)
  {
    objc_msgSend(v10, "transitIncidents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitItemIncidentView configureWithIncident:referenceDate:shouldShowImage:inSiri:](self, "configureWithIncident:referenceDate:shouldShowImage:inSiri:", v15, v11, v7, v6);

  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(v10, "transitIncidents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __95__MKTransitItemIncidentView_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke;
    v18[3] = &unk_1E20DBBC8;
    v18[4] = &v19;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

    objc_msgSend(v10, "routingMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitItemIncidentView _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v17, 0, 0, *((unsigned __int8 *)v20 + 24), v7, v6);

    _Block_object_dispose(&v19, 8);
  }

}

uint64_t __95__MKTransitItemIncidentView_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isBlockingIncident");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8
{
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  _QWORD v26[2];

  v24 = a7;
  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  LODWORD(v16) = 1058642330;
  objc_msgSend(v15, "setHyphenationFactor:", v16);
  v25 = *MEMORY[0x1E0CEA0D0];
  v26[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = &stru_1E20DFC00;
  if (v12)
    v18 = v12;
  v19 = v18;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v17);
  -[_MKUILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v20);

  if (v13 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3570], "_mapkit_descriptionForTimeSinceDate:referenceDate:", v14, v13);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v17);
    -[_MKUILabel setAttributedText:](self->_lastUpdatedLabel, "setAttributedText:", v22);

    v19 = (__CFString *)v21;
  }
  else
  {
    -[_MKUILabel setAttributedText:](self->_lastUpdatedLabel, "setAttributedText:", 0);
  }
  self->_incidentIsBlocking = a6;
  -[MKTransitItemIncidentView infoCardThemeChanged](self, "infoCardThemeChanged");
  if (v24)
  {
    if (self->_incidentIsBlocking)
      -[MKTransitItemIncidentView _blockingImage](self, "_blockingImage");
    else
      -[MKTransitItemIncidentView _nonBlockingImage](self, "_nonBlockingImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_incidentIconImageView, "setImage:", v23);

  }
  else
  {
    -[UIImageView setImage:](self->_incidentIconImageView, "setImage:", 0);
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    self->_needsConstraintsRebuild = 1;
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  }
}

- (void)infoCardThemeChanged
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MKTransitItemIncidentView;
  -[UIView infoCardThemeChanged](&v19, sel_infoCardThemeChanged);
  -[MKTransitItemIncidentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
  {
    -[UIView mk_theme](self, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitIncidentBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitIncidentItemCellBackgroundView setFillColor:](self->_backgroundView, "setFillColor:", v6);

    -[MKTransitIncidentItemCellBackgroundView setStrokeColor:](self->_backgroundView, "setStrokeColor:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_titleLabel, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_lastUpdatedLabel, "setFont:", v8);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    objc_msgSend(v9, "systemFontOfSize:weight:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_titleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB558], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_lastUpdatedLabel, "setFont:", v12);

    -[UIView mk_theme](self, "mk_theme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "themeType");

    if (v14 >= 2)
    {
      if (v14 != 2)
        return;
      -[UIView mk_theme](self, "mk_theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transitIncidentBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitIncidentItemCellBackgroundView setFillColor:](self->_backgroundView, "setFillColor:", v18);

    }
    else
    {
      if (self->_incidentIsBlocking)
      {
        v15 = 0.949019611;
        v16 = 0.286274523;
        v17 = 0.200000003;
      }
      else
      {
        v16 = 0.686274529;
        v15 = 1.0;
        v17 = 0.0;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v15, v16, v17, 0.100000001);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitIncidentItemCellBackgroundView setFillColor:](self->_backgroundView, "setFillColor:", v8);
    }
  }

}

- (void)setCellPosition:(int64_t)a3
{
  -[MKTransitIncidentItemCellBackgroundView setPosition:](self->_backgroundView, "setPosition:", a3);
}

- (void)setPadBottom:(BOOL)a3
{
  if (self->_padBottom != a3)
  {
    self->_padBottom = a3;
    -[MKTransitItemIncidentView _updateBottomConstraintWithOffset:](self, "_updateBottomConstraintWithOffset:", self->_bottomToBackgroundOffset);
  }
}

- (void)_updateBottomConstraintWithOffset:(double)a3
{
  BOOL v4;
  double bottomToBackgroundOffset;

  self->_bottomToBackgroundOffset = a3;
  v4 = -[MKTransitItemIncidentView padBottom](self, "padBottom");
  bottomToBackgroundOffset = 10.0;
  if (!v4)
    bottomToBackgroundOffset = self->_bottomToBackgroundOffset;
  -[NSLayoutConstraint setConstant:](self->_bottomToBackgroundConstraint, "setConstant:", bottomToBackgroundOffset);
}

- (int64_t)cellPosition
{
  return -[MKTransitIncidentItemCellBackgroundView position](self->_backgroundView, "position");
}

- (id)_blockingImage
{
  void *v2;
  double v3;
  float v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  CGImageRef v10;
  CGImage *v11;
  void *v12;
  float v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trafficIncidentTypeKey");

  objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v4;
  objc_msgSend(v7, "imageForKey:value:contentScale:sizeGroup:modifiers:", v6, 3, 7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (v10 = CGImageRetain((CGImageRef)objc_msgSend(v9, "image"))) != 0)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v9, "contentScale");
    objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v11, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_nonBlockingImage
{
  void *v2;
  double v3;
  float v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  CGImageRef v10;
  CGImage *v11;
  void *v12;
  float v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trafficIncidentTypeKey");

  objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v4;
  objc_msgSend(v7, "imageForKey:value:contentScale:sizeGroup:modifiers:", v6, 4, 7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (v10 = CGImageRetain((CGImageRef)objc_msgSend(v9, "image"))) != 0)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v9, "contentScale");
    objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v11, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKTransitItemIncidentView;
  -[MKTransitItemIncidentView dealloc](&v4, sel_dealloc);
}

- (void)_contentSizeCategoryDidChange
{
  _BOOL4 useCondensedWidthLayout;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  useCondensedWidthLayout = self->_useCondensedWidthLayout;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_needsConstraintsRebuild = useCondensedWidthLayout != UIContentSizeCategoryIsAccessibilityCategory(v5);

  v6 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v6, "systemFontOfSize:weight:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_titleLabel, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB558], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_lastUpdatedLabel, "setFont:", v9);

  if (self->_needsConstraintsRebuild)
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  else
    -[MKTransitItemIncidentView _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)_updateConstraintValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_MKUILabel font](self->_titleLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 30.0);
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_titleLabelToTopConstraint, "setConstant:");

  -[NSLayoutConstraint secondItem](self->_bottomToLabelConstraint, "secondItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 20.0);
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_bottomToLabelConstraint, "setConstant:");

  if (self->_titleToLastUpdatedLabelConstraint)
  {
    -[_MKUILabel attributedText](self->_lastUpdatedLabel, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      -[_MKUILabel font](self->_lastUpdatedLabel, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_mapkit_lineHeight");
      UIRoundToViewScale();
      -[NSLayoutConstraint setConstant:](self->_titleToLastUpdatedLabelConstraint, "setConstant:");

    }
    else
    {
      -[NSLayoutConstraint setConstant:](self->_titleToLastUpdatedLabelConstraint, "setConstant:", 0.0);
    }

  }
  -[MKTransitItemIncidentView _updateBottomConstraintWithOffset:](self, "_updateBottomConstraintWithOffset:", self->_bottomToBackgroundOffset);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKTransitItemIncidentView;
  -[MKTransitItemIncidentView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MKTransitItemIncidentView _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)updateConstraints
{
  objc_super v3;

  if (self->_needsConstraintsRebuild)
    -[MKTransitItemIncidentView rebuildConstraints](self, "rebuildConstraints");
  v3.receiver = self;
  v3.super_class = (Class)MKTransitItemIncidentView;
  -[MKTransitItemIncidentView updateConstraints](&v3, sel_updateConstraints);
}

- (void)rebuildConstraints
{
  NSArray *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  NSLayoutConstraint *v25;
  NSLayoutConstraint *titleLabelToTopConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  _MKUILabel *titleLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *titleToLastUpdatedLabelConstraint;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *bottomToLabelConstraint;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  NSLayoutConstraint *v59;
  NSLayoutConstraint *v60;
  NSArray *constraints;
  NSArray *v62;
  id v63;

  self->_needsConstraintsRebuild = 0;
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKTransitItemIncidentView contentInsets](self, "contentInsets");
  v5 = v4;
  -[MKTransitItemIncidentView contentInsets](self, "contentInsets");
  v7 = v6;
  -[MKTransitItemIncidentView layoutMarginsGuide](self, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v63 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView leadingAnchor](self->_incidentIconImageView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v11);

  -[UIImageView widthAnchor](self->_incidentIconImageView, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 32.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v13);

  -[UIImageView topAnchor](self->_incidentIconImageView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView topAnchor](self->_backgroundView, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v16);

  -[MKTransitIncidentItemCellBackgroundView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_incidentIconImageView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v19);

  -[UIImageView centerYAnchor](self->_incidentIconImageView, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView centerYAnchor](self->_backgroundView, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v22);

  -[_MKUILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView topAnchor](self->_backgroundView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelToTopConstraint = self->_titleLabelToTopConstraint;
  self->_titleLabelToTopConstraint = v25;

  -[NSArray addObject:](v3, "addObject:", self->_titleLabelToTopConstraint);
  -[_MKUILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_incidentIconImageView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v29);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferredContentSizeCategory");
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_useCondensedWidthLayout = UIContentSizeCategoryIsAccessibilityCategory(v31);

  LODWORD(v31) = self->_useCondensedWidthLayout;
  -[_MKUILabel leadingAnchor](self->_lastUpdatedLabel, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  if ((_DWORD)v31)
  {
    -[_MKUILabel leadingAnchor](titleLabel, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v35);

    -[_MKUILabel trailingAnchor](self->_lastUpdatedLabel, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v38);

    -[_MKUILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v39, v7);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v40);

    -[_MKUILabel firstBaselineAnchor](self->_lastUpdatedLabel, "firstBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleToLastUpdatedLabelConstraint = self->_titleToLastUpdatedLabelConstraint;
    self->_titleToLastUpdatedLabelConstraint = v43;

    -[NSArray addObject:](v3, "addObject:", self->_titleToLastUpdatedLabelConstraint);
    -[MKTransitIncidentItemCellBackgroundView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](self->_lastUpdatedLabel, "lastBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v46);
    v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomToLabelConstraint = self->_bottomToLabelConstraint;
    self->_bottomToLabelConstraint = v47;

    -[NSArray addObject:](v3, "addObject:", self->_bottomToLabelConstraint);
  }
  else
  {
    -[_MKUILabel trailingAnchor](titleLabel, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v49, 10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v50);

    -[_MKUILabel firstBaselineAnchor](self->_lastUpdatedLabel, "firstBaselineAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v53);

    -[_MKUILabel trailingAnchor](self->_lastUpdatedLabel, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v54, v7);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v55);

    -[MKTransitIncidentItemCellBackgroundView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v57);
    v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v59 = self->_bottomToLabelConstraint;
    self->_bottomToLabelConstraint = v58;

    -[NSArray addObject:](v3, "addObject:", self->_bottomToLabelConstraint);
    v60 = self->_titleToLastUpdatedLabelConstraint;
    self->_titleToLastUpdatedLabelConstraint = 0;

  }
  -[MKTransitItemIncidentView _updateConstraintValues](self, "_updateConstraintValues");
  constraints = self->_constraints;
  self->_constraints = v3;
  v62 = v3;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)padBottom
{
  return self->_padBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToBackgroundConstraint, 0);
  objc_storeStrong((id *)&self->_titleToLastUpdatedLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelToTopConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_incidentIconImageView, 0);
}

@end
