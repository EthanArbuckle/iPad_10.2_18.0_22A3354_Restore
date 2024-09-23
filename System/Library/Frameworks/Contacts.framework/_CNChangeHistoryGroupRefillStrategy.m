@implementation _CNChangeHistoryGroupRefillStrategy

- (_CNChangeHistoryGroupRefillStrategy)initWithContactStore:(id)a3
{
  id v5;
  _CNChangeHistoryGroupRefillStrategy *v6;
  _CNChangeHistoryGroupRefillStrategy *v7;
  _CNChangeHistoryGroupRefillStrategy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNChangeHistoryGroupRefillStrategy;
  v6 = -[_CNChangeHistoryGroupRefillStrategy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4
{
  return (id)objc_msgSend(a3, "_cn_balancedSlicesWithMaximumCount:", a4);
}

- (id)objectsRepresentedByBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_61_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_map:", &__block_literal_global_63_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNChangeHistoryGroupRefillStrategy fetchGroupsWithIdentifiers:](self, "fetchGroupsWithIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNChangeHistoryGroupRefillStrategy updateChanges:withFetchedGroups:](self, "updateChanges:withFetchedGroups:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchGroupsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    +[CNGroup predicateForGroupsWithIdentifiers:](CNGroup, "predicateForGroupsWithIdentifiers:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNChangeHistoryGroupRefillStrategy contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "groupsMatchingPredicate:error:", v6, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v8)
    {
      objc_msgSend(v8, "_cn_indexBy:", &__block_literal_global_65_1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("Failed to fetch groups for change history group changes, %@"), v9);
      v5 = 0;
    }

  }
  return v5;
}

- (id)updateChanges:(id)a3 withFetchedGroups:(id)a4
{
  id v5;
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
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "groupIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setGroup:", v13);

        objc_msgSend(v11, "group");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else if (objc_msgSend(v11, "changeType") != 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "changeType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "groupIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Could not fetch group for change type %@ with identifier %@, making it a delete change type."), v15, v16);

          objc_msgSend(v11, "setChangeType:", 2);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
