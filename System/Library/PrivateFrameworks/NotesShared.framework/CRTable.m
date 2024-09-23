@implementation CRTable

+ (void)registerWithICCRCoder
{
  +[ICCRCoder registerClass:forType:](ICCRCoder, "registerClass:forType:", objc_opt_class(), CFSTR("com.apple.notes.CRTable"));
}

- (CRTable)initWithDocument:(id)a3
{
  return -[CRTable initWithDocument:isRightToLeft:](self, "initWithDocument:isRightToLeft:", a3, 0);
}

- (CRTable)initWithDocument:(id)a3 isRightToLeft:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("CRTableColumnDirectionRightToLeft");
  else
    v4 = CFSTR("CRTableColumnDirectionLeftToRight");
  return -[CRTable initWithDocument:columnDirection:](self, "initWithDocument:columnDirection:", a3, v4);
}

- (CRTable)initWithDocument:(id)a3 columnDirection:(id)a4
{
  id v6;
  id v7;
  ICCRRegisterLatest *v8;
  ICCRTombstoneOrderedSet *v9;
  ICCRTombstoneOrderedSet *v10;
  ICCRDictionary *v11;
  CRTable *v12;

  v6 = a4;
  v7 = a3;
  v8 = -[ICCRRegisterLatest initWithContents:document:]([ICCRRegisterLatest alloc], "initWithContents:document:", v6, v7);

  v9 = -[ICCRTombstoneOrderedSet initWithDocument:]([ICCRTombstoneOrderedSet alloc], "initWithDocument:", v7);
  v10 = -[ICCRTombstoneOrderedSet initWithDocument:]([ICCRTombstoneOrderedSet alloc], "initWithDocument:", v7);
  v11 = -[ICCRDictionary initWithDocument:]([ICCRDictionary alloc], "initWithDocument:", v7);
  v12 = -[CRTable initWithDocument:columnDirection:crColumns:crRows:cellColumns:](self, "initWithDocument:columnDirection:crColumns:crRows:cellColumns:", v7, v8, v9, v10, v11);

  return v12;
}

- (CRTable)initWithDocument:(id)a3 columnDirection:(id)a4 crColumns:(id)a5 crRows:(id)a6 cellColumns:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  CRTable *v19;
  objc_super v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a3;
  objc_msgSend(v16, "TTZero");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)CRTable;
  v19 = -[ICCRObject initWithDocument:identity:](&v21, sel_initWithDocument_identity_, v17, v18);

  if (v19)
  {
    -[ICCRObject setFieldKey:value:](v19, "setFieldKey:value:", CFSTR("crTableColumnDirection"), v12);
    objc_msgSend(v13, "setDelegate:", v19);
    -[ICCRObject setFieldKey:value:](v19, "setFieldKey:value:", CFSTR("crColumns"), v13);
    objc_msgSend(v14, "setDelegate:", v19);
    -[ICCRObject setFieldKey:value:](v19, "setFieldKey:value:", CFSTR("crRows"), v14);
    -[ICCRObject setFieldKey:value:](v19, "setFieldKey:value:", CFSTR("cellColumns"), v15);
  }

  return v19;
}

- (CRTable)initWithIdentity:(id)a3 fields:(id)a4
{
  CRTable *v4;
  CRTable *v5;
  void *v6;
  void *v7;
  void *v8;
  ICCRRegisterLatest *v9;
  void *v10;
  ICCRRegisterLatest *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRTable;
  v4 = -[ICCRObject initWithIdentity:fields:](&v13, sel_initWithIdentity_fields_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CRTable crColumns](v4, "crColumns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);

    -[CRTable crRows](v5, "crRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v5);

    -[CRTable crTableColumnDirection](v5, "crTableColumnDirection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [ICCRRegisterLatest alloc];
      -[ICCRObject document](v5, "document");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ICCRRegisterLatest initWithContents:document:](v9, "initWithContents:document:", CFSTR("CRTableColumnDirectionLeftToRight"), v10);
      -[ICCRObject setFieldKey:value:](v5, "setFieldKey:value:", CFSTR("crTableColumnDirection"), v11);

    }
  }
  return v5;
}

- (id)identity
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
}

- (NSString)columnDirection
{
  void *v2;
  void *v3;

  -[CRTable crTableColumnDirection](self, "crTableColumnDirection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setColumnDirection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[CRTable wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRTable columnDirection](self, "columnDirection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTable delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__CRTable_setColumnDirection___block_invoke;
    v9[3] = &unk_1E76CF168;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "addUndoCommandsForObject:block:", self, v9);

  }
  -[CRTable crTableColumnDirection](self, "crTableColumnDirection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContents:", v4);

}

uint64_t __30__CRTable_setColumnDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColumnDirection:", *(_QWORD *)(a1 + 32));
}

- (id)crTableColumnDirection
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICCRObject fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("crTableColumnDirection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ICCRTombstoneOrderedSet)crColumns
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICCRObject fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("crColumns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTombstoneOrderedSet *)v5;
}

- (ICCRTombstoneOrderedSet)crRows
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICCRObject fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("crRows"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTombstoneOrderedSet *)v5;
}

- (ICCRDictionary)cellColumns
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICCRObject fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cellColumns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRDictionary *)v5;
}

+ (id)CRProperties
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("crTableColumnDirection");
  v3[1] = CFSTR("crColumns");
  v4[0] = CFSTR("CRTableColumnDirectionLeftToRight");
  v4[1] = CFSTR("NONE");
  v3[2] = CFSTR("crRows");
  v3[3] = CFSTR("cellColumns");
  v4[2] = CFSTR("NONE");
  v4[3] = CFSTR("NONE");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)columnCount
{
  void *v2;
  unint64_t v3;

  -[CRTable crColumns](self, "crColumns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)rowCount
{
  void *v2;
  unint64_t v3;

  -[CRTable crRows](self, "crRows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)columnsIntersectingWithColumns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__CRTable_columnsIntersectingWithColumns___block_invoke;
  v11[3] = &unk_1E76CF190;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __42__CRTable_columnsIntersectingWithColumns___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObjectEqualTo:", a2);
}

- (id)rowsIntersectingWithRows:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__CRTable_rowsIntersectingWithRows___block_invoke;
  v11[3] = &unk_1E76CF190;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __36__CRTable_rowsIntersectingWithRows___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObjectEqualTo:", a2);
}

- (id)identifierForRowAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[CRTable crRows](self, "crRows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)identifierForColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[CRTable crColumns](self, "crColumns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)identifiersForRowIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  CRTable *v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __36__CRTable_identifiersForRowIndexes___block_invoke;
  v13 = &unk_1E76CBCB8;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __36__CRTable_identifiersForRowIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifierForRowAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)identifiersForColumnIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  CRTable *v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __39__CRTable_identifiersForColumnIndexes___block_invoke;
  v13 = &unk_1E76CBCB8;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __39__CRTable_identifiersForColumnIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifierForColumnAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (unint64_t)rowIndexForIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfEqualObject:", v4);

  return v6;
}

- (unint64_t)columnIndexForIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfEqualObject:", v4);

  return v6;
}

- (id)rowIndexesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[CRTable rowIndexForIdentifier:](self, "rowIndexForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)columnIndexesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[CRTable columnIndexForIdentifier:](self, "columnIndexForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)containsRow:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObjectEqualTo:", v4);

  return v6;
}

- (BOOL)containsColumn:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObjectEqualTo:", v4);

  return v6;
}

- (id)defaultContentAtColumn:(id)a3 row:(id)a4
{
  return 0;
}

- (id)insertRowAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CRTable *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable crRows](self, "crRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", v5, a3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __28__CRTable_insertRowAtIndex___block_invoke;
  v13[3] = &unk_1E76CF1B8;
  v14 = v7;
  v15 = self;
  v8 = v5;
  v16 = v8;
  v9 = v7;
  -[CRTable enumerateColumnsWithBlock:](self, "enumerateColumnsWithBlock:", v13);
  -[CRTable undoablyInsertContents:atRow:](self, "undoablyInsertContents:atRow:", v9, v8);
  v10 = v16;
  v11 = v8;

  return v11;
}

void __28__CRTable_insertRowAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v3, "defaultContentAtColumn:row:", v5, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)insertColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CRTable *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable crColumns](self, "crColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", v5, a3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__CRTable_insertColumnAtIndex___block_invoke;
  v13[3] = &unk_1E76CF1B8;
  v14 = v7;
  v15 = self;
  v8 = v5;
  v16 = v8;
  v9 = v7;
  -[CRTable enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v13);
  -[CRTable undoablyInsertContents:atColumn:](self, "undoablyInsertContents:atColumn:", v9, v8);
  v10 = v16;
  v11 = v8;

  return v11;
}

void __31__CRTable_insertColumnAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v3, "defaultContentAtColumn:row:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)insertRows:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (a3)
  {
    -[CRTable insertRowAtIndex:](self, "insertRowAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
    --a3;

  }
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (id)insertColumns:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (a3)
  {
    -[CRTable insertColumnAtIndex:](self, "insertColumnAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
    --a3;

  }
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (void)removeRowAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CRTable undoablyRemoveContentsOfRow:](self, "undoablyRemoveContentsOfRow:", v7);
  -[CRTable crRows](self, "crRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", a3);

}

- (void)undoablyRemoveContentsOfRow:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[CRTable columnCount](self, "columnCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRTable columnCount](self, "columnCount"))
  {
    v6 = 0;
    do
    {
      -[CRTable crColumns](self, "crColumns");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CRTable cellColumns](self, "cellColumns");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v8);

        objc_msgSend(v10, "removeObjectForKey:", v4);
        if (!objc_msgSend(v10, "count"))
        {
          -[CRTable cellColumns](self, "cellColumns");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObjectForKey:", v8);

        }
      }

      ++v6;
    }
    while (v6 < -[CRTable columnCount](self, "columnCount"));
  }
  if (-[CRTable wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRTable delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__CRTable_undoablyRemoveContentsOfRow___block_invoke;
    v14[3] = &unk_1E76CF1E0;
    v15 = v5;
    v16 = v4;
    objc_msgSend(v13, "addUndoCommandsForObject:block:", self, v14);

  }
}

uint64_t __39__CRTable_undoablyRemoveContentsOfRow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyInsertContents:atRow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)undoablyInsertContents:(id)a3 atRow:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__CRTable_undoablyInsertContents_atRow___block_invoke;
  v12[3] = &unk_1E76CF208;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (-[CRTable wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRTable delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __40__CRTable_undoablyInsertContents_atRow___block_invoke_2;
    v10[3] = &unk_1E76CF168;
    v11 = v8;
    objc_msgSend(v9, "addUndoCommandsForObject:block:", self, v10);

  }
}

uint64_t __40__CRTable_undoablyInsertContents_atRow___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:columnID:rowID:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __40__CRTable_undoablyInsertContents_atRow___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyRemoveContentsOfRow:", *(_QWORD *)(a1 + 32));
}

- (void)removeColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CRTable undoablyRemoveContentsOfColumn:](self, "undoablyRemoveContentsOfColumn:", v7);
  -[CRTable crColumns](self, "crColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", a3);

}

- (void)moveRowAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v6;

  -[CRTable crRows](self, "crRows");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moveObjectFromIndex:toIndex:", a3, a4);

}

- (void)moveColumnAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v6;

  -[CRTable crColumns](self, "crColumns");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moveObjectFromIndex:toIndex:", a3, a4);

}

- (void)undoablyRemoveContentsOfColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[CRTable cellColumns](self, "cellColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__CRTable_undoablyRemoveContentsOfColumn___block_invoke;
  v15[3] = &unk_1E76CF230;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "enumerateKeysObjectsAndTimestampsUsingBlock:", v15);
  -[CRTable cellColumns](self, "cellColumns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v4);

  if (-[CRTable wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRTable delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __42__CRTable_undoablyRemoveContentsOfColumn___block_invoke_2;
    v12[3] = &unk_1E76CF1E0;
    v13 = v9;
    v14 = v4;
    objc_msgSend(v11, "addUndoCommandsForObject:block:", self, v12);

  }
}

uint64_t __42__CRTable_undoablyRemoveContentsOfColumn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __42__CRTable_undoablyRemoveContentsOfColumn___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyInsertContents:atColumn:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)undoablyInsertContents:(id)a3 atColumn:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__CRTable_undoablyInsertContents_atColumn___block_invoke;
  v12[3] = &unk_1E76CF208;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (-[CRTable wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRTable delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __43__CRTable_undoablyInsertContents_atColumn___block_invoke_2;
    v10[3] = &unk_1E76CF168;
    v11 = v8;
    objc_msgSend(v9, "addUndoCommandsForObject:block:", self, v10);

  }
}

uint64_t __43__CRTable_undoablyInsertContents_atColumn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:columnID:rowID:", a3, *(_QWORD *)(a1 + 40), a2);
}

uint64_t __43__CRTable_undoablyInsertContents_atColumn___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyRemoveContentsOfColumn:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isRightToLeft
{
  void *v2;
  char v3;

  -[CRTable columnDirection](self, "columnDirection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CRTableColumnDirectionRightToLeft"));

  return v3;
}

- (BOOL)isLeftToRight
{
  return !-[CRTable isRightToLeft](self, "isRightToLeft");
}

- (void)reverseColumnDirection
{
  const __CFString *v3;
  id v4;

  -[CRTable columnDirection](self, "columnDirection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CRTableColumnDirectionLeftToRight")))
    v3 = CFSTR("CRTableColumnDirectionRightToLeft");
  else
    v3 = CFSTR("CRTableColumnDirectionLeftToRight");
  -[CRTable setColumnDirection:](self, "setColumnDirection:", v3);

}

- (id)objectForColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CRTable crColumns](self, "crColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable crRows](self, "crRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable objectForColumnID:rowID:](self, "objectForColumnID:rowID:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)objectForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CRTable cellColumns](self, "cellColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setObject:(id)a3 columnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  -[CRTable crColumns](self, "crColumns");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable crRows](self, "crRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTable setObject:columnID:rowID:](self, "setObject:columnID:rowID:", v8, v9, v11);

}

- (void)setObject:(id)a3 columnID:(id)a4 rowID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ICCRDictionary *v11;
  ICCRDictionary *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[CRTable cellColumns](self, "cellColumns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (ICCRDictionary *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = [ICCRDictionary alloc];
    -[ICCRObject document](self, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICCRDictionary initWithDocument:](v12, "initWithDocument:", v13);

    -[CRTable cellColumns](self, "cellColumns");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v11, v8);

  }
  -[ICCRDictionary setObject:forKey:](v11, "setObject:forKey:", v15, v9);

}

- (void)enumerateColumnsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CRTable_enumerateColumnsWithBlock___block_invoke;
  v7[3] = &unk_1E76CF258;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __37__CRTable_enumerateColumnsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateRowsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRTable crRows](self, "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CRTable_enumerateRowsWithBlock___block_invoke;
  v7[3] = &unk_1E76CF258;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __34__CRTable_enumerateRowsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateCellObjectsInCellSelectionContainingColumnIndices:(id)a3 rowIndices:(id)a4 copyItems:(BOOL)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CRTable *v21;
  id v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
    v13 = v10;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[CRTable columnCount](self, "columnCount"));
  v14 = v13;
  if (v11)
    v15 = v11;
  else
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[CRTable rowCount](self, "rowCount"));
  v16 = v15;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__CRTable_enumerateCellObjectsInCellSelectionContainingColumnIndices_rowIndices_copyItems_usingBlock___block_invoke;
  v19[3] = &unk_1E76CF2A8;
  v17 = v14;
  v23 = v25;
  v20 = v17;
  v21 = self;
  v24 = a5;
  v18 = v12;
  v22 = v18;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v19);

  _Block_object_dispose(v25, 8);
}

void __102__CRTable_enumerateCellObjectsInCellSelectionContainingColumnIndices_rowIndices_copyItems_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[4];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__CRTable_enumerateCellObjectsInCellSelectionContainingColumnIndices_rowIndices_copyItems_usingBlock___block_invoke_2;
  v6[3] = &unk_1E76CF280;
  v3 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v9 = a2;
  v5 = *(_OWORD *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 64);
  v4 = (id)v5;
  v7 = v5;
  v8 = v11;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6);

  _Block_object_dispose(v11, 8);
}

void __102__CRTable_enumerateCellObjectsInCellSelectionContainingColumnIndices_rowIndices_copyItems_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForColumnIndex:rowIndex:", a2, *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        v10 = v5;
        v7 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF526E48);
        v6 = v10;
        if (v7)
        {
          v8 = objc_msgSend(v10, "copyWithZone:", 0);

          v6 = (id)v8;
        }
      }
    }
    v11 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "setObject:columnIndex:rowIndex:", v9, a2, *(_QWORD *)(a1 + 64));

  }
}

- (id)subtableWithDocument:(id)a3 forSelectionContainingColumnIndices:(id)a4 rowIndices:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[CRTable columnCount](self, "columnCount"));
  v12 = v11;
  v33 = v10;
  v34 = v9;
  if (v10)
    v13 = v10;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[CRTable rowCount](self, "rowCount"));
  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDocument:isRightToLeft:", v8, -[CRTable isRightToLeft](self, "isRightToLeft"));
  v16 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __79__CRTable_subtableWithDocument_forSelectionContainingColumnIndices_rowIndices___block_invoke;
  v37[3] = &unk_1E76CBCB8;
  v37[4] = self;
  v17 = v15;
  v38 = v17;
  v32 = v12;
  objc_msgSend(v12, "enumerateIndexesUsingBlock:", v37);
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __79__CRTable_subtableWithDocument_forSelectionContainingColumnIndices_rowIndices___block_invoke_2;
  v35[3] = &unk_1E76CBCB8;
  v35[4] = self;
  v18 = v17;
  v36 = v18;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v35);
  if (objc_msgSend(v18, "columnCount"))
  {
    v19 = 0;
    do
    {
      if (objc_msgSend(v18, "rowCount"))
      {
        v20 = 0;
        do
        {
          objc_msgSend(v18, "identifierForColumnAtIndex:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[CRTable columnIndexForIdentifier:](self, "columnIndexForIdentifier:", v21);
          objc_msgSend(v18, "identifierForRowAtIndex:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTable objectForColumnIndex:rowIndex:](self, "objectForColumnIndex:rowIndex:", v22, -[CRTable rowIndexForIdentifier:](self, "rowIndexForIdentifier:", v23));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            ICProtocolCast();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
              v27 = (id)objc_msgSend(v25, "copyWithZone:", 0);
            else
              v27 = v24;
            v28 = v27;
            objc_msgSend(v18, "setObject:columnIndex:rowIndex:", v27, v19, v20);

          }
          ++v20;
        }
        while (v20 < objc_msgSend(v18, "rowCount"));
      }
      ++v19;
    }
    while (v19 < objc_msgSend(v18, "columnCount"));
  }
  v29 = v36;
  v30 = v18;

  return v30;
}

void __79__CRTable_subtableWithDocument_forSelectionContainingColumnIndices_rowIndices___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "crColumns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "crColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v7, objc_msgSend(v6, "count"));

}

void __79__CRTable_subtableWithDocument_forSelectionContainingColumnIndices_rowIndices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "crRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "crRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "crRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v7, objc_msgSend(v6, "count"));

}

- (unint64_t)countOfPopulatedCells
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = 0;
  if (-[CRTable columnCount](self, "columnCount"))
  {
    v4 = 0;
    do
    {
      -[CRTable crColumns](self, "crColumns");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[CRTable cellColumns](self, "cellColumns");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v3 += objc_msgSend(v8, "count");

      ++v4;
    }
    while (v4 < -[CRTable columnCount](self, "columnCount"));
  }
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CRTable crTableColumnDirection](self, "crTableColumnDirection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRTable crColumns](self, "crColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "hash") << 8) ^ (v4 << 12);
  -[CRTable crRows](self, "crRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (16 * objc_msgSend(v7, "hash"));
  -[CRTable cellColumns](self, "cellColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRTable crTableColumnDirection](self, "crTableColumnDirection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "crTableColumnDirection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualContents:", v7))
    {
      -[CRTable crRows](self, "crRows");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "crRows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[CRTable crColumns](self, "crColumns");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "crColumns");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[CRTable cellColumns](self, "cellColumns");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cellColumns");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v15, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, void *);
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  -[CRTable crRows](self, "crRows");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CRTable delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {
    v14 = MEMORY[0x1E0C809B0];
    v10 = __42__CRTable_addUndoCommandsForObject_block___block_invoke;
    v11 = &v14;
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v10 = __42__CRTable_addUndoCommandsForObject_block___block_invoke_2;
    v11 = &v13;
  }
  v11[1] = 3221225472;
  v11[2] = (uint64_t)v10;
  v11[3] = (uint64_t)&unk_1E76CF2D0;
  v11[4] = (uint64_t)v6;
  v12 = v6;
  objc_msgSend(v9, "addUndoCommandsForObject:block:", self, v11);

}

void __42__CRTable_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "crRows");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __42__CRTable_addUndoCommandsForObject_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "crColumns");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)wantsUndoCommands
{
  void *v2;
  char v3;

  -[CRTable delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUndoCommands");

  return v3;
}

- (ICCRUndoDelegate)delegate
{
  return (ICCRUndoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
