@implementation ICCRTombstoneOrderedSet

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::OrderedSet *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 16)
  {
    v6 = *(CRDT::OrderedSet **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 16;
    v6 = (CRDT::OrderedSet *)operator new();
    CRDT::OrderedSet::OrderedSet(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCRTombstoneOrderedSet encodeWithICCRCoder:orderedSet:](self, "encodeWithICCRCoder:orderedSet:", v7, v6);

}

- (void)encodeWithICCRCoder:(id)a3 orderedSet:(void *)a4
{
  void *v6;
  CRDT::Array *v7;
  void *v8;
  CRDT::Dictionary *v9;
  id v10;

  v10 = a3;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a4 + 8) |= 1u;
  v7 = (CRDT::Array *)*((_QWORD *)a4 + 5);
  if (!v7)
  {
    v7 = (CRDT::Array *)operator new();
    CRDT::Array::Array(v7);
    *((_QWORD *)a4 + 5) = v7;
  }
  objc_msgSend(v6, "encodeWithICCRCoder:array:", v10, v7);

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a4 + 8) |= 2u;
  v9 = (CRDT::Dictionary *)*((_QWORD *)a4 + 6);
  if (!v9)
  {
    v9 = (CRDT::Dictionary *)operator new();
    CRDT::Dictionary::Dictionary(v9);
    *((_QWORD *)a4 + 6) = v9;
  }
  objc_msgSend(v8, "encodeWithICCRCoder:set:", v10, v9);

}

- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCRTombstoneOrderedSet *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 16)
  {
    v6 = -[ICCRTombstoneOrderedSet initWithICCRCoder:orderedSet:](self, "initWithICCRCoder:orderedSet:", v4, *(_QWORD *)(v5 + 40));
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICCRTombstoneOrderedSet initWithDocument:](self, "initWithDocument:", v7);

  }
  return v6;
}

- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3 orderedSet:(const void *)a4
{
  id v6;
  ICCRArray *v7;
  ICCRArray *v8;
  uint64_t v9;
  ICCRArray *v10;
  ICCRSet *v11;
  ICCRSet *v12;
  uint64_t v13;
  ICCRSet *v14;
  void *v15;
  ICCRTombstoneOrderedSet *v16;

  v6 = a3;
  v7 = [ICCRArray alloc];
  v8 = v7;
  v9 = *((_QWORD *)a4 + 5);
  if (!v9)
    v9 = *(_QWORD *)(CRDT::OrderedSet::default_instance((CRDT::OrderedSet *)v7) + 40);
  v10 = -[ICCRArray initWithICCRCoder:array:](v8, "initWithICCRCoder:array:", v6, v9);
  v11 = [ICCRSet alloc];
  v12 = v11;
  v13 = *((_QWORD *)a4 + 6);
  if (!v13)
    v13 = *(_QWORD *)(CRDT::OrderedSet::default_instance((CRDT::OrderedSet *)v11) + 48);
  v14 = -[ICCRSet initWithICCRCoder:set:](v12, "initWithICCRCoder:set:", v6, v13);
  objc_msgSend(v6, "document");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICCRTombstoneOrderedSet initWithOrdering:elements:document:](self, "initWithOrdering:elements:document:", v10, v14, v15);

  return v16;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (ICCRTombstoneOrderedSet)init
{
  -[ICCRTombstoneOrderedSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICCRTombstoneOrderedSet)initWithDocument:(id)a3
{
  id v4;
  ICCRArray *v5;
  ICCRSet *v6;
  ICCRTombstoneOrderedSet *v7;

  v4 = a3;
  v5 = -[ICCRArray initWithDocument:]([ICCRArray alloc], "initWithDocument:", v4);
  v6 = -[ICCRSet initWithDocument:]([ICCRSet alloc], "initWithDocument:", v4);
  v7 = -[ICCRTombstoneOrderedSet initWithOrdering:elements:document:](self, "initWithOrdering:elements:document:", v5, v6, v4);

  return v7;
}

- (ICCRTombstoneOrderedSet)initWithOrdering:(id)a3 elements:(id)a4 document:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICCRTombstoneOrderedSet *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICCRTombstoneOrderedSet;
  v11 = -[ICCRTombstoneOrderedSet init](&v13, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "setDelegate:", v11);
    -[ICCRTombstoneOrderedSet setOrdering:](v11, "setOrdering:", v8);
    -[ICCRTombstoneOrderedSet setElements:](v11, "setElements:", v9);
    -[ICCRTombstoneOrderedSet setDocument:](v11, "setDocument:", v10);
  }

  return v11;
}

- (NSMutableOrderedSet)cachedIdentifierSet
{
  NSMutableOrderedSet *cachedIdentifierSet;

  cachedIdentifierSet = self->_cachedIdentifierSet;
  if (!cachedIdentifierSet)
  {
    -[ICCRTombstoneOrderedSet regenerateNSOrderedIdentifierSetAndIndexMapping](self, "regenerateNSOrderedIdentifierSetAndIndexMapping");
    cachedIdentifierSet = self->_cachedIdentifierSet;
  }
  return cachedIdentifierSet;
}

- (NSMapTable)cachedIndexMapping
{
  NSMapTable *cachedIndexMapping;

  cachedIndexMapping = self->_cachedIndexMapping;
  if (!cachedIndexMapping)
  {
    -[ICCRTombstoneOrderedSet regenerateNSOrderedIdentifierSetAndIndexMapping](self, "regenerateNSOrderedIdentifierSetAndIndexMapping");
    cachedIndexMapping = self->_cachedIndexMapping;
  }
  return cachedIndexMapping;
}

- (void)regenerateNSOrderedIdentifierSetAndIndexMapping
{
  NSMapTable *v3;
  NSMapTable *cachedIndexMapping;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *cachedIdentifierSet;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  cachedIndexMapping = self->_cachedIndexMapping;
  self->_cachedIndexMapping = v3;

  -[ICCRTombstoneOrderedSet generateNSOrderedIdentifierSetWithIndexMapping:](self, "generateNSOrderedIdentifierSetWithIndexMapping:", self->_cachedIndexMapping);
  v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  cachedIdentifierSet = self->_cachedIdentifierSet;
  self->_cachedIdentifierSet = v5;

}

- (id)generateNSOrderedIdentifierSetWithIndexMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__ICCRTombstoneOrderedSet_generateNSOrderedIdentifierSetWithIndexMapping___block_invoke;
  v18[3] = &unk_1E76CFDC8;
  v19 = v6;
  v20 = v8;
  v21 = v4;
  v11 = v5;
  v22 = v11;
  v12 = v4;
  v13 = v8;
  v14 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);

  v15 = v22;
  v16 = v11;

  return v16;
}

void __74__ICCRTombstoneOrderedSet_generateNSOrderedIdentifierSetWithIndexMapping___block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "addIndex:", a3);
    }
    else
    {
      objc_msgSend(a1[7], "addObject:", v8);
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setObject:forKey:", v7, v5);
    }

  }
}

- (void)wipeoutCaches
{
  NSMapTable *cachedIndexMapping;
  NSMutableOrderedSet *cachedIdentifierSet;

  cachedIndexMapping = self->_cachedIndexMapping;
  self->_cachedIndexMapping = 0;

  cachedIdentifierSet = self->_cachedIdentifierSet;
  self->_cachedIdentifierSet = 0;

}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRTombstoneOrderedSet objectForIdentifier:](self, "objectForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)indexOfEqualObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "firstIndex");
    -[ICCRTombstoneOrderedSet ordering](self, "ordering");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v10);

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)identifierForObjectInCachedSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICCRTombstoneOrderedSet ordering](self, "ordering");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "firstIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsObjectEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "count") != 0;
  return (char)v4;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  void *v16;
  NSMapTable *cachedIndexMapping;
  void *v18;
  void *v19;
  NSMutableOrderedSet *cachedIdentifierSet;
  void *v21;
  NSObject *v22;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  -[ICCRTombstoneOrderedSet identifierForObjectInCachedSet:](self, "identifierForObjectInCachedSet:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[ICCRTombstoneOrderedSet count](self, "count");
    if (v8 <= a4)
    {
      if (v8 != a4)
      {
        v22 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ICCRTombstoneOrderedSet insertObject:atIndex:].cold.1(a4, v22, v24);

        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("ICCRTombstoneOrderedSet: inserting element at invalid index"), 0);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v25);
      }
      -[ICCRTombstoneOrderedSet ordering](self, "ordering");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_addObject:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      cachedIndexMapping = self->_cachedIndexMapping;
      v18 = (void *)MEMORY[0x1E0CB3788];
      -[ICCRTombstoneOrderedSet ordering](self, "ordering");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "indexSetWithIndex:", objc_msgSend(v9, "count") - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](cachedIndexMapping, "setObject:forKey:", v11, v6);
    }
    else
    {
      -[ICCRTombstoneOrderedSet objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "firstIndex");
      -[ICCRTombstoneOrderedSet ordering](self, "ordering");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_insertObject:atIndex:", v6, v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[ICCRTombstoneOrderedSet shiftCachedIndicesStartingAtIndex:by:](self, "shiftCachedIndicesStartingAtIndex:by:", v12, 1);
      v14 = self->_cachedIndexMapping;
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v15, v6);

    }
    -[ICCRTombstoneOrderedSet elements](self, "elements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v7);

    cachedIdentifierSet = self->_cachedIdentifierSet;
    if (cachedIdentifierSet)
      -[NSMutableOrderedSet insertObject:atIndex:](cachedIdentifierSet, "insertObject:atIndex:", v7, a4);
    if (-[ICCRTombstoneOrderedSet wantsUndoCommands](self, "wantsUndoCommands"))
    {
      -[ICCRTombstoneOrderedSet delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __48__ICCRTombstoneOrderedSet_insertObject_atIndex___block_invoke;
      v26[3] = &unk_1E76CFDF0;
      v7 = v7;
      v27 = v7;
      objc_msgSend(v21, "addUndoCommandsForObject:block:", self, v26);

    }
  }

}

void __48__ICCRTombstoneOrderedSet_insertObject_atIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoablyRemoveObjectIdentifiersFromElements:", v4, v5, v6);

}

- (void)undoablyRemoveObjectIdentifiersFromElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICCRTombstoneOrderedSet wipeoutCaches](self, "wipeoutCaches");
  if (-[ICCRTombstoneOrderedSet wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[ICCRTombstoneOrderedSet delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__ICCRTombstoneOrderedSet_undoablyRemoveObjectIdentifiersFromElements___block_invoke;
    v12[3] = &unk_1E76CFDF0;
    v13 = v6;
    objc_msgSend(v11, "addUndoCommandsForObject:block:", self, v12);

  }
}

uint64_t __71__ICCRTombstoneOrderedSet_undoablyRemoveObjectIdentifiersFromElements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyInsertObjectIdentifiersIntoElements:", *(_QWORD *)(a1 + 32));
}

- (void)undoablyInsertObjectIdentifiersIntoElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICCRTombstoneOrderedSet wipeoutCaches](self, "wipeoutCaches");
  if (-[ICCRTombstoneOrderedSet wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[ICCRTombstoneOrderedSet delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__ICCRTombstoneOrderedSet_undoablyInsertObjectIdentifiersIntoElements___block_invoke;
    v12[3] = &unk_1E76CFDF0;
    v13 = v6;
    objc_msgSend(v11, "addUndoCommandsForObject:block:", self, v12);

  }
}

uint64_t __71__ICCRTombstoneOrderedSet_undoablyInsertObjectIdentifiersIntoElements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyRemoveObjectIdentifiersFromElements:", *(_QWORD *)(a1 + 32));
}

- (void)shiftCachedIndicesStartingAtIndex:(unint64_t)a3 by:(int64_t)a4
{
  NSMapTable *cachedIndexMapping;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  cachedIndexMapping = self->_cachedIndexMapping;
  if (cachedIndexMapping)
  {
    -[NSMapTable objectEnumerator](cachedIndexMapping, "objectEnumerator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", a3, a4);
        objc_msgSend(v10, "nextObject");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      while (v9);
    }

  }
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  -[ICCRTombstoneOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v4, -[ICCRTombstoneOrderedSet count](self, "count"));

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSMutableOrderedSet *cachedIdentifierSet;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  -[ICCRTombstoneOrderedSet objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);
  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v9);

  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke;
  v18[3] = &unk_1E76CBCB8;
  v18[4] = self;
  v13 = v10;
  v19 = v13;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v18);
  -[NSMapTable removeObjectForKey:](self->_cachedIndexMapping, "removeObjectForKey:", v5);
  -[ICCRTombstoneOrderedSet _removeObjectsFromOrderingAtIndices:](self, "_removeObjectsFromOrderingAtIndices:", v7);
  cachedIdentifierSet = self->_cachedIdentifierSet;
  if (cachedIdentifierSet)
    -[NSMutableOrderedSet removeObjectAtIndex:](cachedIdentifierSet, "removeObjectAtIndex:", a3);
  if (-[ICCRTombstoneOrderedSet wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[ICCRTombstoneOrderedSet delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke_2;
    v16[3] = &unk_1E76CFDF0;
    v17 = v13;
    objc_msgSend(v15, "addUndoCommandsForObject:block:", self, v16);

  }
}

void __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "ordering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

uint64_t __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undoablyInsertObjectIdentifiersIntoElements:", *(_QWORD *)(a1 + 32));
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[ICCRTombstoneOrderedSet moveObjectFromIndex:toIndex:mutableSafe:](self, "moveObjectFromIndex:toIndex:mutableSafe:", a3, a4, 0);
}

- (void)safeMoveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[ICCRTombstoneOrderedSet moveObjectFromIndex:toIndex:mutableSafe:](self, "moveObjectFromIndex:toIndex:mutableSafe:", a3, a4, 1);
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 mutableSafe:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSMapTable *cachedIndexMapping;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSMutableOrderedSet *cachedIdentifierSet;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v5 = a5;
  if (-[ICCRTombstoneOrderedSet count](self, "count") < a4)
  {
    v31 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ICCRTombstoneOrderedSet moveObjectFromIndex:toIndex:mutableSafe:].cold.1(a4, v31, v32);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("ICCRTombstoneOrderedSet: moving element to an invalid index"), 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  if (a3 != a4 || !v5)
  {
    -[ICCRTombstoneOrderedSet objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a4);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[ICCRTombstoneOrderedSet objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRTombstoneOrderedSet ordering](self, "ordering");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke;
    v38[3] = &unk_1E76CBCB8;
    v17 = v14;
    v39 = v17;
    v34 = v16;
    v40 = v34;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v38);
    objc_msgSend(v17, "removeObject:", v13);
    -[NSMapTable removeObjectForKey:](self->_cachedIndexMapping, "removeObjectForKey:", v9);
    if (a3 == a4)
    {
      v18 = objc_msgSend(v11, "firstIndex");
      objc_msgSend(v11, "removeIndex:", v18);
      cachedIndexMapping = self->_cachedIndexMapping;
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](cachedIndexMapping, "setObject:forKey:", v20, v9);

    }
    -[ICCRTombstoneOrderedSet _removeObjectsFromOrderingAtIndices:](self, "_removeObjectsFromOrderingAtIndices:", v11);
    if (!v5)
    {
      -[ICCRTombstoneOrderedSet ordering](self, "ordering");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke_2;
      v36[3] = &unk_1E76CFE18;
      v37 = v22;
      v23 = v22;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v36);
      objc_msgSend(v23, "removeObjectForKey:", v13);
      objc_msgSend(v23, "setObject:forKey:", v9, v13);

    }
    if (a3 != a4)
    {
      -[ICCRTombstoneOrderedSet cachedIndexMapping](self, "cachedIndexMapping");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "firstIndex");
      if (a3 > a4)
        v27 = v26;
      else
        v27 = v26 + 1;
      if (v5)
        v28 = v17;
      else
        v28 = 0;
      -[ICCRTombstoneOrderedSet reinsertIdentifier:withMaskedIdentifiers:atIndex:forObjectToMove:](self, "reinsertIdentifier:withMaskedIdentifiers:atIndex:forObjectToMove:", v13, v28, v27, v9);

    }
    cachedIdentifierSet = self->_cachedIdentifierSet;
    if (cachedIdentifierSet)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](cachedIdentifierSet, "moveObjectsAtIndexes:toIndex:", v30, a4);

    }
  }
}

void __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

- (void)_removeObjectsFromOrderingAtIndices:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    -[ICCRTombstoneOrderedSet ordering](self, "ordering");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke;
    v15[3] = &unk_1E76CFE40;
    v7 = v5;
    v16 = v7;
    objc_msgSend(v12, "enumerateIndexesWithOptions:usingBlock:", 2, v15);
    -[NSMapTable objectEnumerator](self->_cachedIndexMapping, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke_2;
        v13[3] = &unk_1E76CFE40;
        v14 = v10;
        v11 = v10;
        objc_msgSend(v12, "enumerateIndexesWithOptions:usingBlock:", 2, v13);

        objc_msgSend(v8, "nextObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v10);
    }

  }
}

uint64_t __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", a2);
}

unint64_t __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "lastIndex");
  if (result >= a2)
    return objc_msgSend(*(id *)(a1 + 32), "shiftIndexesStartingAtIndex:by:", a2 + 1, -1);
  return result;
}

- (void)reinsertIdentifier:(id)a3 withMaskedIdentifiers:(id)a4 atIndex:(unint64_t)a5 forObjectToMove:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  unint64_t v28;

  v20 = a3;
  v10 = a4;
  v11 = a6;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "insertObject:atIndex:", v20, a5);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __92__ICCRTombstoneOrderedSet_reinsertIdentifier_withMaskedIdentifiers_atIndex_forObjectToMove___block_invoke;
    v25 = &unk_1E76CFE68;
    v26 = v13;
    v28 = a5;
    v27 = v14;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v22);

    -[ICCRTombstoneOrderedSet moveClock](self, "moveClock");
    v15 = objc_msgSend(v10, "count") + 1;
  }
  else
  {
    -[ICCRTombstoneOrderedSet moveClock](self, "moveClock");
    v15 = 1;
  }
  -[NSMapTable objectEnumerator](self->_cachedIndexMapping, "objectEnumerator", v20, v22, v23, v24, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nextObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      if (objc_msgSend(v18, "lastIndex") >= a5)
        objc_msgSend(v18, "shiftIndexesStartingAtIndex:by:", a5, v15);
      objc_msgSend(v16, "nextObject");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    while (v19);
  }
  -[NSMapTable setObject:forKey:](self->_cachedIndexMapping, "setObject:forKey:", v14, v11);

}

uint64_t __92__ICCRTombstoneOrderedSet_reinsertIdentifier_withMaskedIdentifiers_atIndex_forObjectToMove___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, *(_QWORD *)(a1 + 48) + 1);
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "lastIndex") + 1);
}

- (void)moveClock
{
  void *v3;
  id v4;

  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMoveClock:", 1);

  if (-[ICCRTombstoneOrderedSet wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[ICCRTombstoneOrderedSet delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUndoCommandsForObject:block:", self, &__block_literal_global_68);

  }
}

uint64_t __36__ICCRTombstoneOrderedSet_moveClock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moveClock");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCRTombstoneOrderedSet cachedIdentifierSet](self, "cachedIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICCRTombstoneOrderedSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E76CD008;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __54__ICCRTombstoneOrderedSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)description
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__59;
  v10 = __Block_byref_object_dispose__59;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{{\n"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ICCRTombstoneOrderedSet_description__block_invoke;
  v5[3] = &unk_1E76CFED0;
  v5[4] = &v6;
  -[ICCRTombstoneOrderedSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend((id)v7[5], "appendString:", CFSTR("}}"));
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__ICCRTombstoneOrderedSet_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "description");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\t%@\n"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ICCRTombstoneOrderedSet ordering](self, "ordering");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ordering");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[ICCRTombstoneOrderedSet elements](self, "elements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "elements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

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

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)mergeWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICCRTombstoneOrderedSet mergeWith:].cold.1((uint64_t)v4, v9);

    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("ICCRTombstoneOrderedSet cannot merge with object of type %@."), v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  v14 = v4;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ordering");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeWith:", v6);

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mergeWith:", v8);
  -[ICCRTombstoneOrderedSet wipeoutCaches](self, "wipeoutCaches");

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICCRTombstoneOrderedSet *v12;

  v6 = a4;
  v7 = a3;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deltaSince:in:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deltaSince:in:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ICCRTombstoneOrderedSet initWithOrdering:elements:document:]([ICCRTombstoneOrderedSet alloc], "initWithOrdering:elements:document:", v9, v11, v6);
  return v12;
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "realizeLocalChangesIn:", v4);

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realizeLocalChangesIn:", v4);

}

- (id)tombstone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICCRTombstoneOrderedSet *v7;
  void *v8;
  ICCRTombstoneOrderedSet *v9;

  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tombstone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tombstone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [ICCRTombstoneOrderedSet alloc];
  -[ICCRTombstoneOrderedSet document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICCRTombstoneOrderedSet initWithOrdering:elements:document:](v7, "initWithOrdering:elements:document:", v4, v6, v8);

  return v9;
}

- (void)walkGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "walkGraph:", v4);

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "walkGraph:", v4);

}

- (void)setDocument:(id)a3
{
  ICCRDocument **p_document;
  id v5;
  void *v6;
  id v7;

  p_document = &self->_document;
  v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  -[ICCRTombstoneOrderedSet ordering](self, "ordering");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocument:", v5);

  -[ICCRTombstoneOrderedSet elements](self, "elements");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDocument:", v5);

}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[ICCRTombstoneOrderedSet delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ICCRTombstoneOrderedSet_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E76CFEF8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addUndoCommandsForObject:block:", self, v8);

}

void __58__ICCRTombstoneOrderedSet_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "ordering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  objc_msgSend(v4, "wipeoutCaches");
}

- (BOOL)wantsUndoCommands
{
  void *v2;
  char v3;

  -[ICCRTombstoneOrderedSet delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUndoCommands");

  return v3;
}

- (ICCRDocument)document
{
  return (ICCRDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (ICCRUndoDelegate)delegate
{
  return (ICCRUndoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICCRArray)ordering
{
  return self->_ordering;
}

- (void)setOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_ordering, a3);
}

- (ICCRSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_ordering, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_cachedIndexMapping, 0);
  objc_storeStrong((id *)&self->_cachedIdentifierSet, 0);
}

- (void)insertObject:(uint64_t)a3 atIndex:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, a3, "Inserting element at invalid index %lu", (uint8_t *)&v3);
}

- (void)moveObjectFromIndex:(uint64_t)a1 toIndex:(NSObject *)a2 mutableSafe:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, a3, "Moving element at invalid index %lu", (uint8_t *)&v3);
}

- (void)mergeWith:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v5, "ICCRTombstoneOrderedSet cannot merge with object of type %@.", (uint8_t *)&v6);

}

@end
