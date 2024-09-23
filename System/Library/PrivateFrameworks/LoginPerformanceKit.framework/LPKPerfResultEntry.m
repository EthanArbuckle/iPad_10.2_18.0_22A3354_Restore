@implementation LPKPerfResultEntry

- (LPKPerfResultEntry)init
{
  LPKPerfResultEntry *v2;
  uint64_t v3;
  NSMutableArray *entryValues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPKPerfResultEntry;
  v2 = -[LPKPerfResultEntry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entryValues = v2->_entryValues;
    v2->_entryValues = (NSMutableArray *)v3;

    v2->_needsReCalculation = 1;
  }
  return v2;
}

- (void)addEntryValue:(double)a3
{
  NSMutableArray *entryValues;
  void *v5;

  entryValues = self->_entryValues;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](entryValues, "addObject:", v5);

  -[LPKPerfResultEntry setNeedsReCalculation:](self, "setNeedsReCalculation:", 1);
}

- (double)meanValue
{
  -[LPKPerfResultEntry _reCalculateValuesIfNeeded](self, "_reCalculateValuesIfNeeded");
  return self->_meanValue;
}

- (double)medianValue
{
  -[LPKPerfResultEntry _reCalculateValuesIfNeeded](self, "_reCalculateValuesIfNeeded");
  return self->_medianValue;
}

- (void)_reCalculateValuesIfNeeded
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  char v10;
  NSMutableArray *entryValues;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[LPKPerfResultEntry needsReCalculation](self, "needsReCalculation"))
  {
    -[NSMutableArray sortUsingComparator:](self->_entryValues, "sortUsingComparator:", &__block_literal_global);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = self->_entryValues;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      v7 = 0.0;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "doubleValue", (_QWORD)v19);
          v7 = v7 + v9;
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 0.0;
    }

    self->_meanValue = v7 / (double)(unint64_t)-[NSMutableArray count](self->_entryValues, "count");
    v10 = -[NSMutableArray count](self->_entryValues, "count");
    entryValues = self->_entryValues;
    v12 = -[NSMutableArray count](entryValues, "count");
    if ((v10 & 1) != 0)
    {
      -[NSMutableArray objectAtIndexedSubscript:](entryValues, "objectAtIndexedSubscript:", v12 >> 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      self->_medianValue = v18;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](entryValues, "objectAtIndexedSubscript:", (v12 - 1) >> 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      -[NSMutableArray objectAtIndexedSubscript:](self->_entryValues, "objectAtIndexedSubscript:", ((unint64_t)(-[NSMutableArray count](self->_entryValues, "count") - 1) >> 1) + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      self->_medianValue = (v15 + v17) * 0.5;

    }
    -[LPKPerfResultEntry setNeedsReCalculation:](self, "setNeedsReCalculation:", 0);
  }
}

uint64_t __48__LPKPerfResultEntry__reCalculateValuesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)entryName
{
  return self->_entryName;
}

- (void)setEntryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)entryValues
{
  return self->_entryValues;
}

- (void)setEntryValues:(id)a3
{
  objc_storeStrong((id *)&self->_entryValues, a3);
}

- (BOOL)needsReCalculation
{
  return self->_needsReCalculation;
}

- (void)setNeedsReCalculation:(BOOL)a3
{
  self->_needsReCalculation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryValues, 0);
  objc_storeStrong((id *)&self->_entryName, 0);
}

@end
