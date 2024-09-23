@implementation MUPlaceListItemSectionController

- (MUPlaceListItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4
{
  id v7;
  MUPlaceListItemSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceListItemSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceListItemSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_annotatedList, a4);
    -[MUPlaceListItemSectionController _setupSubviews](v8, "_setupSubviews");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceListItemSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MUTextPairVerticalCardView *v15;
  MUTextPairVerticalCardView *v16;
  MUTextPairVerticalCardView *textVerticalCardView;
  MUTextPairVerticalCardView *v18;
  void *v19;
  MUPlaceSectionView *v20;
  MUPlaceSectionView *sectionView;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOAnnotatedItemList textItemContainer](self->_annotatedList, "textItemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[GEOAnnotatedItemList textItemContainer](self->_annotatedList, "textItemContainer", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "primaryText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  +[MUTextPairViewModel textPairViewModelsFromStrings:](MUTextPairViewModel, "textPairViewModelsFromStrings:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MUTextPairVerticalCardView alloc];
  v16 = -[MUTextPairVerticalCardView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  textVerticalCardView = self->_textVerticalCardView;
  self->_textVerticalCardView = v16;

  -[MUTextPairVerticalCardView setViewModels:](self->_textVerticalCardView, "setViewModels:", v14);
  v18 = self->_textVerticalCardView;
  -[MUPlaceListItemSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v18, v19);
  v20 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v20;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  GEOAnnotatedItemList *annotatedList;
  MUPlaceListItemSectionController *v5;
  GEOAnnotatedItemList *v6;
  void *v7;
  void *v8;
  MUPlaceSectionHeaderViewModel *v9;
  MUPlaceSectionHeaderViewModel *v10;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    annotatedList = self->_annotatedList;
    v5 = self;
    v6 = annotatedList;
    mkAttributionForAnnotatedList();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAnnotatedItemList title](v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceSectionHeaderViewModel viewModelForTitle:attribution:target:action:](MUPlaceSectionHeaderViewModel, "viewModelForTitle:attribution:target:action:", v8, v7, v5, sel__performPunchout);
    v9 = (MUPlaceSectionHeaderViewModel *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceSectionHeaderViewModel setTarget:selector:](v9, "setTarget:selector:", v5, sel__performPunchout);
    v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_performPunchout
{
  GEOAnnotatedItemList *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MUPlaceListItemSectionController _captureUserAction:](self, "_captureUserAction:", 6054);
  v3 = self->_annotatedList;
  mkAttributionForAnnotatedList();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "providerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Attempting to punch our with attribution with provider %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)MEMORY[0x1E0CC1758];
  objc_msgSend(v4, "attributionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchAttributionURLs:withAttribution:completionHandler:", v8, v4, &__block_literal_global_51);

}

- (void)_captureUserAction:(int)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", *(_QWORD *)&a3, 0, 0);
}

- (int)analyticsModuleType
{
  return 19;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_annotatedList, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_textVerticalCardView, 0);
}

@end
