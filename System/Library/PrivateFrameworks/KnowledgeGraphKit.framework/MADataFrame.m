@implementation MADataFrame

- (MADataFrame)initWithName:(id)a3 rowIndexCache:(id)a4 columnIndexCache:(id)a5 matrix:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  MADataFrame *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  MAFloatMatrix *matrix;
  MADataFrame *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    objc_msgSend(v11, "labels");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = objc_msgSend(v13, "rows");

    if (v15 != v16)
      goto LABEL_8;
  }
  if (v12
    && (objc_msgSend(v12, "labels"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "count"),
        v19 = objc_msgSend(v13, "columns"),
        v17,
        v18 != v19))
  {
LABEL_8:
    v25 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)MADataFrame;
    v20 = -[MADataFrame init](&v27, sel_init);
    if (v20)
    {
      v21 = objc_msgSend(v10, "copy");
      name = v20->_name;
      v20->_name = (NSString *)v21;

      objc_storeStrong((id *)&v20->_rowIndexCache, a4);
      objc_storeStrong((id *)&v20->_columnIndexCache, a5);
      v23 = objc_msgSend(v13, "copy");
      matrix = v20->_matrix;
      v20->_matrix = (MAFloatMatrix *)v23;

    }
    self = v20;
    v25 = self;
  }

  return v25;
}

- (MADataFrame)initWithName:(id)a3 rowLabels:(id)a4 columnLabels:(id)a5 matrix:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MAIndexCache *v14;
  MAIndexCache *v15;
  MADataFrame *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = -[MAIndexCache initWithLabels:]([MAIndexCache alloc], "initWithLabels:", v11);
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v15 = -[MAIndexCache initWithLabels:]([MAIndexCache alloc], "initWithLabels:", v12);
LABEL_6:
  v16 = -[MADataFrame initWithName:rowIndexCache:columnIndexCache:matrix:](self, "initWithName:rowIndexCache:columnIndexCache:matrix:", v10, v14, v15, v13);

  return v16;
}

- (NSArray)rowLabels
{
  return -[MAIndexCache labels](self->_rowIndexCache, "labels");
}

- (NSArray)columnLabels
{
  return -[MAIndexCache labels](self->_columnIndexCache, "labels");
}

- (int64_t)indexOfRowWithLabel:(id)a3
{
  MAIndexCache *rowIndexCache;

  rowIndexCache = self->_rowIndexCache;
  if (rowIndexCache)
    return -[MAIndexCache indexOfLabel:](rowIndexCache, "indexOfLabel:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexOfColumnWithLabel:(id)a3
{
  MAIndexCache *columnIndexCache;

  columnIndexCache = self->_columnIndexCache;
  if (columnIndexCache)
    return -[MAIndexCache indexOfLabel:](columnIndexCache, "indexOfLabel:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (float)floatAtRowIndex:(int64_t)a3 columnIndex:(int64_t)a4
{
  float result;

  -[MAFloatMatrix floatAtRow:column:](self->_matrix, "floatAtRow:column:", a3, a4);
  return result;
}

- (id)numberAtRow:(id)a3 column:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = -[MADataFrame indexOfRowWithLabel:](self, "indexOfRowWithLabel:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL
    || (v8 = v7,
        v9 = -[MADataFrame indexOfColumnWithLabel:](self, "indexOfColumnWithLabel:", v6),
        v9 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[MAFloatMatrix floatAtRow:column:](self->_matrix, "floatAtRow:column:", v8, v9);
    objc_msgSend(v11, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)dataFrameByAppendingColumnsOfDataFrame:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  MAIndexCache *rowIndexCache;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  MAFloatMatrix *matrix;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MAIndexCache *v24;
  MADataFrame *v25;

  v6 = a3;
  v7 = a4;
  rowIndexCache = self->_rowIndexCache;
  if (!rowIndexCache)
  {
    objc_msgSend(v6, "rowIndexCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
    rowIndexCache = self->_rowIndexCache;
  }
  objc_msgSend(v6, "rowIndexCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MAIndexCache isEqual:](rowIndexCache, "isEqual:", v10);

  if (!v11)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v12 = self->_columnIndexCache != 0;
  objc_msgSend(v6, "rowIndexCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_9;
  v15 = -[MAFloatMatrix rows](self->_matrix, "rows");
  objc_msgSend(v6, "matrix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rows");

  if (v15 != v17)
    goto LABEL_9;
  matrix = self->_matrix;
  objc_msgSend(v6, "matrix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAFloatMatrix matrixByAppendingColumnsOfMatrix:](matrix, "matrixByAppendingColumnsOfMatrix:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAIndexCache labels](self->_columnIndexCache, "labels");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnLabels");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = -[MAIndexCache initWithLabels:]([MAIndexCache alloc], "initWithLabels:", v23);
  else
    v24 = 0;
  v25 = -[MADataFrame initWithName:rowIndexCache:columnIndexCache:matrix:]([MADataFrame alloc], "initWithName:rowIndexCache:columnIndexCache:matrix:", v7, self->_rowIndexCache, v24, v20);

LABEL_10:
  return v25;
}

- (id)csvString
{
  MAIndexCache *columnIndexCache;
  MAIndexCache *rowIndexCache;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  float v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  rowIndexCache = self->_rowIndexCache;
  columnIndexCache = self->_columnIndexCache;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (columnIndexCache)
  {
    if (rowIndexCache)
      objc_msgSend(v5, "appendString:", CFSTR("Index"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MAIndexCache labels](self->_columnIndexCache, "labels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "appendFormat:", CFSTR(",%@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  if (-[MAFloatMatrix rows](self->_matrix, "rows") >= 1)
  {
    v12 = 0;
    do
    {
      if (rowIndexCache)
      {
        -[MAIndexCache labels](self->_rowIndexCache, "labels");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v14);

      }
      if (-[MAFloatMatrix columns](self->_matrix, "columns") >= 1)
      {
        v15 = 0;
        do
        {
          -[MAFloatMatrix floatAtRow:column:](self->_matrix, "floatAtRow:column:", v12, v15);
          objc_msgSend(v6, "appendFormat:", CFSTR(",%f"), v16);
          ++v15;
        }
        while (v15 < -[MAFloatMatrix columns](self->_matrix, "columns"));
      }
      objc_msgSend(v6, "appendString:", CFSTR("\n"));
      ++v12;
    }
    while (v12 < -[MAFloatMatrix rows](self->_matrix, "rows"));
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MADataFrame *v4;
  MADataFrame *v5;
  MADataFrame *v6;
  NSString *name;
  void *v8;
  int v9;
  MAIndexCache *rowIndexCache;
  void *v11;
  _BOOL4 v12;
  MAIndexCache *columnIndexCache;
  void *v14;
  _BOOL4 v15;
  MAFloatMatrix *matrix;
  void *v17;
  char v18;

  v4 = (MADataFrame *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      name = self->_name;
      if (name)
      {
        -[MADataFrame name](v5, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSString isEqual:](name, "isEqual:", v8);

        if (!v9)
          goto LABEL_12;
      }
      rowIndexCache = self->_rowIndexCache;
      if (rowIndexCache)
      {
        -[MADataFrame rowIndexCache](v6, "rowIndexCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MAIndexCache isEqual:](rowIndexCache, "isEqual:", v11);

        if (!v12)
          goto LABEL_12;
      }
      columnIndexCache = self->_columnIndexCache;
      if (columnIndexCache
        && (-[MADataFrame columnIndexCache](v6, "columnIndexCache"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = -[MAIndexCache isEqual:](columnIndexCache, "isEqual:", v14),
            v14,
            !v15))
      {
LABEL_12:
        v18 = 0;
      }
      else
      {
        matrix = self->_matrix;
        -[MADataFrame matrix](v6, "matrix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MAFloatMatrix isEqual:](matrix, "isEqual:", v17);

      }
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[MAIndexCache hash](self->_rowIndexCache, "hash") ^ v3;
  v5 = -[MAIndexCache hash](self->_columnIndexCache, "hash");
  return v4 ^ v5 ^ -[MAFloatMatrix hash](self->_matrix, "hash");
}

- (NSString)name
{
  return self->_name;
}

- (MAIndexCache)rowIndexCache
{
  return self->_rowIndexCache;
}

- (MAIndexCache)columnIndexCache
{
  return self->_columnIndexCache;
}

- (MAFloatMatrix)matrix
{
  return self->_matrix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matrix, 0);
  objc_storeStrong((id *)&self->_columnIndexCache, 0);
  objc_storeStrong((id *)&self->_rowIndexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
