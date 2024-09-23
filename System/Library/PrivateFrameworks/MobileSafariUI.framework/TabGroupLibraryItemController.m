@implementation TabGroupLibraryItemController

- (TabGroupLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 tabGroup:(id)a5 tab:(id)a6
{
  id v11;
  id v12;
  TabGroupLibraryItemController *v13;
  TabGroupLibraryItemController *v14;
  TabGroupLibraryItemController *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TabGroupLibraryItemController;
  v13 = -[LibraryItemController initWithConfiguration:sectionController:](&v17, sel_initWithConfiguration_sectionController_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tabGroup, a5);
    objc_storeStrong((id *)&v14->_tab, a6);
    v15 = v14;
  }

  return v14;
}

- (id)swipeActionsConfiguration
{
  WBTab *tab;
  void *v4;
  void *v5;
  void *v6;

  tab = self->_tab;
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (tab)
    objc_msgSend(v4, "swipeActionsConfigurationForTab:inTabGroup:", self->_tab, self->_tabGroup);
  else
    objc_msgSend(v4, "swipeActionsConfigurationForTabGroup:forPickerSheet:", self->_tabGroup, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  WBTab *tab;
  void *v3;
  unint64_t v4;

  if (self->_tab)
    tab = self->_tab;
  else
    tab = self->_tabGroup;
  -[WBTab uuid](tab, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  -[WBTab uuid](self->_tab, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    if (!self->_tab)
    {
      objc_msgSend(v4, "tab");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[WBTabGroup uuid](self->_tabGroup, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "tabGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v12, "isEqualToString:", v14);

        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (id)tabGroupProvider
{
  void *v2;
  void *v3;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isTabGroupSynced
{
  return -[WBTabGroup isNamed](self->_tabGroup, "isNamed");
}

- (void)updateListContentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  WBTabGroup *tabGroup;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_tab)
  {
    objc_msgSend(v20, "imageProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumSize:", 16.0, 16.0);

    objc_msgSend(v20, "imageProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReservedLayoutSize:", 16.0, 16.0);

    -[WBTab displayTitle](self->_tab);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v8);
LABEL_3:

    goto LABEL_7;
  }
  objc_msgSend(v4, "imageForTabGroup:", self->_tabGroup);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v9);

  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v20, "imageProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaximumSize:", v10, v11);

  objc_msgSend(v20, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReservedLayoutSize:", v10, v11);

  -[WBTabGroup displayTitle](self->_tabGroup, "displayTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v14);

  if (objc_msgSend(v5, "hasMultipleProfiles")
    && (-[WBTabGroup isNamed](self->_tabGroup, "isNamed") & 1) == 0
    && (-[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing") & 1) == 0)
  {
    objc_msgSend(v5, "activeProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    tabGroup = self->_tabGroup;
    objc_msgSend(v20, "secondaryTextProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resolvedColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ToolbarItemConfiguration attributedTitleForTabGroup:inProfile:primaryColor:secondaryColor:](ToolbarItemConfiguration, "attributedTitleForTabGroup:inProfile:primaryColor:secondaryColor:", tabGroup, v8, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v18);

    objc_msgSend(v8, "symbolImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v19);

    goto LABEL_3;
  }
LABEL_7:

}

- (id)pinnedAccessory
{
  ActionCellAccessory *pinnedAccessory;
  ActionCellAccessory *v4;
  void *v5;
  void *v6;
  void *v7;
  ActionCellAccessory *v8;
  void *v9;
  void *v10;
  ActionCellAccessory *v11;

  pinnedAccessory = self->_pinnedAccessory;
  if (!pinnedAccessory)
  {
    v4 = [ActionCellAccessory alloc];
    v5 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, v6, 0, &__block_literal_global_44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ActionCellAccessory initWithAction:](v4, "initWithAction:", v7);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActionCellAccessory setPreferredSymbolConfiguration:](v8, "setPreferredSymbolConfiguration:", v9);

    -[ActionCellAccessory customView](v8, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    v11 = self->_pinnedAccessory;
    self->_pinnedAccessory = v8;

    pinnedAccessory = self->_pinnedAccessory;
  }
  return pinnedAccessory;
}

- (id)accessories
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[WBTab isPinned](self->_tab, "isPinned"))
    return MEMORY[0x1E0C9AA60];
  -[TabGroupLibraryItemController pinnedAccessory](self, "pinnedAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didSelectItem
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;

  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_tab)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[WBTab uuid](self->_tab, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[WBTabGroup uuid](self->_tabGroup, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
    objc_msgSend(v14, "switchToTabWithUUID:inTabGroupWithUUID:", v5, v8);

LABEL_10:
    goto LABEL_11;
  }
  if (-[WBTabGroup isLocal](self->_tabGroup, "isLocal"))
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  else
  {
    v12 = -[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing");
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v12)
      v11 = 1;
    else
      v11 = 2;
  }
  objc_msgSend(v9, "didUseSidebarAction:", v11);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didSwitchToTabGroupFromLocation:", 0);

  if ((objc_msgSend(v14, "scrollTabSwitcherToTabGroupIfShowing:", self->_tabGroup) & 1) == 0)
  {
    -[WBTabGroup uuid](self->_tabGroup, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActiveTabGroupUUID:", v4);
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)isSelected
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;

  if (self->_tab)
  {
    -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultTabToSelectInTabGroup:", self->_tabGroup);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WBSIsEqual();

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 1;
  }
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBSIsEqual();

  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup uuid](self->_tabGroup, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isTabGroupUUIDExpanded:", v11);

  v13 = v9 ^ 1;
  if ((v6 & 1) == 0 && (v13 & 1) == 0 && v12)
    return 1;
  if (self->_tab)
    v15 = 1;
  else
    v15 = v12;
  if (((v15 | v13) & 1) != 0)
    return 0;
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeLibraryType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17 == 0;

  return v14;
}

- (BOOL)shouldPersistSelection
{
  void *v4;
  void *v5;
  char v6;

  if (self->_tab)
    return 1;
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup uuid](self->_tabGroup, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isTabGroupUUIDExpanded:", v5);

  return v6 ^ 1;
}

- (id)accessibilityIdentifier
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (self->_tab)
    return CFSTR("TabLibraryItem");
  v8[0] = CFSTR("isSyncable");
  if (-[WBTabGroup isSyncable](self->_tabGroup, "isSyncable"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v8[1] = CFSTR("isPrivate");
  v9[0] = v4;
  if (-[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasSubitems
{
  if (self->_tab)
    return 0;
  else
    return !-[TabGroupLibraryItemController _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked");
}

- (BOOL)_isPrivateBrowsingAndLocked
{
  int v2;
  void *v3;
  char v4;

  v2 = -[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing");
  if (v2)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPrivateBrowsingLocked");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)subitems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  TabGroupLibraryItemController *v18;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryItemController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup tabs](self->_tabGroup, "tabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinnedTabsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBTabGroup isLocal](self->_tabGroup, "isLocal"))
  {
    objc_msgSend(v6, "pinnedTabs");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    objc_msgSend(v3, "addObjectsFromArray:", v7);
    goto LABEL_6;
  }
  if (-[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing"))
  {
    objc_msgSend(v6, "privatePinnedTabs");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!-[WBTabGroup isUnnamed](self->_tabGroup, "isUnnamed"))
    goto LABEL_7;
  -[WBTabGroup profileIdentifier](self->_tabGroup, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PinnedTabsContainer containerWithActiveProfileIdentifier:](PinnedTabsContainer, "containerWithActiveProfileIdentifier:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pinnedTabsInContainer:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v15);

LABEL_6:
LABEL_7:
  objc_msgSend(v5, "safari_partionedArrayUsingCondition:", &__block_literal_global_29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v9);
  objc_msgSend(v3, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__TabGroupLibraryItemController_subitems__block_invoke_2;
  v16[3] = &unk_1E9CF6F30;
  v17 = v4;
  v18 = self;
  v11 = v4;
  objc_msgSend(v10, "safari_mapObjectsUsingBlock:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __41__TabGroupLibraryItemController_subitems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned") ^ 1;
}

TabGroupLibraryItemController *__41__TabGroupLibraryItemController_subitems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  TabGroupLibraryItemController *v4;
  uint64_t v5;
  void *v6;
  TabGroupLibraryItemController *v7;

  v3 = a2;
  v4 = [TabGroupLibraryItemController alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TabGroupLibraryItemController initWithConfiguration:sectionController:tabGroup:tab:](v4, "initWithConfiguration:sectionController:tabGroup:tab:", v5, v6, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), v3);

  return v7;
}

- (BOOL)isExpanded
{
  void *v4;
  void *v5;
  char v6;

  if (self->_tab || -[TabGroupLibraryItemController _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked"))
    return 0;
  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup uuid](self->_tabGroup, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isTabGroupUUIDExpanded:", v5);

  return v6;
}

- (void)willToggleExpansionState
{
  void *v3;
  id v4;

  -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBTabGroup uuid](self->_tabGroup, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleTabGroupUUIDExpanded:", v3);

}

- (void)willDisplayCell:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (self->_tab)
  {
    v18 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v18;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = v18;
      -[WBTab uuid](self->_tab, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tabIconRegistration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = WBSIsEqual();

      if ((v11 & 1) == 0)
      {
        -[LibraryItemController configuration](self, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "tabIconPool");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[WBTab uuid](self->_tab, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
        objc_msgSend(v13, "makeRegistrationForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTabIconRegistration:", v17);

      }
      v4 = v18;
    }
  }

}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (BOOL)allowsMoveOperation
{
  return self->_tab || -[TabGroupLibraryItemController isTabGroupSynced](self, "isTabGroupSynced");
}

- (id)dragItems
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[TabGroupLibraryItemController _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked"))
    return MEMORY[0x1E0C9AA60];
  if (self->_tab)
  {
    -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dragItemForTab:tabItem:", self->_tab, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3758], "_sf_itemWithTabGroup:", self->_tabGroup);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TabGroupLibraryItemController _isPrivateBrowsingAndLocked](self, "_isPrivateBrowsingAndLocked"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "items");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (-[TabGroupLibraryItemController isTabGroupSynced](self, "isTabGroupSynced", (_QWORD)v20))
          {
            objc_msgSend(v11, "_sf_localTabGroup");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              v5 = 3;
              goto LABEL_25;
            }
          }
          objc_msgSend(v11, "_sf_localBookmark");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v5 = 2;
          }
          else
          {
            objc_msgSend(v11, "safari_localWBTab");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              if ((objc_msgSend(v14, "isPinned") & 1) != 0
                || (v16 = objc_msgSend(v15, "isPrivateBrowsing"),
                    v16 != -[WBTabGroup isPrivateBrowsing](self->_tabGroup, "isPrivateBrowsing")))
              {

                goto LABEL_24;
              }
              v5 = 3;
            }
            else
            {
              objc_msgSend(v11, "itemProvider");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "canLoadObjectOfClass:", objc_opt_class());

              if (v18)
                v5 = 2;
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
LABEL_24:
      v5 = 0;
    }
LABEL_25:

  }
  return v5;
}

- (int64_t)dropIntentForSession:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[TabGroupLibraryItemController _sessionContainsTabGroup:](self, "_sessionContainsTabGroup:", v4)
    || self->_tab && -[TabGroupLibraryItemController _sessionContainsLocalTabs:](self, "_sessionContainsLocalTabs:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(a4, "items", a3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v8 = 0x1E0C99000uLL;
    v9 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(v11, "_sf_localTabGroup");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v27 = (void *)v12;
          -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "moveTabGroup:beforeOrAfterTabGroup:", v27, *(Class *)((char *)&self->super.super.isa + v9[564]));

          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "didUseSidebarAction:", 16);

          goto LABEL_20;
        }
        objc_msgSend(v11, "_sf_localBookmark");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "openBookmark:inTabGroup:", v14, *(Class *)((char *)&self->super.super.isa + v9[564]));

          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "didUseSidebarAction:", 18);
LABEL_11:

          goto LABEL_12;
        }
        objc_msgSend(v11, "safari_localWBTab");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[TabGroupLibraryItemController tabGroupProvider](self, "tabGroupProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tabGroupUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v9[564]), "uuid");
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "moveTab:fromTabGroupWithUUID:toTabGroupWithUUID:afterTab:", v14, v17, v19, self->_tab);

          v8 = v18;
          v9 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;

          goto LABEL_11;
        }
        objc_msgSend(v11, "itemProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v8;
        v22 = objc_msgSend(v20, "canLoadObjectOfClass:", objc_opt_class());

        if (v22)
        {
          v23 = *(void **)(v21 + 3736);
          v36 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __65__TabGroupLibraryItemController_performDropWithProposal_session___block_invoke;
          v31[3] = &unk_1E9CF1C48;
          v31[4] = self;
          objc_msgSend(v23, "_sf_urlsFromDragItems:completionHandler:", v24, v31);

          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "didUseSidebarAction:", 18);

        }
        v8 = v21;
        v9 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;
LABEL_12:

        ++v10;
      }
      while (v6 != v10);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v6 = v26;
    }
    while (v26);
  }
LABEL_20:

}

void __65__TabGroupLibraryItemController_performDropWithProposal_session___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "tabGroupProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "openURL:inTabGroup:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)_sessionContainsLocalTabs:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_36);

  return v4;
}

BOOL __59__TabGroupLibraryItemController__sessionContainsLocalTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "safari_localWBTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "safari_localTab");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_sessionContainsTabGroup:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_37_1);

  return v4;
}

BOOL __58__TabGroupLibraryItemController__sessionContainsTabGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "_sf_localTabGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; tabGroup = %@, tab = %@>"),
    v5,
    self,
    self->_tabGroup,
    self->_tab);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TabGroupLibraryItemController *v4;
  void *v5;
  void *v6;
  TabGroupLibraryItemController *v7;

  v4 = [TabGroupLibraryItemController alloc];
  -[LibraryItemController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryItemController sectionController](self, "sectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TabGroupLibraryItemController initWithConfiguration:sectionController:tabGroup:tab:](v4, "initWithConfiguration:sectionController:tabGroup:tab:", v5, v6, self->_tabGroup, self->_tab);

  return v7;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTab)tab
{
  return self->_tab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_pinnedAccessory, 0);
}

@end
