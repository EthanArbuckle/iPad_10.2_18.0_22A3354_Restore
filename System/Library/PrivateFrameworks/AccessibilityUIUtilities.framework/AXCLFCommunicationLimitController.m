@implementation AXCLFCommunicationLimitController

- (NSArray)communicationLimitSpecifiers
{
  void *v2;
  void *v4;
  _SingleCommunicationLimitSpecifiers *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SingleCommunicationLimitSpecifiers *v10;
  void *v11;
  void *v12;
  _SingleCommunicationLimitSpecifiers *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _SingleCommunicationLimitSpecifiers *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [_SingleCommunicationLimitSpecifiers alloc];
  -[AXCLFCommunicationLimitController incomingHeaderText](self, "incomingHeaderText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incomingCommunicationLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D10730];
  v10 = -[_SingleCommunicationLimitSpecifiers initWithHeaderText:communicationLimit:maximumCommunicationLimit:](v5, "initWithHeaderText:communicationLimit:maximumCommunicationLimit:", v6, v8, *MEMORY[0x1E0D10730]);
  -[AXCLFCommunicationLimitController setIncomingSpecifiers:](self, "setIncomingSpecifiers:", v10);

  -[AXCLFCommunicationLimitController incomingSpecifiers](self, "incomingSpecifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allSpecifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v12);

  v13 = [_SingleCommunicationLimitSpecifiers alloc];
  -[AXCLFCommunicationLimitController outgoingHeaderText](self, "outgoingHeaderText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController settings](self, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outgoingCommunicationLimit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController settings](self, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "requiresMoreRestrictiveOutgoingCommunicationLimit");
  if (v18)
  {
    -[AXCLFCommunicationLimitController settings](self, "settings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "incomingCommunicationLimit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = -[_SingleCommunicationLimitSpecifiers initWithHeaderText:communicationLimit:maximumCommunicationLimit:](v13, "initWithHeaderText:communicationLimit:maximumCommunicationLimit:", v14, v16, v9);
  -[AXCLFCommunicationLimitController setOutgoingSpecifiers:](self, "setOutgoingSpecifiers:", v19);

  if (v18)
  {

  }
  -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allSpecifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v21);

  v22 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("FAVORITES"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "groupSpecifierWithName:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXCLFCommunicationLimitController favoritesFooterText](self, "favoritesFooterText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProperty:forKey:", v25, *MEMORY[0x1E0D80848]);

  objc_msgSend(v4, "addObject:", v24);
  -[AXCLFCommunicationLimitController _favoritesSpecifiers](self, "_favoritesSpecifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v26);

  return (NSArray *)v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXCLFCommunicationLimitController;
  -[AXCLFCommunicationLimitController viewDidLoad](&v3, sel_viewDidLoad);
  -[AXCLFCommunicationLimitController _updateEditButton](self, "_updateEditButton");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXCLFCommunicationLimitController;
  -[AXCLFCommunicationLimitController setEditing:animated:](&v7, sel_setEditing_animated_);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "setEditing:animated:", v5, v4);
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXCLFCommunicationLimitController;
  v6 = a4;
  -[AXCLFCommunicationLimitController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v18.receiver, v18.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXCLFCommunicationLimitController _singleCommunicationLimitSpecifiersForSpecifier:](self, "_singleCommunicationLimitSpecifiersForSpecifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "groupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", *MEMORY[0x1E0D808E0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v7)
    {
      objc_msgSend(MEMORY[0x1E0D10750], "commonLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[AXCLFCommunicationLimitController tableView:didSelectRowAtIndexPath:].cold.1();

    }
    objc_msgSend(v9, "communicationLimitForSpecifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCLFCommunicationLimitController incomingSpecifiers](self, "incomingSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v14)
    {
      -[AXCLFCommunicationLimitController settings](self, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIncomingCommunicationLimit:", v13);

      -[AXCLFCommunicationLimitController _updateForOutgoingCommunicationLimit](self, "_updateForOutgoingCommunicationLimit");
    }
    else
    {
      -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v15)
      {
        -[AXCLFCommunicationLimitController settings](self, "settings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOutgoingCommunicationLimit:", v13);

      }
    }

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("favoritesEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("favoritesEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;

  if (a4 == 1)
  {
    -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyForKey:", CFSTR("favoritesEntry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "favoritesEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v7);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[AXCLFCommunicationLimitController setShouldAvoidReloadForNextFavoritesUpdate:](self, "setShouldAvoidReloadForNextFavoritesUpdate:", 1);
        -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeEntriesAtIndexes:", v13);

        -[AXCLFCommunicationLimitController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
        goto LABEL_10;
      }
      CLFLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXCLFCommunicationLimitController tableView:commitEditingStyle:forRowAtIndexPath:].cold.2();
    }
    else
    {
      CLFLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXCLFCommunicationLimitController tableView:commitEditingStyle:forRowAtIndexPath:].cold.1();
    }

LABEL_10:
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("favoritesEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertyForKey:", CFSTR("favoritesEntry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v8;
  else
    v11 = v7;
  v12 = v11;

  return v12;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  if (a4 && a5)
  {
    v7 = a5;
    -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("favoritesEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCLFCommunicationLimitController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "propertyForKey:", CFSTR("favoritesEntry"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13)
    {
      CLFLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXCLFCommunicationLimitController tableView:moveRowAtIndexPath:toIndexPath:].cold.2();
    }
    else
    {
      -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "favoritesEntries");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "indexOfObject:", v9);

      -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "favoritesEntries");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "indexOfObject:", v12);

      if (v17 == 0x7FFFFFFFFFFFFFFFLL || v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CLFLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[AXCLFCommunicationLimitController tableView:moveRowAtIndexPath:toIndexPath:].cold.1();
      }
      else
      {
        -[AXCLFCommunicationLimitController setShouldAvoidReloadForNextFavoritesUpdate:](self, "setShouldAvoidReloadForNextFavoritesUpdate:", 1);
        -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject moveEntryAtIndex:toIndex:](v14, "moveEntryAtIndex:toIndex:", v17, v20);
      }
    }

  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  -[AXCLFCommunicationLimitController presentedViewController](self, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__AXCLFCommunicationLimitController_contactPickerDidCancel___block_invoke;
    v6[3] = &unk_1E76AB330;
    v6[4] = self;
    -[AXCLFCommunicationLimitController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  }
  else
  {
    -[AXCLFCommunicationLimitController setFavoritesEntryPicker:](self, "setFavoritesEntryPicker:", 0);
  }
}

uint64_t __60__AXCLFCommunicationLimitController_contactPickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFavoritesEntryPicker:", 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "invalidateSelectionAnimated:", 1);
  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController _favoritesEntryPickerContactForContact:contactStore:](self, "_favoritesEntryPickerContactForContact:contactStore:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97538]), "initWithContact:", v6);
    -[AXCLFCommunicationLimitController setFavoritesEntryPicker:](self, "setFavoritesEntryPicker:", v10);

    -[AXCLFCommunicationLimitController favoritesEntryPicker](self, "favoritesEntryPicker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[AXCLFCommunicationLimitController favoritesEntryPicker](self, "favoritesEntryPicker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "favoritesEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) != 0)
  {
    CLFLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXCLFCommunicationLimitController favoritesEntryPicker:didPickEntry:].cold.1();
  }
  else if (-[AXCLFCommunicationLimitController _isAllowedFavoritesEntry:](self, "_isAllowedFavoritesEntry:", v5))
  {
    -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canAddEntry");

    if (v11)
    {
      -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject addEntry:](v9, "addEntry:", v5);
    }
    else
    {
      CLFLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXCLFCommunicationLimitController favoritesEntryPicker:didPickEntry:].cold.2();
    }
  }
  else
  {
    CLFLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1BD892000, v9, OS_LOG_TYPE_DEFAULT, "Not adding favorites entry as it is for an unrelated app: %@", buf, 0xCu);
    }
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__AXCLFCommunicationLimitController_favoritesEntryPicker_didPickEntry___block_invoke;
  v12[3] = &unk_1E76AB330;
  v12[4] = self;
  -[AXCLFCommunicationLimitController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);

}

uint64_t __71__AXCLFCommunicationLimitController_favoritesEntryPicker_didPickEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFavoritesEntryPicker:", 0);
}

- (void)_updateForOutgoingCommunicationLimit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outgoingCommunicationLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "requiresMoreRestrictiveOutgoingCommunicationLimit") & 1) != 0)
  {
    -[AXCLFCommunicationLimitController settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incomingCommunicationLimit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateForCommunicationLimit:maximumCommunicationLimit:", v5, v8);

  }
  else
  {
    objc_msgSend(v3, "updateForCommunicationLimit:maximumCommunicationLimit:", v5, *MEMORY[0x1E0D10730]);
  }

  -[AXCLFCommunicationLimitController settings](self, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requiresMoreRestrictiveOutgoingCommunicationLimit");

  if (v10)
  {
    -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCLFCommunicationLimitController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v11, 1);

  }
}

- (id)_singleCommunicationLimitSpecifiersForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[AXCLFCommunicationLimitController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCLFCommunicationLimitController incomingSpecifiers](self, "incomingSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    -[AXCLFCommunicationLimitController incomingSpecifiers](self, "incomingSpecifiers");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    -[AXCLFCommunicationLimitController outgoingSpecifiers](self, "outgoingSpecifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)_specifierForFavoritesEntry:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D804E8];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v7, "setProperty:forKey:", v5, CFSTR("favoritesEntry"));

  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("favoritesController"));

  return v7;
}

- (id)_favoritesSpecifiers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DBD138]);
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_msgSend(v4, "initWithContactStore:prefetchCount:", v5, 0);
    -[AXCLFCommunicationLimitController setFavoritesController:](self, "setFavoritesController:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DBD180];
    -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__favoritesDidChange_, v8, v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "favoritesEntries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[AXCLFCommunicationLimitController _isAllowedFavoritesEntry:](self, "_isAllowedFavoritesEntry:", v17))
        {
          -[AXCLFCommunicationLimitController _specifierForFavoritesEntry:](self, "_specifierForFavoritesEntry:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v19 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("ADD_FAVORITE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 13, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setButtonAction:", sel__addFavorite_);
  objc_msgSend(v10, "addObject:", v21);

  return v10;
}

- (BOOL)_isAllowedFavoritesEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXCLFCommunicationLimitController bundleIdentifiers](self, "bundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)_addFavorite:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C974B8]);
  objc_msgSend(v6, "setAllowsEditing:", 0);
  objc_msgSend(v6, "setAutocloses:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setHidesSearchableSources:", 1);
  objc_msgSend(v6, "setMode:", 2);
  objc_msgSend(v6, "setOnlyRealContacts:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("emailAddresses.@count > 0 OR phoneNumbers.@count > 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicateForEnablingContact:", v4);

  -[AXCLFCommunicationLimitController contactPickerPrompt](self, "contactPickerPrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrompt:", v5);

  -[AXCLFCommunicationLimitController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (id)_favoritesEntryPickerContactForContact:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C97538], "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "areKeysAvailable:", v8))
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableKeyDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v10, "addObject:", v11);
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v10, &v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    if (!v9)
    {
      CLFLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v18 = v5;
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = v13;
        _os_log_error_impl(&dword_1BD892000, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a compatible contact using contact (%@) and contact store (%@) due to an error (%@).", buf, 0x20u);
      }

    }
  }

  return v9;
}

- (void)_favoritesDidChange:(id)a3
{
  if (-[AXCLFCommunicationLimitController shouldAvoidReloadForNextFavoritesUpdate](self, "shouldAvoidReloadForNextFavoritesUpdate", a3))
  {
    -[AXCLFCommunicationLimitController setShouldAvoidReloadForNextFavoritesUpdate:](self, "setShouldAvoidReloadForNextFavoritesUpdate:", 0);
  }
  else
  {
    -[AXCLFCommunicationLimitController reloadSpecifiers](self, "reloadSpecifiers");
  }
  -[AXCLFCommunicationLimitController _updateEditButton](self, "_updateEditButton");
}

- (void)_updateEditButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[AXCLFCommunicationLimitController favoritesController](self, "favoritesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoritesEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[AXCLFCommunicationLimitController editButtonItem](self, "editButtonItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AXCLFCommunicationLimitController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v8);

  }
  else
  {
    -[AXCLFCommunicationLimitController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", 0);

    -[AXCLFCommunicationLimitController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (_SingleCommunicationLimitSpecifiers)incomingSpecifiers
{
  return self->_incomingSpecifiers;
}

- (void)setIncomingSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_incomingSpecifiers, a3);
}

- (_SingleCommunicationLimitSpecifiers)outgoingSpecifiers
{
  return self->_outgoingSpecifiers;
}

- (void)setOutgoingSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingSpecifiers, a3);
}

- (TPFavoritesController)favoritesController
{
  return self->_favoritesController;
}

- (void)setFavoritesController:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesController, a3);
}

- (CNUIFavoritesEntryPicker)favoritesEntryPicker
{
  return self->_favoritesEntryPicker;
}

- (void)setFavoritesEntryPicker:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesEntryPicker, a3);
}

- (BOOL)shouldAvoidReloadForNextFavoritesUpdate
{
  return self->_shouldAvoidReloadForNextFavoritesUpdate;
}

- (void)setShouldAvoidReloadForNextFavoritesUpdate:(BOOL)a3
{
  self->_shouldAvoidReloadForNextFavoritesUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesEntryPicker, 0);
  objc_storeStrong((id *)&self->_favoritesController, 0);
  objc_storeStrong((id *)&self->_outgoingSpecifiers, 0);
  objc_storeStrong((id *)&self->_incomingSpecifiers, 0);
}

- (NSString)outgoingHeaderText
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSString)incomingHeaderText
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSString)favoritesFooterText
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSString)contactPickerPrompt
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSArray)actionTypes
{
  NSArray *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSArray)bundleIdentifiers
{
  NSArray *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (CLFBaseCommunicationLimitSettings)settings
{
  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  return (CLFBaseCommunicationLimitSettings *)objc_msgSend(MEMORY[0x1E0D10770], "sharedInstance");
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_1BD892000, v0, OS_LOG_TYPE_FAULT, "Radio group checked specifier was unexpectedly out of sync with the selected specifier. Checked: %@, selected: %@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)tableView:commitEditingStyle:forRowAtIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Unexpectedly tried to delete a specifier with no Favorites entry associated: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tableView:commitEditingStyle:forRowAtIndexPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Unable to find Favorites entry in list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_12();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_6_0(&dword_1BD892000, v0, v1, "Unable to find source or destination favorites in the list. Source index: %lu, destination index: %lu", v2, v3);
  OUTLINED_FUNCTION_3();
}

- (void)tableView:moveRowAtIndexPath:toIndexPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1BD892000, v0, v1, "Missing source or destination favorites entry. Source specifier: %@, destination specifier: %@");
  OUTLINED_FUNCTION_3();
}

- (void)favoritesEntryPicker:didPickEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Not adding favorites entry as it exists already: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)favoritesEntryPicker:didPickEntry:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Not adding favorites entry, as adding was not allowed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
