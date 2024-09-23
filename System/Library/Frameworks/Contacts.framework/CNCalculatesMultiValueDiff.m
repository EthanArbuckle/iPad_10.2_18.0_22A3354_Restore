@implementation CNCalculatesMultiValueDiff

+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
    v10 = v6;
    CNResultWithAutoreleasePool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __58__CNCalculatesMultiValueDiff_diffMultiValue_toMultiValue___block_invoke(uint64_t a1)
{
  CNCalculatesMultiValueDiff *v1;
  void *v2;

  v1 = -[CNCalculatesMultiValueDiff initWithMultiValue1:multiValue2:]([CNCalculatesMultiValueDiff alloc], "initWithMultiValue1:multiValue2:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[CNCalculatesMultiValueDiff calculateDiff](v1, "calculateDiff");
  -[CNCalculatesMultiValueDiff updates](v1, "updates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (CNCalculatesMultiValueDiff)initWithMultiValue1:(id)a3 multiValue2:(id)a4
{
  id v7;
  id v8;
  CNCalculatesMultiValueDiff *v9;
  CNCalculatesMultiValueDiff *v10;
  NSMutableArray *v11;
  NSMutableArray *updates;
  CNCalculatesMultiValueDiff *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNCalculatesMultiValueDiff;
  v9 = -[CNCalculatesMultiValueDiff init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiValue1, a3);
    objc_storeStrong((id *)&v10->_multiValue2, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updates = v10->_updates;
    v10->_updates = v11;

    v13 = v10;
  }

  return v10;
}

- (void)setupOriginalIdentifiers
{
  id v3;
  void *v4;
  NSOrderedSet *v5;
  NSOrderedSet *originalIdentifiers;
  id v7;

  -[NSArray _cn_filter:](self->_multiValue1, "_cn_filter:", &__block_literal_global_19);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_136);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSOrderedSet *)objc_msgSend(v3, "initWithArray:", v4);
  originalIdentifiers = self->_originalIdentifiers;
  self->_originalIdentifiers = v5;

}

BOOL __54__CNCalculatesMultiValueDiff_setupOriginalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "storeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setupFinalIdentifiers
{
  id v3;
  void *v4;
  NSOrderedSet *v5;
  NSOrderedSet *finalIdentifiers;
  id v7;

  -[NSArray _cn_filter:](self->_multiValue2, "_cn_filter:", &__block_literal_global_5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_136);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSOrderedSet *)objc_msgSend(v3, "initWithArray:", v4);
  finalIdentifiers = self->_finalIdentifiers;
  self->_finalIdentifiers = v5;

}

BOOL __51__CNCalculatesMultiValueDiff_setupFinalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "storeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setupRemovedIdentifiers
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *removedIdentifiers;

  v3 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", self->_originalIdentifiers);
  removedIdentifiers = self->_removedIdentifiers;
  self->_removedIdentifiers = v3;

  -[NSMutableOrderedSet minusOrderedSet:](self->_removedIdentifiers, "minusOrderedSet:", self->_finalIdentifiers);
}

- (void)setupAddedIdentifiers
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *addedIdentifiers;

  v3 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", self->_finalIdentifiers);
  addedIdentifiers = self->_addedIdentifiers;
  self->_addedIdentifiers = v3;

  -[NSMutableOrderedSet minusOrderedSet:](self->_addedIdentifiers, "minusOrderedSet:", self->_originalIdentifiers);
}

- (void)setupSameIdentifiers
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *sameIdentifiers;

  v3 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", self->_originalIdentifiers);
  sameIdentifiers = self->_sameIdentifiers;
  self->_sameIdentifiers = v3;

  -[NSMutableOrderedSet intersectOrderedSet:](self->_sameIdentifiers, "intersectOrderedSet:", self->_finalIdentifiers);
}

- (void)setupCalculatedFinalIdentifiers
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *calculatedFinalIdentifiers;

  v3 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", self->_originalIdentifiers);
  calculatedFinalIdentifiers = self->_calculatedFinalIdentifiers;
  self->_calculatedFinalIdentifiers = v3;

  -[NSMutableOrderedSet minusOrderedSet:](self->_calculatedFinalIdentifiers, "minusOrderedSet:", self->_removedIdentifiers);
  -[NSMutableOrderedSet unionOrderedSet:](self->_calculatedFinalIdentifiers, "unionOrderedSet:", self->_addedIdentifiers);
}

- (void)appendRemoveUpdates
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_removedIdentifiers;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), self->_multiValue1, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNMultiValueUpdate removeValue:](CNMultiValueUpdate, "removeValue:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_updates, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)appendAddUpdates
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_addedIdentifiers;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), self->_multiValue2, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNMultiValueUpdate addValue:](CNMultiValueUpdate, "addValue:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_updates, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)appendReplaceUpdates
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
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
  v3 = self->_sameIdentifiers;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", v8, self->_multiValue1, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", v8, self->_multiValue2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
        {
          +[CNMultiValueUpdate replaceValue:withValue:](CNMultiValueUpdate, "replaceValue:withValue:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_updates, "addObject:", v11);

        }
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)appendReorderUpdates
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  _QWORD v8[4];
  NSArray *v9;

  if ((-[NSMutableOrderedSet isEqual:](self->_calculatedFinalIdentifiers, "isEqual:", self->_finalIdentifiers) & 1) == 0)
  {
    v3 = self->_multiValue2;
    -[NSOrderedSet array](self->_finalIdentifiers, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__CNCalculatesMultiValueDiff_appendReorderUpdates__block_invoke;
    v8[3] = &unk_1E29F87B8;
    v9 = v3;
    v7 = v3;
    objc_msgSend(v4, "_cn_map:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNMultiValueUpdate reorderValues:](CNMultiValueUpdate, "reorderValues:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_updates, "addObject:", v6);

  }
}

id __50__CNCalculatesMultiValueDiff_appendReorderUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", a2, *(_QWORD *)(a1 + 32));
}

- (void)calculateDiff
{
  -[CNCalculatesMultiValueDiff setupOriginalIdentifiers](self, "setupOriginalIdentifiers");
  -[CNCalculatesMultiValueDiff setupFinalIdentifiers](self, "setupFinalIdentifiers");
  -[CNCalculatesMultiValueDiff setupAddedIdentifiers](self, "setupAddedIdentifiers");
  -[CNCalculatesMultiValueDiff setupRemovedIdentifiers](self, "setupRemovedIdentifiers");
  -[CNCalculatesMultiValueDiff setupSameIdentifiers](self, "setupSameIdentifiers");
  -[CNCalculatesMultiValueDiff setupCalculatedFinalIdentifiers](self, "setupCalculatedFinalIdentifiers");
  -[CNCalculatesMultiValueDiff appendRemoveUpdates](self, "appendRemoveUpdates");
  -[CNCalculatesMultiValueDiff appendAddUpdates](self, "appendAddUpdates");
  -[CNCalculatesMultiValueDiff appendReplaceUpdates](self, "appendReplaceUpdates");
  -[CNCalculatesMultiValueDiff appendReorderUpdates](self, "appendReorderUpdates");
}

- (id)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_calculatedFinalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sameIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalIdentifiers, 0);
  objc_storeStrong((id *)&self->_originalIdentifiers, 0);
  objc_storeStrong((id *)&self->_multiValue2, 0);
  objc_storeStrong((id *)&self->_multiValue1, 0);
}

@end
