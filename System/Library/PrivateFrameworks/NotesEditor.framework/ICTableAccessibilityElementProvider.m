@implementation ICTableAccessibilityElementProvider

- (ICTableAccessibilityElementProvider)initWithTableAccessibilityController:(id)a3
{
  id v4;
  ICTableAccessibilityElementProvider *v5;
  ICTableAccessibilityElementProvider *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *cellCache;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTableAccessibilityElementProvider;
  v5 = -[ICTableAccessibilityElementProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableAXController, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cellCache = v6->_cellCache;
    v6->_cellCache = v7;

  }
  return v6;
}

- (id)cellElementForColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICTableCellAccessibilityElement *v10;
  ICTableCellAccessibilityElement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (ICTableCellAccessibilityElement *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [ICTableCellAccessibilityElement alloc];
    -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICTableCellAccessibilityElement initWithTableAccessibilityController:columnID:rowID:](v11, "initWithTableAccessibilityController:columnID:rowID:", v12, v6, v7);

    -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v6);

    }
    -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, v7);

  }
  return v10;
}

- (id)cellElementsForColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowCount");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rowIDForRowIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAccessibilityElementProvider cellElementForColumnID:rowID:](self, "cellElementForColumnID:rowID:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

      ++v8;
      -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rowCount");

    }
    while (v8 < v13);
  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (id)cellElementsForRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "columnCount");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "columnIDForColumnIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAccessibilityElementProvider cellElementForColumnID:rowID:](self, "cellElementForColumnID:rowID:", v10, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

      ++v8;
      -[ICTableAccessibilityElementProvider tableAXController](self, "tableAXController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "columnCount");

    }
    while (v8 < v13);
  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (void)removeElementsForColumnID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)removeElementsForRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICTableAccessibilityElementProvider cellCache](self, "cellCache", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[ICTableAccessibilityElementProvider cellCache](self, "cellCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "removeObjectForKey:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (ICTableAccessibilityController)tableAXController
{
  return (ICTableAccessibilityController *)objc_loadWeakRetained((id *)&self->_tableAXController);
}

- (void)setTableAXController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAXController, a3);
}

- (ICTable)tableModel
{
  return self->_tableModel;
}

- (NSMutableDictionary)cellCache
{
  return self->_cellCache;
}

- (void)setCellCache:(id)a3
{
  objc_storeStrong((id *)&self->_cellCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellCache, 0);
  objc_storeStrong((id *)&self->_tableModel, 0);
  objc_destroyWeak((id *)&self->_tableAXController);
}

@end
