@implementation MASeries

- (MASeries)initWithName:(id)a3 indexCache:(id)a4 vector:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  MASeries *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  MAFloatVector *vector;
  MASeries *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9
    && (objc_msgSend(v9, "labels"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v13 = objc_msgSend(v10, "count"),
        v11,
        v12 != v13))
  {
    v19 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MASeries;
    v14 = -[MASeries init](&v21, sel_init);
    if (v14)
    {
      v15 = objc_msgSend(v8, "copy");
      name = v14->_name;
      v14->_name = (NSString *)v15;

      v17 = objc_msgSend(v10, "copy");
      vector = v14->_vector;
      v14->_vector = (MAFloatVector *)v17;

      objc_storeStrong((id *)&v14->_indexCache, a4);
    }
    self = v14;
    v19 = self;
  }

  return v19;
}

- (MASeries)initWithName:(id)a3 labels:(id)a4 vector:(id)a5
{
  id v8;
  id v9;
  id v10;
  MASeries *v11;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v10 = a4;
    a4 = -[MAIndexCache initWithLabels:]([MAIndexCache alloc], "initWithLabels:", v10);

  }
  v11 = -[MASeries initWithName:indexCache:vector:](self, "initWithName:indexCache:vector:", v8, a4, v9);

  return v11;
}

- (NSArray)labels
{
  return -[MAIndexCache labels](self->_indexCache, "labels");
}

- (float)valueAtIndex:(int64_t)a3
{
  float result;

  -[MAFloatVector floatAtIndex:](self->_vector, "floatAtIndex:", a3);
  return result;
}

- (id)valueForLabel:(id)a3
{
  id v4;
  MAIndexCache *v5;
  MAIndexCache *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = self->_indexCache;
  v6 = v5;
  if (v5 && (v7 = -[MAIndexCache indexOfLabel:](v5, "indexOfLabel:", v4), v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[MASeries valueAtIndex:](self, "valueAtIndex:", v7);
    objc_msgSend(v9, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)valueByLabels
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "init");
  v4 = (void *)objc_msgSend(v3, "alloc");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MASeries labels](self, "labels", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[MASeries valueForLabel:](self, "valueForLabel:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MASeries *v4;
  MASeries *v5;
  MASeries *v6;
  NSString *name;
  void *v8;
  int v9;
  MAIndexCache *indexCache;
  void *v11;
  _BOOL4 v12;
  MAFloatVector *vector;
  void *v14;
  char v15;

  v4 = (MASeries *)a3;
  if (v4 == self)
  {
    v15 = 1;
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
        -[MASeries name](v5, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSString isEqual:](name, "isEqual:", v8);

        if (!v9)
          goto LABEL_10;
      }
      indexCache = self->_indexCache;
      if (indexCache
        && (-[MASeries indexCache](v6, "indexCache"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = -[MAIndexCache isEqual:](indexCache, "isEqual:", v11),
            v11,
            !v12))
      {
LABEL_10:
        v15 = 0;
      }
      else
      {
        vector = self->_vector;
        -[MASeries vector](v6, "vector");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MAFloatVector isEqual:](vector, "isEqual:", v14);

      }
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[MAIndexCache hash](self->_indexCache, "hash") ^ v3;
  return v4 ^ -[MAFloatVector hash](self->_vector, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MASeries name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MASeries labels](self, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MASeries vector](self, "vector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@\n%@\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (MAIndexCache)indexCache
{
  return self->_indexCache;
}

- (MAFloatVector)vector
{
  return self->_vector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_indexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
