@implementation ML3SearchStringPredicate

- (ML3SearchStringPredicate)initWithConcatenatedProperties:(id)a3 searchString:(id)a4
{
  id v6;
  id v7;
  ML3SearchStringPredicate *v8;
  ML3SearchStringPredicate *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ML3SearchStringPredicate;
  v8 = -[ML3SearchStringPredicate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ML3SearchStringPredicate setProperties:](v8, "setProperties:", v6);
    -[ML3SearchStringPredicate setSearchString:](v9, "setSearchString:", v7);
  }

  return v9;
}

- (ML3SearchStringPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3SearchStringPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ML3SearchStringPredicate;
  v5 = -[ML3Predicate initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("properties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3SearchStringPredicate setProperties:](v5, "setProperties:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3SearchStringPredicate setSearchString:](v5, "setSearchString:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3SearchStringPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ML3SearchStringPredicate properties](self, "properties", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("properties"));

  -[ML3SearchStringPredicate searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("searchString"));

}

- (BOOL)isEqual:(id)a3
{
  ML3SearchStringPredicate *v4;
  id v5;
  id v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (ML3SearchStringPredicate *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ML3SearchStringPredicate;
    if (-[ML3Predicate isEqual:](&v12, sel_isEqual_, v4))
    {
      -[ML3SearchStringPredicate properties](self, "properties");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3SearchStringPredicate properties](v4, "properties");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {

      }
      else
      {
        v7 = objc_msgSend(v5, "isEqual:", v6);

        if (!v7)
        {
          v8 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      -[ML3SearchStringPredicate searchString](self, "searchString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3SearchStringPredicate searchString](v4, "searchString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
        v8 = 1;
      else
        v8 = objc_msgSend(v9, "isEqual:", v10);

      goto LABEL_13;
    }
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3SearchStringPredicate;
  v3 = -[ML3Predicate hash](&v7, sel_hash);
  -[ML3SearchStringPredicate searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[NSArray componentsJoinedByString:](self->_properties, "componentsJoinedByString:", CFSTR(" + "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ML3SearchStringPredicate;
  -[ML3SearchStringPredicate description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@((%@) matches '%@')"), v5, v3, self->_searchString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_properties;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        -[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
              if (!v5)
              {
                objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v5, "addObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSArray count](self->_properties, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR("ML3SearchStringMatch"));
    objc_msgSend(v6, "appendString:", CFSTR("(?, "));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_properties;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          if ((v10 & 1) != 0)
            objc_msgSend(v6, "appendString:", CFSTR(" || ' ' || "));
          -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("coalesce(%@, '')"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v15);

          ++v12;
          v10 = 1;
        }
        while (v9 != v12);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v16 = CFSTR(")");
  }
  else
  {
    v16 = CFSTR("0");
  }
  objc_msgSend(v6, "appendString:", v16);

}

- (id)databaseStatementParameters
{
  const __CFString *searchString;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  searchString = (const __CFString *)self->_searchString;
  if (!searchString)
    searchString = &stru_1E5B66908;
  v4[0] = searchString;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_properties;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[objc_class libraryContentsChangeForProperty:](a3, "libraryContentsChangeForProperty:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithConcatenatedProperties:(id)a3 searchString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConcatenatedProperties:searchString:", v6, v5);

  return v7;
}

@end
