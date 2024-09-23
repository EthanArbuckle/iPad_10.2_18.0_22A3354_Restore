@implementation ISHintedValue

- (ISHintedValue)init
{
  return -[ISHintedValue initWithOptions:](self, "initWithOptions:", 0);
}

- (ISHintedValue)initWithOptions:(unint64_t)a3
{
  ISHintedValue *v4;
  uint64_t v5;
  NSMutableArray *dimensions;
  uint64_t v7;
  NSMutableArray *values;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ISHintedValue;
  v4 = -[ISHintedValue init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    dimensions = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    values = v4->_values;
    v4->_values = (NSMutableArray *)v7;

    v4->_options = a3;
  }
  return v4;
}

- (int64_t)indexForSize:(CGSize)a3
{
  double height;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3.width <= a3.height)
    height = a3.height;
  else
    height = a3.width;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_dimensions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "doubleValue", (_QWORD)v13);
        if (height <= v11)
        {
          v10 = v7 + v9;
          goto LABEL_15;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)addHintedValue:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *dimensions;
  void *v16;
  id v17;

  height = a4.height;
  width = a4.width;
  v17 = a3;
  v7 = -[ISHintedValue indexForSize:](self, "indexForSize:", width, height);
  v8 = 0.0;
  if (v7 < -[NSMutableArray count](self->_dimensions, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_dimensions, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v8 = v10;

  }
  if (width <= height)
    v11 = height;
  else
    v11 = width;
  if (v8 <= v11)
  {
    dimensions = self->_dimensions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](dimensions, "addObject:", v16);

    -[NSMutableArray addObject:](self->_values, "addObject:", v17);
  }
  else
  {
    v12 = v7 + ((uint64_t)~v7 >> 63);
    v13 = self->_dimensions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v14, v12);

    -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v17, v12);
  }

}

- (id)hintedValueForSize:(CGSize)a3
{
  return -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", -[ISHintedValue indexForSize:](self, "indexForSize:", a3.width, a3.height));
}

- (id)hintedValueForIndex:(int64_t)a3
{
  unint64_t v5;
  NSMutableArray *values;

  v5 = -[NSMutableArray count](self->_values, "count");
  values = self->_values;
  if (v5 <= a3)
    -[NSMutableArray lastObject](values, "lastObject");
  else
    -[NSMutableArray objectAtIndexedSubscript:](values, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)sizeOutsideHintedRange:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  double v10;

  if (a3.width <= a3.height)
    height = a3.height;
  else
    height = a3.width;
  -[NSMutableArray lastObject](self->_dimensions, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (height > v7)
    return 1;
  -[NSMutableArray firstObject](self->_dimensions, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v8 = height < v10;

  return v8;
}

- (double)scaleFactorForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSMutableArray *dimensions;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  height = a3.height;
  width = a3.width;
  v6 = 1.0;
  if (-[NSMutableArray count](self->_dimensions, "count"))
  {
    if (width <= height)
      width = height;
    -[NSMutableArray lastObject](self->_dimensions, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    dimensions = self->_dimensions;
    if (width > v9)
    {
      -[NSMutableArray lastObject](dimensions, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = v11;
      objc_msgSend(v11, "doubleValue");
      v6 = width / v16;

      return v6;
    }
    -[NSMutableArray firstObject](dimensions, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (width < v14)
    {
      -[NSMutableArray firstObject](self->_dimensions, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  return v6;
}

- (double)interpolationFactorForSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v17;

  height = a3.height;
  width = a3.width;
  v6 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  if (v6 >= (unint64_t)-[NSMutableArray count](self->_dimensions, "count"))
  {
    v6 = -[NSMutableArray count](self->_dimensions, "count") - 1;
    v7 = 1.0;
  }
  else
  {
    v7 = 0.0;
  }
  v8 = v6 - 1;
  if (v6 >= 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_dimensions, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    -[NSMutableArray objectAtIndexedSubscript:](self->_dimensions, "objectAtIndexedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
LABEL_6:

    goto LABEL_8;
  }
  v14 = 0.0;
  v11 = 0.0;
  if (!v6)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_dimensions, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v17;
    goto LABEL_6;
  }
LABEL_8:
  if (width <= height)
    v15 = height;
  else
    v15 = width;
  return v7 + (v15 - v14) / (v11 - v14);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableArray)dimensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
