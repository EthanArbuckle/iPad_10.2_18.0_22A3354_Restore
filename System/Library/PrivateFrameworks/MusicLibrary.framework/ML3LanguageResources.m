@implementation ML3LanguageResources

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)sectionsInfo
{
  return self->_sectionsInfo;
}

- (NSString)canonicalLanguageIdentifier
{
  return self->_canonicalLanguageIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3LanguageResources.m"), 56, CFSTR("Encoder %@ does not support keyed coding"), v6);

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionsInfo, CFSTR("ML3LanguageResourcesSectionsInfoKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sortingDetails, CFSTR("ML3LanguageResourcesSortingDetailsKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_canonicalLanguageIdentifier, CFSTR("ML3LanguageResourcesCanonicalLanguageIdentifierKey"));

}

- (NSDictionary)sortingDetails
{
  return self->_sortingDetails;
}

- (ML3LanguageResources)initWithCoder:(id)a3
{
  id v4;
  ML3LanguageResources *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *sectionsInfo;
  void *v10;
  uint64_t v11;
  NSDictionary *sortingDetails;
  void *v13;
  uint64_t v14;
  NSString *canonicalLanguageIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3LanguageResources;
  v5 = -[ML3LanguageResources init](&v17, sel_init);
  if (v5)
  {
    MSVPropertyListDataClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("ML3LanguageResourcesSectionsInfoKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    sectionsInfo = v5->_sectionsInfo;
    v5->_sectionsInfo = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("ML3LanguageResourcesSortingDetailsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    sortingDetails = v5->_sortingDetails;
    v5->_sortingDetails = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ML3LanguageResourcesCanonicalLanguageIdentifierKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    canonicalLanguageIdentifier = v5->_canonicalLanguageIdentifier;
    v5->_canonicalLanguageIdentifier = (NSString *)v14;

  }
  return v5;
}

- (ML3LanguageResources)initWithSectionsInfo:(id)a3 sortingDetails:(id)a4 canonicalLanguageIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ML3LanguageResources *v11;
  uint64_t v12;
  NSDictionary *sectionsInfo;
  uint64_t v14;
  NSDictionary *sortingDetails;
  uint64_t v16;
  NSString *canonicalLanguageIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ML3LanguageResources;
  v11 = -[ML3LanguageResources init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sectionsInfo = v11->_sectionsInfo;
    v11->_sectionsInfo = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    sortingDetails = v11->_sortingDetails;
    v11->_sortingDetails = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    canonicalLanguageIdentifier = v11->_canonicalLanguageIdentifier;
    v11->_canonicalLanguageIdentifier = (NSString *)v16;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalLanguageIdentifier, 0);
  objc_storeStrong((id *)&self->_sortingDetails, 0);
  objc_storeStrong((id *)&self->_sectionsInfo, 0);
}

@end
