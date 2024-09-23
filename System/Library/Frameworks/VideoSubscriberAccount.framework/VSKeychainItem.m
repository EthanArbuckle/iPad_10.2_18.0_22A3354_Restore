@implementation VSKeychainItem

- (VSKeychainItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSKeychainItem)initWithItemKind:(id)a3 insertIntoEditingContext:(id)a4
{
  id v6;
  id v7;
  VSKeychainItem *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *committedValues;
  NSMutableDictionary *v11;
  NSMutableDictionary *primitiveValues;
  uint64_t v13;
  VSKeychainItemKind *itemKind;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The itemKind parameter must not be nil."));
  v16.receiver = self;
  v16.super_class = (Class)VSKeychainItem;
  v8 = -[VSKeychainItem init](&v16, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    committedValues = v8->_committedValues;
    v8->_committedValues = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    primitiveValues = v8->_primitiveValues;
    v8->_primitiveValues = v11;

    v13 = objc_msgSend(v6, "copy");
    itemKind = v8->_itemKind;
    v8->_itemKind = (VSKeychainItemKind *)v13;

    objc_storeWeak((id *)&v8->_editingContext, v7);
    objc_msgSend(v7, "insertItem:", v8);
  }

  return v8;
}

- (void)setDeleted:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_deleted != a3)
  {
    -[VSKeychainItem editingContext](self, "editingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareWithInvocationTarget:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeleted:", self->_deleted);

    self->_deleted = a3;
  }
}

- (void)setInserted:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_inserted != a3)
  {
    -[VSKeychainItem editingContext](self, "editingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareWithInvocationTarget:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInserted:", self->_inserted);

    self->_inserted = a3;
  }
}

- (void)setUpdated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_updated != a3)
  {
    -[VSKeychainItem editingContext](self, "editingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareWithInvocationTarget:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUpdated:", self->_updated);

    self->_updated = a3;
  }
}

- (void)_setCommittedValues:(id)a3 registeringUndo:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *committedValues;
  NSMutableDictionary *v12;

  v4 = a4;
  v6 = (NSMutableDictionary *)a3;
  if (self->_committedValues != v6)
  {
    v12 = v6;
    if (v4)
    {
      -[VSKeychainItem editingContext](self, "editingContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepareWithInvocationTarget:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setCommittedValues:registeringUndo:", self->_committedValues, 1);

    }
    v10 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v12, "mutableCopy");
    committedValues = self->_committedValues;
    self->_committedValues = v10;

    v6 = v12;
  }

}

- (void)setPrimitiveValues:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *primitiveValues;

  if (self->_primitiveValues != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    primitiveValues = self->_primitiveValues;
    self->_primitiveValues = v4;

  }
}

- (BOOL)hasChanges
{
  return -[VSKeychainItem isInserted](self, "isInserted")
      || -[VSKeychainItem isUpdated](self, "isUpdated")
      || -[VSKeychainItem isDeleted](self, "isDeleted");
}

- (BOOL)hasPersistentChangedValues
{
  void *v2;
  uint64_t v3;

  -[VSKeychainItem changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 != 0;
}

- (id)primitiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[VSKeychainItem itemKind](self, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSKeychainItem primitiveValues](self, "primitiveValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "defaultValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)setPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (-[VSKeychainItem isDeleted](self, "isDeleted"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempting to modify a deleted object."));
  -[VSKeychainItem primitiveValues](self, "primitiveValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v15)
  {
    objc_msgSend(v7, "setObject:forKey:", v15, v6);
  }
  else
  {
    -[VSKeychainItem itemKind](self, "itemKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesByName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "defaultValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "setObject:forKey:", v12, v6);
    else
      objc_msgSend(v8, "removeObjectForKey:", v6);

  }
  if (!-[VSKeychainItem isInserted](self, "isInserted"))
  {
    -[VSKeychainItem changedValues](self, "changedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    -[VSKeychainItem setUpdated:](self, "setUpdated:", v14 != 0);
  }

}

- (id)committedValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[VSKeychainItem committedValues](self, "committedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "dictionaryWithValuesForKeys:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (id)committedValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSKeychainItem committedValues](self, "committedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)changedValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  char v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VSKeychainItem itemKind](self, "itemKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v5;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[VSKeychainItem committedValueForKey:](self, "committedValueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSKeychainItem primitiveValueForKey:](self, "primitiveValueForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15 = v13;
        v16 = v15;
        if (v14 == v15)
        {

          goto LABEL_17;
        }
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (v17)
        {

          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v18, v11);

            goto LABEL_17;
          }
LABEL_16:
          objc_msgSend(v3, "setObject:forKey:", v16, v11);
          goto LABEL_17;
        }
        v19 = objc_msgSend(v14, "isEqual:", v15);

        if ((v19 & 1) == 0)
          goto LABEL_16;
LABEL_17:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSKeychainItem;
  v4 = a3;
  -[VSKeychainItem willChangeValueForKey:](&v9, sel_willChangeValueForKey_, v4);
  -[VSKeychainItem valueForKey:](self, "valueForKey:", v4, v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItem editingContext](self, "editingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareWithInvocationTarget:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v5, v4);

}

- (void)willAccessValueForKey:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isEqual:", CFSTR("data")))
  {
    if (-[VSKeychainItem hasFaultForData](self, "hasFaultForData"))
    {
      -[VSKeychainItem editingContext](self, "editingContext");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fulfillFault:", self);

    }
  }
}

- (NSData)data
{
  void *v3;

  -[VSKeychainItem willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("data"));
  -[VSKeychainItem primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItem didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("data"));
  return (NSData *)v3;
}

- (void)setData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VSKeychainItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("data"));
  -[VSKeychainItem setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("data"));
  -[VSKeychainItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("data"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  void *v25;
  id v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VSKeychainItem itemKind](self, "itemKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v4;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "secItemAttributeKey");
        -[VSKeychainItem primitiveValues](self, "primitiveValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[VSKeychainItem committedValues](self, "committedValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@) = %@(%@)"), v11, v13, v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v18);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  v19 = (void *)MEMORY[0x1E0CB3940];
  v27.receiver = self;
  v27.super_class = (Class)VSKeychainItem;
  -[VSKeychainItem description](&v27, sel_description);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@ %@>"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (VSKeychainEditingContext)editingContext
{
  return (VSKeychainEditingContext *)objc_loadWeakRetained((id *)&self->_editingContext);
}

- (void)setEditingContext:(id)a3
{
  objc_storeWeak((id *)&self->_editingContext, a3);
}

- (VSKeychainItemKind)itemKind
{
  return self->_itemKind;
}

- (BOOL)isInserted
{
  return self->_inserted;
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSMutableDictionary)committedValues
{
  return self->_committedValues;
}

- (void)setCommittedValues:(id)a3
{
  objc_storeStrong((id *)&self->_committedValues, a3);
}

- (NSMutableDictionary)primitiveValues
{
  return self->_primitiveValues;
}

- (BOOL)hasFaultForData
{
  return self->_hasFaultForData;
}

- (void)setHasFaultForData:(BOOL)a3
{
  self->_hasFaultForData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitiveValues, 0);
  objc_storeStrong((id *)&self->_committedValues, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_destroyWeak((id *)&self->_editingContext);
}

@end
