@implementation ICRankingQueryDescriptor

- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 purpose:(unint64_t)a7
{
  return -[ICRankingQueryDescriptor initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:displayedMatchedFields:purpose:](self, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:displayedMatchedFields:purpose:", a3, a4, a5, a6, 0, a7);
}

- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 displayedMatchedFields:(unint64_t)a7 purpose:(unint64_t)a8
{
  id v15;
  id v16;
  ICRankingQueryDescriptor *v17;
  ICRankingQueryDescriptor *v18;
  id *p_queryFields;
  uint64_t v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a4;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ICRankingQueryDescriptor;
  v17 = -[ICRankingQueryDescriptor init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    p_queryFields = (id *)&v17->_queryFields;
    objc_storeStrong((id *)&v17->_queryFields, a3);
    objc_storeStrong((id *)&v18->_expandedTokens, a4);
    v18->_rankingQueryType = a5;
    objc_storeStrong((id *)&v18->_rankingQueryFlags, a6);
    v18->_displayedMatchedFields = a7;
    v18->_purpose = a8;
    if (!a7)
    {
      if ((objc_msgSend(*p_queryFields, "containsObject:", CFSTR("_ICItemDisplayName")) & 1) != 0
        || (objc_msgSend(*p_queryFields, "containsObject:", *MEMORY[0x1E0CA6158]) & 1) != 0)
      {
        v20 = 1;
      }
      else if ((objc_msgSend(*p_queryFields, "containsObject:", *MEMORY[0x1E0CA6048]) & 1) != 0
             || (objc_msgSend(*p_queryFields, "containsObject:", *MEMORY[0x1E0CA6030]) & 1) != 0)
      {
        v20 = 4;
      }
      else
      {
        if (!objc_msgSend(*p_queryFields, "containsObject:", *MEMORY[0x1E0CA6910]))
          goto LABEL_10;
        v20 = 2;
      }
      v18->_displayedMatchedFields |= v20;
    }
  }
LABEL_10:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ICRankingQueryDescriptor queryFields](self, "queryFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRankingQueryDescriptor expandedTokens](self, "expandedTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICRankingQueryDescriptor rankingQueryType](self, "rankingQueryType");
  -[ICRankingQueryDescriptor rankingQueryFlags](self, "rankingQueryFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:displayedMatchedFields:purpose:", v5, v6, v7, v8, -[ICRankingQueryDescriptor displayedMatchedFields](self, "displayedMatchedFields"), -[ICRankingQueryDescriptor purpose](self, "purpose"));

  return v9;
}

- (NSString)rankingQuery
{
  NSString *rankingQuery;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  id obj;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  rankingQuery = self->_rankingQuery;
  if (!rankingQuery)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[ICRankingQueryDescriptor expandedTokens](self, "expandedTokens");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v26)
    {
      v24 = *(_QWORD *)v39;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(obj);
          v27 = v4;
          v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v28 = v5;
          v7 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v7)
          {
            v8 = v7;
            v29 = *(_QWORD *)v35;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v35 != v29)
                  objc_enumerationMutation(v28);
                v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9);
                v30 = 0u;
                v31 = 0u;
                v32 = 0u;
                v33 = 0u;
                -[ICRankingQueryDescriptor queryFields](self, "queryFields");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                if (v12)
                {
                  v13 = v12;
                  v14 = *(_QWORD *)v31;
                  do
                  {
                    v15 = 0;
                    do
                    {
                      if (*(_QWORD *)v31 != v14)
                        objc_enumerationMutation(v11);
                      -[ICRankingQueryDescriptor rankingQueryForQueryField:tokenString:](self, "rankingQueryForQueryField:tokenString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15), v10);
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "addObject:", v16);

                      ++v15;
                    }
                    while (v13 != v15);
                    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                  }
                  while (v13);
                }

                ++v9;
              }
              while (v9 != v8);
              v8 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v8);
          }

          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" || "));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("(%@)"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "addObject:", v19);
          v4 = v27 + 1;
        }
        while (v27 + 1 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v26);
    }

    objc_msgSend(v25, "componentsJoinedByString:", CFSTR(" || "));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_rankingQuery;
    self->_rankingQuery = v20;

    rankingQuery = self->_rankingQuery;
  }
  return rankingQuery;
}

- (NSArray)tokens
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICRankingQueryDescriptor expandedTokens](self, "expandedTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (double)rankingScoreForSearchResultType:(unint64_t)a3
{
  double v5;
  unint64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  BOOL v13;
  uint64_t v14;

  v5 = 0.0;
  if (-[ICRankingQueryDescriptor purpose](self, "purpose") != 1)
    return v5;
  if ((-[ICRankingQueryDescriptor displayedMatchedFields](self, "displayedMatchedFields") & 1) != 0)
  {
    v7 = -[ICRankingQueryDescriptor rankingQueryType](self, "rankingQueryType");
    v8 = 0.0;
    if (v7 != 2)
    {
      v9 = 0.0625;
      if (a3 != 1)
        v9 = 0.0;
      if (!a3)
        v9 = 0.5;
      v10 = 4.0;
      if (a3 != 1)
        v10 = 0.0;
      v11 = a3 == 0;
      v12 = 32.0;
      goto LABEL_23;
    }
    if (a3 == 1)
      v8 = 0.001953125;
    v13 = a3 == 0;
    v14 = 0x3F90000000000000;
LABEL_34:
    v9 = *(double *)&v14;
LABEL_35:
    if (v13)
      return v9;
    else
      return v8;
  }
  if ((-[ICRankingQueryDescriptor displayedMatchedFields](self, "displayedMatchedFields") & 2) != 0)
  {
    v7 = -[ICRankingQueryDescriptor rankingQueryType](self, "rankingQueryType");
    v8 = 0.0;
    if (v7 != 2)
    {
      v9 = 0.03125;
      if (a3 != 1)
        v9 = 0.0;
      if (!a3)
        v9 = 0.25;
      v10 = 2.0;
      if (a3 != 1)
        v10 = 0.0;
      v11 = a3 == 0;
      v12 = 16.0;
LABEL_23:
      if (v11)
        v10 = v12;
      if (!v7)
        v8 = v10;
      v13 = v7 == 1;
      goto LABEL_35;
    }
    if (a3 == 1)
      v8 = 0.0009765625;
    v13 = a3 == 0;
    v14 = 0x3F80000000000000;
    goto LABEL_34;
  }
  if ((-[ICRankingQueryDescriptor displayedMatchedFields](self, "displayedMatchedFields") & 4) != 0)
  {
    v6 = -[ICRankingQueryDescriptor rankingQueryType](self, "rankingQueryType");
    if (v6 <= 2)
      return dbl_1BDC16108[v6];
  }
  return v5;
}

- (id)rankingQueryForQueryField:(id)a3 tokenString:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D64278], "stringByEscapingSearchString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[ICRankingQueryDescriptor rankingQueryFlags](self, "rankingQueryFlags");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E76DB108;
  }
  v9 = -[ICRankingQueryDescriptor rankingQueryType](self, "rankingQueryType");
  if (v9 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"*%@*\"%@"), v6, v7, v8);
  }
  else
  {
    if (v9 == 1)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3.3d"), 66);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=\"%@*\"%@f%@"), v6, v7, v8, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), v6, v7, v8);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

- (void)setRankingQuery:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQuery, a3);
}

- (NSArray)queryFields
{
  return self->_queryFields;
}

- (NSArray)expandedTokens
{
  return self->_expandedTokens;
}

- (int64_t)rankingQueryType
{
  return self->_rankingQueryType;
}

- (NSString)rankingQueryFlags
{
  return self->_rankingQueryFlags;
}

- (unint64_t)displayedMatchedFields
{
  return self->_displayedMatchedFields;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingQueryFlags, 0);
  objc_storeStrong((id *)&self->_expandedTokens, 0);
  objc_storeStrong((id *)&self->_queryFields, 0);
  objc_storeStrong((id *)&self->_rankingQuery, 0);
}

@end
