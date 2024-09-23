@implementation IPMessageThread

- (void)appendUnit:(id)a3 inResponseToUnit:(id)a4
{
  id v6;
  NSMutableArray *threadRoots;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *allUnits;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSArray *allUnitsSorted;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    if (v6)
    {
      objc_msgSend(v6, "addFollowup:", v14);
    }
    else
    {
      threadRoots = self->_threadRoots;
      if (threadRoots)
      {
        -[NSMutableArray addObject:](threadRoots, "addObject:", v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v14);
        v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v9 = self->_threadRoots;
        self->_threadRoots = v8;

      }
    }
    allUnits = self->_allUnits;
    if (!allUnits)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = self->_allUnits;
      self->_allUnits = v11;

      allUnits = self->_allUnits;
    }
    -[NSMutableArray addObject:](allUnits, "addObject:", v14);
    allUnitsSorted = self->_allUnitsSorted;
    self->_allUnitsSorted = 0;

  }
}

- (id)orderedMessageUnits
{
  NSArray *allUnitsSorted;
  NSArray *v4;
  NSArray *v5;

  allUnitsSorted = self->_allUnitsSorted;
  if (!allUnitsSorted)
  {
    -[NSMutableArray sortedArrayUsingComparator:](self->_allUnits, "sortedArrayUsingComparator:", &__block_literal_global);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allUnitsSorted;
    self->_allUnitsSorted = v4;

    allUnitsSorted = self->_allUnitsSorted;
  }
  return allUnitsSorted;
}

uint64_t __38__IPMessageThread_orderedMessageUnits__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "originalMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateSent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateSent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    v11 = objc_msgSend(v4, "indexInOriginalMessage");
    v12 = objc_msgSend(v5, "indexInOriginalMessage");
    v13 = -1;
    if (v11 >= v12)
      v13 = 1;
    if (v11 != v12)
      v10 = v13;
  }

  return v10;
}

- (id)threads
{
  return self->_threadRoots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUnitsSorted, 0);
  objc_storeStrong((id *)&self->_allUnits, 0);
  objc_storeStrong((id *)&self->_threadRoots, 0);
}

@end
