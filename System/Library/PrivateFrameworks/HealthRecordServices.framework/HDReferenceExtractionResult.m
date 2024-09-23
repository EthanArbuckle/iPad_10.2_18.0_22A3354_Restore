@implementation HDReferenceExtractionResult

- (HDReferenceExtractionResult)initWithCompleteResources:(id)a3 incompleteResources:(id)a4 unresolvableReferences:(id)a5 nextSearchResultURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDReferenceExtractionResult *v14;
  uint64_t v15;
  NSArray *completeResources;
  uint64_t v17;
  NSArray *incompleteResources;
  uint64_t v19;
  NSArray *unresolvableReferences;
  uint64_t v21;
  NSURL *nextSearchResultURL;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[HDReferenceExtractionResult init](self, "init");
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    completeResources = v14->_completeResources;
    v14->_completeResources = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    incompleteResources = v14->_incompleteResources;
    v14->_incompleteResources = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    unresolvableReferences = v14->_unresolvableReferences;
    v14->_unresolvableReferences = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    nextSearchResultURL = v14->_nextSearchResultURL;
    v14->_nextSearchResultURL = (NSURL *)v21;

  }
  return v14;
}

- (HDReferenceExtractionResult)initWithCoder:(id)a3
{
  id v4;
  HDReferenceExtractionResult *v5;
  void *v6;
  uint64_t v7;
  NSArray *completeResources;
  void *v9;
  uint64_t v10;
  NSArray *incompleteResources;
  uint64_t v12;
  NSArray *unresolvableReferences;
  uint64_t v14;
  NSURL *nextSearchResultURL;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDReferenceExtractionResult;
  v5 = -[HDReferenceExtractionResult init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("CompleteResources"));
    v7 = objc_claimAutoreleasedReturnValue();
    completeResources = v5->_completeResources;
    v5->_completeResources = (NSArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("IncompleteResources"));
    v10 = objc_claimAutoreleasedReturnValue();
    incompleteResources = v5->_incompleteResources;
    v5->_incompleteResources = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("UnresolvableReferences"));
    v12 = objc_claimAutoreleasedReturnValue();
    unresolvableReferences = v5->_unresolvableReferences;
    v5->_unresolvableReferences = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NextSearchResult"));
    v14 = objc_claimAutoreleasedReturnValue();
    nextSearchResultURL = v5->_nextSearchResultURL;
    v5->_nextSearchResultURL = (NSURL *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *completeResources;
  id v5;

  completeResources = self->_completeResources;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", completeResources, CFSTR("CompleteResources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incompleteResources, CFSTR("IncompleteResources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unresolvableReferences, CFSTR("UnresolvableReferences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextSearchResultURL, CFSTR("NextSearchResult"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@> %lu complete resources, %lu incomplete resources, %lu incompletable resources"), objc_opt_class(), -[NSArray count](self->_completeResources, "count"), -[NSArray count](self->_incompleteResources, "count"), -[NSArray count](self->_unresolvableReferences, "count"));
}

- (NSArray)completeResources
{
  return self->_completeResources;
}

- (NSArray)incompleteResources
{
  return self->_incompleteResources;
}

- (NSArray)unresolvableReferences
{
  return self->_unresolvableReferences;
}

- (NSURL)nextSearchResultURL
{
  return self->_nextSearchResultURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSearchResultURL, 0);
  objc_storeStrong((id *)&self->_unresolvableReferences, 0);
  objc_storeStrong((id *)&self->_incompleteResources, 0);
  objc_storeStrong((id *)&self->_completeResources, 0);
}

@end
