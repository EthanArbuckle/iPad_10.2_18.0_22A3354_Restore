@implementation MUPlaceUnifiedActionRowSectionController

- (MUPlaceUnifiedActionRowSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7;
  MUPlaceUnifiedActionRowSectionController *v8;
  NSObject *v9;
  uint64_t v10;
  MUTimeExpirableLRUCache *partnerIconsByURLs;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceUnifiedActionRowSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v15, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", ", v14, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration artworkCache](v8->_configuration, "artworkCache");
    v10 = objc_claimAutoreleasedReturnValue();
    partnerIconsByURLs = v8->_partnerIconsByURLs;
    v8->_partnerIconsByURLs = (MUTimeExpirableLRUCache *)v10;

    -[MUPlaceUnifiedActionRowSectionController _buildButtonLayout](v8, "_buildButtonLayout");
    -[MUPlaceUnifiedActionRowSectionController _createSectionView](v8, "_createSectionView");
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", ", v14, 2u);
    }

  }
  return v8;
}

- (void)_createSectionView
{
  MUGroupedActionsRowView *v3;
  MUGroupedActionsRowView *actionsRowView;
  MUPlaceSectionView *v5;
  MUPlaceSectionView *sectionView;
  void *v7;
  void *v8;
  char v9;
  MUPlaceholderGridCache *v10;
  MUPlaceholderGridCache *placeholderGridCache;
  id v12;

  +[MUGroupedActionsRowViewConfiguration defaultConfiguration](MUGroupedActionsRowViewConfiguration, "defaultConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUseVibrancy:", +[MUInfoCardStyle hasExternallyProvidedTintColor](MUInfoCardStyle, "hasExternallyProvidedTintColor"));
  v3 = -[MUGroupedActionsRowView initWithConfiguration:]([MUGroupedActionsRowView alloc], "initWithConfiguration:", v12);
  actionsRowView = self->_actionsRowView;
  self->_actionsRowView = v3;

  -[MUGroupedActionsRowView setPreservesSuperviewLayoutMargins:](self->_actionsRowView, "setPreservesSuperviewLayoutMargins:", 0);
  -[MUGroupedActionsRowView setLayoutMargins:](self->_actionsRowView, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[MUGroupedActionsRowView setDelegate:](self->_actionsRowView, "setDelegate:", self);
  -[MUPlaceUnifiedActionRowSectionController _buildButtonLayout](self, "_buildButtonLayout");
  v5 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 1, 1);
  sectionView = self->_sectionView;
  self->_sectionView = v5;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", self->_actionsRowView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D26D08]);

  if ((v9 & 1) == 0)
  {
    +[MUPlaceholderGridCache unretainedInstance](MUPlaceholderGridCache, "unretainedInstance");
    v10 = (MUPlaceholderGridCache *)objc_claimAutoreleasedReturnValue();
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v10;

    -[MUPlaceholderGridCache loadPlaceholderGridImages](self->_placeholderGridCache, "loadPlaceholderGridImages");
  }

}

- (id)menuForActionItem:(id)a3
{
  void *v3;
  id v4;

  -[MUPlaceUnifiedActionRowSectionController menuElementForActionItem:](self, "menuElementForActionItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)menuElementForActionItem:(id)a3
{
  MUPlaceUnifiedActionRowSectionControllerConfiguration *configuration;
  id v4;
  void *v5;
  void *v6;

  configuration = self->_configuration;
  v4 = a3;
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionRowMenuProvider](configuration, "actionRowMenuProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuElementForActionItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectionView
{
  return self->_sectionView;
}

- (BOOL)hasContent
{
  return self->_hasContent;
}

- (void)_updateHasContent
{
  _BOOL4 v3;
  id v4;

  v3 = -[MUGroupedActionsRowView hasContent](self->_actionsRowView, "hasContent");
  if (self->_hasContent != v3)
  {
    self->_hasContent = v3;
    -[MUPlaceSectionController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeSectionControllerDidUpdateContent:", self);

  }
}

- (id)analyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUPlaceUnifiedActionRowSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (int)analyticsModuleType
{
  return 39;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D27480]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_actionItemViewModels;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "analyticsButtonValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_mapsui_addObjectsFromArrayIfNotNil:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v5, "addButtons:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v13, "count"))
    objc_msgSend(v4, "setUnifiedActionRow:", v5);

}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUPlaceUnifiedActionRowSectionController analyticsModule](self, "analyticsModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = *MEMORY[0x1E0CC16A8];
    objc_msgSend(v8, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CC16A0];
    v29[0] = v10;
    v29[1] = v9;
    v12 = *MEMORY[0x1E0CC1698];
    v28[1] = v11;
    v28[2] = v12;
    v29[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionRowItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resolvedActionItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performAction:options:completion:", v16, v13, 0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MUPlaceUnifiedActionRowSectionController actionDelegate](self, "actionDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionController:didSelectPrimaryButtonType:", self, -[MUPlaceUnifiedActionRowSectionControllerConfiguration primaryButtonType](self->_configuration, "primaryButtonType"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v7;
        -[MUPlaceUnifiedActionRowSectionController analyticsModule](self, "analyticsModule");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = *MEMORY[0x1E0CC16A8];
        objc_msgSend(v8, "sourceView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x1E0CC16A0];
        v27[0] = v18;
        v27[1] = v9;
        v20 = *MEMORY[0x1E0CC1698];
        v26[1] = v19;
        v26[2] = v20;
        v27[2] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0CC18C8];
        v23 = objc_msgSend(v17, "actionItemType");

        objc_msgSend(v22, "actionItemWithType:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "performAction:options:completion:", v24, v21, 0);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "performSingleVendorSelectionAction");
          goto LABEL_7;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "performWithPresentationOptions:", v8);
          goto LABEL_7;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
        -[MUPlaceUnifiedActionRowSectionController actionDelegate](self, "actionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sectionControllerDidSelectViewContactButton:", self);
      }
    }
  }

LABEL_7:
}

- (void)actionsRowView:(id)a3 didPresentMenuForViewModel:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "externalActionMenuRevealButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController captureInfoCardPartnerAction:eventValue:sharedStateButtonList:](self, "captureInfoCardPartnerAction:eventValue:sharedStateButtonList:", 209, 0, v5);

  }
}

- (void)_buildButtonLayout
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if (-[MUPlaceUnifiedActionRowSectionControllerConfiguration isSearchAlongRoute](self->_configuration, "isSearchAlongRoute"))
  {
    -[MUPlaceUnifiedActionRowSectionController _buildSARLayout](self, "_buildSARLayout");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (id)v3;
    goto LABEL_7;
  }
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration buttonModuleConfiguration](self->_configuration, "buttonModuleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MUPlaceUnifiedActionRowSectionController _buildStaticLayout](self, "_buildStaticLayout");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration buttonModuleConfiguration](self->_configuration, "buttonModuleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceUnifiedActionRowSectionController _buildServerControlledLayoutWithConfiguration:](self, "_buildServerControlledLayoutWithConfiguration:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
LABEL_7:
  v8 = v6;
  -[MUPlaceUnifiedActionRowSectionController _updateActions:](self, "_updateActions:", v6);

}

- (id)_buildStaticLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  MUPlaceActionControlledItemViewModel *v10;
  void *v11;
  MUPlaceActionControlledItemViewModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  -[MUPlaceUnifiedActionRowSectionController _directionsViewModel](self, "_directionsViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v4);

  if (GEOSupportsOfflineMaps()
    && -[MUPlaceUnifiedActionRowSectionControllerConfiguration canShowDownloadOffline](self->_configuration, "canShowDownloadOffline"))
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsOfflineMaps");

    if (v7)
    {
      if (-[MUPlaceUnifiedActionRowSectionControllerConfiguration shouldPromoteDownloadOffline](self->_configuration, "shouldPromoteDownloadOffline"))
      {
        -[MUPlaceUnifiedActionRowSectionController _downloadOfflineViewModel](self, "_downloadOfflineViewModel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v8);

      }
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration secondaryActionButtonController](self->_configuration, "secondaryActionButtonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [MUPlaceActionControlledItemViewModel alloc];
    -[MUPlaceUnifiedActionRowSectionController secondaryActionButtonController](self, "secondaryActionButtonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MUPlaceActionControlledItemViewModel initWithPlaceActionController:](v10, "initWithPlaceActionController:", v11);
    objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v12);

  }
  if (-[MUPlaceUnifiedActionRowSectionControllerConfiguration shouldShowContactsAction](self->_configuration, "shouldShowContactsAction"))
  {
    -[MUPlaceUnifiedActionRowSectionController _contactActionRowViewModel](self, "_contactActionRowViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v13);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E2E55CC0);
  if (v7
    && !-[MUPlaceUnifiedActionRowSectionControllerConfiguration shouldPromoteDownloadOffline](self->_configuration, "shouldPromoteDownloadOffline"))
  {
    objc_msgSend(v14, "addObjectsFromArray:", &unk_1E2E55CD8);
  }
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_geoMapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_externalActionLinks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "copy");
  -[MUPlaceUnifiedActionRowSectionController _moreActionsViewModelWithPartnerActions:promotedSystemActionTypes:excludedSystemActionTypes:](self, "_moreActionsViewModelWithPartnerActions:promotedSystemActionTypes:excludedSystemActionTypes:", v17, v18, MEMORY[0x1E0C9AA60]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v19);

  v20 = (void *)objc_msgSend(v3, "copy");
  return v20;
}

- (id)_buildSARLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[MUPlaceUnifiedActionRowSectionController _directionsViewModel](self, "_directionsViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v4);

  -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSearchAlongRouteActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[MUPlaceUnifiedActionRowSectionController _actionItemViewModelWithPlaceActionItem:](self, "_actionItemViewModelWithPlaceActionItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (id)_buildServerControlledLayoutWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = v4;
  objc_msgSend(v4, "buttonItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
LABEL_3:
    v9 = 0;
    while (2)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      switch(objc_msgSend(v10, "buttonType"))
      {
        case 1u:
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
        case 9u:
        case 0xBu:
        case 0xCu:
        case 0xDu:
        case 0xEu:
          -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "actionItemForButtonItem:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[MUPlaceUnifiedActionRowSectionController _actionItemViewModelWithPlaceActionItem:](self, "_actionItemViewModelWithPlaceActionItem:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v15, "resolvedActionItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "type"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

            goto LABEL_9;
          }
          goto LABEL_11;
        case 7u:
          v21 = v10;
          v22 = objc_msgSend(v21, "groupType");
          if (v22 == 1)
          {
            -[MUPlaceUnifiedActionRowSectionController _moreActionsViewModelWithGroupedButton:excludedSystemActionsTypes:](self, "_moreActionsViewModelWithGroupedButton:excludedSystemActionsTypes:", v21, v11);
            v23 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v22 != 2)
            {
              v16 = 0;
              goto LABEL_22;
            }
            -[MUPlaceUnifiedActionRowSectionController _partnerActionViewModelWithPartnerActionIndex:](self, "_partnerActionViewModelWithPartnerActionIndex:", objc_msgSend(v21, "actionDataIndex"));
            v23 = objc_claimAutoreleasedReturnValue();
          }
          v16 = (void *)v23;
LABEL_22:

          goto LABEL_9;
        case 8u:
          -[MUPlaceUnifiedActionRowSectionController _directionsViewModel](self, "_directionsViewModel");
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 0xAu:
          -[MUPlaceUnifiedActionRowSectionController _downloadOfflineViewModel](self, "_downloadOfflineViewModel");
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v16 = (void *)v20;
LABEL_9:
          if (v16)
          {
            objc_msgSend(v5, "addObject:", v16);

          }
          goto LABEL_11;
        default:
LABEL_11:

          if (v7 != ++v9)
            continue;
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v7 = v24;
          if (!v24)
            goto LABEL_24;
          goto LABEL_3;
      }
    }
  }
LABEL_24:

  v25 = (void *)objc_msgSend(v5, "copy");
  return v25;
}

- (id)_directionsViewModel
{
  unint64_t v3;
  MUDirectionsActionRowItemViewModel *v4;
  void *v5;
  MUPlaceAddStopActionRowItemViewModel *v6;
  _BOOL4 v7;
  MUPlaceAddStopActionRowItemViewModel *v8;
  MUPlaceAddStopActionRowItemViewModel *v9;
  void *v10;
  void *v11;

  v3 = -[MUPlaceUnifiedActionRowSectionControllerConfiguration primaryButtonType](self->_configuration, "primaryButtonType");
  if (v3 - 1 > 1)
  {
    if (v3 != 4)
    {
      v6 = 0;
      return v6;
    }
    v7 = -[MUPlaceUnifiedActionRowSectionControllerConfiguration isSearchAlongRoute](self->_configuration, "isSearchAlongRoute");
    v8 = [MUPlaceAddStopActionRowItemViewModel alloc];
    v9 = v8;
    if (!v7)
    {
      v6 = -[MUPlaceAddStopActionRowItemViewModel initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:](v8, "initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:", 0, 0, 0, 0);
      return v6;
    }
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration etaProvider](self->_configuration, "etaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_detourInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceAddStopActionRowItemViewModel initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:](v9, "initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:", 1, v5, v11, -[MUPlaceUnifiedActionRowSectionControllerConfiguration canShowDetourTime](self->_configuration, "canShowDetourTime"));

  }
  else
  {
    v4 = [MUDirectionsActionRowItemViewModel alloc];
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration etaProvider](self->_configuration, "etaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUDirectionsActionRowItemViewModel initWithETAProvider:](v4, "initWithETAProvider:", v5);
  }

  return v6;
}

- (id)_downloadOfflineViewModel
{
  void *v3;
  void *v4;
  MUDownloadOfflineActionRowItemViewModel *v5;
  void *v6;
  MUDownloadOfflineActionRowItemViewModel *v7;
  MUDownloadOfflineActionRowItemViewModel *offlineViewModel;
  MUDownloadOfflineActionRowItemViewModel *v9;

  if (GEOSupportsOfflineMaps()
    && -[MUPlaceUnifiedActionRowSectionControllerConfiguration canShowDownloadOffline](self->_configuration, "canShowDownloadOffline"))
  {
    if (!self->_offlineViewModel
      || (-[MUPlaceUnifiedActionRowSectionController offlineMapProvider](self, "offlineMapProvider"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[MUDownloadOfflineActionRowItemViewModel offlineMapProvider](self->_offlineViewModel, "offlineMapProvider"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v3,
          v3 != v4))
    {
      v5 = [MUDownloadOfflineActionRowItemViewModel alloc];
      -[MUPlaceUnifiedActionRowSectionController offlineMapProvider](self, "offlineMapProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MUDownloadOfflineActionRowItemViewModel initWithOfflineMapProvider:](v5, "initWithOfflineMapProvider:", v6);

      offlineViewModel = self->_offlineViewModel;
      self->_offlineViewModel = v7;

    }
    v9 = self->_offlineViewModel;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_contactActionRowViewModel
{
  MUViewContactActionRowItemViewModel *v3;

  if (MapsFeature_IsEnabled_MapsWally()
    && -[MUPlaceUnifiedActionRowSectionControllerConfiguration shouldShowContactsAction](self->_configuration, "shouldShowContactsAction"))
  {
    v3 = objc_alloc_init(MUViewContactActionRowItemViewModel);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_partnerActionViewModelWithPartnerActionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  MUPlaceExternalActionViewModel *v8;
  void *v9;
  void *v10;
  MUTimeExpirableLRUCache *partnerIconsByURLs;
  void *v12;
  MUPlaceExternalActionViewModel *v13;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_externalActionLinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") <= a3)
  {
    v13 = 0;
  }
  else
  {
    v8 = [MUPlaceExternalActionViewModel alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration amsResultProvider](self->_configuration, "amsResultProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    partnerIconsByURLs = self->_partnerIconsByURLs;
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration externalActionHandler](self->_configuration, "externalActionHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MUPlaceExternalActionViewModel initWithExternalAction:amsResultProvider:iconCache:actionHandler:analyticsHandler:](v8, "initWithExternalAction:amsResultProvider:iconCache:actionHandler:analyticsHandler:", v9, v10, partnerIconsByURLs, v12, self);

  }
  return v13;
}

- (id)_actionItemViewModelWithPlaceActionItem:(id)a3
{
  id v4;
  MUPlaceActionRowItemViewModel *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[MUPlaceActionRowItemViewModel initWithActionRowItem:menuProvider:style:]([MUPlaceActionRowItemViewModel alloc], "initWithActionRowItem:menuProvider:style:", v4, self, 0);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_moreActionsViewModelWithGroupedButton:(id)a3 excludedSystemActionsTypes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = v5;
  objc_msgSend(v5, "buttonItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "buttonType");
        if (v12 <= 0xE)
        {
          if (((1 << v12) & 0x7F7E) != 0)
          {
            -[MUPlaceUnifiedActionRowSectionControllerConfiguration actionManager](self->_configuration, "actionManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "actionItemForButtonItem:", v11);
            v14 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v11, "buttonType") == 13
              || objc_msgSend(v11, "buttonType") == 14)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "type"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v15);

            }
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v14, "resolvedActionItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "type"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v18);
LABEL_12:

            goto LABEL_13;
          }
          if (v12 == 7)
          {
            v14 = v11;
            if (objc_msgSend(v14, "groupType") == 2)
            {
              v32 = objc_msgSend(v14, "actionDataIndex");
              -[MUPlaceSectionController mapItem](self, "mapItem");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "_geoMapItem");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_externalActionLinks");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v21, "count");

              if (v32 < v30)
              {
                -[MUPlaceSectionController mapItem](self, "mapItem");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "_geoMapItem");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "_externalActionLinks");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectAtIndexedSubscript:", v32);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v22);

                goto LABEL_12;
              }
            }
LABEL_13:

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v8 = v23;
    }
    while (v23);
  }

  v24 = (void *)objc_msgSend(v29, "copy");
  v25 = (void *)objc_msgSend(v6, "copy");
  -[MUPlaceUnifiedActionRowSectionController _moreActionsViewModelWithPartnerActions:promotedSystemActionTypes:excludedSystemActionTypes:](self, "_moreActionsViewModelWithPartnerActions:promotedSystemActionTypes:excludedSystemActionTypes:", v24, v25, MEMORY[0x1E0C9AA60]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_moreActionsViewModelWithPartnerActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  MUPlaceMoreActionsViewModel *v12;
  void *v13;
  void *v14;
  MUTimeExpirableLRUCache *partnerIconsByURLs;
  void *v16;
  MUPlaceMoreActionsViewModel *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MUPlaceUnifiedActionRowSectionControllerConfiguration showMoreButtonIfAvailable](self->_configuration, "showMoreButtonIfAvailable"))
  {
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", &unk_1E2E55CF0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = [MUPlaceMoreActionsViewModel alloc];
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration moreActionsProvider](self->_configuration, "moreActionsProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration amsResultProvider](self->_configuration, "amsResultProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    partnerIconsByURLs = self->_partnerIconsByURLs;
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration externalActionHandler](self->_configuration, "externalActionHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MUPlaceMoreActionsViewModel initWithGroupedExternalActions:promotedSystemActionTypes:excludedSystemActionTypes:menuActionProvider:amsResultProvider:iconCache:externalActionHandler:analyticsHandler:](v12, "initWithGroupedExternalActions:promotedSystemActionTypes:excludedSystemActionTypes:menuActionProvider:amsResultProvider:iconCache:externalActionHandler:analyticsHandler:", v8, v9, v11, v13, v14, partnerIconsByURLs, v16, self);

    v10 = (id)v11;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setSecondaryActionButtonController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration secondaryActionButtonController](self->_configuration, "secondaryActionButtonController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration setSecondaryActionButtonController:](self->_configuration, "setSecondaryActionButtonController:", v8);
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration buttonModuleConfiguration](self->_configuration, "buttonModuleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
    if (!v6)
    {
      -[MUPlaceUnifiedActionRowSectionController _buildStaticLayout](self, "_buildStaticLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceUnifiedActionRowSectionController _updateActions:](self, "_updateActions:", v7);

      v5 = v8;
    }
  }

}

- (_MKPlaceActionButtonController)secondaryActionButtonController
{
  return -[MUPlaceUnifiedActionRowSectionControllerConfiguration secondaryActionButtonController](self->_configuration, "secondaryActionButtonController");
}

- (void)setOfflineMapProvider:(id)a3
{
  objc_storeWeak((id *)&self->_offlineMapProvider, a3);
  -[MUPlaceUnifiedActionRowSectionController _buildButtonLayout](self, "_buildButtonLayout");
}

- (void)setOfflineFeatureDiscoveryView:(id)a3
{
  MUFeatureDiscoveryAnnotationView *v5;
  MUFeatureDiscoveryAnnotationView *v6;

  v5 = (MUFeatureDiscoveryAnnotationView *)a3;
  if (self->_offlineFeatureDiscoveryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, a3);
    -[MUActionRowItemViewModel setFeatureDiscoveryView:](self->_offlineViewModel, "setFeatureDiscoveryView:", self->_offlineFeatureDiscoveryView);
    v5 = v6;
  }

}

- (void)_updateActions:(id)a3
{
  id v5;
  NSArray **p_actionItemViewModels;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_actionItemViewModels = &self->_actionItemViewModels;
  if ((-[NSArray isEqual:](self->_actionItemViewModels, "isEqual:", v5) & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = *p_actionItemViewModels;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "removeObserver:", self);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_actionItemViewModels, a3);
    -[MUGroupedActionsRowView setViewModels:](self->_actionsRowView, "setViewModels:", v5);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = *p_actionItemViewModels;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "addObserver:", self, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[MUPlaceUnifiedActionRowSectionController _updateHasContent](self, "_updateHasContent");
  }

}

- (MUPlaceUnifiedActionRowSectionControllerDelegate)actionDelegate
{
  return (MUPlaceUnifiedActionRowSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (MUOfflineMapProvider)offlineMapProvider
{
  return (MUOfflineMapProvider *)objc_loadWeakRetained((id *)&self->_offlineMapProvider);
}

- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView
{
  return self->_offlineFeatureDiscoveryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, 0);
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_offlineViewModel, 0);
  objc_storeStrong((id *)&self->_partnerIconsByURLs, 0);
  objc_storeStrong((id *)&self->_actionItemViewModels, 0);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_actionsRowView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
