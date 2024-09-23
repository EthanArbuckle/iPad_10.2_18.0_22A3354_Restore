@implementation MPModelStoreGroupingsMusicKitRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSIndexSet *v27;
  NSObject *v28;
  NSIndexSet *allowedFCKinds;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  MPStoreModelRequestConfiguration *v39;
  MPStoreModelRequestConfiguration *v40;
  NSObject *v42;
  void *v43;
  id *v44;
  MPModelStoreGroupingsMusicKitRequestOperation *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  uint8_t v59[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_storeURLBag, a3);
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "filteringPolicy") == 1)
  {
    objc_msgSend(v7, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("carPlayFCKindAllowList"));
      v11 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        v43 = v10;
        v44 = a4;
        v45 = self;
        v46 = v8;
        v47 = v7;
        v12 = -[NSObject copy](v11, "copy");
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1E3163D10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1E3163D10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E3163D10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E3163D10);
        v16 = objc_claimAutoreleasedReturnValue();

        v42 = v16;
        -[NSObject componentsSeparatedByString:](v16, "componentsSeparatedByString:", CFSTR(","));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_opt_new();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v53 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "integerValue");
              if (v25 < 0)
              {
                v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v58 = v24;
                  _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_INFO, "Encountered negative FCKind in CarPlay FCKinds allow list in bag, dropping it: %{public}@", buf, 0xCu);
                }

              }
              else
              {
                objc_msgSend(v18, "addIndex:", v25);
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
          }
          while (v21);
        }

        v27 = (NSIndexSet *)objc_msgSend(v18, "copy");
        v8 = v46;
        v7 = v47;
        a4 = v44;
        self = v45;
        v10 = v43;
        v28 = v42;
      }
      else
      {
        v28 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v59 = 138543362;
          v60 = v10;
          _os_log_impl(&dword_193B9B000, v28, OS_LOG_TYPE_INFO, "CarPlay FCKinds allow list not found in musicSubscription dictionary, wrongly typed or empty: %{public}@", v59, 0xCu);
        }
        v27 = 0;
      }

    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_INFO, "No music subscription dictionary in bag, can't get allowed FCKinds for CarPlay", v59, 2u);
      }
      v27 = 0;
    }

    allowedFCKinds = self->_allowedFCKinds;
    self->_allowedFCKinds = v27;

  }
  objc_msgSend(v8, "loadAdditionalContentURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30
    || (-[MPModelStoreGroupingsMusicKitRequestOperation catalogURLWithStoreURLBag:](self, "catalogURLWithStoreURLBag:", v7), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v31 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHTTPMethod:", CFSTR("GET"));
    -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
    objc_msgSend(v32, "setTimeoutInterval:");
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v31, "addObject:", v33);

    -[MPModelStoreGroupingsMusicKitRequestOperation additionalURLRequestsWithStoreURLBag:](self, "additionalURLRequestsWithStoreURLBag:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(v31, "addObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v36);
    }
    v39 = -[MPStoreModelRequestConfiguration initWithURLRequests:]([MPStoreModelRequestConfiguration alloc], "initWithURLRequests:", v31);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7201, 0);
    v30 = 0;
    v39 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
    v39 = 0;
  }
  v40 = v39;

  return v40;
}

- (id)additionalURLRequestsWithStoreURLBag:(id)a3
{
  return 0;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MPModelStoreBrowseSectionBuilder *v13;
  void *v14;
  uint64_t v15;
  MPModelStoreBrowseContentItemBuilder *v16;
  void *v17;
  void *v18;
  MPModelStoreBrowseContentItemBuilder *v19;
  _BOOL8 v20;
  NSIndexSet *v21;
  void *v22;
  MPModelStoreGroupingsMusicKitResponseParser *v23;
  void *v24;
  MPModelStoreGroupingsMusicKitResponseParser *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void (**v32)(id, void *, id);
  void *v33;
  id v34;
  uint8_t buf[4];
  MPModelStoreGroupingsMusicKitRequestOperation *v36;
  __int16 v37;
  MPModelStoreGroupingsMusicKitResponseParser *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v32 = (void (**)(id, void *, id))a4;
  v6 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "domain");
  v9 = objc_msgSend(v7, "filteringPolicy");
  +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties](MPModelStoreBrowseSectionBuilder, "allSupportedInternalOnlyProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertySetByCombiningWithPropertySet:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v12;
  v13 = -[MPModelStoreBrowseSectionBuilder initWithRequestedPropertySet:]([MPModelStoreBrowseSectionBuilder alloc], "initWithRequestedPropertySet:", v12);
  v39[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
  v39[1] = CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = [MPModelStoreBrowseContentItemBuilder alloc];
  objc_msgSend(v7, "itemProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v15;
  objc_msgSend(v17, "propertySetByCombiningWithPropertySet:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPModelStoreBrowseContentItemBuilder initWithRequestedPropertySet:](v16, "initWithRequestedPropertySet:", v18);

  v20 = v8 == 1 || v9 != 1;
  -[MPModelStoreBrowseContentItemBuilder setAllowsRadioStations:](v19, "setAllowsRadioStations:", v20);
  -[MPModelStoreBrowseContentItemBuilder setAllowsVideoContent:](v19, "setAllowsVideoContent:", v9 != 1);
  v21 = self->_allowedFCKinds;
  -[MPModelStoreGroupingsMusicKitRequestOperation rootObjectIdentifierWithSubscriptionStatus:](self, "rootObjectIdentifierWithSubscriptionStatus:", objc_msgSend(v7, "subscriptionStatus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [MPModelStoreGroupingsMusicKitResponseParser alloc];
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MPModelStoreGroupingsMusicKitResponseParser initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:rootObjectIdentifier:options:storeURLBag:](v23, "initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:rootObjectIdentifier:options:storeURLBag:", v6, v13, v19, v21, v24, v22, objc_msgSend(v7, "options"), self->_storeURLBag);

  v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = v25;
    _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ instantiated parser: %{public}@.", buf, 0x16u);
  }

  -[MPModelStoreGroupingsMusicKitResponseParser results](v25, "results");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  -[MPModelStoreGroupingsMusicKitRequestOperation _produceResponseWithParser:results:error:](self, "_produceResponseWithParser:results:error:", v25, v27, &v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v34;

  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
    v30 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v30;
  }
  v32[2](v32, v28, v29);

}

- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MPModelStoreBrowseResponse *v10;
  void *v11;
  MPModelStoreBrowseResponse *v12;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v12 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  v10 = [MPModelStoreBrowseResponse alloc];
  -[MPStoreModelRequestOperation request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPModelResponse initWithRequest:](v10, "initWithRequest:", v11);

  -[MPModelStoreBrowseResponse setParser:](v12, "setParser:", v8);
  if (objc_msgSend(v9, "numberOfSections") >= 1)
    -[MPModelResponse setResults:](v12, "setResults:", v9);
  if (a5)
  {
LABEL_7:
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_9:

  return v12;
}

- (id)groupingNameBagKey
{
  return 0;
}

- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MPModelStoreGroupingsMusicKitRequestOperation groupingNameBagKey](self, "groupingNameBagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)additionalCatalogURLQueryItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)catalogURLWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForBagKey:", *MEMORY[0x1E0DDBE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    objc_msgSend(v4, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
    v6 = objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      -[MPModelStoreGroupingsMusicKitRequestOperation groupingNameWithMusicSubscriptionDictionary:](self, "groupingNameWithMusicSubscriptionDictionary:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        MusicURLComponentsWithURLBag(v4, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3940];
        v28[0] = CFSTR("/v1/editorial");
        v28[1] = v5;
        v28[2] = CFSTR("groupings");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pathWithComponents:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPath:](v8, "setPath:", v11);

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("name"), v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v26;
        v12 = (void *)MEMORY[0x1E0CB39D8];
        -[MPStoreModelRequestOperation request](self, "request");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "clientPlatformIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (const __CFString *)v13;
        else
          v15 = CFSTR("iphone");
        objc_msgSend(v12, "queryItemWithName:value:", CFSTR("platform"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPModelStoreGroupingsMusicKitRequestOperation additionalCatalogURLQueryItems](self, "additionalCatalogURLQueryItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setQueryItems:](v8, "setQueryItems:", v19);

        MusicURLQueryItemLanguageWithURLBag(v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[NSObject queryItems](v8, "queryItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "arrayByAddingObject:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setQueryItems:](v8, "setQueryItems:", v22);

        }
        -[NSObject URL](v8, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v6;
          _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "No grouping name in music subscription dictionary of bag, can't generate URL pointing to right grouping: %{public}@", buf, 0xCu);
        }
        v23 = 0;
      }

    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "No music subscription dictionary in bag, can't get subscription properties to generate URL", buf, 2u);
      }
      v23 = 0;
    }

  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "No country code found in bag, can't create storefront endpoint URL", buf, 2u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_allowedFCKinds, 0);
}

@end
