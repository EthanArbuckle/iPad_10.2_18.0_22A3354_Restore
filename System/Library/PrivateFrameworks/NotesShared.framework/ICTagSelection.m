@implementation ICTagSelection

- (ICTagSelection)initWithManagedObjectContext:(id)a3
{
  id v4;
  ICTagSelection *v5;
  ICTagSelection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTagSelection;
  v5 = -[ICTagSelection init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v5, "commonInitWithManagedObjectContext:", v4);
    v6->_mode = 0;
    v6->_tagOperator = 1;
  }

  return v6;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4
{
  id v6;
  ICTagSelection *v7;
  ICTagSelection *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTagSelection;
  v7 = -[ICTagSelection init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v7, "commonInitWithManagedObjectContext:", v6);
    v8->_mode = a4;
    v8->_tagOperator = 1;
  }

  return v8;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4 tagOperator:(unint64_t)a5
{
  id v8;
  ICTagSelection *v9;
  ICTagSelection *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICTagSelection;
  v9 = -[ICTagSelection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v9, "commonInitWithManagedObjectContext:", v8);
    v10->_mode = a4;
    v10->_tagOperator = a5;
  }

  return v10;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4
{
  id v6;
  id v7;
  ICTagSelection *v8;
  ICTagSelection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTagSelection;
  v8 = -[ICTagSelection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v8, "commonInitWithManagedObjectContext:", v6);
    objc_storeStrong((id *)&v9->_includedObjectIDs, a4);
    v9->_tagOperator = 1;
  }

  return v9;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICTagSelection *v11;
  ICTagSelection *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICTagSelection;
  v11 = -[ICTagSelection init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v11, "commonInitWithManagedObjectContext:", v8);
    objc_storeStrong((id *)&v12->_includedObjectIDs, a4);
    objc_storeStrong((id *)&v12->_excludedObjectIDs, a5);
    v12->_tagOperator = 1;
  }

  return v12;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5 tagOperator:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  ICTagSelection *v13;
  ICTagSelection *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICTagSelection;
  v13 = -[ICTagSelection init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ICTagSelection commonInitWithManagedObjectContext:](v13, "commonInitWithManagedObjectContext:", v10);
    objc_storeStrong((id *)&v14->_includedObjectIDs, a4);
    objc_storeStrong((id *)&v14->_excludedObjectIDs, a5);
    v14->_tagOperator = a6;
  }

  return v14;
}

- (id)copyWithManagedObjectContext:(id)a3
{
  id v4;
  ICTagSelection *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[ICTagSelection initWithManagedObjectContext:mode:tagOperator:]([ICTagSelection alloc], "initWithManagedObjectContext:mode:tagOperator:", v4, -[ICTagSelection mode](self, "mode"), -[ICTagSelection tagOperator](self, "tagOperator"));

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection setIncludedObjectIDs:](v5, "setIncludedObjectIDs:", v6);

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection setExcludedObjectIDs:](v5, "setExcludedObjectIDs:", v7);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICTagSelection;
  -[ICTagSelection dealloc](&v4, sel_dealloc);
}

- (void)commonInitWithManagedObjectContext:(id)a3
{
  id v5;
  NSSet *v6;
  NSSet *includedObjectIDs;
  NSSet *v8;
  NSSet *excludedObjectIDs;
  NSSet *v10;
  NSSet *unresolvedIncludedTagIdentifiers;
  NSSet *v12;
  NSSet *unresolvedExcludedTagIdentifiers;
  id v14;

  objc_storeStrong((id *)&self->_managedObjectContext, a3);
  v5 = a3;
  self->_allowsRecentlyDeleted = 0;
  self->_automaticallyRemoveDeletedTags = 1;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  includedObjectIDs = self->_includedObjectIDs;
  self->_includedObjectIDs = v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  excludedObjectIDs = self->_excludedObjectIDs;
  self->_excludedObjectIDs = v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
  unresolvedIncludedTagIdentifiers = self->_unresolvedIncludedTagIdentifiers;
  self->_unresolvedIncludedTagIdentifiers = v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  unresolvedExcludedTagIdentifiers = self->_unresolvedExcludedTagIdentifiers;
  self->_unresolvedExcludedTagIdentifiers = v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_managedObjectContextObjectIDsDidSave_, *MEMORY[0x1E0C978A8], 0);

}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICTagSelection mode](self, "mode");
  v5 = CFSTR("Custom");
  if (v4 == 1)
    v5 = CFSTR("All Tagged");
  if (v4 == 2)
    v5 = CFSTR("All Untagged");
  v6 = v5;
  v7 = -[ICTagSelection tagOperator](self, "tagOperator");
  v8 = CFSTR("unknown");
  if (v7 == 1)
    v8 = CFSTR("all");
  if (v7 == 2)
    v8 = CFSTR("any");
  v9 = v8;
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mode: %@\noperator:%@\nincluded:%@\nexcluded:%@\nunresolvedIncluded:%@\nunresolvedExcluded:%@"), v6, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setMode:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_mode = a3;
  if (a3 - 1 >= 2)
  {
    if (!a3 && !-[ICTagSelection tagOperator](self, "tagOperator"))
      -[ICTagSelection setTagOperator:](self, "setTagOperator:", 1);
  }
  else
  {
    -[ICTagSelection setTagOperator:](self, "setTagOperator:", 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTagSelection setIncludedObjectIDs:](self, "setIncludedObjectIDs:", v4);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ICTagSelection setExcludedObjectIDs:](self, "setExcludedObjectIDs:", v5);

  }
}

+ (id)keyPathsForValuesAffectingIsNonEmpty
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isEmpty"));
}

- (BOOL)isNonEmpty
{
  return !-[ICTagSelection isEmpty](self, "isEmpty");
}

- (void)setIncludedObjectIDs:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *excludedObjectIDs;
  id v11;

  v11 = a3;
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "isEqualToSet:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_includedObjectIDs, a3);
    -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "minusSet:", v11);
    v9 = (NSSet *)objc_msgSend(v8, "copy");
    excludedObjectIDs = self->_excludedObjectIDs;
    self->_excludedObjectIDs = v9;

    if (objc_msgSend(v11, "count") && -[ICTagSelection mode](self, "mode"))
      -[ICTagSelection setMode:](self, "setMode:", 0);

  }
}

- (void)removeObjectIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[ICTagSelection removeObjectID:fromExcluded:](self, "removeObjectID:fromExcluded:", v9, 0);
        -[ICTagSelection removeObjectID:fromExcluded:](self, "removeObjectID:fromExcluded:", v9, 1);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addObjectID:(id)a3 toExcluded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (v6)
    {
      v13 = v6;
      -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v13);

      v6 = v13;
      if ((v8 & 1) == 0)
      {
        -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setByAddingObject:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTagSelection setExcludedObjectIDs:](self, "setExcludedObjectIDs:", v10);
LABEL_8:

        v6 = v13;
      }
    }
  }
  else if (v6)
  {
    v13 = v6;
    -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v13);

    v6 = v13;
    if ((v12 & 1) == 0)
    {
      -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setByAddingObject:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTagSelection setIncludedObjectIDs:](self, "setIncludedObjectIDs:", v10);
      goto LABEL_8;
    }
  }

}

- (void)removeObjectID:(id)a3 fromExcluded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (v6)
    {
      v15 = v6;
      -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v15);

      v6 = v15;
      if (v8)
      {
        -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v10, "removeObject:", v15);
        v11 = (void *)objc_msgSend(v10, "copy");
        -[ICTagSelection setExcludedObjectIDs:](self, "setExcludedObjectIDs:", v11);
LABEL_8:

        v6 = v15;
      }
    }
  }
  else if (v6)
  {
    v15 = v6;
    -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v15);

    v6 = v15;
    if (v13)
    {
      -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v10, "removeObject:", v15);
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ICTagSelection setIncludedObjectIDs:](self, "setIncludedObjectIDs:", v11);
      goto LABEL_8;
    }
  }

}

- (void)addUnresolvedTagIdentifier:(id)a3 toExcluded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v13 = v6;
    if (v4)
    {
      -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v13);

      if ((v8 & 1) == 0)
      {
        -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setByAddingObject:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTagSelection setUnresolvedExcludedTagIdentifiers:](self, "setUnresolvedExcludedTagIdentifiers:", v10);
LABEL_7:

      }
    }
    else
    {
      -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v13);

      if ((v12 & 1) == 0)
      {
        -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setByAddingObject:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTagSelection setUnresolvedIncludedTagIdentifiers:](self, "setUnresolvedIncludedTagIdentifiers:", v10);
        goto LABEL_7;
      }
    }
    -[ICTagSelection removeUnresolvedTagIdentifier:fromExcluded:](self, "removeUnresolvedTagIdentifier:fromExcluded:", v13, !v4);
    v6 = v13;
  }

}

- (void)removeUnresolvedTagIdentifier:(id)a3 fromExcluded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v15 = v6;
    if (v4)
    {
      -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v15);

      v6 = v15;
      if (v8)
      {
        -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v10, "removeObject:", v15);
        v11 = (void *)objc_msgSend(v10, "copy");
        -[ICTagSelection setUnresolvedExcludedTagIdentifiers:](self, "setUnresolvedExcludedTagIdentifiers:", v11);
LABEL_7:

        v6 = v15;
      }
    }
    else
    {
      -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v15);

      v6 = v15;
      if (v13)
      {
        -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v10, "removeObject:", v15);
        v11 = (void *)objc_msgSend(v10, "copy");
        -[ICTagSelection setUnresolvedIncludedTagIdentifiers:](self, "setUnresolvedIncludedTagIdentifiers:", v11);
        goto LABEL_7;
      }
    }
  }

}

- (void)setExcludedObjectIDs:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *includedObjectIDs;
  id v11;

  v11 = a3;
  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "isEqualToSet:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_excludedObjectIDs, a3);
    -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "minusSet:", v11);
    v9 = (NSSet *)objc_msgSend(v8, "copy");
    includedObjectIDs = self->_includedObjectIDs;
    self->_includedObjectIDs = v9;

    if (objc_msgSend(v11, "count") && -[ICTagSelection mode](self, "mode"))
      -[ICTagSelection setMode:](self, "setMode:", 0);

  }
}

- (void)removeUnresolvedTagIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[ICTagSelection removeUnresolvedTagIdentifier:fromExcluded:](self, "removeUnresolvedTagIdentifier:fromExcluded:", v9, 0);
        -[ICTagSelection removeUnresolvedTagIdentifier:fromExcluded:](self, "removeUnresolvedTagIdentifier:fromExcluded:", v9, 1);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (id)keyPathsForValuesAffectingObjectIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("includedObjectIDs"), CFSTR("excludedObjectIDs"), 0);
}

- (NSArray)tags
{
  void *v3;
  void *v4;

  -[ICTagSelection objectIDs](self, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagsForObjectIDs:](self, "hashtagsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)includedTags
{
  void *v3;
  void *v4;

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagsForObjectIDs:](self, "hashtagsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)excludedTags
{
  void *v3;
  void *v4;

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagsForObjectIDs:](self, "hashtagsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSSet)objectIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSArray)includedTagIdentifiers
{
  void *v3;
  void *v4;

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection standardizedContentsForObjectIDs:](self, "standardizedContentsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)excludedTagIdentifiers
{
  void *v3;
  void *v4;

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection standardizedContentsForObjectIDs:](self, "standardizedContentsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)tagIdentifiers
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection includedTagIdentifiers](self, "includedTagIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection excludedTagIdentifiers](self, "excludedTagIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)includedDisplayTexts
{
  void *v3;
  void *v4;

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection displayTextsForObjectIDs:](self, "displayTextsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)excludedDisplayTexts
{
  void *v3;
  void *v4;

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection displayTextsForObjectIDs:](self, "displayTextsForObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)displayTexts
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection includedDisplayTexts](self, "includedDisplayTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection excludedDisplayTexts](self, "excludedDisplayTexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)includedHashtagPrefixedDisplayTexts
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection includedDisplayTexts](self, "includedDisplayTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagPrefixedDisplayTexts:](self, "hashtagPrefixedDisplayTexts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)excludedHashtagPrefixedDisplayTexts
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection excludedDisplayTexts](self, "excludedDisplayTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagPrefixedDisplayTexts:](self, "hashtagPrefixedDisplayTexts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)hashtagPrefixedDisplayTexts
{
  void *v3;
  void *v4;

  -[ICTagSelection displayTexts](self, "displayTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection hashtagPrefixedDisplayTexts:](self, "hashtagPrefixedDisplayTexts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSSet)unresolvedTagIdentifiers
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

+ (id)keyPathsForValuesAffectingSelectedTagCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("mode"), CFSTR("includedObjectIDs"), CFSTR("excludedObjectIDs"), 0);
}

- (unint64_t)selectedTagCount
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[ICTagSelection mode](self, "mode"))
    return 1;
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count") + v5;

  return v3;
}

- (NSString)selectedTagCountString
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%lu_TAGS"), CFSTR("%lu_TAGS"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, -[ICTagSelection selectedTagCount](self, "selectedTagCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)title
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v3 = -[ICTagSelection mode](self, "mode");
  if (v3)
  {
    if (v3 != 2)
    {
      if (v3 == 1)
      {
        +[ICHashtag localizedSectionTitle](ICHashtag, "localizedSectionTitle");
        v4 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v8 = (void *)v4;
        return (NSString *)v8;
      }
      v8 = 0;
      return (NSString *)v8;
    }
    v9 = (void *)MEMORY[0x1E0D64218];
    v10 = CFSTR("Untagged");
LABEL_13:
    objc_msgSend(v9, "localizedFrameworkStringForKey:value:table:allowSiri:", v10, v10, 0, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!-[ICTagSelection selectedTagCount](self, "selectedTagCount"))
  {
    v9 = (void *)MEMORY[0x1E0D64218];
    v10 = CFSTR("Tags");
    goto LABEL_13;
  }
  if (-[ICTagSelection selectedTagCount](self, "selectedTagCount") != 1
    || (-[ICTagSelection includedObjectIDs](self, "includedObjectIDs"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 != 1))
  {
    -[ICTagSelection selectedTagCountString](self, "selectedTagCountString");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[ICTagSelection hashtagPrefixedDisplayTexts](self, "hashtagPrefixedDisplayTexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)actionTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = self;
  if (!-[ICTagSelection isEmpty](self, "isEmpty"))
  {
    v3 = objc_msgSend(v2, "mode");
    switch(v3)
    {
      case 0:
        objc_msgSend(v2, "hashtagPrefixedDisplayTexts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICFolder defaultSmartFolderTitleWithComponents:](ICFolder, "defaultSmartFolderTitleWithComponents:", v6);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSString *)v2;
      case 2:
        v4 = (void *)MEMORY[0x1E0D64218];
        v5 = CFSTR("Untagged");
        break;
      case 1:
        v4 = (void *)MEMORY[0x1E0D64218];
        v5 = CFSTR("All Tags");
        break;
      default:
        return (NSString *)v2;
    }
    objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v2;
  }
  v2 = 0;
  return (NSString *)v2;
}

- (NSString)smartFolderTitle
{
  unint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;

  if (!-[ICTagSelection isEmpty](self, "isEmpty"))
  {
    v3 = -[ICTagSelection mode](self, "mode");
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = (void *)MEMORY[0x1E0D64218];
        v5 = CFSTR("Untagged");
        goto LABEL_11;
      }
      if (v3 == 1)
      {
        v4 = (void *)MEMORY[0x1E0D64218];
        v5 = CFSTR("All Tags");
LABEL_11:
        objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        return (NSString *)v9;
      }
    }
    else if (-[ICTagSelection selectedTagCount](self, "selectedTagCount"))
    {
      -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7)
      {
        -[ICTagSelection includedDisplayTexts](self, "includedDisplayTexts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICFolder defaultSmartFolderTitleWithComponents:](ICFolder, "defaultSmartFolderTitleWithComponents:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSString *)v9;
      }
      v8 = (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Smart Folder"), CFSTR("New Smart Folder"), 0, 1);
    }
  }
  v9 = 0;
  return (NSString *)v9;
}

- (void)clear
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (-[ICTagSelection mode](self, "mode"))
    -[ICTagSelection setMode:](self, "setMode:", 0);
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTagSelection setIncludedObjectIDs:](self, "setIncludedObjectIDs:", v5);

  }
  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICTagSelection setExcludedObjectIDs:](self, "setExcludedObjectIDs:", v8);

  }
}

- (void)convertUnresolvedDisplayTextsInAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICTagSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICTagSelection_convertUnresolvedDisplayTextsInAccount___block_invoke;
  v7[3] = &unk_1E76C73B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __57__ICTagSelection_convertUnresolvedDisplayTextsInAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "unresolvedTagIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[ICHashtag hashtagWithDisplayText:account:createIfNecessary:](ICHashtag, "hashtagWithDisplayText:account:createIfNecessary:", v8, v3, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "ic_obtainPermanentObjectIDIfNecessary"))
        {
          objc_msgSend(*(id *)(a1 + 32), "unresolvedExcludedTagIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v8);

          objc_msgSend(*(id *)(a1 + 32), "removeUnresolvedTagIdentifier:fromExcluded:", v8, v11);
          v12 = *(void **)(a1 + 32);
          objc_msgSend(v9, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectID:toExcluded:", v13, v11);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_save");

}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTagSelection *v4;
  void *v5;
  ICTagSelection *v6;
  void *v7;
  void *v8;

  v4 = +[ICTagSelection allocWithZone:](ICTagSelection, "allocWithZone:", a3);
  -[ICTagSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTagSelection initWithManagedObjectContext:mode:tagOperator:](v4, "initWithManagedObjectContext:mode:tagOperator:", v5, -[ICTagSelection mode](self, "mode"), -[ICTagSelection tagOperator](self, "tagOperator"));

  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection setIncludedObjectIDs:](v6, "setIncludedObjectIDs:", v7);

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTagSelection setExcludedObjectIDs:](v6, "setExcludedObjectIDs:", v8);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ICTagSelection *v4;
  ICTagSelection *v5;
  BOOL v6;

  v4 = (ICTagSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICTagSelection isEqualToTagSelection:](self, "isEqualToTagSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICTagSelection mode](self, "mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICTagSelection tagOperator](self, "tagOperator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v9 += ICHashWithObject(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

  -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v18 += ICHashWithObject(*(void **)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

  v31 = ICHashWithHashKeys(v33, v24, v25, v26, v27, v28, v29, v30, v5);
  return v31;
}

- (int64_t)filterType
{
  return 0;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tags"), CFSTR("Tags"), 0, 1);
}

- (id)rawFilterValue
{
  unint64_t v3;

  v3 = -[ICTagSelection mode](self, "mode");
  if (v3)
  {
    if (v3 == 2)
      return CFSTR("No Tags");
    else
      return CFSTR("Any Tag");
  }
  else if (-[ICTagSelection tagOperator](self, "tagOperator") >= 2)
  {
    return CFSTR("Any Selected Tag");
  }
  else
  {
    return CFSTR("All Selected Tags");
  }
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E771AAE8);
}

- (BOOL)isEmpty
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ICTagSelection mode](self, "mode"))
    return 0;
  -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v3 = 0;
  }
  else
  {
    -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v3 = 0;
    }
    else
    {
      -[ICTagSelection unresolvedIncludedTagIdentifiers](self, "unresolvedIncludedTagIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v3 = 0;
      }
      else
      {
        -[ICTagSelection unresolvedExcludedTagIdentifiers](self, "unresolvedExcludedTagIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v7, "count") == 0;

      }
    }

  }
  return v3;
}

- (BOOL)isValid
{
  return !-[ICTagSelection isEmpty](self, "isEmpty");
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isEmpty"));
}

- (id)emptySummaryTitle
{
  void *v2;

  if (-[ICTagSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tags Filter Incomplete"), CFSTR("Tags Filter Incomplete"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  void *v2;

  if (-[ICTagSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must select at least one tag for the Tags filter."), CFSTR("You must select at least one tag for the Tags filter."), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  void *v2;

  if (-[ICTagSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tag for the Tags filter"), CFSTR("Tag for the Tags filter"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)tagSelectionWithData:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = a3;
    v20 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v20;
    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ICTagSelection tagSelectionWithData:managedObjectContext:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

      v7 = 0;
    }
    else
    {
      objc_msgSend(v10, "setManagedObjectContext:", v6);
      objc_msgSend(v10, "resolveManagedObjectsFromURLs");
      v7 = v10;
    }

  }
  return v7;
}

- (NSData)dataRepresentation
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ICTagSelection dataRepresentation].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return (NSData *)v2;
}

- (void)managedObjectContextObjectIDsDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICTagSelection *v13;

  v4 = a3;
  if (-[ICTagSelection automaticallyRemoveDeletedTags](self, "automaticallyRemoveDeletedTags"))
  {
    -[ICTagSelection objectIDs](self, "objectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "intersectSet:", v8);
    -[ICTagSelection managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke;
    v11[3] = &unk_1E76C73B0;
    v12 = v6;
    v13 = self;
    v10 = v6;
    objc_msgSend(v9, "performBlock:", v11);

  }
}

void __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke_2;
  v4[3] = &unk_1E76C9F00;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "ic_objectsPassingTest:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeObjectIDs:", v3);

}

uint64_t __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isDeleted") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "markedForDeletion");

  return v6;
}

- (BOOL)isEqualToTagSelection:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = -[ICTagSelection mode](self, "mode");
  if (v5 == objc_msgSend(v4, "mode")
    && (v6 = -[ICTagSelection tagOperator](self, "tagOperator"), v6 == objc_msgSend(v4, "tagOperator")))
  {
    -[ICTagSelection includedObjectIDs](self, "includedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "includedObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToSet:", v8))
    {
      -[ICTagSelection excludedObjectIDs](self, "excludedObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "excludedObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToSet:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)standardizedContentsForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  ICTagSelection *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  -[ICTagSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke;
  v9[3] = &unk_1E76C8358;
  v12 = &v13;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  objc_msgSend((id)v14[5], "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E76C9F28;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "ic_compactMap:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "ic_isHashtagType"))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_existingObjectWithID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "standardizedContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)displayTextsForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  ICTagSelection *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  -[ICTagSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__ICTagSelection_displayTextsForObjectIDs___block_invoke;
  v9[3] = &unk_1E76C8358;
  v12 = &v13;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  objc_msgSend((id)v14[5], "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __43__ICTagSelection_displayTextsForObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__ICTagSelection_displayTextsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E76C9F28;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "ic_compactMap:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __43__ICTagSelection_displayTextsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "ic_isHashtagType"))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_existingObjectWithID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hashtagPrefixedDisplayTexts:(id)a3
{
  return (id)objc_msgSend(a3, "ic_map:", &__block_literal_global_24);
}

uint64_t __46__ICTagSelection_hashtagPrefixedDisplayTexts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_withHashtagPrefix");
}

- (id)hashtagsForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  ICTagSelection *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  v23 = 0;
  -[ICTagSelection managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke;
  v14[3] = &unk_1E76C8358;
  v17 = &v18;
  v7 = v4;
  v15 = v7;
  v16 = self;
  objc_msgSend(v5, "performBlockAndWait:", v14);

  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend((id)v19[5], "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_3;
  v13[3] = &unk_1E76C9FE0;
  v13[4] = self;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __39__ICTagSelection_hashtagsForObjectIDs___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E76C9F90;
  v2 = (void *)a1[4];
  v6[4] = a1[5];
  objc_msgSend(v2, "ic_compactMap:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a2;
  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__18;
  v30 = __Block_byref_object_dispose__18;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_4;
  v15 = &unk_1E76C9FB8;
  v18 = &v26;
  v8 = v5;
  v16 = v8;
  v19 = &v20;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v7, "performBlockAndWait:", &v12);

  v10 = objc_msgSend((id)v27[5], "localizedCaseInsensitiveCompare:", v21[5], v12, v13, v14, v15);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "standardizedContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 40), "standardizedContent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)resolveManagedObjectsFromURLs
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICTagSelection::resolveManagedObjectsFromURLs: managedObjectContext is nil", v1, 2u);
}

id __47__ICTagSelection_resolveManagedObjectsFromURLs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_objectIDFromURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t mode;
  void *v9;
  unint64_t tagOperator;
  void *v11;
  _BOOL8 allowsRecentlyDeleted;
  void *v13;
  _BOOL8 automaticallyRemoveDeletedTags;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSSet *unresolvedIncludedTagIdentifiers;
  void *v24;
  NSSet *unresolvedExcludedTagIdentifiers;
  void *v26;
  id v27;

  v4 = a3;
  -[ICFilterTypeSelection accountObjectID](self, "accountObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URIRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountObjectIDURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v7);

  mode = self->_mode;
  NSStringFromSelector(sel_mode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", mode, v9);

  tagOperator = self->_tagOperator;
  NSStringFromSelector(sel_tagOperator);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", tagOperator, v11);

  allowsRecentlyDeleted = self->_allowsRecentlyDeleted;
  NSStringFromSelector(sel_allowsRecentlyDeleted);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", allowsRecentlyDeleted, v13);

  automaticallyRemoveDeletedTags = self->_automaticallyRemoveDeletedTags;
  NSStringFromSelector(sel_automaticallyRemoveDeletedTags);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", automaticallyRemoveDeletedTags, v15);

  -[NSSet ic_map:](self->_includedObjectIDs, "ic_map:", &__block_literal_global_98);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_includedObjectIDURLs);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v16);

  -[NSSet ic_map:](self->_excludedObjectIDs, "ic_map:", &__block_literal_global_101);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_excludedObjectIDURLs);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  v19 = (void *)MEMORY[0x1E0C99E60];
  -[NSArray ic_map:](self->_tags, "ic_map:", &__block_literal_global_105);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_hashtagObjectIDURLs);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  unresolvedIncludedTagIdentifiers = self->_unresolvedIncludedTagIdentifiers;
  NSStringFromSelector(sel_unresolvedIncludedTagIdentifiers);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", unresolvedIncludedTagIdentifiers, v24);

  unresolvedExcludedTagIdentifiers = self->_unresolvedExcludedTagIdentifiers;
  NSStringFromSelector(sel_unresolvedExcludedTagIdentifiers);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", unresolvedExcludedTagIdentifiers, v26);

}

uint64_t __34__ICTagSelection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URIRepresentation");
}

uint64_t __34__ICTagSelection_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URIRepresentation");
}

id __34__ICTagSelection_encodeWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTagSelection)initWithCoder:(id)a3
{
  id v4;
  ICTagSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSURL *accountObjectIDURL;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSSet *includedObjectIDURLs;
  void *v23;
  uint64_t v24;
  NSSet *excludedObjectIDURLs;
  void *v26;
  uint64_t v27;
  NSSet *hashtagObjectIDURLs;
  void *v29;
  uint64_t v30;
  NSSet *unresolvedIncludedTagIdentifiers;
  void *v32;
  uint64_t v33;
  NSSet *unresolvedExcludedTagIdentifiers;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICTagSelection initWithManagedObjectContext:](self, "initWithManagedObjectContext:", 0);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    NSStringFromSelector(sel_accountObjectIDURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    accountObjectIDURL = v5->_accountObjectIDURL;
    v5->_accountObjectIDURL = (NSURL *)v14;

    NSStringFromSelector(sel_mode);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    NSStringFromSelector(sel_tagOperator);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tagOperator = objc_msgSend(v4, "decodeIntegerForKey:", v17);

    NSStringFromSelector(sel_allowsRecentlyDeleted);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsRecentlyDeleted = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_automaticallyRemoveDeletedTags);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_automaticallyRemoveDeletedTags = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_includedObjectIDURLs);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    includedObjectIDURLs = v5->_includedObjectIDURLs;
    v5->_includedObjectIDURLs = (NSSet *)v21;

    NSStringFromSelector(sel_excludedObjectIDURLs);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    excludedObjectIDURLs = v5->_excludedObjectIDURLs;
    v5->_excludedObjectIDURLs = (NSSet *)v24;

    NSStringFromSelector(sel_hashtagObjectIDURLs);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    hashtagObjectIDURLs = v5->_hashtagObjectIDURLs;
    v5->_hashtagObjectIDURLs = (NSSet *)v27;

    NSStringFromSelector(sel_unresolvedIncludedTagIdentifiers);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    unresolvedIncludedTagIdentifiers = v5->_unresolvedIncludedTagIdentifiers;
    v5->_unresolvedIncludedTagIdentifiers = (NSSet *)v30;

    NSStringFromSelector(sel_unresolvedExcludedTagIdentifiers);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    unresolvedExcludedTagIdentifiers = v5->_unresolvedExcludedTagIdentifiers;
    v5->_unresolvedExcludedTagIdentifiers = (NSSet *)v33;

  }
  return v5;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)tagOperator
{
  return self->_tagOperator;
}

- (void)setTagOperator:(unint64_t)a3
{
  self->_tagOperator = a3;
}

- (BOOL)allowsRecentlyDeleted
{
  return self->_allowsRecentlyDeleted;
}

- (void)setAllowsRecentlyDeleted:(BOOL)a3
{
  self->_allowsRecentlyDeleted = a3;
}

- (BOOL)automaticallyRemoveDeletedTags
{
  return self->_automaticallyRemoveDeletedTags;
}

- (void)setAutomaticallyRemoveDeletedTags:(BOOL)a3
{
  self->_automaticallyRemoveDeletedTags = a3;
}

- (BOOL)hasMultipleTagsSelected
{
  return self->_hasMultipleTagsSelected;
}

- (NSSet)includedObjectIDs
{
  return self->_includedObjectIDs;
}

- (NSSet)excludedObjectIDs
{
  return self->_excludedObjectIDs;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (NSSet)unresolvedIncludedTagIdentifiers
{
  return self->_unresolvedIncludedTagIdentifiers;
}

- (void)setUnresolvedIncludedTagIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_unresolvedIncludedTagIdentifiers, a3);
}

- (NSSet)unresolvedExcludedTagIdentifiers
{
  return self->_unresolvedExcludedTagIdentifiers;
}

- (void)setUnresolvedExcludedTagIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_unresolvedExcludedTagIdentifiers, a3);
}

- (NSURL)accountObjectIDURL
{
  return self->_accountObjectIDURL;
}

- (void)setAccountObjectIDURL:(id)a3
{
  objc_storeStrong((id *)&self->_accountObjectIDURL, a3);
}

- (NSSet)includedObjectIDURLs
{
  return self->_includedObjectIDURLs;
}

- (void)setIncludedObjectIDURLs:(id)a3
{
  objc_storeStrong((id *)&self->_includedObjectIDURLs, a3);
}

- (NSSet)excludedObjectIDURLs
{
  return self->_excludedObjectIDURLs;
}

- (void)setExcludedObjectIDURLs:(id)a3
{
  objc_storeStrong((id *)&self->_excludedObjectIDURLs, a3);
}

- (NSSet)hashtagObjectIDURLs
{
  return self->_hashtagObjectIDURLs;
}

- (void)setHashtagObjectIDURLs:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagObjectIDURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtagObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_excludedObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_includedObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_accountObjectIDURL, 0);
  objc_storeStrong((id *)&self->_unresolvedExcludedTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_unresolvedIncludedTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_excludedObjectIDs, 0);
  objc_storeStrong((id *)&self->_includedObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

+ (void)tagSelectionWithData:(uint64_t)a3 managedObjectContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Unarchiving tagSelection data failed with error %@", a5, a6, a7, a8, 2u);
}

- (void)dataRepresentation
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Archiving tagSelection data failed with error %@", a5, a6, a7, a8, 2u);
}

@end
