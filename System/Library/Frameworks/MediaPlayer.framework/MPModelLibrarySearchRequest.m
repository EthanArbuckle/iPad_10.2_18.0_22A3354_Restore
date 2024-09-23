@implementation MPModelLibrarySearchRequest

- (id)description
{
  void *v3;
  void *v4;
  NSArray *scopes;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MPModelLibrarySearchRequest;
  -[MPModelLibraryRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  if (self->_searchString)
    objc_msgSend(v3, "appendFormat:", CFSTR(", searchString = %@"), self->_searchString);
  scopes = self->_scopes;
  if (scopes)
  {
    -[NSArray description](scopes, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", scopes = %@"), v6);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (MPModelLibrarySearchRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelLibrarySearchRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *scopes;
  uint64_t v11;
  NSString *searchString;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPModelLibrarySearchRequest;
  v5 = -[MPModelLibraryRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_maximumResultsPerScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelLibrarySearchRequestMaximumResultsPerScope"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPModelLibrarySearchRequestScopes"));
    v9 = objc_claimAutoreleasedReturnValue();
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibrarySearchRequestSearchString"));
    v11 = objc_claimAutoreleasedReturnValue();
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelLibrarySearchRequest;
  -[MPModelLibraryRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumResultsPerScope, CFSTR("MPModelLibrarySearchRequestMaximumResultsPerScope"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scopes, CFSTR("MPModelLibrarySearchRequestScopes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("MPModelLibrarySearchRequestSearchString"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelLibrarySearchRequest;
  v4 = -[MPModelLibraryRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[22] = (id)self->_maximumResultsPerScope;
    objc_storeStrong(v4 + 21, self->_scopes);
    objc_storeStrong(v5 + 23, self->_searchString);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibrarySearchRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibrarySearchRequestOperation);
  -[MPModelLibrarySearchRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);
  -[MPModelLibrarySearchRequestOperation setRequest:](v5, "setRequest:", self);

  return v5;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)maximumResultsPerScope
{
  return self->_maximumResultsPerScope;
}

- (void)setMaximumResultsPerScope:(int64_t)a3
{
  self->_maximumResultsPerScope = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
