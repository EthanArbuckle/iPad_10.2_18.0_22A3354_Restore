@implementation MKPlaceCardHeaderViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)titleFont
{
  unint64_t layout;
  void *v3;
  void *v4;
  void *v5;

  layout = self->_layout;
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (layout == 1)
    objc_msgSend(v3, "brandTitleFont");
  else
    objc_msgSend(v3, "largeTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)minimalModeHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "largeTitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 32.0);
  v5 = v4 + 4.0;
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 21.0);
  v7 = v5 + v6 + 21.0;

  return v7;
}

- (id)secondaryNameTimingFunction
{
  if (qword_1EDFB7B08 != -1)
    dispatch_once(&qword_1EDFB7B08, &__block_literal_global_44);
  return (id)_MergedGlobals_1_6;
}

void __62__MKPlaceCardHeaderViewController_secondaryNameTimingFunction__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_6;
  _MergedGlobals_1_6 = v0;

}

- (double)lastLabelToBottomConstant
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = 0.0;
  if (v5 != 2)
  {
    objc_msgSend(v3, "_mapkit_scaledValueForValue:", 21.0);
    v6 = -v7;
  }

  return v6;
}

- (BOOL)shouldShowCallToActionWithRatingHeaderInfo
{
  return 0;
}

- (MKPlaceCardHeaderViewController)initWithPlaceItem:(id)a3 layout:(unint64_t)a4
{
  id v7;
  MKPlaceCardHeaderViewController *v8;
  MKPlaceCardHeaderViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceCardHeaderViewController;
  v8 = -[MKPlaceCardHeaderViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeItem, a3);
    v9->_layout = a4;
    -[MKPlaceCardHeaderViewController _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (MKPlaceCardHeaderViewController)initWithLineItem:(id)a3 layout:(unint64_t)a4
{
  id v7;
  MKPlaceCardHeaderViewController *v8;
  MKPlaceCardHeaderViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceCardHeaderViewController;
  v8 = -[MKPlaceCardHeaderViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lineItem, a3);
    v9->_layout = a4;
    -[MKPlaceCardHeaderViewController _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (void)_commonInit
{
  _MKDataHeaderModel *v3;
  _MKDataHeaderModel *dataModel;
  _MKTokenAttributedString *v5;
  _MKTokenAttributedString *titleToken;
  _MKTokenAttributedString *v7;
  _MKTokenAttributedString *secondaryNameToken;
  _MKTokenAttributedString *v9;
  _MKTokenAttributedString *distanceToken;
  _MKTokenAttributedString *v11;
  _MKTokenAttributedString *ratingsToken;
  _MKTokenAttributedString *v13;
  _MKTokenAttributedString *openStateToken;
  _MKTokenAttributedString *v15;
  _MKTokenAttributedString *priceToken;
  _MKTokenAttributedString *v17;
  _MKTokenAttributedString *categoryToken;
  _MKTokenAttributedString *v19;
  _MKTokenAttributedString *userLocationToken;
  _MKTokenAttributedString *v21;
  _MKTokenAttributedString *venueToken;
  _MKTokenAttributedString *v23;
  _MKTokenAttributedString *verifiedToken;
  void *v25;
  NSURL *v26;
  NSURL *logoURL;
  id v28;

  self->_optionSmallScreen = _MKPlaceCardUseSmallerFont();
  v3 = objc_alloc_init(_MKDataHeaderModel);
  dataModel = self->_dataModel;
  self->_dataModel = v3;

  v5 = objc_alloc_init(_MKTokenAttributedString);
  titleToken = self->_titleToken;
  self->_titleToken = v5;

  v7 = objc_alloc_init(_MKTokenAttributedString);
  secondaryNameToken = self->_secondaryNameToken;
  self->_secondaryNameToken = v7;

  v9 = objc_alloc_init(_MKTokenAttributedString);
  distanceToken = self->_distanceToken;
  self->_distanceToken = v9;

  v11 = objc_alloc_init(_MKTokenAttributedString);
  ratingsToken = self->_ratingsToken;
  self->_ratingsToken = v11;

  v13 = objc_alloc_init(_MKTokenAttributedString);
  openStateToken = self->_openStateToken;
  self->_openStateToken = v13;

  v15 = objc_alloc_init(_MKTokenAttributedString);
  priceToken = self->_priceToken;
  self->_priceToken = v15;

  v17 = objc_alloc_init(_MKTokenAttributedString);
  categoryToken = self->_categoryToken;
  self->_categoryToken = v17;

  v19 = objc_alloc_init(_MKTokenAttributedString);
  userLocationToken = self->_userLocationToken;
  self->_userLocationToken = v19;

  v21 = objc_alloc_init(_MKTokenAttributedString);
  venueToken = self->_venueToken;
  self->_venueToken = v21;

  v23 = objc_alloc_init(_MKTokenAttributedString);
  verifiedToken = self->_verifiedToken;
  self->_verifiedToken = v23;

  self->_isUserLocation = -[_MKPlaceItem options](self->_placeItem, "options") & 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__contentSizeDidChangeNotificationHandler, *MEMORY[0x1E0CEB3F0], 0);

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_bestBrandIconURLForSize:allowSmaller:", 1, 86.0, 86.0);
  v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
  logoURL = self->_logoURL;
  self->_logoURL = v26;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKPlaceCardHeaderViewController;
  -[MKPlaceCardHeaderViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsBottomHairline:", 0);

  -[MKPlaceCardHeaderViewController _createViews](self, "_createViews");
  -[MKPlaceCardHeaderViewController _setupDatas](self, "_setupDatas");
  -[MKPlaceCardHeaderViewController updateContent](self, "updateContent");
  -[MKPlaceCardHeaderViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKDataHeaderModel setOwnerView:](self->_dataModel, "setOwnerView:", v5);

}

- (void)updateHeaderTitle
{
  void *v3;
  void *v4;
  id v5;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCardHeaderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MKTokenAttributedString setString:](self->_titleToken, "setString:", v5);
    -[MKPlaceCardHeaderViewController updateViews](self, "updateViews");
  }

}

- (double)contentAlpha
{
  char v3;
  double result;

  v3 = -[MKPlaceSectionRowView isHidden](self->_labelsSectionView, "isHidden");
  result = 0.0;
  if ((v3 & 1) == 0)
    return self->_contentAlpha;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    -[MKPlaceCardHeaderViewController updateContentAlpha](self, "updateContentAlpha");
  }
}

- (void)updateContentAlpha
{
  MKPlaceSectionRowView *labelsSectionView;
  double contentAlpha;
  float v5;
  id v6;

  labelsSectionView = self->_labelsSectionView;
  if (labelsSectionView)
  {
    if ((-[MKPlaceSectionRowView isHidden](labelsSectionView, "isHidden") & 1) == 0)
    {
      -[MKPlaceCardHeaderViewController animateSecondLabelWithPercentage:](self, "animateSecondLabelWithPercentage:", self->_contentAlpha);
      -[UIView setAlpha:](self->_thirdDisplayedLabel, "setAlpha:", self->_contentAlpha);
      -[MKPlaceCardHeaderViewController secondaryNameTimingFunction](self, "secondaryNameTimingFunction");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      contentAlpha = self->_contentAlpha;
      *(float *)&contentAlpha = contentAlpha;
      objc_msgSend(v6, "_solveForInput:", contentAlpha);
      -[_MKUILabel setAlpha:](self->_secondaryNameLabel, "setAlpha:", v5);

    }
  }
}

- (void)animateSecondLabelWithPercentage:(double)a3
{
  double v4;
  double v5;
  NSLayoutConstraint *secondLabelToFirstLabelConstraint;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSLayoutConstraint *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = fmin(a3, 1.0);
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = 0.0;
  secondLabelToFirstLabelConstraint = self->_secondLabelToFirstLabelConstraint;
  if (secondLabelToFirstLabelConstraint)
  {
    v7 = -[NSLayoutConstraint isActive](secondLabelToFirstLabelConstraint, "isActive");
    if (v5 == 1.0)
    {
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0CB3718];
        v14[0] = self->_secondLabelToFirstLabelConstraint;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deactivateConstraints:", v9);

      }
    }
    else
    {
      if (!v7)
      {
        v10 = (void *)MEMORY[0x1E0CB3718];
        v13 = self->_secondLabelToFirstLabelConstraint;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activateConstraints:", v11);

      }
      -[MKPlaceCardHeaderViewController secondaryNameLabelPadding](self, "secondaryNameLabelPadding");
      -[NSLayoutConstraint setConstant:](self->_secondLabelToFirstLabelConstraint, "setConstant:", self->_secondLabelToFirstLabelConstraintConstantMin + v12 * v5);
    }
  }
}

- (double)secondaryNameLabelPadding
{
  return self->_secondLabelToFirstLabelConstraintConstantMax - self->_secondLabelToFirstLabelConstraintConstantMin;
}

- (id)_currentTitle
{
  void *v3;
  uint64_t v4;
  _MKPlaceItem *placeItem;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  GEOTransitLineItem *lineItem;
  void *v15;

  -[_MKPlaceItem name](self->_placeItem, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    placeItem = self->_placeItem;
LABEL_4:
    -[_MKPlaceItem name](placeItem, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[GEOTransitLineItem name](self->_lineItem, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  placeItem = self->_lineItem;
  if (v7)
    goto LABEL_4;
  -[_MKPlaceItem system](placeItem, "system");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  lineItem = self->_lineItem;
  if (v13)
  {
    -[GEOTransitLineItem system](lineItem, "system");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  if (!lineItem)
  {
    v9 = 0;
    return v9;
  }
  _MKLocalizedStringFromThisBundle(CFSTR("Line_Card_Default_Title"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = (void *)v8;
  return v9;
}

- (BOOL)_hasSecondaryName
{
  void *v2;
  BOOL v3;

  -[MKPlaceCardHeaderViewController _secondaryNameTitle](self, "_secondaryNameTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_secondaryNameTitle
{
  void *v2;
  void *v3;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_secondaryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_verifiedText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMessageIDVerified");

  if (v4)
  {
    -[UIViewController mk_theme](self, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lightTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setImage:", v9);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v24 = *MEMORY[0x1E0CEA0A0];
    v12 = v24;
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAttributes:range:", v13, 0, 1);

    v14 = (void *)objc_msgSend(v11, "copy");
    v15 = objc_alloc(MEMORY[0x1E0CB3778]);
    _MKLocalizedStringFromThisBundle(CFSTR("Brand_Card_Verified"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = *MEMORY[0x1E0CEA098];
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subtitleFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    v23[0] = v18;
    v23[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v19);

    if (v14)
      objc_msgSend(v20, "appendAttributedString:", v14);

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (id)_reviewLabelText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasUserRatingScore");

  if (v4)
  {
    -[UIViewController mk_theme](self, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lightTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController mk_theme](self, "mk_theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:](MKRatingStringBuilder, "ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:", v7, v6, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_MKLocalizedHoursBuilder)localizedHoursBuilder
{
  _MKLocalizedHoursBuilder *localizedHoursBuilder;
  _MKLocalizedHoursBuilder *v4;
  void *v5;
  _MKLocalizedHoursBuilder *v6;
  _MKLocalizedHoursBuilder *v7;

  localizedHoursBuilder = self->_localizedHoursBuilder;
  if (!localizedHoursBuilder)
  {
    v4 = [_MKLocalizedHoursBuilder alloc];
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_MKLocalizedHoursBuilder initWithMapItem:localizedHoursStringOptions:](v4, "initWithMapItem:localizedHoursStringOptions:", v5, 0);
    v7 = self->_localizedHoursBuilder;
    self->_localizedHoursBuilder = v6;

    localizedHoursBuilder = self->_localizedHoursBuilder;
  }
  return localizedHoursBuilder;
}

- (id)_openStateString
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasBusinessHours");

  if (!v4)
    return 0;
  if (self->_optionSmallScreen)
    v5 = 13;
  else
    v5 = 9;
  -[MKPlaceCardHeaderViewController localizedHoursBuilder](self, "localizedHoursBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedHoursStringOptions:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[MKPlaceCardHeaderViewController localizedHoursBuilder](self, "localizedHoursBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedOperatingHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CEA0A0];
  -[MKPlaceCardHeaderViewController localizedHoursBuilder](self, "localizedHoursBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hoursStateLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v9, v12);

  return v13;
}

- (void)_setupDatas
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
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
  uint64_t v32;
  void *v33;
  _BOOL4 isUserLocation;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  MKTransitInfoLabelView *v40;
  void *v41;
  MKTransitInfoLabelView *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  void *v53;
  _MKTokenAttributedString **p_priceToken;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _MKTokenAttributedString **p_openStateToken;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  id v65;

  -[MKPlaceCardHeaderViewController _currentTitle](self, "_currentTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setString:](self->_titleToken, "setString:", v3);

  -[MKPlaceCardHeaderViewController _secondaryNameTitle](self, "_secondaryNameTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setString:](self->_secondaryNameToken, "setString:", v4);

  -[MKPlaceCardHeaderViewController _reviewLabelText](self, "_reviewLabelText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setAttributedString:](self->_ratingsToken, "setAttributedString:", v5);

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasPriceDescription");
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
    objc_msgSend(v8, "_priceDescription");
  else
    objc_msgSend(v8, "_priceRangeString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setString:](self->_priceToken, "setString:", v10);

  -[MKPlaceCardHeaderViewController _openStateString](self, "_openStateString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setAttributedString:](self->_openStateToken, "setAttributedString:", v11);

  -[MKPlaceCardHeaderViewController _verifiedText](self, "_verifiedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setAttributedString:](self->_verifiedToken, "setAttributedString:", v12);

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_firstLocalizedCategoryName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  v16 = 0x1ECE2A000uLL;
  if (v15)
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_firstLocalizedCategoryName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKTokenAttributedString setString:](self->_categoryToken, "setString:", v18);

  }
  else
  {
    if (!self->_lineItem)
      goto LABEL_9;
    _MKLocalizedStringFromThisBundle(CFSTR("Line_Card_Category"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKTokenAttributedString setString:](self->_categoryToken, "setString:", v17);
  }

LABEL_9:
  if (!self->_isUserLocation)
    goto LABEL_20;
  _MKLocalizedStringFromThisBundle(CFSTR("NEAR_BY_PLACE_HEADER_STRING"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isAuthorizedForPreciseLocation");

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_geoAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "structuredAddress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v21)
  {
    objc_msgSend(v24, "locality");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_geoAddress");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "structuredAddress");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "administrativeAreaCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v31, "length"))
      {
        objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(", %@"), v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v32;
      }
      v16 = 0x1ECE2A000;

      goto LABEL_19;
    }
    goto LABEL_17;
  }
  objc_msgSend(v24, "fullThoroughfare");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v26, "length"))
  {
LABEL_17:
    v27 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v16 = 0x1ECE2A000uLL;
LABEL_19:

  -[_MKTokenAttributedString setString:](self->_userLocationToken, "setString:", v27);
LABEL_20:
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "_venueFeatureType") == 4)
  {

  }
  else
  {
    isUserLocation = self->_isUserLocation;

    if (!isUserLocation)
      goto LABEL_24;
  }
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "venueLabelWithContext:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setString:](self->_venueToken, "setString:", v36);

LABEL_24:
  -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "removeFromSuperview");

  -[_MKDataHeaderModel setTransitLabel:](self->_dataModel, "setTransitLabel:", 0);
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "_hasTransitLabels") & 1) != 0)
  {

  }
  else
  {
    v39 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *(int *)(v16 + 2820));

    if (!v39)
      goto LABEL_32;
  }
  v40 = [MKTransitInfoLabelView alloc];
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[MKTransitInfoLabelView initWithMapItem:](v40, "initWithMapItem:", v41);
  -[_MKDataHeaderModel setTransitLabel:](self->_dataModel, "setTransitLabel:", v42);

  -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "set_mapkit_themeColorProvider:", &__block_literal_global_48);

  v44 = *(int *)(v16 + 2820);
  v45 = *(Class *)((char *)&self->super.super.super.super.isa + v44);
  if (v45)
  {
    objc_msgSend(v45, "labelItems");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v44), "labelItems");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setLabelItems:", v48);

    }
    else
    {
      -[_MKDataHeaderModel setTransitLabel:](self->_dataModel, "setTransitLabel:", 0);
    }
  }
  -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

LABEL_32:
  v51 = -[MKPlaceCardHeaderViewController _isLikelyToShowDistance](self, "_isLikelyToShowDistance");
  -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setShouldUseEmptyPlaceholder:", v51);

  -[_MKDataHeaderModel firstLine](self->_dataModel, "firstLine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addToken:", self->_titleToken);

  if (self->_layout != 1)
  {
    if (-[_MKTokenAttributedString isEmpty](self->_userLocationToken, "isEmpty"))
    {
      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addToken:", self->_categoryToken);

      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addToken:", self->_venueToken);

      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addToken:", self->_distanceToken);

      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      p_openStateToken = &self->_openStateToken;
    }
    else
    {
      v62 = -[_MKTokenAttributedString isEmpty](self->_venueToken, "isEmpty");
      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
        p_openStateToken = &self->_userLocationToken;
      else
        p_openStateToken = &self->_venueToken;
    }
    objc_msgSend(v59, "addToken:", *p_openStateToken);

    if (-[MKPlaceCardHeaderViewController _hasSecondaryName](self, "_hasSecondaryName"))
    {
      if (!-[_MKTokenAttributedString isEmpty](self->_secondaryNameToken, "isEmpty"))
      {
        -[_MKDataHeaderModel secondaryNameLine](self->_dataModel, "secondaryNameLine");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addToken:", self->_secondaryNameToken);

      }
    }
    -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addToken:", self->_ratingsToken);

    -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    p_priceToken = &self->_priceToken;
    goto LABEL_45;
  }
  p_priceToken = &self->_verifiedToken;
  v55 = -[_MKTokenAttributedString isEmpty](self->_verifiedToken, "isEmpty");
  self->_notVerified = v55;
  if (!v55)
  {
    -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
    v65 = v61;
    objc_msgSend(v61, "addToken:", *p_priceToken);

  }
}

uint64_t __46__MKPlaceCardHeaderViewController__setupDatas__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

- (BOOL)_isLikelyToShowDistance
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_MKQuickRouteManager isLikelyToReturnETAForLocation:](_MKQuickRouteManager, "isLikelyToReturnETAForLocation:", v2))
  {
    v3 = 1;
  }
  else
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  return v3;
}

- (void)_loadLogo
{
  void *v3;
  NSURL *logoURL;
  _QWORD v5[5];

  if (self->_logoURL)
  {
    +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    logoURL = self->_logoURL;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke;
    v5[3] = &unk_1E20D96B8;
    v5[4] = self;
    objc_msgSend(v3, "loadAppImageAtURL:completionHandler:", logoURL, v5);

  }
}

void __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 1000);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke_2;
  v8[3] = &unk_1E20D7E58;
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v8, 0, 0.200000003);

}

uint64_t __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)ETAProviderUpdated:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[_MKTokenAttributedString string](self->_distanceToken, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "distanceString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    objc_msgSend(v21, "distanceString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v14 = v5;
LABEL_17:

      goto LABEL_18;
    }
  }
  -[_MKTokenAttributedString string](self->_distanceToken, "string");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v21, "distanceString");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[_MKTokenAttributedString string](self->_distanceToken, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "distanceString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v5 == v6)
      {

      }
      else
      {

      }
      if ((v13 & 1) != 0)
        goto LABEL_18;
      goto LABEL_14;
    }

  }
  if (v5 == v6)

LABEL_14:
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MKPlaceCardHeaderViewController _mapItemShouldDisplayDistance:](self, "_mapItemShouldDisplayDistance:", v15);

  if (v16)
  {
    -[MKPlaceCardHeaderViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v21, "distanceString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKTokenAttributedString setString:](self->_distanceToken, "setString:", v18);

      -[MKPlaceCardHeaderViewController updateViews](self, "updateViews");
      -[MKPlaceCardHeaderViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_mapkit_setNeedsLayout");

      -[MKPlaceCardHeaderViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_mapkit_layoutIfNeeded");
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (BOOL)_mapItemShouldDisplayDistance:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "_hasVenueFeatureType"))
    v4 = objc_msgSend(v3, "_venueFeatureType") != 4;
  else
    v4 = 1;

  return v4;
}

- (id)newLabel
{
  _MKUILabel *v2;
  _MKUILabel *v3;

  v2 = [_MKUILabel alloc];
  v3 = -[_MKUILabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
  return v3;
}

- (void)_createViews
{
  id v3;
  UIImageView *v4;
  UIImageView *logoImageView;
  void *v6;
  void *v7;
  void *v8;
  _MKUILabel *v9;
  _MKUILabel *titleOnlyLabel;
  _MKUILabel *v11;
  _MKUILabel *firstLabel;
  _MKUILabel *v13;
  _MKUILabel *secondLabel;
  _MKUILabel *v15;
  _MKUILabel *thirdLabel;
  MKPlaceSectionRowView *v17;
  MKPlaceSectionRowView *titleSectionView;
  MKPlaceSectionRowView *v19;
  MKPlaceSectionRowView *labelsSectionView;
  double v21;
  unint64_t layout;
  _MKUILabel *v23;
  _MKUILabel *secondaryNameLabel;
  double v25;
  void *v26;
  UILayoutGuide *v27;
  UILayoutGuide *leadingGuide;

  if (self->_layout == 1)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    logoImageView = self->_logoImageView;
    self->_logoImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView layer](self->_logoImageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBounds:", 0.0, 0.0, 86.0, 86.0);

    -[UIImageView layer](self->_logoImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 11.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_logoImageView, "setBackgroundColor:", v8);

    -[UIImageView setContentMode:](self->_logoImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](self->_logoImageView, "setClipsToBounds:", 1);
  }
  v9 = -[MKPlaceCardHeaderViewController newLabel](self, "newLabel");
  titleOnlyLabel = self->_titleOnlyLabel;
  self->_titleOnlyLabel = v9;

  -[_MKUILabel setTextAlignment:](self->_titleOnlyLabel, "setTextAlignment:", 1);
  v11 = -[MKPlaceCardHeaderViewController newLabel](self, "newLabel");
  firstLabel = self->_firstLabel;
  self->_firstLabel = v11;

  v13 = -[MKPlaceCardHeaderViewController newLabel](self, "newLabel");
  secondLabel = self->_secondLabel;
  self->_secondLabel = v13;

  if (self->_layout == 1)
  {
    -[_MKUILabel setTextAlignment:](self->_firstLabel, "setTextAlignment:", 1);
    -[_MKUILabel setTextAlignment:](self->_secondLabel, "setTextAlignment:", 1);
  }
  v15 = -[MKPlaceCardHeaderViewController newLabel](self, "newLabel");
  thirdLabel = self->_thirdLabel;
  self->_thirdLabel = v15;

  if (self->_layout == 1)
    -[_MKUILabel setTextAlignment:](self->_thirdLabel, "setTextAlignment:", 1);
  v17 = objc_alloc_init(MKPlaceSectionRowView);
  titleSectionView = self->_titleSectionView;
  self->_titleSectionView = v17;

  -[MKPlaceSectionRowView setPreservesSuperviewLayoutMargins:](self->_titleSectionView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKPlaceSectionRowView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleSectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKViewWithHairline setTopHairlineHidden:](self->_titleSectionView, "setTopHairlineHidden:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_titleSectionView, "setBottomHairlineHidden:", 1);
  -[MKPlaceSectionRowView addSubview:](self->_titleSectionView, "addSubview:", self->_titleOnlyLabel);
  v19 = objc_alloc_init(MKPlaceSectionRowView);
  labelsSectionView = self->_labelsSectionView;
  self->_labelsSectionView = v19;

  -[MKPlaceSectionRowView setPreservesSuperviewLayoutMargins:](self->_labelsSectionView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKPlaceSectionRowView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelsSectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v21) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_labelsSectionView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v21);
  -[MKViewWithHairline setTopHairlineHidden:](self->_labelsSectionView, "setTopHairlineHidden:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_labelsSectionView, "setBottomHairlineHidden:", 1);
  -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_firstLabel);
  layout = self->_layout;
  if (-[MKPlaceCardHeaderViewController _hasSecondaryName](self, "_hasSecondaryName"))
  {
    if (!layout)
    {
      v23 = -[MKPlaceCardHeaderViewController newLabel](self, "newLabel");
      secondaryNameLabel = self->_secondaryNameLabel;
      self->_secondaryNameLabel = v23;

      LODWORD(v25) = 1148846080;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryNameLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v25);
      if (!self->_layout)
        -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_secondaryNameLabel);
    }
  }
  -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_secondLabel);
  -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_thirdLabel);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStackDelegate:", self);

  v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  leadingGuide = self->_leadingGuide;
  self->_leadingGuide = v27;

  -[MKPlaceSectionRowView addLayoutGuide:](self->_labelsSectionView, "addLayoutGuide:", self->_leadingGuide);
}

- (void)updateViews
{
  unint64_t layout;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
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
  UIView *v31;
  UIView *thirdDisplayedLabel;
  uint64_t v33;
  uint64_t v34;
  MKPlaceSectionRowView *labelsSectionView;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  layout = self->_layout;
  v4 = layout == 1;
  if (layout == 1)
  {
    -[UIImageView superview](self->_logoImageView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_logoImageView);
      -[MKPlaceCardHeaderViewController _loadLogo](self, "_loadLogo");
    }
  }
  -[_MKDataHeaderModel firstLine](self->_dataModel, "firstLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorProvider:", &__block_literal_global_58);

  LOBYTE(v34) = v4;
  -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine", MEMORY[0x1E0C809B0], 3221225472, __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_2, &__block_descriptor_33_e36___UIColor_16__0___MKInfoCardTheme__8l, v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorProvider:", &v33);

  -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColorProvider:", &__block_literal_global_59);

  -[_MKDataHeaderModel forthLine](self->_dataModel, "forthLine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorProvider:", &__block_literal_global_60);

  -[_MKDataHeaderModel secondaryNameLine](self->_dataModel, "secondaryNameLine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorProvider:", &__block_literal_global_61);

  if (-[MKPlaceCardHeaderViewController _hasSecondaryName](self, "_hasSecondaryName"))
  {
    if (self->_layout == 1)
    {
LABEL_10:
      -[_MKDataHeaderModel firstLine](self->_dataModel, "firstLine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "contentAttributedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setAttributedText:](self->_firstLabel, "setAttributedText:", v23);

      -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentAttributedString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setAttributedText:](self->_secondLabel, "setAttributedText:", v25);

      -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentAttributedString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setAttributedText:](self->_thirdLabel, "setAttributedText:", v27);

      -[MKPlaceSectionViewController sectionView](self, "sectionView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      labelsSectionView = self->_labelsSectionView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &labelsSectionView, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setRowViews:", v29);

      -[_MKUILabel setHidden:](self->_secondLabel, "setHidden:", self->_notVerified);
      goto LABEL_11;
    }
    -[_MKDataHeaderModel secondaryNameLine](self->_dataModel, "secondaryNameLine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentAttributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setAttributedText:](self->_secondaryNameLabel, "setAttributedText:", v12);

  }
  v13 = self->_layout;
  if (v13 == 1)
    goto LABEL_10;
  if (!v13)
  {
    -[_MKDataHeaderModel firstLine](self->_dataModel, "firstLine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentAttributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setAttributedText:](self->_firstLabel, "setAttributedText:", v15);

    -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentAttributedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setAttributedText:](self->_secondLabel, "setAttributedText:", v17);

    -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentAttributedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setAttributedText:](self->_thirdLabel, "setAttributedText:", v19);

    -[MKPlaceSectionViewController sectionView](self, "sectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = self->_labelsSectionView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRowViews:", v21);

    -[MKPlaceCardHeaderViewController lastLabelToBottomConstant](self, "lastLabelToBottomConstant");
    -[NSLayoutConstraint setConstant:](self->_lastLabelToBottomConstraint, "setConstant:");
  }
LABEL_11:
  -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_MKDataHeaderModel transitLabel](self->_dataModel, "transitLabel");
    v31 = (UIView *)objc_claimAutoreleasedReturnValue();
    thirdDisplayedLabel = self->_thirdDisplayedLabel;
    self->_thirdDisplayedLabel = v31;

    -[MKPlaceSectionRowView addSubview:](self->_labelsSectionView, "addSubview:", self->_thirdDisplayedLabel);
    -[_MKUILabel setHidden:](self->_thirdLabel, "setHidden:", 1);
  }
  else
  {
    objc_storeStrong((id *)&self->_thirdDisplayedLabel, self->_thirdLabel);
  }
  -[_MKUILabel invalidateIntrinsicContentSize](self->_thirdLabel, "invalidateIntrinsicContentSize");
  -[MKPlaceCardHeaderViewController setConstraints](self, "setConstraints");
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

id __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    objc_msgSend(a2, "lightTextColor");
  else
    objc_msgSend(a2, "textColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

- (void)setConstraints
{
  void *v3;
  void *v4;
  double v5;
  id WeakRetained;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MKPlaceCardHeaderViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIImageView *v25;
  void *v26;
  _MKUILabel **p_firstLabel;
  uint64_t v28;
  _MKUILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *secondLabelToFirstLabelConstraint;
  double v36;
  void *v37;
  _MKUILabel *secondLabel;
  id v39;
  _MKUILabel *v40;
  uint64_t i;
  _MKUILabel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  UIImageView *v51;
  void *v52;
  _MKUILabel *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  UIImageView *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSLayoutConstraint *lastLabelToBottomConstraint;
  uint64_t v78;
  NSArray *constraints;
  _MKUILabel *v80;
  id obj;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  MKPlaceCardHeaderViewController *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _MKUILabel *v90;
  void *v91;
  _MKUILabel *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[2];
  _BYTE v99[128];
  _QWORD v100[3];
  _QWORD v101[2];
  _MKUILabel *firstLabel;
  _QWORD v103[4];
  _QWORD v104[4];

  v104[2] = *MEMORY[0x1E0C80C00];
  if (!self->_constraintsCreated)
  {
    self->_constraintsCreated = 1;
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitleFont");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v5 = 0.0;
    if (!self->_layout)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "placeCardHeaderViewControllerTrailingConstantForTitle:", self);
      v5 = v7;

    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v8, "userInterfaceIdiom");

    -[UILayoutGuide leadingAnchor](self->_leadingGuide, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionRowView layoutMarginsGuide](self->_labelsSectionView, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v12;
    -[UILayoutGuide widthAnchor](self->_leadingGuide, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 0.0);
    v86 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v4;
    objc_msgSend(v4, "addObjectsFromArray:", v15);

    v16 = self;
    if (self->_layout != 1)
      goto LABEL_8;
    -[UIImageView centerXAnchor](self->_logoImageView, "centerXAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionRowView centerXAnchor](self->_labelsSectionView, "centerXAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v89);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v87;
    -[UIImageView topAnchor](self->_logoImageView, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionRowView topAnchor](self->_labelsSectionView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v17, 15.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v18;
    -[UIImageView widthAnchor](self->_logoImageView, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 86.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v20;
    -[UIImageView widthAnchor](self->_logoImageView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_logoImageView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v24);

    v16 = self;
    if (self->_layout == 1)
    {
      v25 = self->_logoImageView;
      if (self->_notVerified)
      {
        firstLabel = self->_firstLabel;
        v26 = (void *)MEMORY[0x1E0C99D20];
        p_firstLabel = &firstLabel;
        v28 = 1;
      }
      else
      {
        secondLabel = self->_secondLabel;
        v101[0] = self->_firstLabel;
        v101[1] = secondLabel;
        v26 = (void *)MEMORY[0x1E0C99D20];
        p_firstLabel = (_MKUILabel **)v101;
        v28 = 2;
      }
      objc_msgSend(v26, "arrayWithObjects:count:", p_firstLabel, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      v29 = v16->_secondLabel;
      v100[0] = v16->_firstLabel;
      v100[1] = v29;
      v100[2] = v16->_thirdDisplayedLabel;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      if (-[MKPlaceCardHeaderViewController _hasSecondaryName](v16, "_hasSecondaryName") && !v16->_layout)
      {
        objc_msgSend(v31, "insertObject:atIndex:", v16->_secondaryNameLabel, 1);
        -[_MKUILabel topAnchor](v16->_secondLabel, "topAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel bottomAnchor](v16->_firstLabel, "bottomAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:", v33);
        v34 = objc_claimAutoreleasedReturnValue();
        secondLabelToFirstLabelConstraint = v16->_secondLabelToFirstLabelConstraint;
        v16->_secondLabelToFirstLabelConstraint = (NSLayoutConstraint *)v34;

        LODWORD(v36) = 1148846080;
        -[NSLayoutConstraint setPriority:](v16->_secondLabelToFirstLabelConstraint, "setPriority:", v36);
      }
      v37 = (void *)objc_msgSend(v31, "copy");

      v25 = 0;
    }
    objc_msgSend(v37, "lastObject");
    v80 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v39 = v37;
    v88 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    if (v88)
    {
      v40 = 0;
      v85 = *(_QWORD *)v95;
      obj = v39;
      do
      {
        for (i = 0; i != v88; ++i)
        {
          v92 = v40;
          if (*(_QWORD *)v95 != v85)
            objc_enumerationMutation(obj);
          v42 = *(_MKUILabel **)(*((_QWORD *)&v94 + 1) + 8 * i);
          -[_MKUILabel leadingAnchor](v42, "leadingAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide trailingAnchor](v16->_leadingGuide, "trailingAnchor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 0.0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v98[0] = v45;
          v90 = v42;
          -[_MKUILabel trailingAnchor](v42, "trailingAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceSectionRowView layoutMarginsGuide](v16->_labelsSectionView, "layoutMarginsGuide");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "trailingAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            v49 = 0.0;
          else
            v49 = -v5;
          objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v98[1] = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
          v51 = v25;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObjectsFromArray:", v52);

          if (v92)
          {
            v25 = v51;
            if (v83 == 5)
            {
              v53 = v90;
              if (v80 == v90)
                v54 = 6.0;
              else
                v54 = 1.0;
              -[_MKUILabel topAnchor](v90, "topAnchor");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKUILabel bottomAnchor](v92, "bottomAnchor");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v54);
              v51 = (UIImageView *)objc_claimAutoreleasedReturnValue();

              v16 = v86;
            }
            else
            {
              v53 = v90;
              -[_MKUILabel firstBaselineAnchor](v90, "firstBaselineAnchor");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKUILabel lastBaselineAnchor](v92, "lastBaselineAnchor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v86;
              if (v86->_layout == 1)
                v64 = 26.0;
              else
                v64 = 21.0;
              objc_msgSend(v82, "_mapkit_scaledValueForValue:", v64);
              objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63);
              v51 = (UIImageView *)objc_claimAutoreleasedReturnValue();

            }
            if (v53 == v16->_secondLabel)
            {
              LODWORD(v57) = 1148829696;
              -[UIImageView setPriority:](v51, "setPriority:", v57);
            }
            objc_msgSend(v93, "addObject:", v51);
          }
          else if (v51)
          {
            v53 = v90;
            -[_MKUILabel firstBaselineAnchor](v90, "firstBaselineAnchor");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIImageView bottomAnchor](v51, "bottomAnchor");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_mapkit_scaledValueForValue:", 34.0);
            objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v70);

            v25 = 0;
            v16 = v86;
          }
          else
          {
            v16 = v86;
            v53 = v90;
            if (v83 == 5)
            {
              -[_MKUILabel topAnchor](v90, "topAnchor");
              v51 = (UIImageView *)objc_claimAutoreleasedReturnValue();
              -[MKPlaceSectionRowView topAnchor](v86->_labelsSectionView, "topAnchor");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = 15.0;
              v60 = v51;
              v61 = v58;
            }
            else
            {
              objc_msgSend(v82, "_mapkit_scaledValueForValue:scalingForMacIdiom:respectingTraitEnvironment:", 0, 0, *(double *)&kMapKitPlaceCardHeaderTitleLabelBaselineToTop);
              v66 = v65;
              -[_MKUILabel firstBaselineAnchor](v90, "firstBaselineAnchor");
              v51 = (UIImageView *)objc_claimAutoreleasedReturnValue();
              -[MKPlaceSectionRowView topAnchor](v86->_labelsSectionView, "topAnchor");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v51;
              v61 = v58;
              v59 = v66;
            }
            -[UIImageView constraintEqualToAnchor:constant:](v60, "constraintEqualToAnchor:constant:", v61, v59);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v67);

            v25 = 0;
          }

          v40 = v53;
        }
        v39 = obj;
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      }
      while (v88);

      if (v40)
      {
        +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "userInterfaceIdiom");

        if (v72 == 2)
          -[_MKUILabel bottomAnchor](v40, "bottomAnchor");
        else
          -[_MKUILabel lastBaselineAnchor](v40, "lastBaselineAnchor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView bottomAnchor](v16->_labelsSectionView, "bottomAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceCardHeaderViewController lastLabelToBottomConstant](v16, "lastLabelToBottomConstant");
        objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75);
        v76 = objc_claimAutoreleasedReturnValue();
        lastLabelToBottomConstraint = v16->_lastLabelToBottomConstraint;
        v16->_lastLabelToBottomConstraint = (NSLayoutConstraint *)v76;

        v73 = v93;
        objc_msgSend(v93, "addObject:", v16->_lastLabelToBottomConstraint);
        goto LABEL_50;
      }
    }
    else
    {

      v40 = 0;
    }
    v73 = v93;
LABEL_50:
    v78 = objc_msgSend(v73, "copy");
    constraints = v16->_constraints;
    v16->_constraints = (NSArray *)v78;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16->_constraints);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double MaxY;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceCardHeaderViewController;
  -[MKPlaceCardHeaderViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  if (-[MKPlaceCardHeaderViewController _hasSecondaryName](self, "_hasSecondaryName")
    && self->_constraintsCreated
    && (self->_secondLabelToFirstLabelConstraintConstantMax <= 0.0
     || self->_secondLabelToFirstLabelConstraintConstantMin <= 0.0))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MKPlaceCardHeaderViewController view](self, "view", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "setNeedsLayout");
          objc_msgSend(v9, "layoutIfNeeded");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

    -[_MKUILabel frame](self->_firstLabel, "frame");
    MaxY = CGRectGetMaxY(v18);
    -[_MKUILabel frame](self->_secondLabel, "frame");
    self->_secondLabelToFirstLabelConstraintConstantMax = CGRectGetMinY(v19) - MaxY;
    -[_MKUILabel frame](self->_secondaryNameLabel, "frame");
    self->_secondLabelToFirstLabelConstraintConstantMin = CGRectGetMinY(v20) - MaxY;
  }
}

- (void)_contentSizeDidChangeNotificationHandler
{
  self->_constraintsCreated = 0;
  -[MKPlaceCardHeaderViewController _contentSizeDidChange](self, "_contentSizeDidChange");
}

- (void)_contentSizeDidChange
{
  self->_secondLabelToFirstLabelConstraintConstantMax = 0.0;
  self->_secondLabelToFirstLabelConstraintConstantMin = 0.0;
  -[MKPlaceCardHeaderViewController updateContent](self, "updateContent");
}

- (void)updateContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[MKPlaceCardHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x1E0CEA098];
    v6 = v28;
    -[MKPlaceCardHeaderViewController titleFont](self, "titleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKDataHeaderModel firstLine](self->_dataModel, "firstLine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFontAttribute:", v8);

    v26 = v6;
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKDataHeaderModel secondLine](self->_dataModel, "secondLine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFontAttribute:", v10);

    v24 = v6;
    v25 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKDataHeaderModel thirdLine](self->_dataModel, "thirdLine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFontAttribute:", v12);

    v22 = v6;
    v23 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKDataHeaderModel forthLine](self->_dataModel, "forthLine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFontAttribute:", v14);

    v20 = v6;
    v21 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKDataHeaderModel secondaryNameLine](self->_dataModel, "secondaryNameLine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFontAttribute:", v16);

    -[MKPlaceCardHeaderViewController _reviewLabelText](self, "_reviewLabelText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKTokenAttributedString setAttributedString:](self->_ratingsToken, "setAttributedString:", v18);

    -[MKPlaceCardHeaderViewController _verifiedText](self, "_verifiedText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKTokenAttributedString setAttributedString:](self->_verifiedToken, "setAttributedString:", v19);

    -[MKPlaceCardHeaderViewController updateViews](self, "updateViews");
  }
}

- (void)infoCardThemeChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCardHeaderViewController;
  -[UIViewController infoCardThemeChanged](&v4, sel_infoCardThemeChanged);
  -[MKPlaceCardHeaderViewController _reviewLabelText](self, "_reviewLabelText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKTokenAttributedString setAttributedString:](self->_ratingsToken, "setAttributedString:", v3);

  -[MKPlaceCardHeaderViewController updateViews](self, "updateViews");
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKPlaceCardHeaderViewControllerDelegate)delegate
{
  return (MKPlaceCardHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLocalizedHoursBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_localizedHoursBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedHoursBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_lastLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondLabelToFirstLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_verifiedToken, 0);
  objc_storeStrong((id *)&self->_venueToken, 0);
  objc_storeStrong((id *)&self->_userLocationToken, 0);
  objc_storeStrong((id *)&self->_openStateToken, 0);
  objc_storeStrong((id *)&self->_categoryToken, 0);
  objc_storeStrong((id *)&self->_priceToken, 0);
  objc_storeStrong((id *)&self->_ratingsToken, 0);
  objc_storeStrong((id *)&self->_distanceToken, 0);
  objc_storeStrong((id *)&self->_secondaryNameToken, 0);
  objc_storeStrong((id *)&self->_titleToken, 0);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_leadingGuide, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_thirdDisplayedLabel, 0);
  objc_storeStrong((id *)&self->_thirdLabel, 0);
  objc_storeStrong((id *)&self->_secondaryNameLabel, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
  objc_storeStrong((id *)&self->_titleOnlyLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_labelsSectionView, 0);
  objc_storeStrong((id *)&self->_titleSectionView, 0);
}

@end
