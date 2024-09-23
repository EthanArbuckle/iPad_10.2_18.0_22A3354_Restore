@implementation MPMediaLibraryEntityTranslationContext

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (MPModelKind)modelKind
{
  return self->_modelKind;
}

- (BOOL)isMultiQuery
{
  return self->_multiQuery;
}

- (NSString)personID
{
  NSString **p_personID;
  NSUInteger v3;
  id *v4;

  p_personID = &self->_personID;
  v3 = -[NSString length](self->_personID, "length");
  v4 = (id *)MEMORY[0x1E0DDBEC8];
  if (v3)
    v4 = (id *)p_personID;
  return (NSString *)*v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyFilters, 0);
  objc_storeStrong((id *)&self->_filterText, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_modelKind, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (void)setModelKind:(id)a3
{
  objc_storeStrong((id *)&self->_modelKind, a3);
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (BOOL)sortUsingAllowedEntityIdentifiers
{
  return self->_sortUsingAllowedEntityIdentifiers;
}

- (NSArray)propertyFilters
{
  return self->_propertyFilters;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (void)setScopedContainers:(id)a3
{
  objc_storeStrong((id *)&self->_scopedContainers, a3);
}

- (void)setPropertyFilters:(id)a3
{
  objc_storeStrong((id *)&self->_propertyFilters, a3);
}

- (void)setMultiQuery:(BOOL)a3
{
  self->_multiQuery = a3;
}

- (void)setFilteringOptions:(unint64_t)a3
{
  self->_filteringOptions = a3;
}

- (void)setFilterText:(id)a3
{
  objc_storeStrong((id *)&self->_filterText, a3);
}

- (void)setAllowedEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allowedEntityIdentifiers, a3);
}

- (NSArray)allowedEntityIdentifiers
{
  return self->_allowedEntityIdentifiers;
}

- (NSString)filterText
{
  return self->_filterText;
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[MPMediaLibraryEntityTranslationContext mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaLibrary:", v6);

  -[MPMediaLibraryEntityTranslationContext allowedEntityIdentifiers](self, "allowedEntityIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  objc_msgSend(v5, "setAllowedEntityIdentifiers:", v8);

  -[MPMediaLibraryEntityTranslationContext scopedContainers](self, "scopedContainers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v5, "setScopedContainers:", v10);

  objc_msgSend(v5, "setMultiQuery:", -[MPMediaLibraryEntityTranslationContext isMultiQuery](self, "isMultiQuery"));
  objc_msgSend(v5, "setSortUsingAllowedEntityIdentifiers:", -[MPMediaLibraryEntityTranslationContext sortUsingAllowedEntityIdentifiers](self, "sortUsingAllowedEntityIdentifiers"));
  objc_msgSend(v5, "setFilteringOptions:", -[MPMediaLibraryEntityTranslationContext filteringOptions](self, "filteringOptions"));
  -[MPMediaLibraryEntityTranslationContext modelKind](self, "modelKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModelKind:", v11);

  -[MPMediaLibraryEntityTranslationContext personID](self, "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPersonID:", v13);

  -[MPMediaLibraryEntityTranslationContext filterText](self, "filterText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setFilterText:", v15);

  -[MPMediaLibraryEntityTranslationContext propertyFilters](self, "propertyFilters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setPropertyFilters:", v17);

  return v5;
}

- (void)setSortUsingAllowedEntityIdentifiers:(BOOL)a3
{
  self->_sortUsingAllowedEntityIdentifiers = a3;
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

@end
