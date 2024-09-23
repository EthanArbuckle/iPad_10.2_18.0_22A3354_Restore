@implementation ICIndexItemsByIdentifiersOperation

- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4 objectIDURIsToIndex:(id)a5
{
  id v8;
  ICIndexItemsByIdentifiersOperation *v9;
  ICIndexItemsByIdentifiersOperation *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICIndexItemsByIdentifiersOperation;
  v9 = -[ICIndexItemsOperation initWithSearchableIndex:dataSources:](&v12, sel_initWithSearchableIndex_dataSources_, a3, a4);
  v10 = v9;
  if (v9)
    -[ICIndexItemsByIdentifiersOperation setObjectIDURIsToIndex:](v9, "setObjectIDURIsToIndex:", v8);

  return v10;
}

- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4
{
  return -[ICIndexItemsByIdentifiersOperation initWithSearchableIndex:dataSources:objectIDURIsToIndex:](self, "initWithSearchableIndex:dataSources:objectIDURIsToIndex:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICIndexItemsOperation dataSources](self, "dataSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[ICIndexItemsByIdentifiersOperation objectIDURIsToIndex](self, "objectIDURIsToIndex");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICIndexItemsOperation managedObjectContextForDataSource:](self, "managedObjectContextForDataSource:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stageObjectIDURIsForIndexing:context:", v9, v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)ICIndexItemsByIdentifiersOperation;
  -[ICIndexItemsOperation main](&v11, sel_main);
}

- (NSArray)objectIDURIsToIndex
{
  return self->_objectIDURIsToIndex;
}

- (void)setObjectIDURIsToIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDURIsToIndex, 0);
}

@end
