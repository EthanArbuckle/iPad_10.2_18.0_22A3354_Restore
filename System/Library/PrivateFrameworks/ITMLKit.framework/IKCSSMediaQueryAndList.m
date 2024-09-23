@implementation IKCSSMediaQueryAndList

- (IKCSSMediaQueryAndList)init
{
  IKCSSMediaQueryAndList *v2;
  uint64_t v3;
  IKMutableArray *queryList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKCSSMediaQueryAndList;
  v2 = -[IKCSSMediaQueryAndList init](&v6, sel_init);
  if (v2)
  {
    +[IKArray array](IKMutableArray, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queryList = v2->_queryList;
    v2->_queryList = (IKMutableArray *)v3;

    v2->_negated = 0;
  }
  return v2;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v4;

}

- (id)expressionAsString
{
  void *v3;
  IKMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_queryList;
  v5 = -[IKArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((v8 & 1) != 0)
        {
          -[IKCSSMediaQueryAndList type](self, "type");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "expressionAsString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@ and (%@)"), v11, v12, (_QWORD)v14);

        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "expressionAsString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR(" and (%@)"), v11);
        }

        v8 = 0;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[IKArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = 0;
    }
    while (v6);
  }

  return v3;
}

- (void)addQuery:(id)a3
{
  -[IKMutableArray addObject:](self->_queryList, "addObject:", a3);
}

- (id)expressionList
{
  return self->_queryList;
}

- (BOOL)evaluate
{
  IKStyleMediaQuery *v3;
  IKMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  BOOL negated;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[IKStyleMediaQuery initWithMediaType:featureValues:isNegated:]([IKStyleMediaQuery alloc], "initWithMediaType:featureValues:isNegated:", self->_type, 0, 0);
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_queryList;
    v5 = -[IKArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "evaluate", (_QWORD)v12))
          {
            v9 = 0;
            goto LABEL_12;
          }
        }
        v6 = -[IKArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_12:

  }
  else
  {
    v9 = 0;
  }
  negated = self->_negated;

  return v9 ^ negated;
}

- (id)subQueryAtIndex:(unint64_t)a3
{
  return -[IKArray objectAtIndex:](self->_queryList, "objectAtIndex:", a3);
}

- (unint64_t)count
{
  return -[IKArray count](self->_queryList, "count");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_negated)
    objc_msgSend(v3, "appendString:", CFSTR("!"));
  objc_msgSend(v4, "appendFormat:", CFSTR("(type=%@, exprs=["), self->_type);
  if (-[IKArray count](self->_queryList, "count"))
  {
    -[IKArray objectAtIndex:](self->_queryList, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v5);

    if ((unint64_t)-[IKArray count](self->_queryList, "count") >= 2)
    {
      v6 = 1;
      do
      {
        -[IKArray objectAtIndex:](self->_queryList, "objectAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" && %@"), v7);

        ++v6;
      }
      while (v6 < -[IKArray count](self->_queryList, "count"));
    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("])"));
  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)negated
{
  return self->_negated;
}

- (void)setNegated:(BOOL)a3
{
  self->_negated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_queryList, 0);
}

@end
