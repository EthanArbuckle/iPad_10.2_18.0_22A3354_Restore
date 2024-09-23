@implementation MPChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_updatedItemMoveFromIndexPaths, 0);
  objc_storeStrong((id *)&self->_itemUpdates, 0);
  objc_storeStrong((id *)&self->_itemMoves, 0);
  objc_storeStrong((id *)&self->_updatedSectionMoveFromIndexes, 0);
  objc_storeStrong((id *)&self->_sectionUpdates, 0);
  objc_storeStrong((id *)&self->_sectionMoves, 0);
}

+ (MPChangeDetails)changeDetailsWithPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  MPChangeDetails *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;

  v10 = a5;
  v11 = a6;
  v12 = objc_alloc((Class)a1);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke;
  v22 = &unk_1E315CE88;
  v25 = a3;
  v26 = a4;
  v23 = v10;
  v24 = v11;
  v13 = v11;
  v14 = v10;
  v15 = (void *)objc_msgSend(v12, "initWithBlock:", &v19);
  if (objc_msgSend(v15, "hasChanges", v19, v20, v21, v22))
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (MPChangeDetails)initWithBlock:(id)a3
{
  void (**v4)(id, MPChangeDetails *);
  MPChangeDetails *v5;
  NSIndexSet *v6;
  NSIndexSet *deletedSections;
  NSIndexSet *v8;
  NSIndexSet *insertedSections;
  NSArray *deletedItemIndexPaths;
  NSArray *v11;
  NSArray *insertedItemIndexPaths;
  NSMutableDictionary *v13;
  NSMutableDictionary *sectionMoves;
  NSMutableDictionary *v15;
  NSMutableDictionary *sectionUpdates;
  NSMutableIndexSet *v17;
  NSMutableIndexSet *updatedSectionMoveFromIndexes;
  NSMutableDictionary *v19;
  NSMutableDictionary *itemMoves;
  NSMutableDictionary *v21;
  NSMutableDictionary *itemUpdates;
  NSMutableSet *v23;
  NSMutableSet *updatedItemMoveFromIndexPaths;
  objc_super v26;

  v4 = (void (**)(id, MPChangeDetails *))a3;
  v26.receiver = self;
  v26.super_class = (Class)MPChangeDetails;
  v5 = -[MPChangeDetails init](&v26, sel_init);
  if (v5)
  {
    v6 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
    deletedSections = v5->_deletedSections;
    v5->_deletedSections = v6;

    v8 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
    insertedSections = v5->_insertedSections;
    v5->_insertedSections = v8;

    deletedItemIndexPaths = v5->_deletedItemIndexPaths;
    v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    v5->_deletedItemIndexPaths = (NSArray *)MEMORY[0x1E0C9AA60];

    insertedItemIndexPaths = v5->_insertedItemIndexPaths;
    v5->_insertedItemIndexPaths = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionMoves = v5->_sectionMoves;
    v5->_sectionMoves = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionUpdates = v5->_sectionUpdates;
    v5->_sectionUpdates = v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    updatedSectionMoveFromIndexes = v5->_updatedSectionMoveFromIndexes;
    v5->_updatedSectionMoveFromIndexes = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemMoves = v5->_itemMoves;
    v5->_itemMoves = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemUpdates = v5->_itemUpdates;
    v5->_itemUpdates = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedItemMoveFromIndexPaths = v5->_updatedItemMoveFromIndexPaths;
    v5->_updatedItemMoveFromIndexPaths = v23;

    v4[2](v4, v5);
    v5->_isFinalized = 1;
  }

  return v5;
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  id v13;
  _BYTE *v14;
  void (**v15)(_QWORD, _QWORD);
  unint64_t i;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  char v34[9];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v6 = MPChangeDetailOperationGenerateEx(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v33, v34, *(void **)(a1 + 32));
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v27[3] = &unk_1E315CE60;
  v8 = v5;
  v28 = v8;
  v31 = *(id *)(a1 + 32);
  v9 = v4;
  v29 = v9;
  v10 = v3;
  v30 = v10;
  v32 = *(id *)(a1 + 40);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v27);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v21[3] = &unk_1E315CE60;
  v12 = v9;
  v22 = v12;
  v25 = *(id *)(a1 + 32);
  v13 = v8;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v26 = *(id *)(a1 + 40);
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v21);
  if (v33)
  {
    for (i = 0; i < v33; ++i)
    {
      v17 = v6[i];
      v18 = v17 >> 62;
      if (v17 >> 62 == 1)
      {
        v19 = (v17 >> 31) & 0x7FFFFFFF;
        v20 = v6[i] & 0x7FFFFFFFLL;
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
            objc_msgSend(v14, "appendSectionUpdateForPreviousIndex:finalIndex:", v19, v20);
        }
        else
        {
          v15[2](v15, v19);
          v11[2](v11, v20);
        }
      }
      else if ((_DWORD)v18 == 3)
      {
        v11[2](v11, v6[i] & 0x7FFFFFFFLL);
      }
      else if ((_DWORD)v18 == 2)
      {
        v15[2](v15, (v17 >> 31) & 0x7FFFFFFF);
      }
    }
  }
  free(v6);
  v14[56] = 1;
  objc_msgSend(v14, "setInsertedSections:", v12);
  objc_msgSend(v14, "setDeletedSections:", v13);

}

- (void)setInsertedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDeletedSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasChanges
{
  return -[NSIndexSet count](self->_insertedSections, "count")
      || -[NSIndexSet count](self->_deletedSections, "count")
      || -[NSMutableDictionary count](self->_sectionUpdates, "count")
      || -[NSMutableDictionary count](self->_sectionMoves, "count")
      || -[NSArray count](self->_insertedItemIndexPaths, "count")
      || -[NSArray count](self->_deletedItemIndexPaths, "count")
      || -[NSMutableDictionary count](self->_itemUpdates, "count")
      || -[NSMutableDictionary count](self->_itemMoves, "count") != 0;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSUInteger v11;
  __CFString *v12;
  NSUInteger v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  NSUInteger v21;
  const __CFString *v22;
  NSUInteger v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_isFlatCollection)
    v7 = CFSTR("index");
  else
    v7 = CFSTR("section");
  v8 = v7;
  if (self->_isFlatCollection)
    v9 = CFSTR("indexes");
  else
    v9 = CFSTR("sections");
  v10 = v9;
  v11 = -[NSIndexSet count](self->_insertedSections, "count");
  if (v11)
  {
    if (v11 == 1)
      v12 = v8;
    else
      v12 = v10;
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu inserted %@"), v11, v12);
  }
  v13 = -[NSIndexSet count](self->_deletedSections, "count");
  if (v13)
  {
    if (v13 == 1)
      v14 = v8;
    else
      v14 = v10;
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu deleted %@"), v13, v14);
  }
  v15 = -[NSMutableDictionary count](self->_sectionUpdates, "count");
  if (v15)
  {
    if (v15 == 1)
      v16 = v8;
    else
      v16 = v10;
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu updated %@"), v15, v16);
  }
  v17 = -[NSMutableDictionary count](self->_sectionMoves, "count");
  if (v17)
  {
    if (v17 == 1)
      v18 = v8;
    else
      v18 = v10;
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu moved %@"), v17, v18);
  }
  v19 = -[NSMutableIndexSet count](self->_updatedSectionMoveFromIndexes, "count");
  if (v19)
  {
    if (v19 == 1)
      v20 = v8;
    else
      v20 = v10;
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu updated moves %@"), v19, v20);
  }
  v21 = -[NSArray count](self->_insertedItemIndexPaths, "count");
  if (v21)
  {
    if (v21 == 1)
      v22 = CFSTR("item");
    else
      v22 = CFSTR("items");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu inserted %@"), v21, v22);
  }
  v23 = -[NSArray count](self->_deletedItemIndexPaths, "count");
  if (v23)
  {
    if (v23 == 1)
      v24 = CFSTR("item");
    else
      v24 = CFSTR("items");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu deleted %@"), v23, v24);
  }
  v25 = -[NSMutableDictionary count](self->_itemUpdates, "count");
  if (v25)
  {
    if (v25 == 1)
      v26 = CFSTR("item");
    else
      v26 = CFSTR("items");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu updated %@"), v25, v26);
  }
  v27 = -[NSMutableDictionary count](self->_itemMoves, "count");
  if (v27)
  {
    if (v27 == 1)
      v28 = CFSTR("item");
    else
      v28 = CFSTR("items");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu moved %@"), v27, v28);
  }
  v29 = -[NSMutableSet count](self->_updatedItemMoveFromIndexPaths, "count");
  if (v29)
  {
    if (v29 == 1)
      v30 = CFSTR("item");
    else
      v30 = CFSTR("items");
    objc_msgSend(v6, "appendFormat:", CFSTR("; %lu updated moves %@"), v29, v30);
  }
  if (!-[MPChangeDetails hasChanges](self, "hasChanges"))
    objc_msgSend(v6, "appendString:", CFSTR("; none [UNNECESSARY]"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_isFlatCollection)
    v7 = CFSTR("index");
  else
    v7 = CFSTR("section");
  v8 = v7;
  if (self->_isFlatCollection)
    v9 = CFSTR("indexes");
  else
    v9 = CFSTR("sections");
  v10 = v9;
  if (-[NSIndexSet count](self->_insertedSections, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; inserted %@ %@"), v10, self->_insertedSections);
  if (-[NSIndexSet count](self->_deletedSections, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; deleted %@ %@"), v10, self->_deletedSections);
  if (-[NSMutableDictionary count](self->_sectionUpdates, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; updated %@ %@"), v10, self->_sectionUpdates);
  if (-[NSMutableDictionary count](self->_sectionMoves, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; %@ moves %@"), v8, self->_sectionMoves);
  if (-[NSMutableIndexSet count](self->_updatedSectionMoveFromIndexes, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; %@ updated moves %@"), v8, self->_updatedSectionMoveFromIndexes);
  if (-[NSArray count](self->_insertedItemIndexPaths, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; inserted items %@"), self->_insertedItemIndexPaths);
  if (-[NSArray count](self->_deletedItemIndexPaths, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; deleted items %@"), self->_deletedItemIndexPaths);
  if (-[NSMutableDictionary count](self->_itemUpdates, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; updated items %@"), self->_itemUpdates);
  if (-[NSMutableDictionary count](self->_itemMoves, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; item moves %@"), self->_itemMoves);
  if (-[NSMutableSet count](self->_updatedItemMoveFromIndexPaths, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; updated item moves %@"), self->_updatedItemMoveFromIndexPaths);
  if (!-[MPChangeDetails hasChanges](self, "hasChanges"))
    objc_msgSend(v6, "appendString:", CFSTR("; none [UNNECESSARY]"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (void)setUpdatedSections:(id)a3
{
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a3;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 267, CFSTR("Attempt to mutate immutable change details"));

  }
  -[NSMutableDictionary removeAllObjects](self->_sectionUpdates, "removeAllObjects", v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__MPChangeDetails_setUpdatedSections___block_invoke;
  v8[3] = &unk_1E315DBB0;
  v8[4] = self;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

}

- (NSIndexSet)updatedSections
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__MPChangeDetails_updatedSections__block_invoke;
  v7[3] = &unk_1E315CEB0;
  v8 = v3;
  v4 = v3;
  -[MPChangeDetails enumerateSectionUpdatesUsingBlock:](self, "enumerateSectionUpdatesUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSIndexSet *)v5;
}

- (void)setUpdatedItemIndexPaths:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 287, CFSTR("Attempt to mutate immutable change details"));

  }
  -[NSMutableDictionary removeAllObjects](self->_itemUpdates, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary setObject:forKey:](self->_itemUpdates, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (NSArray)updatedItemIndexPaths
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_itemUpdates, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MPChangeDetails_updatedItemIndexPaths__block_invoke;
  v7[3] = &unk_1E315CED8;
  v8 = v3;
  v4 = v3;
  -[MPChangeDetails enumerateItemUpdatesUsingBlock:](self, "enumerateItemUpdatesUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (void)appendSectionMoveFromIndex:(int64_t)a3 toIndex:(int64_t)a4 updated:(BOOL)a5
{
  _BOOL4 v5;
  NSMutableDictionary *sectionMoves;
  void *v10;
  void *v11;
  void *v13;

  v5 = a5;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 306, CFSTR("Attempt to mutate immutable change details"));

  }
  sectionMoves = self->_sectionMoves;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sectionMoves, "setObject:forKey:", v10, v11);

  if (v5)
    -[NSMutableIndexSet addIndex:](self->_updatedSectionMoveFromIndexes, "addIndex:", a3);
}

- (void)removeSectionMoveFromIndex:(int64_t)a3
{
  NSMutableDictionary *sectionMoves;
  void *v6;
  void *v8;

  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 314, CFSTR("Attempt to mutate immutable change details"));

  }
  sectionMoves = self->_sectionMoves;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](sectionMoves, "removeObjectForKey:", v6);

  -[NSMutableIndexSet removeIndex:](self->_updatedSectionMoveFromIndexes, "removeIndex:", a3);
}

- (void)enumerateSectionMovesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MPChangeDetails_enumerateSectionMovesWithBlock___block_invoke;
  v6[3] = &unk_1E315CF00;
  v7 = v4;
  v5 = v4;
  -[MPChangeDetails enumerateSectionMovesUsingBlock:](self, "enumerateSectionMovesUsingBlock:", v6);

}

- (void)enumerateSectionMovesUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_sectionMoves, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MPChangeDetails_enumerateSectionMovesUsingBlock___block_invoke;
  v7[3] = &unk_1E315CF28;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)appendSectionUpdateForPreviousIndex:(int64_t)a3 finalIndex:(int64_t)a4
{
  NSMutableDictionary *sectionUpdates;
  void *v8;
  void *v10;
  id v11;

  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 335, CFSTR("Attempt to mutate immutable change details"));

  }
  sectionUpdates = self->_sectionUpdates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sectionUpdates, "setObject:forKey:", v11, v8);

}

- (void)removeSectionUpdateForPreviousIndex:(int64_t)a3
{
  NSMutableDictionary *sectionUpdates;
  void *v7;
  id v8;

  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 340, CFSTR("Attempt to mutate immutable change details"));

  }
  sectionUpdates = self->_sectionUpdates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](sectionUpdates, "removeObjectForKey:", v8);

}

- (void)enumerateSectionUpdatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_sectionUpdates, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MPChangeDetails_enumerateSectionUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E315CF50;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)appendItemMoveFromIndexPath:(id)a3 toIndexPath:(id)a4 updated:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v9 = a4;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 352, CFSTR("Attempt to mutate immutable change details"));

  }
  -[NSMutableDictionary setObject:forKey:](self->_itemMoves, "setObject:forKey:", v9, v11);
  if (v5)
    -[NSMutableSet addObject:](self->_updatedItemMoveFromIndexPaths, "addObject:", v11);

}

- (void)removeItemMoveFromIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 360, CFSTR("Attempt to mutate immutable change details"));

    v5 = v7;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_itemMoves, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_updatedItemMoveFromIndexPaths, "removeObject:", v7);

}

- (void)enumerateItemMovesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MPChangeDetails_enumerateItemMovesWithBlock___block_invoke;
  v6[3] = &unk_1E315CF78;
  v7 = v4;
  v5 = v4;
  -[MPChangeDetails enumerateItemMovesUsingBlock:](self, "enumerateItemMovesUsingBlock:", v6);

}

- (void)enumerateItemMovesUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_itemMoves, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MPChangeDetails_enumerateItemMovesUsingBlock___block_invoke;
  v7[3] = &unk_1E315CFA0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)appendItemUpdateForPreviousIndexPath:(id)a3 finalIndexPath:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 380, CFSTR("Attempt to mutate immutable change details"));

  }
  -[NSMutableDictionary setObject:forKey:](self->_itemUpdates, "setObject:forKey:", v7, v9);

}

- (void)removeItemUpdateForPreviousIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 385, CFSTR("Attempt to mutate immutable change details"));

    v5 = v7;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_itemUpdates, "removeObjectForKey:", v5);

}

- (void)enumerateItemUpdatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_itemUpdates, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__MPChangeDetails_enumerateItemUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E315CFC8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MPChangeDetails_enumerateMovesWithBlock___block_invoke;
  v6[3] = &unk_1E315CF00;
  v7 = v4;
  v5 = v4;
  -[MPChangeDetails enumerateSectionMovesUsingBlock:](self, "enumerateSectionMovesUsingBlock:", v6);

}

- (void)applyUIKitWorkarounds
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *deletedItemIndexPaths;
  NSArray *v15;
  NSArray *insertedItemIndexPaths;
  NSArray *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  MPChangeDetails *v24;
  NSArray *v25;
  NSArray *v26;
  _QWORD v27[5];
  NSArray *v28;
  NSArray *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;

  if (self->_isFinalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 427, CFSTR("Attempt to mutate immutable change details"));

  }
  v3 = (void *)-[NSIndexSet mutableCopy](self->_deletedSections, "mutableCopy");
  v4 = (void *)-[NSIndexSet mutableCopy](self->_insertedSections, "mutableCopy");
  v5 = (void *)-[NSMutableDictionary copy](self->_sectionMoves, "copy");
  v6 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke;
  v33[3] = &unk_1E315CFF0;
  v33[4] = self;
  v7 = v3;
  v34 = v7;
  v8 = v4;
  v35 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v33);
  -[NSMutableIndexSet removeAllIndexes](self->_updatedSectionMoveFromIndexes, "removeAllIndexes");
  if (-[NSMutableDictionary count](self->_sectionMoves, "count"))
  {
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_2;
    v30[3] = &unk_1E315D068;
    v30[4] = self;
    v31 = v7;
    v32 = v8;
    -[MPChangeDetails enumerateSectionUpdatesUsingBlock:](self, "enumerateSectionUpdatesUsingBlock:", v30);
    -[NSMutableDictionary removeAllObjects](self->_sectionUpdates, "removeAllObjects");

  }
  objc_storeStrong((id *)&self->_deletedSections, v3);
  objc_storeStrong((id *)&self->_insertedSections, v4);
  v9 = (void *)-[NSArray mutableCopy](self->_deletedItemIndexPaths, "mutableCopy");
  v10 = (void *)-[NSArray mutableCopy](self->_insertedItemIndexPaths, "mutableCopy");
  v11 = (void *)-[NSMutableDictionary copy](self->_itemMoves, "copy");
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_6;
  v27[3] = &unk_1E315D090;
  v27[4] = self;
  v12 = v9;
  v28 = v12;
  v13 = v10;
  v29 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v27);
  -[NSMutableSet removeAllObjects](self->_updatedItemMoveFromIndexPaths, "removeAllObjects");
  if (-[NSMutableDictionary count](self->_itemMoves, "count"))
  {
    v20 = v6;
    v21 = 3221225472;
    v22 = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_7;
    v23 = &unk_1E315D0E0;
    v24 = self;
    v25 = v12;
    v26 = v13;
    -[MPChangeDetails enumerateItemUpdatesUsingBlock:](self, "enumerateItemUpdatesUsingBlock:", &v20);
    -[NSMutableDictionary removeAllObjects](self->_itemUpdates, "removeAllObjects", v20, v21, v22, v23, v24);

  }
  deletedItemIndexPaths = self->_deletedItemIndexPaths;
  self->_deletedItemIndexPaths = v12;
  v15 = v12;

  insertedItemIndexPaths = self->_insertedItemIndexPaths;
  self->_insertedItemIndexPaths = v13;
  v17 = v13;

}

- (BOOL)isValidForPreviousCount:(int64_t)a3 finalCount:(int64_t)a4 reason:(id *)a5
{
  void *v9;
  BOOL v10;
  void *v13;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (!self->_isFlatCollection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPChangeDetails.m"), 518, CFSTR("-isValidForPreviousCount:finalCount:reason: can only be used with a flat collection change details"));

  }
  if (-[NSIndexSet count](self->_deletedSections, "count")
    && -[NSIndexSet lastIndex](self->_deletedSections, "lastIndex") >= a3)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[INVALID CHANGE DETAILS] deletedSections.lastIndex out of bounds: %ld/%ld"), -[NSIndexSet lastIndex](self->_deletedSections, "lastIndex"), a3);
LABEL_15:
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  if (-[NSIndexSet count](self->_insertedSections, "count")
    && -[NSIndexSet lastIndex](self->_insertedSections, "lastIndex") >= a4)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[INVALID CHANGE DETAILS] insertedSections.lastIndex out of bounds: %ld/%ld"), -[NSIndexSet lastIndex](self->_insertedSections, "lastIndex"), a4);
      goto LABEL_15;
    }
    return 0;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__34138;
  v19 = __Block_byref_object_dispose__34139;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__MPChangeDetails_isValidForPreviousCount_finalCount_reason___block_invoke;
  v14[3] = &unk_1E315D108;
  v14[4] = &v21;
  v14[5] = &v15;
  v14[6] = a3;
  v14[7] = a4;
  -[MPChangeDetails enumerateSectionMovesUsingBlock:](self, "enumerateSectionMovesUsingBlock:", v14);
  if (a5)
  {
    v9 = (void *)v16[5];
    if (v9)
      *a5 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (NSIndexSet)insertedSections
{
  return self->_insertedSections;
}

- (NSIndexSet)deletedSections
{
  return self->_deletedSections;
}

- (NSArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (void)setInsertedItemIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)deletedItemIndexPaths
{
  return self->_deletedItemIndexPaths;
}

- (void)setDeletedItemIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

void __61__MPChangeDetails_isValidForPreviousCount_finalCount_reason___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v5 = a1[6];
    if (v5 <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[INVALID CHANGE DETAILS] move.fromIndex out of bounds: %ld/%ld"), a2, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1[5] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    }
    v9 = a1[7];
    if (v9 <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[INVALID CHANGE DETAILS] move.toIndex out of bounds: %ld/%ld"), a3, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[5] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    }
  }
}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  result = objc_msgSend(*((id *)a1[4] + 3), "containsIndex:", v6);
  if ((_DWORD)result)
  {
    objc_msgSend(a1[4], "removeSectionMoveFromIndex:", v6);
    objc_msgSend(a1[5], "addIndex:", v6);
    return objc_msgSend(a1[6], "addIndex:", v7);
  }
  return result;
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_3;
  v10[3] = &unk_1E315D018;
  v10[4] = &v11;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_4;
  v9[3] = &unk_1E315D018;
  v9[4] = &v11;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v9);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_5;
  v8[3] = &unk_1E315D040;
  v8[4] = &v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2);
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", v12[3]);
  _Block_object_dispose(&v11, 8);
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*((id *)a1[4] + 6), "containsObject:", v6))
  {
    objc_msgSend(a1[4], "removeItemMoveFromIndexPath:", v6);
    objc_msgSend(a1[5], "addObject:", v6);
    objc_msgSend(a1[6], "addObject:", v5);
  }

}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  uint64_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v44 = objc_msgSend(v5, "item");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "section");
        if (v12 == objc_msgSend(v5, "section"))
        {
          v13 = objc_msgSend(v11, "item");
          v14 = v42[3];
          if (v13 <= v14)
            v42[3] = v14 - 1;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v8);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "section");
        if (v20 == objc_msgSend(v5, "section"))
        {
          v21 = objc_msgSend(v19, "item");
          v22 = v42[3];
          if (v21 <= v22)
            v42[3] = v22 + 1;
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v16);
  }

  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_8;
  v30 = &unk_1E315D0B8;
  v24 = v5;
  v31 = v24;
  v32 = &v41;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", &v27);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v24, v27, v28, v29, v30);
  v25 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v42[3], objc_msgSend(v24, "section"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v26);

  _Block_object_dispose(&v41, 8);
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = objc_msgSend(v14, "section");
  if (v6 == objc_msgSend(*(id *)(a1 + 32), "section"))
  {
    v7 = objc_msgSend(v14, "item");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(_QWORD *)(v8 + 24);
    if (v7 <= v9)
      *(_QWORD *)(v8 + 24) = v9 - 1;
  }
  v10 = objc_msgSend(v5, "section");
  if (v10 == objc_msgSend(*(id *)(a1 + 32), "section"))
  {
    v11 = objc_msgSend(v5, "item");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(_QWORD *)(v12 + 24);
    if (v11 <= v13)
      *(_QWORD *)(v12 + 24) = v13 + 1;
  }

}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_3(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= a2)
    *(_QWORD *)(v2 + 24) = v3 - 1;
  return result;
}

uint64_t __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_4(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= a2)
    *(_QWORD *)(v2 + 24) = v3 + 1;
  return result;
}

void __40__MPChangeDetails_applyUIKitWorkarounds__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v6 <= v8)
    *(_QWORD *)(v7 + 24) = v8 - 1;
  v9 = objc_msgSend(v5, "integerValue");

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v9 <= v11)
    *(_QWORD *)(v10 + 24) = v11 + 1;
}

uint64_t __43__MPChangeDetails_enumerateMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__MPChangeDetails_enumerateItemUpdatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__MPChangeDetails_enumerateItemMovesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "containsObject:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __47__MPChangeDetails_enumerateItemMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__MPChangeDetails_enumerateSectionUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v6, v7);
}

uint64_t __51__MPChangeDetails_enumerateSectionMovesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsIndex:", v6);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(v5, "integerValue");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v6, v9, v7);
}

uint64_t __50__MPChangeDetails_enumerateSectionMovesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__MPChangeDetails_updatedItemIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __34__MPChangeDetails_updatedSections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

void __38__MPChangeDetails_setUpdatedSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v3, v3);

}

+ (MPChangeDetails)empty
{
  return (MPChangeDetails *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", &__block_literal_global_34243);
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v6[3] = &unk_1E315CE38;
  v5 = *(id *)(a1 + 56);
  v8 = &v10;
  v9 = a2;
  v7 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v6);
  if (v11[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    objc_msgSend(*(id *)(a1 + 48), "appendSectionMoveFromIndex:toIndex:updated:", v11[3], a2, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))());
  }

  _Block_object_dispose(&v10, 8);
}

void __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v6[3] = &unk_1E315CE38;
  v5 = *(id *)(a1 + 56);
  v8 = &v10;
  v9 = a2;
  v7 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v6);
  if (v11[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    objc_msgSend(*(id *)(a1 + 48), "appendSectionMoveFromIndex:toIndex:updated:", a2, v11[3], (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))());
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __89__MPChangeDetails_changeDetailsWithPreviousCount_finalCount_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

@end
