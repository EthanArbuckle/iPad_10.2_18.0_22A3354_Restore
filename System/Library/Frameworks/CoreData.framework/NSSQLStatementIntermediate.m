@implementation NSSQLStatementIntermediate

- (id)governingEntityForKeypathExpression:(id)a3
{
  NSSQLIntermediate *scope;

  scope = self->super._scope;
  if (!scope)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", a3) & 1) != 0)
      return self->_governingEntity;
    scope = self->super._scope;
  }
  return -[NSSQLIntermediate governingEntityForKeypathExpression:](scope, "governingEntityForKeypathExpression:", a3);
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  NSSQLIntermediate *scope;

  scope = self->super._scope;
  if (!scope)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", a3) & 1) != 0)
      return self->_governingAlias;
    scope = self->super._scope;
  }
  return -[NSSQLIntermediate governingAliasForKeypathExpression:](scope, "governingAliasForKeypathExpression:", a3);
}

- (void)setWhereIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 40) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 40) = a2;
    }
  }
}

- (void)setOrderIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 56) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 56) = a2;
    }
  }
}

- (id)governingEntity
{
  return self->_governingEntity;
}

- (id)governingAlias
{
  return self->_governingAlias;
}

- (NSSQLStatementIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  NSSQLStatementIntermediate *v7;
  NSSQLStatementIntermediate *v8;

  v7 = -[NSSQLIntermediate initWithScope:](self, "initWithScope:", a5);
  v8 = v7;
  if (v7)
  {
    v7->_governingEntity = (NSSQLEntity *)a3;
    v7->_governingAlias = (NSString *)a4;
  }
  return v8;
}

- (void)setLimitIntermediate:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 48) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 48) = a2;
    }
  }
}

- (void)setGoverningEntity:(id)a3
{
  self->_governingEntity = (NSSQLEntity *)a3;
}

- (void)setGoverningAlias:(id)a3
{
  id v5;

  if (self->_governingAlias != a3)
  {
    v5 = a3;

    self->_governingAlias = (NSString *)a3;
  }
}

- (void)setCorrelationToken:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 32) = a2;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_governingAlias = 0;
  self->_whereClause = 0;

  self->_limitClause = 0;
  self->_orderIntermediate = 0;

  self->_correlationToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLStatementIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  NSSQLIntermediate *scope;
  id *v6;
  void *v7;
  BOOL result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  scope = self->super._scope;
  if (scope)
    return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](scope, "keypathExpressionIsSafeLHSForIn:", a3);
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", a3) & 1) == 0)
  {
    scope = self->super._scope;
    return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](scope, "keypathExpressionIsSafeLHSForIn:", a3);
  }
  v6 = -[NSSQLStatementIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", a3);
  if (objc_msgSend(a3, "expressionType") == 3)
    v7 = (void *)objc_msgSend(a3, "keyPath");
  else
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
  v9 = (void *)objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v9);
      if (!v6)
        return 1;
      v15 = (unsigned __int8 *)objc_msgSend(v6[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
      if (!v15)
        return 1;
      v16 = v15;
      if ((objc_msgSend(v15, "isToMany") & 1) != 0)
        break;
      v17 = v16[24];
      if (v17 == 7)
      {
        v6 = (id *)objc_msgSend(v16, "destinationEntity");
      }
      else
      {
        if (v17 == 9)
          break;
        v6 = 0;
      }
LABEL_22:
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        result = 1;
        if (v11)
          goto LABEL_10;
        return result;
      }
    }
    v18 = objc_msgSend(v16, "destinationEntity");
    if (v12)
      return 0;
    v6 = (id *)v18;
    v12 = 1;
    goto LABEL_22;
  }
  return 1;
}

@end
