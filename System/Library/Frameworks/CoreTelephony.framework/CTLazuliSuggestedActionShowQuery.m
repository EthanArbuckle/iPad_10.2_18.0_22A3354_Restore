@implementation CTLazuliSuggestedActionShowQuery

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionShowQuery query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", query = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionShowQuery:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  -[CTLazuliSuggestedActionShowQuery query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CTLazuliSuggestedActionShowQuery query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionShowQuery *v4;
  CTLazuliSuggestedActionShowQuery *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionShowQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionShowQuery isEqualToCTLazuliSuggestedActionShowQuery:](self, "isEqualToCTLazuliSuggestedActionShowQuery:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionShowQuery *v4;

  v4 = +[CTLazuliSuggestedActionShowQuery allocWithZone:](CTLazuliSuggestedActionShowQuery, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionShowQuery setQuery:](v4, "setQuery:", self->_query);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_query, CFSTR("kQueryKey"));
}

- (CTLazuliSuggestedActionShowQuery)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionShowQuery *v5;
  uint64_t v6;
  NSString *query;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliSuggestedActionShowQuery;
  v5 = -[CTLazuliSuggestedActionShowQuery init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kQueryKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliSuggestedActionShowQuery)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionShowQuery *v4;
  CTLazuliSuggestedActionShowQuery *v5;
  const void *v6;
  uint64_t v7;
  NSString *query;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliSuggestedActionShowQuery;
  v4 = -[CTLazuliSuggestedActionShowQuery init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0)
        v6 = a3;
      else
        v6 = *(const void **)a3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      query = v5->_query;
      v5->_query = (NSString *)v7;
    }
    else
    {
      query = v4->_query;
      v4->_query = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
