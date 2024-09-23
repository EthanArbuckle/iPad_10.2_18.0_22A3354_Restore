@implementation CRKKeyValueTable

- (CRKKeyValueTable)initWithKeyValuePairs:(id)a3
{
  id v4;
  CRKKeyValueTable *v5;
  uint64_t v6;
  NSArray *keyValuePairs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeyValueTable;
  v5 = -[CRKKeyValueTable init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    keyValuePairs = v5->_keyValuePairs;
    v5->_keyValuePairs = (NSArray *)v6;

  }
  return v5;
}

- (CRKKeyValueTable)initWithDictionary:(id)a3
{
  void *v4;
  CRKKeyValueTable *v5;

  objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_109);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKKeyValueTable initWithKeyValuePairs:]([CRKKeyValueTable alloc], "initWithKeyValuePairs:", v4);

  return v5;
}

CRKKeyValuePair *__39__CRKKeyValueTable_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CRKKeyValuePair *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[CRKKeyValuePair initWithKey:value:]([CRKKeyValuePair alloc], "initWithKey:value:", v5, v4);

  return v6;
}

- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  -[CRKKeyValueTable keyValuePairs](self, "keyValuePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_3_1, &__block_literal_global_5_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "crk_JSONRepresentationWithPrettyPrinting:sortKeys:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __70__CRKKeyValueTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

uint64_t __70__CRKKeyValueTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (CRKTable)table
{
  CRKTable *table;
  void *v4;
  CRKTable *v5;
  CRKTable *v6;

  table = self->_table;
  if (!table)
  {
    -[CRKKeyValueTable keyValuePairs](self, "keyValuePairs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRKTable parsableTableWithKeyValuePairs:](CRKTable, "parsableTableWithKeyValuePairs:", v4);
    v5 = (CRKTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_table;
    self->_table = v5;

    table = self->_table;
  }
  return table;
}

- (id)tableString
{
  void *v2;
  void *v3;

  -[CRKKeyValueTable table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
