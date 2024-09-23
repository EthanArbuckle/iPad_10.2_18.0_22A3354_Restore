@implementation ICDimensionSumCache

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[ICDimensionSumCache dimensions](self, "dimensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (ICDimensionSumCache)init
{
  -[ICDimensionSumCache doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICDimensionSumCache)initWithKeys:(id)a3 andEstimateDimension:(double)a4
{
  id v6;
  ICDimensionSumCache *v7;
  ICDimensionSumCache *v8;
  unint64_t v9;
  uint64_t v10;
  NSMutableDictionary *dimensions;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICDimensionSumCache;
  v7 = -[ICDimensionSumCache init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_estimateDimension = a4;
    v9 = objc_msgSend(v6, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dimensions = v8->_dimensions;
    v8->_dimensions = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[NSMutableDictionary setObject:forKey:](v8->_dimensions, "setObject:forKey:", v12, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

    -[ICDimensionSumCache setSum:](v8, "setSum:", (double)v9 * a4);
  }

  return v8;
}

- (double)dimensionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[ICDimensionSumCache dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setDimension:(double)a3 forKey:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v6 = a4;
  -[ICDimensionSumCache dimensionForKey:](self, "dimensionForKey:", v6);
  v8 = a3 - v7;
  -[ICDimensionSumCache sum](self, "sum");
  -[ICDimensionSumCache setSum:](self, "setSum:", v9 + v8);
  -[ICDimensionSumCache dimensions](self, "dimensions");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v6);

}

- (void)removeDimensionForKey:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICDimensionSumCache dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICDimensionSumCache dimensionForKey:](self, "dimensionForKey:", v10);
    v7 = v6;
    -[ICDimensionSumCache sum](self, "sum");
    -[ICDimensionSumCache setSum:](self, "setSum:", v8 - v7);
    -[ICDimensionSumCache dimensions](self, "dimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (double)sum
{
  return self->_sum;
}

- (void)setSum:(double)a3
{
  self->_sum = a3;
}

- (double)estimateDimension
{
  return self->_estimateDimension;
}

- (NSMutableDictionary)dimensions
{
  return self->_dimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
