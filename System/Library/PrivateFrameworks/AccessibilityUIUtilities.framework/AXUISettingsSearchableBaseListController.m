@implementation AXUISettingsSearchableBaseListController

- (void)viewDidLoad
{
  UISearchController *v3;
  UISearchController *searchController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UISearchController *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsSearchableBaseListController;
  -[AXUISettingsSetupCapableListController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutocapitalizationType:", 0);

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyboardType:", 0);

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutocorrectionType:", 1);

  v9 = self->_searchController;
  -[AXUISettingsSearchableBaseListController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchController:", v9);

  -[AXUISettingsSearchableBaseListController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesSearchBarWhenScrolling:", 0);

  -[AXUISettingsSearchableBaseListController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  NSString *cachedSearchTextWhileDeactivating;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSString *v9;

  cachedSearchTextWhileDeactivating = self->_cachedSearchTextWhileDeactivating;
  v5 = a3;
  if (-[NSString length](cachedSearchTextWhileDeactivating, "length"))
  {
    -[AXUISettingsSearchableBaseListController setSearchText:](self, "setSearchText:", self->_cachedSearchTextWhileDeactivating);
  }
  else
  {
    objc_msgSend(v5, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSearchableBaseListController setSearchText:](self, "setSearchText:", v7);

  }
  v8 = objc_msgSend(v5, "isActive");

  if ((v8 & 1) == 0)
  {
    v9 = self->_cachedSearchTextWhileDeactivating;
    self->_cachedSearchTextWhileDeactivating = 0;

  }
  -[AXUISettingsSearchableBaseListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSString length](self->_cachedSearchTextWhileDeactivating, "length"))
    objc_msgSend(v4, "setText:", self->_cachedSearchTextWhileDeactivating);

}

- (id)specifiers
{
  id *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  id *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AXUISettingsSearchableBaseListController _loadAllSpecifiersIfNeeded](self, "_loadAllSpecifiersIfNeeded");
  v3 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!*v3)
  {
    if (-[NSString length](self->_searchText, "length"))
    {
      v19 = v3;
      v20 = (void *)objc_opt_new();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v4 = self->_allSpecifiers;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = 0;
        v9 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(v4);
            v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (-[AXUISettingsSearchableBaseListController _specifierIsGroupSpecifier:](self, "_specifierIsGroupSpecifier:", v11, v19))
            {
              if (v8 && objc_msgSend(v7, "count"))
              {
                objc_msgSend(v20, "addObject:", v8);
                objc_msgSend(v20, "addObjectsFromArray:", v7);
              }
              v12 = v11;

              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v13 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v13;
              v8 = v12;
            }
            else
            {
              -[AXUISettingsSearchableBaseListController searchText](self, "searchText");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = -[AXUISettingsSearchableBaseListController shouldShowSpecifier:withSearchText:](self, "shouldShowSpecifier:withSearchText:", v11, v14);

              if (v15)
                objc_msgSend(v7, "addObject:", v11);
            }
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v6);

        if (v8)
        {
          v3 = v19;
          if (objc_msgSend(v7, "count"))
          {
            objc_msgSend(v20, "addObject:", v8);
            objc_msgSend(v20, "addObjectsFromArray:", v7);
          }
          goto LABEL_23;
        }
      }
      else
      {

        v8 = 0;
        v7 = 0;
      }
      v3 = v19;
LABEL_23:
      v16 = *v3;
      *v3 = v20;
      v17 = v20;

      return *v3;
    }
    objc_storeStrong(v3, self->_allSpecifiers);
  }
  return *v3;
}

- (void)deactivateAndPersistSearchText
{
  void *v3;
  int v4;
  NSString *v5;
  NSString *cachedSearchTextWhileDeactivating;
  id v7;

  -[AXUISettingsSearchableBaseListController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[AXUISettingsSearchableBaseListController searchText](self, "searchText");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedSearchTextWhileDeactivating = self->_cachedSearchTextWhileDeactivating;
    self->_cachedSearchTextWhileDeactivating = v5;

    -[AXUISettingsSearchableBaseListController searchController](self, "searchController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

  }
}

- (void)setNeedsSpecifierRefresh
{
  self->_needsSpecifierRefresh = 1;
}

- (void)_loadAllSpecifiersIfNeeded
{
  NSArray *v3;
  NSArray *allSpecifiers;

  if (!self->_allSpecifiers || self->_needsSpecifierRefresh)
  {
    self->_needsSpecifierRefresh = 0;
    -[AXUISettingsSearchableBaseListController makeSpecifiers](self, "makeSpecifiers");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allSpecifiers = self->_allSpecifiers;
    self->_allSpecifiers = v3;

  }
}

- (BOOL)_specifierIsGroupSpecifier:(id)a3
{
  return a3 && *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D805B0]) == 0;
}

- (id)makeSpecifiers
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("This needs to be overridden"));
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldShowSpecifier:(id)a3 withSearchText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rangeOfString:options:", v6, 1) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_searchText, a3);
}

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (void)setAllSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_cachedSearchTextWhileDeactivating, 0);
}

@end
