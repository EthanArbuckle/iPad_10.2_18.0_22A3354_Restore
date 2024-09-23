@implementation ENRegionHistory

- (ENRegionHistory)init
{
  return -[ENRegionHistory initWithRegionVisits:](self, "initWithRegionVisits:", MEMORY[0x1E0C9AA58]);
}

- (ENRegionHistory)initWithRegionVisits:(id)a3
{
  id v4;
  ENRegionHistory *v5;
  NSMutableArray *v6;
  NSMutableArray *regionHistory;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENRegionHistory;
  v5 = -[ENRegionHistory init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithArray:", v4);
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE0]);
    }
    regionHistory = v5->_regionHistory;
    v5->_regionHistory = v6;

  }
  return v5;
}

- (void)addRegionVisit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  if (v4)
  {
    v28 = v4;
    -[NSMutableArray lastObject](self->_regionHistory, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isCountryCodeEqualToRegion:", v7);

    if (v8)
    {
      objc_msgSend(v28, "region");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subdivisionCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

      }
      else
      {
        objc_msgSend(v5, "region");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "subdivisionCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
LABEL_19:

          return;
        }
      }
      objc_msgSend(v5, "region");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "region");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isSubdivisionCodeEqualToRegion:", v12))
      {

LABEL_7:
        -[NSMutableArray removeLastObject](self->_regionHistory, "removeLastObject");
        v13 = objc_alloc(MEMORY[0x1E0CAA3B0]);
        objc_msgSend(v28, "region");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "laterDate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v13, "initWithRegion:date:", v14, v17);

        v19 = (id)v18;
        goto LABEL_17;
      }
      objc_msgSend(v5, "region");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subdivisionCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {

      }
      else
      {
        objc_msgSend(v28, "region");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "subdivisionCode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          goto LABEL_7;
      }
      objc_msgSend(v5, "region");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "subdivisionCode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        -[NSMutableArray removeLastObject](self->_regionHistory, "removeLastObject");
    }
    v19 = v28;
LABEL_17:
    v28 = v19;
    -[NSMutableArray addObject:](self->_regionHistory, "addObject:");
    if ((unint64_t)-[NSMutableArray count](self->_regionHistory, "count") >= 0x3E9)
      -[NSMutableArray removeObjectAtIndex:](self->_regionHistory, "removeObjectAtIndex:", 0);
    goto LABEL_19;
  }
}

- (void)removeRegionVisit:(id)a3
{
  if (a3)
    -[NSMutableArray removeObject:](self->_regionHistory, "removeObject:");
}

- (void)removeAllRegionVisits
{
  -[NSMutableArray removeAllObjects](self->_regionHistory, "removeAllObjects");
}

- (id)getRegions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ENRegionHistory getRegionVisits](self, "getRegionVisits", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "region");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E68], "setWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getRegionVisits
{
  return (id)-[NSMutableArray copy](self->_regionHistory, "copy");
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3938];
  -[ENRegionHistory getRegionVisits](self, "getRegionVisits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ENRegionHistory *v4;
  void *v5;
  ENRegionHistory *v6;

  v4 = [ENRegionHistory alloc];
  -[ENRegionHistory getRegionVisits](self, "getRegionVisits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENRegionHistory initWithRegionVisits:](v4, "initWithRegionVisits:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_regionHistory, CFSTR("visits"));
}

- (ENRegionHistory)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ENRegionHistory *v9;

  v4 = (void *)MEMORY[0x1E0C99E68];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("visits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ENRegionHistory initWithRegionVisits:](self, "initWithRegionVisits:", v8);
  return v9;
}

- (NSMutableArray)regionHistory
{
  return self->_regionHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionHistory, 0);
}

@end
