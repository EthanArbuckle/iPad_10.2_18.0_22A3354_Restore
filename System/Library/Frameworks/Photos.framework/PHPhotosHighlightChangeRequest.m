@implementation PHPhotosHighlightChangeRequest

- (void)_initializeCurationHelpersWithHelper:(id)a3 xpcDict:(id)a4
{
  objc_class *v6;
  id v7;
  NSDictionary *v8;
  PHRelationshipChangeRequestHelper *v9;
  PHRelationshipChangeRequestHelper *v10;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *v12;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *v18;
  PHRelationshipChangeRequestHelper *v19;
  NSDictionary *curationHelpersByCurationType;
  id v21;

  v21 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (NSDictionary *)objc_alloc_init(v6);
  v9 = [PHRelationshipChangeRequestHelper alloc];
  if (v21)
  {
    v10 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:](v9, "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("summaryAssets"), v21, v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, &unk_1E3654880);

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("extendedAssets"), v21, v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, &unk_1E3654898);

    v12 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("dayGroupAssets"), v21, v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, &unk_1E36548B0);

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("dayGroupExtendedAssets"), v21, v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, &unk_1E36548C8);

    v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("dayGroupSummaryAssets"), v21, v7);
  }
  else
  {
    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:](v9, "initWithRelationshipName:changeRequestHelper:", CFSTR("summaryAssets"), v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, &unk_1E3654880);

    v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("extendedAssets"), v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, &unk_1E3654898);

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupAssets"), v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, &unk_1E36548B0);

    v18 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupExtendedAssets"), v7);
    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, &unk_1E36548C8);

    v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupSummaryAssets"), v7);
  }
  v19 = v14;

  -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, &unk_1E36548E0);
  curationHelpersByCurationType = self->_curationHelpersByCurationType;
  self->_curationHelpersByCurationType = v8;

}

- (id)initForNewObject
{
  PHPhotosHighlightChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *dayKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *monthKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v9;
  PHRelationshipChangeRequestHelper *yearKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *yearKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *dayKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *monthKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetSharedHelper;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PHPhotosHighlightChangeRequest;
  v2 = -[PHChangeRequest init](&v22, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAssetPrivate"), v2->super._helper);
    dayKeyAssetHelper = v2->_dayKeyAssetHelper;
    v2->_dayKeyAssetHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("monthKeyAssetPrivate"), v2->super._helper);
    monthKeyAssetHelper = v2->_monthKeyAssetHelper;
    v2->_monthKeyAssetHelper = v7;

    v9 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("yearKeyAssetPrivate"), v2->super._helper);
    yearKeyAssetHelper = v2->_yearKeyAssetHelper;
    v2->_yearKeyAssetHelper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupKeyAssetPrivate"), v2->super._helper);
    dayGroupKeyAssetHelper = v2->_dayGroupKeyAssetHelper;
    v2->_dayGroupKeyAssetHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("yearKeyAssetShared"), v2->super._helper);
    yearKeyAssetSharedHelper = v2->_yearKeyAssetSharedHelper;
    v2->_yearKeyAssetSharedHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAssetShared"), v2->super._helper);
    dayKeyAssetSharedHelper = v2->_dayKeyAssetSharedHelper;
    v2->_dayKeyAssetSharedHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("monthKeyAssetShared"), v2->super._helper);
    monthKeyAssetSharedHelper = v2->_monthKeyAssetSharedHelper;
    v2->_monthKeyAssetSharedHelper = v17;

    v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupKeyAssetShared"), v2->super._helper);
    dayGroupKeyAssetSharedHelper = v2->_dayGroupKeyAssetSharedHelper;
    v2->_dayGroupKeyAssetSharedHelper = v19;

    -[PHPhotosHighlightChangeRequest _initializeCurationHelpersWithHelper:xpcDict:](v2, "_initializeCurationHelpersWithHelper:xpcDict:", v2->super._helper, 0);
  }
  return v2;
}

- (PHPhotosHighlightChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHPhotosHighlightChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *dayKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *monthKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *yearKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *dayKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v21;
  PHRelationshipChangeRequestHelper *monthKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v23;
  PHRelationshipChangeRequestHelper *yearKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v25;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetSharedHelper;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHPhotosHighlightChangeRequest;
  v8 = -[PHChangeRequest init](&v28, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAssetPrivate"), v8->super._helper);
    dayKeyAssetHelper = v8->_dayKeyAssetHelper;
    v8->_dayKeyAssetHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("monthKeyAssetPrivate"), v8->super._helper);
    monthKeyAssetHelper = v8->_monthKeyAssetHelper;
    v8->_monthKeyAssetHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("yearKeyAssetPrivate"), v8->super._helper);
    yearKeyAssetHelper = v8->_yearKeyAssetHelper;
    v8->_yearKeyAssetHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupKeyAssetPrivate"), v8->super._helper);
    dayGroupKeyAssetHelper = v8->_dayGroupKeyAssetHelper;
    v8->_dayGroupKeyAssetHelper = v17;

    v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAssetShared"), v8->super._helper);
    dayKeyAssetSharedHelper = v8->_dayKeyAssetSharedHelper;
    v8->_dayKeyAssetSharedHelper = v19;

    v21 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("monthKeyAssetShared"), v8->super._helper);
    monthKeyAssetSharedHelper = v8->_monthKeyAssetSharedHelper;
    v8->_monthKeyAssetSharedHelper = v21;

    v23 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("yearKeyAssetShared"), v8->super._helper);
    yearKeyAssetSharedHelper = v8->_yearKeyAssetSharedHelper;
    v8->_yearKeyAssetSharedHelper = v23;

    v25 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("dayGroupKeyAssetShared"), v8->super._helper);
    dayGroupKeyAssetSharedHelper = v8->_dayGroupKeyAssetSharedHelper;
    v8->_dayGroupKeyAssetSharedHelper = v25;

    -[PHPhotosHighlightChangeRequest _initializeCurationHelpersWithHelper:xpcDict:](v8, "_initializeCurationHelpersWithHelper:xpcDict:", v8->super._helper, 0);
  }

  return v8;
}

- (PHPhotosHighlightChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHPhotosHighlightChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *dayKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *monthKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v18;
  PHRelationshipChangeRequestHelper *yearKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v20;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetHelper;
  PHRelationshipChangeRequestHelper *v22;
  PHRelationshipChangeRequestHelper *dayKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v24;
  PHRelationshipChangeRequestHelper *monthKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v26;
  PHRelationshipChangeRequestHelper *yearKeyAssetSharedHelper;
  PHRelationshipChangeRequestHelper *v28;
  PHRelationshipChangeRequestHelper *dayGroupKeyAssetSharedHelper;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PHPhotosHighlightChangeRequest;
  v11 = -[PHChangeRequest init](&v31, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keyAssetPrivate"), v8, v11->super._helper);
      dayKeyAssetHelper = v11->_dayKeyAssetHelper;
      v11->_dayKeyAssetHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("monthKeyAssetPrivate"), v8, v11->super._helper);
      monthKeyAssetHelper = v11->_monthKeyAssetHelper;
      v11->_monthKeyAssetHelper = v16;

      v18 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("yearKeyAssetPrivate"), v8, v11->super._helper);
      yearKeyAssetHelper = v11->_yearKeyAssetHelper;
      v11->_yearKeyAssetHelper = v18;

      v20 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("dayGroupKeyAssetPrivate"), v8, v11->super._helper);
      dayGroupKeyAssetHelper = v11->_dayGroupKeyAssetHelper;
      v11->_dayGroupKeyAssetHelper = v20;

      v22 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keyAssetShared"), v8, v11->super._helper);
      dayKeyAssetSharedHelper = v11->_dayKeyAssetSharedHelper;
      v11->_dayKeyAssetSharedHelper = v22;

      v24 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("monthKeyAssetShared"), v8, v11->super._helper);
      monthKeyAssetSharedHelper = v11->_monthKeyAssetSharedHelper;
      v11->_monthKeyAssetSharedHelper = v24;

      v26 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("yearKeyAssetShared"), v8, v11->super._helper);
      yearKeyAssetSharedHelper = v11->_yearKeyAssetSharedHelper;
      v11->_yearKeyAssetSharedHelper = v26;

      v28 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("dayGroupKeyAssetShared"), v8, v11->super._helper);
      dayGroupKeyAssetSharedHelper = v11->_dayGroupKeyAssetSharedHelper;
      v11->_dayGroupKeyAssetSharedHelper = v28;

      -[PHPhotosHighlightChangeRequest _initializeCurationHelpersWithHelper:xpcDict:](v11, "_initializeCurationHelpersWithHelper:xpcDict:", v11->super._helper, v8);
    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD aBlock[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PHPhotosHighlightChangeRequest_encodeToXPCDict___block_invoke;
  aBlock[3] = &unk_1E35D5C88;
  v5 = v4;
  v27 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v5);

  -[PHPhotosHighlightChangeRequest dayKeyAssetHelper](self, "dayKeyAssetHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  -[PHPhotosHighlightChangeRequest monthKeyAssetHelper](self, "monthKeyAssetHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);

  -[PHPhotosHighlightChangeRequest yearKeyAssetHelper](self, "yearKeyAssetHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10);

  -[PHPhotosHighlightChangeRequest dayGroupKeyAssetHelper](self, "dayGroupKeyAssetHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);

  -[PHPhotosHighlightChangeRequest dayKeyAssetSharedHelper](self, "dayKeyAssetSharedHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12);

  -[PHPhotosHighlightChangeRequest monthKeyAssetSharedHelper](self, "monthKeyAssetSharedHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v13);

  -[PHPhotosHighlightChangeRequest yearKeyAssetSharedHelper](self, "yearKeyAssetSharedHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v14);

  -[PHPhotosHighlightChangeRequest dayGroupKeyAssetSharedHelper](self, "dayGroupKeyAssetSharedHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v15);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PHPhotosHighlightChangeRequest curationHelpersByCurationType](self, "curationHelpersByCurationType", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        v6[2](v6, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v19);
  }

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("PhotosHighlight");
}

- (NSString)dateDescription
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setDateDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("title"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("title"));
  }

}

- (NSString)smartDescription
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setSmartDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("subtitle"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("subtitle"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("subtitle"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("subtitle"));
  }

}

- (NSString)verboseSmartDescription
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("verboseSmartDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setVerboseSmartDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("verboseSmartDescription"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("verboseSmartDescription"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("verboseSmartDescription"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("verboseSmartDescription"));
  }

}

- (double)promotionScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("promotionScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setPromotionScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("promotionScore"));

}

- (unsigned)enrichmentState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("enrichmentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("enrichmentState"));

}

- (NSDate)lastEnrichmentDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastEnrichmentDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setLastEnrichmentDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastEnrichmentDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("lastEnrichmentDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("lastEnrichmentDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("lastEnrichmentDate"));
  }

}

- (unint64_t)mood
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("mood"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setMood:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("mood"));

}

- (signed)enrichmentVersion
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("enrichmentVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setEnrichmentVersion:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("enrichmentVersion"));

}

- (unsigned)visibilityState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("visibilityState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setVisibilityState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("visibilityState"));

}

- (unsigned)kind
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setKind:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kind"));

}

- (NSString)dateDescriptionShared
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("titleShared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setDateDescriptionShared:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("titleShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("titleShared"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("titleShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("titleShared"));
  }

}

- (NSString)dateDescriptionMixed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("titleMixed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setDateDescriptionMixed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("titleMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("titleMixed"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("titleMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("titleMixed"));
  }

}

- (NSString)smartDescriptionShared
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("subtitleShared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setSmartDescriptionShared:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("subtitleShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("subtitleShared"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("subtitleShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("subtitleShared"));
  }

}

- (NSString)smartDescriptionMixed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("subtitleMixed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setSmartDescriptionMixed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("subtitleMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("subtitleMixed"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("subtitleMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("subtitleMixed"));
  }

}

- (NSString)verboseSmartDescriptionShared
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("verboseSmartDescriptionShared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setVerboseSmartDescriptionShared:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("verboseSmartDescriptionShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("verboseSmartDescriptionShared"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("verboseSmartDescriptionShared"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("verboseSmartDescriptionShared"));
  }

}

- (NSString)verboseSmartDescriptionMixed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("verboseSmartDescriptionMixed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setVerboseSmartDescriptionMixed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("verboseSmartDescriptionMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("verboseSmartDescriptionMixed"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("verboseSmartDescriptionMixed"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("verboseSmartDescriptionMixed"));
  }

}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("mixedSharingCompositionKeyAssetRelationship"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("mixedSharingCompositionKeyAssetRelationship"));

}

- (unsigned)visibilityStateShared
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("visibilityStateShared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setVisibilityStateShared:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("visibilityStateShared"));

}

- (unsigned)visibilityStateMixed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("visibilityStateMixed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (unsigned __int16)v3;
}

- (void)setVisibilityStateMixed:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("visibilityStateMixed"));

}

- (void)setKeyAssetPrivate:(id)a3 userEdited:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  PLObjectIDOrUUIDFromPHObject(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest didMutate](self, "didMutate");
  -[PHPhotosHighlightChangeRequest _mutableKeyAssetObjectIDsAndUUIDsForShared:userEdited:](self, "_mutableKeyAssetObjectIDsAndUUIDsForShared:userEdited:", 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  else
  {
    objc_msgSend(v7, "removeAllObjects");
  }

}

- (void)setKeyAssetPrivate:(id)a3
{
  -[PHPhotosHighlightChangeRequest setKeyAssetPrivate:userEdited:](self, "setKeyAssetPrivate:userEdited:", a3, 0);
}

- (void)setKeyAssetShared:(id)a3 userEdited:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  PLObjectIDOrUUIDFromPHObject(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlightChangeRequest _mutableKeyAssetObjectIDsAndUUIDsForShared:userEdited:](self, "_mutableKeyAssetObjectIDsAndUUIDsForShared:userEdited:", 1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  else
  {
    objc_msgSend(v7, "removeAllObjects");
  }

}

- (void)setKeyAssetShared:(id)a3
{
  -[PHPhotosHighlightChangeRequest setKeyAssetShared:userEdited:](self, "setKeyAssetShared:userEdited:", a3, 0);
}

- (unsigned)_internalCurationTypeForExternalCurationType:(unsigned __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int16 v8;

  v3 = a3;
  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "kind");

  }
  else
  {
    v7 = -[PHPhotosHighlightChangeRequest kind](self, "kind");
  }

  if (v3 == 1)
    v8 = 5;
  else
    v8 = 3;
  if (v3 == 2)
    v8 = 4;
  if (v7 != 3)
    v8 = 0;
  if (v7 >= 3)
    return v8;
  else
    return v3;
}

- (unsigned)_externalCurationTypeForInternalCurationType:(unsigned __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int16 v8;

  v3 = a3;
  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "kind");

  }
  else
  {
    v7 = -[PHPhotosHighlightChangeRequest kind](self, "kind");
  }

  v8 = v3 == 5;
  if (v3 == 4)
    v8 = 2;
  if (v7 != 3)
    v8 = 0;
  if (v7 >= 3)
    return v8;
  else
    return v3;
}

- (void)clearCurationWithType:(unsigned __int16)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[PHPhotosHighlightChangeRequest _internalCurationTypeForExternalCurationType:](self, "_internalCurationTypeForExternalCurationType:", a3);
  -[PHPhotosHighlightChangeRequest curationHelpersByCurationType](self, "curationHelpersByCurationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHPhotosHighlightChangeRequest _mutableAssetObjectIDsAndUUIDsForCurationType:](self, "_mutableAssetObjectIDsAndUUIDsForCurationType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

  }
}

- (void)setAssets:(id)a3 forCurationType:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = -[PHPhotosHighlightChangeRequest _internalCurationTypeForExternalCurationType:](self, "_internalCurationTypeForExternalCurationType:", v4);
  -[PHPhotosHighlightChangeRequest curationHelpersByCurationType](self, "curationHelpersByCurationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PHChangeRequest didMutate](self, "didMutate");
      -[PHPhotosHighlightChangeRequest _mutableAssetObjectIDsAndUUIDsForCurationType:](self, "_mutableAssetObjectIDsAndUUIDsForCurationType:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setArray:", v10);

    }
  }

}

- (id)placeholderForCreatedPhotosHighlight
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D719E8];
  objc_msgSend(a3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewPhotosHighlightInManagedObjectContext:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHChangeRequest uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUuid:", v9);

  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v10, "obtainPermanentIDsForObjects:error:", v11, &v16);
  v13 = v16;

  if (v12)
  {
    v14 = v8;
  }
  else
  {
    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v14;
}

- (void)didEnrichHighlight
{
  void *v3;
  uint64_t v4;

  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "highlightVersion");

  -[PHPhotosHighlightChangeRequest setEnrichmentVersion:](self, "setEnrichmentVersion:", v4);
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v53;
  PHPhotosHighlightChangeRequest *v54;
  id v55;
  id *v56;
  id v57;
  void *v58;
  id obj;
  id obja;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _QWORD v72[8];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  _BOOL4 v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v11 = objc_msgSend(v10, "applyMutationsToManagedObject:error:", v8, &v71);
  v12 = v71;

  -[PHChangeRequest helper](self, "helper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mutations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v30 = 0;
    if (!a5)
      goto LABEL_34;
    goto LABEL_32;
  }
  v55 = v9;
  v56 = a5;
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = -[PHChangeRequest isMutated](self, "isMutated");
    *(_DWORD *)buf = 67109378;
    v76 = v16;
    v77 = 2112;
    v78 = v14;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
  }
  v58 = v14;

  v57 = v8;
  v17 = v8;
  v54 = self;
  -[PHPhotosHighlightChangeRequest curationHelpersByCurationType](self, "curationHelpersByCurationType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v18, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v68;
    v22 = 1;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v68 != v21)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        if (objc_msgSend(v24, "unsignedShortValue"))
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAllowsInsert:", 1);
          objc_msgSend(v25, "setAllowsRemove:", 1);
          objc_msgSend(MEMORY[0x1E0D71880], "entityName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDestinationEntityName:", v26);

          objc_msgSend(v25, "setIsDestinationObjectValid:", &__block_literal_global_179);
          objc_msgSend(v25, "relationshipName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mutableSetValueForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = v12;
          v22 = objc_msgSend(v25, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v17, v28, &v66);
          v29 = v66;

          v12 = v29;
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v20);
  }
  else
  {
    v22 = 1;
  }

  objc_msgSend(v58, "objectForKey:", CFSTR("enrichmentState"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {

  }
  else
  {
    objc_msgSend(v58, "objectForKey:", CFSTR("enrichmentVersion"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      goto LABEL_21;
  }
  objc_msgSend(v17, "photoLibrary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "libraryServicesManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "backgroundJobService");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "signalBackgroundProcessingNeededOnLibrary:", v36);

LABEL_21:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[PHPhotosHighlightChangeRequest dayKeyAssetHelper](v54, "dayKeyAssetHelper");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v72[0] = obja;
  -[PHPhotosHighlightChangeRequest dayKeyAssetSharedHelper](v54, "dayKeyAssetSharedHelper");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v53;
  -[PHPhotosHighlightChangeRequest monthKeyAssetHelper](v54, "monthKeyAssetHelper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v37;
  -[PHPhotosHighlightChangeRequest monthKeyAssetSharedHelper](v54, "monthKeyAssetSharedHelper");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v38;
  -[PHPhotosHighlightChangeRequest yearKeyAssetHelper](v54, "yearKeyAssetHelper");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v39;
  -[PHPhotosHighlightChangeRequest yearKeyAssetSharedHelper](v54, "yearKeyAssetSharedHelper");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v40;
  -[PHPhotosHighlightChangeRequest dayGroupKeyAssetHelper](v54, "dayGroupKeyAssetHelper");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v41;
  -[PHPhotosHighlightChangeRequest dayGroupKeyAssetSharedHelper](v54, "dayGroupKeyAssetSharedHelper");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v63 != v46)
          objc_enumerationMutation(v43);
        if ((v22 & 1) != 0)
        {
          v48 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v48, "mutableObjectIDsAndUUIDs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            objc_msgSend(v48, "setAllowsInsert:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setDestinationEntityName:", v50);

            objc_msgSend(v48, "setIsDestinationObjectValid:", &__block_literal_global_100);
            v61 = v12;
            v22 = objc_msgSend(v48, "applyMutationsToManagedObjectToOneRelationship:error:", v17, &v61);
            v51 = v61;

            v12 = v51;
          }
        }
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v45);
  }

  v30 = v22 & 1;
  a5 = v56;
  v8 = v57;
  v9 = v55;
  v14 = v58;
  if (v56)
  {
LABEL_32:
    if (!v30)
      *a5 = objc_retainAutorelease(v12);
  }
LABEL_34:

  return v30;
}

- (id)_mutableKeyAssetObjectIDsAndUUIDsForShared:(BOOL)a3 userEdited:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  int *v9;
  int *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "kind");

  }
  else
  {
    v8 = -[PHPhotosHighlightChangeRequest kind](self, "kind");
  }

  switch(v8)
  {
    case 0:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayKeyAssetSharedHelper;
      goto LABEL_10;
    case 1:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__monthKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__monthKeyAssetSharedHelper;
      goto LABEL_10;
    case 2:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__yearKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__yearKeyAssetSharedHelper;
      goto LABEL_10;
    case 3:
      v9 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayGroupKeyAssetHelper;
      v10 = &OBJC_IVAR___PHPhotosHighlightChangeRequest__dayGroupKeyAssetSharedHelper;
LABEL_10:
      if (v4)
        v9 = v10;
      v11 = *(id *)((char *)&self->super.super.isa + *v9);
      break;
    default:
      v11 = 0;
      break;
  }
  objc_msgSend(v11, "originalObjectIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v11, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v11, "originalObjectIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v11, "setMutableObjectIDsAndUUIDs:", v15);

  }
  objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_mutableAssetObjectIDsAndUUIDsForCurationType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[PHPhotosHighlightChangeRequest curationHelpersByCurationType](self, "curationHelpersByCurationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "originalObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PHPhotosHighlightChangeRequest _existentCuratedAssetObjectIDsForCurationType:](self, "_existentCuratedAssetObjectIDsForCurationType:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOriginalObjectIDs:", v9);

    }
    objc_msgSend(v7, "mutableObjectIDsAndUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMutableObjectIDsAndUUIDs:", v11);

    }
    objc_msgSend(v7, "mutableObjectIDsAndUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_existentAssetObjectIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setHighlightCurationType:", 0);
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_existentCuratedAssetObjectIDsForCurationType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[PHPhotosHighlightChangeRequest originalHighlight](self, "originalHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHighlightCurationType:", -[PHPhotosHighlightChangeRequest _externalCurationTypeForInternalCurationType:](self, "_externalCurationTypeForInternalCurationType:", v3));
    objc_msgSend(v8, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v8, "setIncludeTrashedAssets:", 1);
    +[PHQuery queryForCuratedAssetsInPhotosHighlight:options:](PHQuery, "queryForCuratedAssetsInPhotosHighlight:options:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  +[PHRelationshipChangeRequestHelper existentObjectIDsUsingQuery:](PHRelationshipChangeRequestHelper, "existentObjectIDsUsingQuery:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)verboseSmartDescriptionUserEdited
{
  return self->_verboseSmartDescriptionUserEdited;
}

- (void)setVerboseSmartDescriptionUserEdited:(id)a3
{
  objc_storeStrong((id *)&self->_verboseSmartDescriptionUserEdited, a3);
}

- (PHRelationshipChangeRequestHelper)dayKeyAssetHelper
{
  return self->_dayKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)monthKeyAssetHelper
{
  return self->_monthKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)yearKeyAssetHelper
{
  return self->_yearKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetHelper
{
  return self->_dayGroupKeyAssetHelper;
}

- (PHPhotosHighlight)originalHighlight
{
  return self->_originalHighlight;
}

- (void)setOriginalHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_originalHighlight, a3);
}

- (NSDictionary)curationHelpersByCurationType
{
  return self->_curationHelpersByCurationType;
}

- (PHRelationshipChangeRequestHelper)dayGroupKeyAssetSharedHelper
{
  return self->_dayGroupKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)monthKeyAssetSharedHelper
{
  return self->_monthKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)dayKeyAssetSharedHelper
{
  return self->_dayKeyAssetSharedHelper;
}

- (PHRelationshipChangeRequestHelper)yearKeyAssetSharedHelper
{
  return self->_yearKeyAssetSharedHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_dayKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetSharedHelper, 0);
  objc_storeStrong((id *)&self->_curationHelpersByCurationType, 0);
  objc_storeStrong((id *)&self->_originalHighlight, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_dayKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionUserEdited, 0);
}

uint64_t __83__PHPhotosHighlightChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __83__PHPhotosHighlightChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __50__PHPhotosHighlightChangeRequest_encodeToXPCDict___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeToXPCDict:", *(_QWORD *)(a1 + 32));
}

+ (id)changeRequestForPhotosHighlight:(id)a3
{
  id v3;
  PHPhotosHighlightChangeRequest *v4;
  void *v5;
  void *v6;
  PHPhotosHighlightChangeRequest *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHPhotosHighlightChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHPhotosHighlightChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHPhotosHighlightChangeRequest setOriginalHighlight:](v7, "setOriginalHighlight:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)deletePhotosHighlights:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHPhotosHighlightDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

@end
