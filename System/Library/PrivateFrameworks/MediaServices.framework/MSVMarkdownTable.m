@implementation MSVMarkdownTable

- (MSVMarkdownTable)init
{
  MSVMarkdownTable *v2;
  uint64_t v3;
  NSMutableArray *columnHeaders;
  uint64_t v5;
  NSMutableArray *columnAlignments;
  uint64_t v7;
  NSMutableArray *rows;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSVMarkdownTable;
  v2 = -[MSVMarkdownTable init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    columnHeaders = v2->_columnHeaders;
    v2->_columnHeaders = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    columnAlignments = v2->_columnAlignments;
    v2->_columnAlignments = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    rows = v2->_rows;
    v2->_rows = (NSMutableArray *)v7;

  }
  return v2;
}

- (NSArray)columnHeaders
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_columnHeaders, "copy");
}

- (void)addColumnWithHeader:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  -[NSMutableArray addObject:](self->_columnHeaders, "addObject:", a3);
  -[NSMutableArray addObject:](self->_columnAlignments, "addObject:", &unk_1E43FC730);
  if (-[NSMutableArray count](self->_rows, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObject:", &stru_1E43EA7B0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v6, v4);
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_rows, "count"));
  }
}

- (void)insertColumnWithHeader:(id)a3 atIndex:(int64_t)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableArray insertObject:atIndex:](self->_columnHeaders, "insertObject:atIndex:", a3);
  -[NSMutableArray insertObject:atIndex:](self->_columnAlignments, "insertObject:atIndex:", &unk_1E43FC730, a4);
  if (-[NSMutableArray count](self->_rows, "count"))
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v8, "insertObject:atIndex:", &stru_1E43EA7B0, a4);
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v9, v6);

      ++v6;
    }
    while (v6 < -[NSMutableArray count](self->_rows, "count"));
  }
}

- (void)removeColumnAtIndex:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSMutableArray removeObjectAtIndex:](self->_columnHeaders, "removeObjectAtIndex:");
  -[NSMutableArray removeObjectAtIndex:](self->_columnAlignments, "removeObjectAtIndex:", a3);
  if (-[NSMutableArray count](self->_rows, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v7, "removeObjectAtIndex:", a3);
      v8 = (void *)objc_msgSend(v7, "copy");
      -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v8, v5);

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_rows, "count"));
  }
}

- (int64_t)alignmentForColumnAtIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_columnAlignments, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setAlignment:(int64_t)a3 forColumnAtIndex:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_columnAlignments, "setObject:atIndexedSubscript:", v6, a4);

}

- (NSArray)rows
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_rows, "copy");
}

- (void)addRow:(id)a3
{
  uint64_t v5;
  NSMutableArray *rows;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(v9, "count");
  if (v5 != -[NSMutableArray count](self->_columnHeaders, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVMarkdownTable.m"), 108, CFSTR("Row elements must match current table column count: %ld"), -[NSMutableArray count](self->_columnHeaders, "count"));

  }
  rows = self->_rows;
  v7 = (void *)objc_msgSend(v9, "copy");
  -[NSMutableArray addObject:](rows, "addObject:", v7);

}

- (void)insertRow:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7;
  NSMutableArray *rows;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = objc_msgSend(v11, "count");
  if (v7 != -[NSMutableArray count](self->_columnHeaders, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVMarkdownTable.m"), 114, CFSTR("Row elements must match current table column count: %ld"), -[NSMutableArray count](self->_columnHeaders, "count"));

  }
  rows = self->_rows;
  v9 = (void *)objc_msgSend(v11, "copy");
  -[NSMutableArray insertObject:atIndex:](rows, "insertObject:atIndex:", v9, a4);

}

- (void)removeRowAtIndex:(int64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_rows, "removeObjectAtIndex:", a3);
}

- (id)cellAtColumn:(int64_t)a3 row:(int64_t)a4
{
  void *v5;
  void *v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCell:(id)a3 atColumn:(int64_t)a4 row:(int64_t)a5
{
  NSMutableArray *rows;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  rows = self->_rows;
  v9 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](rows, "objectAtIndexedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "mutableCopy");

  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v13, "setObject:atIndexedSubscript:", v11, a4);

  v12 = (void *)objc_msgSend(v13, "copy");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v12, a5);

}

- (id)renderMarkdownWithOptions:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __CFString *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t k;
  void *v29;
  unint64_t v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v47;
  void *v48;
  char v49;

  v3 = a3;
  v5 = -[NSMutableArray count](self->_columnHeaders, "count");
  if (v5)
  {
    v6 = v5;
    v7 = v3 | 6;
    if ((v3 & 6) != 0)
      v7 = v3;
    v47 = v5;
    v49 = v7;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 >= 1)
      {
        for (i = 0; i != v47; ++i)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_columnHeaders, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length");

          if (-[NSMutableArray count](self->_rows, "count"))
          {
            v12 = 0;
            do
            {
              -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", i);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v49 & 8) == 0)
              {
                objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR("&#124;"));
                v15 = objc_claimAutoreleasedReturnValue();

                v14 = (void *)v15;
              }
              v16 = objc_msgSend(v14, "length");
              if (v11 <= v16)
                v11 = v16;

              ++v12;
            }
            while (v12 < -[NSMutableArray count](self->_rows, "count"));
          }
          if (v11 <= 3)
            v17 = 3;
          else
            v17 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:atIndexedSubscript:", v18, i);

        }
        v6 = v47;
      }
    }
    else
    {
      v48 = 0;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 250* -[NSMutableArray count](self->_columnHeaders, "count")* -[NSMutableArray count](self->_rows, "count"));
    v20 = v19;
    if ((v49 & 2) != 0)
    {
      objc_msgSend(v19, "appendString:", CFSTR("|"));
      if (v6 <= 0)
      {
        objc_msgSend(v20, "appendString:", CFSTR("\n|"));
      }
      else
      {
        for (j = 0; j != v6; ++j)
        {
          objc_msgSend(v20, "appendString:", CFSTR(" "));
          if ((v49 & 1) != 0)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_columnAlignments, "objectAtIndexedSubscript:", j);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "integerValue");

            objc_msgSend(v48, "objectAtIndexedSubscript:", j);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "integerValue");

            -[NSMutableArray objectAtIndexedSubscript:](self->_columnHeaders, "objectAtIndexedSubscript:", j);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSVMarkdownTable _formatString:withWidth:alignment:](self, "_formatString:withWidth:alignment:", v22, v26, v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v27);

          }
          else
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_columnHeaders, "objectAtIndexedSubscript:", j);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v22);
          }

          objc_msgSend(v20, "appendString:", CFSTR(" |"));
        }
        objc_msgSend(v20, "appendString:", CFSTR("\n|"));
        for (k = 0; k != v47; ++k)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_columnAlignments, "objectAtIndexedSubscript:", k);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "integerValue");

          if (v30 > 3)
            v31 = 0;
          else
            v31 = off_1E43E9308[v30];
          if ((v49 & 1) != 0)
          {
            objc_msgSend(v48, "objectAtIndexedSubscript:", k);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "integerValue");

            objc_msgSend(&stru_1E43EA7B0, "stringByPaddingToLength:withString:startingAtIndex:", v33, CFSTR("-"), 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByReplacingCharactersInRange:withString:](v31, "stringByReplacingCharactersInRange:withString:", 1, 3, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v35);

          }
          else
          {
            objc_msgSend(v20, "appendString:", v31);
          }
          objc_msgSend(v20, "appendString:", CFSTR("|"));
        }
      }
      objc_msgSend(v20, "appendString:", CFSTR("\n"));
      v6 = v47;
    }
    if ((v49 & 4) != 0 && -[NSMutableArray count](self->_rows, "count"))
    {
      v36 = 0;
      do
      {
        objc_msgSend(v20, "appendString:", CFSTR("|"));
        if (v6 >= 1)
        {
          for (m = 0; m != v6; ++m)
          {
            objc_msgSend(v20, "appendString:", CFSTR(" "));
            -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectAtIndexedSubscript:", m);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v49 & 8) == 0)
            {
              objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR("&#124;"));
              v40 = objc_claimAutoreleasedReturnValue();

              v39 = (void *)v40;
            }
            if ((v49 & 1) != 0)
            {
              -[NSMutableArray objectAtIndexedSubscript:](self->_columnAlignments, "objectAtIndexedSubscript:", m);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "integerValue");

              objc_msgSend(v48, "objectAtIndexedSubscript:", m);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "integerValue");

              -[MSVMarkdownTable _formatString:withWidth:alignment:](self, "_formatString:withWidth:alignment:", v39, v44, v42);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "appendString:", v45);

              v6 = v47;
            }
            else
            {
              objc_msgSend(v20, "appendString:", v39);
            }
            objc_msgSend(v20, "appendString:", CFSTR(" |"));

          }
        }
        objc_msgSend(v20, "appendString:", CFSTR("\n"));
        ++v36;
      }
      while (v36 < -[NSMutableArray count](self->_rows, "count"));
    }
    v8 = (__CFString *)objc_msgSend(v20, "copy");

  }
  else
  {
    v8 = &stru_1E43EA7B0;
  }
  return v8;
}

- (id)_formatString:(id)a3 withWidth:(int64_t)a4 alignment:(int64_t)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = v8;
  if ((unint64_t)a5 < 2)
  {
    objc_msgSend(v8, "stringByPaddingToLength:withString:startingAtIndex:", a4, CFSTR(" "), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5 == 2)
  {
    objc_msgSend(&stru_1E43EA7B0, "stringByPaddingToLength:withString:startingAtIndex:", (unint64_t)(a4 - objc_msgSend(v8, "length")) >> 1, CFSTR(" "), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByPaddingToLength:withString:startingAtIndex:", a4, CFSTR(" "), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5 == 3)
  {
    objc_msgSend(&stru_1E43EA7B0, "stringByPaddingToLength:withString:startingAtIndex:", a4 - objc_msgSend(v8, "length"), CFSTR(" "), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_columnAlignments, 0);
  objc_storeStrong((id *)&self->_columnHeaders, 0);
}

+ (id)escapedString:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(v3, "characterAtIndex:", v4);
      if (v6 == 95 && (v5 & 1) != 0)
        break;
      v5 |= v6 == 95;
      if (++v4 >= (unint64_t)objc_msgSend(v3, "length"))
        return v3;
    }
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("\\_"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  return v3;
}

@end
