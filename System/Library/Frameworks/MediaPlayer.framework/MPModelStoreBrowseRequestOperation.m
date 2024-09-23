@implementation MPModelStoreBrowseRequestOperation

- (void)cancel
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23061;
  v30 = __Block_byref_object_dispose__23062;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__23061;
  v24 = __Block_byref_object_dispose__23062;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23061;
  v18 = __Block_byref_object_dispose__23062;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__MPModelStoreBrowseRequestOperation_cancel__block_invoke;
  v13[3] = &unk_1E3163040;
  v13[4] = self;
  v13[5] = &v26;
  v13[6] = &v20;
  v13[7] = &v14;
  -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v13);
  objc_msgSend((id)v27[5], "cancel");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (id)v21[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "cancel");
        v7 = v15[5];
        if (v7)
          dispatch_group_leave(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v32, 16);
    }
    while (v4);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPModelStoreBrowseRequestOperation;
  -[MPStoreModelRequestOperation cancel](&v8, sel_cancel);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

}

- (void)execute
{
  void *v3;
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  MPModelStoreBrowseRequestOperation *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[MPStoreModelRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__23061;
  v21 = __Block_byref_object_dispose__23062;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23061;
  v15 = __Block_byref_object_dispose__23062;
  v16 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke;
  v6[3] = &unk_1E3158C68;
  v4 = v3;
  v7 = v4;
  v8 = self;
  v9 = &v17;
  v10 = &v11;
  -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v6);
  if (v18[5])
  {
    objc_msgSend((id)v12[5], "addOperation:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPModelStoreBrowseRequestOperation;
    -[MPStoreModelRequestOperation execute](&v5, sel_execute);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  MPStoreModelRequestConfiguration *v12;
  MPStoreModelRequestConfiguration *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  _QWORD v27[6];

  v6 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadAdditionalContentURL");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = 1;
LABEL_3:
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v9);
    objc_msgSend(v11, "setHTTPMethod:", CFSTR("GET"));
    -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
    objc_msgSend(v11, "setTimeoutInterval:");
    v12 = -[MPStoreModelRequestConfiguration initWithURLRequest:]([MPStoreModelRequestConfiguration alloc], "initWithURLRequest:", v11);

    goto LABEL_4;
  }
  objc_msgSend(v7, "previousResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allAdditionalContentIdentifiersNeedingLookup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    v19 = v18;
    v20 = v17;
    v21 = +[MPStoreItemMetadataRequestController optimalBatchSize](MPStoreItemMetadataRequestController, "optimalBatchSize");
    v22 = v20;
    if (v19 > v21)
    {
      objc_msgSend(v20, "subarrayWithRange:", 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = -[MPStoreModelRequestConfiguration initWithRequestedItemIdentifiers:reason:]([MPStoreModelRequestConfiguration alloc], "initWithRequestedItemIdentifiers:reason:", v22, 1);

    if (v12)
    {
      v9 = 0;
      v10 = 2;
      goto LABEL_4;
    }
  }
  else
  {

  }
  v23 = objc_msgSend(v7, "domain");
  if (v23 == 1)
  {
    objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEB8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
LABEL_21:

      goto LABEL_22;
    }
    v25 = (_QWORD *)MEMORY[0x1E0DDBEB0];
  }
  else
  {
    if (v23)
      goto LABEL_22;
    objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
      goto LABEL_21;
    v25 = (_QWORD *)MEMORY[0x1E0DDBE70];
  }
  objc_msgSend(v24, "objectForKey:", *v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
    goto LABEL_3;
  }
LABEL_22:
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7201, 0);
    v9 = 0;
    v10 = 0;
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v12 = 0;
  }
LABEL_4:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92__MPModelStoreBrowseRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
  v27[3] = &unk_1E3161620;
  v27[4] = self;
  v27[5] = v10;
  -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v27);
  v13 = v12;

  return v13;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  MPModelStoreBrowseContentItemBuilder *v22;
  void *v23;
  MPModelStoreBrowseContentItemBuilder *v24;
  _BOOL8 v26;
  MPModelStoreBrowseResponseParser *v27;
  MPModelStoreBrowseResponseParser *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPModelStoreBrowseResponseParser *v32;
  MPModelStoreBrowseResponseParser *v33;
  void *v34;
  uint64_t v35;
  MPModelStoreBrowseSectionBuilder *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[10];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v37 = a4;
  -[MPStoreModelRequestOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousResponse");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "domain");
  v8 = objc_msgSend(v6, "filteringPolicy");
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__23061;
  v47 = __Block_byref_object_dispose__23062;
  v48 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __81__MPModelStoreBrowseRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v42[3] = &unk_1E3158C18;
  v42[4] = self;
  v42[5] = &v53;
  v42[8] = v7;
  v42[9] = v8;
  v42[6] = &v49;
  v42[7] = &v43;
  -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v42);
  v9 = 0;
  if (v8 == 1 && !v7)
    v9 = v54[3] == 0;
  objc_msgSend(v6, "previousResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v39 = v12;
  }
  else
  {
    objc_msgSend(v6, "sectionProperties");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }

  +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties](MPModelStoreBrowseSectionBuilder, "allSupportedInternalOnlyProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertySetByCombiningWithPropertySet:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[MPModelStoreBrowseSectionBuilder initWithRequestedPropertySet:]([MPModelStoreBrowseSectionBuilder alloc], "initWithRequestedPropertySet:", v38);
  objc_msgSend(v41, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(v6, "itemProperties");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  v57[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
  v57[1] = CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [MPModelStoreBrowseContentItemBuilder alloc];
  objc_msgSend(v19, "propertySetByCombiningWithPropertySet:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPModelStoreBrowseContentItemBuilder initWithRequestedPropertySet:](v22, "initWithRequestedPropertySet:", v23);

  v26 = v8 != 1 || v7 == 1;
  -[MPModelStoreBrowseContentItemBuilder setAllowsRadioStations:](v24, "setAllowsRadioStations:", v26);
  -[MPModelStoreBrowseContentItemBuilder setAllowsVideoContent:](v24, "setAllowsVideoContent:", v8 != 1);
  if (v54[3] != 2)
  {
    v33 = [MPModelStoreBrowseResponseParser alloc];
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 256;
    if (!v9)
      v35 = 0;
    v27 = -[MPModelStoreBrowseResponseParser initWithRawResponseOutput:options:sectionBuilder:contentItemBuilder:userIdentity:](v33, "initWithRawResponseOutput:options:sectionBuilder:contentItemBuilder:userIdentity:", v40, v35 | v9, v36, v24, v34);

    if (*((_BYTE *)v50 + 24))
      -[MPModelStoreBrowseRequestOperation _produceCarPlayResponseWithParser:withNestedRequestsForEmptyBrickSectionsInOperationQueue:completion:](self, "_produceCarPlayResponseWithParser:withNestedRequestsForEmptyBrickSectionsInOperationQueue:completion:", v27, v44[5], v37);
    else
      -[MPModelStoreBrowseRequestOperation _produceRegularResponseWithParser:completion:](self, "_produceRegularResponseWithParser:completion:", v27, v37);
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (MPModelStoreBrowseResponseParser *)v40;
    v28 = [MPModelStoreBrowseResponseParser alloc];
    objc_msgSend(v41, "parser");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 256;
    if (!v9)
      v31 = 0;
    v32 = -[MPModelStoreBrowseResponseParser initWithPreviousParser:additionalStoreItemMetadataResponse:options:sectionBuilder:contentItemBuilder:userIdentity:](v28, "initWithPreviousParser:additionalStoreItemMetadataResponse:options:sectionBuilder:contentItemBuilder:userIdentity:", v29, v27, v31 | v9, v36, v24, v30);

    -[MPModelStoreBrowseRequestOperation _produceRegularResponseWithParser:completion:](self, "_produceRegularResponseWithParser:completion:", v32, v37);
LABEL_26:

  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

}

- (double)adjustTimeoutInterval:(double)a3
{
  void *v5;
  double v6;
  void *v7;

  -[MPStoreModelRequestOperation assertRunningInAccessQueue](self, "assertRunningInAccessQueue");
  if (!self->_didInitializeTimeoutIntervalAdditions)
  {
    -[MPStoreModelRequestOperation request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    if (!objc_msgSend(v5, "domain") && objc_msgSend(v5, "filteringPolicy") == 1)
    {
      objc_msgSend(v5, "loadAdditionalContentURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v6 = 0.0;
      else
        v6 = a3 + a3;
    }
    self->_timeoutIntervalAdditions = v6;
    self->_didInitializeTimeoutIntervalAdditions = 1;

  }
  return self->_timeoutIntervalAdditions + a3;
}

- (id)_nestedRequestsOperationQueue
{
  NSOperationQueue *nestedRequestsOperationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  nestedRequestsOperationQueue = self->_nestedRequestsOperationQueue;
  if (!nestedRequestsOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_nestedRequestsOperationQueue;
    self->_nestedRequestsOperationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_nestedRequestsOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](self->_nestedRequestsOperationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelStoreBrowseRequestOperation.nestedRequestsOperationQueue"));
    -[NSOperationQueue setQualityOfService:](self->_nestedRequestsOperationQueue, "setQualityOfService:", 25);
    nestedRequestsOperationQueue = self->_nestedRequestsOperationQueue;
  }
  return nestedRequestsOperationQueue;
}

- (void)_produceCarPlayResponseWithParser:(id)a3 withNestedRequestsForEmptyBrickSectionsInOperationQueue:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  MPModelStoreBrowseRequest *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  void *v31;
  id v32;
  id obj;
  void *v34;
  void *v35;
  NSObject *queue;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  _QWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  NSObject *v50;
  id v51;
  _QWORD v52[6];
  NSObject *v53;
  NSObject *v54;
  uint64_t *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = a4;
  v31 = v7;
  v32 = a5;
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__23061;
  v77 = __Block_byref_object_dispose__23062;
  v78 = 0;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke;
  v70[3] = &unk_1E3158C40;
  v71 = v8;
  v72 = &v73;
  v30 = v71;
  objc_msgSend(v71, "enumerateSectionsUsingBlock:", v70);
  if (objc_msgSend((id)v74[5], "count"))
  {
    +[MPModelStoreBrowseSectionBuilder allSupportedPropertiesIncludingInternalOnlyProperties:](MPModelStoreBrowseSectionBuilder, "allSupportedPropertiesIncludingInternalOnlyProperties:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelStoreBrowseContentItemBuilder allSupportedProperties](MPModelStoreBrowseContentItemBuilder, "allSupportedProperties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
    v10 = v9;
    v11 = dispatch_group_create();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = __Block_byref_object_copy__23061;
    v68[4] = __Block_byref_object_dispose__23062;
    v69 = 0;
    queue = dispatch_queue_create("com.apple.MediaPlayer.MPModelStoreBrowseRequestOperation.sectionsToNestedResponseAccessQueue", 0);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = (id)v74[5];
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          dispatch_group_enter(v11);
          v18 = objc_alloc_init(MPModelStoreBrowseRequest);
          -[MPModelStoreBrowseRequest setDomain:](v18, "setDomain:", 0);
          -[MPModelStoreBrowseRequest setFilteringPolicy:](v18, "setFilteringPolicy:", 1);
          objc_msgSend(v17, "loadAdditionalContentURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelStoreBrowseRequest setLoadAdditionalContentURL:](v18, "setLoadAdditionalContentURL:", v19);

          -[MPModelRequest setSectionProperties:](v18, "setSectionProperties:", v35);
          -[MPModelRequest setItemProperties:](v18, "setItemProperties:", v34);
          -[MPStoreModelRequest setTimeoutInterval:](v18, "setTimeoutInterval:", v10);
          v58 = 0;
          v59 = &v58;
          v60 = 0x3032000000;
          v61 = __Block_byref_object_copy__23061;
          v62 = __Block_byref_object_dispose__23062;
          v63 = 0;
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_2;
          v52[3] = &unk_1E3158C90;
          v52[4] = self;
          v52[5] = v17;
          v55 = &v58;
          v53 = queue;
          v56 = v68;
          v57 = 0;
          v54 = v11;
          v20 = -[MPModelStoreBrowseRequest newOperationWithResponseHandler:](v18, "newOperationWithResponseHandler:", v52);
          v21 = (void *)v59[5];
          v59[5] = v20;

          v22 = v59[5];
          if (v22)
          {
            *(_BYTE *)(v22 + 329) = 1;
            v23 = v59[5];
          }
          else
          {
            v23 = 0;
          }
          objc_msgSend(v12, "setObject:forKey:", v23, v17);
          objc_msgSend(v13, "addObject:", v59[5]);
          _Block_object_dispose(&v58, 8);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
      }
      while (v14);
    }

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_5;
    v49[3] = &unk_1E3163698;
    v49[4] = self;
    v24 = v11;
    v50 = v24;
    v25 = v12;
    v51 = v25;
    -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v49);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v26 = v13;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v79, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v26);
          objc_msgSend(v38, "addOperation:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v79, 16);
      }
      while (v27);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_6;
    block[3] = &unk_1E3158CE0;
    block[4] = self;
    v40 = v30;
    v43 = &v73;
    v44 = v68;
    v41 = v31;
    v42 = v32;
    dispatch_group_notify(v24, queue, block);

    _Block_object_dispose(v68, 8);
  }
  else
  {
    -[MPModelStoreBrowseRequestOperation _produceRegularResponseWithParser:completion:](self, "_produceRegularResponseWithParser:completion:", v7, v32);
  }

  _Block_object_dispose(&v73, 8);
}

- (void)_produceRegularResponseWithParser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "results");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelStoreBrowseRequestOperation _produceResponseWithParser:results:changeDetails:completion:](self, "_produceResponseWithParser:results:changeDetails:completion:", v7, v9, v8, v6);

}

- (void)_produceResponseWithParser:(id)a3 results:(id)a4 changeDetails:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, void *);
  MPModelStoreBrowseResponse *v14;
  void *v15;
  MPModelStoreBrowseResponse *v16;
  void *v17;
  MPModelStoreBrowseResponse *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  if (!v11)
    goto LABEL_6;
  v14 = [MPModelStoreBrowseResponse alloc];
  -[MPStoreModelRequestOperation request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPModelResponse initWithRequest:](v14, "initWithRequest:", v15);

  -[MPModelStoreBrowseResponse setParser:](v16, "setParser:", v10);
  if (objc_msgSend(v11, "numberOfSections") >= 1)
    -[MPModelResponse setResults:](v16, "setResults:", v11);
  -[MPModelStoreBrowseResponse setChangeDetails:](v16, "setChangeDetails:", v12);
  if (v16)
  {
    v17 = 0;
  }
  else
  {
LABEL_6:
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __98__MPModelStoreBrowseRequestOperation__produceResponseWithParser_results_changeDetails_completion___block_invoke;
    v20[3] = &unk_1E3163580;
    v20[4] = self;
    v20[5] = &v21;
    -[MPStoreModelRequestOperation dispatchSync:](self, "dispatchSync:", v20);
    if (*((_BYTE *)v22 + 24))
    {
      v18 = [MPModelStoreBrowseResponse alloc];
      -[MPStoreModelRequestOperation request](self, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MPModelResponse initWithRequest:](v18, "initWithRequest:", v19);

      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  v13[2](v13, v16, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsToPendingNestedRequestOperations, 0);
  objc_storeStrong((id *)&self->_nestedRequestsOperationQueue, 0);
  objc_storeStrong((id *)&self->_nestedRequestOperationsGroup, 0);
  objc_storeStrong((id *)&self->_individualPendingNestedRequestOperation, 0);
}

uint64_t __98__MPModelStoreBrowseRequestOperation__produceResponseWithParser_results_changeDetails_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 329);
  return result;
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isBrick") && !objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a3))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  __int128 v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a2;
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_3;
  v19[3] = &unk_1E3158C68;
  v20 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v21 = &v23;
  v22 = v8;
  objc_msgSend((id)v20, "dispatchSync:", v19);
  if (*((_BYTE *)v24 + 24))
  {
    v9 = *(NSObject **)(a1 + 48);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_4;
    block[3] = &unk_1E315B330;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 80);
    v17 = *(_QWORD *)(a1 + 72);
    v18 = v11;
    v12 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v15 = v12;
    v16 = *(id *)(a1 + 56);
    dispatch_async(v9, block);

  }
  _Block_object_dispose(&v23, 8);

}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 344), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 368), *(id *)(a1 + 48));
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_6(uint64_t a1)
{
  MPMutableSectionedCollection *v2;
  void *v3;
  id v4;
  uint64_t v5;
  MPMutableSectionedCollection *v6;
  _QWORD v7[4];
  MPMutableSectionedCollection *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = objc_alloc_init(MPMutableSectionedCollection);
    v3 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_7;
    v7[3] = &unk_1E3158CB8;
    v10 = *(_QWORD *)(a1 + 64);
    v8 = v2;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 72);
    v9 = v4;
    v11 = v5;
    v6 = v2;
    objc_msgSend(v4, "enumerateSectionsUsingBlock:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_produceResponseWithParser:results:changeDetails:completion:", *(_QWORD *)(a1 + 48), v6, 0, *(_QWORD *)(a1 + 56));

  }
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v16 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKey:", v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "numberOfSections") == 1)
    {
      objc_msgSend(v7, "firstSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "uniformContentItemType");
      if ((unint64_t)(v9 - 3) <= 1)
      {
        v10 = v9;
        objc_msgSend(v6, "sectionBuilder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "loadAdditionalContentURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:previouslyRetrievedNestedResponse:", v12, v13, v10, objc_msgSend(v8, "isMemberOfChartSet"), objc_msgSend(v16, "isBrick"), v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "appendSection:", v14);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_9;
        v17[3] = &unk_1E315F350;
        v18 = *(id *)(a1 + 32);
        objc_msgSend(v7, "enumerateItemsInSectionAtIndex:usingBlock:", 0, v17);

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendSection:", v16);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_8;
    v19[3] = &unk_1E315F350;
    v15 = *(void **)(a1 + 40);
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v15, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v19);
    v5 = v20;
  }

}

uint64_t __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:", a2);
}

uint64_t __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:", a2);
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 368), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 == *(void **)(*(_QWORD *)(a1[7] + 8) + 40);

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(*(id *)(a1[4] + 368), "removeObjectForKey:", a1[5]);
    if (!objc_msgSend(*(id *)(a1[4] + 368), "count"))
    {
      v3 = a1[4];
      v4 = *(void **)(v3 + 368);
      *(_QWORD *)(v3 + 368) = 0;

      v5 = a1[4];
      v6 = *(void **)(v5 + 344);
      *(_QWORD *)(v5 + 344) = 0;

    }
  }
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64), 0);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __81__MPModelStoreBrowseRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && !*(_QWORD *)(a1 + 64)
    && *(_QWORD *)(a1 + 72) == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_nestedRequestsOperationQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __92__MPModelStoreBrowseRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 360) = *(_QWORD *)(result + 40);
  return result;
}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "previousRetrievedNestedResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v3, "configureWithParentSection:", 0);
    objc_msgSend(v3, "setPreviousResponse:", v2);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_2;
    v12[3] = &unk_1E3158BF0;
    v14 = *(_QWORD *)(a1 + 48);
    v11 = *(int8x16_t *)(a1 + 32);
    v4 = (id)v11.i64[0];
    v13 = vextq_s8(v11, v11, 8uLL);
    v5 = objc_msgSend(v3, "newOperationWithResponseHandler:", v12);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 336), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "_nestedRequestsOperationQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  MPModelStoreBrowseResponse *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_3;
  v15[3] = &unk_1E3163580;
  v8 = *(_QWORD *)(a1 + 48);
  v15[4] = v7;
  v15[5] = v8;
  objc_msgSend(v7, "dispatchSync:", v15);
  v9 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v10 = 0;
  if (v5 && (v9 & 1) == 0)
  {
    v10 = -[MPModelResponse initWithRequest:]([MPModelStoreBrowseResponse alloc], "initWithRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "parser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelStoreBrowseResponse setParser:](v10, "setParser:", v11);

    objc_msgSend(v5, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelResponse setResults:](v10, "setResults:", v12);

    objc_msgSend(v5, "deferredSectionProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelResponse setDeferredSectionProperties:](v10, "setDeferredSectionProperties:", v13);

    objc_msgSend(v5, "deferredItemProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelResponse setDeferredItemProperties:](v10, "setDeferredItemProperties:", v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", v10, v6);

}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 336);
  if (v3 == *(void **)(*(_QWORD *)(v2 + 8) + 40))
  {
    *(_QWORD *)(v1 + 336) = 0;

  }
}

void __44__MPModelStoreBrowseRequestOperation_cancel__block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 336));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1[4] + 368);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1[4] + 368), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6), (_QWORD)v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        if (!v8)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v10 = *(_QWORD *)(a1[6] + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

          v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        }
        objc_msgSend(v8, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 344));
  v12 = a1[4];
  v13 = *(void **)(v12 + 336);
  *(_QWORD *)(v12 + 336) = 0;

  v14 = a1[4];
  v15 = *(void **)(v14 + 368);
  *(_QWORD *)(v14 + 368) = 0;

  v16 = a1[4];
  v17 = *(void **)(v16 + 344);
  *(_QWORD *)(v16 + 344) = 0;

}

@end
