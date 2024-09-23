@implementation CRKHeaderTable

- (CRKHeaderTable)initWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKHeaderTable *v11;
  uint64_t v12;
  NSArray *headers;
  uint64_t v14;
  NSArray *keyPaths;
  uint64_t v16;
  NSArray *objects;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKHeaderTable;
  v11 = -[CRKHeaderTable init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    headers = v11->_headers;
    v11->_headers = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    keyPaths = v11->_keyPaths;
    v11->_keyPaths = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    objects = v11->_objects;
    v11->_objects = (NSArray *)v16;

  }
  return v11;
}

- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v16;
  _BOOL4 v17;
  id obj;
  _QWORD v19[4];
  id v20;
  CRKHeaderTable *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v16 = a3;
  v17 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CRKHeaderTable objects](self, "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        -[CRKHeaderTable keyPaths](self, "keyPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __68__CRKHeaderTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke;
        v19[3] = &unk_24D9C7B60;
        v20 = v11;
        v21 = self;
        v22 = v10;
        v13 = v11;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);

        objc_msgSend(v5, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "crk_JSONRepresentationWithPrettyPrinting:sortKeys:", v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __68__CRKHeaderTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

}

- (CRKTable)table
{
  CRKTable *table;
  void *v4;
  void *v5;
  void *v6;
  CRKTable *v7;
  CRKTable *v8;

  table = self->_table;
  if (!table)
  {
    -[CRKHeaderTable headers](self, "headers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKHeaderTable keyPaths](self, "keyPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKHeaderTable objects](self, "objects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRKTable tableWithHeaders:keyPaths:objects:](CRKTable, "tableWithHeaders:keyPaths:objects:", v4, v5, v6);
    v7 = (CRKTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_table;
    self->_table = v7;

    table = self->_table;
  }
  return table;
}

- (id)tableString
{
  void *v2;
  void *v3;

  -[CRKHeaderTable table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
