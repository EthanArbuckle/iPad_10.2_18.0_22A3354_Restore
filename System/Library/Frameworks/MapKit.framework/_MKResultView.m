@implementation _MKResultView

- (_MKResultView)init
{
  _MKResultView *v2;
  _MKResultView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKResultView;
  v2 = -[_MKResultView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_MKResultView _commonInit](v2, "_commonInit");
  return v3;
}

- (_MKResultView)initWithMapItem:(id)a3
{
  id v4;
  _MKResultView *v5;
  _MKResultView *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKResultView;
  v5 = -[_MKResultView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[_MKResultView _commonInit](v5, "_commonInit");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView setMapItems:](v6, "setMapItems:", v7);

  }
  return v6;
}

- (_MKResultView)initWithMapItems:(id)a3 primaryLabelText:(id)a4
{
  id v6;
  id v7;
  _MKResultView *v8;
  _MKResultView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MKResultView;
  v8 = -[_MKResultView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[_MKResultView _commonInit](v8, "_commonInit");
    -[_MKResultView setMapItems:](v9, "setMapItems:", v6);
    -[_MKResultView setPrimaryLabelText:](v9, "setPrimaryLabelText:", v7);
  }

  return v9;
}

- (_MKResultView)initWithFrame:(CGRect)a3
{
  return -[_MKResultView initWithFrame:highlightsOnTouch:](self, "initWithFrame:highlightsOnTouch:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKResultView)initWithFrame:(CGRect)a3 highlightsOnTouch:(BOOL)a4
{
  _MKResultView *v4;
  _MKResultView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKResultView;
  v4 = -[_MKResultView initWithFrame:](&v7, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[_MKResultView _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *resultConstraints;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTap_);
  -[_MKResultView addGestureRecognizer:](self, "addGestureRecognizer:");
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[_MKResultView setOpaque:](self, "setOpaque:", 0);
  -[_MKResultView setIconFormat:](self, "setIconFormat:", 2);
  -[_MKResultView _updateFontSizing](self, "_updateFontSizing");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v7)
  {
    -[_MKResultView setUseSpotlightVibrancy:](self, "setUseSpotlightVibrancy:", 1);
    -[_MKResultView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView setPrimaryTextColor:](self, "setPrimaryTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.400000006, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView setSecondaryTextColor:](self, "setSecondaryTextColor:", v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__locationApprovalDidChange, MKLocationManagerApprovalDidChangeNotification, 0);

  -[_MKResultView setShowsDistance:](self, "setShowsDistance:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  resultConstraints = self->_resultConstraints;
  self->_resultConstraints = v12;

  -[_MKResultView nameLabel](self, "nameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView addSubview:](self, "addSubview:", v14);

  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView addSubview:](self, "addSubview:", v15);

  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView addSubview:](self, "addSubview:", v16);

}

- (id)_labelWithFontSize:(double)a3
{
  _MKUILabel *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = objc_alloc_init(_MKUILabel);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setBackgroundColor:](v4, "setBackgroundColor:", v6);

  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1132068864;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v4, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v4, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v8);
  return v4;
}

- (_MKUILabel)nameLabel
{
  _MKUILabel *nameLabel;
  _MKUILabel *v4;
  _MKUILabel *v5;

  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    -[_MKResultView _labelWithFontSize:](self, "_labelWithFontSize:", 18.0);
    v4 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nameLabel;
    self->_nameLabel = v4;

    nameLabel = self->_nameLabel;
  }
  return nameLabel;
}

- (_MKUILabel)secondaryLabel
{
  _MKUILabel *secondaryLabel;
  _MKUILabel *v4;
  _MKUILabel *v5;

  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    -[_MKResultView _labelWithFontSize:](self, "_labelWithFontSize:", 13.0);
    v4 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    secondaryLabel = self->_secondaryLabel;
  }
  return secondaryLabel;
}

- (_MKUILabel)tertiaryLabel
{
  _MKUILabel *tertiaryLabel;
  _MKUILabel *v4;
  _MKUILabel *v5;

  tertiaryLabel = self->_tertiaryLabel;
  if (!tertiaryLabel)
  {
    -[_MKResultView _labelWithFontSize:](self, "_labelWithFontSize:", 13.0);
    v4 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tertiaryLabel;
    self->_tertiaryLabel = v4;

    tertiaryLabel = self->_tertiaryLabel;
  }
  return tertiaryLabel;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[_MKResultView _updateColors](self, "_updateColors");
  }
}

- (BOOL)showsDistance
{
  return self->_showsDistance;
}

- (void)setShowsDistance:(BOOL)a3
{
  MKLocationManager *locManager;
  _QWORD block[5];

  if (self->_showsDistance != a3)
  {
    self->_showsDistance = a3;
    locManager = self->_locManager;
    if (a3)
    {
      if (locManager)
      {
        -[MKLocationManager startLocationUpdateWithObserver:](locManager, "startLocationUpdateWithObserver:", self);
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34___MKResultView_setShowsDistance___block_invoke;
        block[3] = &unk_1E20D7D98;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      -[MKLocationManager stopLocationUpdateWithObserver:](locManager, "stopLocationUpdateWithObserver:", self);
    }
  }
}

- (void)_updateColors
{
  -[_MKResultView _updatePrimaryColors](self, "_updatePrimaryColors");
  -[_MKResultView _updateSecondaryColors](self, "_updateSecondaryColors");
}

- (void)_updatePrimaryColors
{
  void *v3;
  id v4;

  if (self->_selected)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    -[_MKResultView primaryTextColor](self, "primaryTextColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKResultView nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)_updateSecondaryColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_selected)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v7);

  }
  else
  {
    -[_MKResultView secondaryTextColor](self, "secondaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    -[_MKResultView secondaryTextColor](self, "secondaryTextColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);

  -[MKLocationManager stopLocationUpdateWithObserver:](self->_locManager, "stopLocationUpdateWithObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)_MKResultView;
  -[_MKResultView dealloc](&v5, sel_dealloc);
}

- (void)_updateFontSizing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  v5 = *MEMORY[0x1E0CEB548];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

}

- (void)setIconFormat:(int)a3
{
  if (self->_iconFormat != a3)
  {
    self->_iconFormat = a3;
    -[_MKResultView updateLayout](self, "updateLayout");
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateImageView
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenScale");
  v5 = v4;

  v6 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[_MKResultView mapItem](self, "mapItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[MKIconManager imageForMapItem:size:forScale:format:](MKIconManager, "imageForMapItem:size:forScale:format:", v9, 4, -[_MKResultView iconFormat](self, "iconFormat"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);
  -[_MKResultView setImageView:](self, "setImageView:", v8);

}

- (void)setNeedsUpdateConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_MKResultView;
  -[_MKResultView setNeedsUpdateConstraints](&v2, sel_setNeedsUpdateConstraints);
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *resultConstraints;
  void *v16;
  void *v17;
  void *v18;
  int layoutType;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  NSMutableArray *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  NSMutableArray *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  _MKResultView *v56;
  uint64_t v57;
  double v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSMutableArray *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSMutableArray *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSMutableArray *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  NSMutableArray *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSMutableArray *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  objc_super v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  _QWORD v102[4];
  _QWORD v103[6];

  v103[4] = *MEMORY[0x1E0C80C00];
  -[_MKResultView removeConstraints:](self, "removeConstraints:", self->_resultConstraints);
  -[NSMutableArray removeAllObjects](self->_resultConstraints, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  v5 = 1;
  if (v4 == 1)
    v6 = 2;
  else
    v6 = 1;
  v95 = v6;
  if (v4 != 1)
    v5 = 2;
  v92 = v4;
  v93 = v5;
  -[_MKResultView _imageSize](self, "_imageSize");
  v8 = v7;
  v10 = v9;
  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v12, "length");

  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v14, "length");

  resultConstraints = self->_resultConstraints;
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[_MKResultView nameLabel](self, "nameLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 7, -1, self, 7, 1.0, -(v8 + 45.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](resultConstraints, "addObject:", v18);

  layoutType = self->_layoutType;
  if (layoutType != 2)
  {
    if (layoutType == 1)
    {
      v48 = self->_resultConstraints;
      v59 = (void *)MEMORY[0x1E0CB3718];
      -[_MKResultView nameLabel](self, "nameLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKResultView imageView](self, "imageView");
      v60 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v60;
      if (v60)
        v56 = (_MKResultView *)v60;
      else
        v56 = self;
      v51 = 1.0;
      v58 = 0.0;
      v52 = v59;
      v53 = v20;
      v54 = 10;
      v55 = 0;
      v57 = 10;
      goto LABEL_19;
    }
    if (layoutType)
      goto LABEL_21;
  }
  -[_MKResultView nameLabel](self, "nameLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v21 = self->_resultConstraints;
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 7, -1, self, 7, 1.0, -(v8 + 45.0));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v24);

    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v25;
  }
  v26 = self->_resultConstraints;
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[_MKResultView nameLabel](self, "nameLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView nameLabel](self, "nameLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "font");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_scaledValueForValue:", 24.0);
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 12, 0, self, 3, 1.0, round(v31));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v26, "addObject:", v32);

  if (v96)
  {
    v33 = self->_resultConstraints;
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView nameLabel](self, "nameLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "font");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_scaledValueForValue:", 20.0);
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 12, 0, v36, 11, 1.0, round(v39));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v33, "addObject:", v40);

  }
  if (!v94)
    goto LABEL_20;
  v41 = self->_resultConstraints;
  v42 = (void *)MEMORY[0x1E0CB3718];
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "font");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_scaledValueForValue:", 17.0);
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 11, 0, v20, 11, 1.0, round(v46));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v41, "addObject:", v47);

  v48 = self->_resultConstraints;
  v49 = (void *)MEMORY[0x1E0CB3718];
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 1.0;
  v52 = v49;
  v53 = v50;
  v54 = 7;
  v55 = -1;
  v56 = self;
  v57 = 7;
  v58 = -(v8 + 45.0);
LABEL_19:
  objc_msgSend(v52, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, v54, v55, v56, v57, v51, v58);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v48, "addObject:", v61);

LABEL_20:
LABEL_21:
  -[_MKResultView imageView](self, "imageView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v102[0] = CFSTR("LabelsLeftMargin");
    v102[1] = CFSTR("ImageTopInset");
    v103[0] = &unk_1E2158590;
    v103[1] = &unk_1E21585A0;
    v102[2] = CFSTR("imageWidth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v63;
    v102[3] = CFSTR("imageHeight");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v64;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = self->_resultConstraints;
    v67 = (void *)MEMORY[0x1E0CB3718];
    v100 = CFSTR("imageView");
    -[_MKResultView imageView](self, "imageView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-LabelsLeftMargin-[imageView(==imageWidth)]"), 0, v65, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v70);

    v71 = self->_resultConstraints;
    v72 = (void *)MEMORY[0x1E0CB3718];
    v98 = CFSTR("imageView");
    -[_MKResultView imageView](self, "imageView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-ImageTopInset-[imageView(==imageHeight)]"), 0, v65, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v71, "addObjectsFromArray:", v75);

    v76 = self->_resultConstraints;
    v77 = (void *)MEMORY[0x1E0CB3718];
    -[_MKResultView nameLabel](self, "nameLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView imageView](self, "imageView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92 == 1)
      v80 = -15.0;
    else
      v80 = 15.0;
    objc_msgSend(v77, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v78, v95, 0, v79, v93, 1.0, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v76, "addObject:", v81);

    if ((self->_layoutType | 2) == 2)
    {
      if (v96)
      {
        v82 = self->_resultConstraints;
        v83 = (void *)MEMORY[0x1E0CB3718];
        -[_MKResultView secondaryLabel](self, "secondaryLabel");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKResultView imageView](self, "imageView");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v84, v95, 0, v85, v93, 1.0, v80);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v82, "addObject:", v86);

      }
      if (v94)
      {
        v87 = self->_resultConstraints;
        v88 = (void *)MEMORY[0x1E0CB3718];
        -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKResultView imageView](self, "imageView");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v89, v95, 0, v90, v93, 1.0, v80);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v87, "addObject:", v91);

      }
    }

  }
  -[_MKResultView addConstraints:](self, "addConstraints:", self->_resultConstraints);
  v97.receiver = self;
  v97.super_class = (Class)_MKResultView;
  -[_MKResultView updateConstraints](&v97, sel_updateConstraints);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKResultView;
  -[_MKResultView layoutSubviews](&v6, sel_layoutSubviews);
  if (-[NSArray count](self->_mapItems, "count"))
  {
    -[_MKResultView nameLabel](self, "nameLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      -[_MKResultView updateSubviews](self, "updateSubviews");
  }
}

- (void)setPrimaryTextColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_primaryTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    -[_MKResultView nameLabel](self, "nameLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (void)setSecondaryTextColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[UIColor isEqual:](self->_secondaryTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v7);

    -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

  }
}

- (CGSize)_imageSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[_MKResultView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_MKResultView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = 0x404E000000000000;
    v10 = 0x404E000000000000;
  }

  v11 = *(double *)&v8;
  v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)preferredHeight
{
  double v3;
  double v4;
  int layoutType;
  double v6;
  double v7;

  -[_MKResultView _imageSize](self, "_imageSize");
  v4 = v3 + 20.0;
  layoutType = self->_layoutType;
  if (layoutType != 2)
  {
    if (layoutType == 1)
      return v4;
    if (layoutType)
      return 0.0;
  }
  -[_MKResultView _expectedHeightForLabels](self, "_expectedHeightForLabels");
  v7 = v6 + 10.0;
  if (v7 > v4)
    return v7;
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)_MKResultView;
  -[_MKResultView intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[_MKResultView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_MKResultView superview](self, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v4 = v9;

    -[_MKResultView preferredHeight](self, "preferredHeight");
    v6 = v10;
  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)addLabelIfNecessary:(id)a3
{
  _MKResultView *v4;
  _MKUILabel *v5;
  _MKResultView *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _MKUILabel *v12;

  v12 = (_MKUILabel *)a3;
  v4 = self;
  v5 = v12;
  v6 = v4;
  if (v4->_secondaryLabel == v12 || v4->_tertiaryLabel == v12)
  {
    v7 = -[_MKResultView useSpotlightVibrancy](v4, "useSpotlightVibrancy");
    v5 = v12;
    if (v7)
    {
      -[_MKUILabel setAlpha:](v12, "setAlpha:", 0.375);
      v8 = *MEMORY[0x1E0CD2E08];
      -[_MKUILabel layer](v12, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCompositingFilter:", v8);

      v5 = v12;
    }
  }
  -[_MKUILabel text](v5, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    -[_MKResultView addSubview:](v6, "addSubview:", v12);

}

- (void)_updateLayoutForBusinessOrCategory
{
  void *v3;
  void *v4;
  id v5;

  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView addLabelIfNecessary:](self, "addLabelIfNecessary:", v3);

  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView addLabelIfNecessary:](self, "addLabelIfNecessary:", v4);

  -[_MKResultView nameLabel](self, "nameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 1);

}

- (void)_updateLayoutForAddress
{
  void *v3;
  id v4;

  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (id)_defaultPrimaryLabel
{
  int layoutType;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  layoutType = self->_layoutType;
  if (layoutType == 2)
  {
    v6 = 0;
  }
  else
  {
    if (layoutType == 1)
    {
      -[_MKResultView mapItem](self, "mapItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_addressFormattedAsSinglelineAddress");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_MKResultView mapItem](self, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_hasTransitDisplayName");

      -[_MKResultView mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v9;
      if (v8)
        objc_msgSend(v9, "_transitDisplayName");
      else
        objc_msgSend(v9, "name");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;

  }
  return v6;
}

- (unint64_t)_maxSecondaryStringLengthForEndingString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("W"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CEA098];
  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumScaleFactor");
  objc_msgSend(v8, "setMinimumScaleFactor:");

  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v7, v8, 1.79769313e308, 1.79769313e308);
  v11 = v10;
  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13 + v13;

  if (v11 <= v14)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("W"), v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 0, v7, v8, 1.79769313e308, 1.79769313e308);
      v17 = v16;
      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19 + v19;

      v4 = v15;
    }
    while (v17 <= v20);
  }
  else
  {
    v15 = v4;
  }
  v21 = objc_msgSend(v15, "length");

  return v21;
}

- (unint64_t)_maxNameLengthForEndingString:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[_MKResultView _maxSecondaryStringLengthForEndingString:](self, "_maxSecondaryStringLengthForEndingString:", v4);
  v6 = objc_msgSend(v4, "length");

  return v5 - v6;
}

- (id)_defaultSecondaryCategoryLabel
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v26;
  void *v27;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_mapItems, "count");
  _MKLocalizedStringFromThisBundle(CFSTR("MKRESULTVIEW_AND_X_OTHERS"));
  v4 = objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("MKRESULTVIEW_SEPARATOR_COMMA"));
  v26 = (void *)v4;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_MKResultView _maxNameLengthForEndingString:](self, "_maxNameLengthForEndingString:", v4);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_mapItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
        {
          if (objc_msgSend(v9, "length"))
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            _MKLocalizedStringFromThisBundle(CFSTR("MKRESULTVIEW_NAME_STRING"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", v14, v9, v27, v12);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            v9 = (void *)v14;
          }
          else
          {
            v15 = v12;
          }

          --v3;
          objc_msgSend(v6, "addObject:", v12);
          v9 = v15;
        }
        v16 = objc_msgSend(v9, "length");

        if (v16 > v5 && v3 >= 3)
        {

          v17 = v26;
          goto LABEL_19;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v17 = v26;
  if (v3 >= 3)
  {
LABEL_19:
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("MKRESULTVIEW_NAMES_OTHERS_STRING"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v9, v20);
    v23 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v23;
  }
  v24 = v9;

  return v24;
}

- (double)_expectedHeightForLabels
{
  void *v2;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;

  -[_MKResultView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 24.0);
  v7 = round(v6) + 0.0;

  -[_MKResultView secondaryLabel](self, "secondaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_scaledValueForValue:", 20.0);
    v7 = v7 + round(v11);

  }
  v12 = -[NSArray count](self->_mapItems, "count");
  if (v12 >= 2)
  {
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedText");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {

LABEL_9:
      -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "font");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_scaledValueForValue:", 17.0);
      v7 = v7 + round(v18);

      return v7;
    }
  }
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v12 >= 2)
  {

  }
  if (v15)
    goto LABEL_9;
  return v7;
}

- (void)updateSubviews
{
  int layoutType;
  void *v4;
  NSString *v5;
  unint64_t v6;
  MKTransitInfoLabelView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _MKLocalizedHoursBuilder *v12;
  id v13;
  id v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  NSString *primaryLabelText;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *v63;
  uint64_t v64;
  uint64_t v65;

  layoutType = self->_layoutType;
  -[_MKResultView mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKResultView _defaultPrimaryLabel](self, "_defaultPrimaryLabel");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0CB3000uLL;
  if (layoutType == 2)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[_MKResultView _defaultSecondaryCategoryLabel](self, "_defaultSecondaryCategoryLabel");
    v12 = (_MKLocalizedHoursBuilder *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithString:", v12);
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "_hasTransitLabels"))
    {
      v7 = -[MKTransitInfoLabelView initWithMapItem:]([MKTransitInfoLabelView alloc], "initWithMapItem:", v4);
      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "font");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitInfoLabelView setFont:](v7, "setFont:", v9);

      -[MKTransitInfoLabelView attributedText](v7, "attributedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "_addressFormattedAsShortenedAddress");
      v7 = (MKTransitInfoLabelView *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v4, "_addressFormattedAsShortenedAddress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v14, "initWithString:", v15);

      }
      else
      {
        v10 = 0;
      }
    }

    if (!objc_msgSend(v4, "_hasMUID"))
    {
      v13 = 0;
      goto LABEL_14;
    }
    v16 = v5;
    v12 = -[_MKLocalizedHoursBuilder initWithMapItem:localizedHoursStringOptions:]([_MKLocalizedHoursBuilder alloc], "initWithMapItem:localizedHoursStringOptions:", v4, 0);
    v17 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("Hours %@"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKLocalizedHoursBuilder localizedOperatingHours](v12, "localizedOperatingHours");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (objc_msgSend(v4, "_hasBusinessHours"))
      v13 = v20;

    v5 = v16;
    v6 = 0x1E0CB3000;
  }

LABEL_14:
  if (-[MKLocationManager isLocationServicesAvailable](self->_locManager, "isLocationServicesAvailable"))
    v21 = layoutType == 2;
  else
    v21 = 1;
  if (v21 || !-[_MKResultView showsDistance](self, "showsDistance"))
    goto LABEL_23;
  -[_MKResultView referenceLocation](self, "referenceLocation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "placemark");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKResultView referenceLocation](self, "referenceLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "distanceFromLocation:", v25);
    v27 = v26;

    objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  -[_MKResultView fallbackDistance](self, "fallbackDistance");
  if (v29 <= 0.0)
  {
LABEL_23:
    v28 = 0;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    -[_MKResultView fallbackDistance](self, "fallbackDistance");
    objc_msgSend(v30, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v31, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:
  primaryLabelText = v5;
  if (-[NSString length](self->_primaryLabelText, "length"))
    primaryLabelText = self->_primaryLabelText;
  -[_MKResultView nameLabel](self, "nameLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setText:", primaryLabelText);

  if (-[NSString length](self->_secondaryLabelText, "length"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 1176)), "initWithString:", self->_secondaryLabelText);
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAttributedText:", v34);

  }
  else if (layoutType != 2 && -[_MKResultView showsDistance](self, "showsDistance") && objc_msgSend(v28, "length"))
  {
    if (objc_msgSend(v10, "length"))
    {
      v63 = v5;
      v36 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("RESULTVIEW_CITY_DISTANCE_TEXT"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", v37, v28, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "string");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "rangeOfString:", v40);
      v43 = v42;

      v62 = v39;
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v39);
      if (v43)
      {
        v45 = 0;
        do
        {
          v64 = 0;
          v65 = 0;
          objc_msgSend(v10, "attributesAtIndex:effectiveRange:", v45, &v64);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addAttributes:range:", v46, v45 + v41, v65);
          v45 += v65;

        }
        while (v45 < v43);
      }
      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAttributedText:", v44);

      v5 = v63;
    }
    else
    {
      if (v28)
        v60 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 1176)), "initWithString:", v28);
      else
        v60 = 0;
      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setAttributedText:", v60);

      if (v28)
    }
  }
  else
  {
    -[_MKResultView secondaryLabel](self, "secondaryLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAttributedText:", v10);

  }
  v49 = objc_msgSend(v13, "length");
  -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v49)
    v52 = v13;
  else
    v52 = 0;
  objc_msgSend(v50, "setText:", v52);

  v53 = self->_layoutType;
  switch(v53)
  {
    case 0:
      -[_MKResultView nameLabel](self, "nameLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setNumberOfLines:", 1);

      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v54;
      v57 = 1;
LABEL_47:
      objc_msgSend(v54, "setNumberOfLines:", v57);

      v53 = self->_layoutType;
      break;
    case 2:
      -[_MKResultView tertiaryLabel](self, "tertiaryLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setText:", 0);

      -[_MKResultView nameLabel](self, "nameLabel");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setNumberOfLines:", 1);

      -[_MKResultView secondaryLabel](self, "secondaryLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    case 1:
      -[_MKResultView nameLabel](self, "nameLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
      v56 = v54;
      v57 = 2;
      goto LABEL_47;
  }
  if (!v53 || v53 == 2)
  {
    -[_MKResultView _updateLayoutForBusinessOrCategory](self, "_updateLayoutForBusinessOrCategory");
  }
  else if (v53 == 1)
  {
    -[_MKResultView _updateLayoutForAddress](self, "_updateLayoutForAddress");
  }
  -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");

}

- (void)updateLayout
{
  -[_MKResultView updateImageView](self, "updateImageView");
  -[_MKResultView updateSubviews](self, "updateSubviews");
  -[_MKResultView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[_MKResultView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)-[NSArray firstObject](self->_mapItems, "firstObject");
}

- (void)setMapItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_MKResultView mapItem](self, "mapItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[_MKResultView mapItem](self, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) == 0)
    {
      if (v4)
      {
        v10[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C9AA60];
      }
      objc_storeStrong((id *)&self->_mapItems, v9);
      if (v4)

      self->_layoutType = objc_msgSend(v4, "_hasMUID") ^ 1;
      -[_MKResultView updateLayout](self, "updateLayout");
    }
  }

}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_mapItems != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_mapItems, a3);
    if (-[NSArray count](self->_mapItems, "count") >= 2)
    {
      self->_layoutType = 2;
    }
    else
    {
      -[_MKResultView mapItem](self, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_layoutType = objc_msgSend(v6, "_hasMUID") ^ 1;

    }
    -[_MKResultView updateLayout](self, "updateLayout");
    v5 = v7;
  }

}

- (NSString)primaryLabelText
{
  return self->_primaryLabelText;
}

- (void)setPrimaryLabelText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_primaryLabelText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_primaryLabelText, a3);
    -[_MKResultView updateSubviews](self, "updateSubviews");
  }

}

- (NSString)secondaryLabelText
{
  return self->_secondaryLabelText;
}

- (void)setSecondaryLabelText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryLabelText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_secondaryLabelText, a3);
    -[_MKResultView updateSubviews](self, "updateSubviews");
  }

}

- (void)setImageView:(id)a3
{
  UIImageView **p_imageView;
  id v6;

  p_imageView = &self->_imageView;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_imageView) & 1) == 0)
  {
    -[UIImageView removeFromSuperview](*p_imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](*p_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKResultView addSubview:](self, "addSubview:", *p_imageView);
    -[_MKResultView updateSubviews](self, "updateSubviews");
    -[_MKResultView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (void)_fireReferenceLocationTimer
{
  -[_MKResultView setReferenceLocation:](self, "setReferenceLocation:", 0);
  -[_MKResultView _cancelReferenceLocationTimer](self, "_cancelReferenceLocationTimer");
}

- (void)_cancelReferenceLocationTimer
{
  NSTimer *refLocationTimer;

  -[NSTimer invalidate](self->_refLocationTimer, "invalidate");
  refLocationTimer = self->_refLocationTimer;
  self->_refLocationTimer = 0;

}

- (void)setReferenceLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *referenceLocation;
  double v7;
  BOOL v8;
  CLLocation **p_referenceLocation;
  NSTimer *v10;
  NSTimer *refLocationTimer;

  v5 = (CLLocation *)a3;
  if (v5 && (referenceLocation = self->_referenceLocation) != 0)
  {
    -[CLLocation coordinate](referenceLocation, "coordinate");
    -[CLLocation coordinate](v5, "coordinate");
    CLLocationCoordinate2DGetDistanceFrom();
    v8 = v7 <= 100.0;
  }
  else
  {
    v8 = 0;
  }
  p_referenceLocation = &self->_referenceLocation;
  if (self->_referenceLocation != v5 && !v8)
  {
    objc_storeStrong((id *)p_referenceLocation, a3);
    -[_MKResultView updateSubviews](self, "updateSubviews");
    -[_MKResultView updateConstraints](self, "updateConstraints");
    if (*p_referenceLocation)
    {
      -[_MKResultView _cancelReferenceLocationTimer](self, "_cancelReferenceLocationTimer");
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fireReferenceLocationTimer, 0, 0, 480.0);
      v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      refLocationTimer = self->_refLocationTimer;
      self->_refLocationTimer = v10;

    }
  }

}

- (void)handleTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[_MKResultView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_MKResultView delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resultViewWasSelected:", self);

    }
  }
}

- (void)_locationApprovalDidChange
{
  if (-[_MKResultView showsDistance](self, "showsDistance")
    && -[MKLocationManager isLocationServicesAvailable](self->_locManager, "isLocationServicesAvailable"))
  {
    -[MKLocationManager startLocationUpdateWithObserver:](self->_locManager, "startLocationUpdateWithObserver:", self);
  }
  else
  {
    -[MKLocationManager stopLocationUpdateWithObserver:](self->_locManager, "stopLocationUpdateWithObserver:", self);
    -[_MKResultView setReferenceLocation:](self, "setReferenceLocation:", 0);
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalAccuracy");
  if (v5 <= 0.0)
    goto LABEL_4;
  objc_msgSend(v12, "lastLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalAccuracy");
  v8 = v7;
  objc_msgSend(v12, "distanceFilter");
  v10 = v9;

  v11 = v12;
  if (v8 < v10)
  {
    objc_msgSend(v12, "lastLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKResultView setReferenceLocation:](self, "setReferenceLocation:", v4);
LABEL_4:

    v11 = v12;
  }

}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  NSLog(CFSTR("MKResultView failed to get location with error: %@"), a2, a3, a4);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (BOOL)alwaysUsesBusinessLayout
{
  return self->_alwaysUsesBusinessLayout;
}

- (void)setAlwaysUsesBusinessLayout:(BOOL)a3
{
  self->_alwaysUsesBusinessLayout = a3;
}

- (_MKResultViewDelegate)delegate
{
  return (_MKResultViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)fallbackDistance
{
  return self->_fallbackDistance;
}

- (void)setFallbackDistance:(double)a3
{
  self->_fallbackDistance = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)useSpotlightVibrancy
{
  return self->_useSpotlightVibrancy;
}

- (void)setUseSpotlightVibrancy:(BOOL)a3
{
  self->_useSpotlightVibrancy = a3;
}

- (int)iconFormat
{
  return self->_iconFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_refLocationTimer, 0);
  objc_storeStrong((id *)&self->_secondaryLabelText, 0);
  objc_storeStrong((id *)&self->_primaryLabelText, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_resultConstraints, 0);
  objc_storeStrong((id *)&self->delegate, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end
