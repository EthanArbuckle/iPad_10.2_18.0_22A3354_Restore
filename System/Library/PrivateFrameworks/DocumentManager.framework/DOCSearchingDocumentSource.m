@implementation DOCSearchingDocumentSource

- (DOCSearchingDocumentSource)initWithProviderDomain:(id)a3
{
  id v5;
  DOCSearchingDocumentSource *v6;
  DOCSearchingDocumentSource *v7;
  void *v8;
  void *v9;
  DOCSearchingDocumentSource *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DOCSearchingDocumentSource;
  v6 = -[DOCDocumentSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_providerDomain, a3);
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setIdentifier:](v7, "setIdentifier:", v8);

    DOCLocalizedDisplayName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setDisplayName:](v7, "setDisplayName:", v9);

    -[DOCDocumentSource setSearching_fileProviderDomain:](v7, "setSearching_fileProviderDomain:", v5);
    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerDomain, 0);
}

- (id)supportedSearchFilters
{
  return (id)-[FPProviderDomain supportedSearchFilters](self->_providerDomain, "supportedSearchFilters");
}

- (id)loadIconForSize:(int64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "iconForFileProvider:size:", self->_providerDomain, a3);
}

@end
