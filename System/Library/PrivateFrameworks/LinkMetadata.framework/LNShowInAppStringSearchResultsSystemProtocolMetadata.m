@implementation LNShowInAppStringSearchResultsSystemProtocolMetadata

- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithSearchScopes:(id)a3
{
  id v5;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v6;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v7;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNShowInAppStringSearchResultsSystemProtocolMetadata;
  v6 = -[LNShowInAppStringSearchResultsSystemProtocolMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchScopes, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNShowInAppStringSearchResultsSystemProtocolMetadata searchScopes](self, "searchScopes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("searchScopes"));

}

- (LNShowInAppStringSearchResultsSystemProtocolMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("searchScopes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNShowInAppStringSearchResultsSystemProtocolMetadata initWithSearchScopes:](self, "initWithSearchScopes:", v8);
  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNShowInAppStringSearchResultsSystemProtocolMetadata searchScopes](self, "searchScopes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, searchScopes: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNShowInAppStringSearchResultsSystemProtocolMetadata searchScopes](self, "searchScopes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v4;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v5;
  LNShowInAppStringSearchResultsSystemProtocolMetadata *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (LNShowInAppStringSearchResultsSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNShowInAppStringSearchResultsSystemProtocolMetadata searchScopes](self, "searchScopes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNShowInAppStringSearchResultsSystemProtocolMetadata searchScopes](v6, "searchScopes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToArray:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSArray)searchScopes
{
  return self->_searchScopes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchScopes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
