@implementation FPSearchQueryDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SRCH");
}

- (id)queryStringForMountPoint:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[FPSearchQueryDescriptor searchQueryString](self, "searchQueryString", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[FPSearchQueryDescriptor searchQueryString](self, "searchQueryString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", &stru_1E4450B40),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[FPSpotlightQueryDescriptor settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedFileTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPSpotlightQueryDescriptor settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "excludedFileTypes");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

    v16 = (void *)*MEMORY[0x1E0CEC4F0];
    objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "containsObject:", v17);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v16, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v20;
    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[FPSearchQueryDescriptor searchQueryString](self, "searchQueryString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPSpotlightQueryDescriptor settings](self, "settings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedProviders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    FPFileProviderOriginatedItemsQueryStringFragment(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    FPContentTypeQueryStringForFileTypes(v10, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "stringWithFormat:", CFSTR("((%@) && %@ && %@)"), v22, v25, v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)augmentQueryContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPSearchQueryDescriptor;
  -[FPSpotlightQueryDescriptor augmentQueryContext:](&v12, sel_augmentQueryContext_, v4);
  -[FPSearchQueryDescriptor _scopes](self, "_scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScopes:", v5);

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FPSpotlightQueryDescriptor settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyboardLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardLanguage:", v11);

  }
}

- (id)_scopes
{
  void *v2;
  void *v3;
  void *v4;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "csQueryScopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToItemQueryDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPSearchQueryDescriptor;
  if (-[FPSpotlightQueryDescriptor isEqualToItemQueryDescriptor:](&v11, sel_isEqualToItemQueryDescriptor_, v4))
  {
    -[FPSearchQueryDescriptor _scopes](self, "_scopes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scopes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[FPSearchQueryDescriptor _scopes](self, "_scopes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_scopes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[FPSearchQueryDescriptor queryStringForMountPoint:](self, "queryStringForMountPoint:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[FPSpotlightQueryDescriptor desiredCount](self, "desiredCount");
  -[FPSearchQueryDescriptor _scopes](self, "_scopes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v4;

  return v7;
}

- (BOOL)keepCollectorsAlive
{
  return 0;
}

- (NSString)searchQueryString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchQueryString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isThirdPartySearchOnServer
{
  return self->_thirdPartySearchOnServer;
}

- (void)setThirdPartySearchOnServer:(BOOL)a3
{
  self->_thirdPartySearchOnServer = a3;
}

- (BOOL)avoidCoreSpotlightSearch
{
  return self->_avoidCoreSpotlightSearch;
}

- (void)setAvoidCoreSpotlightSearch:(BOOL)a3
{
  self->_avoidCoreSpotlightSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryString, 0);
}

@end
