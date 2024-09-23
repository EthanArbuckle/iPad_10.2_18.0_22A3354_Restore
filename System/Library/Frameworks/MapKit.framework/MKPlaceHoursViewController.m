@implementation MKPlaceHoursViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)placeHoursWithMapItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  MKPlaceHoursViewController *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "_isMapItemTypeBrand") & 1) != 0
    || (objc_msgSend(v3, "_businessHours"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        !v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[MKPlaceHoursViewController initWithMapItem:]([MKPlaceHoursViewController alloc], "initWithMapItem:", v3);
  }

  return v6;
}

- (MKPlaceHoursViewController)initWithMapItem:(id)a3
{
  id v4;
  MKPlaceHoursViewController *v5;
  MKPlaceHoursViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceHoursViewController;
  v5 = -[MKPlaceHoursViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[MKPlaceHoursViewController setMapItem:](v5, "setMapItem:", v4);

  return v6;
}

- (id)titleString
{
  return _MKLocalizedStringFromThisBundle(CFSTR("PlaceView_Hours"));
}

- (void)viewDidLoad
{
  void *v3;
  MKPlaceSectionHeaderView *v4;
  MKPlaceSectionHeaderView *v5;
  MKPlaceSectionHeaderView *headerView;
  void *v7;
  MKPlaceSectionHeaderView *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MKPlaceHoursViewController;
  -[MKPlaceHoursViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  v4 = [MKPlaceSectionHeaderView alloc];
  v5 = -[MKPlaceSectionHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  -[MKPlaceSectionHeaderView setShowSeeMoreButton:](self->_headerView, "setShowSeeMoreButton:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_headerView, "setBottomHairlineHidden:", 1);
  -[MKPlaceHoursViewController titleString](self, "titleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceSectionHeaderView setTitle:](self->_headerView, "setTitle:", v7);

  -[MKPlaceSectionHeaderView setTarget:action:](self->_headerView, "setTarget:action:", self, sel__toggleShowAllHours);
  v8 = self->_headerView;
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderView:", v8);

  -[MKPlaceHoursViewController _setExpanded:](self, "_setExpanded:", self->_isExpanded);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHoursViewController;
  -[MKPlaceHoursViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    -[MKPlaceHoursViewController _updateHoursAnimated:](self, "_updateHoursAnimated:", 0);
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  if (self->_resizableViewsDisabled != a3)
  {
    self->_resizableViewsDisabled = a3;
    if (a3)
    {
      -[MKPlaceHoursViewController _setExpanded:](self, "_setExpanded:", 1);
      if (-[MKPlaceHoursViewController isViewLoaded](self, "isViewLoaded"))
        -[MKPlaceHoursViewController _updateHoursAnimated:](self, "_updateHoursAnimated:", 0);
    }
    else
    {
      -[MKPlaceHoursViewController _setExpanded:](self, "_setExpanded:", self->_isExpanded);
    }
  }
}

- (NSTimeZone)timeZone
{
  return -[MKMapItem timeZone](self->_mapItem, "timeZone");
}

- (id)hoursBuilderWithHours:(id)a3
{
  id v4;
  _MKLocalizedHoursBuilder *v5;
  void *v6;
  _MKLocalizedHoursBuilder *v7;

  v4 = a3;
  v5 = [_MKLocalizedHoursBuilder alloc];
  -[MKPlaceHoursViewController timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MKLocalizedHoursBuilder initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:](v5, "initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:", v4, v6, 0, 0, 0);

  return v7;
}

- (NSArray)businessHours
{
  return -[MKMapItem _businessHours](self->_mapItem, "_businessHours");
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;
  NSArray *businessHours;
  int v8;
  MKMapItem *v9;

  v5 = (MKMapItem *)a3;
  v6 = v5;
  if (self->_mapItem != v5)
  {
    businessHours = self->_businessHours;
    self->_businessHours = 0;
    v9 = v5;

    objc_storeStrong((id *)&self->_mapItem, a3);
    v8 = -[MKPlaceHoursViewController isViewLoaded](self, "isViewLoaded");
    v6 = v9;
    if (v8)
    {
      -[MKPlaceHoursViewController _setExpanded:](self, "_setExpanded:", -[MKPlaceHoursViewController _shouldOnlyShowExpanded](self, "_shouldOnlyShowExpanded"));
      -[MKPlaceHoursViewController _updateHoursAnimated:](self, "_updateHoursAnimated:", 0);
      v6 = v9;
    }
  }

}

- (BOOL)_shouldOnlyShowExpanded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v16;

  -[MKPlaceHoursViewController businessHours](self, "businessHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MKPlaceHoursViewController businessHours](self, "businessHours");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    -[MKPlaceHoursViewController businessHours](self, "businessHours");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeDailyHours");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[MKPlaceHoursViewController businessHours](self, "businessHours");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hoursType");

    v16 = (v10 == 1 || v13 == 4) && v6 == 1;
  }
  else
  {
    v16 = 0;
  }
  return self->_resizableViewsDisabled || v16;
}

- (void)_setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  id v6;

  v3 = a3;
  self->_isExpanded = a3;
  if (-[MKPlaceHoursViewController _shouldOnlyShowExpanded](self, "_shouldOnlyShowExpanded"))
  {
    self->_isExpanded = 1;
    -[MKPlaceSectionHeaderView setShowSeeMoreButton:](self->_headerView, "setShowSeeMoreButton:", 0);
  }
  else
  {
    -[MKPlaceSectionHeaderView setShowSeeMoreButton:](self->_headerView, "setShowSeeMoreButton:", 1);
    if (v3)
      v5 = CFSTR("Placecard Show operating hours today");
    else
      v5 = CFSTR("Placecard Show all operating hours");
    _MKLocalizedStringFromThisBundle(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView setSeeMoreButtonText:](self->_headerView, "setSeeMoreButtonText:", v6);

  }
}

- (void)_toggleShowAllHours
{
  void *v3;
  _BOOL4 isExpanded;
  void *v5;
  void *v6;
  uint64_t v7;

  -[MKPlaceHoursViewController _setExpanded:](self, "_setExpanded:", !self->_isExpanded);
  -[MKPlaceHoursViewController analyticsDelegate](self, "analyticsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    isExpanded = self->_isExpanded;
    -[MKPlaceHoursViewController analyticsDelegate](self, "analyticsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (isExpanded)
      v7 = 6012;
    else
      v7 = 6011;
    objc_msgSend(v5, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", v7, 0, 0, 0);

  }
  -[UIView _mapkit_layoutIfNeeded](self->_headerView, "_mapkit_layoutIfNeeded");
  -[MKPlaceHoursViewController _updateHoursAnimated:](self, "_updateHoursAnimated:", 1);
}

- (void)_contentSizeDidChange
{
  -[MKPlaceHoursViewController _updateHoursAnimated:](self, "_updateHoursAnimated:", 0);
}

- (void)_updateHoursAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MKPlaceHoursDayRow *v13;
  void *v14;
  MKPlaceHoursDayRow *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 isExpanded;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MKPlaceHoursViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5 != 0;

  }
  else
  {
    v32 = 0;
  }
  v6 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[MKPlaceHoursViewController businessHours](self, "businessHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11);
        v13 = [MKPlaceHoursDayRow alloc];
        -[MKPlaceHoursViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        v15 = -[MKPlaceHoursDayRow initWithBusinessHours:frame:](v13, "initWithBusinessHours:frame:", v12);

        -[MKPlaceHoursViewController hoursBuilderWithHours:](self, "hoursBuilderWithHours:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceHoursDayRow hoursView](v15, "hoursView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHoursBuilder:", v16);

        -[MKViewWithHairline setBottomHairlineHidden:](v15, "setBottomHairlineHidden:", 1);
        objc_msgSend(v6, "addObject:", v15);
        -[MKPlaceHoursDayRow hoursView](v15, "hoursView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v18);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v9);
  }

  -[MKPlaceHoursViewController businessHours](self, "businessHours");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKPlaceHoursViewHelper determineExtraRulesForPlaceHoursViews:withBusinessHours:](MKPlaceHoursViewHelper, "determineExtraRulesForPlaceHoursViews:withBusinessHours:", v33, v19);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        isExpanded = self->_isExpanded;
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "hoursView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "placeHoursViewOptions");
        if (isExpanded)
          v28 = 8;
        else
          v28 = 1;
        objc_msgSend(v26, "setPlaceHoursViewOptions:", v27 | v28);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v22);
  }

  objc_msgSend(v20, "lastObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBottomHairlineHidden:", 1);

  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v30, "setRowViews:animated:isNeedLayout:", v31, v32, 0);

}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceHoursViewController;
  -[UIViewController infoCardThemeChanged](&v15, sel_infoCardThemeChanged);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MKPlaceSectionViewController sectionView](self, "sectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "hoursView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hoursBuilder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateHoursLabelColor");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MKPlaceSectionHeaderView showSeeMoreButton](self->_headerView, "showSeeMoreButton"))
  {
    if (self->_isExpanded)
      v4 = 6011;
    else
      v4 = 6012;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (_MKInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
