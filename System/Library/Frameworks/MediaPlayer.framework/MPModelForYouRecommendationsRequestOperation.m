@implementation MPModelForYouRecommendationsRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  MPStoreModelRequestConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customForYouURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_2;
  objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_19;
  v24 = v23;
  objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0DDBE80]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_19:
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7201, 0);
      v20 = 0;
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
      v22 = 0;
    }
    goto LABEL_22;
  }
LABEL_2:
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKey:", CFSTR("1"), CFSTR("v"));
  if (MGGetBoolAnswer())
    objc_msgSend(v9, "setObject:forKey:", CFSTR("true"), CFSTR("isInternalInstall"));
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCloudLibraryEnabled");

  if (v12)
    objc_msgSend(v9, "setObject:forKey:", CFSTR("true"), CFSTR("isIcloudLibraryEnabled"));
  objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("isEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber() && objc_msgSend(v15, "BOOLValue"))
      objc_msgSend(v9, "setObject:forKey:", CFSTR("true"), CFSTR("isSocialEnabled"));

  }
  objc_msgSend(v9, "setObject:forKey:", CFSTR("trackBadging"), CFSTR("include"));
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "mutableCopy");

  if (!v18)
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
  v27[3] = &unk_1E315F2B0;
  v28 = v18;
  v19 = v18;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
  objc_msgSend(v16, "setQueryItems:", v19);
  objc_msgSend(v16, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v20);
  objc_msgSend(v21, "setHTTPMethod:", CFSTR("GET"));
  -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
  objc_msgSend(v21, "setTimeoutInterval:");
  v22 = -[MPStoreModelRequestConfiguration initWithURLRequest:]([MPStoreModelRequestConfiguration alloc], "initWithURLRequest:", v21);

LABEL_22:
  return v22;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  MPModelForYouRecommendationsRequestOperation *v21;
  id v22;
  void (**v23)(id, _QWORD, void *);
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!_NSIsNSDictionary())
    goto LABEL_12;
  objc_msgSend(v6, "objectForKey:", CFSTR("recommendations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSArray())
  {
LABEL_11:

LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("storePlatformData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_NSIsNSDictionary())
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("results"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
  {

    goto LABEL_9;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v24[3] = &unk_1E315C670;
  v15 = v13;
  v25 = v15;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v24);
  -[MPModelForYouRecommendationsRequestOperation _missingContentIdentifiersInRecommendationsArray:storeItemMetadataResults:](self, "_missingContentIdentifiersInRecommendationsArray:storeItemMetadataResults:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2;
    v18[3] = &unk_1E3158B28;
    v19 = v16;
    v20 = v15;
    v21 = self;
    v22 = v8;
    v23 = v7;
    objc_msgSend(v17, "requestStoreItemMetadataForReason:withItemIdentifiers:responseHandler:", 1, v19, v18);

  }
  else
  {
    -[MPModelForYouRecommendationsRequestOperation _produceResponseWithRecommendationsArray:storeItemMetadataResults:completion:](self, "_produceResponseWithRecommendationsArray:storeItemMetadataResults:completion:", v8, v15, v7);
  }

LABEL_13:
}

- (id)_missingContentIdentifiersInRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v17 = a4;
  v15 = v5;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    if (_NSIsNSDictionary())
    {
      v8 = v7;
      objc_msgSend(v8, "objectForKey:", CFSTR("children"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray())
      {
        objc_msgSend(v6, "addObjectsFromArray:", v9);
      }
      else
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("contentId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v11 = v10;
          objc_msgSend(v8, "objectForKey:", CFSTR("isUnavailableInAppleMusic"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v12, "BOOLValue") & 1) == 0)
          {
            objc_msgSend(v17, "objectForKey:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
              objc_msgSend(v16, "addObject:", v11);
          }

        }
      }

    }
  }

  return v16;
}

- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MPMutablePropertySet *v14;
  MPMutablePropertySet *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MPModelForYouRecommendationGroupBuilder *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  MPModelRequest *v30;
  void *v31;
  void *v32;
  void *v33;
  MPMutableSectionedCollection *v34;
  uint64_t v35;
  MPMutableSectionedCollection *v36;
  MPMutableSectionedCollection *v37;
  MPStoreLibraryPersonalizationRequest *v38;
  id v39;
  MPMutableSectionedCollection *v40;
  void *v41;
  id v42;
  MPMutablePropertySet *v43;
  void *v44;
  void *v45;
  void *v46;
  MPMutableSectionedCollection *v47;
  void *v48;
  MPMutableSectionedCollection *v49;
  _QWORD v50[5];
  MPMutableSectionedCollection *v51;
  id v52;
  _QWORD v53[4];
  MPMutableSectionedCollection *v54;
  MPMutableSectionedCollection *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v42 = a5;
  v49 = objc_alloc_init(MPMutableSectionedCollection);
  v47 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPStoreModelRequestOperation request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionProperties");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "filteringPolicy");
  v45 = v10;
  objc_msgSend(v10, "itemProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MPMutablePropertySet alloc];
  v15 = -[MPMutablePropertySet initWithProperties:relationships:](v14, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], 0);
  -[MPMutablePropertySet addProperty:](v15, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"));
  objc_msgSend(v13, "relationships");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MPMutablePropertySet addProperty:](v15, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertySubgroupIndex"));
    -[MPMutablePropertySet addProperty:](v15, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertyParentGroup"));
  }
  v43 = v15;
  objc_msgSend(v13, "propertySetByCombiningWithPropertySet:", v15);
  v18 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v11;
  v41 = (void *)v18;
  v46 = v9;
  v19 = -[MPModelForYouRecommendationGroupBuilder initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:]([MPModelForYouRecommendationGroupBuilder alloc], "initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:", v11, v18, v9, v47);
  v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v20, "addIndex:", 3);
  v48 = v20;
  objc_msgSend(v20, "addIndex:", 0);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v57;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v57 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v25);
        if (_NSIsNSDictionary())
        {
          v27 = v26;
          -[MPAsyncOperation userIdentity](self, "userIdentity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelForYouRecommendationGroupBuilder modelObjectForRecommendationDictionary:userIdentity:](v19, "modelObjectForRecommendationDictionary:userIdentity:", v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29 && (v12 != 1 || (objc_msgSend(v48, "containsIndex:", objc_msgSend(v29, "groupType")) & 1) == 0))
            -[MPMutableSectionedCollection appendSection:](v49, "appendSection:", v29);

        }
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v23);
  }

  v30 = objc_alloc_init(MPModelRequest);
  +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setSectionKind:](v30, "setSectionKind:", v31);

  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setSectionProperties:](v30, "setSectionProperties:", v32);

  +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setItemKind:](v30, "setItemKind:", v33);

  -[MPModelRequest setItemProperties:](v30, "setItemProperties:", v41);
  v34 = objc_alloc_init(MPMutableSectionedCollection);
  v35 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke;
  v53[3] = &unk_1E3158B78;
  v54 = v34;
  v55 = v47;
  v36 = v47;
  v37 = v34;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](v36, "enumerateSectionsUsingBlock:", v53);
  v38 = -[MPStoreLibraryPersonalizationRequest initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:]([MPStoreLibraryPersonalizationRequest alloc], "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", v30, v37);
  -[MPStoreLibraryPersonalizationRequest setRepresentedObjects:](v38, "setRepresentedObjects:", v36);
  v50[0] = v35;
  v50[1] = 3221225472;
  v50[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_3;
  v50[3] = &unk_1E3158BA0;
  v50[4] = self;
  v51 = v49;
  v52 = v42;
  v39 = v42;
  v40 = v49;
  -[MPModelRequest performWithResponseHandler:](v38, "performWithResponseHandler:", v50);

}

- (id)_personalizeRecommendationGroup:(id)a3 flatPersonalizedSectionedItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  MPModelForYouRecommendationsRequestOperation *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__MPModelForYouRecommendationsRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke;
  v13[3] = &unk_1E315E020;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_msgSend(v9, "copyWithIdentifiers:block:", v8, v13);

  return v11;
}

- (id)_responseWithResults:(id)a3 personalizationResponse:(id)a4
{
  id v6;
  id v7;
  MPMutableSectionedCollection *v8;
  void *v9;
  MPMutableSectionedCollection *v10;
  id v11;
  MPModelForYouRecommendationsResponse *v12;
  void *v13;
  MPModelForYouRecommendationsResponse *v14;
  _QWORD v16[5];
  id v17;
  MPMutableSectionedCollection *v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MPMutableSectionedCollection);
  objc_msgSend(v6, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MPModelForYouRecommendationsRequestOperation__responseWithResults_personalizationResponse___block_invoke;
  v16[3] = &unk_1E3158BC8;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v7, "enumerateSectionsUsingBlock:", v16);

  v12 = [MPModelForYouRecommendationsResponse alloc];
  -[MPStoreModelRequestOperation request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPModelResponse initWithRequest:](v12, "initWithRequest:", v13);

  -[MPModelResponse setResults:](v14, "setResults:", v10);
  return v14;
}

void __93__MPModelForYouRecommendationsRequestOperation__responseWithResults_personalizationResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_personalizeRecommendationGroup:flatPersonalizedSectionedItems:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "appendSection:", v3);
    v3 = v4;
  }

}

void __111__MPModelForYouRecommendationsRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setSectionedItems:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "subgroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 48), "_personalizeRecommendationGroup:flatPersonalizedSectionedItems:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), *(_QWORD *)(a1 + 32), (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setSubgroups:", v5);
  }

}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appendSection:", a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_2;
  v6[3] = &unk_1E3158B50;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v6);

}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseWithResults:personalizationResponse:", *(_QWORD *)(a1 + 40), a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPStoreLibraryPersonalizationContentDescriptor *v4;

  v3 = a2;
  v4 = -[MPStoreLibraryPersonalizationContentDescriptor initWithModel:personalizationStyle:]([MPStoreLibraryPersonalizationContentDescriptor alloc], "initWithModel:personalizationStyle:", v3, 4);

  objc_msgSend(*(id *)(a1 + 32), "appendItem:", v4);
}

void __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  MPStoreItemMetadata *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    v6 = v9;
    v7 = v5;
    v8 = -[MPStoreItemMetadata initWithStorePlatformDictionary:]([MPStoreItemMetadata alloc], "initWithStorePlatformDictionary:", v7);
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v6);

  }
}

void __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFinalResponse"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v3, "storeItemMetadataForItemIdentifier:", v9, (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 48), "_produceResponseWithRecommendationsArray:storeItemMetadataResults:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }

}

void __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = (objc_class *)MEMORY[0x1E0CB39D8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithName:value:", v11, v6);

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke_2;
    v12[3] = &unk_1E315F288;
    v13 = v11;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);
    v10 = *(void **)(a1 + 32);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "addObject:", v7);
    else
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v7);

  }
}

uint64_t __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

@end
