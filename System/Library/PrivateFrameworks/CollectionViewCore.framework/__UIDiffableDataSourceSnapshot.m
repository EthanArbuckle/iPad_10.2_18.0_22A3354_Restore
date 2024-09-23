@implementation __UIDiffableDataSourceSnapshot

- (__UIDiffableDataSourceSnapshot)init
{
  _UIDiffableDataSourceState *v3;
  __UIDiffableDataSourceSnapshot *v4;

  v3 = objc_alloc_init(_UIDiffableDataSourceState);
  v4 = -[__UIDiffableDataSourceSnapshot initWithState:](self, "initWithState:", v3);

  return v4;
}

- (__UIDiffableDataSourceSnapshot)initWithState:(id)a3
{
  id v4;
  __UIDiffableDataSourceSnapshot *v5;
  _UIDiffableDataSourceState *v6;
  _UIDiffableDataSourceState *state;
  NSMutableArray *v8;
  NSMutableArray *pendingSnapshotUpdates;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__UIDiffableDataSourceSnapshot;
  v5 = -[__UIDiffableDataSourceSnapshot init](&v11, sel_init);
  if (v5)
  {
    v6 = -[_UIDiffableDataSourceState initWithState:]([_UIDiffableDataSourceState alloc], "initWithState:", v4);
    state = v5->_state;
    v5->_state = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingSnapshotUpdates = v5->_pendingSnapshotUpdates;
    v5->_pendingSnapshotUpdates = v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState sections](self->_state, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState identifiers](self->_state, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: sectionCounts=%@; sections=[%p]; identifiers=[%p]>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[__UIDiffableDataSourceSnapshot state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithState:", v5);

  if (v6)
  {
    v7 = -[NSMutableArray mutableCopy](self->_pendingSnapshotUpdates, "mutableCopy");
    v8 = (void *)v6[2];
    v6[2] = v7;

  }
  return v6;
}

- (_UIDiffableDataSourceState)state
{
  return self->_state;
}

- (NSArray)pendingSnapshotUpdates
{
  return (NSArray *)self->_pendingSnapshotUpdates;
}

- (BOOL)isEqual:(id)a3
{
  __UIDiffableDataSourceSnapshot *v4;
  __UIDiffableDataSourceSnapshot *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (__UIDiffableDataSourceSnapshot *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[__UIDiffableDataSourceSnapshot numberOfItems](self, "numberOfItems");
      if (v6 == -[__UIDiffableDataSourceSnapshot numberOfItems](v5, "numberOfItems")
        && (v7 = -[__UIDiffableDataSourceSnapshot numberOfSections](self, "numberOfSections"),
            v7 == -[__UIDiffableDataSourceSnapshot numberOfSections](v5, "numberOfSections")))
      {
        -[__UIDiffableDataSourceSnapshot state](self, "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[__UIDiffableDataSourceSnapshot state](v5, "state");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dataSourceSnapshot");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataSourceSnapshot");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v12
          && (objc_msgSend(v8, "sections"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "sections"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v13, "isEqualToOrderedSet:", v14),
              v14,
              v13,
              v15))
        {
          objc_msgSend(v8, "identifiers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToOrderedSet:", v17);

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (int64_t)numberOfItems
{
  return -[_UIDiffableDataSourceState numberOfItems](self->_state, "numberOfItems");
}

- (int64_t)numberOfSections
{
  return -[_UIDiffableDataSourceState numberOfSections](self->_state, "numberOfSections");
}

- (NSArray)sectionIdentifiers
{
  return -[_UIDiffableDataSourceState sectionIdentifiers](self->_state, "sectionIdentifiers");
}

- (NSArray)itemIdentifiers
{
  return -[_UIDiffableDataSourceState itemIdentifiers](self->_state, "itemIdentifiers");
}

- (id)_identifiersForSectionsOrItems:(BOOL)a3 reconfiguredOrReloaded:(BOOL)a4
{
  int v4;
  int v5;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_pendingSnapshotUpdates;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSectionOperation", (_QWORD)v16) == v5
          && objc_msgSend(v13, "action") == 2
          && objc_msgSend(v13, "shouldReconfigure") == v4)
        {
          objc_msgSend(v13, "identifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionOrderedSet:", v14);

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSArray)reloadedSectionIdentifiers
{
  void *v2;
  void *v3;

  -[__UIDiffableDataSourceSnapshot _identifiersForSectionsOrItems:reconfiguredOrReloaded:](self, "_identifiersForSectionsOrItems:reconfiguredOrReloaded:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)reloadedItemIdentifiers
{
  void *v2;
  void *v3;

  -[__UIDiffableDataSourceSnapshot _identifiersForSectionsOrItems:reconfiguredOrReloaded:](self, "_identifiersForSectionsOrItems:reconfiguredOrReloaded:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)reconfiguredItemIdentifiers
{
  void *v2;
  void *v3;

  -[__UIDiffableDataSourceSnapshot _identifiersForSectionsOrItems:reconfiguredOrReloaded:](self, "_identifiersForSectionsOrItems:reconfiguredOrReloaded:", 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return -[_UIDiffableDataSourceState numberOfItemsInSection:](self->_state, "numberOfItemsInSection:", a3);
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState itemIdentifiersInSectionWithIdentifier:](self->_state, "itemIdentifiersInSectionWithIdentifier:", a3);
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState sectionIdentifierForSectionContainingItemIdentifier:](self->_state, "sectionIdentifierForSectionContainingItemIdentifier:", a3);
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexOfItemIdentifier:](self->_state, "indexOfItemIdentifier:", a3);
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexOfSectionIdentifier:](self->_state, "indexOfSectionIdentifier:", a3);
}

- (void)appendItemsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:](self, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", a3, 0);
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
  _UIDiffableDataSourceState *state;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _UIDiffableDataSourceUpdate *v13;

  state = self->_state;
  v8 = a4;
  v9 = a3;
  -[_UIDiffableDataSourceState dataSourceSnapshot](state, "dataSourceSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfSections");

  if (v11 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 169, CFSTR("There are currently no sections in the data source. Please add a section first."));

  }
  v13 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:appendingToDestinationSectionIdentifier:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:appendingToDestinationSectionIdentifier:", v9, v8);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v13);
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:destinationIdentifier:relativePosition:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:action:destinationIdentifier:relativePosition:", v11, 0, v7, 0);
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v8);

}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:destinationIdentifier:relativePosition:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:action:destinationIdentifier:relativePosition:", v11, 0, v7, 1);
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v8);

}

- (void)deleteItemsWithIdentifiers:(id)a3
{
  id v4;
  _UIDiffableDataSourceUpdate *v5;

  v4 = a3;
  v5 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:action:", v4, 1);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);
}

- (void)deleteAllItems
{
  id v3;

  +[_UIDiffableDataSourceUpdate updateDeleteAll](_UIDiffableDataSourceUpdate, "updateDeleteAll");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v3);

}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [_UIDiffableDataSourceUpdate alloc];
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:destinationIdentifier:relativePosition:](v8, "initWithItemIdentifiers:action:destinationIdentifier:relativePosition:", v9, 3, v6, 0);
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v10);

}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [_UIDiffableDataSourceUpdate alloc];
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:destinationIdentifier:relativePosition:](v8, "initWithItemIdentifiers:action:destinationIdentifier:relativePosition:", v9, 3, v6, 1);
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v10);

}

- (void)reloadItemsWithIdentifiers:(id)a3
{
  id v4;
  _UIDiffableDataSourceUpdate *v5;

  v4 = a3;
  v5 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:]([_UIDiffableDataSourceUpdate alloc], "initWithItemIdentifiers:action:", v4, 2);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);
}

- (void)reconfigureItemsWithIdentifiers:(id)a3
{
  id v4;
  _UIDiffableDataSourceUpdate *v5;

  v4 = a3;
  v5 = -[_UIDiffableDataSourceUpdate initWithReconfiguredItemIdentifiers:]([_UIDiffableDataSourceUpdate alloc], "initWithReconfiguredItemIdentifiers:", v4);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
  id v4;
  _UIDiffableDataSourceUpdate *v5;

  v4 = a3;
  v5 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:appendingToDestinationSectionIdentifier:]([_UIDiffableDataSourceUpdate alloc], "initWithSectionIdentifiers:appendingToDestinationSectionIdentifier:", v4, 0);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSourceUpdate *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:]([_UIDiffableDataSourceUpdate alloc], "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v7, 0, v6, 0);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v8);
}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSourceUpdate *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:]([_UIDiffableDataSourceUpdate alloc], "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v7, 0, v6, 1);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v8);
}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
  id v4;
  _UIDiffableDataSourceUpdate *v5;

  v4 = a3;
  v5 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:]([_UIDiffableDataSourceUpdate alloc], "initWithSectionIdentifiers:action:", v4, 1);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  void *v11;
  _UIDiffableDataSourceUpdate *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:](v10, "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v11, 3, v9, 0);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v12);
}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  void *v11;
  _UIDiffableDataSourceUpdate *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:](v10, "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v11, 3, v9, 1);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v12);
}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
  _UIDiffableDataSourceUpdate *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  }
  v5 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:]([_UIDiffableDataSourceUpdate alloc], "initWithSectionIdentifiers:action:", v7, 2);
  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v5);

}

- (void)appendSectionWithIdentifier:(id)a3
{
  id v5;
  _UIDiffableDataSourceUpdate *v6;
  void *v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  v6 = [_UIDiffableDataSourceUpdate alloc];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:appendingToDestinationSectionIdentifier:](v6, "initWithSectionIdentifiers:appendingToDestinationSectionIdentifier:", v7, 0);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v8);
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  void *v11;
  _UIDiffableDataSourceUpdate *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:](v10, "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v11, 0, v9, 0);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v12);
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIDiffableDataSourceUpdate *v10;
  void *v11;
  _UIDiffableDataSourceUpdate *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIDiffableDataSourceUpdate initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:](v10, "initWithSectionIdentifiers:action:destinationIdentifier:relativePosition:", v11, 0, v9, 1);

  -[__UIDiffableDataSourceSnapshot _commitUpdateAtomic:](self, "_commitUpdateAtomic:", v12);
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  return -[_UIDiffableDataSourceState sectionIdentifierForIndex:](self->_state, "sectionIdentifierForIndex:", a3);
}

- (int64_t)indexForSectionIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexForSectionIdentifier:](self->_state, "indexForSectionIdentifier:", a3);
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return -[_UIDiffableDataSourceState itemIdentifierForIndexPath:](self->_state, "itemIdentifierForIndexPath:", a3);
}

- (id)indexPathForItemIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState indexPathForItemIdentifier:](self->_state, "indexPathForItemIdentifier:", a3);
}

- (BOOL)containsItemIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState containsItemIdentifier:](self->_state, "containsItemIdentifier:", a3);
}

- (BOOL)containsSectionIdentifier:(id)a3
{
  return -[_UIDiffableDataSourceState containsSectionIdentifier:](self->_state, "containsSectionIdentifier:", a3);
}

- (void)_commitUpdateAtomic:(id)a3
{
  id v5;
  NSMutableArray *pendingSnapshotUpdates;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _UIDiffableDataSourceState *v18;
  void *v19;
  _UIDiffableDataSourceState *v20;
  _UIDiffableDataSourceState *state;
  void *v22;
  id v23;

  v5 = a3;
  pendingSnapshotUpdates = self->_pendingSnapshotUpdates;
  v23 = v5;
  if (!pendingSnapshotUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_pendingSnapshotUpdates"));

    v5 = v23;
    pendingSnapshotUpdates = self->_pendingSnapshotUpdates;
  }
  -[NSMutableArray addObject:](pendingSnapshotUpdates, "addObject:", v5);
  v7 = objc_msgSend(v23, "action");
  if (v7 == 2)
  {
    -[__UIDiffableDataSourceSnapshot _validateReloadUpdateThrowingIfNeeded:](self, "_validateReloadUpdateThrowingIfNeeded:", v23);
  }
  else
  {
    v8 = v7;
    -[_UIDiffableDataSourceState identifiers](self->_state, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    -[_UIDiffableDataSourceState sections](self->_state, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[_UIDiffableDataSourceState dataSourceSnapshot](self->_state, "dataSourceSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceSnapshotter snapshotterForSnapshot:](_UIDataSourceSnapshotter, "snapshotterForSnapshot:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v8)
    {
      case 3:
        v16 = _UIDiffableDataSourceApplyMoveUpdate(v23, v12, v10, v14, 0);
        break;
      case 1:
        v17 = _UIDiffableDataSourceApplyDeleteUpdate(v23, v12, v10, v14, 0);
        break;
      case 0:
        v15 = _UIDiffableDataSourceApplyInsertUpdate(v23, v12, v10, v14, 0);
        break;
    }
    v18 = [_UIDiffableDataSourceState alloc];
    -[_UIDiffableDataSourceState generationID](self->_state, "generationID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_UIDiffableDataSourceState initWithGenerationID:identifiers:sections:dataSourceSnapshot:](v18, "initWithGenerationID:identifiers:sections:dataSourceSnapshot:", v19, v10, v12, v14);
    state = self->_state;
    self->_state = v20;

  }
}

- (void)_validateReloadUpdateThrowingIfNeeded:(id)a3
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UIDiffableDataSourceState *state;
  void *v15;
  int v16;
  const __CFString *v17;
  const char *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "action") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("update.action == _CVCCollectionUpdateActionReload"));

  }
  v6 = objc_msgSend(v5, "isSectionOperation");
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0x1E0CB3000uLL;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        state = self->_state;
        if (v6)
        {
          if (-[_UIDiffableDataSourceState containsSectionIdentifier:](state, "containsSectionIdentifier:", v13))
            goto LABEL_14;
          objc_msgSend(*(id *)(v10 + 1160), "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "shouldReconfigure");
          v17 = CFSTR("reload");
          if (v16)
            v17 = CFSTR("reconfigure");
          v23 = v13;
          v18 = a2;
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 374, CFSTR("Attempted to %@ section identifier that does not exist in the snapshot: %@"), v17, v23);
        }
        else
        {
          if (-[_UIDiffableDataSourceState containsItemIdentifier:](state, "containsItemIdentifier:", v13))
            goto LABEL_14;
          objc_msgSend(*(id *)(v10 + 1160), "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v5, "shouldReconfigure");
          v20 = CFSTR("reload");
          if (v19)
            v20 = CFSTR("reconfigure");
          v24 = v13;
          v18 = a2;
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("__UIDiffableDataSourceSnapshot.m"), 377, CFSTR("Attempted to %@ item identifier that does not exist in the snapshot: %@"), v20, v24);
        }

        v10 = 0x1E0CB3000;
        a2 = v18;
LABEL_14:
        ++v12;
      }
      while (v9 != v12);
      v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v9 = v21;
    }
    while (v21);
  }

}

- (void)_prepareForApplyToDataSource
{
  -[_UIDiffableDataSourceState willBecomeWiredToDataSource](self->_state, "willBecomeWiredToDataSource");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSnapshotUpdates, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
