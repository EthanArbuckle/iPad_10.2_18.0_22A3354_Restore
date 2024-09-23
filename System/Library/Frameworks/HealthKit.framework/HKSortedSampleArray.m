@implementation HKSortedSampleArray

- (HKSortedSampleArray)init
{
  HKSortedSampleArray *v2;
  NSMutableArray *v3;
  NSMutableArray *samples;
  NSMutableDictionary *v5;
  NSMutableDictionary *samplesByUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSortedSampleArray;
  v2 = -[HKSortedSampleArray init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    samples = v2->_samples;
    v2->_samples = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    samplesByUUID = v2->_samplesByUUID;
    v2->_samplesByUUID = v5;

  }
  return v2;
}

- (void)_addResultsToUUIDMappingRemovingDuplicates:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_samplesByUUID, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v8, "removeObjectAtIndex:", v4);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_samplesByUUID, "setObject:forKeyedSubscript:", v5, v6);
        ++v4;
      }

    }
    while (v4 < objc_msgSend(v8, "count"));
  }

}

- (BOOL)insertSamples:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v11[0] = self->_sortDescriptor;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v5);

  -[HKSortedSampleArray _addResultsToUUIDMappingRemovingDuplicates:](self, "_addResultsToUUIDMappingRemovingDuplicates:", v4);
  v6 = objc_msgSend(v4, "count");
  if (-[NSMutableArray count](self->_samples, "count"))
  {
    v7 = 0;
    do
    {
      if (!objc_msgSend(v4, "count"))
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSSortDescriptor compareObject:toObject:](self->_sortDescriptor, "compareObject:toObject:", v9, v8) == NSOrderedAscending)
      {
        -[NSMutableArray insertObject:atIndex:](self->_samples, "insertObject:atIndex:", v9, v7);
        objc_msgSend(v4, "removeObjectAtIndex:", 0);
      }
      ++v7;

    }
    while (v7 < -[NSMutableArray count](self->_samples, "count"));
  }
  if (objc_msgSend(v4, "count"))
    -[NSMutableArray addObjectsFromArray:](self->_samples, "addObjectsFromArray:", v4);

  return v6 != 0;
}

- (id)sampleAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", a3);
}

- (id)allSamples
{
  return self->_samples;
}

- (int64_t)count
{
  return -[NSMutableArray count](self->_samples, "count");
}

- (BOOL)removeSample:(id)a3
{
  return -[HKSortedSampleArray removeSampleAtIndex:](self, "removeSampleAtIndex:", -[NSMutableArray indexOfObject:](self->_samples, "indexOfObject:", a3));
}

- (BOOL)removeSampleAtIndex:(int64_t)a3
{
  void *v6;
  NSMutableDictionary *samplesByUUID;
  void *v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (-[HKSortedSampleArray count](self, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  samplesByUUID = self->_samplesByUUID;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](samplesByUUID, "removeObjectForKey:", v8);

  -[NSMutableArray removeObjectAtIndex:](self->_samples, "removeObjectAtIndex:", a3);
  return 1;
}

- (BOOL)removeSamplesWithUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_samplesByUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v7 |= -[HKSortedSampleArray removeSample:](self, "removeSample:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (void)removeAllSamples
{
  -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_samplesByUUID, "removeAllObjects");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_samples, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)sampleEnumerator
{
  return (id)-[NSMutableArray objectEnumerator](self->_samples, "objectEnumerator");
}

- (id)reverseSampleEnumerator
{
  return (id)-[NSMutableArray reverseObjectEnumerator](self->_samples, "reverseObjectEnumerator");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKSortedSampleArray;
  -[HKSortedSampleArray description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray description](self->_samples, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setSortDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_samplesByUUID, 0);
  objc_storeStrong((id *)&self->_samples, 0);
}

@end
