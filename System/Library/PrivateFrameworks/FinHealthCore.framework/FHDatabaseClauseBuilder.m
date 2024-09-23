@implementation FHDatabaseClauseBuilder

- (FHDatabaseClauseBuilder)init
{
  FHDatabaseClauseBuilder *v2;
  uint64_t v3;
  NSMutableArray *clauseStack;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHDatabaseClauseBuilder;
  v2 = -[FHDatabaseClauseBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    clauseStack = v2->_clauseStack;
    v2->_clauseStack = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addStringClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8;
  id v9;
  id v10;
  FHDatabaseClause *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:]([FHDatabaseClause alloc], "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v10, v9, v8, 1);

  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v11);
}

- (void)addDoubleClause:(id)a3 fieldName:(id)a4 expression:(double)a5
{
  id v8;
  id v9;
  FHDatabaseClause *v10;
  void *v11;
  FHDatabaseClause *v12;

  v8 = a4;
  v9 = a3;
  v10 = [FHDatabaseClause alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v10, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v9, v8, v11, 0);

  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v12);
}

- (void)addIntegerClause:(id)a3 fieldName:(id)a4 expression:(int64_t)a5
{
  id v8;
  id v9;
  FHDatabaseClause *v10;
  void *v11;
  FHDatabaseClause *v12;

  v8 = a4;
  v9 = a3;
  v10 = [FHDatabaseClause alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v10, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v9, v8, v11, 0);

  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v12);
}

- (void)addDecimalNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8;
  id v9;
  id v10;
  FHDatabaseClause *v11;
  void *v12;
  FHDatabaseClause *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [FHDatabaseClause alloc];
  objc_msgSend(v8, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v11, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v10, v9, v12, 0);
  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v13);

}

- (void)addNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8;
  id v9;
  id v10;
  FHDatabaseClause *v11;
  void *v12;
  FHDatabaseClause *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [FHDatabaseClause alloc];
  objc_msgSend(v8, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v11, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v10, v9, v12, 0);
  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v13);

}

- (void)addDateClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "timeIntervalSinceReferenceDate");
  -[FHDatabaseClauseBuilder addDoubleClause:fieldName:expression:](self, "addDoubleClause:fieldName:expression:", v9, v8);

}

- (void)addInClauseWithFieldName:(id)a3 expressions:(id)a4
{
  -[FHDatabaseClauseBuilder addInClause:fieldName:expressions:](self, "addInClause:fieldName:expressions:", CFSTR("IN"), a3, a4);
}

- (void)addInClause:(id)a3 fieldName:(id)a4 expressions:(id)a5
{
  id v8;
  id v9;
  FHDatabaseClause *v10;
  void *v11;
  void *v12;
  void *v13;
  FHDatabaseClause *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("IN")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("NOT IN")))
  {
    v10 = [FHDatabaseClause alloc];
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v10, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", v15, v8, v13, 0);

    -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v14);
  }

}

- (void)addBetweenClauseWithFieldName:(id)a3 lowerBound:(unint64_t)a4 upperBound:(unint64_t)a5
{
  id v8;
  FHDatabaseClause *v9;
  void *v10;
  FHDatabaseClause *v11;

  v8 = a3;
  v9 = [FHDatabaseClause alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu AND %lu"), a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:](v9, "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", CFSTR("BETWEEN"), v8, v10, 0);

  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v11);
}

- (void)addIsNull:(id)a3
{
  id v4;
  FHDatabaseClause *v5;

  v4 = a3;
  v5 = -[FHDatabaseClause initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:]([FHDatabaseClause alloc], "initWithQuoteWrapOption:fieldName:expression:quoteWrapExpression:", CFSTR("IS"), v4, CFSTR("NULL"), 0);

  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", v5);
}

- (void)addDatabaseClause:(id)a3
{
  -[NSMutableArray addObject:](self->_clauseStack, "addObject:", a3);
}

- (NSMutableArray)clauseStack
{
  return self->_clauseStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clauseStack, 0);
}

@end
