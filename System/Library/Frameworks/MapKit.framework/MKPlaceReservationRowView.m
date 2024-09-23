@implementation MKPlaceReservationRowView

- (MKPlaceReservationRowView)initWithReservationInfo:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MKPlaceReservationRowView *v10;
  MKPlaceReservationRowView *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UISegmentedControl *openTimesControl;
  UISegmentedControl *v17;
  void *v18;
  uint64_t v19;
  UIButton *buttonMakeReservation;
  uint64_t v21;
  UIButton *buttonAttribution;
  void *v23;
  MKPlaceReservationRowView *v24;
  objc_super v26;

  v5 = a3;
  if (v5)
  {
    v26.receiver = self;
    v26.super_class = (Class)MKPlaceReservationRowView;
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[MKPlaceSectionItemView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
    v11 = v10;
    if (v10)
    {
      -[MKPlaceReservationRowView setPreservesSuperviewLayoutMargins:](v10, "setPreservesSuperviewLayoutMargins:", 1);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA990]), "initWithFrame:", v6, v7, v8, v9);
      v13 = *(void **)&v11->super._selected;
      *(_QWORD *)&v11->super._selected = v12;

      objc_msgSend(*(id *)&v11->super._selected, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKPlaceReservationRowView addSubview:](v11, "addSubview:", *(_QWORD *)&v11->super._selected);
      _MKLocalizedStringFromThisBundle(CFSTR("PLACEVIEW_RESERVATION_BUTTON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MKPlaceReservationRowView _newButtonForAttribution:](v11, "_newButtonForAttribution:", 0);
      openTimesControl = v11->_openTimesControl;
      v11->_openTimesControl = (UISegmentedControl *)v15;

      v17 = v11->_openTimesControl;
      -[MKPlaceReservationRowView _attributedStringFromButtonTitle:useSmallFont:](v11, "_attributedStringFromButtonTitle:useSmallFont:", v14, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl _mapkit_setAttributedTitle:](v17, "_mapkit_setAttributedTitle:", v18);

      -[UISegmentedControl _mapkit_setTarget:action:](v11->_openTimesControl, "_mapkit_setTarget:action:", v11, sel__actionMakeReservation);
      -[MKPlaceReservationRowView addSubview:](v11, "addSubview:", v11->_openTimesControl);
      v19 = -[MKPlaceReservationRowView _newButtonForAttribution:](v11, "_newButtonForAttribution:", 1);
      buttonMakeReservation = v11->_buttonMakeReservation;
      v11->_buttonMakeReservation = (UIButton *)v19;

      -[UIButton _mapkit_setTarget:action:](v11->_buttonMakeReservation, "_mapkit_setTarget:action:", v11, sel__actionMakeReservation);
      -[MKPlaceReservationRowView addSubview:](v11, "addSubview:", v11->_buttonMakeReservation);
      -[MKPlaceReservationRowView _updateTintColor](v11, "_updateTintColor");
      -[MKPlaceReservationRowView _setupImmutableConstraints](v11, "_setupImmutableConstraints");
      v21 = objc_opt_new();
      buttonAttribution = v11->_buttonAttribution;
      v11->_buttonAttribution = (UIButton *)v21;

      objc_storeStrong((id *)&v11->_constraintButtonBottomMargin, a3);
      -[MKPlaceReservationRowView _updateWithReservationInfo](v11, "_updateWithReservationInfo");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", v11, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

    }
    self = v11;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)selectedTimeIndex
{
  if (objc_msgSend(*(id *)&self->super._selected, "_mapkit_numberOfSegments"))
    return objc_msgSend(*(id *)&self->super._selected, "_mapkit_selectedSegmentIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setSelectedTimeIndex:(unint64_t)a3
{
  objc_msgSend(*(id *)&self->super._selected, "_mapkit_setSelectedSegmentIndex:", a3);
}

- (NSString)selectedTimeString
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[MKPlaceReservationRowView selectedTimeIndex](self, "selectedTimeIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    -[MKPlaceReservationRowView reservationInfo](self, "reservationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openTimes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (void)setSelectedTimeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[MKPlaceReservationRowView reservationInfo](self, "reservationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  -[MKPlaceReservationRowView setSelectedTimeIndex:](self, "setSelectedTimeIndex:", v7);
}

- (id)_newButtonForAttribution:(BOOL)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA3A0]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (void)_actionMakeReservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MKPlaceReservationRowView reservationInfo](self, "reservationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reservationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKPlaceReservationRowView reservationInfo](self, "reservationInfo");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reservationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceReservationRowView reservationInfo](self, "reservationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reservationInfo:makeReservationForSelectedTimeAtIndex:", v6, -[MKPlaceReservationRowView selectedTimeIndex](self, "selectedTimeIndex"));

  }
}

- (id)_buttonFontLarge
{
  void *v2;
  void *v3;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boldBodyFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_buttonFontSmall
{
  void *v2;
  void *v3;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smallAttributionFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_buttonTopMargin
{
  void *v2;
  double v3;
  double v4;

  -[MKPlaceReservationRowView _buttonFontLarge](self, "_buttonFontLarge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 27.0);
  v4 = v3;

  return v4;
}

- (double)_buttonBottomMargin
{
  void *v2;
  double v3;
  double v4;

  -[MKPlaceReservationRowView _buttonFontLarge](self, "_buttonFontLarge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 18.0);
  v4 = v3;

  return v4;
}

- (id)_attributedStringFromButtonTitle:(id)a3 useSmallFont:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    if (a4)
      -[MKPlaceReservationRowView _buttonFontSmall](self, "_buttonFontSmall");
    else
      -[MKPlaceReservationRowView _buttonFontLarge](self, "_buttonFontLarge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mk_theme](self, "mk_theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CEA098]);
    if (v11)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CEA0A0]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateWithReservationInfo
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)&self->super._selected, "_mapkit_removeAllSegments");
  -[NSLayoutConstraint openTimes](self->_constraintButtonBottomMargin, "openTimes");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v3 = 0;
    do
    {
      v4 = *(void **)&self->super._selected;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_mapkit_setTitle:forSegmentAtIndex:insertIfNeeded:", v5, v3, 1);

      ++v3;
    }
    while (v3 < objc_msgSend(v12, "count"));
  }
  objc_msgSend(*(id *)&self->super._selected, "setHidden:", objc_msgSend(v12, "count") == 0);
  if (objc_msgSend(v12, "count"))
    -[MKPlaceReservationRowView setSelectedTimeIndex:](self, "setSelectedTimeIndex:", (unint64_t)objc_msgSend(v12, "count") > 1);
  -[NSLayoutConstraint attributionProviderDisplayName](self->_constraintButtonBottomMargin, "attributionProviderDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView _attributedStringFromButtonTitle:useSmallFont:](self, "_attributedStringFromButtonTitle:useSmallFont:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLayoutConstraint attributionProviderLogoImage](self->_constraintButtonBottomMargin, "attributionProviderLogoImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView mk_theme](self, "mk_theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_flatImageWithColor:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  -[UIButton _mapkit_setAttributedTitle:](self->_buttonMakeReservation, "_mapkit_setAttributedTitle:", v7);
  -[UIButton _mapkit_setImage:](self->_buttonMakeReservation, "_mapkit_setImage:", v11);
  -[UIButton setHidden:](self->_buttonMakeReservation, "setHidden:", (objc_msgSend(v6, "length") | v11) == 0);
  -[MKPlaceReservationRowView _updateMutableConstraints](self, "_updateMutableConstraints");

}

- (void)_setupImmutableConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *constraintButtonTopMargin;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  _NSDictionaryOfVariableBindings(CFSTR("_buttonMakeReservation, _openTimesControl, _buttonAttribution"), self->_openTimesControl, *(_QWORD *)&self->super._selected, self->_buttonMakeReservation, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(&unk_1E215A108, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(&unk_1E215A108);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 0, 0, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

      }
      v6 = objc_msgSend(&unk_1E215A108, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }
  objc_msgSend(*(id *)&self->super._selected, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  objc_msgSend(*(id *)&self->super._selected, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  -[UISegmentedControl leadingAnchor](self->_openTimesControl, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[UIButton trailingAnchor](self->_buttonMakeReservation, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView layoutMarginsGuide](self, "layoutMarginsGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  -[UIButton lastBaselineAnchor](self->_buttonMakeReservation, "lastBaselineAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl lastBaselineAnchor](self->_openTimesControl, "lastBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  -[MKPlaceReservationRowView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl lastBaselineAnchor](self->_openTimesControl, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView _buttonBottomMargin](self, "_buttonBottomMargin");
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  constraintButtonTopMargin = self->_constraintButtonTopMargin;
  self->_constraintButtonTopMargin = v31;

  objc_msgSend(v3, "addObject:", self->_constraintButtonTopMargin);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);

}

- (void)_updateMutableConstraints
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  UIButton *buttonAttribution;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *mutableConstraints;

  if (-[UIButton count](self->_buttonAttribution, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_buttonAttribution);
    -[UIButton removeAllObjects](self->_buttonAttribution, "removeAllObjects");
  }
  if (objc_msgSend(*(id *)&self->super._selected, "isHidden"))
  {
    -[UISegmentedControl firstBaselineAnchor](self->_openTimesControl, "firstBaselineAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceReservationRowView topAnchor](self, "topAnchor");
  }
  else
  {
    buttonAttribution = self->_buttonAttribution;
    v7 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_openTimesControl,_buttonMakeReservation"), *(id *)&self->super._selected, self->_openTimesControl, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_openTimesControl]-(>=0)-[_buttonMakeReservation]"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addObjectsFromArray:](buttonAttribution, "addObjectsFromArray:", v9);

    v10 = self->_buttonAttribution;
    objc_msgSend(*(id *)&self->super._selected, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceReservationRowView topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 12.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addObject:](v10, "addObject:", v13);

    -[UISegmentedControl firstBaselineAnchor](self->_openTimesControl, "firstBaselineAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&self->super._selected, "bottomAnchor");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView _buttonTopMargin](self, "_buttonTopMargin");
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mutableConstraints = self->_mutableConstraints;
  self->_mutableConstraints = v5;

  -[UIButton addObject:](self->_buttonAttribution, "addObject:", self->_mutableConstraints);
  if (-[UIButton count](self->_buttonAttribution, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_buttonAttribution);
  -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
}

- (void)_updateButtonTitleAttributes
{
  UISegmentedControl *openTimesControl;
  void *v4;
  void *v5;
  UIButton *buttonMakeReservation;
  void *v7;
  id v8;

  openTimesControl = self->_openTimesControl;
  -[UISegmentedControl _mapkit_title](openTimesControl, "_mapkit_title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView _attributedStringFromButtonTitle:useSmallFont:](self, "_attributedStringFromButtonTitle:useSmallFont:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl _mapkit_setAttributedTitle:](openTimesControl, "_mapkit_setAttributedTitle:", v5);

  buttonMakeReservation = self->_buttonMakeReservation;
  -[UIButton _mapkit_title](buttonMakeReservation, "_mapkit_title");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceReservationRowView _attributedStringFromButtonTitle:useSmallFont:](self, "_attributedStringFromButtonTitle:useSmallFont:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _mapkit_setAttributedTitle:](buttonMakeReservation, "_mapkit_setAttributedTitle:", v7);

}

- (void)_updateTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)&self->super._selected, "setTintColor:", v4);
    v5 = *(void **)&self->super._selected;
    v7 = *MEMORY[0x1E0CEA0A0];
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleTextAttributes:forState:", v6, 0);

    -[MKPlaceReservationRowView _updateButtonTitleAttributes](self, "_updateButtonTitleAttributes");
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceReservationRowView;
  -[MKPlaceReservationRowView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[MKPlaceReservationRowView _updateTintColor](self, "_updateTintColor");
}

- (void)_contentSizeDidChange
{
  -[MKPlaceReservationRowView _updateButtonTitleAttributes](self, "_updateButtonTitleAttributes");
  -[MKPlaceReservationRowView _buttonTopMargin](self, "_buttonTopMargin");
  -[NSMutableArray setConstant:](self->_mutableConstraints, "setConstant:");
  -[MKPlaceReservationRowView _buttonBottomMargin](self, "_buttonBottomMargin");
  -[NSLayoutConstraint setConstant:](self->_constraintButtonTopMargin, "setConstant:");
}

- (_MKPlaceReservationInfo)reservationInfo
{
  return (_MKPlaceReservationInfo *)self->_constraintButtonBottomMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintButtonBottomMargin, 0);
  objc_storeStrong((id *)&self->_constraintButtonTopMargin, 0);
  objc_storeStrong((id *)&self->_mutableConstraints, 0);
  objc_storeStrong((id *)&self->_buttonAttribution, 0);
  objc_storeStrong((id *)&self->_buttonMakeReservation, 0);
  objc_storeStrong((id *)&self->_openTimesControl, 0);
  objc_storeStrong((id *)&self->super._selected, 0);
}

@end
