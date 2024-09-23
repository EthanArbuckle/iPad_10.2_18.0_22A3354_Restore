@implementation MKPlaceHeaderButtonsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKPlaceHeaderButtonsViewController)init
{
  MKPlaceHeaderButtonsViewController *v2;
  MKPlaceHeaderButtonsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlaceHeaderButtonsViewController;
  v2 = -[MKPlaceHeaderButtonsViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKPlaceHeaderButtonsViewController _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  MKPlaceSectionRowView *v6;
  MKPlaceSectionRowView *buttonsContainerView;
  void *v8;
  void *v9;
  _MKPlaceActionControlledButton *v10;
  _MKPlaceActionControlledButton *secondaryButton;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceHeaderButtonsViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)MKPlaceHeaderButtonsViewController;
  -[MKPlaceHeaderButtonsViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsBottomHairline:", 0);

  v6 = objc_alloc_init(MKPlaceSectionRowView);
  buttonsContainerView = self->_buttonsContainerView;
  self->_buttonsContainerView = v6;

  -[MKPlaceSectionRowView setPreservesSuperviewLayoutMargins:](self->_buttonsContainerView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKViewWithHairline setTopHairlineHidden:](self->_buttonsContainerView, "setTopHairlineHidden:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_buttonsContainerView, "setBottomHairlineHidden:", 1);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = self->_buttonsContainerView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRowViews:", v9);

  -[MKPlaceHeaderButtonsViewController setupPrimaryButton](self, "setupPrimaryButton");
  -[MKPlaceHeaderButtonsViewController updateButton:withController:](self, "updateButton:withController:", self->_secondaryButton, self->_secondaryButtonController);
  v10 = (_MKPlaceActionControlledButton *)objc_claimAutoreleasedReturnValue();
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = v10;

  -[MKPlaceHeaderButtonsViewController setConstraints](self, "setConstraints");
  MKGetPlaceCardLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceHeaderButtonsViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (UIView)contentView
{
  return (UIView *)self->_buttonsContainerView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceHeaderButtonsViewController;
  v7 = a4;
  -[MKPlaceHeaderButtonsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__MKPlaceHeaderButtonsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E20DF200;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __89__MKPlaceHeaderButtonsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConstraints");
}

- (void)setLineItem:(id)a3
{
  GEOTransitLineItem *v5;
  GEOTransitLineItem *v6;

  v5 = (GEOTransitLineItem *)a3;
  if (self->_lineItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineItem, a3);
    -[MKPlaceHeaderButtonsViewController setPrimaryButtonType:](self, "setPrimaryButtonType:", 0);
    v5 = v6;
  }

}

- (void)setPlaceItem:(id)a3
{
  _MKPlaceItem *v5;
  _MKPlaceItem *v6;

  v5 = (_MKPlaceItem *)a3;
  if (self->_placeItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeItem, a3);
    -[MKPlaceHeaderButtonsViewController setPrimaryButtonType:](self, "setPrimaryButtonType:", 0);
    v5 = v6;
  }

}

- (id)etaStringFor:(unint64_t)a3 travelTime:(double)a4
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    _MKLocalizedStringFromThisBundle(off_1E20DF220[v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    _MKPlaceCardFormattedStringForTimeInterval();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v10);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)directionAttributedStringWithETAString
{
  NSMutableAttributedString *currentETAString;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  currentETAString = self->_currentETAString;
  v4 = *MEMORY[0x1E0CEA098];
  v5 = 0x1E0CEA000uLL;
  if (currentETAString)
  {
    v34 = *MEMORY[0x1E0CEA098];
    v6 = (void *)MEMORY[0x1E0CEA5E8];
    v7 = _MKPlaceCardUseSmallerFont();
    v8 = *MEMORY[0x1E0CEB558];
    v9 = *MEMORY[0x1E0CEB588];
    if (v7)
      v10 = *MEMORY[0x1E0CEB558];
    else
      v10 = *MEMORY[0x1E0CEB588];
    objc_msgSend(v6, "preferredFontForTextStyle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    objc_msgSend(v6, "systemFontOfSize:weight:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString addAttributes:range:](currentETAString, "addAttributes:range:", v13, 0, -[NSMutableAttributedString length](self->_currentETAString, "length"));

    v5 = 0x1E0CEA000;
  }
  else
  {
    v8 = *MEMORY[0x1E0CEB558];
    v9 = *MEMORY[0x1E0CEB588];
  }
  _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_GetDirections_No_ETA_Short"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  v15 = *(void **)(v5 + 1512);
  v16 = (void *)MEMORY[0x1E0CEA5F0];
  if (_MKPlaceCardUseSmallerFont())
    v17 = v8;
  else
    v17 = v9;
  objc_msgSend(v16, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v17, 2, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontWithDescriptor:size:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v14, v20);
  v22 = v21;
  if (self->_currentETAString)
  {
    objc_msgSend(v21, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "rangeOfString:", CFSTR("%@"));
    v26 = v25;

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v20);
      objc_msgSend(v22, "appendAttributedString:", v27);

      objc_msgSend(v22, "appendAttributedString:", self->_currentETAString);
    }
    else
    {
      objc_msgSend(v22, "replaceCharactersInRange:withAttributedString:", v24, v26, self->_currentETAString);
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  objc_msgSend(v29, "setAlignment:", 1);
  objc_msgSend(v29, "setParagraphSpacing:", -3.0);
  objc_msgSend(v29, "setLineBreakMode:", 5);
  v30 = objc_msgSend(v22, "length");
  objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v29, 0, v30);

  return v22;
}

- (id)rerouteAttributedString
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_detourInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detourTime");
  if (v5 > 60.0)
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_detourInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detourTime");

  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_Reroute_Cost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _MKPlaceCardFormattedStringForTimeInterval();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v34 = *MEMORY[0x1E0CEA098];
  v13 = v34;
  v14 = *MEMORY[0x1E0CEB5C0];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v16);

  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setAlignment:", 1);
  v20 = objc_alloc(MEMORY[0x1E0CB3778]);
  _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_Reroute_Button"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v22 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v14, 2, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fontWithDescriptor:size:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = *MEMORY[0x1E0CEA0D0];
  v33[0] = v24;
  v33[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v25);

  objc_msgSend(v26, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "rangeOfString:", CFSTR("%@"));
  v30 = v29;

  if (v17 && v28 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v28, v30, v17);

  return v26;
}

- (id)attributedStringWith:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA238];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v17[0] = *MEMORY[0x1E0CEA098];
  v8 = (void *)MEMORY[0x1E0CEA5E8];
  v9 = (void *)MEMORY[0x1E0CEA5F0];
  v10 = _MKPlaceCardUseSmallerFont();
  v11 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (!v10)
    v11 = (_QWORD *)MEMORY[0x1E0CEB588];
  objc_msgSend(v9, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v11, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontWithDescriptor:size:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = *MEMORY[0x1E0CEA0D0];
  v18[0] = v13;
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v7, "initWithString:attributes:", v4, v14);

  return v15;
}

- (id)primaryAttributedString
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;

  switch(self->_primaryButtonType)
  {
    case 1uLL:
      -[MKPlaceHeaderButtonsViewController directionAttributedStringWithETAString](self, "directionAttributedStringWithETAString");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2uLL:
      -[MKPlaceHeaderButtonsViewController rerouteAttributedString](self, "rerouteAttributedString");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v4 = (void *)v3;
      return v4;
    case 3uLL:
      v5 = CFSTR("Share My Location");
      goto LABEL_8;
    case 4uLL:
      v5 = CFSTR("Add Stop\nto route");
LABEL_8:
      _MKLocalizedStringFromThisBundle(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHeaderButtonsViewController attributedStringWith:](self, "attributedStringWith:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  NSMutableAttributedString *v8;
  NSMutableAttributedString *currentETAString;

  v4 = a3;
  v5 = objc_msgSend(v4, "etaTransportType");
  objc_msgSend(v4, "etaTravelTime");
  v7 = v6;

  -[MKPlaceHeaderButtonsViewController etaStringFor:travelTime:](self, "etaStringFor:travelTime:", v5, v7);
  v8 = (NSMutableAttributedString *)objc_claimAutoreleasedReturnValue();
  currentETAString = self->_currentETAString;
  self->_currentETAString = v8;

  -[MKPlaceHeaderButtonsViewController setupPrimaryButton](self, "setupPrimaryButton");
}

- (void)_contentSizeDidChange
{
  -[MKPlaceHeaderButtonsViewController setupPrimaryButton](self, "setupPrimaryButton");
  -[MKPlaceHeaderButtonsViewController setConstraints](self, "setConstraints");
}

- (BOOL)shouldStackForButtons:(id)a3
{
  void *v4;
  double Width;
  void *v6;
  void *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  double v15;
  BOOL v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  if ((unint64_t)objc_msgSend(a3, "count") > 2)
    return 1;
  -[MKPlaceHeaderButtonsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v19);

  if (Width <= 320.0)
    return 1;
  v6 = (void *)MEMORY[0x1E0CEA5E8];
  v7 = (void *)MEMORY[0x1E0CEA5F0];
  v8 = _MKPlaceCardUseSmallerFont();
  v9 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (!v8)
    v9 = (_QWORD *)MEMORY[0x1E0CEB588];
  objc_msgSend(v7, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v9, 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pointSize");
  v13 = v12;
  v14 = _MKPlaceCardUseSmallerFont();
  v15 = 15.0;
  if (v14)
    v15 = 13.0;
  if (v13 <= v15)
  {
    -[MKPlaceHeaderButtonsViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v16 = CGRectGetWidth(v20) <= 320.0;

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)setConstraints
{
  MKPlaceHeaderButtonsViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _MKPlaceActionControlledButton *alternatePrimaryButton;
  MKPlaceSectionRowView *v10;
  MKPlaceSectionRowView *buttonsContainerView;
  _MKPlaceActionControlledButton *primaryButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _MKPlaceActionControlledButton *secondaryButton;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MKPlaceHeaderButtonsViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _MKPlaceActionControlledButton *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
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
  uint64_t v61;
  id v62;
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
  uint64_t v81;
  NSArray *buttons;
  uint64_t v83;
  NSArray *constraints;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id obja;
  id objb;
  id objc;
  id obj;
  id v118;
  id v119;
  id v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  MKPlaceHeaderButtonsViewController *v135;
  MKPlaceHeaderButtonsViewController *v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[2];
  _BYTE v147[128];
  _QWORD v148[2];
  _BYTE v149[128];
  _QWORD v150[8];
  void *v151;
  _QWORD v152[4];
  _QWORD v153[8];

  v2 = self;
  v153[6] = *MEMORY[0x1E0C80C00];
  -[MKPlaceHeaderButtonsViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v2->_constraints);
    v4 = (void *)MEMORY[0x1E0C9AA60];
    v137 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v2->_primaryButton)
      objc_msgSend(v5, "addObject:");
    if (v2->_secondaryButton)
      objc_msgSend(v6, "addObject:");
    v7 = -[MKPlaceHeaderButtonsViewController shouldStackForButtons:](v2, "shouldStackForButtons:", v6);
    if (v2->_primaryButton || v2->_secondaryButton)
    {
      -[_MKPlaceActionControlledButton superview](v2->_alternatePrimaryButton, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        -[MKPlaceSectionRowView addSubview:](v2->_buttonsContainerView, "addSubview:", v2->_alternatePrimaryButton);
    }
    else
    {
      -[_MKPlaceActionControlledButton removeFromSuperview](v2->_alternatePrimaryButton, "removeFromSuperview");
    }
    alternatePrimaryButton = v2->_alternatePrimaryButton;
    if (alternatePrimaryButton)
    {
      -[_MKPlaceActionControlledButton superview](alternatePrimaryButton, "superview");
      v10 = (MKPlaceSectionRowView *)objc_claimAutoreleasedReturnValue();
      buttonsContainerView = v2->_buttonsContainerView;

      if (v10 != buttonsContainerView)
      {
        -[_MKPlaceActionControlledButton removeFromSuperview](v2->_alternatePrimaryButton, "removeFromSuperview");
        -[MKPlaceSectionRowView addSubview:](v2->_buttonsContainerView, "addSubview:", v2->_alternatePrimaryButton);
      }
    }
    primaryButton = v2->_primaryButton;
    if (primaryButton && v2->_alternatePrimaryButton)
    {
      v111 = v6;
      -[_MKPlaceActionControlledButton topAnchor](primaryButton, "topAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView topAnchor](v2->_buttonsContainerView, "topAnchor");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:", v127);
      v118 = (id)objc_claimAutoreleasedReturnValue();
      v153[0] = v118;
      -[_MKPlaceActionControlledButton leadingAnchor](v2->_primaryButton, "leadingAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "leadingAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:", v105);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v153[1] = v102;
      -[_MKPlaceActionControlledButton topAnchor](v2->_alternatePrimaryButton, "topAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView topAnchor](v2->_buttonsContainerView, "topAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintEqualToAnchor:", v98);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v153[2] = v96;
      -[_MKPlaceActionControlledButton leadingAnchor](v2->_alternatePrimaryButton, "leadingAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceActionControlledButton trailingAnchor](v2->_primaryButton, "trailingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92, 6.0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v153[3] = v90;
      -[_MKPlaceActionControlledButton trailingAnchor](v2->_alternatePrimaryButton, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v153[4] = v16;
      -[_MKPlaceActionControlledButton widthAnchor](v2->_primaryButton, "widthAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceActionControlledButton widthAnchor](v2->_alternatePrimaryButton, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v153[5] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "addObjectsFromArray:", v20);

      secondaryButton = v2->_secondaryButton;
      if (secondaryButton)
      {
        -[_MKPlaceActionControlledButton leadingAnchor](secondaryButton, "leadingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "leadingAnchor");
        v131 = objc_claimAutoreleasedReturnValue();
        v119 = v22;
        objc_msgSend(v22, "constraintEqualToAnchor:", v131);
        v128 = objc_claimAutoreleasedReturnValue();
        v152[0] = v128;
        -[_MKPlaceActionControlledButton trailingAnchor](v2->_secondaryButton, "trailingAnchor");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
        objb = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objb, "trailingAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "constraintEqualToAnchor:", v106);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v152[1] = v103;
        -[_MKPlaceActionControlledButton topAnchor](v2->_secondaryButton, "topAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKPlaceActionControlledButton bottomAnchor](v2->_primaryButton, "bottomAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v24;
        objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 10.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v152[2] = v27;
        -[_MKPlaceActionControlledButton bottomAnchor](v2->_secondaryButton, "bottomAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -0.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v152[3] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 4);
        v31 = v2;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v137;
        objc_msgSend(v137, "addObjectsFromArray:", v32);

        v2 = v31;
        v34 = (void *)v131;

        v35 = (void *)v128;
      }
      else
      {
        -[_MKPlaceActionControlledButton bottomAnchor](v2->_primaryButton, "bottomAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v119 = v80;
        objc_msgSend(v80, "constraintEqualToAnchor:constant:", v23, -0.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v137;
        objc_msgSend(v137, "addObjectsFromArray:", v35);
      }
LABEL_47:
      v6 = v111;
      goto LABEL_48;
    }
    v36 = v2->_secondaryButton;
    if (v36 && v2->_alternatePrimaryButton)
    {
      -[_MKPlaceActionControlledButton topAnchor](v36, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView topAnchor](v2->_buttonsContainerView, "topAnchor");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v119 = v37;
      objc_msgSend(v37, "constraintEqualToAnchor:", v23);
      v132 = objc_claimAutoreleasedReturnValue();
      v150[0] = v132;
      -[_MKPlaceActionControlledButton leadingAnchor](v2->_secondaryButton, "leadingAnchor");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "leadingAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "constraintEqualToAnchor:", v121);
      objc = (id)objc_claimAutoreleasedReturnValue();
      v150[1] = objc;
      -[_MKPlaceActionControlledButton topAnchor](v2->_alternatePrimaryButton, "topAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView topAnchor](v2->_buttonsContainerView, "topAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "constraintEqualToAnchor:", v110);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v150[2] = v107;
      -[_MKPlaceActionControlledButton leadingAnchor](v2->_alternatePrimaryButton, "leadingAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceActionControlledButton trailingAnchor](v2->_secondaryButton, "trailingAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "constraintEqualToAnchor:constant:", v101, 6.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v150[3] = v99;
      -[_MKPlaceActionControlledButton trailingAnchor](v2->_alternatePrimaryButton, "trailingAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "trailingAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:", v93);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v150[4] = v91;
      -[_MKPlaceActionControlledButton bottomAnchor](v2->_alternatePrimaryButton, "bottomAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, -0.0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v150[5] = v87;
      -[_MKPlaceActionControlledButton widthAnchor](v2->_secondaryButton, "widthAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceActionControlledButton widthAnchor](v2->_alternatePrimaryButton, "widthAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v150[6] = v39;
      -[_MKPlaceActionControlledButton bottomAnchor](v2->_secondaryButton, "bottomAnchor");
      v40 = v6;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, -0.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v150[7] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v137;
      objc_msgSend(v137, "addObjectsFromArray:", v44);

      v34 = (void *)v132;
      v6 = v40;

      v35 = v129;
LABEL_48:

LABEL_49:
      v45 = v119;
LABEL_50:

LABEL_51:
      v81 = objc_msgSend(v6, "copy");
      buttons = v2->_buttons;
      v2->_buttons = (NSArray *)v81;

      v83 = objc_msgSend(v33, "copy");
      constraints = v2->_constraints;
      v2->_constraints = (NSArray *)v83;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v2->_constraints);
      -[MKPlaceHeaderButtonsViewController view](v2, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_mapkit_setNeedsLayout");

      return;
    }
    if (v7)
    {
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v45 = (void *)objc_msgSend(v6, "copy");
      v122 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v142, v149, 16);
      if (v122)
      {
        v113 = v6;
        v46 = 0;
        obj = v45;
        v120 = *(id *)v143;
        v135 = v2;
        do
        {
          v47 = 0;
          v48 = v46;
          do
          {
            v133 = v48;
            if (*(id *)v143 != v120)
              objc_enumerationMutation(obj);
            v49 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v47);
            objc_msgSend(v49, "leadingAnchor");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "leadingAnchor");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "constraintEqualToAnchor:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v148[0] = v52;
            objc_msgSend(v49, "trailingAnchor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "trailingAnchor");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "constraintEqualToAnchor:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v148[1] = v56;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "addObjectsFromArray:", v57);

            objc_msgSend(v49, "topAnchor");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v133)
            {
              objc_msgSend(v133, "bottomAnchor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 10.0);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v2 = v135;
            }
            else
            {
              v2 = v135;
              -[MKPlaceSectionRowView topAnchor](v135->_buttonsContainerView, "topAnchor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "constraintEqualToAnchor:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v137, "addObject:", v60);

            v46 = v49;
            ++v47;
            v48 = v46;
          }
          while (v122 != v47);
          v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v149, 16);
        }
        while (v122);

        v33 = v137;
        v6 = v113;
        if (!v46)
          goto LABEL_51;
        v119 = v46;
        objc_msgSend(v46, "bottomAnchor");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:constant:", v34, -0.0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "addObject:", v35);
        goto LABEL_48;
      }
    }
    else
    {
      objc_msgSend(v6, "reverseObjectEnumerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      v126 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
      if (v126)
      {
        v111 = v6;
        v23 = 0;
        v119 = v45;
        v123 = *(_QWORD *)v139;
        v136 = v2;
        do
        {
          v61 = 0;
          v62 = v23;
          do
          {
            v134 = v62;
            if (*(_QWORD *)v139 != v123)
              objc_enumerationMutation(v119);
            v63 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v61);
            objc_msgSend(v63, "topAnchor");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceSectionRowView topAnchor](v2->_buttonsContainerView, "topAnchor");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "constraintEqualToAnchor:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v146[0] = v66;
            objc_msgSend(v63, "bottomAnchor");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceSectionRowView bottomAnchor](v2->_buttonsContainerView, "bottomAnchor");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, -0.0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v146[1] = v69;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 2);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "addObjectsFromArray:", v70);

            if (v134)
            {
              objc_msgSend(v63, "widthAnchor");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "widthAnchor");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "constraintEqualToAnchor:", v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "addObject:", v73);

              objc_msgSend(v63, "leadingAnchor");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "trailingAnchor");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 10.0);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "addObject:", v76);
              v2 = v136;
            }
            else
            {
              objc_msgSend(v63, "leadingAnchor");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v2 = v136;
              -[MKPlaceSectionRowView layoutMarginsGuide](v136->_buttonsContainerView, "layoutMarginsGuide");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "leadingAnchor");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "constraintEqualToAnchor:", v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "addObject:", v77);

            }
            v23 = v63;

            ++v61;
            v62 = v23;
          }
          while (v126 != v61);
          v126 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
        }
        while (v126);
        if (!v23)
        {
          v33 = v137;
          v6 = v111;
          goto LABEL_49;
        }
        objc_msgSend(v23, "trailingAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionRowView layoutMarginsGuide](v2->_buttonsContainerView, "layoutMarginsGuide");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "trailingAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v137;
        objc_msgSend(v137, "addObject:", v79);

        goto LABEL_47;
      }
    }
    v33 = v137;
    goto LABEL_50;
  }
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  NSMutableAttributedString *currentETAString;

  if (self->_primaryButtonType != a3)
  {
    self->_primaryButtonType = a3;
    currentETAString = self->_currentETAString;
    self->_currentETAString = 0;

    -[MKPlaceHeaderButtonsViewController setupPrimaryButton](self, "setupPrimaryButton");
    -[MKPlaceHeaderButtonsViewController setConstraints](self, "setConstraints");
  }
}

- (void)setupPrimaryButton
{
  void *v3;
  void *v4;
  unint64_t primaryButtonType;
  _MKPlaceActionControlledButton *primaryButton;
  MKPlaceHeaderButton *v7;
  _MKPlaceActionControlledButton *v8;
  _MKPlaceActionControlledButton *v9;
  _MKPlaceActionControlledButton *v10;
  id v11;

  -[MKPlaceHeaderButtonsViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKPlaceHeaderButtonsViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 5)
    {
      primaryButtonType = self->_primaryButtonType;

      if (primaryButtonType == 3)
        return;
    }
    else
    {

    }
    primaryButton = self->_primaryButton;
    if (self->_primaryButtonType)
    {
      if (!primaryButton)
      {
        v7 = -[MKPlaceHeaderButton initWithPrimaryType:]([MKPlaceHeaderButton alloc], "initWithPrimaryType:", self->_primaryButtonType);
        v8 = self->_primaryButton;
        self->_primaryButton = (_MKPlaceActionControlledButton *)v7;

        -[_MKPlaceActionControlledButton _mapkit_setTarget:action:](self->_primaryButton, "_mapkit_setTarget:action:", self, sel_primaryButtonSelected_);
        -[MKPlaceSectionRowView addSubview:](self->_buttonsContainerView, "addSubview:", self->_primaryButton);
      }
    }
    else
    {
      -[_MKPlaceActionControlledButton removeFromSuperview](primaryButton, "removeFromSuperview");
      v9 = self->_primaryButton;
      self->_primaryButton = 0;

    }
    v10 = self->_primaryButton;
    -[MKPlaceHeaderButtonsViewController primaryAttributedString](self, "primaryAttributedString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceActionControlledButton setPrimaryTitle:](v10, "setPrimaryTitle:", v11);

  }
}

- (void)primaryButtonSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKPlaceHeaderButtonsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeHeaderButtonsViewController:didSelectPrimaryType:withView:", self, self->_primaryButtonType, v4);

}

- (id)updateButton:(id)a3 withController:(id)a4
{
  MKPlaceHeaderButton *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t primaryButtonType;
  MKPlaceHeaderButton *v11;
  void *v12;
  uint64_t v13;

  v6 = (MKPlaceHeaderButton *)a3;
  v7 = a4;
  -[MKPlaceHeaderButtonsViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_4;
  -[MKPlaceHeaderButtonsViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") != 5)
  {

    goto LABEL_6;
  }
  primaryButtonType = self->_primaryButtonType;

  if (primaryButtonType != 3)
  {
LABEL_6:
    objc_msgSend(v7, "buttonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    if (!v6 && v13)
    {
      v6 = objc_alloc_init(MKPlaceHeaderButton);
      -[MKPlaceSectionRowView addSubview:](self->_buttonsContainerView, "addSubview:", v6);
LABEL_13:
      -[MKPlaceHeaderButton setButtonController:](v6, "setButtonController:", v7);
      goto LABEL_14;
    }
    if (!v6 || v13)
    {
      if (v13)
        goto LABEL_13;
    }
    else
    {
      -[MKPlaceHeaderButton removeFromSuperview](v6, "removeFromSuperview");

      v6 = 0;
    }
LABEL_14:
    v6 = v6;

    v11 = v6;
    goto LABEL_15;
  }
LABEL_4:
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)setSecondaryButtonController:(id)a3
{
  _MKPlaceActionButtonController **p_secondaryButtonController;
  _MKPlaceActionControlledButton *secondaryButton;
  _MKPlaceActionControlledButton *v7;
  _MKPlaceActionControlledButton *v8;
  _MKPlaceActionButtonController *v9;

  p_secondaryButtonController = &self->_secondaryButtonController;
  v9 = (_MKPlaceActionButtonController *)a3;
  if (*p_secondaryButtonController != v9)
  {
    -[_MKPlaceActionControlledButton removeFromSuperview](self->_secondaryButton, "removeFromSuperview");
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = 0;

    objc_storeStrong((id *)&self->_secondaryButtonController, a3);
    -[MKPlaceHeaderButtonsViewController updateButton:withController:](self, "updateButton:withController:", self->_secondaryButton, *p_secondaryButtonController);
    v7 = (_MKPlaceActionControlledButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_secondaryButton;
    self->_secondaryButton = v7;

    if (self->_buttonsContainerView)
      -[MKPlaceHeaderButtonsViewController setConstraints](self, "setConstraints");
  }

}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  _MKPlaceActionButtonController **p_alternatePrimaryButtonController;
  _MKPlaceActionControlledButton *alternatePrimaryButton;
  _MKPlaceActionControlledButton *v7;
  _MKPlaceActionControlledButton *v8;
  _MKPlaceActionButtonController *v9;

  p_alternatePrimaryButtonController = &self->_alternatePrimaryButtonController;
  v9 = (_MKPlaceActionButtonController *)a3;
  if (*p_alternatePrimaryButtonController != v9)
  {
    -[_MKPlaceActionControlledButton removeFromSuperview](self->_alternatePrimaryButton, "removeFromSuperview");
    alternatePrimaryButton = self->_alternatePrimaryButton;
    self->_alternatePrimaryButton = 0;

    objc_storeStrong((id *)&self->_alternatePrimaryButtonController, a3);
    -[MKPlaceHeaderButtonsViewController updateButton:withController:](self, "updateButton:withController:", self->_alternatePrimaryButton, *p_alternatePrimaryButtonController);
    v7 = (_MKPlaceActionControlledButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_alternatePrimaryButton;
    self->_alternatePrimaryButton = v7;

    if (self->_buttonsContainerView)
      -[MKPlaceHeaderButtonsViewController setConstraints](self, "setConstraints");
  }

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_primaryButtonType - 1;
  if (v5 <= 2)
    objc_msgSend(v3, "addObject:", qword_1E20DF260[v5]);
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasFlyover");

  if ((v7 & 1) != 0)
  {
    v8 = &unk_1E2159418;
  }
  else if ((-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0)
  {
    v8 = &unk_1E2159430;
  }
  else
  {
    if ((-[_MKPlaceItem options](self->_placeItem, "options") & 2) == 0)
      goto LABEL_10;
    v8 = &unk_1E2159448;
  }
  objc_msgSend(v4, "addObject:", v8);
LABEL_10:
  -[MKPlaceHeaderButtonsViewController secondaryButtonController](self, "secondaryButtonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFE71C8);

  if (v10)
  {
    -[MKPlaceHeaderButtonsViewController secondaryButtonController](self, "secondaryButtonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "infoCardChildPossibleActions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        objc_msgSend(v4, "addObjectsFromArray:", v12);

    }
  }
  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKPlaceHeaderButtonsViewControllerDelegate)delegate
{
  return (MKPlaceHeaderButtonsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return self->_alternatePrimaryButtonController;
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return self->_secondaryButtonController;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_secondaryButtonController, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButtonController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_currentETAString, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_buttonsContainerView, 0);
}

@end
