@implementation EFSQLGeneratorCompoundPredicateNode

- (EFSQLValueExpressable)sqlExpressable
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __objc2_class **v9;
  EFSQLNotExpression *v10;
  EFSQLNotExpression *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EFSQLGeneratorCompoundPredicateNode childPredicates](self, "childPredicates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "sqlExpressable");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  if (-[EFSQLGeneratorCompoundPredicateNode predicateType](self, "predicateType") == 1)
  {
    v9 = off_1E62A3D58;
LABEL_12:
    -[__objc2_class combined:](*v9, "combined:", v3);
    v10 = (EFSQLNotExpression *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[EFSQLGeneratorCompoundPredicateNode predicateType](self, "predicateType") == 2)
  {
    v9 = off_1E62A3DE8;
    goto LABEL_12;
  }
  if (-[EFSQLGeneratorCompoundPredicateNode predicateType](self, "predicateType"))
  {
    v10 = 0;
  }
  else
  {
    v12 = [EFSQLNotExpression alloc];
    +[EFSQLAndExpression combined:](EFSQLAndExpression, "combined:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EFSQLNotExpression initWithExpression:](v12, "initWithExpression:", v13);

  }
LABEL_13:

  return (EFSQLValueExpressable *)v10;
}

- (unint64_t)predicateType
{
  return self->_predicateType;
}

- (NSArray)childPredicates
{
  return self->_childPredicates;
}

- (EFSQLGeneratorCompoundPredicateNode)initWithPredicateType:(unint64_t)a3 childPredicates:(id)a4
{
  id v7;
  EFSQLGeneratorCompoundPredicateNode *v8;
  EFSQLGeneratorCompoundPredicateNode *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLGeneratorCompoundPredicateNode;
  v8 = -[EFSQLGeneratorCompoundPredicateNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_predicateType = a3;
    objc_storeStrong((id *)&v8->_childPredicates, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPredicates, 0);
}

@end
