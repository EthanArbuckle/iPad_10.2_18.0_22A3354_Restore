@implementation BMIndexRow

- (BMIndexRow)initWithIndexFields:(id)a3 storeBookmark:(id)a4
{
  id v7;
  id v8;
  BMIndexRow *v9;
  BMIndexRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMIndexRow;
  v9 = -[BMIndexRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexFields, a3);
    objc_storeStrong((id *)&v10->_storeBookmark, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> indexFields: %@, storeBookmark: %@"), objc_opt_class(), self, self->_indexFields, self->_storeBookmark);
}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[BMStoreBookmark hash](self->_storeBookmark, "hash");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_indexFields;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "hash", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BMIndexRow *v4;
  BMIndexRow *v5;
  NSArray *indexFields;
  void *v7;
  BMStoreBookmark *storeBookmark;
  void *v9;
  char v10;

  v4 = (BMIndexRow *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      indexFields = self->_indexFields;
      -[BMIndexRow indexFields](v5, "indexFields");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray isEqual:](indexFields, "isEqual:", v7))
      {
        storeBookmark = self->_storeBookmark;
        -[BMIndexRow storeBookmark](v5, "storeBookmark");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[BMStoreBookmark isEqual:](storeBookmark, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSArray)indexFields
{
  return self->_indexFields;
}

- (BMStoreBookmark)storeBookmark
{
  return self->_storeBookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeBookmark, 0);
  objc_storeStrong((id *)&self->_indexFields, 0);
}

@end
