@implementation ICTable

+ (void)registerWithICCRCoder
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ICTable;
  objc_msgSendSuper2(&v2, sel_registerWithICCRCoder);
  +[ICCRCoder registerClass:forType:](ICCRCoder, "registerClass:forType:", objc_opt_class(), CFSTR("com.apple.notes.ICTable"));
}

- (ICTableCellChangeNotifier)cellChangeNotifier
{
  ICTableCellChangeNotifier *cellChangeNotifier;
  ICTableCellChangeNotifier *v4;
  ICTableCellChangeNotifier *v5;

  cellChangeNotifier = self->_cellChangeNotifier;
  if (!cellChangeNotifier)
  {
    v4 = objc_alloc_init(ICTableCellChangeNotifier);
    v5 = self->_cellChangeNotifier;
    self->_cellChangeNotifier = v4;

    cellChangeNotifier = self->_cellChangeNotifier;
  }
  return cellChangeNotifier;
}

- (void)setAttributedString:(id)a3 columnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5
{
  id v8;
  ICTTMergeableAttributedString *v9;
  void *v10;
  void *v11;
  ICTTMergeableAttributedString *v12;

  v8 = a3;
  -[CRTable objectForColumnIndex:rowIndex:](self, "objectForColumnIndex:rowIndex:", a4, a5);
  v12 = (ICTTMergeableAttributedString *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICTTMergeableString deleteCharactersInRange:](v12, "deleteCharactersInRange:", 0, -[ICTTMergeableString length](v12, "length"));
  }
  else
  {
    v9 = [ICTTMergeableAttributedString alloc];
    -[ICCRObject document](self, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replica");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICTTMergeableString initWithReplicaID:](v9, "initWithReplicaID:", v11);

    -[CRTable setObject:columnIndex:rowIndex:](self, "setObject:columnIndex:rowIndex:", v12, a4, a5);
  }
  -[ICTTMergeableString insertAttributedString:atIndex:](v12, "insertAttributedString:atIndex:", v8, 0);

}

- (id)stringForColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  void *v4;
  void *v5;

  -[CRTable objectForColumnIndex:rowIndex:](self, "objectForColumnIndex:rowIndex:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;

  v6 = a4;
  v7 = -[CRTable columnIndexForIdentifier:](self, "columnIndexForIdentifier:", a3);
  v8 = -[CRTable rowIndexForIdentifier:](self, "rowIndexForIdentifier:", v6);

  return -[ICTable stringForColumnIndex:rowIndex:](self, "stringForColumnIndex:rowIndex:", v7, v8);
}

- (id)mergeableStringForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = -[CRTable columnIndexForIdentifier:](self, "columnIndexForIdentifier:", a3);
  v8 = -[CRTable rowIndexForIdentifier:](self, "rowIndexForIdentifier:", v6);

  v9 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CRTable objectForColumnIndex:rowIndex:](self, "objectForColumnIndex:rowIndex:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      objc_msgSend(v10, "replicaUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!(string && !string.replicaUUID)", "-[ICTable mergeableStringForColumnID:rowID:]", 1, 0, CFSTR("invalid nil value for 'string.replicaUUID'"));
    }
  }
  return v9;
}

- (ICCRTTCompatibleDocument)ttDocument
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICCRObject document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTTCompatibleDocument *)v4;
}

- (id)copyIntoNewDocumentWithReplicaID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICCRObject document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyForReplica:", v4);

  return v6;
}

- (BOOL)columnIsEmptyAtIndex:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ICTable isEmptyAtColumnIndexes:rowIndexes:](self, "isEmptyAtColumnIndexes:rowIndexes:", v4, 0);

  return (char)self;
}

- (BOOL)rowIsEmptyAtIndex:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ICTable isEmptyAtColumnIndexes:rowIndexes:](self, "isEmptyAtColumnIndexes:rowIndexes:", 0, v4);

  return (char)self;
}

- (BOOL)isEmptyAtColumnIndexes:(id)a3 rowIndexes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = objc_msgSend(v6, "lastIndex"), v8 >= -[CRTable columnCount](self, "columnCount"))
    || v7 && (v9 = objc_msgSend(v7, "lastIndex"), v9 >= -[CRTable rowCount](self, "rowCount")))
  {
    v10 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__ICTable_isEmptyAtColumnIndexes_rowIndexes___block_invoke;
    v12[3] = &unk_1E76CD1B0;
    v12[4] = &v13;
    -[CRTable enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:](self, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", v6, v7, 0, v12);
    v10 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v10;
}

uint64_t __45__ICTable_isEmptyAtColumnIndexes_rowIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (objc_msgSend(a2, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return 0;
}

- (BOOL)isEmptyAtColumnIdentifiers:(id)a3 rowIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[CRTable columnIndexesForIdentifiers:](self, "columnIndexesForIdentifiers:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[CRTable rowIndexesForIdentifiers:](self, "rowIndexesForIdentifiers:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = -[ICTable isEmptyAtColumnIndexes:rowIndexes:](self, "isEmptyAtColumnIndexes:rowIndexes:", v8, v9);

  return v10;
}

- (id)subtableWithDocument:(id)a3 forSelectionContainingColumnIndices:(id)a4 rowIndices:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICTable;
  v8 = a3;
  -[CRTable subtableWithDocument:forSelectionContainingColumnIndices:rowIndices:](&v14, sel_subtableWithDocument_forSelectionContainingColumnIndices_rowIndices_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedTopotextTimestamp", v14.receiver, v14.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTable ttDocument](self, "ttDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedTopotextTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mergeWithTimestamp:", v12);

  return v9;
}

- (NSMutableDictionary)columnTextStorages
{
  NSMutableDictionary *columnTextStorages;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  columnTextStorages = self->_columnTextStorages;
  if (!columnTextStorages)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[CRTable columnCount](self, "columnCount"));
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_columnTextStorages;
    self->_columnTextStorages = v4;

    columnTextStorages = self->_columnTextStorages;
  }
  return columnTextStorages;
}

- (void)undoablyRemoveContentsOfColumn:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CRTable delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRTable delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableWillRemoveColumnID:", v4);

  }
  v8.receiver = self;
  v8.super_class = (Class)ICTable;
  -[CRTable undoablyRemoveContentsOfColumn:](&v8, sel_undoablyRemoveContentsOfColumn_, v4);

}

- (void)undoablyInsertContents:(id)a3 atColumn:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICTable;
  -[CRTable undoablyInsertContents:atColumn:](&v10, sel_undoablyInsertContents_atColumn_, a3, v6);
  -[CRTable delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRTable delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableDidInsertColumnID:", v6);

  }
}

- (id)defaultContentAtColumn:(id)a3 row:(id)a4
{
  ICTTMergeableAttributedString *v5;
  void *v6;
  void *v7;
  ICTTMergeableAttributedString *v8;

  v5 = [ICTTMergeableAttributedString alloc];
  -[ICCRObject document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replica");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICTTMergeableString initWithReplicaID:](v5, "initWithReplicaID:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellChangeNotifier, 0);
  objc_storeStrong((id *)&self->_columnTextStorages, 0);
}

@end
