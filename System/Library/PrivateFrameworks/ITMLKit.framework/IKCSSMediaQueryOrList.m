@implementation IKCSSMediaQueryOrList

- (IKCSSMediaQueryOrList)init
{
  IKCSSMediaQueryOrList *v2;
  uint64_t v3;
  IKMutableArray *queryList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKCSSMediaQueryOrList;
  v2 = -[IKCSSMediaQueryOrList init](&v6, sel_init);
  if (v2)
  {
    +[IKArray array](IKMutableArray, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queryList = v2->_queryList;
    v2->_queryList = (IKMutableArray *)v3;

  }
  return v2;
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
  uint64_t v10;
  void *v11;
  const __CFString *v12;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "expressionAsString");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if ((v8 & 1) != 0)
          v12 = CFSTR("%@");
        else
          v12 = CFSTR(" or %@");
        objc_msgSend(v3, "appendFormat:", v12, v10);

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

- (id)subQueryList
{
  return self->_queryList;
}

- (void)addSubQueryList:(id)a3
{
  -[IKMutableArray addObject:](self->_queryList, "addObject:", a3);
}

- (BOOL)evaluate
{
  IKMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_queryList;
  v3 = -[IKArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "evaluate", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[IKArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
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
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("("));
  if (-[IKArray count](self->_queryList, "count"))
  {
    -[IKArray objectAtIndex:](self->_queryList, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

    if ((unint64_t)-[IKArray count](self->_queryList, "count") >= 2)
    {
      v5 = 1;
      do
      {
        -[IKArray objectAtIndex:](self->_queryList, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" || %@"), v6);

        ++v5;
      }
      while (v5 < -[IKArray count](self->_queryList, "count"));
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryList, 0);
}

@end
