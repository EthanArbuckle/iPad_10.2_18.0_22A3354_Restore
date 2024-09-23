@implementation GKDashboardMultiplayerPickerSearchDataSource

- (GKDashboardMultiplayerPickerSearchDataSource)initWithSearchPlayers:(id)a3 maxSelectable:(int64_t)a4
{
  id v6;
  GKDashboardMultiplayerPickerSearchDataSource *v7;
  uint64_t v8;
  NSArray *allPlayers;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardMultiplayerPickerSearchDataSource;
  v7 = -[GKCollectionDataSource init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    allPlayers = v7->_allPlayers;
    v7->_allPlayers = (NSArray *)v8;

    v7->_maxSelectable = a4;
  }

  return v7;
}

- (void)setupCollectionView:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerSearchDataSource;
  v3 = a3;
  -[GKCollectionDataSource setupCollectionView:](&v5, sel_setupCollectionView_, v3);
  +[NSObject _gkNib](GKDashboardPlayerPickerCell, "_gkNib", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v4, CFSTR("playerCell"));

}

- (double)preferredCollectionHeight
{
  double result;

  +[GKDashboardPlayerCell preferredCollectionHeight](GKDashboardPlayerPickerCell, "preferredCollectionHeight");
  return result;
}

- (NSArray)selectedPlayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GKDashboardMultiplayerPickerSearchDataSource allPlayers](self, "allPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "referenceKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 == 1)
          objc_msgSend(v15, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v15, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

- (void)searchTextHasChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[GKDashboardMultiplayerPickerSearchDataSource isSearching](self, "isSearching"))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[GKDashboardMultiplayerPickerSearchDataSource allPlayers](self, "allPlayers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (-[GKCollectionDataSource searchMatchesItem:inSection:](self, "searchMatchesItem:inSection:", v9, 0))
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerSearchDataSource setSearchPlayers:](self, "setSearchPlayers:", v10);

  }
  else
  {
    -[GKDashboardMultiplayerPickerSearchDataSource setSearchPlayers:](self, "setSearchPlayers:", 0);
  }
}

uint64_t __68__GKDashboardMultiplayerPickerSearchDataSource_searchTextHasChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayNameWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return CFSTR("searchName");
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)itemCount
{
  void *v2;
  int64_t v3;

  -[GKDashboardMultiplayerPickerSearchDataSource searchPlayers](self, "searchPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("playerCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerSearchDataSource searchPlayers](self, "searchPlayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPlayer:", v10);
  -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "referenceKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if ((unint64_t)(v14 - 1) > 1)
  {
    -[GKDashboardMultiplayerPickerSearchDataSource selectedPlayers](self, "selectedPlayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectable:", objc_msgSend(v15, "count") < (unint64_t)-[GKDashboardMultiplayerPickerSearchDataSource maxSelectable](self, "maxSelectable"));

  }
  else
  {
    objc_msgSend(v7, "setSelectable:", v14 == 1);
  }
  objc_msgSend(v7, "setSelected:", v14 == 1);
  objc_msgSend(v10, "lastPlayedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsPlayerSubtitle:", v16 != 0);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[GKDashboardPlayerPickerCell defaultSize](GKDashboardPlayerPickerCell, "defaultSize", a3, a4, a5);
  v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  -[GKDashboardMultiplayerPickerSearchDataSource searchPlayers](self, "searchPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  return v12 != 2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[GKDashboardMultiplayerPickerSearchDataSource searchPlayers](self, "searchPlayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "referenceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == 1)
    {
      -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "referenceKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E5A5DE48, v20);

    }
    else if (!v13)
    {
      -[GKDashboardMultiplayerPickerSearchDataSource playerStates](self, "playerStates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "referenceKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E5A5DE30, v15);

      if (-[GKDashboardMultiplayerPickerSearchDataSource maxSelectable](self, "maxSelectable") >= 1)
      {
        -[GKDashboardMultiplayerPickerSearchDataSource selectedPlayers](self, "selectedPlayers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        v18 = -[GKDashboardMultiplayerPickerSearchDataSource maxSelectable](self, "maxSelectable");

        if (v17 > v18)
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1);
      }
    }
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItemsAtIndexPaths:", v21);

  }
  else
  {
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[GKDashboardMultiplayerPickerSearchDataSource searchBar](self, "searchBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    -[GKDashboardMultiplayerPickerSearchDataSource searchBar](self, "searchBar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
  objc_storeStrong((id *)&self->_playerStates, a3);
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (void)setSearchBar:(id)a3
{
  objc_storeWeak((id *)&self->_searchBar, a3);
}

- (NSArray)allPlayers
{
  return self->_allPlayers;
}

- (void)setAllPlayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)searchPlayers
{
  return self->_searchPlayers;
}

- (void)setSearchPlayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)maxSelectable
{
  return self->_maxSelectable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPlayers, 0);
  objc_storeStrong((id *)&self->_allPlayers, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_playerStates, 0);
}

@end
