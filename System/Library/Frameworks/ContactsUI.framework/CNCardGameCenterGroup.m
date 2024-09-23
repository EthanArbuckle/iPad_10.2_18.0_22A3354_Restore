@implementation CNCardGameCenterGroup

- (CNCardGameCenterGroup)initWithContact:(id)a3 relationshipResults:(id)a4
{
  id v7;
  CNCardGameCenterGroup *v8;
  CNCardGameCenterGroup *v9;
  CNCardGameCenterGroup *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNCardGameCenterGroup;
  v8 = -[CNCardGroup initWithContact:](&v12, sel_initWithContact_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_relationshipResults, a4);
    v10 = v9;
  }

  return v9;
}

- (id)displayItems
{
  void *v2;
  void *v3;

  -[CNCardGameCenterGroup relationshipResults](self, "relationshipResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_compactMap:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)relationshipResults
{
  return self->_relationshipResults;
}

- (void)setRelationshipResults:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipResults, 0);
}

CNCardGameCenterGroupItem *__37__CNCardGameCenterGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNCardGameCenterGroupItem *v3;

  v2 = a2;
  if (objc_msgSend(v2, "relationship") == 2)
    v3 = -[CNCardGameCenterGroupItem initWithRelationshipResult:]([CNCardGameCenterGroupItem alloc], "initWithRelationshipResult:", v2);
  else
    v3 = 0;

  return v3;
}

+ (BOOL)relationshipResultsContainsFriend:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "_cn_firstObjectPassingTest:", &__block_literal_global_3466);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)shouldShowAddFriendActionForRelationshipResults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v10, "relationship", (_QWORD)v12) == 2)
          break;
        v7 |= objc_msgSend(v10, "relationship") == 1;
        if (v6 == ++v9)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
    }
    v7 = 0;
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

+ (id)actionForRelationshipResults:(id)a3 forContact:(id)a4
{
  id v5;
  id v6;
  int v7;
  CNGameCenterAddFriendAction *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "shouldShowAddFriendActionForRelationshipResults:", v6);

  if (v7)
    v8 = -[CNGameCenterAddFriendAction initWithContact:]([CNGameCenterAddFriendAction alloc], "initWithContact:", v5);
  else
    v8 = 0;

  return v8;
}

BOOL __59__CNCardGameCenterGroup_relationshipResultsContainsFriend___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "relationship") == 2;
}

@end
