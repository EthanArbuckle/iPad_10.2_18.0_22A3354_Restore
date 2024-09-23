@implementation FPModifyFavoritesOperation

- (id)replicateForItems:(id)a3
{
  id v4;
  FPModifyFavoritesOperation *v5;
  void *v6;
  void *v7;
  FPModifyFavoritesOperation *v8;

  v4 = a3;
  v5 = [FPModifyFavoritesOperation alloc];
  -[FPTransformOperation items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_pickItemsFromArray:correspondingToIndexesOfItemsInArray:", self->_ranks, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPModifyFavoritesOperation initWithItems:favoriteRanks:isUnfavorite:](v5, "initWithItems:favoriteRanks:isUnfavorite:", v4, v7, self->_isUnfavorite);

  return v8;
}

- (FPModifyFavoritesOperation)initWithItems:(id)a3 favoriteRanks:(id)a4 isUnfavorite:(BOOL)a5
{
  id v9;
  id v10;
  FPModifyFavoritesOperation *v11;
  FPModifyFavoritesOperation *v12;
  uint64_t v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPModifyFavoritesOperation;
  v11 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v16, sel_initWithItemsOfDifferentProviders_action_, v9, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ranks, a4);
    v12->_isUnfavorite = a5;
    if (!a5)
    {
      v13 = objc_msgSend(v9, "count");
      if (v13 != -[NSArray count](v12->_ranks, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("FPActionOperation.m"), 1382, CFSTR("%@ needs to be initialized with either the same number of ranks and items or to unfavorite"), objc_opt_class());

      }
    }
    -[FPActionOperation setSetupRemoteOperationService:](v12, "setSetupRemoteOperationService:", 1);
  }

  return v12;
}

- (FPModifyFavoritesOperation)initWithItemsToFavorite:(id)a3 favoriteRanks:(id)a4
{
  return -[FPModifyFavoritesOperation initWithItems:favoriteRanks:isUnfavorite:](self, "initWithItems:favoriteRanks:isUnfavorite:", a3, a4, 0);
}

- (FPModifyFavoritesOperation)initWithItemsToUnfavorite:(id)a3
{
  return -[FPModifyFavoritesOperation initWithItems:favoriteRanks:isUnfavorite:](self, "initWithItems:favoriteRanks:isUnfavorite:", a3, 0, 1);
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = v6;
  if (self->_isUnfavorite)
  {
    objc_msgSend(v6, "setFavoriteRank:", 0);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_ranks, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFavoriteRank:", v8);

  }
  objc_msgSend(v7, "setState:", objc_msgSend(v7, "state") & 0xFFFFFFFFFFFFFFFBLL);

  return 32;
}

- (id)fp_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  FPAbbreviatedArrayDescription(self->_ranks);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPTransformOperation items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("set favorite rank %@ on %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranks, 0);
}

@end
