@implementation ML3ContainsPredicate

- (ML3ContainsPredicate)initWithProperty:(id)a3 values:(id)a4
{
  id v6;
  ML3ContainsPredicate *v7;
  ML3ContainsPredicate *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ML3ContainsPredicate;
  v7 = -[ML3PropertyPredicate initWithProperty:](&v10, sel_initWithProperty_, a3);
  v8 = v7;
  if (v7)
    -[ML3ContainsPredicate setValues:](v7, "setValues:", v6);

  return v8;
}

- (ML3ContainsPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3ContainsPredicate *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3ContainsPredicate;
  v5 = -[ML3PropertyPredicate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    MSVPropertyListDataClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3ContainsPredicate setValues:](v5, "setValues:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3ContainsPredicate;
  v4 = a3;
  -[ML3PropertyPredicate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ML3ContainsPredicate values](self, "values", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("values"));

}

- (BOOL)isEqual:(id)a3
{
  ML3ContainsPredicate *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = (ML3ContainsPredicate *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainsPredicate;
    if (-[ML3PropertyPredicate isEqual:](&v9, sel_isEqual_, v4))
    {
      -[ML3ContainsPredicate values](self, "values");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3ContainsPredicate values](v4, "values");
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3ContainsPredicate;
  -[ML3PropertyPredicate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@ IN %@)"), v4, self->super._property, self->_values);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", self->super._property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v6);

  objc_msgSend(v10, "appendString:", CFSTR(" IN ("));
  v7 = objc_msgSend(self->_values, "count");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v10, "appendString:", CFSTR("?"));
    v9 = v8 - 1;
    if (v8 != 1)
    {
      do
      {
        objc_msgSend(v10, "appendString:", CFSTR(",?"));
        --v9;
      }
      while (v9);
    }
  }
  objc_msgSend(v10, "appendString:", CFSTR(")"));

}

- (id)databaseStatementParameters
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_values)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(self->_values, "count"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_values;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
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
    v12 = self->_values;
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
          if ((objc_msgSend(v9, "ml_matchesValue:usingComparison:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v5, (_QWORD)v19) & 1) != 0)
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

- (id)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_values, 0);
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:values:", v7, v6);

  return v8;
}

+ (id)predicateWithProperty:(id)a3 valueSet:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:values:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
