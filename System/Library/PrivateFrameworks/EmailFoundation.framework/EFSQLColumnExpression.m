@implementation EFSQLColumnExpression

- (BOOL)isEqual:(id)a3
{
  EFSQLColumnExpression *v4;
  EFSQLColumnExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (EFSQLColumnExpression *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[EFSQLColumnExpression isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[EFSQLColumnExpression name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[EFSQLColumnExpression tableName](self, "tableName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFSQLColumnExpression tableName](v5, "tableName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = EFObjectsAreEqual(v8, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[EFSQLColumnExpression name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EFSQLColumnExpression tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tableName
{
  return self->_tableName;
}

+ (id)table:(id)a3 column:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:table:", v7, v6);

  return v8;
}

- (EFSQLColumnExpression)initWithName:(id)a3 table:(id)a4
{
  id v7;
  id v8;
  EFSQLColumnExpression *v9;
  EFSQLColumnExpression *v10;
  EFSQLColumnExpression *v11;
  EFSQLColumnExpression *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLColumnExpression;
  v9 = -[EFSQLColumnExpression init](&v14, sel_init);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_tableName, a4);
  }
  -[EFSQLColumnExpression cachedSelf](v11, "cachedSelf");
  v12 = (EFSQLColumnExpression *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken != -1)
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_29);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)equalTo:(id)a3
{
  id v4;
  id v5;
  EFSQLBinaryExpression *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v6, "initWithLeft:operator:right:", self, 12, v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v6, "initWithLeft:operator:right:", self, 0, v7);
  }
  v9 = (void *)v8;

  return v9;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_tableName)
    objc_msgSend(v4, "appendFormat:", CFSTR("%@."), self->_tableName);
  objc_msgSend(v4, "appendString:", self->_name);

}

- (EFSQLColumnExpression)initWithName:(id)a3
{
  return -[EFSQLColumnExpression initWithName:table:](self, "initWithName:table:", a3, 0);
}

- (id)expressionForPredicateOperatorType:(unint64_t)a3 constantValue:(id)a4
{
  void *v4;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  switch(a3)
  {
    case 0uLL:
      -[EFSQLColumnExpression lessThan:](self, "lessThan:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 1uLL:
      -[EFSQLColumnExpression lessThanEqualTo:](self, "lessThanEqualTo:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 2uLL:
      -[EFSQLColumnExpression greaterThan:](self, "greaterThan:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 3uLL:
      -[EFSQLColumnExpression greaterThanEqualTo:](self, "greaterThanEqualTo:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 4uLL:
      -[EFSQLColumnExpression equalTo:](self, "equalTo:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 5uLL:
      -[EFSQLColumnExpression notEqualTo:](self, "notEqualTo:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 175, CFSTR("NSMatchesPredicateOperatorType currently has no EFSQLExpressable counterpart"));
      goto LABEL_24;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 178, CFSTR("constantValue must be of class NSString"));

      }
      -[EFSQLColumnExpression like:](self, "like:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 8uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 181, CFSTR("constantValue must be of class NSString"));

      }
      -[EFSQLColumnExpression beginsWith:caseSensitive:](self, "beginsWith:caseSensitive:", v8, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 9uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 184, CFSTR("constantValue must be of class NSString"));

      }
      -[EFSQLColumnExpression endsWith:caseSensitive:](self, "endsWith:caseSensitive:", v8, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 0xAuLL:
      -[EFSQLColumnExpression in:](self, "in:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 189, CFSTR("NSCustomSelectorPredicateOperatorType currently has no EFSQLExpressable counterpart"));
LABEL_24:
      v4 = 0;
      goto LABEL_25;
    default:
      if (a3 == 99)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 192, CFSTR("constantValue must be of class NSString"));

        }
        -[EFSQLColumnExpression contains:caseSensitive:](self, "contains:caseSensitive:", v8, 0);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_30:
        v4 = (void *)v9;
      }
      else if (a3 == 100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLObjectPropertyMapper.m"), 195, CFSTR("constantValue must be of class NSArray"));

        }
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EFSQLColumnExpression between:](self, "between:", v12);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
      }

      return v4;
  }
}

- (id)greaterThan:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 2, v6);

  return v7;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

+ (id)column:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:", v4);

  return v5;
}

- (id)notEqualTo:(id)a3
{
  id v4;
  id v5;
  EFSQLBinaryExpression *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v6, "initWithLeft:operator:right:", self, 13, v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v6, "initWithLeft:operator:right:", self, 1, v7);
  }
  v9 = (void *)v8;

  return v9;
}

- (id)isNull
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnExpression is:](self, "is:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)is:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 12, v6);

  return v7;
}

- (id)isNotNull
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnExpression isNot:](self, "isNot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isNot:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 13, v6);

  return v7;
}

- (id)in:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 10, v6);

  return v7;
}

- (id)matchesMask:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  +[EFSQLBitExpression and:with:](EFSQLBitExpression, "and:with:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", v6, 0, v4);

  return v7;
}

- (id)beginsWith:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@*"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression glob:](self, "glob:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EFSQLColumnExpression like:patternType:](self, "like:patternType:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)glob:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;

  v4 = a3;
  v5 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 8, v4);

  return v5;
}

void __48__EFSQLColumnExpression_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs;
  cachedSelf_sUniqueObjectIDs = v0;

}

- (id)lessThan:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 4, v6);

  return v7;
}

- (EFSQLDisqualifiedColumnExpression)disqualified
{
  EFSQLDisqualifiedColumnExpression *v3;
  void *v4;
  void *v5;
  EFSQLDisqualifiedColumnExpression *v6;

  v3 = [EFSQLDisqualifiedColumnExpression alloc];
  -[EFSQLColumnExpression name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnExpression tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSQLColumnExpression initWithName:table:](v3, "initWithName:table:", v4, v5);

  return v6;
}

+ (id)allColumns
{
  return (id)objc_msgSend(a1, "column:", CFSTR("*"));
}

- (id)greaterThanEqualTo:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 3, v6);

  return v7;
}

- (id)lessThanEqualTo:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 5, v6);

  return v7;
}

- (id)like:(id)a3
{
  id v4;
  EFSQLLikeEscapedExpression *v5;
  EFSQLBinaryExpression *v6;

  v4 = a3;
  v5 = -[EFSQLLikeEscapedExpression initWithValue:]([EFSQLLikeEscapedExpression alloc], "initWithValue:", v4);
  v6 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 6, v5);

  return v6;
}

- (id)like:(id)a3 patternType:(unint64_t)a4
{
  id v6;
  EFSQLLikeEscapedExpression *v7;
  EFSQLBinaryExpression *v8;

  v6 = a3;
  v7 = -[EFSQLLikeEscapedExpression initWithValue:pattern:]([EFSQLLikeEscapedExpression alloc], "initWithValue:pattern:", v6, a4);
  v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 6, v7);

  return v8;
}

- (id)notLike:(id)a3
{
  id v4;
  EFSQLLikeEscapedExpression *v5;
  EFSQLBinaryExpression *v6;

  v4 = a3;
  v5 = -[EFSQLLikeEscapedExpression initWithValue:]([EFSQLLikeEscapedExpression alloc], "initWithValue:", v4);
  v6 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 7, v5);

  return v6;
}

- (id)notLike:(id)a3 patternType:(unint64_t)a4
{
  id v6;
  EFSQLLikeEscapedExpression *v7;
  EFSQLBinaryExpression *v8;

  v6 = a3;
  v7 = -[EFSQLLikeEscapedExpression initWithValue:pattern:]([EFSQLLikeEscapedExpression alloc], "initWithValue:pattern:", v6, a4);
  v8 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 7, v7);

  return v8;
}

- (id)notGlob:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;

  v4 = a3;
  v5 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 9, v4);

  return v5;
}

- (id)contains:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*%@*"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression glob:](self, "glob:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EFSQLColumnExpression like:patternType:](self, "like:patternType:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)doesNotContain:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*%@*"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression notGlob:](self, "notGlob:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EFSQLColumnExpression notLike:patternType:](self, "notLike:patternType:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)endsWith:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnExpression glob:](self, "glob:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EFSQLColumnExpression like:patternType:](self, "like:patternType:", v6, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)notIn:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", self, 11, v6);

  return v7;
}

- (id)between:(id)a3
{
  id v4;
  EFSQLBetweenExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EFSQLBetweenExpression *v10;

  v4 = a3;
  v5 = [EFSQLBetweenExpression alloc];
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_SQLIsolatedExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_SQLIsolatedExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EFSQLBetweenExpression initWithLeft:firstValue:secondValue:between:](v5, "initWithLeft:firstValue:secondValue:between:", self, v7, v9, 1);

  return v10;
}

- (id)notBetween:(id)a3
{
  id v4;
  EFSQLBetweenExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EFSQLBetweenExpression *v10;

  v4 = a3;
  v5 = [EFSQLBetweenExpression alloc];
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_SQLIsolatedExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_SQLIsolatedExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EFSQLBetweenExpression initWithLeft:firstValue:secondValue:between:](v5, "initWithLeft:firstValue:secondValue:between:", self, v7, v9, 0);

  return v10;
}

- (id)plus:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;

  v4 = a3;
  v5 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 14, v4);

  return v5;
}

- (id)minus:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;

  v4 = a3;
  v5 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 15, v4);

  return v5;
}

- (id)concatenate:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;

  v4 = a3;
  v5 = -[EFSQLBinaryExpression initWithLeft:operator:right:]([EFSQLBinaryExpression alloc], "initWithLeft:operator:right:", self, 16, v4);

  return v5;
}

- (id)doesNotMatchMask:(id)a3
{
  id v4;
  EFSQLBinaryExpression *v5;
  void *v6;
  EFSQLBinaryExpression *v7;

  v4 = a3;
  v5 = [EFSQLBinaryExpression alloc];
  +[EFSQLBitExpression and:with:](EFSQLBitExpression, "and:with:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLBinaryExpression initWithLeft:operator:right:](v5, "initWithLeft:operator:right:", v6, 0, &unk_1E62BDC60);

  return v7;
}

@end
