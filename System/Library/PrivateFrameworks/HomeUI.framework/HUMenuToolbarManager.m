@implementation HUMenuToolbarManager

- (HUMenuToolbarManager)initWithAppNavigator:(id)a3
{
  id v4;
  HUMenuToolbarManager *v5;
  HUMenuToolbarManager *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUMenuToolbarManager;
  v5 = -[HUMenuToolbarManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appNavigator, v4);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMenuToolbarManager setHome:](v6, "setHome:", v8);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHomeObserver:", v6);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addHomeManagerObserver:", v6);

  }
  return v6;
}

- (void)setHome:(id)a3
{
  HMRoom *v5;
  HMRoom *room;
  id v7;

  v7 = a3;
  if ((-[HMHome isEqual:](self->_home, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_home, a3);
    objc_msgSend(v7, "hf_selectedRoom");
    v5 = (HMRoom *)objc_claimAutoreleasedReturnValue();
    room = self->_room;
    self->_room = v5;

    -[HUMenuToolbarManager buildMenu](self, "buildMenu");
  }

}

- (void)setRoom:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[HMRoom isEqual:](self->_room, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_room, a3);
    -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
  }

}

- (void)setMenuBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_menuBuilder, a3);
  -[HUMenuToolbarManager buildMenu](self, "buildMenu");
}

- (void)buildMenu
{
  void *v3;

  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUMenuToolbarManager refreshFileMenu](self, "refreshFileMenu");
    -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu");
    -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
    -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
    -[HUMenuToolbarManager refreshHelpMenu](self, "refreshHelpMenu");
  }
}

- (void)refreshHelpMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuForIdentifier:", CFSTR("HUMenuToolbarIdentifierHelp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUMenuToolbarManager _helpMenuIdentifiers](self, "_helpMenuIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__HUMenuToolbarManager_refreshHelpMenu__block_invoke;
    v9[3] = &unk_1E6F50F00;
    v9[4] = self;
    objc_msgSend(v5, "na_map:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, CFSTR("HUMenuToolbarIdentifierHelp"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertChildMenu:atEndOfMenuForIdentifier:", v7, *MEMORY[0x1E0CEB9B0]);

  }
}

uint64_t __39__HUMenuToolbarManager_refreshHelpMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildActionForIdentifier:", a2);
}

- (void)refreshViewMenuChildren
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HUMenuToolbarManager _subViewMenuIdentifiers](self, "_subViewMenuIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HUMenuToolbarManager_refreshViewMenuChildren__block_invoke;
  v6[3] = &unk_1E6F50F28;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "na_each:", v6);

  if (*((_BYTE *)v8 + 24))
  {
    -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "system");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsRebuild");

  }
  _Block_object_dispose(&v7, 8);
}

void __47__HUMenuToolbarManager_refreshViewMenuChildren__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_buildMenuForIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "menuBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuForIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "menuBuilder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "replaceMenuForIdentifier:withMenu:", v7, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "menuBuilder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertChildMenu:atStartOfMenuForIdentifier:", v3, *MEMORY[0x1E0CEB9D8]);
    }

  }
}

- (void)refreshViewMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[HUMenuToolbarManager _viewMenuIdentifiers](self, "_viewMenuIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshViewMenu__block_invoke;
  v11[3] = &unk_1E6F50F00;
  v11[4] = self;
  objc_msgSend(v3, "na_map:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, CFSTR("HUMenuToolbarIdentifierView"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuForIdentifier:", CFSTR("HUMenuToolbarIdentifierView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "replaceMenuForIdentifier:withMenu:", CFSTR("HUMenuToolbarIdentifierView"), v5);

    -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "system");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsRebuild");

  }
  else
  {
    objc_msgSend(v8, "insertChildMenu:atStartOfMenuForIdentifier:", v5, *MEMORY[0x1E0CEB9D8]);
  }

}

uint64_t __39__HUMenuToolbarManager_refreshViewMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildKeyCommandForIdentifier:", a2);
}

- (void)refreshFileMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[HUMenuToolbarManager _fileMenuIdentifiers](self, "_fileMenuIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshFileMenu__block_invoke;
  v11[3] = &unk_1E6F50F00;
  v11[4] = self;
  objc_msgSend(v3, "na_map:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, CFSTR("HUMenuToolbarIdentifierFile"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuForIdentifier:", CFSTR("HUMenuToolbarIdentifierFile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "replaceMenuForIdentifier:withMenu:", CFSTR("HUMenuToolbarIdentifierFile"), v5);

    -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "system");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsRebuild");

  }
  else
  {
    objc_msgSend(v8, "insertChildMenu:atStartOfMenuForIdentifier:", v5, *MEMORY[0x1E0CEB9A0]);
  }

}

uint64_t __39__HUMenuToolbarManager_refreshFileMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildActionForIdentifier:", a2);
}

- (void)refreshEditMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[HUMenuToolbarManager _editMenuIdentifiers](self, "_editMenuIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshEditMenu__block_invoke;
  v11[3] = &unk_1E6F50F00;
  v11[4] = self;
  objc_msgSend(v3, "na_map:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, CFSTR("HUMenuToolbarIdentifierEdit"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuForIdentifier:", CFSTR("HUMenuToolbarIdentifierEdit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "replaceMenuForIdentifier:withMenu:", CFSTR("HUMenuToolbarIdentifierEdit"), v5);

    -[HUMenuToolbarManager menuBuilder](self, "menuBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "system");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsRebuild");

  }
  else
  {
    objc_msgSend(v8, "insertSiblingMenu:afterMenuForIdentifier:", v5, *MEMORY[0x1E0CEB9D0]);
  }

}

uint64_t __39__HUMenuToolbarManager_refreshEditMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildKeyCommandForIdentifier:", a2);
}

- (id)_fileMenuIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUMenuToolbarIdentifierAddAutomation");
  v3[1] = CFSTR("HUMenuToolbarIdentifierAddScene");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_editMenuIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUMenuToolbarIdentifierEditHome");
  v3[1] = CFSTR("HUMenuToolbarIdentifierEditRoom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_helpMenuIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUMenuToolbarIdentifierAboutHomeKit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_viewMenuIdentifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUMenuToolbarIdentifierHome");
  v3[1] = CFSTR("HUMenuToolbarIdentifierAutomation");
  v3[2] = CFSTR("HUMenuToolbarIdentifierDiscover");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_subViewMenuIdentifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUMenuToolbarIdentifierInvitation");
  v3[1] = CFSTR("HUMenuToolbarIdentifierRoomList");
  v3[2] = CFSTR("HUMenuToolbarIdentifierHomeList");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldEnableIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAddAutomation")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAddScene")))
    {
      -[HUMenuToolbarManager home](self, "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "hf_currentUserIsAdministrator"))
      {
        -[HUMenuToolbarManager home](self, "home");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "hf_containsActionableAccessories");
        goto LABEL_7;
      }
LABEL_25:
      LOBYTE(self) = 0;
      goto LABEL_26;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierEditHome")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierHome")))
    {
      -[HUMenuToolbarManager home](self, "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = v5 != 0;
      goto LABEL_26;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierEditRoom")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierRoomList")))
    {
      -[HUMenuToolbarManager home](self, "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_25;
      -[HUMenuToolbarManager home](self, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        LOBYTE(self) = 1;
      }
      else
      {
        -[HUMenuToolbarManager room](self, "room");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUMenuToolbarManager home](self, "home");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "roomForEntireHome");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(self) = objc_msgSend(v9, "isEqual:", v11) ^ 1;

      }
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAutomation")))
      {
        -[HUMenuToolbarManager home](self, "home");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "hf_hasAnyVisibleTriggers") & 1) != 0)
        {
          LOBYTE(self) = 1;
          goto LABEL_26;
        }
        -[HUMenuToolbarManager home](self, "home");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "hf_userIsAllowedToCreateTrigger") & 1) != 0)
        {
          LOBYTE(self) = 1;
          goto LABEL_8;
        }
        v7 = HFForceAllowAutomationCreation();
        goto LABEL_7;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierDiscover")))
      {
        -[HUMenuToolbarManager home](self, "home");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0D31870], "getAvailabilityDictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = v12 != 0;

          goto LABEL_26;
        }
        goto LABEL_25;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAboutHomeKit")) & 1) != 0)
      {
        LOBYTE(self) = 1;
        goto LABEL_27;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierInvitation")))
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "homeManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "incomingHomeInvitations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierHomeList")))
        {
          LOBYTE(self) = 0;
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "homeManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "homes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v14;
      LOBYTE(self) = objc_msgSend(v14, "count") != 0;
    }

    goto LABEL_8;
  }
  -[HUMenuToolbarManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hf_currentUserIsAdministrator"))
    goto LABEL_25;
  -[HUMenuToolbarManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_userCanCreateTrigger");
LABEL_7:
  LOBYTE(self) = v7;
LABEL_8:

LABEL_26:
LABEL_27:

  return (char)self;
}

- (id)_buildMenuForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierHomeList"))
    && -[HUMenuToolbarManager _shouldEnableIdentifier:](self, "_shouldEnableIdentifier:", v4))
  {
    -[HUMenuToolbarManager _buildHomeMenu](self, "_buildHomeMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierInvitation"))
         && -[HUMenuToolbarManager _shouldEnableIdentifier:](self, "_shouldEnableIdentifier:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incomingHomeInvitations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    HULocalizedStringWithFormat(CFSTR("HULocationInvitationCount"), CFSTR("%lu"), v10, v11, v12, v13, v14, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__HUMenuToolbarManager__buildMenuForIdentifier___block_invoke;
    v21[3] = &unk_1E6F4E328;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v16, 0, 0, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CEA740];
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", v16, 0, v4, 1, v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __48__HUMenuToolbarManager__buildMenuForIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appNavigator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "showHomeSettingsForHome:", 0);

}

- (id)_buildActionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  HUMenuToolbarManager *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  HUMenuToolbarManager *v19;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAddAutomation")))
  {
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerAddAutomation"), CFSTR("HUMenuToolbarManagerAddAutomation"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke;
    v18 = &unk_1E6F4E328;
    v19 = self;
    v7 = &v15;
LABEL_7:
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAddScene")))
  {
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerAddScene"), CFSTR("HUMenuToolbarManagerAddScene"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_2;
    v13 = &unk_1E6F4E328;
    v14 = self;
    v7 = &v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAboutHomeKit")))
  {
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerAboutHomeKit"), CFSTR("HUMenuToolbarManagerAboutHomeKit"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (uint64_t *)&__block_literal_global_60;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:
  if (!-[HUMenuToolbarManager _shouldEnableIdentifier:](self, "_shouldEnableIdentifier:", v4))
    objc_msgSend(v8, "setAttributes:", 1);

  return v8;
}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appNavigator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "showAddAutomationFlow");

}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appNavigator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "showAddSceneFlowOnHomeTab");

}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_3()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[HUStoreUtilities accessoryStoreURL](HUStoreUtilities, "accessoryStoreURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "openURL:", v0);

}

- (id)_buildKeyCommandForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierEditHome")))
  {
    v5 = (void *)MEMORY[0x1E0CEA6B8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerEditHome"), CFSTR("HUMenuToolbarManagerEditHome"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel__editHomeMenuSelected;
    v8 = CFSTR("h");
LABEL_5:
    v9 = v5;
    v10 = v6;
    v11 = 1179648;
LABEL_13:
    objc_msgSend(v9, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v10, 0, v7, v8, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierEditRoom")))
  {
    v5 = (void *)MEMORY[0x1E0CEA6B8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerEditRoom"), CFSTR("HUMenuToolbarManagerEditRoom"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel__editRoomMenuSelected;
    v8 = CFSTR("r");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierHome")))
  {
    v12 = (void *)MEMORY[0x1E0CEA6B8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerHome"), CFSTR("HUMenuToolbarManagerHome"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel__homeMenuSelected;
    v8 = CFSTR("1");
LABEL_12:
    v9 = v12;
    v10 = v6;
    v11 = 0x100000;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierAutomation")))
  {
    v12 = (void *)MEMORY[0x1E0CEA6B8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerAutomation"), CFSTR("HUMenuToolbarManagerAutomation"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel__automationMenuSelected;
    v8 = CFSTR("2");
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUMenuToolbarIdentifierDiscover")))
  {
    v12 = (void *)MEMORY[0x1E0CEA6B8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerDiscover"), CFSTR("HUMenuToolbarManagerDiscover"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel__discoverMenuSelected;
    v8 = CFSTR("3");
    goto LABEL_12;
  }
  v13 = 0;
LABEL_14:
  if (!-[HUMenuToolbarManager _shouldEnableIdentifier:](self, "_shouldEnableIdentifier:", v4))
    objc_msgSend(v13, "setAttributes:", 1);

  return v13;
}

- (id)_buildHomeMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v24;
  id obj;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMenuToolbarManagerHomes"), CFSTR("HUMenuToolbarManagerHomes"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, &__block_literal_global_84_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributes:", 1);
  v24 = v6;
  objc_msgSend(v3, "addObject:", v6);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CEA2A8];
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __38__HUMenuToolbarManager__buildHomeMenu__block_invoke_2;
        v26[3] = &unk_1E6F50FB0;
        v26[4] = self;
        v26[5] = v14;
        objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUMenuToolbarManager home](self, "home");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        objc_msgSend(v17, "setState:", v21);
        objc_msgSend(v3, "addObject:", v17);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, CFSTR("HUMenuToolbarIdentifierHomeList"), 1, v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __38__HUMenuToolbarManager__buildHomeMenu__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showHome:", *(_QWORD *)(a1 + 40));

}

- (void)_editHomeMenuSelected
{
  id v2;
  id v3;

  -[HUMenuToolbarManager appNavigator](self, "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showHomeEditor");

}

- (void)_editRoomMenuSelected
{
  id v2;
  id v3;

  -[HUMenuToolbarManager appNavigator](self, "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showRoomEditor");

}

- (void)_homeMenuSelected
{
  id v2;
  id v3;

  -[HUMenuToolbarManager appNavigator](self, "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showHomeTab");

}

- (void)_automationMenuSelected
{
  id v2;
  id v3;

  -[HUMenuToolbarManager appNavigator](self, "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showAutomationTab");

}

- (void)_discoverMenuSelected
{
  id v2;
  id v3;

  -[HUMenuToolbarManager appNavigator](self, "appNavigator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "showDiscoverTab");

}

+ (BOOL)isValidMenuSelector:(SEL)a3
{
  return sel__editHomeMenuSelected == a3
      || sel__editRoomMenuSelected == a3
      || sel__homeMenuSelected == a3
      || sel__automationMenuSelected == a3
      || sel__discoverMenuSelected == a3;
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  -[HUMenuToolbarManager refreshFileMenu](self, "refreshFileMenu", a3, a4);
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu");
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  -[HUMenuToolbarManager refreshFileMenu](self, "refreshFileMenu", a3, a4);
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu");
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu", a3, a4);
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
  -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu", a3, a4);
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
  -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
}

- (void)home:(id)a3 didSelectRoom:(id)a4
{
  -[HUMenuToolbarManager setRoom:](self, "setRoom:", a4);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu", a3, a4);
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
  -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  -[HUMenuToolbarManager refreshEditMenu](self, "refreshEditMenu", a3, a4);
  -[HUMenuToolbarManager refreshViewMenu](self, "refreshViewMenu");
  -[HUMenuToolbarManager refreshViewMenuChildren](self, "refreshViewMenuChildren");
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  -[HUMenuToolbarManager setHome:](self, "setHome:", a5, a4);
}

- (UIMenuBuilder)menuBuilder
{
  return self->_menuBuilder;
}

- (HOAppNavigator)appNavigator
{
  return (HOAppNavigator *)objc_loadWeakRetained((id *)&self->_appNavigator);
}

- (void)setAppNavigator:(id)a3
{
  objc_storeWeak((id *)&self->_appNavigator, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_appNavigator);
  objc_storeStrong((id *)&self->_menuBuilder, 0);
}

@end
