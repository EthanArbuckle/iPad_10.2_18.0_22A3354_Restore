@implementation _FPItemList

- (id)allObjects
{
  return (id)-[NSMutableOrderedSet array](self->_orderedSet, "array");
}

- (unint64_t)indexOfItemID:(id)a3
{
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIDs, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSMutableOrderedSet indexOfObject:](self->_orderedSet, "indexOfObject:", v4);
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_orderedSet, "count");
}

- (BOOL)isObsoleteID:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_formerIDs, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableDictionary *itemsByIDs;
  void *v7;
  void *v8;
  NSMutableDictionary *formerIDs;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  itemsByIDs = self->_itemsByIDs;
  objc_msgSend(v12, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](itemsByIDs, "setObject:forKeyedSubscript:", v12, v7);

  -[NSMutableOrderedSet insertObject:atIndex:](self->_orderedSet, "insertObject:atIndex:", v12, a4);
  objc_msgSend(v12, "formerItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    formerIDs = self->_formerIDs;
    objc_msgSend(v12, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formerItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](formerIDs, "setObject:forKey:", v10, v11);

  }
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_orderedSet, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (id)formerIDs
{
  return self->_formerIDs;
}

- (_FPItemList)init
{
  _FPItemList *v2;
  uint64_t v3;
  NSMutableOrderedSet *orderedSet;
  uint64_t v5;
  NSMutableDictionary *itemsByIDs;
  uint64_t v7;
  NSMutableDictionary *formerIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_FPItemList;
  v2 = -[_FPItemList init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    orderedSet = v2->_orderedSet;
    v2->_orderedSet = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    itemsByIDs = v2->_itemsByIDs;
    v2->_itemsByIDs = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    formerIDs = v2->_formerIDs;
    v2->_formerIDs = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formerIDs, 0);
  objc_storeStrong((id *)&self->_itemsByIDs, 0);
  objc_storeStrong((id *)&self->_orderedSet, 0);
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_FPItemList indexOfItemID:](self, "indexOfItemID:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "formerItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = -[_FPItemList indexOfItemID:](self, "indexOfItemID:", v7);
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;

  }
  return v6;
}

- (id)mutableCopy
{
  _FPItemList *v3;
  uint64_t v4;
  NSMutableOrderedSet *orderedSet;
  uint64_t v6;
  NSMutableDictionary *itemsByIDs;
  uint64_t v8;
  NSMutableDictionary *formerIDs;

  v3 = objc_alloc_init(_FPItemList);
  v4 = -[NSMutableOrderedSet mutableCopy](self->_orderedSet, "mutableCopy");
  orderedSet = v3->_orderedSet;
  v3->_orderedSet = (NSMutableOrderedSet *)v4;

  v6 = -[NSMutableDictionary mutableCopy](self->_itemsByIDs, "mutableCopy");
  itemsByIDs = v3->_itemsByIDs;
  v3->_itemsByIDs = (NSMutableDictionary *)v6;

  v8 = -[NSMutableDictionary mutableCopy](self->_formerIDs, "mutableCopy");
  formerIDs = v3->_formerIDs;
  v3->_formerIDs = (NSMutableDictionary *)v8;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)-[NSMutableOrderedSet count](self->_orderedSet, "count") > 5)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[_FPItemList subarrayWithRange:](self, "subarrayWithRange:", 0, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("{%@ and %lu others}"), v6, -[NSMutableOrderedSet count](self->_orderedSet, "count") - 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableOrderedSet description](self->_orderedSet, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lu items}"), -[NSMutableOrderedSet count](self->_orderedSet, "count"));
}

- (id)itemIDsDifferenceWithList:(id)a3
{
  NSMutableOrderedSet *orderedSet;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  orderedSet = self->_orderedSet;
  v4 = a3;
  v5 = (void *)-[NSMutableOrderedSet mutableCopy](orderedSet, "mutableCopy");
  v6 = v4[1];

  objc_msgSend(v5, "minusOrderedSet:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41___FPItemList_itemIDsDifferenceWithList___block_invoke;
  v10[3] = &unk_1E444B830;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_orderedSet, "objectAtIndex:", a3);
}

- (void)removeObjectWithID:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *formerIDs;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIDs, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet removeObject:](self->_orderedSet, "removeObject:", v4);
  objc_msgSend(v4, "formerItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    formerIDs = self->_formerIDs;
    objc_msgSend(v4, "formerItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](formerIDs, "removeObjectForKey:", v7);

  }
  if (!v4)
  {
    -[NSMutableDictionary objectForKey:](self->_formerIDs, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[_FPItemList removeObjectWithID:](self, "removeObjectWithID:", v8);

  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSMutableDictionary *itemsByIDs;
  void *v6;
  void *v7;
  NSMutableDictionary *formerIDs;
  void *v9;
  id v10;

  -[NSMutableOrderedSet objectAtIndex:](self->_orderedSet, "objectAtIndex:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  itemsByIDs = self->_itemsByIDs;
  objc_msgSend(v10, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](itemsByIDs, "setObject:forKeyedSubscript:", 0, v6);

  -[NSMutableOrderedSet removeObjectAtIndex:](self->_orderedSet, "removeObjectAtIndex:", a3);
  objc_msgSend(v10, "formerItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    formerIDs = self->_formerIDs;
    objc_msgSend(v10, "formerItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](formerIDs, "removeObjectForKey:", v9);

  }
}

- (void)addObject:(id)a3
{
  NSMutableDictionary *itemsByIDs;
  void *v5;
  void *v6;
  NSMutableDictionary *formerIDs;
  void *v8;
  id v9;

  v9 = a3;
  itemsByIDs = self->_itemsByIDs;
  objc_msgSend(v9, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](itemsByIDs, "setObject:forKeyedSubscript:", v9, v5);

  -[NSMutableOrderedSet addObject:](self->_orderedSet, "addObject:", v9);
  objc_msgSend(v9, "formerItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    formerIDs = self->_formerIDs;
    objc_msgSend(v9, "formerItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](formerIDs, "removeObjectForKey:", v8);

  }
}

- (void)removeLastObject
{
  if (-[NSMutableOrderedSet count](self->_orderedSet, "count"))
    -[_FPItemList removeObjectAtIndex:](self, "removeObjectAtIndex:", -[NSMutableOrderedSet count](self->_orderedSet, "count") - 1);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  void *v6;
  NSMutableDictionary *itemsByIDs;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *formerIDs;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[NSMutableOrderedSet objectAtIndex:](self->_orderedSet, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  itemsByIDs = self->_itemsByIDs;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](itemsByIDs, "setObject:forKeyedSubscript:", 0, v8);

  v9 = self->_itemsByIDs;
  objc_msgSend(v17, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v10);

  -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_orderedSet, "replaceObjectAtIndex:withObject:", a3, v17);
  objc_msgSend(v6, "formerItemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    formerIDs = self->_formerIDs;
    objc_msgSend(v17, "formerItemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](formerIDs, "removeObjectForKey:", v13);

  }
  objc_msgSend(v17, "formerItemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = self->_formerIDs;
    objc_msgSend(v17, "formerItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

  }
}

- (void)sortUsingDescriptors:(id)a3
{
  -[NSMutableOrderedSet sortUsingDescriptors:](self->_orderedSet, "sortUsingDescriptors:", a3);
}

- (id)itemWithItemID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIDs, "objectForKeyedSubscript:", a3);
}

@end
