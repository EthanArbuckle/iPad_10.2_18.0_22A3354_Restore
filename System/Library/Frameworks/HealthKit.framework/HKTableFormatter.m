@implementation HKTableFormatter

+ (id)formatterForCodableCondensedWorkouts
{
  return -[HKTableFormatter initWithColumnTitles:]([HKTableFormatter alloc], "initWithColumnTitles:", &unk_1E389DC60);
}

- (void)appendWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  __CFString *v15;
  int v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[13];

  v34[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[HKTableFormatter rowCount](self, "rowCount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v33;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v4, "persistentID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v32;
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_UUIDWithData:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v29;
  v6 = (void *)0x1E0C99000;
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "creationDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v27;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "startDate");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v25;
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "endDate");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter stringFromDate:](self, "stringFromDate:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v21;
  +[HKWorkout _stringFromWorkoutActivityType:](HKWorkout, "_stringFromWorkoutActivityType:", objc_msgSend(v4, "type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "substringFromIndex:", 21);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("Unknown");
  if (v10)
    v12 = (const __CFString *)v10;
  v34[7] = v12;
  objc_msgSend(v4, "duration");
  -[HKTableFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v13;
  v14 = objc_msgSend(v4, "hasCondenserVersion");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v4, "condenserVersion"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_1E37FD4C0;
  }
  v34[9] = v15;
  v16 = objc_msgSend(v4, "hasCondenserDate");
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "condenserDate");
    objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTableFormatter stringFromDate:](self, "stringFromDate:", v6);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = &stru_1E37FD4C0;
  }
  v34[10] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter appendRow:](self, "appendRow:", v19);

  if (v16)
  {

  }
  if (v14)

}

- (HKTableFormatter)initWithColumnTitles:(id)a3
{
  id v4;
  HKTableFormatter *v5;
  uint64_t v6;
  NSArray *titles;
  uint64_t v8;
  NSArray *columns;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKTableFormatter;
  v5 = -[HKTableFormatter init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    titles = v5->_titles;
    v5->_titles = (NSArray *)v6;

    if (v5->_titles)
    {
      objc_msgSend(v4, "hk_map:", &__block_literal_global_117);
      v8 = objc_claimAutoreleasedReturnValue();
      columns = v5->_columns;
      v5->_columns = (NSArray *)v8;

    }
  }

  return v5;
}

id __41__HKTableFormatter_initWithColumnTitles___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (HKTableFormatter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)appendRow:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *columns;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v5 = a3;
  v10 = v5;
  if (!self->_columns)
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_3);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    columns = self->_columns;
    self->_columns = v6;

    v5 = v10;
  }
  v8 = objc_msgSend(v5, "count");
  if (v8 != -[NSArray count](self->_columns, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKTableFormatter.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row.count == _columns.count"));

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__HKTableFormatter_appendRow___block_invoke_2;
  v11[3] = &unk_1E37F5B60;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

id __30__HKTableFormatter_appendRow___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

void __30__HKTableFormatter_appendRow___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

- (void)appendHeterogenousRow:(id)a3
{
  id v4;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_13_1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter appendRow:](self, "appendRow:", v4);

}

uint64_t __42__HKTableFormatter_appendHeterogenousRow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (void)appendEmptyRow
{
  id v3;

  -[NSArray hk_map:](self->_titles, "hk_map:", &__block_literal_global_15_2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter appendRow:](self, "appendRow:", v3);

}

const __CFString *__34__HKTableFormatter_appendEmptyRow__block_invoke()
{
  return &stru_1E37FD4C0;
}

- (int64_t)rowCount
{
  int64_t result;
  void *v3;
  int64_t v4;

  result = (int64_t)self->_columns;
  if (result)
  {
    objc_msgSend((id)result, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  return result;
}

- (id)_columnWidths
{
  id v3;
  unint64_t v4;
  NSArray *titles;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_columns, "count"))
  {
    v4 = 0;
    do
    {
      titles = self->_titles;
      if (titles)
      {
        -[NSArray objectAtIndexedSubscript:](titles, "objectAtIndexedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");

      }
      else
      {
        v7 = 0;
      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "length");
            if (v7 <= v13)
              v7 = v13;
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      if (v7 + 4 <= 8)
        v14 = 8;
      else
        v14 = v7 + 4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v15);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_columns, "count"));
  }
  return v3;
}

- (void)_appendColumn:(id)a3 width:(int64_t)a4 padding:(id)a5 row:(id)a6
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKTableFormatter.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("padding.length > 0"));

  }
  objc_msgSend(v12, "appendString:", v16);
  v13 = objc_msgSend(v16, "length");
  if (v13 < a4)
  {
    v14 = v13;
    do
    {
      objc_msgSend(v12, "appendString:", v11);
      v14 += objc_msgSend(v11, "length");
    }
    while (v14 < a4);
  }

}

- (id)formattedTableHeader
{
  void *v3;
  void *v4;

  -[HKTableFormatter _columnWidths](self, "_columnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter _formattedTableHeaderForColumnWidths:](self, "_formattedTableHeaderForColumnWidths:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_formattedTableHeaderForColumnWidths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  NSString *title;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "integerValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  title = self->_title;
  if (title)
    objc_msgSend(v10, "appendFormat:", CFSTR("%*s\n"), (v7 - -[NSString length](title, "length")) >> 1, ");
  if (self->_titles)
  {
    if (-[NSArray count](self->_columns, "count"))
    {
      v12 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_titles, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", v13, objc_msgSend(v14, "integerValue"), CFSTR(" "), v10);

        ++v12;
      }
      while (v12 < -[NSArray count](self->_columns, "count"));
    }
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    if (-[NSArray count](self->_columns, "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", &stru_1E37FD4C0, objc_msgSend(v16, "integerValue"), CFSTR("-"), v10);

        ++v15;
      }
      while (v15 < -[NSArray count](self->_columns, "count"));
    }
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
  }

  return v10;
}

- (void)enumerateFormattedRows:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKTableFormatter _columnWidths](self, "_columnWidths");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKTableFormatter _enumerateFormattedRowsWithColumnWidths:handler:](self, "_enumerateFormattedRowsWithColumnWidths:handler:", v5, v4);

}

- (void)_enumerateFormattedRowsWithColumnWidths:(id)a3 handler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  if (-[NSArray count](self->_columns, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        if (-[NSArray count](self->_columns, "count"))
        {
          v11 = 0;
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKTableFormatter _appendColumn:width:padding:row:](self, "_appendColumn:width:padding:row:", v13, objc_msgSend(v14, "integerValue"), CFSTR(" "), v10);

            ++v11;
          }
          while (v11 < -[NSArray count](self->_columns, "count"));
        }
        v6[2](v6, i, v10);

      }
    }
  }

}

- (id)formattedTable
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[HKTableFormatter _columnWidths](self, "_columnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[HKTableFormatter _formattedTableHeaderForColumnWidths:](self, "_formattedTableHeaderForColumnWidths:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__HKTableFormatter_formattedTable__block_invoke;
  v9[3] = &unk_1E37F5BE8;
  v7 = v6;
  v10 = v7;
  -[HKTableFormatter _enumerateFormattedRowsWithColumnWidths:handler:](self, "_enumerateFormattedRowsWithColumnWidths:handler:", v3, v9);

  return v7;
}

uint64_t __34__HKTableFormatter_formattedTable__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), a3);
}

- (id)stringFromDate:(id)a3
{
  return -[HKTableFormatter stringFromDate:fallback:](self, "stringFromDate:fallback:", a3, CFSTR("never"));
}

- (id)stringFromDate:(id)a3 fallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSDateFormatter *v9;
  NSDateFormatter *dateFormatter;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!self->_dateFormatter)
  {
    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v9;

    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
    if (v6)
      goto LABEL_3;
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = v8;

  return v11;
}

- (id)stringFromTimeInterval:(double)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v4 = 0.0;
  HKSeparateTimeIntervalComponents(1, &v6, &v5, &v4, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld:%02ld:%02ld"), v6, v5, (uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end
