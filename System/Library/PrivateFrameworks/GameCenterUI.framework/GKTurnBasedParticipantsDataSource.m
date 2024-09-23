@implementation GKTurnBasedParticipantsDataSource

- (void)setMatch:(id)a3
{
  void *v5;
  GKTurnBasedMatch *v6;

  v6 = (GKTurnBasedMatch *)a3;
  if (self->_match != v6)
  {
    -[GKTurnBasedParticipantsDataSource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("match"));
    objc_storeStrong((id *)&self->_match, a3);
    -[GKTurnBasedMatch participants](v6, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBasicCollectionViewDataSource setItems:](self, "setItems:", v5);

    -[GKTurnBasedParticipantsDataSource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("match"));
  }

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  GKTurnBasedParticipantsDataSource *v12;

  v6 = a5;
  -[GKTurnBasedMatch matchID](self->_match, "matchID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D253E0];
    -[GKTurnBasedMatch matchID](self->_match, "matchID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__GKTurnBasedParticipantsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
    v10[3] = &unk_1E59C7D48;
    v11 = v6;
    v12 = self;
    objc_msgSend(v8, "loadMatchWithID:withCompletionHandler:", v9, v10);

  }
}

void __88__GKTurnBasedParticipantsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__GKTurnBasedParticipantsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v9[3] = &unk_1E59C4708;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v8 = v5;
  objc_msgSend(v7, "addUpdate:error:", v9, a3);

}

uint64_t __88__GKTurnBasedParticipantsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "setMatch:");
  return result;
}

- (void)configureCollectionView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedParticipantsDataSource;
  v3 = a3;
  -[GKBasicCollectionViewDataSource configureCollectionView:](&v4, sel_configureCollectionView_, v3);
  +[GKTurnParticipantCell registerCellClassesForCollectionView:](GKTurnParticipantCell, "registerCellClassesForCollectionView:", v3, v4.receiver, v4.super_class);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_gkDequeueCellForClass:forIndexPath:", objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsDetail:", 1);
  objc_msgSend(v8, "setMatch:", self->_match);
  -[GKBasicCollectionViewDataSource items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParticipant:", v10);

  v11 = objc_msgSend(v6, "item");
  -[GKBasicCollectionViewDataSource items](self, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") - 1;

  if (v11 == v13)
  {
    objc_msgSend(v8, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 10.0);

    objc_msgSend(v8, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaskedCorners:", 12);

    objc_msgSend(v8, "divider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 1;
LABEL_6:
    objc_msgSend(v16, "setHidden:", v18);
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "item"))
  {
    objc_msgSend(v8, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 10.0);

    objc_msgSend(v8, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMaskedCorners:", 3);

    objc_msgSend(v8, "divider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "divider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 0);

  objc_msgSend(v8, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 0.0);
LABEL_7:

  return v8;
}

- (NSString)sectionTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch participants](self->_match, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
}

@end
