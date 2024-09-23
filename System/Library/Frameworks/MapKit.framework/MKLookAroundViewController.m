@implementation MKLookAroundViewController

- (void)_commonInit
{
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;

  self->_initialScene = 1;
  self->_navigationEnabled = 1;
  self->_needsLookAroundViewUpdate = 1;
  self->_needsSceneUpdate = 1;
  self->_presentationType = 0;
  v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v3;

  self->_showsRoadLabels = 1;
}

- (MKLookAroundViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  MKLookAroundViewController *v4;
  MKLookAroundViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundViewController;
  v4 = -[MKLookAroundViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, nibNameOrNil, nibBundleOrNil);
  v5 = v4;
  if (v4)
    -[MKLookAroundViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (MKLookAroundViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  MKLookAroundViewController *v5;
  MKLookAroundViewController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)MKLookAroundViewController;
  v5 = -[MKLookAroundViewController initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[MKLookAroundViewController _commonInit](v5, "_commonInit");
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MKDelegate")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("MKDelegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundViewController setDelegate:](v6, "setDelegate:", v7);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MKNavigationEnabled")))
      -[MKLookAroundViewController setNavigationEnabled:](v6, "setNavigationEnabled:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MKNavigationEnabled")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MKShowsRoadLabels")))
      -[MKLookAroundViewController setShowsRoadLabels:](v6, "setShowsRoadLabels:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MKShowsRoadLabels")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MKPointOfInterestFilter")))
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKPointOfInterestFilter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundViewController setPointOfInterestFilter:](v6, "setPointOfInterestFilter:", v8);

    }
  }

  return v6;
}

- (MKLookAroundViewController)initWithScene:(MKLookAroundScene *)scene
{
  MKLookAroundScene *v5;
  MKLookAroundViewController *v6;
  MKLookAroundViewController *v7;
  objc_super v9;

  v5 = scene;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundViewController;
  v6 = -[MKLookAroundViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    -[MKLookAroundViewController _commonInit](v6, "_commonInit");
    objc_storeStrong((id *)&v7->_scene, scene);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundViewController;
  v4 = a3;
  -[MKLookAroundViewController encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[MKLookAroundViewController delegate](self, "delegate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("MKDelegate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MKLookAroundViewController isNavigationEnabled](self, "isNavigationEnabled"), CFSTR("MKNavigationEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MKLookAroundViewController showsRoadLabels](self, "showsRoadLabels"), CFSTR("MKShowsRoadLabels"));
  -[MKLookAroundViewController pointOfInterestFilter](self, "pointOfInterestFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKPointOfInterestFilter"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_didBecomeFullyDrawnObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_didBecomeFullyDrawnObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  -[MKLookAroundViewController dealloc](&v4, sel_dealloc);
}

- (void)setScene:(MKLookAroundScene *)scene
{
  MKLookAroundScene *v5;
  MKLookAroundScene *v6;

  v5 = scene;
  if (self->_scene != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_scene, scene);
    self->_needsSceneUpdate = 1;
    -[MKLookAroundViewController _updateSceneIfNeeded](self, "_updateSceneIfNeeded");
    v5 = v6;
  }

}

- (void)setNavigationEnabled:(BOOL)navigationEnabled
{
  _BOOL8 v3;

  v3 = navigationEnabled;
  if (self->_navigationEnabled != navigationEnabled)
  {
    self->_navigationEnabled = navigationEnabled;
    self->_needsLookAroundViewUpdate = 1;
    -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
  }
  -[MKLookAroundView setNavigatingEnabled:](self->_lookAroundView, "setNavigatingEnabled:", v3);
}

- (void)setShowsRoadLabels:(BOOL)showsRoadLabels
{
  if (self->_showsRoadLabels != showsRoadLabels)
  {
    self->_showsRoadLabels = showsRoadLabels;
    self->_needsLookAroundViewUpdate = 1;
    -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
  }
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  MKPointOfInterestFilter *v5;
  MKPointOfInterestFilter *v6;

  v5 = pointOfInterestFilter;
  if (self->_pointOfInterestFilter != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pointOfInterestFilter, pointOfInterestFilter);
    self->_needsLookAroundViewUpdate = 1;
    -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
    v5 = v6;
  }

}

- (void)setBadgePosition:(MKLookAroundBadgePosition)badgePosition
{
  MKLookAroundBadgePosition v3;

  if ((unint64_t)badgePosition >= (MKLookAroundBadgePositionBottomTrailing|MKLookAroundBadgePositionTopTrailing))
    v3 = MKLookAroundBadgePositionTopLeading;
  else
    v3 = badgePosition;
  if (self->_badgePosition != v3)
  {
    self->_badgePosition = v3;
    if (-[MKLookAroundViewController isViewLoaded](self, "isViewLoaded"))
      -[MKLookAroundViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
  }
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2 * (self->_presentationType == 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  -[MKLookAroundViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[MKLookAroundViewController modalPresentationStyle](self, "modalPresentationStyle")
    && (-[MKLookAroundViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[MKLookAroundViewController _isFullScreenCover](self, "_isFullScreenCover"))
  {
    self->_presentationType = 1;
    -[UITapGestureRecognizer setEnabled:](self->_selectGestureRecognizer, "setEnabled:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundViewController;
  -[MKLookAroundViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MKLookAroundViewController _updateSceneIfNeeded](self, "_updateSceneIfNeeded");
  if (self->_presentationType == 1)
  {
    -[MKLookAroundViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
    -[MKLookAroundViewController _updateCloseButtonIfNeeded](self, "_updateCloseButtonIfNeeded");
    -[MKLookAroundViewController _updateGradientIfNeeded](self, "_updateGradientIfNeeded");
    -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
    -[MKLookAroundViewController _updateStackViewIfNeeded](self, "_updateStackViewIfNeeded");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundViewController;
  -[MKLookAroundViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[MKLookAroundView superview](self->_lookAroundView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    -[MKLookAroundViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[MKLookAroundView setFrame:](self->_lookAroundView, "setFrame:", v7, v9, v11, v13);
    -[MKLookAroundViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
    -[MKLookAroundViewController _updateCloseButtonIfNeeded](self, "_updateCloseButtonIfNeeded");
    -[MKLookAroundViewController _updateGradientIfNeeded](self, "_updateGradientIfNeeded");
    -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
    -[MKLookAroundViewController _updateStackViewIfNeeded](self, "_updateStackViewIfNeeded");
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundViewController;
  -[MKLookAroundViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MKLookAroundViewController _setupSubviews](self, "_setupSubviews");
  -[MKLookAroundViewController _setupConstraints](self, "_setupConstraints");
}

- (void)fullScreenViewControllerWillPresent:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[UITapGestureRecognizer setEnabled:](self->_selectGestureRecognizer, "setEnabled:", 0);
  -[MKLookAroundViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lookAroundViewControllerWillPresentFullScreen:", self);

  }
}

- (void)fullScreenViewControllerDidPresent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  self->_presentationType = 1;
  -[MKLookAroundViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded", a3);
  -[MKLookAroundViewController _updateCloseButtonIfNeeded](self, "_updateCloseButtonIfNeeded");
  -[MKLookAroundViewController _updateGradientIfNeeded](self, "_updateGradientIfNeeded");
  -[MKLookAroundViewController _updateLookAroundViewIfNeeded](self, "_updateLookAroundViewIfNeeded");
  -[MKLookAroundViewController _updateStackViewIfNeeded](self, "_updateStackViewIfNeeded");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MKLookAroundViewController_fullScreenViewControllerDidPresent___block_invoke;
  v7[3] = &unk_1E20D7D98;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v7, 0, 0.2);
  -[MKLookAroundViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookAroundViewControllerDidPresentFullScreen:", self);

  }
}

void __65__MKLookAroundViewController_fullScreenViewControllerDidPresent___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)fullScreenViewControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[MKLookAroundViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lookAroundViewControllerWillDismissFullScreen:", self);

  }
}

- (void)fullScreenViewControllerDidDismiss:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  self->_presentationType = 0;
  -[UITapGestureRecognizer setEnabled:](self->_selectGestureRecognizer, "setEnabled:", 1);
  -[MKLookAroundViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundViewController _contentView](self, "_contentView");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[MKLookAroundViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "needsUpdateConstraints");

  -[MKLookAroundViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__MKLookAroundViewController_fullScreenViewControllerDidDismiss___block_invoke;
  v10[3] = &unk_1E20D7D98;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v10, 0, 0.2);
  -[MKLookAroundViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lookAroundViewControllerDidDismissFullScreen:", self);

  }
}

void __65__MKLookAroundViewController_fullScreenViewControllerDidDismiss___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSDateFormatter *dateFormatter;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSDateFormatter *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIButton *attributionButton;
  void *v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_mapkit_locationTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_locationLabel, "setText:", v6);

  objc_msgSend(v5, "_mapkit_locationSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_localityLabel, "setText:", v7);

  objc_msgSend(v5, "collectionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    v10 = (void *)MEMORY[0x1E0CEA650];
    -[MKLookAroundViewController tertiaryLabelFont](self, "tertiaryLabelFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    objc_msgSend(v10, "configurationWithPointSize:weight:scale:", (uint64_t)*MEMORY[0x1E0CEB5F0], 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("applelogo"), v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v14);

    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendAttributedString:", v16);

    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    _MKLocalizedStringFromThisBundle(CFSTR("[Look Around] Apple Maps Logo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithString:", v18);
    objc_msgSend(v15, "appendAttributedString:", v19);

    dateFormatter = self->_dateFormatter;
    v21 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFormatFromTemplate:options:locale:", CFSTR("MMMMyyyy"), 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](dateFormatter, "setLocalizedDateFormatFromTemplate:", v23);

    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    v25 = self->_dateFormatter;
    objc_msgSend(v5, "collectionDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](v25, "stringFromDate:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v24, "initWithString:", v27);
    objc_msgSend(v15, "appendAttributedString:", v28);

    v47 = *MEMORY[0x1E0CEA098];
    v29 = v47;
    -[MKLookAroundViewController tertiaryLabelFont](self, "tertiaryLabelFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v30;
    v48 = *MEMORY[0x1E0CEA0A0];
    v31 = v48;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v47, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttributes:range:", v33, 0, objc_msgSend(v15, "length"));

    v34 = (void *)objc_msgSend(v15, "copy");
    -[UILabel setAttributedText:](self->_imageryCollectionDateLabel, "setAttributedText:", v34);

    v35 = objc_alloc(MEMORY[0x1E0CB3778]);
    _MKLocalizedStringFromThisBundle(CFSTR("Legal"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithString:", v36);

    v45[0] = v29;
    -[MKLookAroundViewController attributionButtonFont](self, "attributionButtonFont");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v38;
    v45[1] = v31;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v39;
    v45[2] = *MEMORY[0x1E0CEA180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAttributes:range:", v41, 0, objc_msgSend(v37, "length"));

    attributionButton = self->_attributionButton;
    v43 = (void *)objc_msgSend(v37, "copy");
    -[UIButton setAttributedTitle:forState:](attributionButton, "setAttributedTitle:forState:", v43, 0);

  }
}

- (void)lookAroundViewWillChangeRegion:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MKLookAroundViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookAroundViewControllerWillUpdateScene:", self);

  }
}

- (void)lookAroundViewDidChangeRegion:(id)a3
{
  id v4;
  void *v5;
  MKLookAroundScene *v6;
  void *v7;
  void *v8;
  void *v9;
  MKLookAroundScene *v10;
  MKLookAroundScene *scene;
  void *v12;
  MKLookAroundScene *v13;
  MKLookAroundScene *v14;
  MKLookAroundScene *v15;
  void *v16;
  char v17;
  void *v18;
  MKLookAroundScene *v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if (self->_initialScene)
  {
    self->_initialScene = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [MKLookAroundScene alloc];
    objc_msgSend(v20, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "muninViewState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraFrame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MKLookAroundScene initWithMapItem:cameraFrameOverride:](v6, "initWithMapItem:cameraFrameOverride:", v7, v9);
    scene = self->_scene;
    self->_scene = v10;

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v20, "revGeoMapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [MKLookAroundScene alloc];
    objc_msgSend(v20, "muninViewState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MKLookAroundScene initWithMuninViewState:](v13, "initWithMuninViewState:", v7);
    v15 = self->_scene;
    self->_scene = v14;

    goto LABEL_7;
  }
  v19 = self->_scene;
  self->_scene = 0;

LABEL_8:
  -[MKLookAroundViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[MKLookAroundViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lookAroundViewControllerDidUpdateScene:", self);

  }
}

- (BOOL)lookAroundView:(id)a3 shouldReceiveTouch:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a4, "locationInView:", a3);
  v6 = v5;
  v8 = v7;
  -[UIVisualEffectView frame](self->_closeButtonView, "frame");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v12, v10))
    return 0;
  -[MKLookAroundViewController attributionButtonFrame](self, "attributionButtonFrame");
  v11.x = v6;
  v11.y = v8;
  return !CGRectContainsPoint(v13, v11);
}

- (UIFont)buttonFont
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookAroundButtonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 <= 18.0)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v8;
}

- (UIFont)labelFont
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookAroundLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 <= 22.0)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSize:", 22.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v8;
}

- (NSAttributedString)badgeLabelGlyph
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  v4 = (void *)MEMORY[0x1E0CEA638];
  v5 = (void *)MEMORY[0x1E0CEA650];
  -[MKLookAroundViewController buttonFont](self, "buttonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithFont:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("binoculars.fill"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v10);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v11;
}

- (NSAttributedString)badgeLabelTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E20DFC00);
  -[MKLookAroundViewController badgeLabelGlyph](self, "badgeLabelGlyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendAttributedString:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v3, "appendAttributedString:", v5);

  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  _MKLocalizedStringFromThisBundle(CFSTR("[Look Around] Look Around Badge Text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  objc_msgSend(v3, "appendAttributedString:", v8);
  v9 = *MEMORY[0x1E0CEA098];
  -[MKLookAroundViewController buttonFont](self, "buttonFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v3, "length"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSAttributedString *)v11;
}

- (UIFont)secondaryLabelFont
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookAroundSecondaryLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 <= 15.0)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSize:", 15.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v8;
}

- (UIFont)tertiaryLabelFont
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookAroundTertiaryLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 <= 13.0)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSize:", 13.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v8;
}

- (UIFont)attributionButtonFont
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lookAroundAttributionButtonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 <= 9.0)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSize:", 9.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v7, 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIFont *)v8;
}

- (CGRect)attributionButtonFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bounds](self->_attributionButton, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", self->_attributionButton);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12.origin.x = v5;
  v12.origin.y = v7;
  v12.size.width = v9;
  v12.size.height = v11;
  return CGRectInset(v12, -9.0, -9.0);
}

- (void)applyShadowToView:(id)a3 withRadius:(double)a4 offset:(CGSize)a5 opacity:(float)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "CGColor");
  objc_msgSend(v10, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowColor:", v13);

  objc_msgSend(v10, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowRadius:", a4);

  objc_msgSend(v10, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowOffset:", width, height);

  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a6;
  objc_msgSend(v17, "setShadowOpacity:", v18);

  objc_msgSend(v10, "layer");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setShadowPathIsBounds:", 1);
}

- (void)_contentSizeDidChange
{
  -[MKLookAroundViewController _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
  -[MKLookAroundViewController _updateCloseButtonIfNeeded](self, "_updateCloseButtonIfNeeded");
  -[MKLookAroundViewController _updateStackViewIfNeeded](self, "_updateStackViewIfNeeded");
}

- (id)_contentView
{
  return self->_lookAroundView;
}

- (void)_didSelectView:(id)a3
{
  if (-[MKLookAroundViewController _isPresentingFullScreen](self, "_isPresentingFullScreen", a3))
    -[MKLookAroundViewController _transitionFromFullScreenAnimated:completionHandler:](self, "_transitionFromFullScreenAnimated:completionHandler:", 1, 0);
  else
    -[MKLookAroundViewController _transitionToFullScreenAnimated:completionHandler:](self, "_transitionToFullScreenAnimated:completionHandler:", 1, 0);
}

- (void)_didTapCloseButton:(id)a3
{
  -[MKLookAroundViewController _transitionFromFullScreenAnimated:completionHandler:](self, "_transitionFromFullScreenAnimated:completionHandler:", 1, 0);
}

- (void)_didTapAttributionButton:(id)a3
{
  void *v3;
  id v4;

  -[MKLookAroundViewController _urlForMapAttribution](self, "_urlForMapAttribution", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:completionHandler:", v4, 0);

  }
}

- (id)_fullScreenViewController
{
  MKLookAroundFullScreenViewController *fullScreenViewController;
  MKLookAroundFullScreenViewController *v4;
  void *v5;
  MKLookAroundFullScreenViewController *v6;

  fullScreenViewController = self->_fullScreenViewController;
  if (!fullScreenViewController)
  {
    v4 = objc_alloc_init(MKLookAroundFullScreenViewController);
    -[MKLookAroundFullScreenViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 0);
    -[MKLookAroundViewController _transitionController](self, "_transitionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundFullScreenViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v5);

    -[MKLookAroundFullScreenViewController setDelegate:](v4, "setDelegate:", self);
    v6 = self->_fullScreenViewController;
    self->_fullScreenViewController = v4;

    fullScreenViewController = self->_fullScreenViewController;
  }
  return fullScreenViewController;
}

- (id)_fullScreenViewControllerIfLoaded
{
  return self->_fullScreenViewController;
}

- (BOOL)_isDescendantOfRootViewController
{
  MKLookAroundViewController *v2;
  void *v3;
  MKLookAroundViewController *v4;
  MKLookAroundViewController *v5;
  void *v6;
  void *v7;
  MKLookAroundViewController *v8;
  void *v9;
  int v10;

  v2 = self;
  -[MKLookAroundViewController parentViewController](v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v2;
  if (v3)
  {
    v5 = v2;
    do
    {
      -[MKLookAroundViewController parentViewController](v5, "parentViewController");
      v4 = (MKLookAroundViewController *)objc_claimAutoreleasedReturnValue();

      -[MKLookAroundViewController parentViewController](v4, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v4;
    }
    while (v6);
  }
  -[MKLookAroundViewController presentingViewController](v4, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      -[MKLookAroundViewController presentingViewController](v4, "presentingViewController");
      v8 = (MKLookAroundViewController *)objc_claimAutoreleasedReturnValue();

      -[MKLookAroundViewController presentingViewController](v8, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v8;
    }
    while (v9);
    if (v8)
      goto LABEL_7;
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  v8 = v4;
  if (!v4)
    goto LABEL_9;
LABEL_7:
  v10 = -[MKLookAroundViewController isEqual:](v8, "isEqual:", v2) ^ 1;
LABEL_10:

  return v10;
}

- (BOOL)_isPresentedFullScreen
{
  void *v3;
  BOOL v4;

  -[MKLookAroundViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !v3
    && -[MKLookAroundViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController")
    && -[MKLookAroundViewController _modalPresentationStyleIsFullScreen](self, "_modalPresentationStyleIsFullScreen");

  return v4;
}

- (BOOL)_isPresentingFullScreen
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKLookAroundViewController _fullScreenViewControllerIfLoaded](self, "_fullScreenViewControllerIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isTransitioningToOrFromFullScreen
{
  char v3;
  void *v4;
  BOOL v5;
  void *v7;

  if ((-[MKLookAroundViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0)
    v3 = 1;
  else
    v3 = -[MKLookAroundViewController isBeingPresented](self, "isBeingPresented");
  -[MKLookAroundViewController _fullScreenViewControllerIfLoaded](self, "_fullScreenViewControllerIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBeingDismissed") & 1) != 0 || (objc_msgSend(v4, "isBeingPresented") & 1) != 0)
  {
    v5 = 1;
  }
  else if (v4)
  {
    objc_msgSend(v4, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v3 | v5;
}

- (BOOL)_modalPresentationStyleIsFullScreen
{
  return !-[MKLookAroundViewController modalPresentationStyle](self, "modalPresentationStyle")
      || -[MKLookAroundViewController modalPresentationStyle](self, "modalPresentationStyle") == 5;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *badgeViewVerticalConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *badgeViewHorizontalConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  NSLayoutConstraint *v21;
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
  void *v84;
  void *v85;
  void *v86;
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
  void *v97;
  void *v98;
  _QWORD v99[25];

  v99[23] = *MEMORY[0x1E0C80C00];
  -[UIVisualEffectView topAnchor](self->_badgeView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 14.0);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  badgeViewVerticalConstraint = self->_badgeViewVerticalConstraint;
  self->_badgeViewVerticalConstraint = v6;

  -[UIVisualEffectView leadingAnchor](self->_badgeView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11, 14.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  badgeViewHorizontalConstraint = self->_badgeViewHorizontalConstraint;
  self->_badgeViewHorizontalConstraint = v12;

  -[UIStackView trailingAnchor](self->_infoStackView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:constant:", v17, -16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = 1144750080;
  v20 = v18;
  v52 = v18;
  objc_msgSend(v18, "setPriority:", v19);
  v69 = (void *)MEMORY[0x1E0CB3718];
  -[_MKGradientView topAnchor](self->_gradientView, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v95;
  -[_MKGradientView bottomAnchor](self->_gradientView, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v91;
  -[_MKGradientView leadingAnchor](self->_gradientView, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v87;
  -[_MKGradientView trailingAnchor](self->_gradientView, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v83;
  -[UIVisualEffectView topAnchor](self->_closeButtonView, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "safeAreaLayoutGuide");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 12.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v78;
  -[UIVisualEffectView trailingAnchor](self->_closeButtonView, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "safeAreaLayoutGuide");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v74, -16.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v73;
  -[UIVisualEffectView heightAnchor](self->_closeButtonView, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", 44.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v99[6] = v71;
  -[UIVisualEffectView widthAnchor](self->_closeButtonView, "widthAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToConstant:", 44.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v99[7] = v68;
  -[UIButton topAnchor](self->_closeButton, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_closeButtonView, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v99[8] = v65;
  -[UIButton bottomAnchor](self->_closeButton, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_closeButtonView, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v99[9] = v62;
  -[UIButton leadingAnchor](self->_closeButton, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_closeButtonView, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v99[10] = v59;
  -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_closeButtonView, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_badgeViewVerticalConstraint;
  v99[11] = v55;
  v99[12] = v21;
  v99[13] = self->_badgeViewHorizontalConstraint;
  -[UILabel topAnchor](self->_badgeLabel, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_badgeView, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v54, 7.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v99[14] = v53;
  -[UILabel bottomAnchor](self->_badgeLabel, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_badgeView, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -7.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v99[15] = v49;
  -[UILabel leadingAnchor](self->_badgeLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_badgeView, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 10.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v99[16] = v46;
  -[UILabel trailingAnchor](self->_badgeLabel, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_badgeView, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -10.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v99[17] = v43;
  -[UIImageView bottomAnchor](self->_appleLogoImageView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -12.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v99[18] = v38;
  -[UIImageView leadingAnchor](self->_appleLogoImageView, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "safeAreaLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v34, 14.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v99[19] = v33;
  -[UIStackView bottomAnchor](self->_infoStackView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v24, -12.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v99[20] = v25;
  -[UIStackView leadingAnchor](self->_infoStackView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29, 16.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v99[21] = v30;
  v99[22] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v31);

}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  MKLookAroundView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MKLookAroundView *v10;
  MKLookAroundView *lookAroundView;
  void *v12;
  _MKGradientView *v13;
  _MKGradientView *gradientView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  UIVisualEffectView *v23;
  UIVisualEffectView *closeButtonView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  UIButton *v34;
  UIButton *closeButton;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  UIVisualEffectView *v40;
  UIVisualEffectView *badgeView;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  UILabel *v46;
  UILabel *badgeLabel;
  void *v48;
  double v49;
  void *v50;
  UIImageView *v51;
  UIImageView *appleLogoImageView;
  void *v53;
  UIStackView *v54;
  UIStackView *infoStackView;
  void *v56;
  UILabel *v57;
  UILabel *locationLabel;
  void *v59;
  double v60;
  UILabel *v61;
  UILabel *localityLabel;
  void *v63;
  double v64;
  UIStackView *v65;
  UIStackView *tertiaryLineStackView;
  UILabel *v67;
  UILabel *imageryCollectionDateLabel;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  UIButton *v74;
  UIButton *attributionButton;
  void *v76;
  UITapGestureRecognizer *v77;
  UITapGestureRecognizer *selectGestureRecognizer;
  void *v79;
  MKLookAroundView *v80;
  NSObject *v81;
  NSObject *didBecomeFullyDrawnObserver;
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  id location;
  _QWORD v88[5];

  v88[3] = *MEMORY[0x1E0C80C00];
  -[MKLookAroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_setBackgroundColor:", v4);

  v5 = [MKLookAroundView alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[MKLookAroundView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  lookAroundView = self->_lookAroundView;
  self->_lookAroundView = v10;

  -[MKLookAroundView setDelegate:](self->_lookAroundView, "setDelegate:", self);
  -[MKLookAroundViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_lookAroundView);

  v13 = -[_MKGradientView initWithFrame:]([_MKGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
  gradientView = self->_gradientView;
  self->_gradientView = v13;

  -[_MKGradientView setAccessibilityIdentifier:](self->_gradientView, "setAccessibilityIdentifier:", CFSTR("LookAroundGradientView"));
  -[_MKGradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKGradientView setStartPoint:](self->_gradientView, "setStartPoint:", 0.5, 0.0);
  -[_MKGradientView setEndPoint:](self->_gradientView, "setEndPoint:", 0.5, 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 0.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.68);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v88[0] = v84;
  v88[1] = v83;
  v88[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKGradientView setColors:](self->_gradientView, "setColors:", v19);

  -[_MKGradientView setLocations:](self->_gradientView, "setLocations:", &unk_1E2159F88);
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_mapkit_insertSubview:atIndex:", self->_gradientView, 0);

  v21 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (UIVisualEffectView *)objc_msgSend(v21, "initWithEffect:", v22);
  closeButtonView = self->_closeButtonView;
  self->_closeButtonView = v23;

  -[UIVisualEffectView setAccessibilityIdentifier:](self->_closeButtonView, "setAccessibilityIdentifier:", CFSTR("LookAroundCloseButtonView"));
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundColor:](self->_closeButtonView, "setBackgroundColor:", v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "colorWithAlphaComponent:", 0.24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_closeButtonView, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v27);

  -[UIVisualEffectView contentView](self->_closeButtonView, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0C9D820];
  v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  LODWORD(v32) = 1041865114;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", v29, 5.0, *MEMORY[0x1E0C9D820], v31, v32);

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", self->_closeButtonView);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v34 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v34;

  -[UIVisualEffectView setAccessibilityIdentifier:](self->_closeButtonView, "setAccessibilityIdentifier:", CFSTR("LookAroundCloseButton"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, sel__didTapCloseButton_, 64);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_closeButton, "setTintColor:", v36);

  -[UIVisualEffectView contentView](self->_closeButtonView, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", self->_closeButton);

  v38 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (UIVisualEffectView *)objc_msgSend(v38, "initWithEffect:", v39);
  badgeView = self->_badgeView;
  self->_badgeView = v40;

  -[UIVisualEffectView setAccessibilityIdentifier:](self->_badgeView, "setAccessibilityIdentifier:", CFSTR("LookAroundBadgeView"));
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundColor:](self->_badgeView, "setBackgroundColor:", v42);

  -[UIVisualEffectView _setContinuousCornerRadius:](self->_badgeView, "_setContinuousCornerRadius:", 6.0);
  -[UIVisualEffectView contentView](self->_badgeView, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = 1041865114;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", v43, 5.0, v30, v31, v44);

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", self->_badgeView);

  v46 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
  badgeLabel = self->_badgeLabel;
  self->_badgeLabel = v46;

  -[UIVisualEffectView setAccessibilityIdentifier:](self->_badgeView, "setAccessibilityIdentifier:", CFSTR("LookAroundBadgeLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v48);

  LODWORD(v49) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_badgeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v49);
  -[UILabel setNumberOfLines:](self->_badgeLabel, "setNumberOfLines:", 1);
  -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1);
  -[UIVisualEffectView contentView](self->_badgeView, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", self->_badgeLabel);

  v51 = -[MKAppleLogoImageView initForMapType:forDarkMode:]([MKAppleLogoImageView alloc], "initForMapType:forDarkMode:", 107, 1);
  appleLogoImageView = self->_appleLogoImageView;
  self->_appleLogoImageView = v51;

  -[UIImageView setAccessibilityIdentifier:](self->_appleLogoImageView, "setAccessibilityIdentifier:", CFSTR("LookAroundAppleLogo"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_appleLogoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSubview:", self->_appleLogoImageView);

  v54 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v6, v7, v8, v9);
  infoStackView = self->_infoStackView;
  self->_infoStackView = v54;

  -[UIStackView setAccessibilityIdentifier:](self->_infoStackView, "setAccessibilityIdentifier:", CFSTR("LookAroundInfoStackView"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_infoStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_infoStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_infoStackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_infoStackView, "setAlignment:", 1);
  -[UIStackView setSpacing:](self->_infoStackView, "setSpacing:", 6.0);
  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", self->_infoStackView);

  v57 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
  locationLabel = self->_locationLabel;
  self->_locationLabel = v57;

  -[UILabel setAccessibilityIdentifier:](self->_locationLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundLocationLabel"));
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_locationLabel, "setTextColor:", v59);

  -[UILabel setNumberOfLines:](self->_locationLabel, "setNumberOfLines:", 0);
  LODWORD(v60) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_locationLabel, 4.0, 0.0, 1.0, v60);
  -[UIStackView addArrangedSubview:](self->_infoStackView, "addArrangedSubview:", self->_locationLabel);
  v61 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
  localityLabel = self->_localityLabel;
  self->_localityLabel = v61;

  -[UILabel setAccessibilityIdentifier:](self->_localityLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundLocalityLabel"));
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_localityLabel, "setTextColor:", v63);

  -[UILabel setNumberOfLines:](self->_localityLabel, "setNumberOfLines:", 0);
  LODWORD(v64) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_localityLabel, 4.0, 0.0, 1.0, v64);
  -[UIStackView addArrangedSubview:](self->_infoStackView, "addArrangedSubview:", self->_localityLabel);
  v65 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v6, v7, v8, v9);
  tertiaryLineStackView = self->_tertiaryLineStackView;
  self->_tertiaryLineStackView = v65;

  -[UIStackView setAccessibilityIdentifier:](self->_tertiaryLineStackView, "setAccessibilityIdentifier:", CFSTR("LookAroundTertiaryLineStackView"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_tertiaryLineStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_tertiaryLineStackView, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_tertiaryLineStackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_tertiaryLineStackView, "setAlignment:", 5);
  -[UIStackView setSpacing:](self->_tertiaryLineStackView, "setSpacing:", 0.0);
  -[UIStackView addArrangedSubview:](self->_infoStackView, "addArrangedSubview:", self->_tertiaryLineStackView);
  v67 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
  imageryCollectionDateLabel = self->_imageryCollectionDateLabel;
  self->_imageryCollectionDateLabel = v67;

  -[UILabel setAccessibilityIdentifier:](self->_imageryCollectionDateLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundImageryDateLabel"));
  -[UILabel setNumberOfLines:](self->_imageryCollectionDateLabel, "setNumberOfLines:", 0);
  LODWORD(v69) = 1034147594;
  -[MKLookAroundViewController applyShadowToView:withRadius:offset:opacity:](self, "applyShadowToView:withRadius:offset:opacity:", self->_imageryCollectionDateLabel, 4.0, 0.0, 1.0, v69);
  -[UIStackView addArrangedSubview:](self->_tertiaryLineStackView, "addArrangedSubview:", self->_imageryCollectionDateLabel);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
  objc_msgSend(v70, "widthAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", 9.22337204e18);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v73) = 1132068864;
  objc_msgSend(v72, "setPriority:", v73);
  objc_msgSend(v72, "setActive:", 1);
  -[UIStackView addArrangedSubview:](self->_tertiaryLineStackView, "addArrangedSubview:", v70);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v74 = (UIButton *)objc_claimAutoreleasedReturnValue();
  attributionButton = self->_attributionButton;
  self->_attributionButton = v74;

  -[UIButton setAccessibilityIdentifier:](self->_attributionButton, "setAccessibilityIdentifier:", CFSTR("LookAroundAttributionButton"));
  -[UIButton _setTouchInsets:](self->_attributionButton, "_setTouchInsets:", -9.0, -9.0, -9.0, -9.0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_attributionButton, "addTarget:action:forControlEvents:", self, sel__didTapAttributionButton_, 64);
  -[UIStackView addArrangedSubview:](self->_tertiaryLineStackView, "addArrangedSubview:", self->_attributionButton);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

  v77 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__didSelectView_);
  selectGestureRecognizer = self->_selectGestureRecognizer;
  self->_selectGestureRecognizer = v77;

  -[MKLookAroundView addGestureRecognizer:](self->_lookAroundView, "addGestureRecognizer:", self->_selectGestureRecognizer);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = self->_lookAroundView;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __44__MKLookAroundViewController__setupSubviews__block_invoke;
  v85[3] = &unk_1E20DB378;
  objc_copyWeak(&v86, &location);
  objc_msgSend(v79, "addObserverForName:object:queue:usingBlock:", CFSTR("MKLookAroundViewDidBecomeFullyDrawn"), v80, 0, v85);
  v81 = objc_claimAutoreleasedReturnValue();
  didBecomeFullyDrawnObserver = self->_didBecomeFullyDrawnObserver;
  self->_didBecomeFullyDrawnObserver = v81;

  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

}

void __44__MKLookAroundViewController__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __44__MKLookAroundViewController__setupSubviews__block_invoke_2;
  v13 = &unk_1E20D8A58;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  v6 = v4;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = v11;
  if ((objc_msgSend(v7, "isMainThread") & 1) != 0)
  {
    v12((uint64_t)v8);
  }
  else
  {
    v9 = (_QWORD *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    v8 = v9;
  }

  v10 = (void *)MEMORY[0x1E0C80D38];
  objc_destroyWeak(&v14);

}

void __44__MKLookAroundViewController__setupSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setDidBecomeFullyDrawn:", 1);
    WeakRetained = v2;
  }

}

- (BOOL)_shouldRestrictLookAroundViewOptionsForPreview
{
  return self->_presentationType == 0;
}

- (id)_transitionController
{
  MKLookAroundTransitionController *transitionController;
  MKLookAroundTransitionController *v4;
  MKLookAroundTransitionController *v5;

  transitionController = self->_transitionController;
  if (!transitionController)
  {
    v4 = objc_alloc_init(MKLookAroundTransitionController);
    v5 = self->_transitionController;
    self->_transitionController = v4;

    transitionController = self->_transitionController;
  }
  return transitionController;
}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MKLookAroundViewController *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  MKLookAroundViewController *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[MKLookAroundViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController"))
  {
    MKGetMKLookAroundLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "*** Warning: %@ is trying to exit full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior.", buf, 0xCu);
    }

  }
  if ((-[MKLookAroundViewController _isPresentingFullScreen](self, "_isPresentingFullScreen")
     || -[MKLookAroundViewController _isPresentedFullScreen](self, "_isPresentedFullScreen"))
    && !-[MKLookAroundViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    -[MKLookAroundViewController _fullScreenViewControllerIfLoaded](self, "_fullScreenViewControllerIfLoaded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[MKLookAroundViewController _fullScreenViewControllerIfLoaded](self, "_fullScreenViewControllerIfLoaded");
      v15 = (MKLookAroundViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = self;
    }
    v10 = v15;

    -[MKLookAroundViewController _transitionController](self, "_transitionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke;
    v23[3] = &unk_1E20DAB20;
    v23[4] = self;
    v24 = v6;
    objc_msgSend(v20, "beginFullScreenDismissalOfViewController:animated:completion:", v10, v4, v23);

    goto LABEL_19;
  }
  -[MKLookAroundViewController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && !-[MKLookAroundViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    -[MKLookAroundViewController presentingViewController](self, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isBeingDismissed");

    if ((v18 & 1) == 0)
    {
      -[MKLookAroundViewController presentingViewController](self, "presentingViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke_2;
      v21[3] = &unk_1E20D7EF8;
      v22 = v6;
      objc_msgSend(v19, "dismissViewControllerAnimated:completion:", v4, v21);

      v10 = v22;
      goto LABEL_19;
    }
  }
  else
  {

  }
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid method call"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MKErrorDomain"), 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);

LABEL_19:
  }

}

void __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, a2, 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 968);
  *(_QWORD *)(v4 + 968) = 0;

}

uint64_t __82__MKLookAroundViewController__transitionFromFullScreenAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_transitionToFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKLookAroundView *lookAroundView;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  MKLookAroundViewController *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[MKLookAroundViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController"))
  {
    MKGetMKLookAroundLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "*** Warning: %@ is trying to enter full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior.", buf, 0xCu);
    }

  }
  if (!-[MKLookAroundViewController _isPresentingFullScreen](self, "_isPresentingFullScreen")
    && !-[MKLookAroundViewController _isPresentedFullScreen](self, "_isPresentedFullScreen")
    && !-[MKLookAroundViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    -[MKLookAroundViewController _fullScreenViewController](self, "_fullScreenViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundViewController _transitionController](self, "_transitionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    lookAroundView = self->_lookAroundView;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__MKLookAroundViewController__transitionToFullScreenAnimated_completionHandler___block_invoke;
    v14[3] = &unk_1E20D8688;
    v15 = v6;
    objc_msgSend(v12, "beginFullScreenPresentationOfViewController:fromView:animated:completion:", v9, lookAroundView, v4, v14);

    v10 = v15;
    goto LABEL_10;
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid method call"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("MKErrorDomain"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

LABEL_10:
  }

}

uint64_t __80__MKLookAroundViewController__transitionToFullScreenAnimated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)_updateCloseButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t presentationType;
  uint64_t v9;
  double v10;
  id v11;
  CGRect v12;

  v3 = (void *)MEMORY[0x1E0CEA650];
  -[MKLookAroundViewController buttonFont](self, "buttonFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithFont:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setImage:forState:](self->_closeButton, "setImage:forState:", v7, 0);
  -[UIVisualEffectView bounds](self->_closeButtonView, "bounds");
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_closeButtonView, "_setContinuousCornerRadius:", CGRectGetHeight(v12) * 0.5);
  presentationType = self->_presentationType;
  if (!presentationType)
  {
    v9 = 1;
    v10 = 0.0;
    goto LABEL_5;
  }
  if (presentationType == 1)
  {
    v9 = 0;
    v10 = 1.0;
LABEL_5:
    -[UIVisualEffectView setAlpha:](self->_closeButtonView, "setAlpha:", v10);
    -[UIVisualEffectView setHidden:](self->_closeButtonView, "setHidden:", v9);
  }

}

- (void)_updateGradientIfNeeded
{
  unint64_t presentationType;
  void *v3;

  presentationType = self->_presentationType;
  if (presentationType)
  {
    if (presentationType != 1)
      return;
    v3 = &unk_1E2159FB8;
  }
  else
  {
    v3 = &unk_1E2159FA0;
  }
  -[_MKGradientView setLocations:](self->_gradientView, "setLocations:", v3);
}

- (void)_updateBadgeViewIfNeeded
{
  unint64_t v3;
  void *v4;
  NSLayoutConstraint *badgeViewVerticalConstraint;
  unint64_t v6;
  void *v7;
  int64_t badgePosition;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *badgeViewHorizontalConstraint;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *v38;
  void *v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *v43;
  void *v44;
  NSLayoutConstraint *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  uint64_t v54;
  unint64_t presentationType;
  uint64_t v56;
  double v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  v4 = (void *)MEMORY[0x1E0CB3718];
  badgeViewVerticalConstraint = self->_badgeViewVerticalConstraint;
  v59[0] = self->_badgeViewHorizontalConstraint;
  v59[1] = badgeViewVerticalConstraint;
  v6 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v7);

  badgePosition = self->_badgePosition;
  if (badgePosition == 2)
  {
    -[UIVisualEffectView bottomAnchor](self->_badgeView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v24, -12.0);
    v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v26 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v25;

    v3 = 0x1E0CB3000;
    -[UIVisualEffectView trailingAnchor](self->_badgeView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0x1E0C99000;
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safeAreaLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v30, -10.0);
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    badgeViewHorizontalConstraint = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v31;

    -[UIImageView image](self->_appleLogoImageView, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v9 = v33 + 8.0;
  }
  else if (badgePosition == 1)
  {
    -[UIVisualEffectView topAnchor](self->_badgeView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 14.0);
    v37 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v38 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v37;

    -[UIVisualEffectView trailingAnchor](self->_badgeView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "safeAreaLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v41, -14.0);
    v42 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v43 = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v42;

    v9 = 0.0;
  }
  else
  {
    v9 = 0.0;
    if (badgePosition)
      goto LABEL_8;
    -[UIVisualEffectView topAnchor](self->_badgeView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 14.0);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v14 = self->_badgeViewVerticalConstraint;
    self->_badgeViewVerticalConstraint = v13;

    -[UIVisualEffectView leadingAnchor](self->_badgeView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18, 14.0);
    v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v20 = self->_badgeViewHorizontalConstraint;
    self->_badgeViewHorizontalConstraint = v19;

  }
LABEL_8:
  v44 = *(void **)(v3 + 1816);
  v45 = self->_badgeViewVerticalConstraint;
  v58[0] = self->_badgeViewHorizontalConstraint;
  v58[1] = v45;
  objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", v58, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v46);

  -[MKLookAroundView overlayView](self->_lookAroundView, "overlayView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v49 = v48;

  v50 = 0.0;
  if (v49 + -28.0 > v9)
    v50 = v9;
  v51 = v49 + -28.0 - v50;
  -[MKLookAroundViewController badgeLabelTitle](self, "badgeLabelTitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "size");
  if (v53 + 14.0 > v51)
  {
    -[MKLookAroundViewController badgeLabelGlyph](self, "badgeLabelGlyph");
    v54 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v54;
  }
  -[UILabel setAttributedText:](self->_badgeLabel, "setAttributedText:", v52);
  presentationType = self->_presentationType;
  if (!presentationType)
  {
    v56 = 0;
    v57 = 1.0;
    goto LABEL_16;
  }
  if (presentationType == 1)
  {
    v56 = 1;
    v57 = 0.0;
LABEL_16:
    -[UIVisualEffectView setAlpha:](self->_badgeView, "setAlpha:", v57);
    -[UIVisualEffectView setHidden:](self->_badgeView, "setHidden:", v56);
  }

}

- (void)_updateLookAroundViewIfNeeded
{
  _BOOL8 v3;
  _BOOL4 IsMacCatalyst;
  uint64_t v5;
  CGFloat Height;
  void *v7;
  _BOOL8 showsRoadLabels;
  CGRect v9;

  if (self->_needsLookAroundViewUpdate && self->_lookAroundView)
  {
    v3 = -[MKLookAroundViewController _shouldRestrictLookAroundViewOptionsForPreview](self, "_shouldRestrictLookAroundViewOptionsForPreview");
    -[MKLookAroundView setCompassHidden:](self->_lookAroundView, "setCompassHidden:", v3);
    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    v5 = 17;
    if (IsMacCatalyst)
      v5 = 16;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKLookAroundViewController__initialScene[v5]), "bounds");
    Height = CGRectGetHeight(v9);
    -[MKLookAroundView setCompassInsets:](self->_lookAroundView, "setCompassInsets:", Height + 24.0, 16.0, Height + 24.0, 16.0);
    if (v3)
    {
      -[MKLookAroundView setNavigatingEnabled:](self->_lookAroundView, "setNavigatingEnabled:", 0);
      -[MKLookAroundView setPanningEnabled:](self->_lookAroundView, "setPanningEnabled:", 0);
      -[MKLookAroundView setZoomingEnabled:](self->_lookAroundView, "setZoomingEnabled:", 0);
      +[MKPointOfInterestFilter filterExcludingAllCategories](MKPointOfInterestFilter, "filterExcludingAllCategories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLookAroundView setPointOfInterestFilter:](self->_lookAroundView, "setPointOfInterestFilter:", v7);

      showsRoadLabels = 0;
    }
    else
    {
      -[MKLookAroundView setNavigatingEnabled:](self->_lookAroundView, "setNavigatingEnabled:", self->_navigationEnabled);
      -[MKLookAroundView setPanningEnabled:](self->_lookAroundView, "setPanningEnabled:", 1);
      -[MKLookAroundView setZoomingEnabled:](self->_lookAroundView, "setZoomingEnabled:", 1);
      -[MKLookAroundView setPointOfInterestFilter:](self->_lookAroundView, "setPointOfInterestFilter:", self->_pointOfInterestFilter);
      showsRoadLabels = self->_showsRoadLabels;
    }
    -[MKLookAroundView setShowsRoadLabels:](self->_lookAroundView, "setShowsRoadLabels:", showsRoadLabels);
  }
}

- (void)_updateSceneIfNeeded
{
  MKLookAroundView *lookAroundView;
  unint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  if (self->_needsSceneUpdate)
  {
    lookAroundView = self->_lookAroundView;
    if (lookAroundView)
    {
      if (self->_scene)
      {
        -[MKLookAroundViewController setDidBecomeFullyDrawn:](self, "setDidBecomeFullyDrawn:", 0);
        v4 = -[MKLookAroundScene _type](self->_scene, "_type");
        if (v4)
        {
          if (v4 != 1)
          {
            lookAroundView = self->_lookAroundView;
            goto LABEL_11;
          }
          -[MKLookAroundScene _muninViewState](self->_scene, "_muninViewState");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKLookAroundEntryPoint entryPointWithMuninViewState:](MKLookAroundEntryPoint, "entryPointWithMuninViewState:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[MKLookAroundScene _mapItem](self->_scene, "_mapItem");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = -[MKLookAroundScene _wantsCloseUpView](self->_scene, "_wantsCloseUpView");
          -[MKLookAroundScene _cameraFrameOverride](self->_scene, "_cameraFrameOverride");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:cameraFrameOverride:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:cameraFrameOverride:", v5, v7, v8);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        lookAroundView = self->_lookAroundView;
        if (v6)
        {
          -[MKLookAroundView enterLookAroundWithEntryPoint:](lookAroundView, "enterLookAroundWithEntryPoint:", v6);

LABEL_12:
          self->_needsSceneUpdate = 0;
          return;
        }
      }
LABEL_11:
      -[MKLookAroundView reset](lookAroundView, "reset");
      goto LABEL_12;
    }
  }
}

- (void)_updateStackViewIfNeeded
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
  UIButton *attributionButton;
  void *v13;
  unint64_t presentationType;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  id v19;

  -[MKLookAroundViewController labelFont](self, "labelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_locationLabel, "setFont:", v3);

  -[MKLookAroundViewController secondaryLabelFont](self, "secondaryLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_localityLabel, "setFont:", v4);

  -[UILabel attributedText](self->_imageryCollectionDateLabel, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = *MEMORY[0x1E0CEA098];
  -[MKLookAroundViewController tertiaryLabelFont](self, "tertiaryLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v19, "length"));

  v8 = (void *)objc_msgSend(v19, "copy");
  -[UILabel setAttributedText:](self->_imageryCollectionDateLabel, "setAttributedText:", v8);

  -[UIButton attributedTitleForState:](self->_attributionButton, "attributedTitleForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[MKLookAroundViewController attributionButtonFont](self, "attributionButtonFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttribute:value:range:", v6, v11, 0, objc_msgSend(v10, "length"));

  attributionButton = self->_attributionButton;
  v13 = (void *)objc_msgSend(v10, "copy");
  -[UIButton setAttributedTitle:forState:](attributionButton, "setAttributedTitle:forState:", v13, 0);

  presentationType = self->_presentationType;
  if (!presentationType)
  {
    v17 = 0;
    v15 = 1;
    v16 = 0.0;
    v18 = 1.0;
    goto LABEL_5;
  }
  if (presentationType == 1)
  {
    v15 = 0;
    v16 = 1.0;
    v17 = 1;
    v18 = 0.0;
LABEL_5:
    -[UIImageView setAlpha:](self->_appleLogoImageView, "setAlpha:", v18);
    -[UIImageView setHidden:](self->_appleLogoImageView, "setHidden:", v17);
    -[UIStackView setAlpha:](self->_infoStackView, "setAlpha:", v16);
    -[UIStackView setHidden:](self->_infoStackView, "setHidden:", v15);
  }

}

- (id)_urlForMapAttribution
{
  void *v2;
  void *v3;
  void *v4;

  -[MKLookAroundView lookAroundView](self->_lookAroundView, "lookAroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionsForCurrentRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKMapAttribution attributionUrlFromRegionalAttributions:](MKMapAttribution, "attributionUrlFromRegionalAttributions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (MKLookAroundScene)scene
{
  return self->_scene;
}

- (BOOL)isNavigationEnabled
{
  return self->_navigationEnabled;
}

- (BOOL)showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (MKLookAroundBadgePosition)badgePosition
{
  return self->_badgePosition;
}

- (BOOL)didBecomeFullyDrawn
{
  return self->_didBecomeFullyDrawn;
}

- (void)setDidBecomeFullyDrawn:(BOOL)a3
{
  self->_didBecomeFullyDrawn = a3;
}

- (BOOL)_isFullScreenCover
{
  return self->_fullScreenCover;
}

- (void)_setFullScreenCover:(BOOL)a3
{
  self->_fullScreenCover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_didBecomeFullyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_attributionButton, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_imageryCollectionDateLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLineStackView, 0);
  objc_storeStrong((id *)&self->_localityLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_infoStackView, 0);
  objc_storeStrong((id *)&self->_appleLogoImageView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeViewHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_badgeViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_fullScreenViewController, 0);
}

@end
