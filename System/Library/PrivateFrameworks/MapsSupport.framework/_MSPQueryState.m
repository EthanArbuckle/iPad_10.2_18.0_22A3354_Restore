@implementation _MSPQueryState

- (_MSPQueryState)initWithContainerContents:(id)a3
{
  id v4;
  _MSPQueryState *v5;
  uint64_t v6;
  NSArray *contents;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *identifiers;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MSPQueryState;
  v5 = -[_MSPQueryState init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contents = v5->_contents;
    v5->_contents = (NSArray *)v6;

    v8 = v4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "storageIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(v9, "copy");
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v16;

  }
  return v5;
}

- (_MSPQueryState)initWithContents:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  _MSPQueryState *v8;
  uint64_t v9;
  NSArray *contents;
  uint64_t v11;
  NSArray *identifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MSPQueryState;
  v8 = -[_MSPQueryState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    contents = v8->_contents;
    v8->_contents = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v11;

  }
  return v8;
}

- (id)stateByInvokingPreprocessingBlock:(id)a3 mappingBlock:(id)a4
{
  void (**v6)(id, void *);
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  _MSPQueryState *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v21)(id, void *);
  id obj;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    -[_MSPQueryState contents](self, "contents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v21 = v6;
  v24 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self;
  -[_MSPQueryState contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15), v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[_MSPQueryState identifiers](v10, "identifiers", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v13 + v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v16);
          objc_msgSend(v23, "addObject:", v18);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v13 += v15;
    }
    while (v12);
  }

  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContents:identifiers:", v24, v23);
  return v19;
}

- (id)stateByDeletingObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_MSPQueryState contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[_MSPQueryState identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "removeObjectAtIndex:", a3);
  objc_msgSend(v8, "removeObjectAtIndex:", a3);
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContents:identifiers:", v6, v8);

  return v9;
}

- (id)stateByDeletingObjectsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_MSPQueryState contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[_MSPQueryState identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "removeObjectsAtIndexes:", v4);
  objc_msgSend(v8, "removeObjectsAtIndexes:", v4);

  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContents:identifiers:", v6, v8);
  return v9;
}

- (id)stateByMovingObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[_MSPQueryState contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[_MSPQueryState identifiers](self, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);
  objc_msgSend(v8, "insertObject:atIndex:", v11, a4);
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectAtIndex:", a3);
  objc_msgSend(v10, "insertObject:atIndex:", v12, a4);
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContents:identifiers:", v8, v10);

  return v13;
}

- (NSArray)contents
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)identifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
