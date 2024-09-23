@implementation StartPageController

- (SFStartPageViewController)viewController
{
  id WeakRetained;
  id v4;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v6;
  void *v7;
  SFStartPageViewController *v8;
  SFStartPageViewController *viewController;
  void *v10;
  void *v11;
  SFStartPageViewController *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!self->_viewController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4ED60]);
    visualStyleProvider = self->_visualStyleProvider;
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (SFStartPageViewController *)objc_msgSend(v4, "initWithVisualStyleProvider:forProfile:", visualStyleProvider, v7);
    viewController = self->_viewController;
    self->_viewController = v8;

    -[SFStartPageViewController setCustomizationDataSource:](self->_viewController, "setCustomizationDataSource:", self);
    -[SFStartPageViewController setDataSource:](self->_viewController, "setDataSource:", self);
    -[StartPageController _updatePrivacyReportData](self, "_updatePrivacyReportData");
  }
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageViewController setProfile:](self->_viewController, "setProfile:", v11);

  v12 = self->_viewController;
  return v12;
}

- (id)_effectiveProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_effectiveProfileIdentifier
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
  {
    v3 = (id)*MEMORY[0x1E0D89E20];
  }
  else
  {
    objc_msgSend(WeakRetained, "activeProfileIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)startPageBackgroundImageIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPageBackgroundImageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backgroundImageIdentifierForStartPageViewController:(id)a3
{
  -[StartPageController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionsForStartPageViewController:(id)a3
{
  id WeakRetained;
  int v5;
  WBSStartPageSection *cachedCloudTabsSection;
  void *v7;
  NSString *libraryType;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WBSStartPageSection *v17;
  WBSStartPageSection *cachedTabGroupHeadingSection;
  uint64_t v19;
  void *v20;
  WBSStartPageSection *v21;
  void *v22;
  void *v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  if (self->_privateBrowsingWasEnabled != v5)
  {
    cachedCloudTabsSection = self->_cachedCloudTabsSection;
    self->_cachedCloudTabsSection = 0;

    self->_privateBrowsingWasEnabled = v5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  libraryType = self->_libraryType;
  if (libraryType)
  {
    startPageSectionIdentifierForCollectionType(libraryType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[StartPageController _appendSectionModelsForIdentifier:toArray:](self, "_appendSectionModelsForIdentifier:toArray:", v9, v7);

    goto LABEL_37;
  }
  if (v5)
  {
    -[StartPageController _privateBrowsingPersistentModuleSection](self, "_privateBrowsingPersistentModuleSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    if (self->_privateBrowsingExplanationState != 1
      && objc_msgSend(WeakRetained, "startPageControllerActiveTabIsBlank:", self))
    {
      -[StartPageController _privateBrowsingExplanationSection](self, "_privateBrowsingExplanationSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E0D8AFD8]) & 1) != 0)
      goto LABEL_12;
    v13 = -[StartPageController _canShowPrivateRelaySection](self, "_canShowPrivateRelaySection");

    if (v13)
    {
      -[StartPageController _privateRelayPromptInPrivateBrowsingSection](self, "_privateRelayPromptInPrivateBrowsingSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);
LABEL_12:

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController _tabGroupScopedFavoritesSection](self, "_tabGroupScopedFavoritesSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_addObjectUnlessNil:", v15);

  v16 = objc_msgSend(v14, "count");
  if (v16)
  {
    -[StartPageController _tabGroupHeadingSection](self, "_tabGroupHeadingSection");
    v17 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
    cachedTabGroupHeadingSection = self->_cachedTabGroupHeadingSection;
    self->_cachedTabGroupHeadingSection = v17;

    objc_msgSend(v7, "addObject:", self->_cachedTabGroupHeadingSection);
    objc_msgSend(v7, "addObjectsFromArray:", v14);
    if (!startPageSeparatorSection(void)::section)
    {
      objc_msgSend(MEMORY[0x1E0D8ACC0], "separatorSectionWithIdentifier:", *MEMORY[0x1E0D8B678]);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)startPageSeparatorSection(void)::section;
      startPageSeparatorSection(void)::section = v19;

    }
    objc_msgSend(v7, "addObject:");
  }
  else
  {
    v21 = self->_cachedTabGroupHeadingSection;
    self->_cachedTabGroupHeadingSection = 0;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSStartPageSectionManager enabledSectionIdentifiers](self->_startPageSectionManager, "enabledSectionIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[StartPageController effectiveUpdatePolicy](self, "effectiveUpdatePolicy");
  if (v24)
  {
    if (v24 == 1)
    {
      objc_msgSend(v23, "firstObject");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (!v16 && v29)
        -[StartPageController _appendSectionModelsForIdentifier:toArray:](self, "_appendSectionModelsForIdentifier:toArray:", v29, v22);

    }
    else if (v24 == 2)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v34 != v27)
              objc_enumerationMutation(v25);
            -[StartPageController _appendSectionModelsForIdentifier:toArray:](self, "_appendSectionModelsForIdentifier:toArray:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v22, (_QWORD)v33);
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v26);
      }

    }
  }
  else
  {
    v31 = self->_cachedSections;

    v22 = v31;
  }
  objc_storeStrong((id *)&self->_cachedSections, v22);
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v22);

LABEL_37:
  return v7;
}

- (void)_appendSectionModelsForIdentifier:(id)a3 toArray:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B600]))
  {
    -[StartPageController _favoritesSection](self, "_favoritesSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B608]))
  {
    if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) != 0)
      goto LABEL_4;
    -[StartPageController _frequentlyVisitedSection](self, "_frequentlyVisitedSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B630]) && !self->_showingAsPopover)
  {
    -[StartPageController _privacyReportSection](self, "_privacyReportSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B610])
         || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B668]))
  {
    -[StartPageController _highlightsSection](self, "_highlightsSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
  }
  else if (self->_showingAsPopover || !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B658]))
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B660]))
    {
      -[StartPageController _siriSuggestionsSection](self, "_siriSuggestionsSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B650]))
    {
      -[StartPageController _readingListSection](self, "_readingListSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D8B5F8]))
        goto LABEL_4;
      -[StartPageController cloudTabsSections](self, "cloudTabsSections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_addObjectsFromArrayUnlessNil:", v7);
    }
  }
  else
  {
    -[StartPageController _recentlyClosedTabsSection](self, "_recentlyClosedTabsSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_addObjectUnlessNil:", v7);
  }

LABEL_4:
}

- (id)_favoritesSection
{
  WebBookmarkList *favoritesList;
  WebBookmarkCollection *bookmarkCollection;
  WebBookmarkList *v5;
  WebBookmarkList *v6;
  WBSStartPageSection *v7;
  WBSStartPageSection *cachedFavoritesSection;
  WBSStartPageSection *v9;
  void *v10;
  uint64_t v11;
  WBSStartPageSection *v12;
  void *v13;
  WBSStartPageSection *v14;

  -[StartPageController _updateFavoritesListForActiveProfile](self, "_updateFavoritesListForActiveProfile");
  favoritesList = self->_favoritesList;
  if (!favoritesList)
  {
    bookmarkCollection = self->_bookmarkCollection;
    if (isRestricted)
      -[WebBookmarkCollection webFilterAllowedSites](bookmarkCollection, "webFilterAllowedSites");
    else
      -[WebBookmarkCollection favoritesFolderList](bookmarkCollection, "favoritesFolderList");
    v5 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
    v6 = self->_favoritesList;
    self->_favoritesList = v5;

    self->_favoritesFolderIDForDefaultProfile = -[WebBookmarkList folderID](self->_favoritesList, "folderID");
    favoritesList = self->_favoritesList;
  }
  if (self->_cachedFavoritesList != favoritesList)
  {
    -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:](self, "_bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:", 0);
    v7 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
    cachedFavoritesSection = self->_cachedFavoritesSection;
    self->_cachedFavoritesSection = v7;

    objc_storeStrong((id *)&self->_cachedFavoritesList, self->_favoritesList);
  }
  v9 = self->_cachedFavoritesSection;
  -[StartPageController _effectiveProfile](self, "_effectiveProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "kind");

  if (v11)
  {
    v12 = v9;
  }
  else
  {
    -[WBSStartPageSection itemIdentifiers](v9, "itemIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
      v14 = v9;
    else
      v14 = 0;
    v12 = v14;

  }
  return v12;
}

- (void)_updateFavoritesListForActiveProfile
{
  void *v3;
  NSString *v4;
  NSString *lastSeenProfileCustomFavoritesServerID;
  WebBookmarkList *favoritesList;
  WebBookmark *customFavoritesFolderBookmark;

  -[StartPageController _effectiveProfile](self, "_effectiveProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customFavoritesFolderServerID");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastSeenProfileCustomFavoritesServerID = self->_lastSeenProfileCustomFavoritesServerID;
  self->_lastSeenProfileCustomFavoritesServerID = v4;

  if ((!self->_lastSeenProfileCustomFavoritesServerID
     || !-[StartPageController _setFavoritesListToFolderWithServerID:](self, "_setFavoritesListToFolderWithServerID:"))
    && -[WebBookmarkList folderID](self->_favoritesList, "folderID") != self->_favoritesFolderIDForDefaultProfile)
  {
    favoritesList = self->_favoritesList;
    self->_favoritesList = 0;

    customFavoritesFolderBookmark = self->_customFavoritesFolderBookmark;
    self->_customFavoritesFolderBookmark = 0;

  }
}

- (id)_bookmarkSectionForBookmark:(id)a3 orList:(id)a4 forFavoritesSection:(BOOL)a5 forScopedFavoritesSection:(BOOL)a6 sectionTitle:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  BOOL v50;
  id from;
  _QWORD v52[4];
  id v53;
  BOOL v54;
  _QWORD v55[4];
  id v56;
  id v57;
  BOOL v58;
  id location[2];

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!v12
    || (-[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", objc_msgSend(v12, "identifier")),
        v15 = objc_claimAutoreleasedReturnValue(),
        v13,
        (v13 = (id)v15) != 0))
  {
    objc_msgSend(v13, "bookmarkArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[StartPageController effectiveUpdatePolicy](self, "effectiveUpdatePolicy") == 1)
      {
        if ((unint64_t)objc_msgSend(v16, "count") <= 0xC)
          v17 = objc_msgSend(v16, "count");
        else
          v17 = 12;
        objc_msgSend(v16, "subarrayWithRange:", 0, v17);
        v30 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v30;
      }
      if (v8)
        goto LABEL_16;
      v20 = (id)*MEMORY[0x1E0D8B600];
    }
    else
    {
      if (v8)
      {
LABEL_16:
        v20 = (id)*MEMORY[0x1E0D8B670];
        v46 = v16;
        if (v14)
        {
          v44 = v14;
        }
        else
        {
          WBSStartPageSectionIdentifierTitle();
          v44 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_26;
      }
      objc_msgSend(v12, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(v13, "bookmarkArray");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUID");
        v32 = objc_claimAutoreleasedReturnValue();

        v20 = (id)v32;
      }

    }
    v46 = v16;
    if (v12)
      objc_msgSend(v12, "localizedTitle");
    else
      -[StartPageController _favoritesSectionTitle](self, "_favoritesSectionTitle");
    v44 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    if (v12)
    {
      if (!v9)
        goto LABEL_33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

      if (!v9)
        goto LABEL_33;
    }
    if (!v8)
    {
      -[StartPageController _effectiveProfile](self, "_effectiveProfile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "kind");

      if (v36 == 1)
      {
LABEL_34:
        objc_initWeak(location, self);
        v38 = (void *)MEMORY[0x1E0D8A740];
        _WBSLocalizedString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke;
        v55[3] = &unk_1E9CFB470;
        objc_copyWeak(&v57, location);
        v58 = v8;
        v56 = v13;
        objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v39, v40, 0, v55);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v57);
        objc_destroyWeak(location);
        v20 = v43;
LABEL_35:
        objc_msgSend(MEMORY[0x1E0D8ACC0], "iconSectionWithIdentifier:title:actions:banner:supplementaryAction:identifiers:configurationProvider:", v20, v44, v33, 0, v37, v46, &__block_literal_global_76);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[StartPageController _setUpContextMenuForBookmarksSection:](self, "_setUpContextMenuForBookmarksSection:", v29);
        -[StartPageController _setUpDragItemProviderForBookmarksSection:](self, "_setUpDragItemProviderForBookmarksSection:", v29);
        if (v9)
        {
          -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v29);
        }
        else if (!v8)
        {
LABEL_40:

          goto LABEL_41;
        }
        if (!isRestricted)
        {
          objc_initWeak(location, v29);
          v41 = MEMORY[0x1E0C809B0];
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_4;
          v52[3] = &unk_1E9CFB500;
          objc_copyWeak(&v53, location);
          v54 = v8;
          objc_msgSend(v29, "setDropOperationProvider:", v52);
          objc_initWeak(&from, self);
          v47[0] = v41;
          v47[1] = 3221225472;
          v47[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_6;
          v47[3] = &unk_1E9CFB578;
          objc_copyWeak(&v49, &from);
          v48 = v13;
          v50 = v8;
          objc_msgSend(v29, "setDropHandler:", v47);

          objc_destroyWeak(&v49);
          objc_destroyWeak(&from);
          objc_destroyWeak(&v53);
          objc_destroyWeak(location);
          v20 = v43;
        }
        goto LABEL_40;
      }
LABEL_32:
      v37 = 0;
      goto LABEL_35;
    }
LABEL_33:
    if (v8)
      goto LABEL_34;
    goto LABEL_32;
  }
  v21 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  emptyBookmarksSection();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v29;
}

- (int64_t)effectiveUpdatePolicy
{
  int64_t result;

  result = self->_updatePolicy;
  if (!result)
    return 2 * (-[NSMutableArray count](self->_cachedSections, "count") == 0);
  return result;
}

- (id)_tabGroupScopedFavoritesSection
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  WebBookmarkList *v7;
  WebBookmarkList *tabGroupScopedFavoritesList;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[StartPageController isTabGroupFavoritesSectionEnabled](self, "isTabGroupFavoritesSectionEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "activeTabGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsTabGroupFavorites");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "topScopedBookmarkListForActiveTabGroup");
      v7 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
      tabGroupScopedFavoritesList = self->_tabGroupScopedFavoritesList;
      self->_tabGroupScopedFavoritesList = v7;

      objc_msgSend(v4, "activeTabGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:](self, "_bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:", 0, self->_tabGroupScopedFavoritesList, 0, 1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)isTabGroupFavoritesSectionEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[StartPageController _effectiveProfile](self, "_effectiveProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "kind");

  if (v4 == 1)
  {
    -[StartPageController _effectiveProfile](self, "_effectiveProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingForKey:", *MEMORY[0x1E0D8B5A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D8B5A8]);
  }

  return v7;
}

- (void)_setUpDragItemProviderForBookmarksSection:(id)a3
{
  objc_msgSend(a3, "setDragItemProvider:", &__block_literal_global_99_0);
}

- (void)_setUpContextMenuForBookmarksSection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke;
  v13[3] = &unk_1E9CFB660;
  v13[4] = self;
  objc_msgSend(v4, "setContextMenuProvider:", v13);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_2;
  v10[3] = &unk_1E9CFB688;
  objc_copyWeak(&v12, &location);
  v7 = v6;
  v11 = v7;
  objc_msgSend(v4, "setContextMenuCommitHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_3;
  v8[3] = &unk_1E9CFB6B0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setContextMenuDismissHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)_favoritesSectionTitle
{
  void *v3;
  WebBookmark *customFavoritesFolderBookmark;
  void *v5;
  void *v6;
  id v7;

  WBSStartPageSectionIdentifierTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  customFavoritesFolderBookmark = self->_customFavoritesFolderBookmark;
  if (customFavoritesFolderBookmark)
  {
    if ((-[WebBookmark isBookmarksBarFolder](customFavoritesFolderBookmark, "isBookmarksBarFolder") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[WebBookmark title](self->_customFavoritesFolderBookmark, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", v3) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v5, v3);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }

  }
  v7 = v3;
LABEL_9:

  return v7;
}

- (id)_siriSuggestionsSection
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *siriSuggestions;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) != 0
    || !-[NSArray count](self->_siriSuggestions, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0D8ACC0];
    objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    siriSuggestions = self->_siriSuggestions;
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__StartPageController__siriSuggestionsSection__block_invoke;
    v16[3] = &unk_1E9CFBBB8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v3, "cardSectionWithIdentifier:actions:banner:identifiers:configurationProvider:", *MEMORY[0x1E0D8B660], v5, 0, siriSuggestions, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_2;
    v14[3] = &unk_1E9CFBBE0;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "setContextMenuProvider:", v14);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_7;
    v12[3] = &unk_1E9CFBC08;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "setContextMenuCommitHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_9;
    v10[3] = &unk_1E9CFB6B0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "setContextMenuDismissHandler:", v10);
    objc_msgSend(v8, "setDragItemProvider:", &__block_literal_global_229);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (BOOL)startPageViewControllerShouldShowSearchField:(id)a3
{
  return -[NSString isEqualToString:](self->_libraryType, "isEqualToString:", CFSTR("CloudTabsCollection"));
}

- (BOOL)startPageViewController:(id)a3 isSectionExpanded:(id)a4
{
  id v6;
  id v7;
  NSString *libraryType;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  libraryType = self->_libraryType;
  if (libraryType && !-[NSString isEqualToString:](libraryType, "isEqualToString:", CFSTR("BookmarksCollection")))
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v7, "expandsModally") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryForKey:", CFSTR("startPageExpansionDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "safari_BOOLForKey:", v12);

  }
  return v9;
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  objc_msgSend(v6, "setIconFromBookmark:", v4);
}

- (void)updateTabGroupHeading
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isSyncable"))
  {
    -[WBSStartPageSection title](self->_cachedTabGroupHeadingSection, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

    if ((v7 & 1) == 0)
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 0);
  }

}

uint64_t __43__StartPageController__cloudTabsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cloudTabsDidChange");
}

- (void)_reloadPrivacyReportSection
{
  SFStartPageViewController *viewController;
  id v3;

  viewController = self->_viewController;
  -[StartPageController _privacyReportSection](self, "_privacyReportSection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFStartPageViewController reloadSection:animated:](viewController, "reloadSection:animated:");

}

- (id)_privacyReportSection
{
  void *v3;
  char v4;
  id WeakRetained;
  void *v6;
  int64_t cachedNumberOfTrackers;
  uint64_t v8;
  WBSPrivacyReportData *privacyReportData;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "initialized");

  if ((v4 & 1) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_initWeak(&location, WeakRetained);
  v6 = (void *)MEMORY[0x1E0D8ACA8];
  cachedNumberOfTrackers = self->_cachedNumberOfTrackers;
  v8 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  privacyReportData = self->_privacyReportData;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __44__StartPageController__privacyReportSection__block_invoke;
  v16 = &unk_1E9CF39C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "privacyReportBannerWithNumberOfTrackers:privateBrowsingEnabled:privacyReportData:selectionHandler:", cachedNumberOfTrackers, v8, privacyReportData, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8ACC0], "bannerSectionWithIdentifier:banner:", *MEMORY[0x1E0D8B630], v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_updateStartPageSectionManager
{
  id WeakRetained;
  void *v4;
  void *v5;
  WBSStartPageSectionManager *v6;
  id v7;
  void *v8;
  void *v9;
  WBSStartPageSectionManager *v10;
  WBSStartPageSectionManager *startPageSectionManager;
  void *v12;
  uint64_t v13;
  FrequentlyVisitedSitesController *frequentlyVisitedSitesController;
  WBSStartPageSectionManager *v15;

  v15 = self->_startPageSectionManager;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSafariProfilesEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activeProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0D8AB40]);
      +[Application sharedApplication](Application, "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tabGroupManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v7, "initWithProfileIdentifier:tabGroupManager:", v4, v9);

    }
    v10 = (WBSStartPageSectionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ACC8]), "initWithStorage:", v5);
    startPageSectionManager = self->_startPageSectionManager;
    self->_startPageSectionManager = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8ACC8], "defaultManager");
    v6 = (WBSStartPageSectionManager *)objc_claimAutoreleasedReturnValue();
    v4 = self->_startPageSectionManager;
    self->_startPageSectionManager = v6;
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D8B628];
  objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0D8B628], v15);
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__sectionsDidChange_, v13, self->_startPageSectionManager);
  frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  self->_frequentlyVisitedSitesController = 0;

  -[StartPageController _cloudTabsDidChange](self, "_cloudTabsDidChange");
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled"))
    -[StartPageController _updateRecentCloudTabsSection](self, "_updateRecentCloudTabsSection");
  else
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);

}

- (void)updatePolicyDidChange
{
  id WeakRetained;
  int64_t updatePolicy;
  int64_t v5;
  WebBookmarkList *cachedFavoritesList;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  updatePolicy = self->_updatePolicy;
  v7 = WeakRetained;
  v5 = objc_msgSend(WeakRetained, "updatePolicyForStartPageController:", self);
  if (updatePolicy != v5)
  {
    self->_updatePolicy = v5;
    if (-[StartPageController effectiveUpdatePolicy](self, "effectiveUpdatePolicy") == 2)
    {
      cachedFavoritesList = self->_cachedFavoritesList;
      self->_cachedFavoritesList = 0;

    }
    if (-[StartPageController effectiveUpdatePolicy](self, "effectiveUpdatePolicy"))
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
  }

}

- (void)_frequentlyVisitedSitesDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled", a3) & 1) == 0)
  {
    -[WBSStartPageSectionManager sectionForIdentifier:](self->_startPageSectionManager, "sectionForIdentifier:", *MEMORY[0x1E0D8B608]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEnabled");

    if ((v5 & 1) != 0)
    {
      if (!objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall")
        || (objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("SkipRecomputingFrequentlyVisitedSitesFromHistory")),
            v6,
            (v7 & 1) == 0))
      {
        -[StartPageController frequentlyVisitedSitesController](self, "frequentlyVisitedSitesController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recomputeFrequentlyVisitedSitesIfNecessary");

      }
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
    }
  }
}

- (id)_frequentlyVisitedSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[StartPageController frequentlyVisitedSitesController](self, "frequentlyVisitedSitesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frequentlyVisitedSites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0D8ACC0];
    objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconSectionWithIdentifier:actions:banner:supplementaryAction:identifiers:configurationProvider:", *MEMORY[0x1E0D8B608], v7, 0, 0, v4, &__block_literal_global_82_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 2, 0));
    -[StartPageController _setUpContextMenuForBookmarksSection:](self, "_setUpContextMenuForBookmarksSection:", v8);
    -[StartPageController _setUpDragItemProviderForBookmarksSection:](self, "_setUpDragItemProviderForBookmarksSection:", v8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController
{
  FrequentlyVisitedSitesController *frequentlyVisitedSitesController;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  FrequentlyVisitedSitesController *v8;
  FrequentlyVisitedSitesController *v9;

  frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  if (!frequentlyVisitedSitesController)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "historyController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activeProfileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frequentlyVisitedSitesControllerForProfileIdentifier:loadIfNeeded:", v7, 1);
    v8 = (FrequentlyVisitedSitesController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_frequentlyVisitedSitesController;
    self->_frequentlyVisitedSitesController = v8;

    frequentlyVisitedSitesController = self->_frequentlyVisitedSitesController;
  }
  return frequentlyVisitedSitesController;
}

- (void)_cloudTabsDidChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  WBSStartPageSection *v10;
  WBSStartPageSection *cachedCloudTabsSection;
  WBSStartPageSection *v12;
  uint8_t v13[16];

  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled") & 1) == 0)
  {
    -[WBSStartPageSectionManager sectionForIdentifier:](self->_startPageSectionManager, "sectionForIdentifier:", *MEMORY[0x1E0D8B5F8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEnabled");

    if ((v4 & 1) != 0)
    {
      -[StartPageController _selectedCloudTabsDevice](self, "_selectedCloudTabsDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSStartPageSection itemIdentifiers](self->_cachedCloudTabsSection, "itemIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = WBSIsEqual();

      if ((v8 & 1) == 0)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "Updating iCloud Tabs for selected device in Start Page", v13, 2u);
        }
        -[StartPageController _cloudTabsSectionWithDevice:](self, "_cloudTabsSectionWithDevice:", v5);
        v10 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
        cachedCloudTabsSection = self->_cachedCloudTabsSection;
        self->_cachedCloudTabsSection = v10;

        -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
      }

    }
    else
    {
      v12 = self->_cachedCloudTabsSection;
      self->_cachedCloudTabsSection = 0;

    }
  }
}

- (id)_selectedCloudTabsDevice
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  -[StartPageController _cloudTabDevices](self, "_cloudTabDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D4F210];
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0D4F210]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke;
      v18[3] = &unk_1E9CFBB40;
      v19 = v6;
      objc_msgSend(v4, "safari_modifyDictionaryForKey:block:", v5, v18);

    }
    objc_msgSend(v4, "dictionaryForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[StartPageController _lastCloudDeviceProfileKey](self, "_lastCloudDeviceProfileKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_6;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke_2;
    v16[3] = &unk_1E9CFBB68;
    v17 = v11;
    objc_msgSend(v3, "safari_firstObjectPassingTest:", v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_6:
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __47__StartPageController__selectedCloudTabsDevice__block_invoke_3;
      v14[3] = &unk_1E9CFBA00;
      v14[4] = self;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      objc_msgSend(v4, "safari_modifyDictionaryForKey:block:", v5, v14);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_cloudTabDevices
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  -[StartPageController _cloudTabStore](self, "_cloudTabStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncedRemoteCloudTabDevicesForProfileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cloudTabStore
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "cloudTabStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)cloudTabsSections
{
  void *v3;
  void *v4;
  WBSRecentsStore *v5;
  WBSRecentsStore *recentsStore;
  void *v7;
  id v8;
  id WeakRetained;
  char v10;
  char v11;
  WBSStartPageSection *v12;
  void *v13;
  WBSStartPageSection *v14;
  WBSStartPageSection *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *availableDevices;
  WBSStartPageSection *cachedCloudTabsSection;
  WBSStartPageSection *v32;
  WBSStartPageSection *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id location;
  _QWORD v45[5];
  _QWORD v46[5];
  WBSStartPageSection *v47;
  void *v48;
  void *v49;
  WBSStartPageSection *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recentsStoreForProfileWithIdentifier:", v4);
    v5 = (WBSRecentsStore *)objc_claimAutoreleasedReturnValue();
    recentsStore = self->_recentsStore;
    self->_recentsStore = v5;

    -[StartPageController _updateRecentItemsAndDevices](self, "_updateRecentItemsAndDevices");
    if (-[StartPageController _shouldShowConsentUI](self, "_shouldShowConsentUI"))
    {
      -[StartPageController _cloudTabsConsentSection](self, "_cloudTabsConsentSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      return (NSArray *)v8;
    }
    if (self->_libraryType)
    {
      if (!-[NSArray count](self->_availableDevices, "count") && self->_libraryType)
      {
LABEL_35:
        v8 = 0;
        return (NSArray *)v8;
      }
      availableDevices = self->_availableDevices;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __40__StartPageController_cloudTabsSections__block_invoke;
      v46[3] = &unk_1E9CFB8A0;
      v46[4] = self;
      -[NSArray safari_mapObjectsUsingBlock:](availableDevices, "safari_mapObjectsUsingBlock:", v46);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      cachedCloudTabsSection = self->_cachedCloudTabsSection;
      if (!cachedCloudTabsSection)
      {
        -[StartPageController _recentCloudTabsSection](self, "_recentCloudTabsSection");
        v32 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
        v33 = self->_cachedCloudTabsSection;
        self->_cachedCloudTabsSection = v32;

        cachedCloudTabsSection = self->_cachedCloudTabsSection;
        if (!cachedCloudTabsSection)
          goto LABEL_35;
      }
      v50 = cachedCloudTabsSection;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
LABEL_29:
    v8 = (id)v16;
    return (NSArray *)v8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v10 = objc_msgSend(WeakRetained, "canShowSidebar");

  if (self->_libraryType)
    v11 = 0;
  else
    v11 = v10;
  if ((v11 & 1) != 0)
  {
    v12 = self->_cachedCloudTabsSection;
    if (!v12)
    {
      -[StartPageController _selectedCloudTabsDevice](self, "_selectedCloudTabsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[StartPageController _cloudTabsSectionWithDevice:](self, "_cloudTabsSectionWithDevice:", v13);
      v14 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
      v15 = self->_cachedCloudTabsSection;
      self->_cachedCloudTabsSection = v14;

      v12 = self->_cachedCloudTabsSection;
      if (!v12)
        goto LABEL_35;
    }
    v47 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  -[StartPageController _cloudTabDevices](self, "_cloudTabDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18 || !self->_libraryType)
  {
    v19 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __40__StartPageController_cloudTabsSections__block_invoke_2;
    v45[3] = &unk_1E9CFB8A0;
    v45[4] = self;
    objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    if (v18 < 5)
      v22 = 1;
    else
      v22 = v10;
    if ((v22 & 1) == 0)
    {
      objc_msgSend(v21, "removeObjectsInRange:", 4, v18 - 4);
      objc_initWeak(&location, self);
      v23 = (void *)MEMORY[0x1E0D8A740];
      _WBSLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v19;
      v42[1] = 3221225472;
      v42[2] = __40__StartPageController_cloudTabsSections__block_invoke_3;
      v42[3] = &unk_1E9CF39C8;
      objc_copyWeak(&v43, &location);
      objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v24, v25, 0, v42);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0D8ACC0];
      v49 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "actionSectionWithIdentifier:actions:", CFSTR("showAllCloudDevices"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v29);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    if (!objc_msgSend(v21, "count") && self->_searchPattern && self->_libraryType)
    {
      v35 = (void *)MEMORY[0x1E0D8ACA8];
      _WBSLocalizedString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", v38, self->_searchPattern);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bannerWithImage:title:message:interactive:dismissHandler:", 0, v36, v39, 0, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8ACC0], "bannerSectionWithIdentifier:title:banner:", *MEMORY[0x1E0D8B5F8], &stru_1E9CFDBB0, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v21;
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (void)_highlightsDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled", a3) & 1) == 0)
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
}

- (void)setLibraryType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  WBSRecentCloudTabsProvider *v19;
  WBSRecentCloudTabsProvider *recentCloudTabsProvider;
  void *v21;
  void *v22;
  void *v23;
  WBSRecentsStore *v24;
  WBSRecentsStore *recentsStore;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != obj)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("ProfileDidChange"), WeakRetained);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateStartPageSectionManager, CFSTR("ProfileDidChange"), obj);
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[StartPageController updatePolicyDidChange](self, "updatePolicyDidChange");
    -[StartPageController _updateStartPageSectionManager](self, "_updateStartPageSectionManager");
    v6 = objc_msgSend(obj, "isPrivateBrowsingEnabled");
    v7 = v6;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "safari_enableAdvancedPrivacyProtections:", 1);

      self->_privateBrowsingWasEnabled = v7;
      if (v9)
      {
        self->_cachedNumberOfTrackers = objc_msgSend(MEMORY[0x1E0D8A878], "totalBlockedTrackerCount");
LABEL_9:
        v17 = objc_alloc(MEMORY[0x1E0D8AB90]);
        -[StartPageController _cloudTabStore](self, "_cloudTabStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (WBSRecentCloudTabsProvider *)objc_msgSend(v17, "initWithCloudTabDeviceProvider:", v18);
        recentCloudTabsProvider = self->_recentCloudTabsProvider;
        self->_recentCloudTabsProvider = v19;

        -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSRecentCloudTabsProvider setActiveProfileIdentifier:](self->_recentCloudTabsProvider, "setActiveProfileIdentifier:", v21);

        +[Application sharedApplication](Application, "sharedApplication");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "recentsStoreForProfileWithIdentifier:", v23);
        v24 = (WBSRecentsStore *)objc_claimAutoreleasedReturnValue();
        recentsStore = self->_recentsStore;
        self->_recentsStore = v24;

        -[StartPageController _updateRecentItemsAndDevices](self, "_updateRecentItemsAndDevices");
        goto LABEL_10;
      }
    }
    else
    {
      self->_privateBrowsingWasEnabled = v6;
    }
    v10 = (void *)MEMORY[0x1E0D8AB00];
    -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedNumberOfTrackersOnStartPageForProfileWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D4F200];
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerForKey:", *MEMORY[0x1E0D4F200]));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v15);

    }
    self->_cachedNumberOfTrackers = objc_msgSend(v12, "integerValue");

    goto LABEL_9;
  }
LABEL_10:

}

- (StartPageController)init
{
  void *v3;
  StartPageController *v4;

  objc_msgSend(MEMORY[0x1E0D4EC50], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[StartPageController initWithVisualStyleProvider:](self, "initWithVisualStyleProvider:", v3);

  return v4;
}

- (id)_recentlyClosedTabsSection
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController _recentlyClosedTabsForProfile:](self, "_recentlyClosedTabsForProfile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D8A740];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke;
    v23[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("StartPageSectionClearAllButton"));
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D8ACC0];
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "listSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", *MEMORY[0x1E0D8B658], v11, v14, 0, v6, &__block_literal_global_128);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v15);
    objc_msgSend(v15, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 5, 0));
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_3;
    v21[3] = &unk_1E9CFB810;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v15, "setContextMenuProvider:", v21);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_13;
    v19[3] = &unk_1E9CFB838;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "setContextMenuCommitHandler:", v19);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_15;
    v17[3] = &unk_1E9CFB6B0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "setContextMenuDismissHandler:", v17);
    objc_msgSend(v15, "setDragItemProvider:", &__block_literal_global_159_0);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_recentlyClosedTabsForProfile:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTabGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recentlyClosedTabsForProfileWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__StartPageController__recentlyClosedTabsForProfile___block_invoke;
  v15[3] = &unk_1E9CFB758;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)libraryType
{
  return self->_libraryType;
}

- (id)_highlightsSection
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id WeakRetained;
  char v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  char v44;
  _QWORD v45[5];
  id v46;
  id v47;
  char v48;
  _QWORD v49[4];
  id v50;
  id v51;
  StartPageController *v52;
  id v53;
  char v54;
  char v55;
  id location;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  +[Application sharedApplication](Application, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highlightManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v4;
  objc_msgSend(v4, "highlights");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();
  v6 = v32;
  v7 = (id)*MEMORY[0x1E0D8B610];
  +[Application sharedApplication](Application, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeProfileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionsManagerForProfileIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v11;
  objc_msgSend(v11, "suggestions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") ^ 1 | v5;
  if ((v12 & 1) != 0)
  {
    v13 = v6;
  }
  else
  {
    v13 = v33;

    v14 = (id)*MEMORY[0x1E0D8B668];
    v7 = v14;
  }
  v37 = v7;
  v34 = v13;
  if (objc_msgSend(v13, "count"))
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v16 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");

    v17 = (void *)MEMORY[0x1E0D8ACC0];
    if ((v5 & 1) != 0)
    {
      v18 = (void *)MEMORY[0x1E0C9AA60];
      v19 = &stru_1E9CFDBB0;
    }
    else
    {
      WBSStartPageSectionIdentifierTitle();
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v57[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __41__StartPageController__highlightsSection__block_invoke;
    v49[3] = &unk_1E9CFBE78;
    v54 = v12 ^ 1;
    v50 = v35;
    v26 = v36;
    v51 = v26;
    v52 = self;
    objc_copyWeak(&v53, &location);
    v55 = v16;
    objc_msgSend(v17, "attributedRichLinkSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v37, v19, v18, 0, v34, v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) == 0)
    {

    }
    objc_msgSend(v27, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, 0));
    objc_msgSend(v27, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, 1));
    objc_msgSend(v27, "setMaximumNumberOfPages:", 4);
    objc_msgSend(v27, "setExpandsModally:", 1);
    v45[0] = v25;
    v45[1] = 3221225472;
    v45[2] = __41__StartPageController__highlightsSection__block_invoke_5;
    v45[3] = &unk_1E9CFBF18;
    v45[4] = self;
    objc_copyWeak(&v47, &location);
    v28 = v26;
    v46 = v28;
    v48 = v16;
    objc_msgSend(v27, "setContextMenuProvider:", v45);
    objc_msgSend(v27, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v40[1] = 3221225472;
    v40[2] = __41__StartPageController__highlightsSection__block_invoke_2_263;
    v40[3] = &unk_1E9CFBF68;
    objc_copyWeak(&v43, &location);
    v30 = v29;
    v41 = v30;
    v42 = v28;
    v44 = v16;
    objc_msgSend(v27, "setContextMenuCommitHandler:", v40);
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __41__StartPageController__highlightsSection__block_invoke_4_266;
    v38[3] = &unk_1E9CFB6B0;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v27, "setContextMenuDismissHandler:", v38);
    objc_msgSend(v27, "setDragItemProvider:", &__block_literal_global_269);
    v24 = v27;
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }
  else if (v5)
  {
    v20 = (void *)MEMORY[0x1E0D8ACA8];
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("shared.with.you"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bannerWithImage:title:message:interactive:dismissHandler:", v21, &stru_1E9CFDBB0, v22, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8ACC0], "bannerSectionWithIdentifier:title:banner:", v7, &stru_1E9CFDBB0, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)updatePrivacyReportIfEnabled
{
  if (-[NSMutableArray safari_containsObjectPassingTest:](self->_cachedSections, "safari_containsObjectPassingTest:", &__block_literal_global_108))-[StartPageController _updatePrivacyReportData](self, "_updatePrivacyReportData");
}

void __47__StartPageController__updatePrivacyReportData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_privacyReportDataDidChange");

}

- (void)_privacyReportDataDidChange
{
  void *v3;
  int v4;
  int64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_enableAdvancedPrivacyProtections:", 1);

  if (!v4)
  {
LABEL_5:
    -[WBSPrivacyReportData knownTrackers](self->_privacyReportData, "knownTrackers");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "count");

    v6 = 0;
    goto LABEL_6;
  }
  v5 = objc_msgSend(MEMORY[0x1E0D8A878], "totalBlockedTrackerCount");
  v6 = 1;
LABEL_6:
  if (v5 != self->_cachedNumberOfTrackers)
  {
    self->_cachedNumberOfTrackers = v5;
    -[StartPageController _reloadPrivacyReportSection](self, "_reloadPrivacyReportSection");
    if ((v6 & 1) == 0)
    {
      -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v12 = v7;
        v8 = (void *)MEMORY[0x1E0D8AB00];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCachedNumberOfTrackersOnStartPage:forProfileWithIdentifier:", v9, v12);

        v7 = v12;
      }

    }
  }
}

- (void)_privacyProxyStateDidChange
{
  void *WeakRetained;
  int64_t privateBrowsingExplanationState;
  SFStartPageViewController *viewController;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
    goto LABEL_4;
  privateBrowsingExplanationState = self->_privateBrowsingExplanationState;

  if (privateBrowsingExplanationState != 1)
  {
    viewController = self->_viewController;
    -[StartPageController _privateBrowsingExplanationSection](self, "_privateBrowsingExplanationSection");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageViewController reloadSection:animated:](viewController, "reloadSection:animated:", WeakRetained, 0);
LABEL_4:

  }
  -[StartPageController _reloadPrivacyReportSection](self, "_reloadPrivacyReportSection");
}

- (void)_updatePrivacyReportData
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  WBSPrivacyReportData *v17;
  WBSPrivacyReportData *privacyReportData;
  WBSPrivacyReportData *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WBSPrivacyReportData *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safari_enableAdvancedPrivacyProtections:", 1);

    if (v5)
    {
      -[StartPageController _privacyReportDataDidChange](self, "_privacyReportDataDidChange");
      return;
    }
  }
  else
  {

  }
  objc_initWeak(&location, self);
  -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPrivacyReportData profileIdentifiers](self->_privacyReportData, "profileIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
  {

LABEL_9:
    +[Application sharedApplication](Application, "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "historyController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "historyForProfileIdentifier:loadIfNeeded:", v6, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0D8AB00]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (WBSPrivacyReportData *)objc_msgSend(v14, "initWithProfileIdentifiers:histories:", v15, v16);
      privacyReportData = self->_privacyReportData;
      self->_privacyReportData = v17;

      self->_cachedNumberOfTrackers = 0;
    }

    goto LABEL_13;
  }
  -[WBSPrivacyReportData profileIdentifiers](self->_privacyReportData, "profileIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
    goto LABEL_9;
LABEL_13:
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled"))
  {
    v19 = self->_privacyReportData;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __47__StartPageController__updatePrivacyReportData__block_invoke;
    v27[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v28, &location);
    -[WBSPrivacyReportData loadDataWithCompletionHandler:](v19, "loadDataWithCompletionHandler:", v27);
    objc_destroyWeak(&v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateByAddingUnit:value:toDate:options:", 16, -7, v20, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self->_privacyReportData;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_3;
    v25[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v26, &location);
    -[WBSPrivacyReportData loadDataFromStartDate:toEndDate:withCompletionHandler:](v24, "loadDataFromStartDate:toEndDate:withCompletionHandler:", v22, v23, v25);
    objc_destroyWeak(&v26);

  }
  objc_destroyWeak(&location);
}

- (id)_readingListSection
{
  WebBookmarkList *readingList;
  WebBookmarkList *v4;
  WebBookmarkList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  readingList = self->_readingList;
  if (!readingList)
  {
    -[WebBookmarkCollection readingListWithUnreadOnly:filteredUsingString:](self->_bookmarkCollection, "readingListWithUnreadOnly:filteredUsingString:", 0, 0);
    v4 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
    v5 = self->_readingList;
    self->_readingList = v4;

    readingList = self->_readingList;
  }
  if (-[WebBookmarkList bookmarkCount](readingList, "bookmarkCount"))
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D8ACC0];
    objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkList bookmarkArrayRequestingCount:](self->_readingList, "bookmarkArrayRequestingCount:", 50);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__StartPageController__readingListSection__block_invoke;
    v15 = &unk_1E9CFB5E8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v6, "cardSectionWithIdentifier:actions:banner:identifiers:configurationProvider:", *MEMORY[0x1E0D8B650], v8, 0, v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setExpandsModally:", 1, v12, v13, v14, v15);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024ReadingListEnabled"))
    {
      objc_msgSend(v10, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 0));
      objc_msgSend(v10, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 1));
      objc_msgSend(v10, "setMaximumNumberOfPages:", 4);
    }
    -[StartPageController _setUpContextMenuForBookmarksSection:](self, "_setUpContextMenuForBookmarksSection:", v10);
    -[StartPageController _setUpDragItemProviderForBookmarksSection:](self, "_setUpDragItemProviderForBookmarksSection:", v10);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (StartPageController)initWithVisualStyleProvider:(id)a3
{
  id v5;
  StartPageController *v6;
  uint64_t v7;
  WebBookmarkCollection *bookmarkCollection;
  void *v9;
  uint64_t v10;
  ReadingListLeadImageCache *readingListLeadImageCache;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSRelativeDateTimeFormatter *relativeDateFormatter;
  NSArray *siriSuggestions;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  WBSUserDefaultObservation *selectedCloudDeviceObservation;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  WBSUserDefaultObservation *tabGroupFavoritesObservation;
  StartPageController *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)StartPageController;
  v6 = -[StartPageController init](&v41, sel_init);
  if (v6)
  {
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)&v6->_visualStyleProvider, a3);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    bookmarkCollection = v6->_bookmarkCollection;
    v6->_bookmarkCollection = (WebBookmarkCollection *)v7;

    +[Application sharedApplication](Application, "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readingListLeadImageCache");
    v10 = objc_claimAutoreleasedReturnValue();
    readingListLeadImageCache = v6->_readingListLeadImageCache;
    v6->_readingListLeadImageCache = (ReadingListLeadImageCache *)v10;

    -[StartPageController _updateStartPageSectionManager](v6, "_updateStartPageSectionManager");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__cloudTabsDidChange_, CFSTR("CloudTabStoreDidUpdateNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__bookmarkFolderDidChange_, *MEMORY[0x1E0DCCC10], v6->_bookmarkCollection);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__bookmarksDidReload_, *MEMORY[0x1E0DCCC00], v6->_bookmarkCollection);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__bookmarksDidReload_, *MEMORY[0x1E0DCCC48], v6->_bookmarkCollection);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__frequentlyVisitedSitesDidChange_, *MEMORY[0x1E0D8B0A8], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__refreshSiriSuggestions, *MEMORY[0x1E0D8B090], 0);
    objc_msgSend(MEMORY[0x1E0D8A990], "existingSharedHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__historyWasAltered, *MEMORY[0x1E0D8B0E8], v13);

    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__historyWasCleared_, *MEMORY[0x1E0D8B0F8], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__readingListBookmarkMetadataDidUpdate_, CFSTR("ReadingListBookmarkMetadataDidUpdateNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__contentBlockerStatisticsStoreDidClose, *MEMORY[0x1E0D8AF58], 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__recentCloudTabItemsDidRebuild_, *MEMORY[0x1E0D8B360], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__recentCloudTabItemsDidReceiveMetadata_, *MEMORY[0x1E0D8B368], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__suggestionsDidChange_, *MEMORY[0x1E0D8B680], 0);

    objc_msgSend(MEMORY[0x1E0CB38F0], "safari_suggestionsRelativeDateTimeFormatter");
    v17 = objc_claimAutoreleasedReturnValue();
    relativeDateFormatter = v6->_relativeDateFormatter;
    v6->_relativeDateFormatter = (NSRelativeDateTimeFormatter *)v17;

    siriSuggestions = v6->_siriSuggestions;
    v6->_siriSuggestions = (NSArray *)MEMORY[0x1E0C9AA60];

    -[StartPageController updatePrivateBrowsingExplanationState](v6, "updatePrivateBrowsingExplanationState");
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__highlightsDidChange_, *MEMORY[0x1E0D8B0C8], 0);
    objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__privacyProxyStateDidChange, *MEMORY[0x1E0D8B2B0], v20);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D4F210];
    v23 = MEMORY[0x1E0C80D38];
    v24 = MEMORY[0x1E0C80D38];
    v25 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __51__StartPageController_initWithVisualStyleProvider___block_invoke;
    v38[3] = &unk_1E9CFB400;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v21, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v22, v23, 0, v38);
    v26 = objc_claimAutoreleasedReturnValue();
    selectedCloudDeviceObservation = v6->_selectedCloudDeviceObservation;
    v6->_selectedCloudDeviceObservation = (WBSUserDefaultObservation *)v26;

    -[StartPageController _effectiveProfile](v6, "_effectiveProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "kind");

    if (v29 != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0D8B5A8];
      v36[0] = v25;
      v36[1] = 3221225472;
      v36[2] = __51__StartPageController_initWithVisualStyleProvider___block_invoke_2;
      v36[3] = &unk_1E9CF5680;
      objc_copyWeak(&v37, &location);
      objc_msgSend(v30, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v31, MEMORY[0x1E0C80D38], 0, v36);
      v32 = objc_claimAutoreleasedReturnValue();
      tabGroupFavoritesObservation = v6->_tabGroupFavoritesObservation;
      v6->_tabGroupFavoritesObservation = (WBSUserDefaultObservation *)v32;

      objc_destroyWeak(&v37);
    }
    v34 = v6;
    objc_destroyWeak(&v39);

    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)updatePrivateBrowsingExplanationState
{
  self->_privateBrowsingExplanationState = 1;
}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    isRestricted = objc_msgSend(v2, "usesAllowedSitesOnly");

  }
}

- (void)_cloudTabsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__StartPageController__cloudTabsDidChange___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __47__StartPageController__updatePrivacyReportData__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_2;
  block[3] = &unk_1E9CF39C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __51__StartPageController_initWithVisualStyleProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cloudTabsDidChange");

}

void __51__StartPageController_initWithVisualStyleProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sectionsDidChange:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WBSUserDefaultObservation invalidate](self->_tabGroupFavoritesObservation, "invalidate");
  -[WBSUserDefaultObservation invalidate](self->_selectedCloudDeviceObservation, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestsWithTokens:", self->_siriSuggestionsMetadataTokens);

  -[WBSForYouRecommendationMediator stopListeningForURLSuggestionChanges](self->_siriSuggestionsMediator, "stopListeningForURLSuggestionChanges");
  -[NSTimer invalidate](self->_coalescedRecentCloudTabsSectionUpdateTimer, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)StartPageController;
  -[StartPageController dealloc](&v5, sel_dealloc);
}

- (void)_sectionsDidChange:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
  {
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__StartPageController__sectionsDidChange___block_invoke;
    block[3] = &unk_1E9CF31B0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __42__StartPageController__sectionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "reloadDataAnimatingDifferences:", 1);
}

- (void)_setProfileIconOnSectionIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryBrowserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMultipleProfiles");

  if ((v6 & 1) != 0)
  {
    -[StartPageController _effectiveProfile](self, "_effectiveProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "symbolImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIcon:", v8);

  }
}

- (BOOL)_setFavoritesListToFolderWithServerID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WebBookmark *v7;
  WebBookmark *v8;
  uint64_t v9;
  BOOL v10;
  WebBookmarkList *v11;
  WebBookmarkList *favoritesList;

  v4 = a3;
  -[WebBookmark serverID](self->_customFavoritesFolderBookmark, "serverID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self->_customFavoritesFolderBookmark;
  }
  else
  {
    -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self->_bookmarkCollection, "bookmarkWithServerID:excludeDeletedBookmarks:", self->_lastSeenProfileCustomFavoritesServerID, 1);
    v7 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = -[WebBookmark identifier](v7, "identifier");
  if (-[WebBookmarkList folderID](self->_favoritesList, "folderID") == (_DWORD)v9)
    goto LABEL_8;
  v10 = 0;
  if (v8 && (_DWORD)v9 != 0x7FFFFFFF)
  {
    objc_storeStrong((id *)&self->_customFavoritesFolderBookmark, v8);
    -[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", v9);
    v11 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
    favoritesList = self->_favoritesList;
    self->_favoritesList = v11;

LABEL_8:
    v10 = 1;
  }

  return v10;
}

- (id)_tabGroupHeadingSection
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D8ACC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headingSectionWithIdentifier:title:", *MEMORY[0x1E0D8B688], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUsesLargeTitle:", 1);
  return v7;
}

- (void)setTabGroupFavoritesSectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  BOOL v14;

  v3 = a3;
  -[StartPageController _effectiveProfile](self, "_effectiveProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "kind");

  if (v6 == 1)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabGroupManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[StartPageController _effectiveProfile](self, "_effectiveProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__StartPageController_setTabGroupFavoritesSectionEnabled___block_invoke;
    v13[3] = &__block_descriptor_33_e26_v16__0__WBMutableProfile_8l;
    v14 = v3;
    v11 = (id)objc_msgSend(v8, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v10, 1, v13, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBool:forKey:", v3, *MEMORY[0x1E0D8B5A8]);

  }
}

void __58__StartPageController_setTabGroupFavoritesSectionEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSetting:forKey:", v3, *MEMORY[0x1E0D8B5A8]);

}

- (void)_copyBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0DCCB98]);
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v9, objc_msgSend(v6, "collectionType"));

  if (objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync"))
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveAndMoveBookmark:toFolderID:", v10, v4);

    objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[StartPageController _copyBookmark:toFolderWithID:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__StartPageController__copyBookmark_toFolderWithID___block_invoke;
    block[3] = &unk_1E9CF31B0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didPreventBookmarkActionWithBookmarkType:actionType:", 1, 0);

  }
}

uint64_t __52__StartPageController__copyBookmark_toFolderWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320));
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 39);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_2;
    v6[3] = &unk_1E9CFB448;
    objc_copyWeak(&v8, v2);
    v9 = *(_BYTE *)(a1 + 48);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "presentBookmarkPickerWithImportHandler:", v6);

    objc_destroyWeak(&v8);
  }

}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "primaryBrowserController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(WeakRetained, "_copyBookmark:toFolderWithID:", v7, objc_msgSend(*(id *)(a1 + 32), "folderID"));
    }
  }

}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  char v13;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v5, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_5;
  v15[3] = &unk_1E9CFB4D8;
  v10 = v7;
  v16 = v10;
  v11 = objc_msgSend(v9, "safari_containsObjectPassingTest:", v15);

  v12 = 0;
  if (v8 == a2)
    v13 = v11;
  else
    v13 = 0;
  if (v8 >= a2 && (v13 & 1) == 0)
    v12 = objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_operationForDropSession:destinationSubtype:", v5, *(unsigned __int8 *)(a1 + 40));

  return v12;
}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_sf_localBookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DCCB98];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_7;
  v8[3] = &unk_1E9CFB550;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v6 = v3;
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v13 = *(_BYTE *)(a1 + 48);
  v7 = v4;
  objc_msgSend(v5, "_sf_webBookmarksFromDropSession:completionHandler:", v7, v8);

  objc_destroyWeak(&v12);
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id WeakRetained;
  id v55;
  id v56;
  id v57;
  id obj;
  void *v59;
  uint64_t v60;
  _QWORD v62[4];
  id v63;
  id v64;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v51 = v2;
  if (!objc_msgSend(v2, "count"))
    goto LABEL_54;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_53;
  objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v50, "lockBookmarks") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, *((_QWORD *)WeakRetained + 40));
    goto LABEL_52;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_8;
  v74[3] = &unk_1E9CF31B0;
  v75 = v50;
  v48 = v3;
  objc_msgSend(v3, "setHandler:", v74);
  objc_msgSend(*(id *)(a1 + 32), "destinationIndexPath");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
    goto LABEL_51;
  *((_BYTE *)WeakRetained + 112) = 1;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v52, "item");
  v4 = objc_loadWeakRetained((id *)WeakRetained + 39);
  objc_msgSend(v4, "tabGroupProvider");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "frequentlyVisitedSitesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frequentlyVisitedSites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v49);

  if (v7)
  {
    objc_msgSend(WeakRetained, "frequentlyVisitedSitesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "promoteFrequentlyVisitedSite:toFavoriteAtIndex:", v49, objc_msgSend(v52, "item"));
    goto LABEL_47;
  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "folderID");
  objc_msgSend(*(id *)(a1 + 48), "localDragSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localContext");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 40), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v55 = (id)objc_claimAutoreleasedReturnValue();

  v53 = (void *)objc_msgSend(v51, "mutableCopy");
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  v70 = 0u;
  obj = v51;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (!v12)
    goto LABEL_25;
  v13 = *(_QWORD *)v71;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v71 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      if (v56 != v55 && objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "parentID") == (_DWORD)v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "bookmarkArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "indexOfObject:", v15);
        LODWORD(v17) = v17 < objc_msgSend(v52, "item");

        v60 = (v60 - v17);
      }
      if (objc_msgSend(v15, "subtype") == 1)
      {
        if (*(_BYTE *)(a1 + 64))
          continue;
        v18 = *((id *)WeakRetained + 2);
        v19 = objc_alloc(MEMORY[0x1E0DCCB98]);
        objc_msgSend(v15, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "address");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v19, "initWithTitle:address:parentID:collectionType:", v20, v21, v9, objc_msgSend(v22, "collectionType"));

        objc_msgSend(v18, "saveBookmark:", v23);
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", objc_msgSend(v53, "indexOfObject:", v15), v23);

        goto LABEL_21;
      }
      if (*(_BYTE *)(a1 + 64))
      {
        v18 = (id)objc_msgSend(v59, "copyBookmark:toPerTabGroupBookmarkFolderWithID:", v15, v9);
        objc_msgSend(v53, "replaceObjectAtIndex:withObject:", objc_msgSend(v53, "indexOfObject:", v15), v18);
LABEL_21:

        continue;
      }
      objc_msgSend(*((id *)WeakRetained + 2), "saveAndMoveBookmark:toFolderID:", v15, v9);
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  }
  while (v12);
LABEL_25:

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v59, "perTabGroupBookmarkListForFolderID:filteredUsingString:", v9, 0);
  else
    objc_msgSend(*((id *)WeakRetained + 2), "listWithID:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v53, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v25;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v67 != v27)
          objc_enumerationMutation(v57);
        v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        if (*(_BYTE *)(a1 + 64))
        {
          objc_msgSend(v59, "perTabGroupBookmarkListForFolderID:filteredUsingString:", objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "parentID"), 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(obj, "containsObject:", v29);
          if (v31)
          {
            objc_msgSend(v30, "bookmarkArray");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "indexOfObject:", v29);

          }
          else
          {
            v33 = 0;
          }
          if ((_DWORD)v60)
          {
            objc_msgSend(*(id *)(a1 + 40), "bookmarkArray");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            v38 = v31 ^ 1;
            if (v33 >= v60)
              v38 = 1;
            objc_msgSend(v36, "objectAtIndexedSubscript:", (v60 - v38));
            v39 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v39 = 0;
          }
          objc_msgSend(v29, "UUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "reorderScopedBookmarkWithUUID:afterBookmarkWithUUID:notify:", v40, v41, 1);

        }
        else
        {
          objc_msgSend(v24, "bookmarkArray");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "indexOfObject:", v29);

          objc_msgSend(*((id *)WeakRetained + 2), "reorderList:moveBookmarkAtIndex:toIndex:", v24, v35, v60);
        }
      }
      v25 = v57;
      v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v26);
  }

  v8 = v53;
LABEL_47:

  v42 = (void *)*((_QWORD *)WeakRetained + 7);
  *((_QWORD *)WeakRetained + 7) = 0;

  objc_msgSend(*((id *)WeakRetained + 40), "reloadDataAnimatingDifferences:", 1);
  objc_msgSend(*(id *)(a1 + 48), "items");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB36B8];
  v45 = objc_msgSend(v43, "count");
  if (v45 >= objc_msgSend(v51, "count"))
    v46 = v51;
  else
    v46 = v43;
  objc_msgSend(v44, "indexSetWithIndexesInRange:", 0, objc_msgSend(v46, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_9;
  v62[3] = &unk_1E9CFB528;
  v65 = v60;
  v63 = v52;
  v64 = *(id *)(a1 + 32);
  objc_msgSend(v43, "enumerateObjectsAtIndexes:options:usingBlock:", v47, 0, v62);
  *((_BYTE *)WeakRetained + 112) = 0;

LABEL_51:
LABEL_52:

LABEL_53:
  v2 = v51;
LABEL_54:

}

uint64_t __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockBookmarksSoon");
}

void __117__StartPageController__bookmarkSectionForBookmark_orList_forFavoritesSection_forScopedFavoritesSection_sectionTitle___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(unsigned int *)(a1 + 48) + a3, objc_msgSend(*(id *)(a1 + 32), "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "dropItem:toItemAtIndexPath:", v7, v5);

}

void __48__StartPageController__frequentlyVisitedSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  objc_msgSend(v6, "setIconFromBookmark:", v4);
}

void __42__StartPageController__readingListSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024ReadingListEnabled"))
  {
    objc_msgSend(v6, "previewText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v7);

    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_URLWithDataAsString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_highLevelDomainFromHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaptionText:icon:", v12, 0);

  }
  else
  {
    objc_msgSend(v6, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_domainFromHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v14);

    objc_msgSend(v5, "setCaption:", &stru_1E9CFDBB0);
  }
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v15);

  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__StartPageController__readingListSection__block_invoke_2;
  block[3] = &unk_1E9CF41C8;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  v20 = v6;
  v21 = v5;
  v17 = v5;
  v18 = v6;
  dispatch_async(v16, block);

  objc_destroyWeak(&v22);
}

void __42__StartPageController__readingListSection__block_invoke_2(id *a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "readingListIconUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5
      || (v6 = (void *)WeakRetained[36],
          objc_msgSend(a1[4], "readingListIconUUID"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "loadImageSynchronouslyForIconUUID:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      objc_msgSend(a1[4], "iconData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(a1[4], "iconData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageWithData:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__StartPageController__readingListSection__block_invoke_3;
    v12[3] = &unk_1E9CFB5C0;
    objc_copyWeak(&v16, v2);
    v13 = v8;
    v14 = a1[5];
    v15 = a1[4];
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

    objc_destroyWeak(&v16);
  }

}

void __42__StartPageController__readingListSection__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = *(void **)(a1 + 40);
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v2, "setImage:");
    }
    else
    {
      objc_msgSend(v2, "setImageFromBookmark:", *(_QWORD *)(a1 + 48));
      objc_msgSend(WeakRetained, "_fetchMetadataIfNeededForReadingListBookmark:", *(_QWORD *)(a1 + 48));
    }
  }

}

- (void)_fetchMetadataIfNeededForReadingListBookmark:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *readingListBookmarksToMetadataStates;
  void *v10;
  id v11;

  v11 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_sf_shouldAutomaticallyDownloadReadingListItems");

    if ((v7 & 1) == 0)
    {
      if (!self->_readingListBookmarksToMetadataStates)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        readingListBookmarksToMetadataStates = self->_readingListBookmarksToMetadataStates;
        self->_readingListBookmarksToMetadataStates = v8;

      }
      if (+[ReadingListMetadataFetcher shouldFetchMetadataForBookmark:](ReadingListMetadataFetcher, "shouldFetchMetadataForBookmark:", v11))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "setObject:forKeyedSubscript:", &unk_1E9D62428, v11);
        +[ReadingListMetadataFetcher sharedMetadataFetcher](ReadingListMetadataFetcher, "sharedMetadataFetcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchMetadataForReadingListBookmark:withProvider:", v11, 0);
LABEL_9:

        goto LABEL_10;
      }
      if (+[ReadingListMetadataFetcher shouldFetchThumbnailForBookmark:](ReadingListMetadataFetcher, "shouldFetchThumbnailForBookmark:", v11))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "setObject:forKeyedSubscript:", &unk_1E9D62428, v11);
        +[ReadingListMetadataFetcher sharedMetadataFetcher](ReadingListMetadataFetcher, "sharedMetadataFetcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchThumbnailForReadingListBookmark:withProvider:", v11, 0);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (void)_contextMenuCommitHandlerForFrequentlyVisitedSite:(id)a3 animator:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  StartPageController *v16;
  id v17;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "setPreferredCommitStyle:", 1);
  objc_msgSend(v7, "previewViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __100__StartPageController__contextMenuCommitHandlerForFrequentlyVisitedSite_animator_sectionIdentifier___block_invoke;
  v15 = &unk_1E9CF3358;
  v16 = self;
  v10 = v9;
  v17 = v10;
  objc_msgSend(v7, "addAnimations:", &v12);
  if ((id)*MEMORY[0x1E0D8B600] == v8)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", v12, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didSelectFavoriteWithOpenLocation:", 0);
    goto LABEL_5;
  }
  if ((id)*MEMORY[0x1E0D8B608] == v8)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", v12, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didSelectFrequentlyVisitedSiteWithOpenLocation:", 0);
LABEL_5:

  }
}

void __100__StartPageController__contextMenuCommitHandlerForFrequentlyVisitedSite_animator_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(WeakRetained, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 40));

}

- (id)_contextMenuConfigurationForFrequentlyVisitedSite:(id)a3 previewProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC36B8];
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke;
  v18[3] = &unk_1E9CFB610;
  objc_copyWeak(&v21, &location);
  v10 = v6;
  v19 = v10;
  v11 = v7;
  v20 = v11;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke_2;
  v15[3] = &unk_1E9CFB638;
  objc_copyWeak(&v17, &location);
  v16 = v10;
  v12 = v10;
  objc_msgSend(v8, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v18, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

id __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke(id *a1)
{
  id *WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
    goto LABEL_5;
  if (!objc_msgSend(a1[4], "isFolder"))
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationIntentWithBookmark:", a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v8, "linkPreviewViewControllerForNavigationIntent:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(WeakRetained[2], "listWithID:", objc_msgSend(a1[4], "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bookmarkCount");

  if (v4)
  {
    objc_msgSend(a1[5], "previewViewControllerForItemIdentifier:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

id __89__StartPageController__contextMenuConfigurationForFrequentlyVisitedSite_previewProvider___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5 = WeakRetained[2];
    v6 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v6, "tabGroupProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sf_contextMenuUsingCollection:tabGroupActionProvider:withUserInfo:handler:", v5, v7, 0, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_contextMenuConfigurationForFrequentlyVisitedSite:previewProvider:", a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_contextMenuCommitHandlerForFrequentlyVisitedSite:animator:sectionIdentifier:", v9, v6, *(_QWORD *)(a1 + 32));

}

void __60__StartPageController__setUpContextMenuForBookmarksSection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (objc_msgSend(v6, "isFolder") & 1) == 0)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v5, "linkPreviewProviderWillDismissPreview");

  }
}

id __65__StartPageController__setUpDragItemProviderForBookmarksSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "_sf_initWithBookmark:", v2);

  return v3;
}

- (void)_bookmarkFolderDidChange:(id)a3
{
  void *v4;
  int v5;
  WebBookmarkList **p_favoritesList;
  WebBookmarkList *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DCCBE8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v5 = objc_msgSend(v8, "intValue");
    p_favoritesList = &self->_favoritesList;
    if (v5 != -[WebBookmarkList folderID](self->_favoritesList, "folderID"))
    {
      if (v5 != -[WebBookmarkCollection readingListFolderBookmarkID](self->_bookmarkCollection, "readingListFolderBookmarkID"))
      {
LABEL_8:
        -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
        goto LABEL_9;
      }
      p_favoritesList = &self->_readingList;
LABEL_7:
      v7 = *p_favoritesList;
      *p_favoritesList = 0;

      goto LABEL_8;
    }
    if (!self->_isDroppingFavorites)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)_bookmarksDidReload:(id)a3
{
  WebBookmarkList *favoritesList;
  WebBookmarkList *readingList;

  favoritesList = self->_favoritesList;
  self->_favoritesList = 0;

  readingList = self->_readingList;
  self->_readingList = 0;

  -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
}

- (void)_readingListBookmarkMetadataDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  WebBookmarkList *readingList;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BookmarkWithUpdatedMetadataKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "objectForKeyedSubscript:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 == 1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_readingListBookmarksToMetadataStates, "setObject:forKeyedSubscript:", &unk_1E9D62440, v10);
      objc_msgSend(v10, "readingListIconUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {

LABEL_6:
        readingList = self->_readingList;
        self->_readingList = 0;

        -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
        goto LABEL_7;
      }
      objc_msgSend(v10, "iconData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_6;
    }
  }
LABEL_7:

}

void __44__StartPageController__privacyReportSection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentPrivacyReport");

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didEngageWithStartPageSection:", 3);

}

void __47__StartPageController__updatePrivacyReportData__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__StartPageController__updatePrivacyReportData__block_invoke_4;
  block[3] = &unk_1E9CF39C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __47__StartPageController__updatePrivacyReportData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_privacyReportDataDidChange");

}

- (void)_historyWasAltered
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__StartPageController__historyWasAltered__block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __41__StartPageController__historyWasAltered__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrivacyReportData");
}

- (void)_historyWasCleared:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D8AB00];
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "profileLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCachedDataForProfilesWithIdentifiers:", v8);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__StartPageController__historyWasCleared___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __42__StartPageController__historyWasCleared___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_reloadPrivacyReportSection");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "reloadDataAnimatingDifferences:", 1);
}

- (void)setShowingAsPopover:(BOOL)a3
{
  if (self->_showingAsPopover != a3)
  {
    self->_showingAsPopover = a3;
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
  }
}

uint64_t __51__StartPageController_updatePrivacyReportIfEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

- (void)_contentBlockerStatisticsStoreDidClose
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");

  if ((v4 & 1) != 0)
    -[StartPageController _privacyReportDataDidChange](self, "_privacyReportDataDidChange");
}

- (id)_privateRelayPromptInPrivateBrowsingSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
  if (!-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D8ACA8];
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("network.badge.shield.half.filled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__StartPageController__privateRelayPromptInPrivateBrowsingSection__block_invoke;
    v14[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "privateRelayPromptBannerWithImage:title:message:dismissHandler:", v8, v9, v6, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setUserInterfaceStyle:", 2);
    objc_msgSend(MEMORY[0x1E0D8ACC0], "bannerSectionWithIdentifier:title:banner:", *MEMORY[0x1E0D8B648], &stru_1E9CFDBB0, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
    -[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    v3 = (void *)-[StartPageController _privateRelayPromptInPrivateBrowsingSection]::section;
  }
  return v3;
}

void __66__StartPageController__privateRelayPromptInPrivateBrowsingSection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBool:forKey:", 1, *MEMORY[0x1E0D8AFD8]);

    objc_msgSend(v4, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadDataAnimatingDifferences:", 1);

    WeakRetained = v4;
  }

}

- (BOOL)_canShowPrivateRelaySection
{
  void *v3;
  id WeakRetained;
  int v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend(v3, "shouldPromptUsersToTurnOnPrivateRelayForSafari");
  if ((objc_msgSend(WeakRetained, "startPageControllerActiveTabIsBlank:", self) & v5 & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  else
    v6 = 0;

  return v6;
}

id __53__StartPageController__recentlyClosedTabsForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "tabGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    goto LABEL_6;
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "safari_isHTTPFamilyURL") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v3, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = v3;
LABEL_8:

  return v11;
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v3, "tabGroupProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_recentlyClosedTabsForProfile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeRecentlyClosedTabWithStateData:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v2[40], "reloadDataAnimatingDifferences:", 1);
  }

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(a3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC36B8];
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_4;
  v13[3] = &unk_1E9CFB7C0;
  a1 += 4;
  objc_copyWeak(&v15, a1);
  v6 = v3;
  v14 = v6;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_5;
  v10[3] = &unk_1E9CFB638;
  objc_copyWeak(&v12, a1);
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v13, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  return v8;
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v8, "linkPreviewViewControllerForNavigationIntent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_5(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[3];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v41 = WeakRetained;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_6;
    aBlock[3] = &unk_1E9CFB7E8;
    objc_copyWeak(&v58, v2);
    v57 = *(id *)(a1 + 32);
    v38 = _Block_copy(aBlock);
    v4 = objc_loadWeakRetained(v41 + 39);
    objc_msgSend(v4, "tabGroupProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0DC3428];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_7;
    v54[3] = &unk_1E9CF34B0;
    v6 = v38;
    v55 = v6;
    objc_msgSend(v5, "_sf_openInNewTabActionWithHandler:", v54);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_8;
    v52[3] = &unk_1E9CF34B0;
    v35 = v6;
    v53 = v35;
    objc_msgSend(v40, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v10, 0, v52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
    v13 = objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_9;
    v50[3] = &unk_1E9CF3A60;
    v51 = *(id *)(a1 + 32);
    v36 = (void *)v13;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v37, v13, 0, v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v14;
    v15 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_10;
    v48[3] = &unk_1E9CF3A60;
    v49 = *(id *)(a1 + 32);
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v18;
    v19 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_11;
    v45[3] = &unk_1E9CF8F90;
    objc_copyWeak(&v47, v2);
    v46 = *(id *)(a1 + 32);
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v45);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_12;
    v42[3] = &unk_1E9CF8F90;
    objc_copyWeak(&v44, v2);
    v43 = *(id *)(a1 + 32);
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, v26, 0, v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAttributes:", 2);
    objc_msgSend(v23, "arrayByAddingObject:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v30;
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "menuWithTitle:children:", &stru_1E9CFDBB0, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v58);
    WeakRetained = v41;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v7 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredTabOrder:", a2);
    objc_msgSend(v8, "setPrefersOpenInNewTab:", a3);
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationIntentWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "handleNavigationIntent:completion:", v12, 0);
    if (objc_msgSend(v12, "shouldOrderToForeground") && (a3 & 1) == 0)
    {
      objc_msgSend(v7, "tabGroupProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeSingleBlankTabFromActiveTabGroup");

    }
    objc_msgSend(v14[40], "reloadDataAnimatingDifferences:", 1);

    WeakRetained = v14;
  }

}

uint64_t __49__StartPageController__recentlyClosedTabsSection__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__StartPageController__recentlyClosedTabsSection__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD5618], "defaultReadingList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addReadingListItemWithURL:title:previewText:error:", v4, v5, 0, 0);

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_10(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURL:", v2);

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_11(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    objc_msgSend(*(id *)(a1 + 32), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v5, 0);

    objc_msgSend(WeakRetained[40], "presentViewController:fromItemWithIdentifier:", v6, *(_QWORD *)(a1 + 32));
  }

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_12(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeRecentlyClosedTabWithStateData:", *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained[40], "reloadDataAnimatingDifferences:", 1);
  }

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "setPreferredCommitStyle:", 1);
  objc_msgSend(v5, "previewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__StartPageController__recentlyClosedTabsSection__block_invoke_14;
  v8[3] = &unk_1E9CF3D60;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "addAnimations:", v8);

  objc_destroyWeak(&v10);
}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_14(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v3, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

void __49__StartPageController__recentlyClosedTabsSection__block_invoke_15(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v2, "linkPreviewProviderWillDismissPreview");

    WeakRetained = v3;
  }

}

id __49__StartPageController__recentlyClosedTabsSection__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0CB36C8];
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v2, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_URLWithDataAsString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviderWithURL:title:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v8);
  return v9;
}

id __40__StartPageController_cloudTabsSections__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recentCloudTabsSectionWithDevice:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __40__StartPageController_cloudTabsSections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_cloudTabsSectionWithDevice:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __40__StartPageController_cloudTabsSections__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v2, "presentCloudTabsPickerWithPrimaryDeviceUUID:", 0);

    WeakRetained = v3;
  }

}

- (id)_cloudTabsConsentSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *libraryType;
  __CFString *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = (void *)MEMORY[0x1E0D8ACA8];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StartPageController _cloudTabsConsentMessage](self, "_cloudTabsConsentMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke;
  v17[3] = &unk_1E9CF31B0;
  v17[4] = self;
  v15[4] = self;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_2;
  v16[3] = &unk_1E9CF31B0;
  v15[1] = 3221225472;
  v15[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_3;
  v15[3] = &unk_1E9CFB8C8;
  v15[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v3, "bannerWithTitle:attributedMessage:primaryButtonTitle:secondaryButtonTitle:primaryButtonHandler:secondaryButtonHandler:messageTextItemHandler:", v4, v5, v6, v7, v17, v16, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D8ACC0];
  v10 = *MEMORY[0x1E0D8B5F8];
  libraryType = (__CFString *)self->_libraryType;
  if (libraryType == CFSTR("CloudTabsCollection"))
  {
    v12 = &stru_1E9CFDBB0;
  }
  else
  {
    WBSStartPageSectionIdentifierTitle();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "bannerSectionWithIdentifier:title:banner:", v10, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (libraryType != CFSTR("CloudTabsCollection"))

  return v13;
}

uint64_t __47__StartPageController__cloudTabsConsentSection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cloudTabsConsentSelected");
}

uint64_t __47__StartPageController__cloudTabsConsentSection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideCloudTabsSection");
}

id __47__StartPageController__cloudTabsConsentSection__block_invoke_3(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__StartPageController__cloudTabsConsentSection__block_invoke_4;
  v2[3] = &unk_1E9CF3A60;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__StartPageController__cloudTabsConsentSection__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getOBPrivacyPresenterClass(void)::softClass;
  v12 = getOBPrivacyPresenterClass(void)::softClass;
  if (!getOBPrivacyPresenterClass(void)::softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___ZL26getOBPrivacyPresenterClassv_block_invoke;
    v8[3] = &unk_1E9CF31D8;
    v8[4] = &v9;
    ___ZL26getOBPrivacyPresenterClassv_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.safari"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentingViewController:", v7);

  objc_msgSend(v6, "present");
}

- (id)_cloudTabsConsentMessage
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  v7 = *MEMORY[0x1E0DC1138];
  v20[0] = *MEMORY[0x1E0DC1178];
  v20[1] = v7;
  v21[0] = v3;
  v21[1] = v4;
  v20[2] = *MEMORY[0x1E0DC1140];
  v21[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v2, v8);

  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("{about-safari-privacy-link}"));
  v13 = v12;

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about-safari-privacy://"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0DC1160];
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v15, v11, v13);

    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v13, v16);

  }
  return v9;
}

- (void)_cloudTabsConsentSelected
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_setBool:andNotifyForKey:", 1, *MEMORY[0x1E0D8AF38]);

  -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
  -[WBSRecentsStore fetchMetadata](self->_recentsStore, "fetchMetadata");
}

- (void)_hideCloudTabsSection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[Application sharedApplication](Application, "sharedApplication", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = *MEMORY[0x1E0D8B5F8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefault"))
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = objc_alloc(MEMORY[0x1E0D8AB40]);
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[Application sharedApplication](Application, "sharedApplication");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "tabGroupManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v11, "initWithProfileIdentifier:tabGroupManager:", v12, v14);

        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ACC8]), "initWithStorage:", v10);
        objc_msgSend(v15, "setSectionIdentifier:enabled:", v7, 0);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (BOOL)_shouldShowConsentUI
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D8AF38]) & 1) == 0
    && -[NSArray count](self->_recentItems, "count") != 0;

  return v4;
}

- (id)_recentCloudTabsSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled")
    && -[NSArray count](self->_recentItems, "count"))
  {
    v3 = (void *)MEMORY[0x1E0D8ACC0];
    objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cardSectionWithIdentifier:actions:banner:identifiers:configurationProvider:", *MEMORY[0x1E0D8B5F8], v5, 0, self->_recentItems, &__block_literal_global_201);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 0));
    objc_msgSend(v6, "setNumberOfRowsVisibleWhenCollapsedInCompactWidth:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, 1));
    objc_msgSend(v6, "setExpandsModally:", 1);
    -[StartPageController _contextMenuConfigurationForRecentCloudTab](self, "_contextMenuConfigurationForRecentCloudTab");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContextMenuProvider:", v7);

    -[StartPageController _cloudTabsContextMenuCommitHandler](self, "_cloudTabsContextMenuCommitHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContextMenuCommitHandler:", v8);

    -[StartPageController _cloudTabsContextMenuDismissHandler](self, "_cloudTabsContextMenuDismissHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContextMenuDismissHandler:", v9);

    -[StartPageController _cloudTabsDragItemProvider](self, "_cloudTabsDragItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDragItemProvider:", v10);

    objc_msgSend(v6, "setMaximumNumberOfPages:", 4);
    if (!self->_libraryType)
      -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v6);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __46__StartPageController__recentCloudTabsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v5);

  objc_msgSend(v4, "deviceLocationDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCaptionText:icon:", v6, v7);

}

- (id)_recentCloudTabsSectionWithDevice:(id)a3
{
  id v4;
  NSArray *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
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
  _QWORD v20[4];
  id v21;
  StartPageController *v22;

  v4 = a3;
  v5 = self->_availableDevices;
  if (-[NSArray count](v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    -[StartPageController _recentItemsForDevice:](self, "_recentItemsForDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](self->_searchPattern, "length"))
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke;
      v20[3] = &unk_1E9CFB930;
      v21 = WeakRetained;
      v22 = self;
      objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v20);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x1E0D8B5F8], v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D8ACC0];
      objc_msgSend(v4, "disambiguatedName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v11, v13, MEMORY[0x1E0C9AA60], 0, v7, &__block_literal_global_205);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setNumberOfRowsVisibleWhenCollapsed:", -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 6, 0));
      objc_msgSend(v14, "setExpandsModally:", 1);
      -[StartPageController _contextMenuConfigurationForRecentCloudTab](self, "_contextMenuConfigurationForRecentCloudTab");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContextMenuProvider:", v15);

      -[StartPageController _cloudTabsContextMenuCommitHandler](self, "_cloudTabsContextMenuCommitHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContextMenuCommitHandler:", v16);

      -[StartPageController _cloudTabsContextMenuDismissHandler](self, "_cloudTabsContextMenuDismissHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContextMenuDismissHandler:", v17);

      -[StartPageController _cloudTabsDragItemProvider](self, "_cloudTabsDragItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDragItemProvider:", v18);

      if (!self->_libraryType)
        -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v14);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cloudTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "tabItem:matchesSearchText:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));

  return v5;
}

void __57__StartPageController__recentCloudTabsSectionWithDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v5);

  objc_msgSend(v4, "deviceLocationDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCaptionText:icon:", v6, v7);

}

- (id)_cloudTabsSectionWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  StartPageController *v34;
  _QWORD v35[4];
  id v36;
  StartPageController *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[StartPageController _cloudTabDevices](self, "_cloudTabDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if (self->_libraryType)
    {
      objc_msgSend(v4, "disambiguatedName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "disambiguatedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v4, "tabs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSString length](self->_searchPattern, "length"))
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke;
      v35[3] = &unk_1E9CFB978;
      v36 = WeakRetained;
      v37 = self;
      objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v35);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    if (objc_msgSend(v13, "count"))
    {
      v15 = objc_msgSend(WeakRetained, "canShowSidebar");
      v16 = (_QWORD *)MEMORY[0x1E0D8B5F8];
      if (v15 && !self->_libraryType)
      {
        v19 = (id)*MEMORY[0x1E0D8B5F8];
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), *v16, v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (self->_libraryType)
      {
        v20 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D8A740], "toggleSectionExpandedAction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0D8ACC0], "listSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v19, v31, v20, 0, v13, &__block_literal_global_212);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v22;
      if (v15)
        v23 = 8;
      else
        v23 = 4;
      objc_msgSend(v22, "setNumberOfRowsVisibleWhenCollapsed:", v23);
      objc_msgSend(v6, "setExpandsModally:", v15 ^ 1u);
      -[StartPageController _contextMenuConfigurationForCloudTabWithSelectedDevice:](self, "_contextMenuConfigurationForCloudTabWithSelectedDevice:", v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContextMenuProvider:", v24);

      -[StartPageController _cloudTabsContextMenuCommitHandler](self, "_cloudTabsContextMenuCommitHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContextMenuCommitHandler:", v25);

      -[StartPageController _cloudTabsContextMenuDismissHandler](self, "_cloudTabsContextMenuDismissHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContextMenuDismissHandler:", v26);

      -[StartPageController _cloudTabsDragItemProvider](self, "_cloudTabsDragItemProvider");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDragItemProvider:", v27);

      if (!self->_libraryType)
        -[StartPageController _setProfileIconOnSectionIfNeeded:](self, "_setProfileIconOnSectionIfNeeded:", v6);
      if (v15 && !self->_libraryType && (unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_3;
        v32[3] = &unk_1E9CFBA28;
        v33 = v4;
        v34 = self;
        objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTitleMenu:", v29);

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __51__StartPageController__cloudTabsSectionWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tabItem:matchesSearchText:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(a3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

id __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0DC3428];
  if (*(id *)(a1 + 32) == v3)
  {
    objc_msgSend(v3, "disambiguatedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v8, 0, 0, &__block_literal_global_213);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setState:", 1);
  }
  else
  {
    objc_msgSend(v3, "disambiguatedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_5;
    v10[3] = &unk_1E9CF3A18;
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v4;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D4F210];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_6;
  v5[3] = &unk_1E9CFBA00;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "safari_modifyDictionaryForKey:block:", v3, v5);

}

void __51__StartPageController__cloudTabsSectionWithDevice___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_lastCloudDeviceProfileKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v4);

}

- (id)_contextMenuConfigurationForRecentCloudTab
{
  return -[StartPageController _contextMenuConfigurationForCloudTabWithSelectedDevice:](self, "_contextMenuConfigurationForCloudTabWithSelectedDevice:", 0);
}

- (id)_cloudTabsContextMenuDismissHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__StartPageController__cloudTabsContextMenuDismissHandler__block_invoke;
  v4[3] = &unk_1E9CFB6B0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __58__StartPageController__cloudTabsContextMenuDismissHandler__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v2, "linkPreviewProviderWillDismissPreview");

    WeakRetained = v3;
  }

}

- (id)_cloudTabsDragItemProvider
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__StartPageController__cloudTabsDragItemProvider__block_invoke;
  aBlock[3] = &unk_1E9CFBA50;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __49__StartPageController__cloudTabsDragItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_cloudTabItemForIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB36C8];
  objc_msgSend(v2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviderWithURL:title:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);
  return v7;
}

- (id)_cloudTabsContextMenuCommitHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke;
  v4[3] = &unk_1E9CFBA78;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "setPreferredCommitStyle:", 1);
  objc_msgSend(v5, "previewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke_2;
  v8[3] = &unk_1E9CF3D60;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "addAnimations:", v8);

  objc_destroyWeak(&v10);
}

void __57__StartPageController__cloudTabsContextMenuCommitHandler__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v3, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (id)_cloudTabItemForIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
  {
    objc_msgSend(v3, "cloudTab");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_cloudTabDeviceForIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
  {
    objc_msgSend(v3, "device");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_contextMenuConfigurationForCloudTabWithSelectedDevice:(id)a3
{
  void *v4;
  _QWORD aBlock[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke;
  aBlock[3] = &unk_1E9CFBB18;
  aBlock[4] = self;
  objc_copyWeak(&v7, &location);
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_cloudTabItemForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cloudTabDeviceForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC36B8];
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_2;
  v19[3] = &unk_1E9CFB7C0;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  v8 = v4;
  v20 = v8;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_3;
  v14[3] = &unk_1E9CFBAF0;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v9 = v8;
  v15 = v9;
  v10 = v3;
  v16 = v10;
  v17 = v5;
  v11 = v5;
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v19, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  return v12;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithCloudTab:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v5, "linkPreviewViewControllerForNavigationIntent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_3(id *a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_4;
  aBlock[3] = &unk_1E9CFBAA0;
  objc_copyWeak(&v56, a1 + 7);
  v55 = a1[4];
  v36 = _Block_copy(aBlock);
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v37 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v3, "tabGroupProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0DC3428];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_5;
    v52[3] = &unk_1E9CF34B0;
    v5 = v36;
    v53 = v5;
    objc_msgSend(v4, "_sf_openInNewTabActionWithHandler:", v52);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v6;
    objc_msgSend(a1[4], "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_6;
    v50[3] = &unk_1E9CF34B0;
    v51 = v5;
    objc_msgSend(v35, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v7, 0, v50);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
    v10 = objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_7;
    v48[3] = &unk_1E9CF3A60;
    v49 = a1[4];
    v32 = (void *)v10;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v33, v10, 0, v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v11;
    v12 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_8;
    v46[3] = &unk_1E9CF3A60;
    v47 = a1[4];
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v15;
    v16 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_9;
    v42[3] = &unk_1E9CFBAC8;
    objc_copyWeak(&v45, a1 + 7);
    v43 = a1[4];
    v44 = a1[5];
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(a1[6], "isCloseRequestSupported"))
    {
      v21 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_10;
      v38[3] = &unk_1E9CFBAC8;
      objc_copyWeak(&v41, a1 + 7);
      v39 = a1[4];
      v40 = a1[6];
      objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v23, 0, v38);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setAttributes:", 2);
      objc_msgSend(v20, "arrayByAddingObject:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v41);
      v20 = (void *)v25;
    }
    v26 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v27;
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "menuWithTitle:children:", &stru_1E9CFDBB0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v45);
  }
  else
  {
    v30 = 0;
  }

  objc_destroyWeak(&v56);
  return v30;
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v5 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v6, "setPreferredTabOrder:", a2);
    objc_msgSend(v6, "navigationIntentWithCloudTab:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleNavigationIntent:completion:", v7, 0);
    if (objc_msgSend(v7, "shouldOrderToForeground"))
    {
      objc_msgSend(v5, "tabGroupProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeSingleBlankTabFromActiveTabGroup");

    }
    WeakRetained = v9;
  }

}

uint64_t __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD5618], "defaultReadingList");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addReadingListItemWithURL:title:previewText:error:", v2, v3, 0, 0);

}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_8(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setURL:", v2);

}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    objc_msgSend(*(id *)(a1 + 32), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v5, 0);

    objc_msgSend(WeakRetained[40], "presentViewController:fromItemWithIdentifier:", v6, *(_QWORD *)(a1 + 40));
  }

}

void __78__StartPageController__contextMenuConfigurationForCloudTabWithSelectedDevice___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_cloudTabStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closeTab:onDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (id)_lastCloudDeviceProfileKey
{
  id WeakRetained;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E9CFDBB0;
  v5 = v3;

  return v5;
}

uint64_t __47__StartPageController__selectedCloudTabsDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D89E20]);
}

uint64_t __47__StartPageController__selectedCloudTabsDevice__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __47__StartPageController__selectedCloudTabsDevice__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_lastCloudDeviceProfileKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v4);

}

- (void)_suggestionsDidChange:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled", a3))
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__StartPageController__suggestionsDidChange___block_invoke;
      block[3] = &unk_1E9CF31B0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __45__StartPageController__suggestionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "reloadDataAnimatingDifferences:", 1);
}

- (void)_cloudTabsConsentStateDidChange:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled", a3))
  {
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
    -[WBSRecentsStore fetchMetadata](self->_recentsStore, "fetchMetadata");
  }
}

- (void)_recentCloudTabItemsDidRebuild:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled", a3))
    -[StartPageController _updateRecentCloudTabsSection](self, "_updateRecentCloudTabsSection");
}

- (void)_recentCloudTabItemsDidReceiveMetadata:(id)a3
{
  void *v4;
  NSTimer *v5;
  NSTimer *coalescedRecentCloudTabsSectionUpdateTimer;
  _QWORD v7[4];
  id v8;
  id location;

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled", a3))
  {
    objc_initWeak(&location, self);
    -[NSTimer invalidate](self->_coalescedRecentCloudTabsSectionUpdateTimer, "invalidate");
    v4 = (void *)MEMORY[0x1E0C99E88];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__StartPageController__recentCloudTabItemsDidReceiveMetadata___block_invoke;
    v7[3] = &unk_1E9CF8C10;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 1.0);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    coalescedRecentCloudTabsSectionUpdateTimer = self->_coalescedRecentCloudTabsSectionUpdateTimer;
    self->_coalescedRecentCloudTabsSectionUpdateTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __62__StartPageController__recentCloudTabItemsDidReceiveMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRecentCloudTabsSection");

}

- (void)_updateRecentCloudTabsSection
{
  _QWORD block[5];

  -[StartPageController _updateRecentItemsAndDevices](self, "_updateRecentItemsAndDevices");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__StartPageController__updateRecentCloudTabsSection__block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__StartPageController__updateRecentCloudTabsSection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_recentCloudTabsSection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "reloadDataAnimatingDifferences:", 1);
}

- (void)_updateRecentItemsAndDevices
{
  void *v3;
  NSArray *v4;
  NSArray *recentItems;
  void *v6;
  NSArray *v7;
  NSArray *availableDevices;
  NSMutableDictionary *recentItemsByDeviceUUID;

  -[WBSRecentsStore displayableRecentItems](self->_recentsStore, "displayableRecentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_msgSend(v3, "copy");
  recentItems = self->_recentItems;
  self->_recentItems = v4;

  -[WBSRecentsStore availableDevices](self->_recentsStore, "availableDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  availableDevices = self->_availableDevices;
  self->_availableDevices = v7;

  recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
  self->_recentItemsByDeviceUUID = 0;

}

- (id)_recentItemsForDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *recentItemsByDeviceUUID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  NSArray *recentItems;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
    if (!recentItemsByDeviceUUID)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_recentItemsByDeviceUUID;
      self->_recentItemsByDeviceUUID = v7;

      recentItemsByDeviceUUID = self->_recentItemsByDeviceUUID;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](recentItemsByDeviceUUID, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      recentItems = self->_recentItems;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__StartPageController__recentItemsForDevice___block_invoke;
      v16[3] = &unk_1E9CFBB90;
      v13 = v5;
      v17 = v13;
      -[NSArray safari_filterObjectsUsingBlock:](recentItems, "safari_filterObjectsUsingBlock:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentItemsByDeviceUUID, "setObject:forKeyedSubscript:", v14, v13);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_recentItemsByDeviceUUID, "objectForKeyedSubscript:", v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

uint64_t __45__StartPageController__recentItemsForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __46__StartPageController__siriSuggestionsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "appIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBadge:", v7);

    objc_msgSend(WeakRetained, "_setLeadImageForCard:withRecommendation:", v16, v5);
    titleForSiriSuggestion(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v8);

    v9 = v5;
    objc_msgSend(v9, "pageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_highLevelDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(v9, "pageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v16, "setSubtitle:", v12);

    objc_msgSend(v9, "footnote");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceIcon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCaptionText:icon:", v14, v15);

  }
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC36B8];
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_3;
  v13[3] = &unk_1E9CFB7C0;
  a1 += 4;
  objc_copyWeak(&v15, a1);
  v6 = v3;
  v14 = v6;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_4;
  v10[3] = &unk_1E9CFB638;
  objc_copyWeak(&v12, a1);
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v13, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  return v8;
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v6, "linkPreviewViewControllerForNavigationIntent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __46__StartPageController__siriSuggestionsSection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(WeakRetained, "_openMenuElementsForSiriSuggestion:", *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    v5 = (void *)MEMORY[0x1E0DC39D0];
    v6 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_5;
    v32[3] = &unk_1E9CF3A60;
    v33 = *(id *)(a1 + 32);
    v22 = (void *)v7;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v29, v7, 0, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v26;
    v9 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v10 = objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_6;
    v30[3] = &unk_1E9CF3A60;
    v31 = *(id *)(a1 + 32);
    v24 = (void *)v10;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v28, v10, 0, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    objc_msgSend(v3, "_shareActionForSiriSuggestion:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v13;
    v14 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(v3, "_downvoteActionForSiriSuggestion:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    objc_msgSend(v3, "_banActionForSiriSuggestion:", *(_QWORD *)(a1 + 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuWithTitle:children:", &stru_1E9CFDBB0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD5618], "defaultReadingList");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addReadingListItemWithURL:title:previewText:error:", v2, v3, 0, 0);

}

void __46__StartPageController__siriSuggestionsSection__block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pageURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setURL:", v2);

}

void __46__StartPageController__siriSuggestionsSection__block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setReadingListRecommendationAsReadWithRecommendation:", v6);
    objc_msgSend(v7, "setPreferredCommitStyle:", 1);
    objc_msgSend(v7, "previewViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__StartPageController__siriSuggestionsSection__block_invoke_8;
    v12[3] = &unk_1E9CF3358;
    v12[4] = v9;
    v13 = v10;
    v11 = v10;
    objc_msgSend(v7, "addAnimations:", v12);

  }
}

void __46__StartPageController__siriSuggestionsSection__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(WeakRetained, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 40));

}

void __46__StartPageController__siriSuggestionsSection__block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v2, "linkPreviewProviderWillDismissPreview");

    WeakRetained = v3;
  }

}

id __46__StartPageController__siriSuggestionsSection__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "_sf_initWithSiriSuggestion:", v2);

  return v3;
}

- (void)_setLeadImageForCard:(id)a3 withRecommendation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0DCCB98]);
  titleForSiriSuggestion(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_originalDataAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection configuration](self->_bookmarkCollection, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v10, objc_msgSend(v11, "collectionType"));

  objc_msgSend(v16, "setImageFromBookmark:", v12);
  if (objc_msgSend(v6, "prefersLeadImage")
    && (objc_msgSend(v6, "image"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    objc_msgSend(v6, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v14);

  }
  else
  {
    objc_msgSend(v6, "imageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[StartPageController _requestLeadImageForRecommendation:](self, "_requestLeadImageForRecommendation:", v6);
  }

}

- (void)_requestLeadImageForRecommendation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *siriSuggestionsMetadataTokens;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  if (!self->_siriSuggestionsMetadataTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    siriSuggestionsMetadataTokens = self->_siriSuggestionsMetadataTokens;
    self->_siriSuggestionsMetadataTokens = v5;

  }
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0D8AA00];
  objc_msgSend(v4, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__StartPageController__requestLeadImageForRecommendation___block_invoke;
  v13[3] = &unk_1E9CFBC98;
  objc_copyWeak(&v15, &location);
  v11 = v4;
  v14 = v11;
  objc_msgSend(v10, "registerRequest:priority:responseHandler:", v9, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_siriSuggestionsMetadataTokens, "addObject:", v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __58__StartPageController__requestLeadImageForRecommendation___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v8, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)WeakRetained[40];
      v7 = *(_QWORD *)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__StartPageController__requestLeadImageForRecommendation___block_invoke_2;
      v9[3] = &unk_1E9CFBC70;
      v10 = v4;
      objc_msgSend(v6, "configureModelWithIdentifier:usingBlock:", v7, v9);

    }
  }

}

uint64_t __58__StartPageController__requestLeadImageForRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImage:", *(_QWORD *)(a1 + 32));
}

- (id)_openMenuElementsForSiriSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke;
  aBlock[3] = &unk_1E9CFBAA0;
  objc_copyWeak(&v24, &location);
  v6 = v4;
  v23 = v6;
  v7 = _Block_copy(aBlock);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_2;
  v20[3] = &unk_1E9CF34B0;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v8, "_sf_openInNewTabActionWithHandler:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_3;
  v18[3] = &unk_1E9CF34B0;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v12, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v13, 0, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v16;
}

void __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v4, "setPreferredTabOrder:", a2);
    objc_msgSend(*(id *)(a1 + 32), "pageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationIntentWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleNavigationIntent:completion:", v6, 0);

    objc_msgSend(WeakRetained, "_setReadingListRecommendationAsReadWithRecommendation:", *(_QWORD *)(a1 + 32));
    if (a2 == 1)
    {
      v8 = objc_loadWeakRetained(WeakRetained + 39);
      objc_msgSend(v8, "tabGroupProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeSingleBlankTabFromActiveTabGroup");

    }
  }

}

uint64_t __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__StartPageController__openMenuElementsForSiriSuggestion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_shareActionForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__StartPageController__shareActionForHighlight___block_invoke;
  v11[3] = &unk_1E9CF8F90;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __48__StartPageController__shareActionForHighlight___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    objc_msgSend(*(id *)(a1 + 32), "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v5, 0);

    objc_msgSend(WeakRetained, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:fromItemWithIdentifier:", v6, *(_QWORD *)(a1 + 32));

  }
}

- (id)_shareActionForSiriSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__StartPageController__shareActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E9CF8F90;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __53__StartPageController__shareActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    objc_msgSend(*(id *)(a1 + 32), "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v5, 0);

    objc_msgSend(WeakRetained, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:fromItemWithIdentifier:", v6, *(_QWORD *)(a1 + 32));

  }
}

- (id)_downvoteActionForSiriSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12[2];
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "source");
  WBSForYouLinkRecommendationSourceDownvoteActionTitle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsdown"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E9CFBCE0;
  objc_copyWeak(v12, &location);
  v12[1] = v5;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

  return v9;
}

void __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;
  _QWORD v6[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[12], "downvoteSource:postingChangeNotificationWhenDone:", *(_QWORD *)(a1 + 40), 0);
    v3 = v5[11];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke_2;
    v6[3] = &__block_descriptor_40_e37_B16__0__WBSForYouLinkRecommendation_8l;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setSiriSuggestions:", v4);

    WeakRetained = v5;
  }

}

BOOL __56__StartPageController__downvoteActionForSiriSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") == *(_QWORD *)(a1 + 32);
}

- (id)_banActionForSiriSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsdown"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3428];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__StartPageController__banActionForSiriSuggestion___block_invoke;
  v11[3] = &unk_1E9CF8F90;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributes:", 2);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __51__StartPageController__banActionForSiriSuggestion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v3 = (void *)WeakRetained[12];
    objc_msgSend(*(id *)(a1 + 32), "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "banURLsOfSameDomainAsURL:postingChangeNotificationWhenDone:", v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "pageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11[11];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__StartPageController__banActionForSiriSuggestion___block_invoke_2;
    v12[3] = &unk_1E9CFBD08;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "safari_filterObjectsUsingBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setSiriSuggestions:", v10);

    WeakRetained = v11;
  }

}

uint64_t __51__StartPageController__banActionForSiriSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "pageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v6;
}

- (void)_setReadingListRecommendationAsReadWithRecommendation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "source") == 1)
  {
    objc_msgSend(v6, "sourceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[WebBookmarkCollection bookmarkWithUUID:](self->_bookmarkCollection, "bookmarkWithUUID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[WebBookmarkCollection markReadingListBookmark:asRead:postNotification:](self->_bookmarkCollection, v5, 1, 1);

    }
  }

}

- (void)_setSiriSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *siriSuggestions;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_siriSuggestions, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    siriSuggestions = self->_siriSuggestions;
    self->_siriSuggestions = v4;

    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
  }

}

- (void)_updateSiriSuggestionsMediator
{
  void *v3;
  ForYouRecommendationMediator *v4;
  ForYouRecommendationMediator *siriSuggestionsMediator;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_siriSuggestionsMediator)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createRecommendationMediatorOrReuseExistingOneIfPossible");
    v4 = (ForYouRecommendationMediator *)objc_claimAutoreleasedReturnValue();
    siriSuggestionsMediator = self->_siriSuggestionsMediator;
    self->_siriSuggestionsMediator = v4;

  }
  if (-[SFStartPageViewController isShowingRootView](self->_viewController, "isShowingRootView"))
  {
    objc_initWeak(&location, self);
    -[WBSForYouRecommendationMediator beginListeningForURLSuggestionChanges](self->_siriSuggestionsMediator, "beginListeningForURLSuggestionChanges");
    +[History sharedHistory](History, "sharedHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__StartPageController__updateSiriSuggestionsMediator__block_invoke;
    v7[3] = &unk_1E9CF39C8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "performBlockAfterHistoryHasLoaded:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WBSForYouRecommendationMediator stopListeningForURLSuggestionChanges](self->_siriSuggestionsMediator, "stopListeningForURLSuggestionChanges");
  }
}

void __53__StartPageController__updateSiriSuggestionsMediator__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__StartPageController__updateSiriSuggestionsMediator__block_invoke_2;
  block[3] = &unk_1E9CF39C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __53__StartPageController__updateSiriSuggestionsMediator__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshSiriSuggestions");

}

- (void)_refreshSiriSuggestions
{
  void *v3;
  id WeakRetained;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D8AC58], "areLocalSiriSuggestionsEnabled") & 1) == 0)
  {
    -[StartPageController _setSiriSuggestions:](self, "_setSiriSuggestions:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __46__StartPageController__refreshSiriSuggestions__block_invoke;
    v9 = &unk_1E9CF4110;
    objc_copyWeak(&v10, &location);
    v3 = _Block_copy(&v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v5 = objc_msgSend(WeakRetained, "getContextForCurrentPageWithCompletionHandler:", v3, v6, v7, v8, v9);

    if ((v5 & 1) == 0)
      -[StartPageController _updateRecommendationsForAllTopics](self, "_updateRecommendationsForAllTopics");

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__StartPageController__refreshSiriSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__StartPageController__refreshSiriSuggestions__block_invoke_2;
  v5[3] = &unk_1E9CF3D60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __46__StartPageController__refreshSiriSuggestions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v3, "results");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_244);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "count"))
      {
        v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = 134217984;
          v8 = objc_msgSend(v5, "count");
          _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Obtained %ld ContextKit topics related to the current page.", (uint8_t *)&v7, 0xCu);
        }

        objc_msgSend(WeakRetained, "_updateRecommendationsForTopics:", v5);
      }
      else
      {
        objc_msgSend(WeakRetained, "_updateRecommendationsForAllTopics");
      }

    }
    else
    {
      objc_msgSend(WeakRetained, "_updateRecommendationsForAllTopics");
    }
  }

}

id __46__StartPageController__refreshSiriSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D8A928]);
    objc_msgSend(v2, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topicId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithTitle:identifier:relevancyDate:source:", v6, v7, v8, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateRecommendationsForAllTopics
{
  ForYouRecommendationMediator *siriSuggestionsMediator;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__StartPageController__updateRecommendationsForAllTopics__block_invoke;
  v4[3] = &unk_1E9CFBD70;
  objc_copyWeak(&v5, &location);
  -[WBSForYouRecommendationMediator updatedTopicsWithCompletionHandler:](siriSuggestionsMediator, "updatedTopicsWithCompletionHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__StartPageController__updateRecommendationsForAllTopics__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateRecommendationsForTopics:", v3);

}

- (void)_updateRecommendationsForTopics:(id)a3
{
  id v4;
  ForYouRecommendationMediator *siriSuggestionsMediator;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__StartPageController__updateRecommendationsForTopics___block_invoke;
  v6[3] = &unk_1E9CFBD70;
  objc_copyWeak(&v7, &location);
  -[ForYouRecommendationMediator updatedRecommendationsForTopics:withCompletionHandler:](siriSuggestionsMediator, "updatedRecommendationsForTopics:withCompletionHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__StartPageController__updateRecommendationsForTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__StartPageController__updateRecommendationsForTopics___block_invoke_2;
  v5[3] = &unk_1E9CF3D60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __55__StartPageController__updateRecommendationsForTopics___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setSiriSuggestions:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      objc_msgSend(WeakRetained, "_fetchHandoffResult");
  }

}

- (void)_fetchHandoffResult
{
  ForYouRecommendationMediator *siriSuggestionsMediator;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  siriSuggestionsMediator = self->_siriSuggestionsMediator;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__StartPageController__fetchHandoffResult__block_invoke;
  v4[3] = &unk_1E9CFBDD8;
  objc_copyWeak(&v5, &location);
  -[WBSForYouRecommendationMediator retrieveHandoffRecommendationWithCompletionHandler:](siriSuggestionsMediator, "retrieveHandoffRecommendationWithCompletionHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__StartPageController__fetchHandoffResult__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__StartPageController__fetchHandoffResult__block_invoke_2;
    v4[3] = &unk_1E9CF3D60;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }

}

void __42__StartPageController__fetchHandoffResult__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (void *)objc_msgSend(WeakRetained[11], "mutableCopy");
    objc_msgSend(v3, "safari_removeObjectsPassingTest:", &__block_literal_global_248);
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "_setSiriSuggestions:", v3);

    WeakRetained = v4;
  }

}

BOOL __42__StartPageController__fetchHandoffResult__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") == 3;
}

void __41__StartPageController__highlightsSection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v5 = a2;
  v24 = a3;
  objc_opt_class();
  LOBYTE(a3) = objc_opt_isKindOfClass();
  v6 = v24;
  if ((a3 & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = 0;
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v6;
    else
      v11 = 0;
    v12 = v11;

    v8 = 0;
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(*(id *)(a1 + 32), "attributionViewForSuggestion:", v6, v24);
    else
      objc_msgSend(*(id *)(a1 + 40), "attributionViewForHighlight:", v12, v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
  }
  v25 = v10;
  objc_msgSend(v5, "setHighlight:", v24);
  objc_msgSend(v5, "setAttributionView:", v9);
  v13 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v5, "setRelativeDateString:", &stru_1E9CFDBB0);
  if (v8)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v8, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:", v15);

    objc_msgSend(v13, "setOriginalURL:", v16);
    objc_msgSend(v13, "setURL:", v16);
    objc_msgSend(v8, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v17);

    v18 = *(void **)(*(_QWORD *)(a1 + 48) + 264);
    objc_msgSend(v8, "historyItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastVisitedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safari_suggestionsLocalizedStringRelativeToNowForDate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRelativeDateString:", v21);

  }
  objc_msgSend(v5, "setMetadata:", v13);
  if (*(_BYTE *)(a1 + 64))
  {
    v22 = *(void **)(a1 + 32);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __41__StartPageController__highlightsSection__block_invoke_2;
    v33[3] = &unk_1E9CFBE00;
    v34 = v8;
    v35 = v5;
    objc_msgSend(v22, "fetchMetadataForSuggestion:completionHandler:", v6, v33);

  }
  else
  {
    v23 = *(void **)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __41__StartPageController__highlightsSection__block_invoke_3;
    v26[3] = &unk_1E9CFBE50;
    objc_copyWeak(&v31, (id *)(a1 + 56));
    v27 = *(id *)(a1 + 40);
    v28 = v25;
    v32 = *(_BYTE *)(a1 + 65);
    v29 = v9;
    v30 = v5;
    objc_msgSend(v23, "fetchMetadataForHighlight:completionHandler:", v28, v26);

    objc_destroyWeak(&v31);
  }

}

void __41__StartPageController__highlightsSection__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v3, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:", v6);
      }
      else
      {
        objc_msgSend(v7, "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setTitle:", v6);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "setMetadata:", v7);
  }

}

void __41__StartPageController__highlightsSection__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void (**v6)(void *, _QWORD);
  void *v7;
  int v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__StartPageController__highlightsSection__block_invoke_4;
    aBlock[3] = &unk_1E9CFBE28;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v14 = *(_BYTE *)(a1 + 72);
    v12 = v3;
    v13 = *(id *)(a1 + 48);
    v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 56), "highlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBSIsEqual();

    if (v8)
      v6[2](v6, *(_QWORD *)(a1 + 56));
    else
      objc_msgSend(v5[40], "configureModelWithIdentifier:usingBlock:", *(_QWORD *)(a1 + 40), v6);

  }
}

void __41__StartPageController__highlightsSection__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sendFeedbackForHighlight:withType:inPrivateBrowsing:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v3, "setMetadata:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setHighlight:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setAttributionView:", *(_QWORD *)(a1 + 56));

}

id __41__StartPageController__highlightsSection__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contextMenuConfigurationForFrequentlyVisitedSite:previewProvider:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
    v9 = (void *)MEMORY[0x1E0DC36B8];
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__StartPageController__highlightsSection__block_invoke_6;
    v19[3] = &unk_1E9CFB7C0;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    v11 = v8;
    v20 = v11;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __41__StartPageController__highlightsSection__block_invoke_7;
    v14[3] = &unk_1E9CFBEF0;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v15 = v11;
    v16 = *(id *)(a1 + 40);
    v18 = *(_BYTE *)(a1 + 56);
    v12 = v11;
    objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v19, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
  }

  return v7;
}

id __41__StartPageController__highlightsSection__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationIntentWithHighlight:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v5, "linkPreviewViewControllerForNavigationIntent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __41__StartPageController__highlightsSection__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id *WeakRetained;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  char v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  _BYTE v76[128];
  void *v77;
  _QWORD v78[4];

  v78[2] = *MEMORY[0x1E0C80C00];
  v45 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __41__StartPageController__highlightsSection__block_invoke_8;
    v69[3] = &unk_1E9CF3A60;
    v70 = *(id *)(a1 + 32);
    objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v69);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __41__StartPageController__highlightsSection__block_invoke_9;
    aBlock[3] = &unk_1E9CFBEA0;
    objc_copyWeak(&v67, (id *)(a1 + 48));
    v65 = *(id *)(a1 + 32);
    v66 = *(id *)(a1 + 40);
    v68 = *(_BYTE *)(a1 + 56);
    v39 = _Block_copy(aBlock);
    v7 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v7, "tabGroupProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WBSURLForHighlight();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v6;
    v62[1] = 3221225472;
    v62[2] = __41__StartPageController__highlightsSection__block_invoke_10;
    v62[3] = &unk_1E9CF34B0;
    v10 = v39;
    v63 = v10;
    objc_msgSend(v8, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v9, 0, v62);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3428];
    v60[0] = v6;
    v60[1] = 3221225472;
    v60[2] = __41__StartPageController__highlightsSection__block_invoke_11;
    v60[3] = &unk_1E9CF34B0;
    v12 = v10;
    v61 = v12;
    objc_msgSend(v11, "_sf_openInNewTabActionWithHandler:", v60);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v12;
    v78[0] = v13;
    v78[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC39D0];
    v77 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v44);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__18;
    v58 = __Block_byref_object_dispose__18;
    v59 = 0;
    objc_msgSend(WeakRetained, "viewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v53[0] = v6;
    v53[1] = 3221225472;
    v53[2] = __41__StartPageController__highlightsSection__block_invoke_259;
    v53[3] = &unk_1E9CFBEC8;
    v53[4] = &v54;
    objc_msgSend(v16, "configureModelWithIdentifier:usingBlock:", v17, v53);

    v18 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(WeakRetained, "_shareActionForHighlight:", *(_QWORD *)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithObject:", v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)v55[5];
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v76, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
          v72 = &v71;
          v73 = 0x2020000000;
          v26 = (id *)getSLHideContextMenuIdentifierSymbolLoc(void)::ptr;
          v74 = getSLHideContextMenuIdentifierSymbolLoc(void)::ptr;
          if (!getSLHideContextMenuIdentifierSymbolLoc(void)::ptr)
          {
            v27 = (void *)SocialLayerLibrary();
            v26 = (id *)dlsym(v27, "SLHideContextMenuIdentifier");
            v72[3] = (uint64_t)v26;
            getSLHideContextMenuIdentifierSymbolLoc(void)::ptr = (uint64_t)v26;
          }
          _Block_object_dispose(&v71, 8);
          if (!v26)
          {
            dlerror();
            abort_report_np();
            __break(1u);
          }
          v28 = *v26;
          v29 = objc_msgSend(v25, "isEqualToString:", v28);

          v30 = v20;
          if (v29)
          {
            _WBSLocalizedString();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setTitle:", v31);

            v30 = v47;
          }
          objc_msgSend(v30, "addObject:", v24);
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v76, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v47);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0DC39D0];
    v75[0] = v40;
    v75[1] = v41;
    v75[2] = v32;
    v75[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "menuWithTitle:children:", &stru_1E9CFDBB0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v54, 8);
    objc_destroyWeak(&v67);

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

void __41__StartPageController__highlightsSection__block_invoke_8()
{
  void *v0;
  id v1;

  WBSURLForHighlight();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setURL:", v1);

}

void __41__StartPageController__highlightsSection__block_invoke_9(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v5, "setPreferredTabOrder:", a2);
    objc_msgSend(v5, "navigationIntentWithHighlight:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sendFeedbackForHighlight:withType:inPrivateBrowsing:", *(_QWORD *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 56));
    v7 = objc_loadWeakRetained(v9 + 39);
    objc_msgSend(v7, "dispatchNavigationIntent:", v6);
    if (a2 == 1)
    {
      objc_msgSend(v7, "tabGroupProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeSingleBlankTabFromActiveTabGroup");

    }
    WeakRetained = v9;
  }

}

uint64_t __41__StartPageController__highlightsSection__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__StartPageController__highlightsSection__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41__StartPageController__highlightsSection__block_invoke_259(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "attributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuItems");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __41__StartPageController__highlightsSection__block_invoke_2_263(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_contextMenuCommitHandlerForFrequentlyVisitedSite:animator:sectionIdentifier:", v6, v7, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v9 = v6;
    v10 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v10)
    {
      objc_msgSend(v7, "setPreferredCommitStyle:", 1);
      objc_msgSend(v7, "previewViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __41__StartPageController__highlightsSection__block_invoke_3_264;
      v14[3] = &unk_1E9CFBF40;
      v15 = *(id *)(a1 + 40);
      v12 = v9;
      v19 = *(_BYTE *)(a1 + 56);
      v16 = v12;
      v17 = v10;
      v18 = v11;
      v13 = v11;
      objc_msgSend(v7, "addAnimations:", v14);

    }
  }

}

void __41__StartPageController__highlightsSection__block_invoke_3_264(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "sendFeedbackForHighlight:withType:inPrivateBrowsing:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 64));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 312));
  objc_msgSend(WeakRetained, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 56));

}

void __41__StartPageController__highlightsSection__block_invoke_4_266(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 39);
    objc_msgSend(v2, "linkPreviewProviderWillDismissPreview");

    WeakRetained = v3;
  }

}

id __41__StartPageController__highlightsSection__block_invoke_5_267(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v2, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "resourceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);

  return v7;
}

- (id)_privateBrowsingPersistentModuleSection
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D8ACC0];
  v3 = *MEMORY[0x1E0D8B640];
  objc_msgSend(MEMORY[0x1E0D8ACA8], "privateBrowsingPersistentModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerSectionWithIdentifier:banner:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_privateBrowsingExplanationSection
{
  int64_t privateBrowsingExplanationState;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  privateBrowsingExplanationState = self->_privateBrowsingExplanationState;
  if (privateBrowsingExplanationState == 1)
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else if (privateBrowsingExplanationState)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D8AB18];
    objc_msgSend(MEMORY[0x1E0D8AB10], "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemsForConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0D8ACA8];
  v8 = self->_privateBrowsingExplanationState;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__StartPageController__privateBrowsingExplanationSection__block_invoke;
  v15 = &unk_1E9CF39C8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "privateBrowsingExplanationBannerWithState:explanationItems:dismissHandler:", v8, v6, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8ACC0], "bannerSectionWithIdentifier:title:banner:", *MEMORY[0x1E0D8B638], &stru_1E9CFDBB0, v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __57__StartPageController__privateBrowsingExplanationSection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setInteger:forKey:", 1, *MEMORY[0x1E0D8B2C0]);

    objc_msgSend(WeakRetained, "updatePrivateBrowsingExplanationState");
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__StartPageController__privateBrowsingExplanationSection__block_invoke_2;
    v3[3] = &unk_1E9CF31B0;
    v3[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
  }

}

uint64_t __57__StartPageController__privateBrowsingExplanationSection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "reloadDataAnimatingDifferences:", 1);
}

- (id)profileProviderForCustomizationViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backgroundImageAssetControllerForCustomizationViewController:(id)a3
{
  void *v3;
  void *v4;

  +[Application sharedApplication](Application, "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundImageAssetController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isCloudSyncAvailableForStartPageCustomizationViewController:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "kind");

  if (v6)
    return 0;
  +[Application sharedApplication](Application, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isCloudHistoryEnabled");

  return v7;
}

- (BOOL)isSuggestionsCustomizationAvailableForStartPageCustomizationViewController:(id)a3
{
  void *v3;
  char v4;

  -[WBSStartPageSectionManager enabledSectionIdentifiers](self->_startPageSectionManager, "enabledSectionIdentifiers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D8B668]);

  return v4;
}

- (BOOL)isCloudSyncEnabledForStartPageCustomizationViewController:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D89E38]);

  return v4;
}

- (void)startPageCustomizationViewControllerDidDisableCloudSync:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 0, *MEMORY[0x1E0D89E38]);

}

- (void)startPageCustomizationViewControllerDidEnableCloudSync:(id)a3 withPreference:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D89E38];
  v8 = v5;
  objc_msgSend(v5, "setBool:forKey:", 1, *MEMORY[0x1E0D89E38]);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", v7, 0);

  if (a4)
  {
    if (a4 != 1)
      return;
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncUpSafariSettingsSyncWithCompletion:", &__block_literal_global_274);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncDownSafariSettingsSyncWithCompletion:", &__block_literal_global_275_0);
  }

}

- (id)startPageCustomizationViewController:(id)a3 customizationItemsForCustomizationVariant:(int64_t)a4
{
  void *v4;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  switch(a4)
  {
    case 0:
      -[WBSStartPageSectionManager sections](self->_startPageSectionManager, "sections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_278);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v14;
LABEL_9:

      break;
    case 2:
      -[WBSStartPageSectionManager suggestionsDataSourceSections](self->_startPageSectionManager, "suggestionsDataSourceSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_279);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "tabGroupProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeTabGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "supportsTabGroupFavorites"))
      {
        v11 = (void *)MEMORY[0x1E0D8ACB0];
        v12 = -[StartPageController isTabGroupFavoritesSectionEnabled](self, "isTabGroupFavoritesSectionEnabled");
        objc_msgSend(v11, "itemWithIdentifier:enabled:", *MEMORY[0x1E0D8B670], v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      goto LABEL_9;
  }

  return v4;
}

id __102__StartPageController_startPageCustomizationViewController_customizationItemsForCustomizationVariant___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D8B670]) & 1) != 0
    || ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D8B608]) & 1) == 0
      ? (v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D8B660]))
      : (v5 = 1),
        (v5 | objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D8B610])) == 1
     && (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) != 0
     || objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D8B668])
     && !objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled")))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8ACB0], "itemWithIdentifier:enabled:", v3, objc_msgSend(v2, "isEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __102__StartPageController_startPageCustomizationViewController_customizationItemsForCustomizationVariant___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D8ACB0];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithIdentifier:enabled:", v4, objc_msgSend(v2, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startPageCustomizationViewController:(id)a3 didCustomizeItems:(id)a4 withVariant:(int64_t)a5
{
  id v8;
  void *v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v8 = a4;
  v9 = v8;
  if (!a5 || a5 == 2)
  {
    v13 = (void *)objc_msgSend(v8, "mutableCopy");
    -[WBSStartPageSectionManager sections](self->_startPageSectionManager, "sections");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v34, "indexOfObjectPassingTest:", &__block_literal_global_283);
    v15 = objc_msgSend(v34, "indexOfObjectPassingTest:", &__block_literal_global_284_0);
    v16 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_286);
    v17 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_287);
    objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v36);
    objc_msgSend(v13, "removeObject:", v35);
    if (v14 >= v15)
      v18 = v35;
    else
      v18 = v36;
    if (v14 >= v15)
      v19 = v15;
    else
      v19 = v14;
    if (v14 >= v15)
      v20 = v36;
    else
      v20 = v35;
    if (v14 <= v15)
      v21 = v15;
    else
      v21 = v14;
    v22 = v18;
    v23 = v20;
    if (v22)
    {
      v24 = objc_msgSend(v13, "count");
      v25 = v19;
      if (v19 >= v24)
        v25 = objc_msgSend(v13, "count");
      objc_msgSend(v13, "insertObject:atIndex:", v22, v25);
    }
    if (v23)
    {
      v26 = objc_msgSend(v13, "count");
      v27 = v21;
      if (v21 >= v26)
        v27 = objc_msgSend(v13, "count");
      objc_msgSend(v13, "insertObject:atIndex:", v23, v27);
    }
    if (!v22
      || !v23
      || v19 == 0x7FFFFFFFFFFFFFFFLL
      || v21 == 0x7FFFFFFFFFFFFFFFLL
      || v16 == 0x7FFFFFFFFFFFFFFFLL
      || v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "description");
        *(_DWORD *)buf = 138544642;
        v43 = v33;
        v44 = 2114;
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = 2048;
        v47 = v19;
        v48 = 2048;
        v49 = v21;
        v50 = 2048;
        v51 = v16;
        v52 = 2048;
        v53 = v17;
        v32 = (void *)v45;
        _os_log_error_impl(&dword_1D7CA3000, v28, OS_LOG_TYPE_ERROR, "Unexpected Suggestions sections state: Item1:%{public}@, Item2:%{public}@, Index1:%ld, Index2:%ld, Frecents:%ld, Highlights:%ld", buf, 0x3Eu);

      }
    }
    v29 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_289;
    v38[3] = &unk_1E9CFC180;
    v30 = v29;
    v39 = v30;
    objc_msgSend(v13, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSStartPageSectionManager setSectionsIdentifiers:enabledIndexes:](self->_startPageSectionManager, "setSectionsIdentifiers:enabledIndexes:", v31, v30);

    goto LABEL_37;
  }
  if (a5 == 1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke;
    aBlock[3] = &unk_1E9CFC098;
    v41 = v8;
    v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v10[2](v10, *MEMORY[0x1E0D8B670]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      -[StartPageController setTabGroupFavoritesSectionEnabled:](self, "setTabGroupFavoritesSectionEnabled:", objc_msgSend(v11, "isEnabled"));

    v13 = v41;
LABEL_37:

  }
  -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);

}

id __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_2;
  v8[3] = &unk_1E9CFC070;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "safari_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D8B608]);

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D8B610]);

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D8B608]);

  return v3;
}

uint64_t __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D8B610]);

  return v3;
}

id __90__StartPageController_startPageCustomizationViewController_didCustomizeItems_withVariant___block_invoke_289(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (objc_msgSend(v5, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isBackgroundImageEnabledForStartPageCustomizationViewController:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[Application sharedApplication](Application, "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabGroupManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileWithIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "kind") == 1)
  {
    objc_msgSend(v8, "settingForKey:", *MEMORY[0x1E0D8B598]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D8B598]);
  }
  v11 = v10;

  return v11;
}

- (id)backgroundImageForStartPageCustomizationViewController:(id)a3
{
  NSItemProvider *cachedItemProvider;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  cachedItemProvider = self->_cachedItemProvider;
  if (cachedItemProvider)
    return cachedItemProvider;
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabGroupManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profileWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[StartPageController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForIdentifier:forProfile:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v13, "CGImage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v14);
    objc_msgSend(v6, "prefetchedImageNameForProfile:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSuggestedName:", v16);

    objc_msgSend(v6, "prefetchedImageThumbnailForProfile:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v13;
    v20 = v19;

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__StartPageController_backgroundImageForStartPageCustomizationViewController___block_invoke;
    v22[3] = &unk_1E9CFC1A8;
    v23 = v20;
    v21 = v20;
    objc_msgSend(v15, "setPreviewImageHandler:", v22);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __78__StartPageController_backgroundImageForStartPageCustomizationViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *, _QWORD);

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(*(id *)(a1 + 32), "CGImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3, 0);

}

- (void)startPageCustomizationViewController:(id)a3 willModifySectionWithIdentifier:(id)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v5 = a5;
  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", 1, *MEMORY[0x1E0D8B5F0]);

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D89E20]);

  if ((v11 & 1) != 0)
  {
    v15[0] = CFSTR("section");
    v15[1] = CFSTR("isEnabled");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D8B408], 0, v13);

  }
}

- (void)didReorderSectionIdentifiersForStartPageCustomizationViewController:(id)a3
{
  void *v4;
  int v5;
  id WeakRetained;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", *MEMORY[0x1E0D8B620], self);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", 1, *MEMORY[0x1E0D8B5F0]);

}

- (void)startPageCustomizationViewControllerDidFinish:(id)a3
{
  void *v3;
  int v4;
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89E20]);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0D8B410], 0);

  }
}

- (void)startPageCustomizationViewController:(id)a3 didModifyBackgroundImageEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  BOOL v17;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBool:forKey:", v4, *MEMORY[0x1E0D8B598]);

  }
  else
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tabGroupManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke;
    v16[3] = &__block_descriptor_33_e26_v16__0__WBMutableProfile_8l;
    v17 = v4;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke_2;
    v14[3] = &unk_1E9CFC1D0;
    v14[4] = self;
    v15 = v8;
    v12 = (id)objc_msgSend(v11, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v15, 1, v16, v14);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBool:forKey:", 1, *MEMORY[0x1E0D8B5F0]);

}

void __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSetting:forKey:", v3, *MEMORY[0x1E0D8B598]);

}

void __92__StartPageController_startPageCustomizationViewController_didModifyBackgroundImageEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "profileWithIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "setProfile:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D8B2E8], 0);

  }
}

- (void)startPageCustomizationViewController:(id)a3 didSelectCustomBackgroundImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  id location;

  v6 = a4;
  objc_storeStrong((id *)&self->_cachedItemProvider, a4);
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
    v8 = (void *)++generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    objc_initWeak(&location, self);
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke;
    v20[3] = &unk_1E9CFC270;
    v22[1] = v8;
    v21 = v7;
    objc_copyWeak(v22, &location);
    v10 = (id)objc_msgSend(v6, "loadFileRepresentationForTypeIdentifier:completionHandler:", v9, v20);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "kind");

    objc_msgSend(WeakRetained, "tabGroupProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activeTabGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isUnnamed");

    if (v14)
      v18 = v17;
    else
      v18 = 0;
    if (v18 == 1)
    {
      -[StartPageController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearImageWithIdentifier:withinProfile:", v19, 1);
    }
    else
    {
      -[StartPageController startPageBackgroundImageIdentifier](self, "startPageBackgroundImageIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearImageWithIdentifier:withinProfile:", v19, 0);
    }

  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29[2];
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _BYTE v34[16];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = generationToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
  if (v7 == v8)
  {
    if (v6)
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_cold_1(v10, (uint64_t)v34, v9);
      }

    }
    v11 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "globallyUniqueString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v5)
    {
      v33 = v6;
      objc_msgSend(v17, "moveItemAtURL:toURL:error:", v5, v16, &v33);
      v19 = v33;

      v6 = v19;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v21 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_300;
    v30[3] = &unk_1E9CF3358;
    v22 = v18;
    v31 = v22;
    v32 = v5;
    objc_msgSend(v20, "setHandler:", v30);
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_301;
    v25[3] = &unk_1E9CFC248;
    v26 = *(id *)(a1 + 32);
    v27 = v16;
    v28 = v20;
    v23 = v20;
    v24 = v16;
    objc_copyWeak(v29, (id *)(a1 + 40));
    v29[1] = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v25);
    objc_destroyWeak(v29);

  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_300(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v3 = objc_msgSend(v2, "removeItemAtURL:error:", v1, &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_300_cold_1(v6, (uint64_t)v8, v5);
    }

  }
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_301(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_2;
  v4[3] = &unk_1E9CFC220;
  v5 = *(id *)(a1 + 48);
  objc_copyWeak(v7, (id *)(a1 + 56));
  v7[1] = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "cacheImageFromURL:completion:", v3, v4);

  objc_destroyWeak(v7);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_3;
  block[3] = &unk_1E9CFC1F8;
  v6 = a1[4];
  objc_copyWeak(v9, a1 + 6);
  v9[1] = a1[7];
  v7 = v3;
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v9);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
    v2 = *(_QWORD *)(a1 + 64);
    v3 = generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    if (v2 == v3)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D8B130]);
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v4, "setBool:forKey:", 1, *MEMORY[0x1E0D8B598]);
        v5 = objc_loadWeakRetained(WeakRetained + 39);
        objc_msgSend(v5, "tabGroupProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "activeProfile");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "kind");

        objc_msgSend(v5, "tabGroupProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activeTabGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isUnnamed");

        if (v8)
          v12 = v11;
        else
          v12 = 0;
        v13 = *(void **)(a1 + 48);
        if (v12 == 1)
        {
          objc_msgSend(WeakRetained, "startPageBackgroundImageIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "processImageForIdentifier:isGeneratedImage:withinProfile:", v14, 0, 1);
        }
        else
        {
          objc_msgSend(WeakRetained, "startPageBackgroundImageIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "processImageForIdentifier:isGeneratedImage:withinProfile:", v14, 0, 0);
        }

        v15 = WeakRetained[5];
        WeakRetained[5] = 0;

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBool:forKey:", 1, *MEMORY[0x1E0D8B5F0]);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "clearPrefetchedImage");
        objc_msgSend(v4, "setBool:forKey:", 0, *MEMORY[0x1E0D8B598]);
      }

    }
  }

}

- (void)startPageCustomizationViewController:(id)a3 didSelectBuiltInBackgroundImageAtURL:(id)a4 precomputedLuminance:(double)a5
{
  id v7;
  void *v8;
  NSItemProvider *v9;
  NSItemProvider *cachedItemProvider;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[3];
  id location;

  v7 = a4;
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E0CB36C8]);
  cachedItemProvider = self->_cachedItemProvider;
  self->_cachedItemProvider = v9;

  -[NSItemProvider setSuggestedName:](self->_cachedItemProvider, "setSuggestedName:", v8);
  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  v11 = (void *)++generationToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke;
  v15[3] = &unk_1E9CFC2E0;
  objc_copyWeak(v18, &location);
  v18[1] = v11;
  v13 = v8;
  v16 = v13;
  v17 = v12;
  v18[2] = *(id *)&a5;
  v14 = v12;
  objc_msgSend(v14, "prefetchImage:luminance:completion:", v7, v15, a5);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke(id *a1, uint64_t a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  id v6[3];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_2;
    block[3] = &unk_1E9CFC2B8;
    objc_copyWeak(v6, a1 + 6);
    v6[1] = a1[7];
    v4 = a1[4];
    v5 = a1[5];
    v6[2] = a1[8];
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v6);
  }
}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id *v28;
  id v29;

  os_unfair_lock_lock((os_unfair_lock_t)&generationLock);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = generationToken;
    os_unfair_lock_unlock((os_unfair_lock_t)&generationLock);
    if (v3 == v4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D8B130]);
      v6 = objc_loadWeakRetained(WeakRetained + 39);
      objc_msgSend(v6, "tabGroupProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activeProfileIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
      {
        objc_msgSend(v5, "setBool:forKey:", 1, *MEMORY[0x1E0D8B598]);
      }
      else
      {
        +[Application sharedApplication](Application, "sharedApplication");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tabGroupManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_4;
        v27 = &unk_1E9CFC1D0;
        v28 = WeakRetained;
        v29 = v8;
        v11 = (id)objc_msgSend(v10, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v29, 1, &__block_literal_global_304, &v24);

      }
      objc_msgSend(v6, "tabGroupProvider", v24, v25, v26, v27, v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "kind");

      objc_msgSend(v6, "tabGroupProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activeTabGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isUnnamed");

      v18 = *(void **)(a1 + 40);
      v19 = *(double *)(a1 + 64);
      objc_msgSend(WeakRetained, "startPageBackgroundImageIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v21 = v17;
      else
        v21 = 0;
      objc_msgSend(v18, "commitPrefetchedImageWithLuminance:forIdentifier:isGeneratedImage:withinProfile:", v20, 0, v21, v19);

      v22 = WeakRetained[5];
      WeakRetained[5] = 0;

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBool:forKey:", 1, *MEMORY[0x1E0D8B5F0]);

    }
  }

}

uint64_t __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSetting:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D8B598]);
}

void __118__StartPageController_startPageCustomizationViewController_didSelectBuiltInBackgroundImageAtURL_precomputedLuminance___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "profileWithIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "setProfile:", v3);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D8B2E8], 0);

}

- (void)startPageCustomizationViewController:(id)a3 didSelectMobileAssetBackgroundImageWithProvider:(id)a4
{
  objc_storeStrong((id *)&self->_cachedItemProvider, a4);
}

- (void)startPageViewController:(id)a3 toggleSectionExpanded:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  SFStartPageViewController *viewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!objc_msgSend(v24, "expandsModally"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryForKey:", CFSTR("startPageExpansionDictionary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v24, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithBool:", objc_msgSend(v19, "safari_BOOLForKey:", v21) ^ 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, v23);

    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("startPageExpansionDictionary"));
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v24, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D8B5F8];
  v8 = objc_msgSend(v6, "hasPrefix:", *MEMORY[0x1E0D8B5F8]);

  if (v8)
  {
    objc_msgSend(v24, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v7, "length") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentCloudTabsPickerWithPrimaryDeviceUUID:", v10);

  }
  objc_msgSend(v24, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D8B650]);

  if (v12)
  {
    if (!objc_msgSend(WeakRetained, "canShowSidebar"))
    {
      objc_msgSend(WeakRetained, "setPresentingModalBookmarksController:withExclusiveCollection:bookmarkUUIDString:animated:", 1, CFSTR("ReadingListCollection"), 0, 1);
      goto LABEL_12;
    }
    viewController = self->_viewController;
    objc_msgSend(v24, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageViewController showDetailForItemWithIdentifier:](viewController, "showDetailForItemWithIdentifier:", v14);
    goto LABEL_11;
  }
LABEL_12:

}

- (id)startPageViewController:(id)a3 detailSectionForItemIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[StartPageController _bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:](self, "_bookmarkSectionForBookmark:orList:forFavoritesSection:forScopedFavoritesSection:sectionTitle:", v5, 0, 1, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v7 = (void *)v6;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D8B668]))
  {
    -[StartPageController _highlightsSection](self, "_highlightsSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumNumberOfPages:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D8B650]))
    {
      emptyBookmarksSection();
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[StartPageController _readingListSection](self, "_readingListSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumNumberOfPages:", 1);
  }
LABEL_11:

  return v7;
}

- (id)startPageViewController:(id)a3 detailSectionsForItemIdentifier:(id)a4
{
  id v5;
  NSArray *availableDevices;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D8B5F8]))
  {
    availableDevices = self->_availableDevices;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__StartPageController_startPageViewController_detailSectionsForItemIdentifier___block_invoke;
    v10[3] = &unk_1E9CFB8A0;
    v10[4] = self;
    -[NSArray safari_mapObjectsUsingBlock:](availableDevices, "safari_mapObjectsUsingBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    emptyBookmarksSection();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __79__StartPageController_startPageViewController_detailSectionsForItemIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recentCloudTabsSectionWithDevice:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startPageViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5
{
  int64_t var1;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  var1 = a5.var1;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    if (objc_msgSend(v11, "isFolder")
      && (objc_msgSend(MEMORY[0x1E0D4EF70], "shouldOpenBookmarkFolderAsTabs") & 1) == 0)
    {
      objc_msgSend(v8, "showDetailForItemWithIdentifier:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationIntentWithBookmark:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v13);
        v14 = -[WebBookmarkCollection bookmarkIsInFavoritesFolder:](self->_bookmarkCollection, "bookmarkIsInFavoritesFolder:", v11);
        -[StartPageController _reportBookmarkNavigationAnalytics:withIntent:bookmarkIsInFavoritesFolder:](self, "_reportBookmarkNavigationAnalytics:withIntent:bookmarkIsInFavoritesFolder:", v11, v13, v14);
        if ((_DWORD)v14)
        {
          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "didSelectFavoritesRow:", var1);

        }
      }

    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pageURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationIntentWithURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v18);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didEngageWithStartPageSection:", 2);
  }
  else
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F0224A58))
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "navigationIntentWithCloudTab:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v11);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didEngageWithStartPageSection:", 5);
      goto LABEL_13;
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v21 = (void *)getSLHighlightClass(void)::softClass;
    v36 = getSLHighlightClass(void)::softClass;
    if (!getSLHighlightClass(void)::softClass)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = ___ZL19getSLHighlightClassv_block_invoke;
      v32[3] = &unk_1E9CF31D8;
      v32[4] = &v33;
      ___ZL19getSLHighlightClassv_block_invoke((uint64_t)v32);
      v21 = (void *)v34[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v33, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "navigationIntentWithHighlight:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[Application sharedApplication](Application, "sharedApplication");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "highlightManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sendFeedbackForHighlight:withType:inPrivateBrowsing:", v11, 1, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));

      objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v18);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didEngageWithStartPageSection:", 7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[StartPageController _cloudTabItemForIdentifier:](self, "_cloudTabItemForIdentifier:", v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "navigationIntentWithCloudTab:", v31);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v11);
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "didEngageWithStartPageSection:", 5);
        goto LABEL_13;
      }
      v11 = v9;
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v11, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLWithString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "navigationIntentWithURL:", v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v18);
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didEngageWithStartPageSection:", 8);
    }
  }

LABEL_13:
LABEL_15:

LABEL_16:
}

- (void)startPageViewControllerDidChangeRootViewVisibility:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) == 0)
    -[StartPageController _updateSiriSuggestionsMediator](self, "_updateSiriSuggestionsMediator");
  if (objc_msgSend(v5, "isShowingRootView"))
  {
    -[StartPageController frequentlyVisitedSitesController](self, "frequentlyVisitedSitesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recomputeFrequentlyVisitedSitesIfNecessary");

  }
}

- (void)startPageViewController:(id)a3 didUpdateSearchPattern:(id)a4
{
  NSString *v5;
  NSString *searchPattern;
  id v7;

  v7 = a4;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = (NSString *)objc_msgSend(v7, "copy");
    searchPattern = self->_searchPattern;
    self->_searchPattern = v5;

    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
  }

}

- (void)editBookmark:(id)a3 userInfo:(id)a4
{
  StartPageDataSource **p_dataSource;
  id v5;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "editBookmark:", v5);

}

- (void)deleteBookmark:(id)a3 userInfo:(id)a4
{
  void *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "subtype") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteScopedBookmarkWithUUID:completionHandler:", v7, 0);

  }
  else
  {
    -[StartPageController frequentlyVisitedSitesController](self, "frequentlyVisitedSitesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "bookmarkIsFrequentlyVistedSite:", v14);

    if (v9)
    {
      -[StartPageController frequentlyVisitedSitesController](self, "frequentlyVisitedSitesController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "banFrequentlyVisitedSite:inMemoryBookmarkChangeTrackingAvailable:", v14, objc_msgSend(v11, "isInMemoryBookmarkChangeTrackingAvailable"));

    }
    if (objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync"))
    {
      -[WebBookmarkCollection deleteBookmark:](self->_bookmarkCollection, "deleteBookmark:", v14);
      objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
      goto LABEL_8;
    }
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isInMemoryBookmarkChangeTrackingAvailable");

    if (v13)
    {
      -[WebBookmarkCollection deleteBookmarkInMemory:](self->_bookmarkCollection, "deleteBookmarkInMemory:", v14);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "didDeleteBookmarkInMemory");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, self->_viewController);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "didPreventBookmarkActionWithBookmarkType:actionType:", 1, 1);
    }
  }

LABEL_8:
}

- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v7);

  -[StartPageController _reportBookmarkNavigationAnalytics:withIntent:](self, "_reportBookmarkNavigationAnalytics:withIntent:", v9, v7);
}

- (void)bookmark:(id)a3 shareItems:(id)a4 userInfo:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", v7, 0);
  -[SFStartPageViewController presentViewController:fromItemWithIdentifier:](self->_viewController, "presentViewController:fromItemWithIdentifier:", v8, v9);

}

- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[StartPageController _reportBookmarkNavigationAnalytics:withIntent:bookmarkIsInFavoritesFolder:](self, "_reportBookmarkNavigationAnalytics:withIntent:bookmarkIsInFavoritesFolder:", v7, v6, -[WebBookmarkCollection bookmarkIsInFavoritesFolder:](self->_bookmarkCollection, "bookmarkIsInFavoritesFolder:", v7));

}

- (void)_reportBookmarkNavigationAnalytics:(id)a3 withIntent:(id)a4 bookmarkIsInFavoritesFolder:(BOOL)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  char v20;

  v8 = a3;
  v9 = a4;
  v10 = -[WebBookmarkCollection bookmarkIsFrequentlyVisitedSite:](self->_bookmarkCollection, "bookmarkIsFrequentlyVisitedSite:", v8);
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__StartPageController__reportBookmarkNavigationAnalytics_withIntent_bookmarkIsInFavoritesFolder___block_invoke;
  v15[3] = &unk_1E9CF8E50;
  v12 = v9;
  v19 = a5;
  v16 = v12;
  v17 = v11;
  v20 = v10;
  v13 = v8;
  v18 = v13;
  v14 = v11;
  objc_msgSend(v14, "performOnAnalyticsQueueWithDelay:block:", 0, v15);

}

uint64_t __97__StartPageController__reportBookmarkNavigationAnalytics_withIntent_bookmarkIsInFavoritesFolder___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "policy");
  switch(result)
  {
    case 1:
    case 3:
      v3 = 1;
      goto LABEL_6;
    case 2:
      v3 = 2;
      goto LABEL_6;
    case 4:
      v3 = 3;
      goto LABEL_6;
    case 5:
      return result;
    default:
      v3 = 0;
LABEL_6:
      if (*(_BYTE *)(a1 + 56))
      {
        v5 = *(void **)(a1 + 40);
        v4 = (id *)(a1 + 40);
        objc_msgSend(v5, "didSelectFavoriteWithOpenLocation:", v3);
        v6 = 0;
      }
      else if (*(_BYTE *)(a1 + 57))
      {
        v7 = *(void **)(a1 + 40);
        v4 = (id *)(a1 + 40);
        objc_msgSend(v7, "didSelectFrequentlyVisitedSiteWithOpenLocation:", v3);
        v6 = 1;
      }
      else
      {
        result = objc_msgSend(*(id *)(a1 + 48), "isReadingListItem", v3);
        if (!(_DWORD)result)
          return result;
        v4 = (id *)(a1 + 40);
        v6 = 4;
      }
      return objc_msgSend(*v4, "didEngageWithStartPageSection:", v6);
  }
}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  int v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(v6, "folderID");
  if (v5 == -[WebBookmarkList folderID](self->_tabGroupScopedFavoritesList, "folderID"))
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);

}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  id v24;

  v24 = a3;
  v7 = a4;
  -[StartPageController _effectiveProfileIdentifier](self, "_effectiveProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v24, "profileWithIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageViewController profile](self->_viewController, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D8B598];
    objc_msgSend(v11, "settingForKey:", *MEMORY[0x1E0D8B598]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v10, "settingForKey:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v15, "BOOLValue");

    v16 = *MEMORY[0x1E0D8B5A8];
    objc_msgSend(v11, "settingForKey:", *MEMORY[0x1E0D8B5A8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v10, "settingForKey:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    -[SFStartPageViewController setProfile:](self->_viewController, "setProfile:", v10);
    if (v14 != (_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", *MEMORY[0x1E0D8B2E8], 0);

    }
    if (v18 != v20
      || (objc_msgSend(v10, "customFavoritesFolderServerID"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "isEqual:", self->_lastSeenProfileCustomFavoritesServerID),
          v22,
          (v23 & 1) == 0))
    {
      -[StartPageController _sectionsDidChange:](self, "_sectionsDidChange:", 0);
    }

  }
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeProfileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBSIsEqual();

    if ((v8 & 1) != 0)
    {
      -[StartPageController _cloudTabsDidChange](self, "_cloudTabsDidChange");
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_viewController, "reloadDataAnimatingDifferences:", 1);
    }
  }

}

- (StartPageDataSource)dataSource
{
  return (StartPageDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (BOOL)isShowingAsPopover
{
  return self->_showingAsPopover;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryType, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_readingListBookmarksToMetadataStates, 0);
  objc_storeStrong((id *)&self->_readingListLeadImageCache, 0);
  objc_storeStrong((id *)&self->_cachedFavoritesList, 0);
  objc_storeStrong((id *)&self->_cachedFavoritesSection, 0);
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_coalescedRecentCloudTabsSectionUpdateTimer, 0);
  objc_storeStrong((id *)&self->_recentItemsByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_recentItems, 0);
  objc_storeStrong((id *)&self->_recentsStore, 0);
  objc_storeStrong((id *)&self->_recentCloudTabsProvider, 0);
  objc_storeStrong((id *)&self->_cachedGeneratedBackgroundItemProvider, 0);
  objc_storeStrong((id *)&self->_lastSeenProfileCustomFavoritesServerID, 0);
  objc_storeStrong((id *)&self->_customFavoritesFolderBookmark, 0);
  objc_storeStrong((id *)&self->_tabGroupScopedFavoritesList, 0);
  objc_storeStrong((id *)&self->_tabGroupFavoritesObservation, 0);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_startPageSectionManager, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsMetadataTokens, 0);
  objc_storeStrong((id *)&self->_selectedCloudDeviceObservation, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsMediator, 0);
  objc_storeStrong((id *)&self->_siriSuggestions, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesController, 0);
  objc_storeStrong((id *)&self->_favoritesList, 0);
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_cachedItemProvider, 0);
  objc_storeStrong((id *)&self->_cachedTabGroupHeadingSection, 0);
  objc_storeStrong((id *)&self->_cachedCloudTabsSection, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
}

- (void)_copyBookmark:(uint64_t)a3 toFolderWithID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, a1, a3, "Could not lock sync when adding bookmark to Favorites.", a5, a6, a7, a8, 0);
}

- (void)_bookmarkSectionForBookmark:(uint64_t)a3 orList:(uint64_t)a4 forFavoritesSection:(uint64_t)a5 forScopedFavoritesSection:(uint64_t)a6 sectionTitle:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, a1, a3, "Failed to load bookmarks in folder.", a5, a6, a7, a8, 0);
}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Failed to load background image from item provider: %{public}@", (uint8_t *)a2);

}

void __91__StartPageController_startPageCustomizationViewController_didSelectCustomBackgroundImage___block_invoke_300_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Failed to remove temporary background image file: %{public}@", (uint8_t *)a2);

}

@end
