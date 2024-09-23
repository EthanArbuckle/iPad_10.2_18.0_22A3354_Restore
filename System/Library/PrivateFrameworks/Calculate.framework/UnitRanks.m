@implementation UnitRanks

- (UnitRanks)initWithUnitsInfo:(id)a3
{
  id v4;
  UnitRanks *v5;
  uint64_t v6;
  NSMutableSet *units;
  uint64_t v8;
  NSMutableArray *ranks;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UnitRanks;
  v5 = -[UnitRanks init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    units = v5->_units;
    v5->_units = (NSMutableSet *)v6;

    v8 = objc_opt_new();
    ranks = v5->_ranks;
    v5->_ranks = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_unitsInfo, v4);
    v5->_tokenType = 2;
  }

  return v5;
}

- (UnitRanks)init
{
  UnitRanks *v2;
  uint64_t v3;
  NSMutableSet *units;
  uint64_t v5;
  NSMutableArray *ranks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UnitRanks;
  v2 = -[UnitRanks init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    units = v2->_units;
    v2->_units = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    ranks = v2->_ranks;
    v2->_ranks = (NSMutableArray *)v5;

    objc_storeWeak((id *)&v2->_unitsInfo, 0);
    v2->_tokenType = 2;
  }
  return v2;
}

- (void)sort
{
  -[NSMutableArray sortWithOptions:usingComparator:](self->_ranks, "sortWithOptions:usingComparator:", 16, &__block_literal_global_169);
}

- (BOOL)isAmbiguous
{
  return (unint64_t)-[NSMutableSet count](self->_units, "count") > 1;
}

- (void)addUnitRank:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "unitID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_units, "containsObject:", v4) & 1) == 0)
  {
    if (objc_msgSend(v11, "unitID") == -1)
    {
      self->_containsFrom = 1;
    }
    else if (objc_msgSend(v11, "unitID") == -2)
    {
      self->_containsTo = 1;
    }
    else if (objc_msgSend(v11, "unitID"))
    {
      self->_containsUnit = 1;
    }
    else
    {
      self->_tokenType = objc_msgSend(v11, "tokenType");
    }
    if (!self->_isLaTeX && objc_msgSend(v11, "isLaTeX"))
      self->_isLaTeX = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_unitsInfo);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained((id *)&self->_unitsInfo);
      objc_msgSend(v7, "objectAtIndexedSubscript:", (int)objc_msgSend(v11, "unitID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "typeInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCurrency");

      if (v10)
        self->_containsCurrency = 1;
    }
    -[NSMutableSet addObject:](self->_units, "addObject:", v4);
    -[NSMutableArray addObject:](self->_ranks, "addObject:", v11);
  }

}

- (NSMutableArray)ranks
{
  return self->_ranks;
}

- (void)setRanks:(id)a3
{
  objc_storeStrong((id *)&self->_ranks, a3);
}

- (BOOL)containsFrom
{
  return self->_containsFrom;
}

- (BOOL)containsTo
{
  return self->_containsTo;
}

- (BOOL)containsUnit
{
  return self->_containsUnit;
}

- (BOOL)containsCurrency
{
  return self->_containsCurrency;
}

- (UnitsInfo)unitsInfo
{
  return (UnitsInfo *)objc_loadWeakRetained((id *)&self->_unitsInfo);
}

- (void)setUnitsInfo:(id)a3
{
  objc_storeWeak((id *)&self->_unitsInfo, a3);
}

- (int)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int)a3
{
  self->_tokenType = a3;
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_isLaTeX = a3;
}

- (NSMutableSet)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_destroyWeak((id *)&self->_unitsInfo);
  objc_storeStrong((id *)&self->_ranks, 0);
}

uint64_t __17__UnitRanks_sort__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)unitRanksWithUnitsInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUnitsInfo:", v3);

  return v4;
}

@end
