@implementation MUFooterActionsSectionController

- (MUFooterActionsSectionController)initWithActionManager:(id)a3
{
  id v4;
  MUFooterActionsSectionController *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUFooterActionsSectionController;
  v5 = -[MUFooterActionsSectionController init](&v10, sel_init);
  if (v5)
  {
    MUGetPlaceCardLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceFooterActionsSectionControllerInit", ", v9, 2u);
    }

    objc_storeWeak((id *)&v5->_actionManager, v4);
    -[MUFooterActionsSectionController _setupFooterView](v5, "_setupFooterView");
    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceFooterActionsSectionControllerInit", ", v9, 2u);
    }

  }
  return v5;
}

- (void)_setupFooterView
{
  MUActionGroupSectionView *v3;
  void *v4;
  MUActionGroupSectionView *v5;
  MUActionGroupSectionView *footerView;
  MUPlaceSectionView *v7;
  MUPlaceSectionView *sectionView;

  v3 = [MUActionGroupSectionView alloc];
  +[MUInfoCardStyle preferredVerticalCardConfiguration](MUInfoCardStyle, "preferredVerticalCardConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUActionGroupSectionView initWithConfiguration:](v3, "initWithConfiguration:", v4);
  footerView = self->_footerView;
  self->_footerView = v5;

  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", self->_footerView, 0);
  v7 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v7;

  -[MUPlaceSectionView hideBottomSeperator](self->_sectionView, "hideBottomSeperator");
  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUFooterActionsSectionController reloadData](self, "reloadData");
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (NSArray)sectionViews
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_sectionView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasContent
{
  return 1;
}

- (void)reloadData
{
  id WeakRetained;
  NSArray *v4;
  NSArray *footerActions;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MUActionItemCellModel *v11;
  void *v12;
  NSArray *obj;
  _QWORD v14[5];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  objc_msgSend(WeakRetained, "createFooterActions");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  footerActions = self->_footerActions;
  self->_footerActions = v4;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_footerActions, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_footerActions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = -[MUActionItemCellModel initWithActionItem:]([MUActionItemCellModel alloc], "initWithActionItem:", v10);
        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __46__MUFooterActionsSectionController_reloadData__block_invoke;
        v14[3] = &unk_1E2E04110;
        objc_copyWeak(&v15, &location);
        v14[4] = v10;
        -[MUActionItemCellModel setActionBlock:](v11, "setActionBlock:", v14);
        objc_msgSend(v6, "addObject:", v11);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v6, "copy");
  -[MUActionGroupSectionView setViewModels:](self->_footerView, "setViewModels:", v12);

}

void __46__MUFooterActionsSectionController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(*(id *)(a1 + 32), "resolvedActionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CC16A8];
    v13[0] = v3;
    v9 = *MEMORY[0x1E0CC16A0];
    v12[0] = v8;
    v12[1] = v9;
    objc_msgSend(v5, "analyticsModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performAction:options:completion:", v7, v11, 0);

  }
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (id)infoCardChildPossibleActions
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_footerActions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "resolvedActionItem", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "type");

        v11 = v10 - 1;
        if ((unint64_t)(v10 - 1) <= 0x11 && ((0x201F9u >> v11) & 1) != 0)
          objc_msgSend(v3, "addObject:", qword_1E2E04130[v11]);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)analyticsModuleType
{
  return 23;
}

- (id)analyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUFooterActionsSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (id)revealedAnalyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D27450], "moduleWithType:", -[MUFooterActionsSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return self->_sectionHeaderViewModel;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_submissionStatus, a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (MUInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_footerActions, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
