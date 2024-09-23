@implementation MUPersonalGuidesSectionController

- (MUPersonalGuidesSectionController)initWithMapItem:(id)a3 collectionViewProvider:(id)a4
{
  id v6;
  MUPersonalGuidesSectionController *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPersonalGuidesSectionController;
  v7 = -[MUPlaceSectionController initWithMapItem:](&v12, sel_initWithMapItem_, a3);
  if (v7)
  {
    MUGetPlaceCardLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerInit", ", v11, 2u);
    }

    objc_storeWeak((id *)&v7->_viewProvider, v6);
    -[MUPersonalGuidesSectionController _setupSectionView](v7, "_setupSectionView");
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerInit", ", v11, 2u);
    }

  }
  return v7;
}

- (void)_setupSectionView
{
  MUPlaceVerticalCardContainerView *v3;
  MUPlaceVerticalCardContainerView *containerView;
  MUPlaceVerticalCardContainerView *v5;
  void *v6;
  MUPlaceSectionView *v7;
  MUPlaceSectionView *sectionView;
  id v9;

  +[MUPlaceVerticalCardConfiguration separatorConfiguration](MUPlaceVerticalCardConfiguration, "separatorConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MUPlaceVerticalCardContainerView initWithConfiguration:]([MUPlaceVerticalCardContainerView alloc], "initWithConfiguration:", v9);
  containerView = self->_containerView;
  self->_containerView = v3;

  -[MUPlaceVerticalCardContainerView setDelegate:](self->_containerView, "setDelegate:", self);
  -[MUPlaceVerticalCardContainerView setAccessibilityIdentifier:](self->_containerView, "setAccessibilityIdentifier:", CFSTR("PersonalGuidesContainer"));
  v5 = self->_containerView;
  -[MUPersonalGuidesSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v5, v6);
  v7 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v7;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 active;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  active = self->_active;
  if (active != a3)
  {
    self->_active = a3;
    active = a3;
  }
  if (active)
  {
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerActivate", ", buf, 2u);
    }

    -[MUPersonalGuidesSectionController reloadCollectionsAnimated:](self, "reloadCollectionsAnimated:", 1);
    MUGetPlaceCardLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerActivate", ", v7, 2u);
    }

  }
}

- (void)reloadCollectionsAnimated:(BOOL)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSDictionary *collectionViews;
  int IsMacCatalyst;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  MUPlaceSectionRowView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *wrappedSectionViewsByIdentifier;
  void *v37;
  void *v38;
  MUPlaceVerticalCardContainerView *containerView;
  id v40;
  NSObject *v41;
  void *v42;
  NSDictionary *v43;
  id v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  NSObject *v49;
  id v50;
  void *v51;
  MUPersonalGuidesSectionController *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _QWORD v66[4];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v52 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  objc_msgSend(WeakRetained, "collectionViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v11 = v52->_collectionViews;
  if (-[NSDictionary count](v52->_collectionViews, "count"))
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    -[NSDictionary allValues](v11, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v14;
  }
  if (objc_msgSend(v4, "isEqualToSet:", v10))
  {
    MUGetPlaceCardLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_INFO, "MUPersonalGuidesSectionController:  Not updating personal guides as incoming == current", buf, 2u);
    }
  }
  else
  {
    v43 = v11;
    v44 = v10;
    v46 = v4;
    v16 = objc_msgSend(v6, "copy");
    collectionViews = v52->_collectionViews;
    v52->_collectionViews = (NSDictionary *)v16;

    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    if (IsMacCatalyst)
      v19 = 8.0;
    else
      v19 = 0.0;
    if (IsMacCatalyst)
      v20 = 16.0;
    else
      v20 = 0.0;
    v45 = v6;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4 * -[NSObject count](v15, "count"));
    v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[NSDictionary allKeys](v52->_collectionViews, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v53)
    {
      v48 = *(_QWORD *)v62;
      v21 = *MEMORY[0x1E0C9D648];
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v49 = v15;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v62 != v48)
            objc_enumerationMutation(obj);
          v60 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v52->_collectionViews, "objectForKeyedSubscript:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[MUPlaceSectionRowView initWithFrame:]([MUPlaceSectionRowView alloc], "initWithFrame:", v21, v22, v23, v24);
          objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[MUPlaceSectionRowView setAccessibilityIdentifier:](v27, "setAccessibilityIdentifier:", CFSTR("PersonalGuide"));
          -[MUPlaceSectionRowView addSubview:](v27, "addSubview:", v26);
          objc_msgSend(v26, "topAnchor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceSectionRowView topAnchor](v27, "topAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, v19);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = v57;
          objc_msgSend(v26, "bottomAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceSectionRowView bottomAnchor](v27, "bottomAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -v19);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v54;
          objc_msgSend(v26, "leadingAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceSectionRowView leadingAnchor](v27, "leadingAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v20);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v66[2] = v30;
          objc_msgSend(v26, "trailingAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceSectionRowView trailingAnchor](v27, "trailingAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v20);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v66[3] = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObjectsFromArray:", v34);

          objc_msgSend(v50, "setObject:forKey:", v27, v60);
          v15 = v49;
          -[NSObject addObject:](v49, "addObject:", v27);

        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v53);
    }

    v35 = objc_msgSend(v50, "copy");
    wrappedSectionViewsByIdentifier = v52->_wrappedSectionViewsByIdentifier;
    v52->_wrappedSectionViewsByIdentifier = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x1E0CB3718];
    v38 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v37, "activateConstraints:", v38);

    containerView = v52->_containerView;
    v40 = -[NSObject copy](v15, "copy");
    -[MUPlaceVerticalCardContainerView setRowViews:](containerView, "setRowViews:", v40);

    MUGetPlaceCardLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v41, OS_LOG_TYPE_INFO, "MUPersonalGuidesSectionController: Detected change in user collections and telling parent to update content", buf, 2u);
    }

    -[MUPlaceSectionController delegate](v52, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "placeSectionControllerDidUpdateContent:", v52);

    v6 = v45;
    v4 = v46;
    v11 = v43;
    v10 = v44;
  }

}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  MUPlaceSectionHeaderViewModel *v4;
  void *v5;
  MUPlaceSectionHeaderViewModel *v6;
  MUPlaceSectionHeaderViewModel *v7;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = [MUPlaceSectionHeaderViewModel alloc];
    _MULocalizedStringFromThisBundle(CFSTR("In Your Guides [Placecard]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v4, "initWithTitleString:", v5);
    v7 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v6;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return -[NSDictionary count](self->_collectionViews, "count") != 0;
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSDictionary allKeys](self->_collectionViews, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_wrappedSectionViewsByIdentifier, "objectForKeyedSubscript:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 0, 0, 0);
          WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
          objc_msgSend(WeakRetained, "collectionIdentifierSelected:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4
{
  return 1;
}

- (int)analyticsModuleType
{
  return 29;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_wrappedSectionViewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionViews, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
}

@end
