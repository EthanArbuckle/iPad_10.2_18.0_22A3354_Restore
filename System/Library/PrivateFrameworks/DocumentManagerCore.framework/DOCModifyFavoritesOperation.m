@implementation DOCModifyFavoritesOperation

- (DOCModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4 undoManager:(id)a5
{
  id v9;
  id v10;
  DOCModifyFavoritesOperation *v11;
  DOCModifyFavoritesOperation *v12;
  uint64_t v13;
  NSArray *oldFavorites;
  uint64_t v15;
  NSArray *oldRanks;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DOCModifyFavoritesOperation;
  v11 = -[FPModifyFavoritesOperation initWithItemsToFavorite:favoriteRanks:](&v18, sel_initWithItemsToFavorite_favoriteRanks_, a3, v9);
  v12 = v11;
  if (v11)
  {
    -[DOCModifyFavoritesOperation currentFavorites](v11, "currentFavorites");
    v13 = objc_claimAutoreleasedReturnValue();
    oldFavorites = v12->_oldFavorites;
    v12->_oldFavorites = (NSArray *)v13;

    -[DOCModifyFavoritesOperation currentFavoriteRanks](v12, "currentFavoriteRanks");
    v15 = objc_claimAutoreleasedReturnValue();
    oldRanks = v12->_oldRanks;
    v12->_oldRanks = (NSArray *)v15;

    objc_storeStrong((id *)&v12->_updatedRanks, a4);
    objc_storeStrong((id *)&v12->_undoManager, a5);
    v12->_isUnfavorite = 0;
    -[DOCModifyFavoritesOperation registerUndo](v12, "registerUndo");
  }

  return v12;
}

- (DOCModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3 undoManager:(id)a4
{
  id v7;
  DOCModifyFavoritesOperation *v8;
  DOCModifyFavoritesOperation *v9;
  uint64_t v10;
  NSArray *oldFavorites;
  uint64_t v12;
  NSArray *oldRanks;
  NSArray *v14;
  NSArray *updatedRanks;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DOCModifyFavoritesOperation;
  v8 = -[FPModifyFavoritesOperation initWithItemsToUnfavorite:](&v17, sel_initWithItemsToUnfavorite_, a3);
  v9 = v8;
  if (v8)
  {
    -[DOCModifyFavoritesOperation currentFavorites](v8, "currentFavorites");
    v10 = objc_claimAutoreleasedReturnValue();
    oldFavorites = v9->_oldFavorites;
    v9->_oldFavorites = (NSArray *)v10;

    -[DOCModifyFavoritesOperation currentFavoriteRanks](v9, "currentFavoriteRanks");
    v12 = objc_claimAutoreleasedReturnValue();
    oldRanks = v9->_oldRanks;
    v9->_oldRanks = (NSArray *)v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    updatedRanks = v9->_updatedRanks;
    v9->_updatedRanks = v14;

    objc_storeStrong((id *)&v9->_undoManager, a4);
    v9->_isUnfavorite = 1;
    -[DOCModifyFavoritesOperation registerUndo](v9, "registerUndo");
  }

  return v9;
}

- (NSString)actionNameForUndoing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _DocumentManagerBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Modify Favorite of “%@” [undo / redo command]"), CFSTR("Modify Favorite of “%@”"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Modify Favorites of %lu Items [undo / redo command]"), CFSTR("Modify Favorites of %lu Items [undo / redo command]"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPTransformOperation items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[FPTransformOperation items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == 1)
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v4, v11);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)operationForRedoing
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  DOCModifyFavoritesOperation *v6;
  void *v7;
  void *v8;
  DOCModifyFavoritesOperation *v9;
  void *v10;

  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[DOCModifyFavoritesOperation isUnfavorite](self, "isUnfavorite");
    v6 = [DOCModifyFavoritesOperation alloc];
    -[FPTransformOperation items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[DOCModifyFavoritesOperation undoManager](self, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[DOCModifyFavoritesOperation initWithItemsToUnfavorite:undoManager:](v6, "initWithItemsToUnfavorite:undoManager:", v7, v8);
    }
    else
    {
      -[DOCModifyFavoritesOperation updatedRanks](self, "updatedRanks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCModifyFavoritesOperation undoManager](self, "undoManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[DOCModifyFavoritesOperation initWithItemsToFavorite:favoriteRanks:undoManager:](v6, "initWithItemsToFavorite:favoriteRanks:undoManager:", v7, v8, v10);

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)operationForUndoing
{
  void *v3;
  uint64_t v4;
  void *v5;
  DOCModifyFavoritesOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[DOCModifyFavoritesOperation oldRanksForOperationItems](self, "oldRanksForOperationItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DOCModifyFavoritesOperation isUnfavorite](self, "isUnfavorite"))
    {
      v6 = [DOCModifyFavoritesOperation alloc];
      -[FPTransformOperation items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCModifyFavoritesOperation undoManager](self, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_msgSend(v5, "count");
      v6 = [DOCModifyFavoritesOperation alloc];
      -[FPTransformOperation items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCModifyFavoritesOperation undoManager](self, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v11 = -[DOCModifyFavoritesOperation initWithItemsToUnfavorite:undoManager:](v6, "initWithItemsToUnfavorite:undoManager:", v7, v8);
        goto LABEL_8;
      }
    }
    v11 = -[DOCModifyFavoritesOperation initWithItemsToFavorite:favoriteRanks:undoManager:](v6, "initWithItemsToFavorite:favoriteRanks:undoManager:", v7, v5, v8);
LABEL_8:
    v9 = (void *)v11;

    return v9;
  }
  v9 = 0;
  return v9;
}

- (void)registerUndo
{
  id v3;

  -[DOCModifyFavoritesOperation undoManager](self, "undoManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerUndoOperationForSender:", self);

}

- (id)currentFavorites
{
  void *v2;
  void *v3;

  +[DOCFavoritesManager sharedManager](DOCFavoritesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoritedLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentFavoriteRanks
{
  void *v3;
  void *v4;

  -[DOCModifyFavoritesOperation currentFavorites](self, "currentFavorites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCModifyFavoritesOperation favoriteRanksFromItems:](self, "favoriteRanksFromItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)favoriteRanksFromItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "favoriteRank", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)oldRanksForOperationItems
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FPTransformOperation items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke;
  v9[3] = &unk_24C0FEA88;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "oldFavorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke_2;
  v11 = &unk_24C0FEA60;
  v5 = v3;
  v12 = v5;
  v15 = &v16;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  if (!*((_BYTE *)v17 + 24))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", &unk_24C10A4F0, v8, v9, v10, v11, v12);

  _Block_object_dispose(&v16, 8);
}

void __56__DOCModifyFavoritesOperation_oldRanksForOperationItems__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqualToItemID:", v8);
  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "oldRanks");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (NSArray)oldFavorites
{
  return self->_oldFavorites;
}

- (NSArray)oldRanks
{
  return self->_oldRanks;
}

- (NSArray)updatedRanks
{
  return self->_updatedRanks;
}

- (BOOL)isUnfavorite
{
  return self->_isUnfavorite;
}

- (DOCUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_updatedRanks, 0);
  objc_storeStrong((id *)&self->_oldRanks, 0);
  objc_storeStrong((id *)&self->_oldFavorites, 0);
}

@end
