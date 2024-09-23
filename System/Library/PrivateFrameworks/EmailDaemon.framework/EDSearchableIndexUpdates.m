@implementation EDSearchableIndexUpdates

- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3 removedIdentifiers:(id)a4 removedDomainIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDSearchableIndexUpdates *v11;
  EDIndexedItems *v12;
  EDIndexedItems *indexedItems;
  uint64_t v14;
  NSArray *removedIdentifiers;
  uint64_t v16;
  NSArray *removedDomainIdentifiers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDSearchableIndexUpdates;
  v11 = -[EDSearchableIndexUpdates init](&v19, sel_init);
  if (v11)
  {
    v12 = -[EDIndexedItems initWithIndexedItems:]([EDIndexedItems alloc], "initWithIndexedItems:", v8);
    indexedItems = v11->_indexedItems;
    v11->_indexedItems = v12;

    v14 = objc_msgSend(v9, "copy");
    removedIdentifiers = v11->_removedIdentifiers;
    v11->_removedIdentifiers = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    removedDomainIdentifiers = v11->_removedDomainIdentifiers;
    v11->_removedDomainIdentifiers = (NSArray *)v16;

  }
  return v11;
}

- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3
{
  return -[EDSearchableIndexUpdates initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:](self, "initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (EDSearchableIndexUpdates)initWithRemovedIdentifiers:(id)a3
{
  return -[EDSearchableIndexUpdates initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:](self, "initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:", MEMORY[0x1E0C9AA60], a3, MEMORY[0x1E0C9AA60]);
}

- (EDSearchableIndexUpdates)initWithRemovedDomainIdentifiers:(id)a3
{
  return -[EDSearchableIndexUpdates initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:](self, "initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3);
}

- (BOOL)hasUpdates
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[EDSearchableIndexUpdates indexedItems](self, "indexedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[EDSearchableIndexUpdates removedIdentifiers](self, "removedIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[EDSearchableIndexUpdates removedDomainIdentifiers](self, "removedDomainIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") != 0;

    }
  }

  return v4;
}

- (NSString)ef_publicDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %lu added items, %lu removed items, %lu removed domains"), objc_opt_class(), self, -[EDIndexedItems count](self->_indexedItems, "count"), -[NSArray count](self->_removedIdentifiers, "count"), -[NSArray count](self->_removedDomainIdentifiers, "count"));
}

- (EDIndexedItems)indexedItems
{
  return self->_indexedItems;
}

- (NSArray)removedIdentifiers
{
  return self->_removedIdentifiers;
}

- (NSArray)removedDomainIdentifiers
{
  return self->_removedDomainIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedIdentifiers, 0);
  objc_storeStrong((id *)&self->_indexedItems, 0);
}

@end
