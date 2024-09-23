@implementation ML3ContainmentPredicate

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", self->super._property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ContainmentPredicate _orderedValues](self, "_orderedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v6);
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v11, "appendString:", CFSTR(" = "));
    objc_msgSend(v11, "appendString:", CFSTR(" ? "));
  }
  else
  {
    objc_msgSend(v11, "appendString:", CFSTR(" IN ("));
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "addObject:", CFSTR("?"));
        ++v9;
      }
      while (v9 < objc_msgSend(v7, "count"));
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v10);

    }
    objc_msgSend(v11, "appendString:", CFSTR(")"));

  }
}

- (id)databaseStatementParameters
{
  void *v2;
  void *v3;

  -[ML3ContainmentPredicate _orderedValues](self, "_orderedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_orderedValues
{
  void *v2;
  void *v3;
  void *v4;

  -[ML3ContainmentPredicate values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)values
{
  return self->_values;
}

- (BOOL)isEqual:(id)a3
{
  ML3ContainmentPredicate *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = (ML3ContainmentPredicate *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainmentPredicate;
    if (-[ML3PropertyPredicate isEqual:](&v9, sel_isEqual_, v4))
    {
      -[ML3ContainmentPredicate values](self, "values");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3ContainmentPredicate values](v4, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:values:", v6, v5);

  return v7;
}

- (ML3ContainmentPredicate)initWithProperty:(id)a3 values:(id)a4
{
  id v7;
  id v8;
  ML3ContainmentPredicate *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ContainmentPredicate;
  v9 = -[ML3PropertyPredicate initWithProperty:](&v12, sel_initWithProperty_, v7);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("ML3Predicate.m"), 329, CFSTR("invalid value (nil) for property %@."), v7);

    }
    -[ML3ContainmentPredicate setValues:](v9, "setValues:", v8);
  }

  return v9;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (ML3ContainmentPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3ContainmentPredicate *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ContainmentPredicate;
  v5 = -[ML3PropertyPredicate initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("values"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ContainmentPredicate setValues:](v5, "setValues:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3ContainmentPredicate;
  v4 = a3;
  -[ML3PropertyPredicate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ML3ContainmentPredicate values](self, "values", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("values"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ML3PropertyPredicate property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ML3ContainmentPredicate values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ML3ContainmentPredicate _orderedValues](self, "_orderedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->super._property, "isEqualToString:", CFSTR("media_type")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          NSStringFromMLMediaType(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "integerValue"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" [%@]"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_1E5B66908;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)ML3ContainmentPredicate;
  -[ML3PropertyPredicate description](&v18, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@(%@ IN (%@)%@"), v15, self->super._property, v3, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ML3PropertyPredicate property](self, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  if (v11)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[ML3ContainmentPredicate values](self, "values", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(v9, "ml_matchesValue:usingComparison:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v5) & 1) != 0)
          {
            v17 = 1;
            goto LABEL_13;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_13:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
