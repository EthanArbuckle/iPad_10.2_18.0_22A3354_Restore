@implementation HKAccessibilityPointData

- (HKAccessibilityPointData)initWithHorizontalScreenCoordinate:(double)a3 horizontalTimeCoordinate:(id)a4 horizontalDate:(id)a5 values:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKAccessibilityPointData *v14;
  HKAccessibilityPointData *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKAccessibilityPointData;
  v14 = -[HKAccessibilityPointData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_horizontalScreenCoordinate = a3;
    objc_storeStrong((id *)&v14->_horizontalTimeCoordinate, a4);
    objc_storeStrong((id *)&v15->_horizontalDate, a5);
    objc_storeStrong((id *)&v15->_values, a6);
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKAccessibilityPointData %p:"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityPointData horizontalScreenCoordinate](self, "horizontalScreenCoordinate");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("  horizontalScreenCoordinate: %lg"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityPointData horizontalTimeCoordinate](self, "horizontalTimeCoordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("  horizontalTimeCoordinate: '%@'"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityPointData horizontalDate](self, "horizontalDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("  horizontalDate: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[HKAccessibilityPointData values](self, "values");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  if (v14)
  {
    -[HKAccessibilityPointData values](self, "values");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("  values %lu:"), objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[HKAccessibilityPointData values](self, "values");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _IndentString(v23, 4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  values NULL (no data)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)horizontalScreenCoordinate
{
  return self->_horizontalScreenCoordinate;
}

- (NSString)horizontalTimeCoordinate
{
  return self->_horizontalTimeCoordinate;
}

- (NSDate)horizontalDate
{
  return self->_horizontalDate;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_horizontalDate, 0);
  objc_storeStrong((id *)&self->_horizontalTimeCoordinate, 0);
}

@end
