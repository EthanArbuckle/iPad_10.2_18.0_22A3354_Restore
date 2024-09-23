@implementation NSSQLFetchIntermediate

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  NSSQLIntermediate *scope;

  scope = self->super.super._scope;
  if (!scope)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", a3) & 1) != 0)
      return self;
    scope = self->super.super._scope;
  }
  return -[NSSQLIntermediate fetchIntermediateForKeypathExpression:](scope, "fetchIntermediateForKeypathExpression:", a3);
}

- (void)addJoinIntermediate:(void *)a3 atKeypathWithComponents:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 112), "addObject:", a2);
    v6 = *(void **)(a1 + 120);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          v11 = v6;
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(a3);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v6 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v12), "objectAtIndex:", 1);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(v13, "addObject:", a2);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(v11, "setObject:forKey:", v13, v12);
  }
}

- (BOOL)isFunctionScoped
{
  return self->_isDictionaryCountFetch
      || -[NSSQLIntermediate isFunctionScoped](self->super.super._scope, "isFunctionScoped");
}

- (id)selectIntermediate
{
  return self->_selectClause;
}

- (id)generateSQLStringInContext:(id)a3
{
  NSSQLWhereIntermediate *whereClause;
  id v6;
  NSSQLHavingIntermediate *havingClause;
  id v8;
  id v9;
  NSSQLGroupByIntermediate *groupByClause;
  id v11;
  int v12;
  void *v13;
  const __CFString *v14;
  NSSQLOrderIntermediate *orderIntermediate;
  id v16;
  NSMutableArray *joinIntermediates;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  NSSQLOrderIntermediate *v24;
  NSSQLLimitIntermediate *limitClause;
  id v26;
  NSSQLOffsetIntermediate *offsetClause;
  id v28;
  NSSQLOrderIntermediate *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (self && (whereClause = self->super._whereClause) != 0)
  {
    v6 = -[NSSQLIntermediate generateSQLStringInContext:](whereClause, "generateSQLStringInContext:", a3);
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
  }
  havingClause = self->_havingClause;
  if (havingClause)
  {
    v8 = -[NSSQLHavingIntermediate generateSQLStringInContext:](havingClause, "generateSQLStringInContext:", a3);
    if (!v8)
    {

LABEL_10:
      v9 = 0;
LABEL_64:

      return 0;
    }
  }
  else
  {
    v8 = 0;
  }
  groupByClause = self->_groupByClause;
  if (groupByClause)
  {
    v11 = -[NSSQLGroupByIntermediate generateSQLStringInContext:](groupByClause, "generateSQLStringInContext:", a3);
    if (!v11)
    {
      v9 = 0;
      v12 = 1;
      v13 = v6;
      goto LABEL_63;
    }
  }
  else
  {
    v11 = 0;
  }
  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypaths](self, "_promoteJoinsForSubqueryScopedKeypaths");
  if (self->super._correlationToken)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
    objc_msgSend(v13, "appendString:", self->super._correlationToken);
    if (v6)
    {
      objc_msgSend(v13, "appendString:", CFSTR(" AND ("));
      objc_msgSend(v13, "appendString:", v6);
      v14 = CFSTR("))");
    }
    else
    {
      v14 = CFSTR(")");
    }
    objc_msgSend(v13, "appendString:", v14);

  }
  else
  {
    v13 = v6;
  }
  v9 = -[NSSQLSelectIntermediate generateSQLStringInContext:](self->_selectClause, "generateSQLStringInContext:", a3);
  if (v9)
  {
    orderIntermediate = self->super._orderIntermediate;
    if (!orderIntermediate
      || (orderIntermediate = -[NSSQLOrderIntermediate generateSQLStringInContext:](orderIntermediate, "generateSQLStringInContext:", a3)) != 0)
    {
      v30 = orderIntermediate;
      v31 = v11;
      v32 = v8;
      v33 = v13;
      v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      joinIntermediates = self->_joinIntermediates;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](joinIntermediates, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(joinIntermediates);
            v22 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "generateSQLStringInContext:", a3, v30, v31, v32);
            if (!v22)
            {

              goto LABEL_40;
            }
            v23 = (void *)v22;
            objc_msgSend(v16, "appendString:", v22);
            objc_msgSend(v16, "appendString:", CFSTR(" "));

          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](joinIntermediates, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v19)
            continue;
          break;
        }
      }
      if (!v16)
      {
LABEL_40:
        v12 = 1;
        v11 = v31;
        v8 = v32;
        v13 = v33;
        v24 = v30;
LABEL_61:

        goto LABEL_62;
      }
      v11 = v31;
      v8 = v32;
      v24 = v30;
      if (self && (limitClause = self->super._limitClause) != 0)
      {
        v26 = -[NSSQLLimitIntermediate generateSQLStringInContext:](limitClause, "generateSQLStringInContext:", a3);
        if (!v26)
        {
          v12 = 1;
LABEL_60:

          v13 = v33;
          goto LABEL_61;
        }
      }
      else
      {
        v26 = 0;
      }
      offsetClause = self->_offsetClause;
      if (offsetClause)
      {
        v28 = -[NSSQLOffsetIntermediate generateSQLStringInContext:](offsetClause, "generateSQLStringInContext:", a3);
        if (!v28)
        {
          v12 = 1;
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(v9, "appendString:", v16, v30, v31, v32);
      if (v33)
      {
        objc_msgSend(v9, "appendString:", CFSTR("WHERE "));
        objc_msgSend(v9, "appendString:", v33);
        objc_msgSend(v9, "appendString:", CFSTR(" "));
      }
      if (v11)
      {
        objc_msgSend(v9, "appendString:", CFSTR("GROUP BY "));
        objc_msgSend(v9, "appendString:", v11);
        objc_msgSend(v9, "appendString:", CFSTR(" "));
      }
      if (v8)
      {
        objc_msgSend(v9, "appendString:", CFSTR("HAVING "));
        objc_msgSend(v9, "appendString:", v8);
        objc_msgSend(v9, "appendString:", CFSTR(" "));
      }
      if (v24)
        objc_msgSend(v9, "appendString:", v24);
      if (v26)
        objc_msgSend(v9, "appendString:", v26);
      if (v28)
        objc_msgSend(v9, "appendString:", v28);

      v12 = 0;
      goto LABEL_59;
    }
  }
  v12 = 1;
LABEL_62:

LABEL_63:
  if (v12)
    goto LABEL_64;
  return v9;
}

- (uint64_t)promoteToOuterJoinsAlongKeypathWithComponents:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = *(void **)(result + 120);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a2);
          v7 = (void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
          v8 = objc_msgSend(v7, "objectAtIndex:", 0);
          if (v8)
            *(_QWORD *)(v8 + 48) = 2;
          v3 = (void *)objc_msgSend(v7, "objectAtIndex:", 1);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)addGroupByKeypath:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 96);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(v3 + 96) = v4;
    }
    return objc_msgSend(v4, "addObject:", a2);
  }
  return result;
}

- (void)setSelectIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 64) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 64) = a2;
    }
  }
}

- (NSSQLFetchIntermediate)initWithScope:(id)a3
{
  NSSQLFetchIntermediate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLFetchIntermediate;
  v3 = -[NSSQLIntermediate initWithScope:](&v5, sel_initWithScope_, a3);
  if (v3)
  {
    v3->_joinIntermediates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_joinKeypaths = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (uint64_t)promoteToOuterJoinAtKeypathWithComponents:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = *(void **)(result + 120);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a2);
          v7 = (void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
          v8 = objc_msgSend(v7, "objectAtIndex:", 0);
          v3 = (void *)objc_msgSend(v7, "objectAtIndex:", 1);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v4 = result;
      }
      while (result);
      if (v8)
        *(_QWORD *)(v8 + 48) = 2;
    }
  }
  return result;
}

- (uint64_t)groupByClauseContainsKeypath:(uint64_t)a1
{
  void *v2;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = a2;
  if ((objc_msgSend(*(id *)(a1 + 96), "containsObject:", a2) & 1) != 0)
    return 1;
  do
  {
    v5 = (void *)objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v6 = objc_msgSend(v5, "count");
    v4 = v6 != 1;
    if (v6 == 1)
      break;
    v2 = (void *)objc_msgSend((id)objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1), "componentsJoinedByString:", CFSTR("."));
  }
  while (!objc_msgSend(*(id *)(a1 + 96), "containsObject:", v2));
  return v4;
}

- (uint64_t)finalJoinForKeypathWithComponents:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = *(void **)(result + 120);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(a2);
          v8 = (void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
          v3 = (void *)objc_msgSend(v8, "objectAtIndex:", 1);
        }
        v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    else
    {
      v8 = 0;
    }
    return objc_msgSend(v8, "objectAtIndex:", 0);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_selectClause = 0;
  self->_groupByClause = 0;

  self->_groupByKeypaths = 0;
  self->_havingClause = 0;

  self->_offsetClause = 0;
  self->_joinIntermediates = 0;

  self->_joinKeypaths = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (void)setGroupByIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 72) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 72) = a2;
    }
  }
}

- (void)setOffsetIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 88) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 88) = a2;
    }
  }
}

- (void)setHavingIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 80) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 80) = a2;
    }
  }
}

@end
