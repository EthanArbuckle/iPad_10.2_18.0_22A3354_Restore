@implementation CoreDAVPrincipalPropertySearchTask

- (CoreDAVPrincipalPropertySearchTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4
{
  CoreDAVPrincipalPropertySearchTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CoreDAVPrincipalPropertySearchTask;
  result = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v5, sel_initWithPropertiesToFind_atURL_, a3, a4);
  if (result)
    result->super.super._depth = 2;
  return result;
}

- (CoreDAVPrincipalPropertySearchTask)initWithPropertySearches:(id)a3 propertiesToFind:(id)a4 atURL:(id)a5 applyToPrincipalCollectionSet:(BOOL)a6 extraAttributes:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  CoreDAVPrincipalPropertySearchTask *v14;
  CoreDAVPrincipalPropertySearchTask *v15;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v14 = -[CoreDAVPrincipalPropertySearchTask initWithPropertiesToFind:atURL:](self, "initWithPropertiesToFind:atURL:", a4, a5);
  v15 = v14;
  if (v14)
  {
    -[CoreDAVPrincipalPropertySearchTask setSearchItems:](v14, "setSearchItems:", v12);
    -[CoreDAVPrincipalPropertySearchTask setApplyToPrincipalCollectionSet:](v15, "setApplyToPrincipalCollectionSet:", v8);
    -[CoreDAVPrincipalPropertySearchTask setExtraAttributes:](v15, "setExtraAttributes:", v13);
  }

  return v15;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  void *v3;
  void *v4;
  CoreDAVXMLData *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(CoreDAVXMLData);
    -[CoreDAVPrincipalPropertySearchTask extraAttributes](self, "extraAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVXMLData startElement:inNamespace:withAttributes:](v5, "startElement:inNamespace:withAttributes:", CFSTR("principal-property-search"), CFSTR("DAV:"), v6);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CoreDAVPrincipalPropertySearchTask searchItems](self, "searchItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "write:", v5);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v5, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "nameSpace");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v5, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v18, v19, 0, 0);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }

    -[CoreDAVXMLData endElement:inNamespace:](v5, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
    -[CoreDAVXMLData endElement:inNamespace:](v5, "endElement:inNamespace:", CFSTR("principal-property-search"), CFSTR("DAV:"));
    -[CoreDAVXMLData data](v5, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[CoreDAVPropertyFindBaseTask getTotalFailureError](self, "getTotalFailureError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVPrincipalPropertySearchTask;
  -[CoreDAVPropertyFindBaseTask finishCoreDAVTaskWithError:](&v8, sel_finishCoreDAVTaskWithError_, v6);

}

- (NSSet)searchItems
{
  return self->_searchItems;
}

- (void)setSearchItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchItems, a3);
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setExtraAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extraAttributes, a3);
}

- (BOOL)applyToPrincipalCollectionSet
{
  return self->_applyToPrincipalCollectionSet;
}

- (void)setApplyToPrincipalCollectionSet:(BOOL)a3
{
  self->_applyToPrincipalCollectionSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_searchItems, 0);
}

@end
