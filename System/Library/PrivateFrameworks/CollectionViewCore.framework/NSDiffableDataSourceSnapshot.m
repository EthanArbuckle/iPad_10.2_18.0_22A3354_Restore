@implementation NSDiffableDataSourceSnapshot

- (NSDiffableDataSourceSnapshot)init
{
  return -[NSDiffableDataSourceSnapshot initWithState:](self, "initWithState:", 0);
}

- (NSDiffableDataSourceSnapshot)initWithState:(id)a3
{
  id v4;
  void *v5;
  _UIDiffableDataSourceState *v6;
  _UIDiffableDataSourceState *v7;
  __UIDiffableDataSourceSnapshot *v8;
  NSDiffableDataSourceSnapshot *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = (_UIDiffableDataSourceState *)v4;
  else
    v6 = objc_alloc_init(_UIDiffableDataSourceState);
  v7 = v6;
  v8 = -[__UIDiffableDataSourceSnapshot initWithState:]([__UIDiffableDataSourceSnapshot alloc], "initWithState:", v6);
  v9 = -[NSDiffableDataSourceSnapshot initWithImpl:](self, "initWithImpl:", v8);

  return v9;
}

- (NSDiffableDataSourceSnapshot)initWithImpl:(id)a3
{
  id v5;
  NSDiffableDataSourceSnapshot *v6;
  NSDiffableDataSourceSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSDiffableDataSourceSnapshot;
  v6 = -[NSDiffableDataSourceSnapshot init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (id)description
{
  void *v3;
  NSInteger v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id obj;
  NSDiffableDataSourceSnapshot *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSDiffableDataSourceSnapshot numberOfSections](self, "numberOfSections");
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSDiffableDataSourceSnapshot numberOfItems](self, "numberOfItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  v12 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@ %p: numberOfSections:%@ numberOfItems:%@; generation=%@; sectionCounts=%@"),
                  v7,
                  self,
                  v8,
                  v9,
                  v10,
                  v11);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "appendFormat:", CFSTR("\n[%@: {"), v17);
        -[NSDiffableDataSourceSnapshot itemIdentifiersInSectionWithIdentifier:](v25, "itemIdentifiersInSectionWithIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        if (v19 >= 1)
        {
          v20 = v19;
          for (j = 0; j != v20; ++j)
          {
            if (j)
              objc_msgSend(v12, "appendString:", CFSTR(" "));
            objc_msgSend(v18, "objectAtIndexedSubscript:", j);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendFormat:", CFSTR("%@"), v22);

          }
        }
        objc_msgSend(v12, "appendString:", CFSTR("}]"));

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(v12, "appendString:", CFSTR(">"));
  return v12;
}

- (NSInteger)numberOfItems
{
  return -[__UIDiffableDataSourceSnapshot numberOfItems](self->_impl, "numberOfItems");
}

- (NSInteger)numberOfSections
{
  return -[__UIDiffableDataSourceSnapshot numberOfSections](self->_impl, "numberOfSections");
}

- (NSArray)sectionIdentifiers
{
  return -[__UIDiffableDataSourceSnapshot sectionIdentifiers](self->_impl, "sectionIdentifiers");
}

- (NSArray)itemIdentifiers
{
  return -[__UIDiffableDataSourceSnapshot itemIdentifiers](self->_impl, "itemIdentifiers");
}

- (NSArray)reloadedSectionIdentifiers
{
  return -[__UIDiffableDataSourceSnapshot reloadedSectionIdentifiers](self->_impl, "reloadedSectionIdentifiers");
}

- (NSArray)reloadedItemIdentifiers
{
  return -[__UIDiffableDataSourceSnapshot reloadedItemIdentifiers](self->_impl, "reloadedItemIdentifiers");
}

- (NSArray)reconfiguredItemIdentifiers
{
  return -[__UIDiffableDataSourceSnapshot reconfiguredItemIdentifiers](self->_impl, "reconfiguredItemIdentifiers");
}

- (NSInteger)numberOfItemsInSection:(id)sectionIdentifier
{
  return -[__UIDiffableDataSourceSnapshot numberOfItemsInSection:](self->_impl, "numberOfItemsInSection:", sectionIdentifier);
}

- (NSArray)itemIdentifiersInSectionWithIdentifier:(id)sectionIdentifier
{
  return (NSArray *)-[__UIDiffableDataSourceSnapshot itemIdentifiersInSectionWithIdentifier:](self->_impl, "itemIdentifiersInSectionWithIdentifier:", sectionIdentifier);
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)itemIdentifier
{
  return -[__UIDiffableDataSourceSnapshot sectionIdentifierForSectionContainingItemIdentifier:](self->_impl, "sectionIdentifierForSectionContainingItemIdentifier:", itemIdentifier);
}

- (NSInteger)indexOfItemIdentifier:(id)itemIdentifier
{
  return -[__UIDiffableDataSourceSnapshot indexOfItemIdentifier:](self->_impl, "indexOfItemIdentifier:", itemIdentifier);
}

- (NSInteger)indexOfSectionIdentifier:(id)sectionIdentifier
{
  return -[__UIDiffableDataSourceSnapshot indexOfSectionIdentifier:](self->_impl, "indexOfSectionIdentifier:", sectionIdentifier);
}

- (void)appendItemsWithIdentifiers:(NSArray *)identifiers
{
  -[__UIDiffableDataSourceSnapshot appendItemsWithIdentifiers:](self->_impl, "appendItemsWithIdentifiers:", identifiers);
}

- (void)appendItemsWithIdentifiers:(NSArray *)identifiers intoSectionWithIdentifier:(id)sectionIdentifier
{
  -[__UIDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:](self->_impl, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", identifiers, sectionIdentifier);
}

- (void)insertItemsWithIdentifiers:(NSArray *)identifiers beforeItemWithIdentifier:(id)itemIdentifier
{
  -[__UIDiffableDataSourceSnapshot insertItemsWithIdentifiers:beforeItemWithIdentifier:](self->_impl, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", identifiers, itemIdentifier);
}

- (void)insertItemsWithIdentifiers:(NSArray *)identifiers afterItemWithIdentifier:(id)itemIdentifier
{
  -[__UIDiffableDataSourceSnapshot insertItemsWithIdentifiers:afterItemWithIdentifier:](self->_impl, "insertItemsWithIdentifiers:afterItemWithIdentifier:", identifiers, itemIdentifier);
}

- (void)deleteItemsWithIdentifiers:(NSArray *)identifiers
{
  -[__UIDiffableDataSourceSnapshot deleteItemsWithIdentifiers:](self->_impl, "deleteItemsWithIdentifiers:", identifiers);
}

- (void)deleteAllItems
{
  -[__UIDiffableDataSourceSnapshot deleteAllItems](self->_impl, "deleteAllItems");
}

- (void)moveItemWithIdentifier:(id)fromIdentifier beforeItemWithIdentifier:(id)toIdentifier
{
  -[__UIDiffableDataSourceSnapshot moveItemWithIdentifier:beforeItemWithIdentifier:](self->_impl, "moveItemWithIdentifier:beforeItemWithIdentifier:", fromIdentifier, toIdentifier);
}

- (void)moveItemWithIdentifier:(id)fromIdentifier afterItemWithIdentifier:(id)toIdentifier
{
  -[__UIDiffableDataSourceSnapshot moveItemWithIdentifier:afterItemWithIdentifier:](self->_impl, "moveItemWithIdentifier:afterItemWithIdentifier:", fromIdentifier, toIdentifier);
}

- (void)reloadItemsWithIdentifiers:(NSArray *)identifiers
{
  -[__UIDiffableDataSourceSnapshot reloadItemsWithIdentifiers:](self->_impl, "reloadItemsWithIdentifiers:", identifiers);
}

- (void)reconfigureItemsWithIdentifiers:(NSArray *)identifiers
{
  -[__UIDiffableDataSourceSnapshot reconfigureItemsWithIdentifiers:](self->_impl, "reconfigureItemsWithIdentifiers:", identifiers);
}

- (void)appendSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
  -[__UIDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](self->_impl, "appendSectionsWithIdentifiers:", sectionIdentifiers);
}

- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers beforeSectionWithIdentifier:(id)toSectionIdentifier
{
  -[__UIDiffableDataSourceSnapshot insertSectionsWithIdentifiers:beforeSectionWithIdentifier:](self->_impl, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", sectionIdentifiers, toSectionIdentifier);
}

- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers afterSectionWithIdentifier:(id)toSectionIdentifier
{
  -[__UIDiffableDataSourceSnapshot insertSectionsWithIdentifiers:afterSectionWithIdentifier:](self->_impl, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", sectionIdentifiers, toSectionIdentifier);
}

- (void)deleteSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
  -[__UIDiffableDataSourceSnapshot deleteSectionsWithIdentifiers:](self->_impl, "deleteSectionsWithIdentifiers:", sectionIdentifiers);
}

- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier beforeSectionWithIdentifier:(id)toSectionIdentifier
{
  -[__UIDiffableDataSourceSnapshot moveSectionWithIdentifier:beforeSectionWithIdentifier:](self->_impl, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", fromSectionIdentifier, toSectionIdentifier);
}

- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier afterSectionWithIdentifier:(id)toSectionIdentifier
{
  -[__UIDiffableDataSourceSnapshot moveSectionWithIdentifier:afterSectionWithIdentifier:](self->_impl, "moveSectionWithIdentifier:afterSectionWithIdentifier:", fromSectionIdentifier, toSectionIdentifier);
}

- (void)reloadSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
  -[__UIDiffableDataSourceSnapshot reloadSectionsWithIdentifiers:](self->_impl, "reloadSectionsWithIdentifiers:", sectionIdentifiers);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[__UIDiffableDataSourceSnapshot copy](self->_impl, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithImpl:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[__UIDiffableDataSourceSnapshot isEqual:](self->_impl, "isEqual:", v4[1]);

  return v5;
}

- (id)identifierForIndexPath:(id)a3
{
  __UIDiffableDataSourceSnapshot *impl;
  id v4;
  void *v5;
  void *v6;

  impl = self->_impl;
  v4 = a3;
  -[__UIDiffableDataSourceSnapshot state](impl, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexPathForIdentifier:(id)a3
{
  __UIDiffableDataSourceSnapshot *impl;
  id v4;
  void *v5;
  void *v6;

  impl = self->_impl;
  v4 = a3;
  -[__UIDiffableDataSourceSnapshot state](impl, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)sectionGlobalItemRangeForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeForSection:", a3);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_identifierBeforeIdentifier:(id)a3
{
  __UIDiffableDataSourceSnapshot *impl;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  impl = self->_impl;
  v5 = a3;
  -[__UIDiffableDataSourceSnapshot state](impl, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfItemIdentifier:", v5);

  v8 = v7 - 1;
  if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v11 = 0;
  }
  else
  {
    -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_identifierAfterIdentifier:(id)a3
{
  __UIDiffableDataSourceSnapshot *impl;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  impl = self->_impl;
  v5 = a3;
  -[__UIDiffableDataSourceSnapshot state](impl, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfItemIdentifier:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v8 = v7 + 1;
  -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 >= v11)
  {
LABEL_4:
    v14 = 0;
  }
  else
  {
    -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)state
{
  return -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
}

- (__UIDiffableDataSourceSnapshot)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)validateIdentifiers
{
  void *v2;
  void *v3;
  id v4;

  -[__UIDiffableDataSourceSnapshot state](self->_impl, "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "validateIdentifiers");
  }
  else
  {
    objc_msgSend(v4, "sections");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers(v2, 0);

    objc_msgSend(v4, "identifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers(v3, 1);

  }
}

@end
