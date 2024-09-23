@implementation MKPriorityToIndexMap

uint64_t __38__MKPriorityToIndexMap_addPriorities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)containsPriority:(double)a3
{
  NSMutableDictionary *prioritiesToIndexes;
  void *v4;
  void *v5;

  prioritiesToIndexes = self->_prioritiesToIndexes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](prioritiesToIndexes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(prioritiesToIndexes) = v5 != 0;

  return (char)prioritiesToIndexes;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_prioritiesToIndexes, "objectForKeyedSubscript:", a3);
}

- (MKPriorityToIndexMap)initWithPriorities:(id)a3
{
  id v4;
  MKPriorityToIndexMap *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *prioritiesToIndexes;
  NSMutableArray *v8;
  NSMutableArray *priorities;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPriorityToIndexMap;
  v5 = -[MKPriorityToIndexMap init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prioritiesToIndexes = v5->_prioritiesToIndexes;
    v5->_prioritiesToIndexes = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    priorities = v5->_priorities;
    v5->_priorities = v8;

    -[MKPriorityToIndexMap addPriorities:](v5, "addPriorities:", v4);
  }

  return v5;
}

- (BOOL)addPriorities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_prioritiesToIndexes, "objectForKeyedSubscript:", v11, (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v13 = objc_msgSend(v5, "count");
    v14 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v5, "sortWithOptions:usingComparator:", 1, &__block_literal_global_11);
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[MKPriorityToIndexMap insertPriorities:prioritiesToReAdd:](self, "insertPriorities:prioritiesToReAdd:", v5, v15);
      -[MKPriorityToIndexMap appendRemainingPriorities:prioritiesToReAdd:](self, "appendRemainingPriorities:prioritiesToReAdd:", v5, v15);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)insertPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (-[NSMutableArray count](self->_priorities, "count") && -[NSMutableArray count](self->_priorities, "count"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (!v8)
      {
        -[MKPriorityToIndexMap nextPriorityFromPriorities:prioritiesToReAdd:](self, "nextPriorityFromPriorities:prioritiesToReAdd:", v13, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_priorities, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v9) == -1)
      {
        objc_msgSend(v6, "addObject:", v9);
        -[NSMutableArray setObject:atIndexedSubscript:](self->_priorities, "setObject:atIndexedSubscript:", v8, v7);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prioritiesToIndexes, "setObject:forKeyedSubscript:", v10, v8);

        objc_msgSend(v13, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v13;
        if (v8 != v11)
          v12 = v6;
        objc_msgSend(v12, "removeObjectAtIndex:", 0);

        v8 = 0;
      }
      ++v7;

    }
    while (v7 < -[NSMutableArray count](self->_priorities, "count"));

  }
}

- (void)appendRemainingPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  while (objc_msgSend(v11, "count") || objc_msgSend(v6, "count"))
  {
    -[MKPriorityToIndexMap nextPriorityFromPriorities:prioritiesToReAdd:](self, "nextPriorityFromPriorities:prioritiesToReAdd:", v11, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_priorities, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prioritiesToIndexes, "setObject:forKeyedSubscript:", v8, v7);

    -[NSMutableArray addObject:](self->_priorities, "addObject:", v7);
    objc_msgSend(v11, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v11;
    if (v7 != v9)
      v10 = v6;
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

  }
}

- (id)nextPriorityFromPriorities:(id)a3 prioritiesToReAdd:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (v10 = objc_msgSend(v8, "compare:", v9), v11 = v8, v10 != -1))
      v11 = v9;
    v12 = v11;

    v8 = v12;
  }

  return v8;
}

- (MKPriorityToIndexMap)init
{
  return -[MKPriorityToIndexMap initWithPriorities:](self, "initWithPriorities:", 0);
}

- (int64_t)indexOfPriority:(double)a3
{
  NSMutableDictionary *prioritiesToIndexes;
  void *v4;
  void *v5;
  int64_t v6;

  prioritiesToIndexes = self->_prioritiesToIndexes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](prioritiesToIndexes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (double)priorityOfIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (-[NSMutableArray count](self->_priorities, "count") <= a3)
    return 2.22507386e-308;
  -[NSMutableArray objectAtIndexedSubscript:](self->_priorities, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (BOOL)contains:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_prioritiesToIndexes, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesToIndexes, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
}

@end
