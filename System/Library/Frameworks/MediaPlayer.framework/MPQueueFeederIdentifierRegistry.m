@implementation MPQueueFeederIdentifierRegistry

- (id)identifierSetAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_identifierSets, "objectAtIndexedSubscript:", a3);
}

- (id)identifierSetForItem:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  void *v9;

  v5 = a3;
  v6 = -[MPQueueFeederIdentifierRegistry indexForItem:](self, "indexForItem:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeederIdentifierRegistry.m"), 175, CFSTR("Index not found for itemIdentifier: %@"), v5);

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_identifierSets, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)indexForItem:(id)a3
{
  NSMapTable *v4;
  void *v5;

  v4 = self->_index;
  v5 = NSMapGet(v4, a3);

  if (v5)
    return (int64_t)v5 - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)itemAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", a3);
}

- (int64_t)count
{
  return -[NSMutableArray count](self->_identifiers, "count");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__MPQueueFeederIdentifierRegistry_initWithCoder___block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  NSMapInsert(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 24), a2, (const void *)(a3 + 1));
}

- (MPQueueFeederIdentifierRegistry)initWithCoder:(id)a3
{
  id v4;
  MPQueueFeederIdentifierRegistry *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *identifiers;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *identifierSets;
  uint64_t v16;
  NSMapTable *index;
  NSMutableArray *v18;
  _QWORD v20[4];
  MPQueueFeederIdentifierRegistry *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPQueueFeederIdentifierRegistry;
  v5 = -[MPQueueFeederIdentifierRegistry init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("i"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("s"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifierSets = v5->_identifierSets;
    v5->_identifierSets = (NSMutableArray *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, -[NSMutableArray count](v5->_identifiers, "count"));
    index = v5->_index;
    v5->_index = (NSMapTable *)v16;

    v18 = v5->_identifiers;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__MPQueueFeederIdentifierRegistry_initWithCoder___block_invoke;
    v20[3] = &unk_1E315DB10;
    v21 = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v20);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifierSets, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (MPQueueFeederIdentifierRegistry)init
{
  MPQueueFeederIdentifierRegistry *v2;
  uint64_t v3;
  NSMutableArray *identifiers;
  uint64_t v5;
  NSMutableArray *identifierSets;
  uint64_t v7;
  NSMapTable *index;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPQueueFeederIdentifierRegistry;
  v2 = -[MPQueueFeederIdentifierRegistry init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    identifierSets = v2->_identifierSets;
    v2->_identifierSets = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 1282);
    v7 = objc_claimAutoreleasedReturnValue();
    index = v2->_index;
    v2->_index = (NSMapTable *)v7;

  }
  return v2;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> ("), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_identifiers, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_identifierSets, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "humanDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n    [%ld] %@ : %@,"), v4, v5, v7);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_identifiers, "count"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *identifiers;
  id v5;

  identifiers = self->_identifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifiers, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierSets, CFSTR("s"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MPQueueFeederIdentifierRegistry *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MPQueueFeederIdentifierRegistry);
  v5 = (void *)-[NSMutableArray mutableCopy](self->_identifiers, "mutableCopy");
  -[MPQueueFeederIdentifierRegistry setIdentifiers:](v4, "setIdentifiers:", v5);

  v6 = (void *)-[NSMutableArray mutableCopy](self->_identifierSets, "mutableCopy");
  -[MPQueueFeederIdentifierRegistry setIdentifierSets:](v4, "setIdentifierSets:", v6);

  v7 = (void *)-[NSMapTable copy](self->_index, "copy");
  -[MPQueueFeederIdentifierRegistry setIndex:](v4, "setIndex:", v7);

  return v4;
}

- (void)replaceItemAndIdentifierSet:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *key;

  v6 = a3;
  -[MPQueueFeederIdentifierRegistry itemAtIndex:](self, "itemAtIndex:", a4);
  key = (void *)objc_claimAutoreleasedReturnValue();
  MSVNanoIDCreateTaggedPointer();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_identifiers, "replaceObjectAtIndex:withObject:", a4, v7);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_identifierSets, "replaceObjectAtIndex:withObject:", a4, v6);
  NSMapRemove(self->_index, key);
  NSMapInsert(self->_index, v7, (const void *)(a4 + 1));

}

- (void)applyChanges:(id)a3 identifierSetLookupBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  NSMutableArray *identifiers;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  MPQueueFeederIdentifierRegistry *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke;
    v52[3] = &unk_1E315DB38;
    v52[4] = self;
    v40 = v7;
    v12 = v7;
    v56 = v12;
    v13 = v10;
    v53 = v13;
    v14 = v9;
    v54 = v14;
    v15 = v8;
    v55 = v15;
    objc_msgSend(v6, "enumerateMovesUsingBlock:", v52);
    v16 = objc_msgSend(v15, "firstIndex");
    v17 = objc_msgSend(v14, "firstIndex");
    if (v16 >= v17)
      v18 = v17;
    else
      v18 = v16;
    v50[0] = v11;
    v50[1] = 3221225472;
    v50[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_2;
    v50[3] = &unk_1E315DB60;
    v50[4] = self;
    v39 = v12;
    v51 = v39;
    objc_msgSend(v6, "enumerateUpdatesUsingBlock:", v50);
    objc_msgSend(v6, "deletedIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "firstIndex");

    if (v18 >= v20)
      v21 = v20;
    else
      v21 = v18;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    identifiers = self->_identifiers;
    objc_msgSend(v6, "deletedIndexes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](identifiers, "objectsAtIndexes:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          NSMapRemove(self->_index, *(const void **)(*((_QWORD *)&v46 + 1) + 8 * v28++));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v26);
    }

    objc_msgSend(v6, "deletedIndexes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addIndexes:", v29);

    -[NSMutableArray removeObjectsAtIndexes:](self->_identifiers, "removeObjectsAtIndexes:", v14);
    -[NSMutableArray removeObjectsAtIndexes:](self->_identifierSets, "removeObjectsAtIndexes:", v14);
    objc_msgSend(v6, "insertedIndexes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "firstIndex");

    if (v21 >= v31)
      v32 = v31;
    else
      v32 = v21;
    if (v32 >= 0x7FFFFFFFFFFFFFFFLL)
      v33 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v33 = v32;
    objc_msgSend(v6, "insertedIndexes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndexes:", v34);
    v35 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_3;
    v42[3] = &unk_1E315DB88;
    v43 = v13;
    v44 = self;
    v45 = v39;
    v36 = v13;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v42);
    v37 = -[NSMutableArray count](self->_identifiers, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v33, v37 - v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v35;
    v41[1] = 3221225472;
    v41[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_4;
    v41[3] = &unk_1E315DBB0;
    v41[4] = self;
    objc_msgSend(v38, "enumerateIndexesUsingBlock:", v41);

    v7 = v40;
  }

}

- (id)itemForIdentifierSet:(id)a3
{
  id v4;
  NSMutableArray *identifierSets;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  MPQueueFeederIdentifierRegistry *v11;
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
  v16 = __Block_byref_object_copy__37063;
  v17 = __Block_byref_object_dispose__37064;
  v18 = 0;
  identifierSets = self->_identifierSets;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MPQueueFeederIdentifierRegistry_itemForIdentifierSet___block_invoke;
  v9[3] = &unk_1E315DBD8;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](identifierSets, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSMutableArray)identifierSets
{
  return self->_identifierSets;
}

- (void)setIdentifierSets:(id)a3
{
  objc_storeStrong((id *)&self->_identifierSets, a3);
}

- (NSMapTable)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

void __56__MPQueueFeederIdentifierRegistry_itemForIdentifierSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a2, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "itemAtIndex:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  NSMapInsert(*(NSMapTable **)(a1 + 40), (const void *)(a3 + 1), (const void *)objc_msgSend(MEMORY[0x1E0D4D0B8], "pairWithFirst:second:", v10, v8));
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);

}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceObjectAtIndex:withObject:", a2, v4);

}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x19403A624]();
  NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)(a2 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (v5)
  {
    objc_msgSend(v5, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v8, a2);

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(v6, "second");
  }
  else
  {
    MSVNanoIDCreateTaggedPointer();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v10, a2);

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v11, a2);

  objc_autoreleasePoolPop(v4);
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSMapInsert(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 24), (const void *)objc_msgSend(*(id *)(a1 + 32), "itemAtIndex:", a2), (const void *)(a2 + 1));
}

@end
