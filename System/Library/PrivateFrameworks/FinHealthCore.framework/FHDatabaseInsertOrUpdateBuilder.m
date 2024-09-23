@implementation FHDatabaseInsertOrUpdateBuilder

- (FHDatabaseInsertOrUpdateBuilder)init
{
  FHDatabaseInsertOrUpdateBuilder *v2;
  uint64_t v3;
  NSMutableArray *dynamicFieldValuePairList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHDatabaseInsertOrUpdateBuilder;
  v2 = -[FHDatabaseInsertOrUpdateBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dynamicFieldValuePairList = v2->_dynamicFieldValuePairList;
    v2->_dynamicFieldValuePairList = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addStringValueForField:(id)a3 fieldValue:(id)a4
{
  id v6;
  id v7;
  FHDatabaseInsertFieldValuePair *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[FHDatabaseInsertFieldValuePair initWithQuoteWrapOption:fieldValue:quoteWrap:]([FHDatabaseInsertFieldValuePair alloc], "initWithQuoteWrapOption:fieldValue:quoteWrap:", v7, v6, 0);

  -[NSMutableArray addObject:](self->_dynamicFieldValuePairList, "addObject:", v8);
}

- (void)addDoubleValueForField:(id)a3 fieldValue:(double)a4
{
  id v6;
  FHDatabaseInsertFieldValuePair *v7;
  void *v8;
  FHDatabaseInsertFieldValuePair *v9;

  v6 = a3;
  v7 = [FHDatabaseInsertFieldValuePair alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FHDatabaseInsertFieldValuePair initWithQuoteWrapOption:fieldValue:quoteWrap:](v7, "initWithQuoteWrapOption:fieldValue:quoteWrap:", v6, v8, 0);

  -[NSMutableArray addObject:](self->_dynamicFieldValuePairList, "addObject:", v9);
}

- (void)addDecimalNumberValueForField:(id)a3 fieldValue:(id)a4
{
  id v6;
  id v7;
  FHDatabaseInsertFieldValuePair *v8;
  void *v9;
  FHDatabaseInsertFieldValuePair *v10;

  v6 = a4;
  v7 = a3;
  v8 = [FHDatabaseInsertFieldValuePair alloc];
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FHDatabaseInsertFieldValuePair initWithQuoteWrapOption:fieldValue:quoteWrap:](v8, "initWithQuoteWrapOption:fieldValue:quoteWrap:", v7, v9, 0);
  -[NSMutableArray addObject:](self->_dynamicFieldValuePairList, "addObject:", v10);

}

- (void)addNumberValueForField:(id)a3 fieldValue:(id)a4
{
  id v6;
  id v7;
  FHDatabaseInsertFieldValuePair *v8;
  void *v9;
  FHDatabaseInsertFieldValuePair *v10;

  v6 = a4;
  v7 = a3;
  v8 = [FHDatabaseInsertFieldValuePair alloc];
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FHDatabaseInsertFieldValuePair initWithQuoteWrapOption:fieldValue:quoteWrap:](v8, "initWithQuoteWrapOption:fieldValue:quoteWrap:", v7, v9, 0);
  -[NSMutableArray addObject:](self->_dynamicFieldValuePairList, "addObject:", v10);

}

- (void)addIntegerValueForField:(id)a3 fieldValue:(int64_t)a4
{
  id v6;
  FHDatabaseInsertFieldValuePair *v7;
  void *v8;
  FHDatabaseInsertFieldValuePair *v9;

  v6 = a3;
  v7 = [FHDatabaseInsertFieldValuePair alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FHDatabaseInsertFieldValuePair initWithQuoteWrapOption:fieldValue:quoteWrap:](v7, "initWithQuoteWrapOption:fieldValue:quoteWrap:", v6, v8, 0);

  -[NSMutableArray addObject:](self->_dynamicFieldValuePairList, "addObject:", v9);
}

- (void)addDateValueForField:(id)a3 fieldValue:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  -[FHDatabaseInsertOrUpdateBuilder addDoubleValueForField:fieldValue:](self, "addDoubleValueForField:fieldValue:", v6);

}

- (NSMutableArray)dynamicFieldValuePairList
{
  return self->_dynamicFieldValuePairList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicFieldValuePairList, 0);
}

@end
