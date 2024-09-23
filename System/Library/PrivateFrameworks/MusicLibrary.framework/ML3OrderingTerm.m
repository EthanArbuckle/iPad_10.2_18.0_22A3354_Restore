@implementation ML3OrderingTerm

- (NSString)property
{
  return self->_property;
}

+ (id)orderingTermWithProperty:(id)a3
{
  id v3;
  ML3OrderingTerm *v4;

  v3 = a3;
  v4 = -[ML3OrderingTerm initWithProperty:]([ML3OrderingTerm alloc], "initWithProperty:", v3);

  return v4;
}

- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4 collation:(id)a5
{
  id v8;
  id v9;
  ML3OrderingTerm *v10;
  uint64_t v11;
  NSString *property;
  uint64_t v13;
  NSString *collation;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ML3OrderingTerm;
  v10 = -[ML3OrderingTerm init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    property = v10->_property;
    v10->_property = (NSString *)v11;

    v10->_direction = a4;
    v13 = objc_msgSend(v9, "copy");
    collation = v10->_collation;
    v10->_collation = (NSString *)v13;

  }
  return v10;
}

- (ML3OrderingTerm)initWithProperty:(id)a3
{
  return -[ML3OrderingTerm initWithProperty:direction:collation:](self, "initWithProperty:direction:collation:", a3, 1, 0);
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  _BOOL4 v6;
  NSString *property;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = -[NSString hasPrefix:](self->_property, "hasPrefix:", CFSTR("ML3SpotlightMatch"));
  property = self->_property;
  if (v6)
  {
    objc_msgSend(v10, "appendString:", property);
  }
  else
  {
    -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", property);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v8);

  }
  if (self->_collation)
  {
    objc_msgSend(v10, "appendString:", CFSTR(" COLLATE "));
    objc_msgSend(v10, "appendString:", self->_collation);
  }
  v9 = v10;
  if (self->_direction == 2)
  {
    objc_msgSend(v10, "appendString:", CFSTR(" DESC"));
    v9 = v10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4
{
  return -[ML3OrderingTerm initWithProperty:direction:collation:](self, "initWithProperty:direction:collation:", a3, *(_QWORD *)&a4, 0);
}

+ (id)orderingTermWithProperty:(id)a3 direction:(int)a4
{
  uint64_t v4;
  id v5;
  ML3OrderingTerm *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[ML3OrderingTerm initWithProperty:direction:]([ML3OrderingTerm alloc], "initWithProperty:direction:", v5, v4);

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_property, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSString **v4;
  NSString *property;
  NSString *collation;
  char v7;

  v4 = (NSString **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((property = self->_property, property == v4[2]) || -[NSString isEqual:](property, "isEqual:"))
    && self->_direction == *((_DWORD *)v4 + 2))
  {
    collation = self->_collation;
    if (collation == v4[3])
      v7 = 1;
    else
      v7 = -[NSString isEqual:](collation, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *property;
  id v5;

  property = self->_property;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", property, CFSTR("property"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collation, CFSTR("collation"));

}

- (ML3OrderingTerm)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ML3OrderingTerm *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("property"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ML3OrderingTerm initWithProperty:direction:collation:](self, "initWithProperty:direction:collation:", v5, v6, v7);
  return v8;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (self->_direction == 1)
    v3 = CFSTR("ascending");
  else
    v3 = CFSTR("descending");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ML3OrderingTerm;
  v5 = v3;
  -[ML3OrderingTerm description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(%@ %@)"), v6, self->_property, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)direction
{
  return self->_direction;
}

- (NSString)collation
{
  return self->_collation;
}

+ (id)reversedTerms:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "property", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "direction") == 2)
          v12 = 1;
        else
          v12 = 2;
        +[ML3OrderingTerm orderingTermWithProperty:direction:](ML3OrderingTerm, "orderingTermWithProperty:direction:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
