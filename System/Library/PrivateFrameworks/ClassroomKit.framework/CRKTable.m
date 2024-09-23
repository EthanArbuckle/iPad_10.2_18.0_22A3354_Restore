@implementation CRKTable

+ (CRKTable)tableWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5
{
  id v7;
  id v8;
  id v9;
  CRKDictionaryRowTableEntries *v10;
  CRKTableEntriesWithRowSpacer *v11;
  CRKRepeatedCharacterTableEntry *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  CRKRightPaddingTableEntry *v19;
  void *v20;
  CRKTableEntriesWithRowSpacer *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[CRKDictionaryRowTableEntries initWithDictionaryObjects:keys:]([CRKDictionaryRowTableEntries alloc], "initWithDictionaryObjects:keys:", v9, v8);
  if (v7)
  {
    v11 = [CRKTableEntriesWithRowSpacer alloc];
    v12 = -[CRKRepeatedCharacterTableEntry initWithCharacter:]([CRKRepeatedCharacterTableEntry alloc], "initWithCharacter:", 45);
    v22 = -[CRKTableEntriesWithRowSpacer initWithOrigin:index:spacerEntry:](v11, "initWithOrigin:index:spacerEntry:", v10, 0, v12);

    v13 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = -[CRKRightPaddingTableEntry initWithObject:]([CRKRightPaddingTableEntry alloc], "initWithObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    v10 = -[CRKTableEntriesWithAddedRow initWithOrigin:index:entries:]([CRKTableEntriesWithAddedRow alloc], "initWithOrigin:index:entries:", v22, 0, v13);
  }
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntries:", v10);

  return (CRKTable *)v20;
}

+ (id)parsableTableWithKeyValuePairs:(id)a3
{
  id v3;
  void *v4;
  CRKListTableEntries *v5;
  CRKTableEntriesWithColumnSpacer *v6;
  CRKRightPaddingTableEntry *v7;
  CRKTableEntriesWithColumnSpacer *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CRKRightPaddingTableEntry *v16;
  CRKTableEntriesWithAddedColumn *v17;
  CRKTableEntriesWithColumnSpacer *v18;
  CRKRightPaddingTableEntry *v19;
  CRKTableEntriesWithColumnSpacer *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKListTableEntries initWithArray:]([CRKListTableEntries alloc], "initWithArray:", v4);
  v6 = [CRKTableEntriesWithColumnSpacer alloc];
  v7 = -[CRKRightPaddingTableEntry initWithObject:]([CRKRightPaddingTableEntry alloc], "initWithObject:", CFSTR("\t"));
  v8 = -[CRKTableEntriesWithColumnSpacer initWithOrigin:index:spacerEntry:](v6, "initWithOrigin:index:spacerEntry:", v5, 0, v7);

  objc_msgSend(v3, "valueForKey:", CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = -[CRKRightPaddingTableEntry initWithObject:]([CRKRightPaddingTableEntry alloc], "initWithObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15));
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  v17 = -[CRKTableEntriesWithAddedColumn initWithOrigin:index:entries:]([CRKTableEntriesWithAddedColumn alloc], "initWithOrigin:index:entries:", v8, 0, v10);
  v18 = [CRKTableEntriesWithColumnSpacer alloc];
  v19 = -[CRKRightPaddingTableEntry initWithObject:]([CRKRightPaddingTableEntry alloc], "initWithObject:", CFSTR("\t"));
  v20 = -[CRKTableEntriesWithColumnSpacer initWithOrigin:index:spacerEntry:](v18, "initWithOrigin:index:spacerEntry:", v17, 0, v19);

  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntries:", v20);
  return v21;
}

- (CRKTable)initWithEntries:(id)a3
{
  id v6;
  CRKTable *v7;
  CRKTable *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTable.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entries"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKTable;
  v7 = -[CRKTable init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mEntries, a3);

  return v8;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v3 = (void *)objc_opt_new();
  -[CRKTable columnLengths](self, "columnLengths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRKTableEntries rowCount](self->mEntries, "rowCount"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_opt_new();
      if (-[CRKTableEntries columnCount](self->mEntries, "columnCount"))
      {
        v7 = 0;
        do
        {
          -[CRKTableEntries entryAtRow:column:](self->mEntries, "entryAtRow:column:", v5, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "unsignedIntegerValue");

          objc_msgSend(v8, "stringValueWithLength:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length") != v10)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTable.m"), 84, CFSTR("Invalid entry width. Required: %@, Found: %@."), v16, v12);

          }
          objc_msgSend(v6, "addObject:", v11);

          ++v7;
        }
        while (v7 < -[CRKTableEntries columnCount](self->mEntries, "columnCount"));
      }
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v13);

      ++v5;
    }
    while (v5 < -[CRKTableEntries rowCount](self->mEntries, "rowCount"));
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)columnLengths
{
  void *v3;
  unint64_t v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  if (-[CRKTableEntries columnCount](self->mEntries, "columnCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKTable lengthOfLongestObjectInColumn:](self, "lengthOfLongestObjectInColumn:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[CRKTableEntries columnCount](self->mEntries, "columnCount"));
  }
  return v3;
}

- (unint64_t)lengthOfLongestObjectInColumn:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v5 = 0;
  if (-[CRKTableEntries rowCount](self->mEntries, "rowCount"))
  {
    v6 = 0;
    do
    {
      -[CRKTableEntries entryAtRow:column:](self->mEntries, "entryAtRow:column:", v6, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rawStringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v5 <= v9)
        v5 = v9;
      ++v6;
    }
    while (v6 < -[CRKTableEntries rowCount](self->mEntries, "rowCount"));
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEntries, 0);
}

@end
