@implementation PHLibraryScopeChangeRequest

- (id)initForNewObject
{
  PHLibraryScopeChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHShareRelationshipChangeRequestHelper *v5;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  NSArray *assetUUIDsManuallyAddedToLibraryScope;
  NSArray *v8;
  NSArray *assetUUIDsManuallyRemovedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedAddedToLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
  NSArray *assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
  NSArray *participantsAddedToLibraryScope;
  NSArray *participantsRemovedFromLibraryScope;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PHLibraryScopeChangeRequest;
  v2 = -[PHChangeRequest init](&v18, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("participants"), v2->super._helper);
    participantsHelper = v2->_participantsHelper;
    v2->_participantsHelper = v5;

    v2->_runningAsUnitTest = MEMORY[0x19AEBDFF0]();
    assetUUIDsManuallyAddedToLibraryScope = v2->_assetUUIDsManuallyAddedToLibraryScope;
    v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)MEMORY[0x1E0C9AA60];

    assetUUIDsManuallyRemovedFromLibraryScope = v2->_assetUUIDsManuallyRemovedFromLibraryScope;
    v2->_assetUUIDsManuallyRemovedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedAddedToLibraryScope = v2->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v2->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v8;

    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v8;

    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v2->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v2->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v8;

    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v2->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v2->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v8;

    participantsAddedToLibraryScope = v2->_participantsAddedToLibraryScope;
    v2->_participantsAddedToLibraryScope = v8;

    participantsRemovedFromLibraryScope = v2->_participantsRemovedFromLibraryScope;
    v2->_participantsRemovedFromLibraryScope = v8;

  }
  return v2;
}

- (PHLibraryScopeChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHLibraryScopeChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHShareRelationshipChangeRequestHelper *v11;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  NSArray *assetUUIDsManuallyAddedToLibraryScope;
  NSArray *v14;
  NSArray *assetUUIDsManuallyRemovedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedAddedToLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
  NSArray *assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
  NSArray *assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
  NSArray *participantsAddedToLibraryScope;
  NSArray *participantsRemovedFromLibraryScope;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHLibraryScopeChangeRequest;
  v8 = -[PHChangeRequest init](&v24, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("participants"), v8->super._helper);
    participantsHelper = v8->_participantsHelper;
    v8->_participantsHelper = v11;

    v8->_runningAsUnitTest = MEMORY[0x19AEBDFF0]();
    assetUUIDsManuallyAddedToLibraryScope = v8->_assetUUIDsManuallyAddedToLibraryScope;
    v14 = (NSArray *)MEMORY[0x1E0C9AA60];
    v8->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)MEMORY[0x1E0C9AA60];

    assetUUIDsManuallyRemovedFromLibraryScope = v8->_assetUUIDsManuallyRemovedFromLibraryScope;
    v8->_assetUUIDsManuallyRemovedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedAddedToLibraryScope = v8->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v8->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v14;

    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v14;

    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v8->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v8->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v14;

    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v8->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v8->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v14;

    participantsAddedToLibraryScope = v8->_participantsAddedToLibraryScope;
    v8->_participantsAddedToLibraryScope = v14;

    participantsRemovedFromLibraryScope = v8->_participantsRemovedFromLibraryScope;
    v8->_participantsRemovedFromLibraryScope = v14;

  }
  return v8;
}

- (PHLibraryScopeChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHLibraryScopeChangeRequest *v9;
  PHChangeRequestHelper *v10;
  PHChangeRequestHelper *helper;
  PHShareRelationshipChangeRequestHelper *v12;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  uint64_t v14;
  NSArray *assetUUIDsManuallyAddedToLibraryScope;
  uint64_t v16;
  NSArray *assetUUIDsManuallyRemovedFromLibraryScope;
  uint64_t v18;
  NSArray *assetUUIDsPhotosSuggestedAddedToLibraryScope;
  uint64_t v20;
  NSArray *assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
  uint64_t v22;
  NSArray *assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
  uint64_t v24;
  NSArray *assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
  uint64_t v26;
  NSArray *assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
  uint64_t v28;
  NSArray *participantsAddedToLibraryScope;
  uint64_t v30;
  NSArray *participantsRemovedFromLibraryScope;
  id v33;
  id v34;
  objc_super v35;

  v8 = a3;
  v34 = a4;
  v33 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PHLibraryScopeChangeRequest;
  v9 = -[PHChangeRequest init](&v35, sel_init);
  if (v9)
  {
    v10 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v9, v34, v33);
    helper = v9->super._helper;
    v9->super._helper = v10;

    v12 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("participants"), v8, v9->super._helper);
    participantsHelper = v9->_participantsHelper;
    v9->_participantsHelper = v12;

    v9->_runningAsUnitTest = xpc_dictionary_get_BOOL(v8, "runningAsUnitTest");
    PLArrayFromXPCDictionary();
    v14 = objc_claimAutoreleasedReturnValue();
    assetUUIDsManuallyAddedToLibraryScope = v9->_assetUUIDsManuallyAddedToLibraryScope;
    v9->_assetUUIDsManuallyAddedToLibraryScope = (NSArray *)v14;

    PLArrayFromXPCDictionary();
    v16 = objc_claimAutoreleasedReturnValue();
    assetUUIDsManuallyRemovedFromLibraryScope = v9->_assetUUIDsManuallyRemovedFromLibraryScope;
    v9->_assetUUIDsManuallyRemovedFromLibraryScope = (NSArray *)v16;

    PLArrayFromXPCDictionary();
    v18 = objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedAddedToLibraryScope = v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope = (NSArray *)v18;

    PLArrayFromXPCDictionary();
    v20 = objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = (NSArray *)v20;

    PLArrayFromXPCDictionary();
    v22 = objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = (NSArray *)v22;

    PLArrayFromXPCDictionary();
    v24 = objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = (NSArray *)v24;

    PLArrayFromXPCDictionary();
    v26 = objc_claimAutoreleasedReturnValue();
    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = (NSArray *)v26;

    PLArrayFromXPCDictionary();
    v28 = objc_claimAutoreleasedReturnValue();
    participantsAddedToLibraryScope = v9->_participantsAddedToLibraryScope;
    v9->_participantsAddedToLibraryScope = (NSArray *)v28;

    PLArrayFromXPCDictionary();
    v30 = objc_claimAutoreleasedReturnValue();
    participantsRemovedFromLibraryScope = v9->_participantsRemovedFromLibraryScope;
    v9->_participantsRemovedFromLibraryScope = (NSArray *)v30;

    if (v9->_runningAsUnitTest
      || v9->_assetUUIDsManuallyAddedToLibraryScope
      || v9->_assetUUIDsManuallyRemovedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedAddedToLibraryScope
      || v9->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope
      || v9->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope
      || v9->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope
      || v9->_participantsAddedToLibraryScope
      || v9->_participantsRemovedFromLibraryScope)
    {
      -[PHChangeRequestHelper setMutated:](v9->super._helper, "setMutated:", 1, 64);
      objc_msgSend(v34, "recordUpdateRequest:", v9);
    }
  }

  return v9;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  void *v5;
  xpc_object_t xdict;

  xdict = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", xdict);

  -[PHLibraryScopeChangeRequest participantsHelper](self, "participantsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", xdict);

  xpc_dictionary_set_BOOL(xdict, "runningAsUnitTest", self->_runningAsUnitTest);
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();
  PLXPCDictionarySetArray();

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("LibraryScope");
}

- (PHObjectPlaceholder)placeholderForCreatedLibraryScope
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (NSString)title
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

- (void)setTitle:(id)a3
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

- (NSDate)creationDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setCreationDate:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("creationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("creationDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("creationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("creationDate"));
  }

}

- (id)rulesData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("rulesData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setRulesData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("rulesData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("rulesData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("rulesData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("rulesData"));
  }

}

- (id)scopeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("scopeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setScopeIdentifier:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("scopeIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("scopeIdentifier"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("scopeIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("scopeIdentifier"));
  }

}

- (id)trashedDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("trashedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTrashedDate:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("trashedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("trashedDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("trashedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("trashedDate"));
  }

}

- (id)lastParticipantAssetTrashNotificationDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastParticipantAssetTrashNotificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLastParticipantAssetTrashNotificationDate:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastParticipantAssetTrashNotificationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("lastParticipantAssetTrashNotificationDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("lastParticipantAssetTrashNotificationDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("lastParticipantAssetTrashNotificationDate"));
  }

}

- (signed)participantCloudUpdateState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("participantCloudUpdateState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setParticipantCloudUpdateState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("participantCloudUpdateState"));

}

- (signed)previewState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("previewState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setPreviewState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("previewState"));

}

- (signed)scopeSyncingState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("scopeSyncingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setScopeSyncingState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("scopeSyncingState"));

}

- (signed)status
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setStatus:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("status"));

}

- (int64_t)scopeType
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("scopeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setScopeType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("scopeType"));

}

- (signed)localPublishState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("localPublishState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setLocalPublishState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("localPublishState"));

}

- (signed)exitState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("exitState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setExitState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("exitState"));

}

- (void)setPendingLibraryScopeInvitationToPreviewState
{
  -[PHLibraryScopeChangeRequest setPreviewState:](self, "setPreviewState:", 1);
}

- (signed)autoSharePolicy
{
  void *v3;
  void *v4;
  void *v5;
  signed __int16 v6;
  id WeakRetained;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("autoSharePolicy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_originalLibraryScope);
    v6 = objc_msgSend(WeakRetained, "autoSharePolicy");

  }
  return v6;
}

- (void)setAutoSharePolicy:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("autoSharePolicy"));

  if ((_DWORD)v3 != 2)
    -[PHLibraryScopeChangeRequest updateWithCustomRules:](self, "updateWithCustomRules:", 0);
}

- (void)moveToSharedLibrary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsManuallyAddedToLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsManuallyAddedToLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsManuallyAddedToLibraryScope = self->_assetUUIDsManuallyAddedToLibraryScope;
    self->_assetUUIDsManuallyAddedToLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)moveToPersonalLibrary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsManuallyRemovedFromLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsManuallyRemovedFromLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsManuallyRemovedFromLibraryScope = self->_assetUUIDsManuallyRemovedFromLibraryScope;
    self->_assetUUIDsManuallyRemovedFromLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)addPreviewAssetsSuggestedByPhotos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsPhotosSuggestedAddedToLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsPhotosSuggestedAddedToLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedAddedToLibraryScope = self->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
    self->_assetUUIDsPhotosSuggestedAddedToLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)removePreviewAssetsSuggestedByPhotos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedRemovedFromLibraryScope = self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)rejectPreviewAssetsSuggestedByPhotos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedRejectedFromLibraryScope = self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)unRejectPreviewAssetsSuggestedByPhotos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
    self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)markAssetsAsRejectedByPhotosSuggester:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "localIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope, "arrayByAddingObjectsFromArray:", v5);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
    self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope = v13;

    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)_updateParticipantCloudUpdateStateIfNecessary
{
  PHLibraryScope **p_originalLibraryScope;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;

  p_originalLibraryScope = &self->_originalLibraryScope;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalLibraryScope);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_originalLibraryScope);
    v7 = objc_msgSend(v6, "publishState");

    if (v7 == 2)
      -[PHLibraryScopeChangeRequest setParticipantCloudUpdateState:](self, "setParticipantCloudUpdateState:", 1);
  }
}

- (void)addParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *participantsAddedToLibraryScope;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHLibraryScopeChangeRequest participantsHelper](self, "participantsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addParticipants:toChangeRequest:", v4, self);

  -[PHLibraryScopeChangeRequest _updateParticipantCloudUpdateStateIfNecessary](self, "_updateParticipantCloudUpdateStateIfNecessary");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        participantsAddedToLibraryScope = self->_participantsAddedToLibraryScope;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "uuid", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray arrayByAddingObject:](participantsAddedToLibraryScope, "arrayByAddingObject:", v12);
        v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = self->_participantsAddedToLibraryScope;
        self->_participantsAddedToLibraryScope = v13;

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)removeParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *participantsRemovedFromLibraryScope;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHLibraryScopeChangeRequest participantsHelper](self, "participantsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeParticipants:toChangeRequest:", v4, self);

  -[PHLibraryScopeChangeRequest _updateParticipantCloudUpdateStateIfNecessary](self, "_updateParticipantCloudUpdateStateIfNecessary");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        participantsRemovedFromLibraryScope = self->_participantsRemovedFromLibraryScope;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "uuid", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray arrayByAddingObject:](participantsRemovedFromLibraryScope, "arrayByAddingObject:", v12);
        v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = self->_participantsRemovedFromLibraryScope;
        self->_participantsRemovedFromLibraryScope = v13;

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  +[PHShareParticipantChangeRequest deleteShareParticipants:](PHShareParticipantChangeRequest, "deleteShareParticipants:", v6);
}

- (void)updateWithCustomRules:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "_pl_map:", &__block_literal_global_26105);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71828], "dataForLibraryScopeRules:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHLibraryScopeChangeRequest setRulesData:](self, "setRulesData:", v5);

  }
  else
  {
    -[PHLibraryScopeChangeRequest setRulesData:](self, "setRulesData:", 0);
  }

}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__26096;
  v27 = __Block_byref_object_dispose__26097;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v8 = 1;
  v22 = 1;
  if (!self->_runningAsUnitTest)
  {
    if ((objc_msgSend(v6, "isCloudPhotoLibraryEnabled") & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      *((_BYTE *)v20 + 24) = 0;
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Unable to insert a new LibraryScope since iCPL is disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v24[5];
      v24[5] = v11;

    }
    v8 = *((unsigned __int8 *)v20 + 24);
    if (*((_BYTE *)v20 + 24))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __68__PHLibraryScopeChangeRequest_validateInsertIntoPhotoLibrary_error___block_invoke;
      v15[3] = &unk_1E35DF160;
      v16 = v7;
      v17 = &v19;
      v18 = &v23;
      objc_msgSend(v16, "performBlockAndWait:", v15);

      v8 = *((unsigned __int8 *)v20 + 24);
    }
    if (a4 && !v8)
    {
      *a4 = objc_retainAutorelease((id)v24[5]);
      v8 = *((unsigned __int8 *)v20 + 24);
    }
  }
  v13 = v8 != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0D71808];
  v7 = a3;
  -[PHChangeRequest uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScopeChangeRequest creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScopeChangeRequest title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createOwnedShareWithUUID:creationDate:title:unitTestMode:inPhotoLibrary:", v8, v9, v10, self->_runningAsUnitTest, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __int16 v23;
  void *v25;
  void *v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  _BOOL4 v36;
  BOOL v37;
  void *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[15];

  v48[13] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v8, v9, &v39);
  v12 = v39;

  if (v11)
  {
    v48[0] = CFSTR("title");
    v48[1] = CFSTR("autoSharePolicy");
    v48[2] = CFSTR("rulesData");
    v48[3] = CFSTR("participantCloudUpdateState");
    v48[4] = CFSTR("scopeSyncingState");
    v48[5] = CFSTR("status");
    v48[6] = CFSTR("scopeType");
    v48[7] = CFSTR("localPublishState");
    v48[8] = CFSTR("scopeIdentifier");
    v48[9] = CFSTR("previewState");
    v48[10] = CFSTR("exitState");
    v48[11] = CFSTR("trashedDate");
    v48[12] = CFSTR("lastParticipantAssetTrashNotificationDate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 13);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || (objc_msgSend(v13, "containsObject:", v9) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on key %@"), v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v12 = (id)v18;
    }

  }
  else
  {
    v14 = 0;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("autoSharePolicy")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("rulesData")))
  {
    v19 = v8;
    -[PHChangeRequest helper](self, "helper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mutations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("autoSharePolicy"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v23 = objc_msgSend(v22, "intValue");
    else
      v23 = objc_msgSend(v19, "autoSharePolicy");
    if (v23 == 2 && v14)
    {
      -[PHLibraryScopeChangeRequest rulesData](self, "rulesData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2D50];
        v45 = CFSTR("AutoSharePolicy set to CustomRuleShare but customRulesData is NOT set. This is an invalid configuration. Use updateWithCustomRules: to add custom rules.");
        v27 = (void *)MEMORY[0x1E0C99D80];
        v28 = &v45;
        v29 = &v44;
LABEL_25:
        objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v32;
LABEL_26:

        LOBYTE(v14) = 0;
        v12 = (id)v33;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      if (v23 == 2 || !v14)
        goto LABEL_28;
      -[PHLibraryScopeChangeRequest rulesData](self, "rulesData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v43 = CFSTR("AutoSharePolicy NOT set to CustomRuleShare but customRulesData is set. This is an invalid configuration. Use updateWithCustomRules: to remove all rules.");
        v27 = (void *)MEMORY[0x1E0C99D80];
        v28 = &v43;
        v29 = &v42;
        goto LABEL_25;
      }
    }
    LOBYTE(v14) = 1;
    goto LABEL_28;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("previewState")))
    goto LABEL_30;
  v35 = v8;
  v36 = objc_msgSend(v35, "status") == 2 && objc_msgSend(v35, "localPublishState") == 2;
  v37 = objc_msgSend(v35, "status") == 1 && objc_msgSend(v35, "localPublishState") == 0;
  if (v14 && !v36 && !v37)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Unable to set previewState on a LibraryScope that's not in pending intiviation state.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v22);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
LABEL_29:

LABEL_30:
  if (a5 && !v14)
    *a5 = objc_retainAutorelease(v12);

  return v14;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void (**v25)(void *, void *);
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t n;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t ii;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void **v127;
  uint64_t *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void **v140;
  uint64_t *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void **v147;
  uint64_t *v148;
  void *v149;
  void *v150;
  char v151;
  id v152;
  id v154;
  void (**v155)(void *, void *);
  void (**v156)(void *, void *);
  void *v157;
  void *v158;
  id *v159;
  PHLibraryScopeChangeRequest *v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD aBlock[4];
  id v191;
  id v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  _BYTE v197[128];
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  _BYTE v202[128];
  uint64_t v203;
  void *v204;
  _BYTE v205[128];
  uint64_t v206;
  void *v207;
  _BYTE v208[128];
  uint64_t v209;
  void *v210;
  _BYTE v211[128];
  uint64_t v212;
  void *v213;
  _BYTE v214[128];
  uint64_t v215;
  void *v216;
  _BYTE v217[128];
  uint64_t v218;
  _QWORD v219[4];

  v219[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = 0;
  v11 = objc_msgSend(v10, "applyMutationsToManagedObject:error:", v8, &v192);
  v12 = v192;

  if (v11)
  {
    -[PHLibraryScopeChangeRequest participantsAddedToLibraryScope](self, "participantsAddedToLibraryScope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {

    }
    else
    {
      -[PHLibraryScopeChangeRequest participantsRemovedFromLibraryScope](self, "participantsRemovedFromLibraryScope");
      v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      v12 = v14;
      if (!v16)
        goto LABEL_6;
    }
    v17 = (void *)MEMORY[0x1E0D71808];
    -[PHLibraryScopeChangeRequest participantsAddedToLibraryScope](self, "participantsAddedToLibraryScope");
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "informRapportToAddShareParticipantUUIDs:photoLibrary:", v19, v9);

    v20 = (void *)MEMORY[0x1E0D71808];
    -[PHLibraryScopeChangeRequest participantsRemovedFromLibraryScope](self, "participantsRemovedFromLibraryScope");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:", v21, v22);

    v12 = v18;
  }
LABEL_6:
  v23 = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PHLibraryScopeChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
  aBlock[3] = &unk_1E35DB940;
  v24 = v9;
  v191 = v24;
  v25 = (void (**)(void *, void *))_Block_copy(aBlock);
  v160 = self;
  if (!v11)
  {
    v41 = 0;
    goto LABEL_109;
  }
  -[PHLibraryScopeChangeRequest assetUUIDsManuallyAddedToLibraryScope](self, "assetUUIDsManuallyAddedToLibraryScope");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  v159 = a5;
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0D71880];
    -[PHLibraryScopeChangeRequest assetUUIDsManuallyAddedToLibraryScope](self, "assetUUIDsManuallyAddedToLibraryScope");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "assetsWithUUIDs:options:inLibrary:", v29, 1, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "currentUserParticipant");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v218 = *MEMORY[0x1E0CB2D50];
      v219[0] = CFSTR("Attemping to move assets to a LibraryScope that doesn't have a current user participant. This is an invalid action.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v219, &v218, 1);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 8506, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    }
    v33 = (void *)v32;
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v34 = v31;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v186, v217, 16);
    if (v35)
    {
      v36 = v35;
      v155 = v25;
      v157 = v12;
      v37 = *(_QWORD *)v187;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v187 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
          if ((objc_msgSend(v39, "canPerformEditOperation:", 32) & 1) == 0)
          {
            v42 = (void *)MEMORY[0x1E0CB35C8];
            v215 = *MEMORY[0x1E0CB2D50];
            v43 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v39, "uuid");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("Attemping to move asset %@ that cannot be moved to shared library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToSharedLibrary] first"), v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v46);
            v47 = objc_claimAutoreleasedReturnValue();

            v11 = 0;
            v12 = (id)v47;
            goto LABEL_20;
          }
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setLibraryScope:withContributors:", v23, v40);

          objc_msgSend(v39, "libraryScopeShareState");
          PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
          PLLibraryScopeAssetResetValues();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetUserManuallyAddedState();
          objc_msgSend(v23, "libraryScopeIsActive");
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v186, v217, 16);
        if (v36)
          continue;
        break;
      }
      v12 = v157;
LABEL_20:
      v25 = v155;
    }
    else
    {
      v11 = 1;
    }

    self = v160;
    if (!v11)
    {
      v41 = 0;
      goto LABEL_108;
    }
    a5 = v159;
  }
  -[PHLibraryScopeChangeRequest assetUUIDsManuallyRemovedFromLibraryScope](self, "assetUUIDsManuallyRemovedFromLibraryScope");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "count");

  v156 = v25;
  v158 = v12;
  if (v52)
  {
    v53 = (void *)MEMORY[0x1E0D71880];
    -[PHLibraryScopeChangeRequest assetUUIDsManuallyRemovedFromLibraryScope](self, "assetUUIDsManuallyRemovedFromLibraryScope");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v24;
    objc_msgSend(v53, "assetsWithUUIDs:options:inLibrary:", v54, 1, v24);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v49 = v56;
    v57 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v182, v214, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v183;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v183 != v59)
            objc_enumerationMutation(v49);
          v61 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * j);
          if (!objc_msgSend(v61, "canPerformEditOperation:", 64))
          {
            v117 = (void *)MEMORY[0x1E0CB35C8];
            v212 = *MEMORY[0x1E0CB2D50];
            v118 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v61, "uuid");
            v119 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "stringWithFormat:", CFSTR("Attemping to move asset %@ that cannot be moved to personal library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToPersonalLibrary] first"), v119);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v213 = v120;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v121);
            v50 = objc_claimAutoreleasedReturnValue();

            v12 = (id)v119;
            v31 = v49;
            v24 = v154;
            goto LABEL_105;
          }
          objc_msgSend(v61, "removeLibraryScopeAndContributors");
          objc_msgSend(v61, "libraryScopeShareState");
          PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue();
          PLLibraryScopeAssetResetValues();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetUserManuallyRejectedState();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        v58 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v182, v214, 16);
      }
      while (v58);
    }

    v25 = v156;
    v12 = v158;
    v24 = v154;
  }
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedAddedToLibraryScope](self, "assetUUIDsPhotosSuggestedAddedToLibraryScope");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63)
  {
    v64 = (void *)MEMORY[0x1E0D71880];
    -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedAddedToLibraryScope](self, "assetUUIDsPhotosSuggestedAddedToLibraryScope");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "assetsWithUUIDs:options:inLibrary:", v65, 1, v24);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v49 = v67;
    v68 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v178, v211, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v179;
      do
      {
        for (k = 0; k != v69; ++k)
        {
          if (*(_QWORD *)v179 != v70)
            objc_enumerationMutation(v49);
          v72 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * k);
          if (!objc_msgSend(v72, "canPerformEditOperation:", 32))
          {
            v122 = (void *)MEMORY[0x1E0CB35C8];
            v209 = *MEMORY[0x1E0CB2D50];
            v123 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v72, "uuid");
            v124 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "stringWithFormat:", CFSTR("Attemping to move asset %@ that cannot be moved to shared library. Check with -[PHAsset canPerformEditOperation:PHAssetEditOperationMoveToSharedLibrary] first"), v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v210 = v125;
            v126 = (void *)MEMORY[0x1E0C99D80];
            v127 = &v210;
            v128 = &v209;
            goto LABEL_94;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        v69 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v178, v211, 16);
      }
      while (v69);
    }

    v25 = v156;
    v12 = v158;
  }
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedRemovedFromLibraryScope](self, "assetUUIDsPhotosSuggestedRemovedFromLibraryScope");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "count");

  if (v74)
  {
    v75 = (void *)MEMORY[0x1E0D71880];
    -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedRemovedFromLibraryScope](self, "assetUUIDsPhotosSuggestedRemovedFromLibraryScope");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "assetsWithUUIDs:options:inLibrary:", v76, 1, v24);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v49 = v78;
    v79 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v174, v208, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v175;
      do
      {
        for (m = 0; m != v80; ++m)
        {
          if (*(_QWORD *)v175 != v81)
            objc_enumerationMutation(v49);
          v83 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * m);
          objc_msgSend(v83, "libraryScopeShareState");
          if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
          {
            v129 = (void *)MEMORY[0x1E0CB35C8];
            v206 = *MEMORY[0x1E0CB2D50];
            v130 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v83, "uuid");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "stringWithFormat:", CFSTR("Attemping to remove an asset %@ that is not in a suggested state"), v12);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v207 = v131;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v132);
            v50 = objc_claimAutoreleasedReturnValue();

            goto LABEL_104;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
        }
        v80 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v174, v208, 16);
      }
      while (v80);
    }

    v25 = v156;
    v12 = v158;
  }
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedRejectedFromLibraryScope](self, "assetUUIDsPhotosSuggestedRejectedFromLibraryScope");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "count");

  if (!v85)
    goto LABEL_65;
  v86 = (void *)MEMORY[0x1E0D71880];
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedRejectedFromLibraryScope](self, "assetUUIDsPhotosSuggestedRejectedFromLibraryScope");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "assetsWithUUIDs:options:inLibrary:", v87, 1, v24);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2](v25, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v49 = v89;
  v90 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v170, v205, 16);
  if (!v90)
    goto LABEL_64;
  v91 = v90;
  v92 = *(_QWORD *)v171;
  do
  {
    for (n = 0; n != v91; ++n)
    {
      if (*(_QWORD *)v171 != v92)
        objc_enumerationMutation(v49);
      v94 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * n);
      objc_msgSend(v94, "libraryScopeShareState");
      if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
      {
        v122 = (void *)MEMORY[0x1E0CB35C8];
        v203 = *MEMORY[0x1E0CB2D50];
        v133 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v94, "uuid");
        v124 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "stringWithFormat:", CFSTR("Attemping to reject an asset %@ that is not in a suggested state"), v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = v125;
        v126 = (void *)MEMORY[0x1E0C99D80];
        v127 = &v204;
        v128 = &v203;
LABEL_94:
        objc_msgSend(v126, "dictionaryWithObjects:forKeys:count:", v127, v128, 1);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v134);
        v50 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v124;
LABEL_104:
        v31 = v49;
LABEL_105:
        v25 = v156;
LABEL_106:

        v41 = 0;
        v12 = (id)v50;
        goto LABEL_107;
      }
      PLLibraryScopeAssetSetUserManuallyRejectedState();
      PLLibraryScopeAssetSetAddToSharedZoneState();
    }
    v91 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v170, v205, 16);
  }
  while (v91);
LABEL_64:

  v25 = v156;
  v12 = v158;
LABEL_65:
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope](self, "assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "count");

  if (!v96)
    goto LABEL_76;
  v97 = (void *)MEMORY[0x1E0D71880];
  -[PHLibraryScopeChangeRequest assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope](self, "assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "assetsWithUUIDs:options:inLibrary:", v98, 1, v24);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2](v25, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v49 = v100;
  v101 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
  if (!v101)
    goto LABEL_75;
  v102 = v101;
  v103 = *(_QWORD *)v167;
  while (2)
  {
    v104 = 0;
    while (2)
    {
      if (*(_QWORD *)v167 != v103)
        objc_enumerationMutation(v49);
      v105 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v104);
      objc_msgSend(v105, "libraryScopeShareState");
      if ((PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue() & 1) == 0)
      {
        v135 = (void *)MEMORY[0x1E0CB35C8];
        v200 = *MEMORY[0x1E0CB2D50];
        v136 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v105, "uuid");
        v137 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "stringWithFormat:", CFSTR("Attemping to unreject an asset %@ that is not in a manually rejected state"), v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v201 = v138;
        v139 = (void *)MEMORY[0x1E0C99D80];
        v140 = &v201;
        v141 = &v200;
        goto LABEL_98;
      }
      if (PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue() == -1)
      {
        v135 = (void *)MEMORY[0x1E0CB35C8];
        v198 = *MEMORY[0x1E0CB2D50];
        v142 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v105, "uuid");
        v137 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "stringWithFormat:", CFSTR("Attemping to unreject an asset %@ that does not have a suggested bit set"), v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = v138;
        v139 = (void *)MEMORY[0x1E0C99D80];
        v140 = &v199;
        v141 = &v198;
LABEL_98:
        objc_msgSend(v139, "dictionaryWithObjects:forKeys:count:", v140, v141, 1);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v143);
        v50 = objc_claimAutoreleasedReturnValue();

LABEL_103:
        v12 = (id)v137;
        goto LABEL_104;
      }
      PLLibraryScopeAssetSetAddToSharedZoneState();
      PLLibraryScopeAssetSetUserManuallyRejectedState();
      if (v102 != ++v104)
        continue;
      break;
    }
    v102 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
    a5 = v159;
    if (v102)
      continue;
    break;
  }
LABEL_75:

  v25 = v156;
  v12 = v158;
LABEL_76:
  -[PHLibraryScopeChangeRequest assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope](self, "assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "count");

  if (v107)
  {
    v108 = (void *)MEMORY[0x1E0D71880];
    -[PHLibraryScopeChangeRequest assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope](self, "assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 1;
    objc_msgSend(v108, "assetsWithUUIDs:options:inLibrary:", v109, 1, v24);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v49 = v111;
    v112 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v163;
      v12 = v158;
      while (2)
      {
        for (ii = 0; ii != v113; ++ii)
        {
          if (*(_QWORD *)v163 != v114)
            objc_enumerationMutation(v49);
          v116 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * ii);
          objc_msgSend(v116, "libraryScopeShareState");
          if ((PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue() & 1) != 0
            || PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue())
          {
            v144 = (void *)MEMORY[0x1E0CB35C8];
            v195 = *MEMORY[0x1E0CB2D50];
            v145 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v116, "uuid");
            v137 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "stringWithFormat:", CFSTR("Attemping to PhotosSuggester reject an asset %@ that is already in a rejected state"), v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v196 = v138;
            v146 = (void *)MEMORY[0x1E0C99D80];
            v147 = &v196;
            v148 = &v195;
LABEL_102:
            objc_msgSend(v146, "dictionaryWithObjects:forKeys:count:", v147, v148, 1);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v143);
            v50 = objc_claimAutoreleasedReturnValue();

            goto LABEL_103;
          }
          if ((PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue() & 1) != 0
            || objc_msgSend(v116, "hasLibraryScope"))
          {
            v144 = (void *)MEMORY[0x1E0CB35C8];
            v193 = *MEMORY[0x1E0CB2D50];
            v149 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v116, "uuid");
            v137 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "stringWithFormat:", CFSTR("Attemping to PhotosSuggester reject an asset %@ that is already added to shared zone"), v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = v138;
            v146 = (void *)MEMORY[0x1E0C99D80];
            v147 = &v194;
            v148 = &v193;
            goto LABEL_102;
          }
          PLLibraryScopeAssetRemoveSuggestedByClientType();
          PLLibraryScopeAssetSetAddToSharedZoneState();
          PLLibraryScopeAssetSetUserManuallyRejectedState();
          PLLibraryScopeAssetSetPhotosSuggesterRejectedState();
        }
        v113 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
        v41 = 1;
        if (v113)
          continue;
        break;
      }
      v31 = v49;
      v25 = v156;
    }
    else
    {
      v31 = v49;
      v12 = v158;
    }
LABEL_107:

LABEL_108:
    a5 = v159;
  }
  else
  {
    v41 = 1;
  }
LABEL_109:

  if (v41)
  {
    -[PHLibraryScopeChangeRequest participantsHelper](v160, "participantsHelper");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v12;
    v151 = objc_msgSend(v150, "applyMutationsToManagedObject:error:", v23, &v161);
    v152 = v161;

    v12 = v152;
    if (!a5)
      goto LABEL_115;
LABEL_113:
    if ((v151 & 1) == 0)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v151 = 0;
    if (a5)
      goto LABEL_113;
  }
LABEL_115:

  return v151;
}

- (PHShareRelationshipChangeRequestHelper)participantsHelper
{
  return self->_participantsHelper;
}

- (PHLibraryScope)originalLibraryScope
{
  return (PHLibraryScope *)objc_loadWeakRetained((id *)&self->_originalLibraryScope);
}

- (void)setOriginalLibraryScope:(id)a3
{
  objc_storeWeak((id *)&self->_originalLibraryScope, a3);
}

- (BOOL)runningAsUnitTest
{
  return self->_runningAsUnitTest;
}

- (void)setRunningAsUnitTest:(BOOL)a3
{
  self->_runningAsUnitTest = a3;
}

- (NSArray)assetUUIDsManuallyAddedToLibraryScope
{
  return self->_assetUUIDsManuallyAddedToLibraryScope;
}

- (void)setAssetUUIDsManuallyAddedToLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsManuallyAddedToLibraryScope, a3);
}

- (NSArray)assetUUIDsManuallyRemovedFromLibraryScope
{
  return self->_assetUUIDsManuallyRemovedFromLibraryScope;
}

- (void)setAssetUUIDsManuallyRemovedFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsManuallyRemovedFromLibraryScope, a3);
}

- (NSArray)assetUUIDsPhotosSuggestedAddedToLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedAddedToLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedAddedToLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedAddedToLibraryScope, a3);
}

- (NSArray)assetUUIDsPhotosSuggestedRemovedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedRemovedFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope, a3);
}

- (NSArray)assetUUIDsPhotosSuggestedRejectedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedRejectedFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope, a3);
}

- (NSArray)assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope
{
  return self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope;
}

- (void)setAssetUUIDsPhotosSuggestedUnRejectedFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope, a3);
}

- (NSArray)assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope
{
  return self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope;
}

- (void)setAssetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope, a3);
}

- (NSArray)participantsAddedToLibraryScope
{
  return self->_participantsAddedToLibraryScope;
}

- (void)setParticipantsAddedToLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_participantsAddedToLibraryScope, a3);
}

- (NSArray)participantsRemovedFromLibraryScope
{
  return self->_participantsRemovedFromLibraryScope;
}

- (void)setParticipantsRemovedFromLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_participantsRemovedFromLibraryScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_participantsAddedToLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsAssetsMarkedRejectedByPhotosSuggesterFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedUnRejectedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRejectedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsPhotosSuggestedAddedToLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsManuallyRemovedFromLibraryScope, 0);
  objc_storeStrong((id *)&self->_assetUUIDsManuallyAddedToLibraryScope, 0);
  objc_destroyWeak((id *)&self->_originalLibraryScope);
  objc_storeStrong((id *)&self->_participantsHelper, 0);
}

id __80__PHLibraryScopeChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v17);
        if (objc_msgSend(v10, "isPartOfBurst"))
        {
          v11 = (void *)MEMORY[0x1E0D715B8];
          objc_msgSend(v10, "avalancheUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "assetsWithAvalancheUUID:inManagedObjectContext:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObjectsFromArray:", v14);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __68__PHLibraryScopeChangeRequest_validateInsertIntoPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D71808];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "status", (_QWORD)v17) == 1
          || objc_msgSend(v11, "status") == 3)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          v12 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0CB2D50];
          v22 = CFSTR("Unable to insert a new LibraryScope as a owned or accepted LibraryScope already exists");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v13);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

uint64_t __53__PHLibraryScopeChangeRequest_updateWithCustomRules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "plRepresentation");
}

+ (id)changeRequestForLibraryScope:(id)a3
{
  id v3;
  PHLibraryScopeChangeRequest *v4;
  void *v5;
  void *v6;
  PHLibraryScopeChangeRequest *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHLibraryScopeChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHLibraryScopeChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHLibraryScopeChangeRequest setOriginalLibraryScope:](v7, "setOriginalLibraryScope:", v3);
    -[PHLibraryScopeChangeRequest participantsHelper](v7, "participantsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOriginalShare:", v3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)creationRequestForOwnedLibraryScopeInPreviewStateWithTitle:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[PHLibraryScopeChangeRequest initForNewObject]([PHLibraryScopeChangeRequest alloc], "initForNewObject");
  objc_msgSend(v4, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreationDate:", v5);

  objc_msgSend(v4, "setPreviewState:", 1);
  return v4;
}

+ (void)trashLibraryScopes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1E0C99DA0];
          v18 = *MEMORY[0x1E0C99778];
          v19 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type PHLibraryScope"), v10, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v21, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v22);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        +[PHObjectDeleteRequest deleteRequestForObject:](PHLibraryScopeDeleteRequest, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOperation:", 0);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

+ (void)untrashLibraryScopes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1E0C99DA0];
          v18 = *MEMORY[0x1E0C99778];
          v19 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type PHLibraryScope"), v10, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v21, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v22);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        +[PHObjectDeleteRequest deleteRequestForObject:](PHLibraryScopeDeleteRequest, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOperation:", 1);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

+ (void)expungeLibraryScopes:(id)a3
{
  objc_msgSend(a1, "_expungeLibraryScopes:ignorePhotosctlExpungeOverride:", a3, 0);
}

+ (void)_expungeLibraryScopes:(id)a3 ignorePhotosctlExpungeOverride:(BOOL)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1E0C99DA0];
          v20 = *MEMORY[0x1E0C99778];
          v21 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type PHLibraryScope"), v12, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v23, 0);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v24);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        +[PHObjectDeleteRequest deleteRequestForObject:](PHLibraryScopeDeleteRequest, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setOperation:", 2);
        if (PLIsInternalTool() && !a4)
          objc_msgSend(v18, "setPhotosctlExpungeOverride:", 1);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

}

@end
