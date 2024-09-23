@implementation MPModelForYouRecommendationsMusicKitRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  MPStoreModelRequestConfiguration *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const __CFString *v28;

  v7 = a3;
  objc_storeStrong((id *)&self->_storeURLBag, a3);
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customForYouURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[MPModelForYouRecommendationsMusicKitRequestOperation recommendationsURLWithStoreURLBag:](self, "recommendationsURLWithStoreURLBag:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v17);
      objc_msgSend(v18, "setHTTPMethod:", CFSTR("GET"));
      -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
      objc_msgSend(v18, "setTimeoutInterval:");
      objc_msgSend(v10, "addObject:", v18);

    }
    -[MPStoreModelRequestOperation request](self, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "withRecentlyPlayed"))
    {
      -[MPStoreModelRequestOperation request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mode");

      if (v21)
        goto LABEL_11;
      -[MPModelForYouRecommendationsMusicKitRequestOperation recentlyPlayedURLWithStoreURLBag:](self, "recentlyPlayedURLWithStoreURLBag:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v19);
        objc_msgSend(v22, "setHTTPMethod:", CFSTR("GET"));
        -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
        objc_msgSend(v22, "setTimeoutInterval:");
        objc_msgSend(v10, "addObject:", v22);

      }
    }

LABEL_11:
    if (objc_msgSend(v10, "count"))
    {
      v23 = -[MPStoreModelRequestConfiguration initWithURLRequests:]([MPStoreModelRequestConfiguration alloc], "initWithURLRequests:", v10);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 5, 0);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[MPStoreModelRequestOperation request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "refreshRequest");

  if (v14)
  {
    -[MPModelForYouRecommendationsMusicKitRequestOperation recommendationsQueryItemsWithStoreURLBag:](self, "recommendationsQueryItemsWithStoreURLBag:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v15);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("action"), CFSTR("refresh"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);
  }
  else
  {
    -[MPModelForYouRecommendationsMusicKitRequestOperation queryItemsWithStoreURLBag:](self, "queryItemsWithStoreURLBag:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v16);
  }

  v24 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v10, "setQueryItems:", v24);

  objc_msgSend(v10, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v17);
  -[MPStoreModelRequestOperation request](self, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "refreshRequest");

  if (v27)
    v28 = CFSTR("POST");
  else
    v28 = CFSTR("GET");
  objc_msgSend(v25, "setHTTPMethod:", v28);
  -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
  objc_msgSend(v25, "setTimeoutInterval:");
  v23 = -[MPStoreModelRequestConfiguration initWithURLRequest:]([MPStoreModelRequestConfiguration alloc], "initWithURLRequest:", v25);

LABEL_18:
  return v23;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  __CFString *v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  MPStoreLibraryPersonalizationRequest *v34;
  MPServerObjectDatabaseMediaKitImportRequest *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  void (**v40)(id, _QWORD, id);
  id v41;
  _QWORD v42[5];
  id v43;
  void (**v44)(id, _QWORD, id);
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (_NSIsNSArray())
  {
    -[__CFString objectAtIndex:](v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPModelForYouRecommendationsMusicKitRequestOperation isOnboardingRequired:](self, "isOnboardingRequired:", v8))
    {

LABEL_6:
      v9 = (void *)MEMORY[0x1E0CB35C8];
      if (v6)
        v10 = v6;
      else
        v10 = CFSTR("<nil>");
      v52 = CFSTR("responses");
      v53[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPMusicAPIErrorDomain"), 1, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);
      v13 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_36;
    }
    -[__CFString objectAtIndex:](v6, "objectAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary() && _NSIsNSDictionary())
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("data"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("data"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray() && _NSIsNSArray())
      {
        -[MPModelForYouRecommendationsMusicKitRequestOperation _produceResultsWithRecommendationsArray:recentlyPlayedArray:](self, "_produceResultsWithRecommendationsArray:recentlyPlayedArray:", v16, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }

    goto LABEL_28;
  }
  if (!_NSIsNSDictionary())
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_29;
  }
  if (-[MPModelForYouRecommendationsMusicKitRequestOperation isOnboardingRequired:](self, "isOnboardingRequired:", v6))
    goto LABEL_6;
  -[__CFString objectForKey:](v6, "objectForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    -[MPStoreModelRequestOperation request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "customForYouURL");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[MPStoreModelRequestOperation request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "refreshRequest");

      if ((v21 & 1) == 0)
      {
        -[MPModelForYouRecommendationsMusicKitRequestOperation _produceResultsWithItemsArray:](self, "_produceResultsWithItemsArray:", v8);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v13 = (void *)v22;
        goto LABEL_28;
      }
    }
    else
    {

    }
    -[MPModelForYouRecommendationsMusicKitRequestOperation _produceResultsWithRecommendationsArray:recentlyPlayedArray:](self, "_produceResultsWithRecommendationsArray:recentlyPlayedArray:", v8, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

LABEL_29:
  if ((unint64_t)objc_msgSend(v13, "count") > 1)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_opt_new();
    +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSectionKind:", v27);

    +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSectionProperties:", v28);

    +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setItemKind:", v29);

    -[MPModelForYouRecommendationsMusicKitRequestOperation itemProperties](self, "itemProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setItemProperties:", v30);

    v31 = (void *)objc_opt_new();
    v32 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
    v45[3] = &unk_1E3158B78;
    v33 = v31;
    v46 = v33;
    v12 = v25;
    v47 = v12;
    objc_msgSend(v12, "enumerateSectionsUsingBlock:", v45);
    v34 = -[MPStoreLibraryPersonalizationRequest initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:]([MPStoreLibraryPersonalizationRequest alloc], "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", v26, v33);
    -[MPStoreLibraryPersonalizationRequest setRepresentedObjects:](v34, "setRepresentedObjects:", v12);
    v42[0] = v32;
    v42[1] = 3221225472;
    v42[2] = __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_3;
    v42[3] = &unk_1E3158BA0;
    v42[4] = self;
    v11 = v24;
    v43 = v11;
    v40 = v7;
    v44 = v7;
    -[MPModelRequest performWithResponseHandler:](v34, "performWithResponseHandler:", v42);
    v35 = -[MPServerObjectDatabaseMediaKitImportRequest initWithPayload:]([MPServerObjectDatabaseMediaKitImportRequest alloc], "initWithPayload:", v6);
    +[MPServerObjectDatabase sharedServerObjectDatabase](MPServerObjectDatabase, "sharedServerObjectDatabase");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v37 = (id)objc_msgSend(v36, "importObjectsFromRequest:options:error:", v35, 0, &v41);
    v38 = v41;

    if (v38)
    {
      v39 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v38;
        _os_log_impl(&dword_193B9B000, v39, OS_LOG_TYPE_ERROR, "Error importing recommendations endpoint response in Server Object Database: %{public}@", buf, 0xCu);
      }

    }
    v7 = v40;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v50 = CFSTR("resultsAndFlatSectionedItems");
    v51 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("MPMusicAPIErrorDomain"), 1001, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }
LABEL_36:

}

- (id)sectionProperties
{
  void *v2;
  void *v3;

  -[MPStoreModelRequestOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemProperties
{
  void *v2;
  void *v3;
  MPMutablePropertySet *v4;
  MPMutablePropertySet *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MPStoreModelRequestOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MPMutablePropertySet alloc];
  v5 = -[MPMutablePropertySet initWithProperties:relationships:](v4, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], 0);
  -[MPMutablePropertySet addProperty:](v5, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"));
  objc_msgSend(v3, "relationships");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPMutablePropertySet addProperty:](v5, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertySubgroupIndex"));
    -[MPMutablePropertySet addProperty:](v5, "addProperty:", CFSTR("MPModelForYouRecommendationItemPropertyParentGroup"));
  }
  objc_msgSend(v3, "propertySetByCombiningWithPropertySet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_recommendationGroupBuilder
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[MPModelForYouRecommendationsMusicKitRequestOperation _recommendationGroupBuilderWithFlatSectionedItems:](self, "_recommendationGroupBuilderWithFlatSectionedItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recommendationGroupBuilderWithFlatSectionedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MPModelForYouRecommendationMusicKitGroupBuilder *v8;

  v4 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelForYouRecommendationsMusicKitRequestOperation sectionProperties](self, "sectionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelForYouRecommendationsMusicKitRequestOperation itemProperties](self, "itemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPModelForYouRecommendationMusicKitGroupBuilder initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:]([MPModelForYouRecommendationMusicKitGroupBuilder alloc], "initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:", v6, v7, 0, v4, self->_storeURLBag, objc_msgSend(v5, "mode") == 1);

  return v8;
}

- (id)_produceResultsWithItemsArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[MPModelForYouRecommendationsMusicKitRequestOperation _recommendationGroupBuilderWithFlatSectionedItems:](self, "_recommendationGroupBuilderWithFlatSectionedItems:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelObjectForItemsArray:userIdentity:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendSection:", v9);
  }
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_produceResultsWithRecommendationsArray:(id)a3 recentlyPlayedArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MPModelForYouRecommendationsMusicKitRequestOperation *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  -[MPModelForYouRecommendationsMusicKitRequestOperation _recommendationGroupBuilderWithFlatSectionedItems:](self, "_recommendationGroupBuilderWithFlatSectionedItems:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelObjectForRecentlyPlayedArray:userIdentity:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appendSection:", v11);
  }
  v32 = v7;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      v33 = v14;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
        if (_NSIsNSDictionary())
        {
          v18 = v17;
          -[MPAsyncOperation userIdentity](self, "userIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "modelObjectForRecommendationDictionary:userIdentity:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            -[MPStoreModelRequestOperation request](self, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "filteringPolicy") != 1)
            {

              goto LABEL_15;
            }
            v22 = v15;
            v23 = self;
            v24 = v12;
            v25 = v9;
            v26 = v8;
            v27 = objc_msgSend(v20, "groupType");

            v28 = v27 == 12;
            v8 = v26;
            v9 = v25;
            v12 = v24;
            self = v23;
            v15 = v22;
            v14 = v33;
            if (!v28)
LABEL_15:
              objc_msgSend(v8, "appendSection:", v20);
          }

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  v38[0] = v8;
  v38[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)_responseWithResults:(id)a3 personalizationResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  MPModelForYouRecommendationsResponse *v12;
  void *v13;
  MPModelForYouRecommendationsResponse *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__MPModelForYouRecommendationsMusicKitRequestOperation__responseWithResults_personalizationResponse___block_invoke;
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
  MPModelForYouRecommendationsMusicKitRequestOperation *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __119__MPModelForYouRecommendationsMusicKitRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke;
  v13[3] = &unk_1E315E020;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_msgSend(v9, "copyWithIdentifiers:block:", v8, v13);

  return v11;
}

- (id)queryItemsWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB39D8];
  -[MPStoreModelRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientPlatformIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("iphone");
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("platform"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v12 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ISO8601TimeZoneOffsetFromUTC");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", CFSTR("timezone"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v16);

  MusicURLQueryItemLanguageWithURLBag(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v5, "addObject:", v17);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)recommendationsQueryItemsWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mode");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPModelForYouRecommendationsMusicKitRequestOperation shouldRequestSocialAndFriendsMixWithValues](self, "shouldRequestSocialAndFriendsMixWithValues"))
  {
    objc_msgSend(v7, "addObject:", CFSTR("friendsMix"));
    if (objc_msgSend(v5, "withSocial"))
      objc_msgSend(v7, "addObject:", CFSTR("social"));
  }
  objc_msgSend(v7, "addObject:", CFSTR("voice"));
  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[MPModelForYouRecommendationsMusicKitRequestOperation queryItemsWithStoreURLBag:](self, "queryItemsWithStoreURLBag:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("with"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("name"), CFSTR("listen-now"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("omit[resource]"), CFSTR("autos"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("api"), 0);
    v17 = (void *)MEMORY[0x1E0CB39D8];
    v18 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "queryItemWithName:value:", CFSTR("meta"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "filteringPolicy") == 1)
  {
    objc_msgSend(v21, "addObject:", CFSTR("emphasize"));
    objc_msgSend(v21, "addObject:", CFSTR("expand"));
  }
  if (v6 == 1 && objc_msgSend(v5, "withPlainEditorialNotes"))
    objc_msgSend(v21, "addObject:", CFSTR("plainEditorialNotes"));
  if (objc_msgSend(v21, "count"))
  {
    v22 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "queryItemWithName:value:", CFSTR("extend"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v24);

  }
  -[MPModelForYouRecommendationsMusicKitRequestOperation typesArrayWithTypes:](self, "typesArrayWithTypes:", -[MPModelForYouRecommendationsMusicKitRequestOperation types](self, "types"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v6 == 1 && objc_msgSend(v25, "count"))
  {
    v27 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "queryItemWithName:value:", CFSTR("types"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v29);

  }
  -[MPModelForYouRecommendationsMusicKitRequestOperation displayFilterKindsValueForOptions:](self, "displayFilterKindsValueForOptions:", -[MPModelForYouRecommendationsMusicKitRequestOperation displayFilterKinds](self, "displayFilterKinds"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v6 == 1 && objc_msgSend(v30, "count"))
  {
    v32 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "queryItemWithName:value:", CFSTR("displayFilter[kind]"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v34);

  }
  v35 = (void *)objc_msgSend(v10, "copy");

  return v35;
}

- (id)recommendationsURLWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MusicURLComponentsWithURLBag(v4, objc_msgSend(v5, "mode") == 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", CFSTR("/v1/me/recommendations"));
  -[MPModelForYouRecommendationsMusicKitRequestOperation recommendationsQueryItemsWithStoreURLBag:](self, "recommendationsQueryItemsWithStoreURLBag:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "percentEncodedQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("%2B"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPercentEncodedQuery:", v9);

  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)recentlyPlayedURLWithStoreURLBag:(id)a3
{
  void *v3;
  void *v4;

  MusicURLComponentsWithURLBag(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", CFSTR("/v1/me/recent/played"));
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isOnboardingRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("meta"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("account"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("OnboardingRequired"));
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldRequestSocialAndFriendsMixWithValues
{
  return -[MPModelForYouRecommendationsMusicKitRequestOperation subscriptionStatusType](self, "subscriptionStatusType") == 1;
}

- (int64_t)types
{
  void *v2;
  int64_t v3;

  -[MPStoreModelRequestOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "types");

  return v3;
}

- (int64_t)displayFilterKinds
{
  void *v2;
  int64_t v3;

  -[MPStoreModelRequestOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayFilterKinds");

  return v3;
}

- (int64_t)subscriptionStatusType
{
  void *v2;
  void *v3;
  int64_t v4;

  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "musicSubscriptionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusType");

  return v4;
}

- (id)typesArrayWithTypes:(int64_t)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("artists"));
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("albums"));
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v5, "addObject:", CFSTR("apple-curators"));
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v5, "addObject:", CFSTR("curators"));
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v5, "addObject:", CFSTR("playlists"));
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v5, "addObject:", CFSTR("stations"));
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v5, "addObject:", CFSTR("editorial-items"));
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v5, "addObject:", CFSTR("music-videos"));
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v5, "addObject:", CFSTR("music-movies"));
  if ((v3 & 0x400) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v5, "addObject:", CFSTR("social-profiles"));
  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v5, "addObject:", CFSTR("social-upsells"));
  if ((v3 & 0x1000) == 0)
  {
LABEL_13:
    if ((v3 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v5, "addObject:", CFSTR("tv-shows"));
  if ((v3 & 0x2000) == 0)
  {
LABEL_14:
    if ((v3 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v5, "addObject:", CFSTR("uploaded-audios"));
  if ((v3 & 0x4000) == 0)
  {
LABEL_15:
    if ((v3 & 0x8000) == 0)
      goto LABEL_16;
LABEL_33:
    objc_msgSend(v5, "addObject:", CFSTR("library-playlists"));
    if ((v3 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  objc_msgSend(v5, "addObject:", CFSTR("uploaded-videos"));
  if ((v3 & 0x8000) != 0)
    goto LABEL_33;
LABEL_16:
  if ((v3 & 0x10000) != 0)
LABEL_17:
    objc_msgSend(v5, "addObject:", CFSTR("library-albums"));
LABEL_18:
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)displayFilterKindsValueForOptions:(int64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("MusicCoverShelf"));
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("MusicNotesHeroShelf"));
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v5, "addObject:", CFSTR("MusicSuperHeroShelf"));
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v5, "addObject:", CFSTR("MusicCardShelf"));
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v5, "addObject:", CFSTR("MusicUpsellShelf"));
  if ((v3 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v3 & 0x40) != 0)
LABEL_7:
    objc_msgSend(v5, "addObject:", CFSTR("MusicHorizontalLockupGrid"));
LABEL_8:
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLBag, 0);
}

void __119__MPModelForYouRecommendationsMusicKitRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
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
    v5 = (void *)objc_opt_new();
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

void __101__MPModelForYouRecommendationsMusicKitRequestOperation__responseWithResults_personalizationResponse___block_invoke(uint64_t a1, uint64_t a2)
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

void __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appendSection:", a2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2;
  v6[3] = &unk_1E3158B50;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v6);

}

void __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseWithResults:personalizationResponse:", *(_QWORD *)(a1 + 40), a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      v6 = (id)v4;
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);
    }

  }
}

void __99__MPModelForYouRecommendationsMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  MPStoreLibraryPersonalizationContentDescriptor *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isBackedByStoreItemMetadata") & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v5, "itemType") == 4)
  {
    v3 = 1;
  }
  else
  {
    v3 = 4;
  }
  v4 = -[MPStoreLibraryPersonalizationContentDescriptor initWithModel:personalizationStyle:]([MPStoreLibraryPersonalizationContentDescriptor alloc], "initWithModel:personalizationStyle:", v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "appendItem:", v4);

}

@end
